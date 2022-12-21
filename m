Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 849BC65385A
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 23:02:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C925310E4E0;
	Wed, 21 Dec 2022 22:02:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DDFB10E4E0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 22:02:47 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id r18so104751pgr.12
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 14:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=q+0GvlIHGVbxl/3eCKEWmbSw5vvxoPeGSxp8VoYXLkI=;
 b=jnOesX0JDINyp/ZOvK8a2iIfFafqsK1oo3tnsBW1zuZmdqOxuO5cDaUZdtiiXn6sl4
 OsDiSLJN9W6qr8AEr8ooU7FFSa2uhRAw8aQ44loRJaR9yp/3QOt1FgAwAza6aU2eyFFQ
 +I8x3LJ1yYkTAtru1Iw5pf5Iooo+BkQE8ovBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q+0GvlIHGVbxl/3eCKEWmbSw5vvxoPeGSxp8VoYXLkI=;
 b=LeinYUFse7dI/lSrt8eiUPWoMAO3QlEWawn3j0tpzGXNMYPsnJc05qZOgb3DrcG8rR
 jBv47SvhE7pMa/cRPG3wGh+iM7vhdZHZsP0hJr6OIJrzVPXXJVDTBk1N0f+y7x5tzi8e
 HsZwEcQ7ZzSkidMhSsfF5oBVNW7hqd01suS2TiE55IY3FMEN0ltiEoOcRylTKiJquo/o
 2ZHieplbSiGpBTFRgV025M5kikby4MpNY7SMtmBIZsxHdsDUMQTja2Kl5W0MwqEmmsxg
 oHdmfIw5MvShZ5g3yd9CdA2VMDApgiuQnpT2JmTBHowcqJ95lWiBywWjiobgSbvWzAla
 y3eQ==
X-Gm-Message-State: AFqh2kqekL7JPsmHXFJKbEL3fnFmOj06/YpqNKVSnaTb88ha09/fgJFL
 VLTPRgHqLJC6nJ0BRaoyMCt+wnqeVxxmoI4i
X-Google-Smtp-Source: AMrXdXuXyLdgxcNpaIvNnkX4bXHyx8/3rf7c+ClwwJkWQFYLJU9WKKJfl/D0RqB1oQq75FtbjEgQ6A==
X-Received: by 2002:a62:e90e:0:b0:577:1c59:a96c with SMTP id
 j14-20020a62e90e000000b005771c59a96cmr4015331pfh.2.1671660167146; 
 Wed, 21 Dec 2022 14:02:47 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:7ca9:883d:f86b:5a1e])
 by smtp.gmail.com with ESMTPSA id
 b27-20020aa78edb000000b005772bf1b61bsm11112984pfr.67.2022.12.21.14.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 14:02:46 -0800 (PST)
Date: Wed, 21 Dec 2022 14:02:43 -0800
From: Brian Norris <briannorris@chromium.org>
To: Mark Brown <broonie@kernel.org>, Sean Paul <seanpaul@chromium.org>
Subject: Re: renesas/master bisection:
 igt-kms-rockchip.kms_vblank.pipe-A-wait-forked on rk3399-gru-kevin
Message-ID: <Y6OCg9BPnJvimQLT@google.com>
References: <6398848e.170a0220.f8e8e.d44f@mx.google.com>
 <Y5itf0+yNIQa6fU4@sirena.org.uk> <Y5qOwmqIIp+2qWOy@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5qOwmqIIp+2qWOy@google.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, kernelci-results@groups.io,
 bot@kernelci.org, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, gtucker@collabora.com,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mark, Sean, (and dri-devel)

On Wed, Dec 14, 2022 at 07:04:37PM -0800, Brian Norris wrote:
> On Tue, Dec 13, 2022 at 04:51:11PM +0000, Mark Brown wrote:
> > On Tue, Dec 13, 2022 at 05:56:30AM -0800, KernelCI bot wrote:
> > 
> > The KernelCI bisection bot found regressions in at least two KMS tests
> > in the Renesas tree on rk3399-gru-kevin just after the Renesas tree
> > merged up mainline:
> > 
> >    igt-kms-rockchip.kms_vblank.pipe-A-wait-forked 
> >    igt-kms-rockchip.kms_vblank.pipe-A-query-busy
> > 
> > which it bisected to ca871659ec16 ("drm/bridge: analogix_dp: Support
> > PSR-exit to disable transition").  I'm not *100%* sure I trust the
> > bisection but it sure is suspicous that two separate bisects for related
> > issues landed on the same commit.

...

> > | IGT-Version: 1.26-gf8a4a0b (aarch64) (Linux: 6.1.0 aarch64)
> > | <14>[   35.444448] [IGT] drm_read: starting subtest short-buffer-wakeup
> > | Starting subtest: short-buffer-wakeup
> > | 
> > | (| drm_read:350) CRITICAL: Test assertion failure function generate_event, file ../tests/drm_read.c:65:
> > | (drm_read:350) CRITICAL: <14>[   36.155642] [IGT] drm_read: exiting, ret=98
> > | Failed assertion: kmstest_get_vblank(fd, pipe, DRM_VBLANK_EVENT)
> > | 
> > | (drm_read:350) CRITICAL: Last errno: 22, Invalid argument
> > | Stack trace:
> > | 
> > |   #0 ../lib/igt_core.c:1933 __igt_fail_assert()
> > |   #1 [<unknown>+0xd5362770]
> > |   #2 [<unknown>+0xd536193c]
> > |   #3 [__libc_start_main+0xe8]
> > |   #4 [<unknown>+0xd5361974]
> > |   #5 [<unknown<6>[   36.162851] Console: switching to colour frame buffer device 300x100>+0xd5361974]
> > | Subtest short-buffer-wakeup failed.

...

> I'll look some more, but this might be a difference of test setup, such
> that my setup has the issue before and after that commit, but your setup
> sees a regression.

I believe this is the case; things are broken both before and after, but
depending on test sequencing, etc., they might have seemed less broken
before.

When we're failing, we're getting EINVAL from drm_vblank_get(). That
essentially means that vblank has been disabled (drm_crtc_vblank_off()).
As it happens, this is exactly what we do when we enter PSR (Panel Self
Refresh).

Now, these test cases (especially 'kms_vblank.pipe-A-wait-forked') seem
to display a static image, and then wait for a bunch of vblank events.
This is exactly the sort of case where we should enter PSR, and so we're
likely to disable vblank events. Thus, if everything is working right,
we will often hit EINVAL in ioctl(DRM_IOCTL_WAIT_VBLANK) ... ->
drm_vblank_get(), and fail the test.

As to why this appears to be a regression: like mentioned in my previous
mail, these tests tend to hose the Analogix PSR state before my patch
set. When PSR is hosed, we tend to stay with PSR disabled, and so
drm_vblank_get() doesn't return EINVAL, and the test is happy. (Never
mind that the display is likely non-functional.) [0]

So how to fix this?

1. ignore it; it's "just" a test failure, IIUC [1]
2. change the test, to skip this test if the device has PSR
3. leave vblank enabled even in the presence of PSR
4. otherwise modify the vblank ioctl interface, such that one can "wait"
   for a vblank that won't come (because the display is in self-refresh
   / there are no new frames or vblanks)

I don't know how to do #2, because this variant of PSR is intentionally
opaque to user space.

For #3: the downstream PSR support that these systems shipped with
initially did not disable vblank in PSR. But that was massively
rewritten/refactored by Sean Paul before it made it upstream, and now it
does. I tried briefly to factor that part out
(drivers/gpu/drm/rockchip/rockchip_drm_vop.c /
drm_crtc_vblank_{on,off}()), but because drm_self_refresh_helper.c
(ab?)uses the commit step to "disable" the CRTC for PSR (even though the
CRTC is not fully disabled), I tend to hit this in
drm_atomic_helper_commit_modeset_disables()->disable_outputs():

		ret = drm_crtc_vblank_get(crtc);
		WARN_ONCE(ret != -EINVAL, "driver forgot to call drm_crtc_vblank_off()\n");

And I hit a few more problems too...

...I'm sure I could hack my way through this somehow, but this is all
sounding like it could use some advice from someone more familiar with
DRM and/or the drm_self_refresh_helper design. I've learned my way
around this a bit by necessity, but I still feel like I don't know all
the right answers here. (*cough*, Sean?)

Brian

[0] I definitely reproduce this part locally, before my patches. I can't
find non-expired CI logs for "passing" runs to be sure that's what the
CI is seeing though.

[1] Or is it? I don't really know the DRM_IOCTL_WAIT_VBLANK ABI
    contract in the presence of PSR, but I believe the upstream PSR
    support has always worked this way. I could imagine
    DRM_IOCTL_WAIT_VBLANK users might not love seeing EINVAL here
    though.
