Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E0D6166BF
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 16:59:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D3B10E4D5;
	Wed,  2 Nov 2022 15:59:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07EE710E4D5;
 Wed,  2 Nov 2022 15:59:51 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id l9so11995544qkk.11;
 Wed, 02 Nov 2022 08:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F/1grPaD+xMIby1Txd3zoCjkj1cuL2trjeEvsrdeQYk=;
 b=pE+d2BMuxQjQYzxQqj4PXTA8MdpkV/KJe2dAN8yPM0xASyxTbxq9if/GzGXIwkEnkm
 Zhq28XdD6jQ/2Ix6oTGL+2kJW+/C9S8DXs0WmmtbOwWoF4Fc/9Q2VlLDHMjAYS0aBhOI
 8QrjLRVd9u5A9F0OF6DkrHbdoqLDQQzShm7+B0hYX/wvOUoGswqKQt4l7RXX+gEwCpu9
 h9Mtj97CQnB26geCAwTJr+LTcXYOQCqOISPZNaTmK3RCJKbGO2QgW9zjwgAQFBxAA2WW
 Urz83q4xaNSKPMWBsS15Pju/tNWJnjU7O7ktboSF+MB3PDFm7tZw69e7zYLw8VeOiXJD
 CT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F/1grPaD+xMIby1Txd3zoCjkj1cuL2trjeEvsrdeQYk=;
 b=URfWVJQincuOE3xbFf1fFUfdnjrp6UDiJ8PBAl69nLwbhjpt5Tewh64/SzsZntl4wh
 d0V92VnMrvwDn4cYViazsTsYLrm7i02mlVcb1HVgbbPA+zP96iBBPAUUfy/reoLlSwv8
 3cGeNPXmAJjuiSVpO99DlwczZGSNB9z/vuHz1Qwe3Fghc59y4C3Rz3KH6i6p9Vy1jxNp
 myUYEVIwbQ8uWm71LtUJdIemYnsr7M9ukZs06CEXTJ4eJCWlxpArKPSGJjGay2rGWM6q
 W/1NBltlXYVH+JXGSL2XjX/JpwCwWvWPQJrxdfQRqdiEN1YGgqwXyZ0HKQoFH1SYV4g+
 fqyQ==
X-Gm-Message-State: ACrzQf3F6stXF3VWZDePyfx/kFt7oFocoBGXDoLMTUJH/M2Pxigpregt
 HADfqd0jOtCNc3TZW++WIcNWfZPMbmnluXpOqeLqxjV7
X-Google-Smtp-Source: AMsMyM4hLVYbFgPOuL0CR9Bpu/6eSDfsMz83d21/2tJDZhIHfJzJSngYiCH/QQcArG+V4Qg/WyZljtSopOCAqV2gAII=
X-Received: by 2002:a05:620a:254e:b0:6c7:855c:6eb with SMTP id
 s14-20020a05620a254e00b006c7855c06ebmr18731720qko.39.1667404790104; Wed, 02
 Nov 2022 08:59:50 -0700 (PDT)
MIME-Version: 1.0
References: <20221101214051.159988-1-robdclark@gmail.com>
 <044540cc-1d8b-45da-ac8b-ecc133b45dc1@amd.com>
In-Reply-To: <044540cc-1d8b-45da-ac8b-ecc133b45dc1@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 2 Nov 2022 09:00:06 -0700
Message-ID: <CAF6AEGvFxU10Uu+eBRm0ChyVDPg3DMNoeHd4zCWHWwRzRBvP3Q@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Remove exclusive-fence hack
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <sean@poorly.run>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 2, 2022 at 3:46 AM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
> Am 01.11.22 um 22:40 schrieb Rob Clark:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > The workaround was initially necessary due to dma_resv having only a
> > single exclusive fence slot, yet whe don't necessarily know what order
> > the gpu scheduler will schedule jobs.  Unfortunately this workaround
> > also has the result of forcing implicit sync, even when userspace does
> > not want it.
> >
> > However, since commit 047a1b877ed4 ("dma-buf & drm/amdgpu: remove
> > dma_resv workaround") the workaround is no longer needed.  So remove
> > it.  This effectively reverts commit f1b3f696a084 ("drm/msm: Don't
> > break exclusive fence ordering")
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
>
> Oh, yes please. I had that on my todo list for after the initial patch
> had landed, but couldn't find the time to look into it once more.
>
> There was another case with one of the other ARM drivers which could be
> cleaned up now, but I can't find it any more of hand.
>
> Anyway this patch here is Acked-by: Christian K=C3=B6nig
> <christian.koenig@amd.com>.

Thanks.. I had a quick look for the other driver but couldn't spot
anything, so perhaps it has already been fixed?

BR,
-R

>
> Regards,
> Christian.
>
> > ---
> >   drivers/gpu/drm/msm/msm_gem_submit.c | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm=
/msm_gem_submit.c
> > index 5599d93ec0d2..cc48f73adadf 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > @@ -334,8 +334,7 @@ static int submit_fence_sync(struct msm_gem_submit =
*submit, bool no_implicit)
> >               if (ret)
> >                       return ret;
> >
> > -             /* exclusive fences must be ordered */
> > -             if (no_implicit && !write)
> > +             if (no_implicit)
> >                       continue;
> >
> >               ret =3D drm_sched_job_add_implicit_dependencies(&submit->=
base,
>
