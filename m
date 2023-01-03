Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5842365C5A3
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 19:04:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C84910E27B;
	Tue,  3 Jan 2023 18:04:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 572E510E3F4
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 18:04:08 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4NmgbS4vD2z9scX;
 Tue,  3 Jan 2023 19:04:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1672769044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IwijEIbSvLC/U34WE9PzGXqnqBCMcP9iTPyy7f2QEyE=;
 b=jmyr4xz/D70NMFYmVSJfdwBO6t9PU9VVSDmNxOy0Ggv9AcwmF1ZldDzr1iCCmB0ibOxTzY
 6WzbsrThPtwgUFIIz0Ea5ypZuk5syy3PdY5VEvtfU6p3UQOk9YiTCZuc89XC6XkrPK8zWu
 5eOZW+iBTVeyIf2LwlXbvRx39MsJSC0tO7ti43AxqmECJ/3IwTkwikJjsH8UIhaWjvvoOc
 jACx0tp1dwpIsvQnfGXyVdlQJoeBlvj5CLJYG31F2nC8BAT/++OG7ncovYtIaI5ioOxqiH
 9E6Zw9kYkWSKnxFBSj2xQ88+hITcxGmMLzmyJ8zvvlMj+X9+17omuymVsq5O1w==
Message-ID: <a62cd71c-f025-739a-4822-58ff8fa78cbd@mailbox.org>
Date: Tue, 3 Jan 2023 19:04:00 +0100
MIME-Version: 1.0
Subject: Re: renesas/master bisection:
 igt-kms-rockchip.kms_vblank.pipe-A-wait-forked on rk3399-gru-kevin
Content-Language: en-CA
To: Brian Norris <briannorris@chromium.org>, Mark Brown <broonie@kernel.org>, 
 Sean Paul <seanpaul@chromium.org>
References: <6398848e.170a0220.f8e8e.d44f@mx.google.com>
 <Y5itf0+yNIQa6fU4@sirena.org.uk> <Y5qOwmqIIp+2qWOy@google.com>
 <Y6OCg9BPnJvimQLT@google.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <Y6OCg9BPnJvimQLT@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: mbhrkj4mmbk6ah919fxwhkezapfhjmhc
X-MBO-RS-ID: 098d62100c117ff1898
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, kernelci-results@groups.io,
 bot@kernelci.org, Jonas Karlman <jonas@kwiboo.se>,
 Robert Foss <robert.foss@linaro.org>, Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, gtucker@collabora.com,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/21/22 23:02, Brian Norris wrote:
> Hi Mark, Sean, (and dri-devel)
> 
> On Wed, Dec 14, 2022 at 07:04:37PM -0800, Brian Norris wrote:
>> On Tue, Dec 13, 2022 at 04:51:11PM +0000, Mark Brown wrote:
>>> On Tue, Dec 13, 2022 at 05:56:30AM -0800, KernelCI bot wrote:
>>>
>>> The KernelCI bisection bot found regressions in at least two KMS tests
>>> in the Renesas tree on rk3399-gru-kevin just after the Renesas tree
>>> merged up mainline:
>>>
>>>    igt-kms-rockchip.kms_vblank.pipe-A-wait-forked 
>>>    igt-kms-rockchip.kms_vblank.pipe-A-query-busy
>>>
>>> which it bisected to ca871659ec16 ("drm/bridge: analogix_dp: Support
>>> PSR-exit to disable transition").  I'm not *100%* sure I trust the
>>> bisection but it sure is suspicous that two separate bisects for related
>>> issues landed on the same commit.
> 
> ...
> 
>>> | IGT-Version: 1.26-gf8a4a0b (aarch64) (Linux: 6.1.0 aarch64)
>>> | <14>[   35.444448] [IGT] drm_read: starting subtest short-buffer-wakeup
>>> | Starting subtest: short-buffer-wakeup
>>> | 
>>> | (| drm_read:350) CRITICAL: Test assertion failure function generate_event, file ../tests/drm_read.c:65:
>>> | (drm_read:350) CRITICAL: <14>[   36.155642] [IGT] drm_read: exiting, ret=98
>>> | Failed assertion: kmstest_get_vblank(fd, pipe, DRM_VBLANK_EVENT)
>>> | 
>>> | (drm_read:350) CRITICAL: Last errno: 22, Invalid argument
>>> | Stack trace:
>>> | 
>>> |   #0 ../lib/igt_core.c:1933 __igt_fail_assert()
>>> |   #1 [<unknown>+0xd5362770]
>>> |   #2 [<unknown>+0xd536193c]
>>> |   #3 [__libc_start_main+0xe8]
>>> |   #4 [<unknown>+0xd5361974]
>>> |   #5 [<unknown<6>[   36.162851] Console: switching to colour frame buffer device 300x100>+0xd5361974]
>>> | Subtest short-buffer-wakeup failed.
> 
> ...
> 
>> I'll look some more, but this might be a difference of test setup, such
>> that my setup has the issue before and after that commit, but your setup
>> sees a regression.
> 
> I believe this is the case; things are broken both before and after, but
> depending on test sequencing, etc., they might have seemed less broken
> before.
> 
> When we're failing, we're getting EINVAL from drm_vblank_get(). That
> essentially means that vblank has been disabled (drm_crtc_vblank_off()).
> As it happens, this is exactly what we do when we enter PSR (Panel Self
> Refresh).
> 
> Now, these test cases (especially 'kms_vblank.pipe-A-wait-forked') seem
> to display a static image, and then wait for a bunch of vblank events.
> This is exactly the sort of case where we should enter PSR, and so we're
> likely to disable vblank events. Thus, if everything is working right,
> we will often hit EINVAL in ioctl(DRM_IOCTL_WAIT_VBLANK) ... ->
> drm_vblank_get(), and fail the test.
> 
> As to why this appears to be a regression: like mentioned in my previous
> mail, these tests tend to hose the Analogix PSR state before my patch
> set. When PSR is hosed, we tend to stay with PSR disabled, and so
> drm_vblank_get() doesn't return EINVAL, and the test is happy. (Never
> mind that the display is likely non-functional.) [0]
> 
> So how to fix this?
> 
> 1. ignore it; it's "just" a test failure, IIUC [1]
> 2. change the test, to skip this test if the device has PSR
> 3. leave vblank enabled even in the presence of PSR
> 4. otherwise modify the vblank ioctl interface, such that one can "wait"
>    for a vblank that won't come (because the display is in self-refresh
>    / there are no new frames or vblanks)

FWIW, a couple more alternatives:

5. Go/stay out of PSR while vblank interrupts are enabled (probably want to make sure vblankoffdelay is set up such that vblank interrupts are disabled ASAP)
6. Use fallback timers for vblank events while in PSR (there might be some infrastructure for this, since some drivers don't have real vblank interrupts)


> [1] Or is it? I don't really know the DRM_IOCTL_WAIT_VBLANK ABI
>     contract in the presence of PSR, but I believe the upstream PSR
>     support has always worked this way. I could imagine
>     DRM_IOCTL_WAIT_VBLANK users might not love seeing EINVAL here
>     though.

Yeah, that's pretty likely to cause issues with existing real-world user space.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

