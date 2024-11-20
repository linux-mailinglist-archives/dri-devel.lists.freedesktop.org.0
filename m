Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 714489D4905
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 09:40:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B20A410E89F;
	Thu, 21 Nov 2024 08:40:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.209.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 243F710E0A8
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 22:19:00 +0000 (UTC)
X-QQ-mid: bizesmtpip2t1732140984tymev5i
X-QQ-Originating-IP: VFS7TXKFCL86VDvZbg+yeZ74TOGFmsQaL+ekJyN6cIk=
Received: from [IPV6:240f:10b:7440:1:c3e4:b91c ( [localhost])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 21 Nov 2024 06:16:20 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8514301682738835123
Message-ID: <2664D23C9E354B20+5fb967f9-348d-4508-8e3e-b979e4e44b15@radxa.com>
Date: Thu, 21 Nov 2024 07:16:20 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Improve Rockchip VOP2 display modes handling on
 RK3588 HDMI0
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241116-vop2-hdmi0-disp-modes-v1-0-2bca51db4898@collabora.com>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
In-Reply-To: <20241116-vop2-hdmi0-disp-modes-v1-0-2bca51db4898@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: N53K69CeJe7SKhd7yp9ZII+2IBOePkEPXUwdQoXKXxtA2E+BrpEYulhu
 38o+UK3kj4xxLn/Cj4+CfSHCNd83ekKcY3P9KrL74u28PC5aOqeY8V9Faj/pDQhqNg8+QNU
 jgDnpsEw+tnTz6CWob5gO5X4FIkHLpOUJeLesFqg2cZyDVjB8ywTn3RLiTD1gsWP+IItLwZ
 8JsMPJplh1kaQ/rCrvAp8ubejXRyJsbgiUkZbiXN0w1doxTcOOW9l6nX/LP9pFisIfGkiGz
 a0k3FupcaBw2kADC1CmIhEkv5X0LqMBxydypWFjfGHt8dreZ4UOjCSPMawJnMRe5zOQz1iK
 CS7NNDhSYoG2GAfYtczrCi/BHU6CgZpZN8Cn6PL85w5lEAHAQ7uqE1kxCSRNpX9CV7qjXgT
 hAzyNuHV7dxbKwbb+xHob652zSOCB6zppW7SBK8dYguQBsi45LKOX6VqIJQ75cJeNWem3iq
 FSCms3fRZX175y5Ne5z0vrJAII1TaqnVIrWTrDw2geJxl7IscTVwx2kIezZw2KIDfKZPo27
 SCtasceP6WNitXMq6H/0i6GhYXnOg5VGH67C5/nTnFqJdASMmAvv/XJGNK65E6QNS7CGLMn
 aQ1TPwPmKVv3dxmfuiSvOx32u9f3JWbAtUHi7hEcqiOgJ/ilomgCnkVOc8vDVeeMfWEYjcP
 NLjTjxNFRFF1lVYB4ERXsZy5xRZf5DIJgb+kyqf8LLbZ7p2THG96YHOlBbXozrai30EgWgB
 TXtejRi2wvBl0XhyUweNE9DQ/IGXmMJSvft5ETr22EGDQAS1bxN0h+CGXkkn4O8W5FGQwpI
 5lAoSUXdwogLqeM3iCo7m4ePXQ2Szry2zWZLYap5c2aAsA4niTJaoEmNjA85PU/YRU2Tc8T
 qKqu9FGP4IAtt2cXfpf5JY6brn/tqUxZ5PbqpsXlQEM=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-Mailman-Approved-At: Thu, 21 Nov 2024 08:40:20 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 11/17/24 03:22, Cristian Ciocaltea wrote:
> VOP2 support for RK3588 SoC is currently not capable to handle the full
> range of display modes advertised by the connected screens, e.g. it
> doesn't cope well with non-integer refresh rates like 59.94, 29.97,
> 23.98, etc.
> 
> There are two HDMI PHYs available on RK3588, each providing a PLL that
> can be used by three out of the four VOP2 video ports as an alternative
> and more accurate pixel clock source. This is able to correctly handle
> all display modes up to 4K@60Hz.
> 
> As for the moment HDMI1 output is not supported upstream, the patch
> series targets HDMI0 only.
> 
> Additionally, note that testing any HDMI 2.0 specific modes, e.g.
> 4K@60Hz, requires high TMDS clock ratio and scrambling support [1]. The
> patch is usable but not yet ready to be submitted - I will handle this
> soon.
> 
> Thanks,
> Cristian
> 
> [1] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/commits/rk3588-hdmi-bridge-next-20241115
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

for whole series

Tested-by: FUKAUMI Naoki <naoki@radxa.com>

Diginnos DG-NP09D 8.9inch 1920x1200 display works with your patch!

Name: HSE
EISA ID: ___0001
EDID version: 1.3
EDID extension blocks: 1
Screen size: 120.0 cm x 68.0 cm (54.30 inches, aspect ratio 16/9 = 1.76)
Gamma: 2.2
Digital signal
Max video bandwidth: 160 MHz

	HorizSync 14-91
	VertRefresh 22-80

	# Monitor preferred modeline (59.9 Hz vsync, 74.6 kHz hsync, ratio 
16/10, 40x44 dpi)
	ModeLine "1920x1200" 193.25 1920 2008 2052 2592 1200 1204 1209 1245 
+hsync +vsync

	# Monitor supported modeline (59.9 Hz vsync, 33.7 kHz hsync, 
interlaced, ratio 16/9, 40 dpi)
	ModeLine "1920x1080" 74.18 1920 2008 2052 2200 1080 1084 1094 1125 
+hsync +vsync Interlace

	# Monitor supported CEA modeline (59.9 Hz vsync, 31.5 kHz hsync, ratio 
4/3, 13x17 dpi) (bad ratio)
	ModeLine "640x480" 25.175 640 656 752 800 480 490 492 525 -hsync -vsync

	# Monitor supported CEA modeline (59.9 Hz vsync, 31.5 kHz hsync, ratio 
3/2, 15x17 dpi) (bad ratio)
	ModeLine "720x480" 27 720 736 798 858 480 489 495 525 -hsync -vsync

	# Monitor supported CEA modeline (59.9 Hz vsync, 31.5 kHz hsync, ratio 
3/2, 15x17 dpi) (bad ratio)
	ModeLine "720x480" 27 720 736 798 858 480 489 495 525 -hsync -vsync

	# Monitor supported CEA modeline (60.0 Hz vsync, 45.0 kHz hsync, ratio 
16/9, 27 dpi)
	ModeLine "1280x720" 74.25 1280 1390 1430 1650 720 725 730 750 +hsync +vsync

	# Monitor supported CEA modeline (60.0 Hz vsync, 33.8 kHz hsync, 
interlaced, ratio 16/9, 40 dpi)
	ModeLine "1920x1080" 74.25 1920 2008 2052 2200 1080 1084 1094 1125 
+hsync +vsync Interlace

	# Monitor supported CEA modeline (60.0 Hz vsync, 67.5 kHz hsync, ratio 
16/9, 40 dpi)
	ModeLine "1920x1080" 148.5 1920 2008 2052 2200 1080 1084 1089 1125 
+hsync +vsync

	# Monitor supported CEA modeline (50.0 Hz vsync, 31.2 kHz hsync, ratio 
5/4, 15x21 dpi) (bad ratio)
	ModeLine "720x576" 27 720 732 796 864 576 581 586 625 -hsync -vsync

	# Monitor supported CEA modeline (50.0 Hz vsync, 37.5 kHz hsync, ratio 
16/9, 27 dpi)
	ModeLine "1280x720" 74.25 1280 1720 1760 1980 720 725 730 750 +hsync +vsync

	# Monitor supported CEA modeline (50.0 Hz vsync, 28.1 kHz hsync, 
interlaced, ratio 16/9, 40 dpi)
	ModeLine "1920x1080" 74.25 1920 2448 2492 2640 1080 1084 1094 1125 
+hsync +vsync Interlace

	# Monitor supported CEA modeline (50.0 Hz vsync, 56.2 kHz hsync, ratio 
16/9, 40 dpi)
	ModeLine "1920x1080" 148.5 1920 2448 2492 2640 1080 1084 1089 1125 
+hsync +vsync

	# Monitor supported modeline (85.4 Hz vsync, 44.9 kHz hsync, ratio 
0.97, 9x17 dpi) (bad ratio)
	ModeLine "464x480" 27 464 480 542 602 480 489 495 525 -hsync -vsync

	# Monitor supported modeline (50.0 Hz vsync, 37.5 kHz hsync, ratio 
16/9, 27 dpi)
	ModeLine "1280x720" 74.25 1280 1720 1760 1980 720 725 730 750 +hsync +vsync

	# Monitor supported modeline (50.0 Hz vsync, 28.1 kHz hsync, 
interlaced, ratio 16/9, 40 dpi)
	ModeLine "1920x1080" 74.25 1920 2448 2492 2640 1080 1084 1094 1125 
+hsync +vsync Interlace

	# Monitor supported modeline (59.9 Hz vsync, 31.5 kHz hsync, ratio 3/2, 
15x17 dpi) (bad ratio)
	ModeLine "720x480" 27 720 736 798 858 480 489 495 525 -hsync -vsync

	# Monitor supported modeline (50.0 Hz vsync, 31.2 kHz hsync, ratio 5/4, 
15x21 dpi) (bad ratio)
	ModeLine "720x576" 27 720 732 796 864 576 581 586 625 -hsync -vsync


Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

> ---
> Cristian Ciocaltea (5):
>        dt-bindings: display: vop2: Add optional PLL clock properties
>        drm/rockchip: vop2: Drop unnecessary if_pixclk_rate computation
>        drm/rockchip: vop2: Improve display modes handling on RK3588 HDMI0
>        arm64: dts: rockchip: Enable HDMI0 PHY clk provider on RK3588
>        arm64: dts: rockchip: Add HDMI0 PHY PLL clock source to VOP2 on RK3588
> 
>   .../bindings/display/rockchip/rockchip-vop2.yaml   |  4 +++
>   arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |  7 +++--
>   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       | 36 +++++++++++++++++++++-
>   3 files changed, 44 insertions(+), 3 deletions(-)
> ---
> base-commit: 744cf71b8bdfcdd77aaf58395e068b7457634b2c
> change-id: 20241116-vop2-hdmi0-disp-modes-b39e3619768f

