Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2FC45D4D8
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 07:34:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE6F6E97F;
	Thu, 25 Nov 2021 06:34:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D52E76E97F
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 06:34:07 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id o20so20800788eds.10
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 22:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=DixG+Wl1Rb/KISam2HYcJ5xuD624xAZ6kpmcZJfHNzs=;
 b=aH1h1pl3DNGqeGFQwGYdGjqfTVNfKjj3LO7m8f/U52icWDr60m/V7U81CLHYO/z/ZY
 dEp1z9m/8rr+iP2KLbwFYIfGQAPBmHxcvKgReCxpcHN+R/nXcar6Ya2ig3W3PT/J9B+s
 9o41P0z494YX7ArSrWV2WQU7+h8PApgk0tBgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=DixG+Wl1Rb/KISam2HYcJ5xuD624xAZ6kpmcZJfHNzs=;
 b=l1n4Ed2iuL/BLT6/fw8RBHLyNBl/NndBVCPN6r2VXsmElNNC7jxC+p53u3Hp39i/9i
 ORp6e3hh95mc9D8IV5rMQbhOWJXaP6k0u6gcZT+MiN75D7/3nKuvLRUVkj2DHgJyl9ju
 CI8rCioimPlac8s+cY5vBTJROWSYY38rhMnfuTwNWQDUUOgNuKc26I0hdlJzetuenb6L
 l4jh67L63n340gL+YdvlVl2mUm7DvjpdVvKhUixGuqp+rxwOtSJs/EhuaydcLMZcgxj6
 DN5E/Me665X0fvAWRsOxH8PneA2dXj0ig+SzlsXfjWsCNDZnDPlHmwY/ciCPdJ5r4lTA
 BvQQ==
X-Gm-Message-State: AOAM53224uqy6H7c/W2RWDuCuRwZmwy9M9HYhAE9xQX84CVut5G0DWJv
 4Gd8fsxA71ScoktnUuwGPOVepIa9NdPEV/Ts/eSIBQ==
X-Google-Smtp-Source: ABdhPJwlCUq/Q7OpJLKMAwHs9hoBtJ4ZiNFp0rs8y4w2a5GNzn1IaePvMPzpr0r3mBmNcNzY0sQUoHyrRhAEulXDvxk=
X-Received: by 2002:a17:907:7f2a:: with SMTP id
 qf42mr29187934ejc.388.1637822045683; 
 Wed, 24 Nov 2021 22:34:05 -0800 (PST)
MIME-Version: 1.0
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 25 Nov 2021 12:03:54 +0530
Message-ID: <CAMty3ZBAQDVaOCZspgEmiuELncEbKCiRhTfojGcZV+-+7V31mg@mail.gmail.com>
Subject: Exynos DSI bridge conversion
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Dae <inki.dae@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Marek Vasut <marex@denx.de>, Michael Tretter <m.tretter@pengutronix.de>
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
Cc: linux-amarula <linux-amarula@amarulasolutions.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrej and all,

I'm trying to convert existing exynos dsi driver to bridge and make
them accessible for i.MX8MM platform.

I've a few questions on the existing exynos dsi driver and which is
indeed incompatible to proceed to make the bridge conversion.

1. Hotplug event

Commit from 295e7954c0d3fdbe0550d13e3cf4dd4604d42c68 which is waiting
for drm to hotplug the downstream devices like panel or bridge to
probe.

Any idea how it works? what if we move drm_bridge_attach in bind
callback so-that binding will start once all the devices get attached.

2. Host register in bind

Usual host registration is done in the probe, but the driver registers
host in bind once the in_bridge is attached. any idea why? What if we
find the DSI as an output port in MIC and start attaching from there?

3. CRTC handling in DSI

Commit from c038f53842cf840889473d219ace7f9121694e8d is trying to send
the DSI flags information to CRTC with a function call. any specific
reason for this? Any proper way of doing this move out from DSI?

4. Mutex calls while assigning device attributes.

Assignment of lanes, format, mode_flags are done in mutex context, I
think we can even do it in normal context isn't it? or any specific
reason for doing this?

5. Clock rates.

pll_clk_rate, burst_clk_rate, burst_clk_rate are these clock rates
retrieved from DT. which is not a proper way to support multi
platform. I think pll-clock and burst-clock are computed based on
panel pixel or bridge clocks. any specific computation for these to
handle dynamically on code?

All this information is essential for me to move this further as I
don't have direct hardware and I'm trying to take some help from Marek
Szyprowski.

Please take some time, and help me.

Thanks,
Jagan.
