Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0334F65CBC9
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 03:11:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1443110E427;
	Wed,  4 Jan 2023 02:11:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D71510E427
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jan 2023 02:11:44 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 n65-20020a17090a2cc700b0021bc5ef7a14so32998170pjd.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jan 2023 18:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PXPntPoK587NA8l6EZllaiBISclp1QfdAS6bIiQy//0=;
 b=lg3dPf4YZ/7xjrMO2o8VKPQYFcAWW4ljuI3K0IbLukvmJMQ0QSTMhPu0aHDHoITJCi
 jJQNmqpj5UqPK8+5cvMyb/GXoN3mt+vZlY4HZsktLQ8QMjLPK8cnuPUYVPfGCQ+ZP3Hj
 Ua5cDTU3WibB3KiTu89JLIvVpSBi6Tck4vkGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PXPntPoK587NA8l6EZllaiBISclp1QfdAS6bIiQy//0=;
 b=OBgfV4YtL9e86GPVAOGPw8Pvx9BLYQV+z+lAgekyBt3hUZWKCp/TlWkuGl13AlOiXL
 sZ1oEZ4oZstLgXoSNNGeTrULRT+PzVGF3CU1QMVkkWpPUNes/NHlT7wVVOVpgLpoA+0R
 ewdV1ro6wC8CsZKqisx4I2nsz8Le6qIjMmVQRyAvb2BjJ9OlmNaQE1BbDRdwAjRd2E9U
 /DRdmnBOA7+FAhKnuZu0sfpQowgzrFUKFfg/S81682XJkXGyDWQlk5JosZbwpw12UhgS
 d+y3z6j5LeDU4ZjWlhVWToVVOhD61XdYDdhICVW+ILxlvhseUyVhDGxkh5GB0E5GxYRe
 2KRQ==
X-Gm-Message-State: AFqh2krhfE8ReGJ4nVHqIoG5xhTCJlN6tsq2GLBlN/6I1q/FgKc7hJwQ
 zxcIDSXqFkcW9CfnKi8Lu2SUag==
X-Google-Smtp-Source: AMrXdXuRSA/U5c5b/VbhPcWobwWJtO8py1TdCRoOINe3siMy1kdquKOga/pJ6+5J1LmwLCbUHeUKZA==
X-Received: by 2002:a17:902:ec89:b0:185:441f:7087 with SMTP id
 x9-20020a170902ec8900b00185441f7087mr66470037plg.12.1672798303792; 
 Tue, 03 Jan 2023 18:11:43 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:d4fc:5992:1009:1647])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a170902a3c700b0018997f6fc88sm7796543plb.34.2023.01.03.18.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 18:11:43 -0800 (PST)
Date: Tue, 3 Jan 2023 18:11:40 -0800
From: Brian Norris <briannorris@chromium.org>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>
Subject: Re: renesas/master bisection:
 igt-kms-rockchip.kms_vblank.pipe-A-wait-forked on rk3399-gru-kevin
Message-ID: <Y7TgXA+bnkPm4y/6@google.com>
References: <6398848e.170a0220.f8e8e.d44f@mx.google.com>
 <Y5itf0+yNIQa6fU4@sirena.org.uk> <Y5qOwmqIIp+2qWOy@google.com>
 <Y6OCg9BPnJvimQLT@google.com>
 <a62cd71c-f025-739a-4822-58ff8fa78cbd@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a62cd71c-f025-739a-4822-58ff8fa78cbd@mailbox.org>
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
 Jernej Skrabec <jernej.skrabec@gmail.com>, Mark Brown <broonie@kernel.org>,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, gtucker@collabora.com,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michel,

Thanks for your thoughts. I'll give my attempt at weighing my and your
options, with the caveat that I'm still not much of a DRM expert.

On Tue, Jan 03, 2023 at 07:04:00PM +0100, Michel Dänzer wrote:
> On 12/21/22 23:02, Brian Norris wrote:
> > So how to fix this?
> > 
> > 1. ignore it; it's "just" a test failure, IIUC [1]

Probably discarded, per Michel's notes.

> > 2. change the test, to skip this test if the device has PSR

Doesn't seem great, and not just because PSR is not directly detectable
in user space.

> > 3. leave vblank enabled even in the presence of PSR

I'm leaning toward this.

> > 4. otherwise modify the vblank ioctl interface, such that one can "wait"
> >    for a vblank that won't come (because the display is in self-refresh
> >    / there are no new frames or vblanks)

That doesn't sound so great of an API, to essentially induce hangs,
pending other activity. (Assuming I understand the DRM APIs here
correctly.)

> FWIW, a couple more alternatives:
> 
> 5. Go/stay out of PSR while vblank interrupts are enabled (probably want to make sure vblankoffdelay is set up such that vblank interrupts are disabled ASAP)

That seems not extremely nice, to waste power. Based on the earlier
downstream implementation (which left vblank interrupts enabled), I'd
wager there's a much larger power win from PSR (on the display-transport
and memory-bandwidth costs), relative to the power cost of vblank
interrupts.

Also, messing with vblankoffdelay sounds likely to trigger the races
mentioned in the drm_vblank.c kerneldoc.

> 6. Use fallback timers for vblank events while in PSR (there might be some infrastructure for this, since some drivers don't have real vblank interrupts)

There's drm_atomic_helper_fake_vblank(), but I don't think that's really
hooked up to a timer. That's potentially promising though.

> > [1] Or is it? I don't really know the DRM_IOCTL_WAIT_VBLANK ABI
> >     contract in the presence of PSR, but I believe the upstream PSR
> >     support has always worked this way. I could imagine
> >     DRM_IOCTL_WAIT_VBLANK users might not love seeing EINVAL here
> >     though.
> 
> Yeah, that's pretty likely to cause issues with existing real-world user space.

OK. Any hints as to what kind of user space uses this? A cursory look
doesn't show that any of the ChromeOS user space uses it, which may be
why it was overlooked in the initial PSR development and upstreaming.
I'm in part simply curious, but I'm also wondering what the
error-handling and reliability (e.g., what if vblanks don't come?)
expectations might be in practice.

All in all, it's seeming like maybe option 3 or 6 are best. I'd lean
toward 3, assuming I can hack my way through "driver forgot to call
drm_crtc_vblank_off()" and similar problems, in part because it's ground
that has partially been tread before. I hope that doesn't complicate the
DRM state machine even more though, now that I'll have to better
coordinate the "enabled"/"self_refresh_active" states with "vblank
enabled"...

Thoughts still welcome of course.

Brian
