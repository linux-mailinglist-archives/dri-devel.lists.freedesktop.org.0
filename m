Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8092F492F1F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 21:17:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01CA610E557;
	Tue, 18 Jan 2022 20:17:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5807410E557;
 Tue, 18 Jan 2022 20:17:00 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 x31-20020a056830245f00b00599111c8b20so12392163otr.7; 
 Tue, 18 Jan 2022 12:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=He49yW7OyJJZQm4z6JSnGw3avbkaRtaS3bqUTuhHunc=;
 b=XuITQ2FaV6SooarHn5WnGL2EmHNlAsAIIy1rnRhSYfbOSxlAijkcvN6cF0KrUY49or
 e9TQUbVoJy9NcWRJm5WOUcAT680yX93YjYtL67LPnzEdWTtrDIu6iWy3BfpAtoCFUT9d
 3fcjinfectzksRwnOc98D4rw759DrpdnaKBDtGf+J/1mcBMXMw33CfbeubtGU5UZtSoL
 pYcTPZU1GWEk+ri0P5ClUk5KurrM17v33bjuO/+kRJ2ch8Z3QKDX+VQZaeh8qic9ZKhN
 vKORlYVLApuut6NPojyQmeqGNwKncRPIeWVH7f+jIMSDegowVwXTCTxUwzyZGe55KR2L
 B0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=He49yW7OyJJZQm4z6JSnGw3avbkaRtaS3bqUTuhHunc=;
 b=vDA4HqtdmmMp58tjz8QkZ4mCCyjDVc4Fxbp4AqCLTJzOgMTPcR1sEwVkhfSCxVoqwr
 1PTgVgT7FXDu/wlL6/h1RFX0Ba/pUy1Pi2lJk77mZZ5EJ0JNgl695Yw/6CwW2zzsnH+i
 Cj/BYT5wS7IhyQ0oUvGFFLdK2xqh26GBFqQ8ul9kBC+FjROIclljn6JZzsmdoxmdf62y
 zrGyJv3lkCfynnX4jwVkZcktV9Y2QWOGcNCstgRqqDl0JTsI018H2seYVStZefSjk/4C
 Yx09VIcXfgNtAalAbZYAgxM+tK0lGliTpunq3LsW4alQ0N4y8DTJdXrclwhjK4rgHSG5
 bPKg==
X-Gm-Message-State: AOAM533z7AJRXuVAT2NC7duYS0sSw1lteiy79HwN6zxo01Wka8FjcOAF
 fAN9jqY4aMwSU9dpNOFbYLzb150cYsN/Ll23B1k=
X-Google-Smtp-Source: ABdhPJyEoz0zXwrzFuBM2JIVgjhTpd4kPETh6fm7uOfPE7ttfRQg6574AJwyvrb+0D3mIMPKuaRWt0oKed0v3J96Dss=
X-Received: by 2002:a9d:12f7:: with SMTP id
 g110mr22360780otg.299.1642537019635; 
 Tue, 18 Jan 2022 12:16:59 -0800 (PST)
MIME-Version: 1.0
References: <20220117074731.29882-1-maqianga@uniontech.com>
 <581d4658-0f12-f355-0c4c-4b0da9b23d61@amd.com>
In-Reply-To: <581d4658-0f12-f355-0c4c-4b0da9b23d61@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 18 Jan 2022 15:16:48 -0500
Message-ID: <CADnq5_OoB90EGoujeLaK+iSQig=K0uzysM-OSLFhJAy0e4T9_w@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: fix UVD suspend error
To: Leo Liu <leo.liu@amd.com>
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
Cc: Dave Airlie <airlied@linux.ie>, xinhui pan <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Qiang Ma <maqianga@uniontech.com>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Mon, Jan 17, 2022 at 3:05 PM Leo Liu <leo.liu@amd.com> wrote:
>
>
> On 2022-01-17 2:47 a.m., Qiang Ma wrote:
> > I met a bug recently and the kernel log:
> >
> > [  330.171875] radeon 0000:03:00.0: couldn't schedule ib
> > [  330.175781] [drm:radeon_uvd_suspend [radeon]] *ERROR* Error destroying UVD (-22)!
> >
> > In radeon drivers, using UVD suspend is as follows:
> >
> > if (rdev->has_uvd) {
> >          uvd_v1_0_fini(rdev);
> >          radeon_uvd_suspend(rdev);
> > }
> >
> > In radeon_ib_schedule function, we check the 'ring->ready' state,
> > but in uvd_v1_0_fini funciton, we've cleared the ready state.
> > So, just modify the suspend code flow to fix error.
>
> It seems reasonable to me. The suspend sends the destroy message if
> there is still incomplete job, so it should be before the fini which
> stops the hardware.
>
> The series are:
>
> Reviewed-by: Leo Liu <leo.liu@amd.com>
>
>
> >
> > Signed-off-by: Qiang Ma <maqianga@uniontech.com>
> > ---
> >   drivers/gpu/drm/radeon/cik.c       | 2 +-
> >   drivers/gpu/drm/radeon/evergreen.c | 2 +-
> >   drivers/gpu/drm/radeon/ni.c        | 2 +-
> >   drivers/gpu/drm/radeon/r600.c      | 2 +-
> >   drivers/gpu/drm/radeon/rv770.c     | 2 +-
> >   drivers/gpu/drm/radeon/si.c        | 2 +-
> >   6 files changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
> > index 81b4de7be9f2..5819737c21c6 100644
> > --- a/drivers/gpu/drm/radeon/cik.c
> > +++ b/drivers/gpu/drm/radeon/cik.c
> > @@ -8517,8 +8517,8 @@ int cik_suspend(struct radeon_device *rdev)
> >       cik_cp_enable(rdev, false);
> >       cik_sdma_enable(rdev, false);
> >       if (rdev->has_uvd) {
> > -             uvd_v1_0_fini(rdev);
> >               radeon_uvd_suspend(rdev);
> > +             uvd_v1_0_fini(rdev);
> >       }
> >       if (rdev->has_vce)
> >               radeon_vce_suspend(rdev);
> > diff --git a/drivers/gpu/drm/radeon/evergreen.c b/drivers/gpu/drm/radeon/evergreen.c
> > index eeb590d2dec2..455f8036aa54 100644
> > --- a/drivers/gpu/drm/radeon/evergreen.c
> > +++ b/drivers/gpu/drm/radeon/evergreen.c
> > @@ -5156,8 +5156,8 @@ int evergreen_suspend(struct radeon_device *rdev)
> >       radeon_pm_suspend(rdev);
> >       radeon_audio_fini(rdev);
> >       if (rdev->has_uvd) {
> > -             uvd_v1_0_fini(rdev);
> >               radeon_uvd_suspend(rdev);
> > +             uvd_v1_0_fini(rdev);
> >       }
> >       r700_cp_stop(rdev);
> >       r600_dma_stop(rdev);
> > diff --git a/drivers/gpu/drm/radeon/ni.c b/drivers/gpu/drm/radeon/ni.c
> > index 4a364ca7a1be..927e5f42e97d 100644
> > --- a/drivers/gpu/drm/radeon/ni.c
> > +++ b/drivers/gpu/drm/radeon/ni.c
> > @@ -2323,8 +2323,8 @@ int cayman_suspend(struct radeon_device *rdev)
> >       cayman_cp_enable(rdev, false);
> >       cayman_dma_stop(rdev);
> >       if (rdev->has_uvd) {
> > -             uvd_v1_0_fini(rdev);
> >               radeon_uvd_suspend(rdev);
> > +             uvd_v1_0_fini(rdev);
> >       }
> >       evergreen_irq_suspend(rdev);
> >       radeon_wb_disable(rdev);
> > diff --git a/drivers/gpu/drm/radeon/r600.c b/drivers/gpu/drm/radeon/r600.c
> > index ca3fcae2adb5..dd78fc499402 100644
> > --- a/drivers/gpu/drm/radeon/r600.c
> > +++ b/drivers/gpu/drm/radeon/r600.c
> > @@ -3232,8 +3232,8 @@ int r600_suspend(struct radeon_device *rdev)
> >       radeon_audio_fini(rdev);
> >       r600_cp_stop(rdev);
> >       if (rdev->has_uvd) {
> > -             uvd_v1_0_fini(rdev);
> >               radeon_uvd_suspend(rdev);
> > +             uvd_v1_0_fini(rdev);
> >       }
> >       r600_irq_suspend(rdev);
> >       radeon_wb_disable(rdev);
> > diff --git a/drivers/gpu/drm/radeon/rv770.c b/drivers/gpu/drm/radeon/rv770.c
> > index e592e57be1bb..38796af4fadd 100644
> > --- a/drivers/gpu/drm/radeon/rv770.c
> > +++ b/drivers/gpu/drm/radeon/rv770.c
> > @@ -1894,8 +1894,8 @@ int rv770_suspend(struct radeon_device *rdev)
> >       radeon_pm_suspend(rdev);
> >       radeon_audio_fini(rdev);
> >       if (rdev->has_uvd) {
> > -             uvd_v1_0_fini(rdev);
> >               radeon_uvd_suspend(rdev);
> > +             uvd_v1_0_fini(rdev);
> >       }
> >       r700_cp_stop(rdev);
> >       r600_dma_stop(rdev);
> > diff --git a/drivers/gpu/drm/radeon/si.c b/drivers/gpu/drm/radeon/si.c
> > index 013e44ed0f39..8d5e4b25609d 100644
> > --- a/drivers/gpu/drm/radeon/si.c
> > +++ b/drivers/gpu/drm/radeon/si.c
> > @@ -6800,8 +6800,8 @@ int si_suspend(struct radeon_device *rdev)
> >       si_cp_enable(rdev, false);
> >       cayman_dma_stop(rdev);
> >       if (rdev->has_uvd) {
> > -             uvd_v1_0_fini(rdev);
> >               radeon_uvd_suspend(rdev);
> > +             uvd_v1_0_fini(rdev);
> >       }
> >       if (rdev->has_vce)
> >               radeon_vce_suspend(rdev);
