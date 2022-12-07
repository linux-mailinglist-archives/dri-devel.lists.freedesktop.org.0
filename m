Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA40A645CDC
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 15:46:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1EF10E196;
	Wed,  7 Dec 2022 14:46:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 514DD10E05D;
 Wed,  7 Dec 2022 14:46:14 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 p10-20020a9d76ca000000b0066d6c6bce58so11388922otl.7; 
 Wed, 07 Dec 2022 06:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pCx/E76TgK/9YaFBrP8sS3CTQZp59lVD/AHPvEf9LTo=;
 b=hOvi/ppN1s+rwt2vnOeSAFAGsHGLoFSY+ASbI5Kqs5egtVEYsq6csNx2XV/4S5iF+e
 LhY77bBtB03M2NPj9vnMcXYE5vqSO3XcNMEkKbWUfWXJoH0P3IJyjOD2DjcwlbhHgyji
 4aVxsbHjchRcrFRfDIfkk2tP5C5GoJjm1Kzfd+qdBPdUeR50a0VvjRTP6HxW5EqhiiGU
 GiaWEgNA6T/06KhkSClbVg0ZmMbvTc86ID8d5V81EQ1BqgzW4M781QxRxpXlfLzE1tWh
 bOl8+0Ige7/i+uYkhfCiXxpzeKNOIQujl6pXDGctLZsiu6lYUrMR7phFydDsWpx4mW4h
 4e+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pCx/E76TgK/9YaFBrP8sS3CTQZp59lVD/AHPvEf9LTo=;
 b=jyFW5j/IBjHVecNbMVTzWM05wDRyUUilDA4mY/eiTQaFcq/MOni7U+nSsS4HOaTNUt
 NdDWY72V40Y3j20ywb7++mf7RjUygQQq1nUA4l8RRqzLdwadvicCIWhmZJgAJdJ36YKZ
 426oF+nAgNwYRDhrDoE3Rms+BcZ3OAGufTbTDgUa1ZM7EDB9tJeo9FIk9+weW0YLb4Db
 xHsW4t3QkoKz1wA9BZ7kKQQbCF6UxA4AdJeVzCdyPEP4QkympM8Szzn1nUybc8HqlhwO
 IN/WKQVxkMt7kxPYRNu3UvYXoA/X6hnk8aIC7vtP6NaFtwMoxS5lX8KYgex/vNPghzQ+
 im9Q==
X-Gm-Message-State: ANoB5pkAR5R5yFDOiR8s4sToDdv2PszFeqFKuXEASRBxxD5a+Gz8+r95
 FmeDa3z6SWOJNdY2Rz02yKlwgJDpO2iEPFa2V20=
X-Google-Smtp-Source: AA0mqf4eof0tNHTw1xsmbn9ySQtKoofw7nwky/Tb+KzP9HTjiiwLw4FWjzKNXXQaSmGg3mwLh5PElZz2fFxLxErXwg0=
X-Received: by 2002:a9d:75d5:0:b0:667:7361:7db5 with SMTP id
 c21-20020a9d75d5000000b0066773617db5mr38441176otl.22.1670424373348; Wed, 07
 Dec 2022 06:46:13 -0800 (PST)
MIME-Version: 1.0
References: <20221206192123.661448-1-robdclark@gmail.com>
 <d3433e207ff8ea243ff1d4cceeea19e4676c97c5.camel@pengutronix.de>
In-Reply-To: <d3433e207ff8ea243ff1d4cceeea19e4676c97c5.camel@pengutronix.de>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 7 Dec 2022 06:46:08 -0800
Message-ID: <CAF6AEGtO8hjJocOccsxwWmtLFUfMH7e1EMm-2xLKa2zSr0JCKQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Add MSM_SUBMIT_BO_NO_IMPLICIT
To: Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 7, 2022 at 2:15 AM Lucas Stach <l.stach@pengutronix.de> wrote:
>
> Hi Rob,
>
> Am Dienstag, dem 06.12.2022 um 11:21 -0800 schrieb Rob Clark:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > In cases where implicit sync is used, it is still useful (for things
> > like sub-allocation, etc) to allow userspace to opt-out of implicit
> > sync on per-BO basis.
> >
> Out of curiosity and because I have been thinking about something like
> that for etnaviv for while: do you only use this for immutable buffers
> or do you have some kind of userspace fencing in place for the
> suballocated buffers?

yup, userspace fences.. which is a thing you'd really want for doing
suballocation

BR,
-R

>
> Regards,
> Lucas
>
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/msm_drv.c        |  3 ++-
> >  drivers/gpu/drm/msm/msm_gem_submit.c | 11 +++++++++++
> >  include/uapi/drm/msm_drm.h           |  4 +++-
> >  3 files changed, 16 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > index 017a512982a2..e0e1199a822f 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -45,9 +45,10 @@
> >   * - 1.7.0 - Add MSM_PARAM_SUSPENDS to access suspend count
> >   * - 1.8.0 - Add MSM_BO_CACHED_COHERENT for supported GPUs (a6xx)
> >   * - 1.9.0 - Add MSM_SUBMIT_FENCE_SN_IN
> > + * - 1.10.0 - Add MSM_SUBMIT_BO_NO_IMPLICIT
> >   */
> >  #define MSM_VERSION_MAJOR    1
> > -#define MSM_VERSION_MINOR    9
> > +#define MSM_VERSION_MINOR    10
> >  #define MSM_VERSION_PATCHLEVEL       0
> >
> >  static const struct drm_mode_config_funcs mode_config_funcs = {
> > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> > index eb3536e3d66a..8bad07a04f85 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > @@ -334,9 +334,20 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> >               if (ret)
> >                       return ret;
> >
> > +             /* If userspace has determined that explicit fencing is
> > +              * used, it can disable implicit sync on the entire
> > +              * submit:
> > +              */
> >               if (no_implicit)
> >                       continue;
> >
> > +             /* Otherwise userspace can ask for implicit sync to be
> > +              * disabled on specific buffers.  This is useful for internal
> > +              * usermode driver managed buffers, suballocation, etc.
> > +              */
> > +             if (submit->bos[i].flags & MSM_SUBMIT_BO_NO_IMPLICIT)
> > +                     continue;
> > +
> >               ret = drm_sched_job_add_implicit_dependencies(&submit->base,
> >                                                             obj,
> >                                                             write);
> > diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> > index f54b48ef6a2d..329100016e7c 100644
> > --- a/include/uapi/drm/msm_drm.h
> > +++ b/include/uapi/drm/msm_drm.h
> > @@ -222,10 +222,12 @@ struct drm_msm_gem_submit_cmd {
> >  #define MSM_SUBMIT_BO_READ             0x0001
> >  #define MSM_SUBMIT_BO_WRITE            0x0002
> >  #define MSM_SUBMIT_BO_DUMP             0x0004
> > +#define MSM_SUBMIT_BO_NO_IMPLICIT      0x0008
> >
> >  #define MSM_SUBMIT_BO_FLAGS            (MSM_SUBMIT_BO_READ | \
> >                                       MSM_SUBMIT_BO_WRITE | \
> > -                                     MSM_SUBMIT_BO_DUMP)
> > +                                     MSM_SUBMIT_BO_DUMP | \
> > +                                     MSM_SUBMIT_BO_NO_IMPLICIT)
> >
> >  struct drm_msm_gem_submit_bo {
> >       __u32 flags;          /* in, mask of MSM_SUBMIT_BO_x */
>
>
