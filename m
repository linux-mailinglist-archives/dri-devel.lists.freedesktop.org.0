Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A925348CA1
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 10:19:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C27456ECE3;
	Thu, 25 Mar 2021 09:19:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F73C6ECE3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 09:19:03 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 m21-20020a9d7ad50000b02901b83efc84a0so1275922otn.10
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 02:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s8gaLzfKO51sv2EAdyYwOBAav4JswI+vzWWUFTJdNYY=;
 b=ZkxfOIKsj2q9i0xgCpJIWPTGgfJnpexFD69S2YCMtm7qz9+Vz3iFYeeL/zq8cW43eJ
 ZxJ0JznpvlRjP0MCLr3dVA6OrS5dUJtNyIVuvegpRL22m1fimwU5A2IkRinyZfD/MOg9
 pdBoeBEUs7bsM2BitRB3evCfcTP2TuuWcIMoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s8gaLzfKO51sv2EAdyYwOBAav4JswI+vzWWUFTJdNYY=;
 b=i4uEQcLRIEy2koXoi+lAOAg1MDNIkGLQhhTdJfAnbivBmqVDdAKURQAJtE/YW0qfq5
 TyP3lGJFugZPgMxbkZ/6Rsk2SbmssLVYG3Zbnop8OhaeMYAIktbKt0Ny2f86Lyd3qOAa
 mvl70CIsA88N89ZJwFYcWSLSFXb2T+BQeiIDs5FzDYhXrEK0Yg1s8x/KqhA9iPPn4751
 soSFHL0jagl24/TC4Rw4r0Q6nap4SkJSSIZZUjCba1b67N4ipiDKLCr1yOKVywGESfsi
 StxkUm/vVm6TsHBXSaib9Me6NNYnx62MRq0CLOwh8tzsufJqBsFjOpS0fJyIiEr1Cc/M
 nOQA==
X-Gm-Message-State: AOAM533POC/YwcpW+paVDUIr+kZVbPI7H4lta8tmYEtDUq74Bj5kurO5
 pQ5wmSs3GH7YLsGh9O79AIQ4VIH46bi8mPG8Y0axpQ==
X-Google-Smtp-Source: ABdhPJwuRBoHhQ1X/QBIV1XedaouhUZsXyPMY5vgD/AZosvW57FTBULFoCWN1cliFURZtu4WwmxByGgjBHWXJVPUY/M=
X-Received: by 2002:a9d:845:: with SMTP id 63mr4608787oty.303.1616663942428;
 Thu, 25 Mar 2021 02:19:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210325061901.851273-1-wanjiabing@vivo.com>
 <e45d6b24-5e74-17f6-eb18-c6e51fed923a@epam.com>
 <CAKMK7uEpNexmDYar36ZEX0hbHoxH3Y+_D42NqjRwAqxpiCXHRA@mail.gmail.com>
In-Reply-To: <CAKMK7uEpNexmDYar36ZEX0hbHoxH3Y+_D42NqjRwAqxpiCXHRA@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 25 Mar 2021 10:18:51 +0100
Message-ID: <CAKMK7uGsjv5S8eKGwmM1ErQPnx+UdxgF5c8YXewEDEyMakpEig@mail.gmail.com>
Subject: Re: [PATCH] drivers: gpu: drm: xen_drm_front_drm_info is declared
 twice
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Wan Jiabing <wanjiabing@vivo.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "kael_w@yeah.net" <kael_w@yeah.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 25, 2021 at 10:16 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, Mar 25, 2021 at 7:53 AM Oleksandr Andrushchenko
> <Oleksandr_Andrushchenko@epam.com> wrote:
> >
> > Hi,
> >
> > On 3/25/21 8:19 AM, Wan Jiabing wrote:
> > > struct xen_drm_front_drm_info has been declared.
> > > Remove the duplicate.
> > >
> > > Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> >
> > Thank you for the patch,
> >
> > Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >
> > Will apply to drm-misc-next-fixes
>
> drm-misc-next-fixes is the wrong tree, bugfixes outside of the merge
> window belong into drm-misc-fixes. Please consult
>
> https://drm.pages.freedesktop.org/maintainer-tools/committer-drm-misc.html#where-do-i-apply-my-patch
>
> We need to hard-reset drm-misc-next-fixes back, please re-apply the
> patches (both of them) to drm-misc-fixes. Also adding drm-misc
> maintainers.

Also simple cleanup like this should be pushed to drm-misc-next, not
any of the -fixes branches.
-Daniel

> -Daniel
>
> >
> > Thank you,
> >
> > Oleksandr
> >
> > > ---
> > >   drivers/gpu/drm/xen/xen_drm_front_conn.h | 1 -
> > >   1 file changed, 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/xen/xen_drm_front_conn.h b/drivers/gpu/drm/xen/xen_drm_front_conn.h
> > > index 3adacba9a23b..e5f4314899ee 100644
> > > --- a/drivers/gpu/drm/xen/xen_drm_front_conn.h
> > > +++ b/drivers/gpu/drm/xen/xen_drm_front_conn.h
> > > @@ -16,7 +16,6 @@
> > >   struct drm_connector;
> > >   struct xen_drm_front_drm_info;
> > >
> > > -struct xen_drm_front_drm_info;
> > >
> > >   int xen_drm_front_conn_init(struct xen_drm_front_drm_info *drm_info,
> > >                           struct drm_connector *connector);
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
