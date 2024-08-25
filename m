Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C6D95E479
	for <lists+dri-devel@lfdr.de>; Sun, 25 Aug 2024 18:57:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B52E910E0EC;
	Sun, 25 Aug 2024 16:57:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 508 seconds by postgrey-1.36 at gabe;
 Sun, 25 Aug 2024 14:17:38 UTC
Received: from mail-m2423.xmail.ntesmail.com (mail-m2423.xmail.ntesmail.com
 [45.195.24.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 011F010E002
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Aug 2024 14:17:38 +0000 (UTC)
Received: from amadeus-Vostro-3710.lan (unknown [58.61.141.165])
 by smtp.qiye.163.com (Hmail) with ESMTPA id 50DE87E014E;
 Sun, 25 Aug 2024 22:08:40 +0800 (CST)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: detlev.casanova@collabora.com
Cc: airlied@gmail.com, alchark@gmail.com, amadeus@jmu.edu.cn,
 andi.shyti@kernel.org, andyshrk@163.com, broonie@kernel.org,
 cl@rock-chips.com, conor+dt@kernel.org, daniel@ffwll.ch,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dsimic@manjaro.org, efectn@protonmail.com, finley.xiao@rock-chips.com,
 gregkh@linuxfoundation.org, heiko@sntech.de, honyuenkwun@gmail.com,
 jagan@edgeble.ai, jamie@jamieiles.com, jic23@kernel.org,
 jirislaby@kernel.org, jonas@kwiboo.se, jszhang@kernel.org,
 kernel@collabora.com, krzk+dt@kernel.org, lars@metafoo.de, lee@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux@roeck-us.net,
 maarten.lankhorst@linux.intel.com, macromorgan@hotmail.com, megi@xff.cz,
 michael.riesch@wolfvision.net, mripard@kernel.org, robh@kernel.org,
 tim@feathertop.org, tzimmermann@suse.de, ulf.hansson@linaro.org,
 wim@linux-watchdog.org
Subject: Re: [PATCH v2 11/12] arm64: dts: rockchip: Add rk3576 SoC base DT
Date: Sun, 25 Aug 2024 22:08:24 +0800
Message-Id: <20240825140824.200453-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <23624422.6Emhk5qWAg@trenzalore>
References: <23624422.6Emhk5qWAg@trenzalore>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZQkxIVk9DSUNIGhlPShpKT1YeHw5VEwETFhoSFy
 QUDg9ZV1kYEgtZQVlOQ1VNSlVKT0pVSk1OWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
 tLWQY+
X-HM-Tid: 0a9189de204f03a2kunm50de87e014e
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MQg6ARw5NzIxEhkzMVE8OBgK
 HB8wCU5VSlVKTElPTkJPQklKQkJJVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWU5D
 VU1KVUpPSlVKTU5ZV1kIAVlBSExMSzcG
X-Mailman-Approved-At: Sun, 25 Aug 2024 16:57:40 +0000
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

> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> ...
> +		opp-1416000000 {
> +			opp-hz = /bits/ 64 <1416000000>;
> +			opp-microvolt = <725000 725000 950000>;
> +			opp-microvolt-L1 = <712500 712500 950000>;
> +			opp-microvolt-L2 = <700000 700000 950000>;
> +			opp-microvolt-L3 = <700000 700000 950000>;
> +			opp-microvolt-L4 = <700000 700000 950000>;
> +			opp-microvolt-L5 = <700000 700000 950000>;
> +			clock-latency-ns = <40000>;
> +		};
> ...

I'm curious if these frequencies work properly. On the bsp kernel,
'opp-microvolt-L<name>' is used by the PVTM driver, I don't know
if it works on the upstream kernel. Sorry but have you tested it
with mhz (https://github.com/wtarreau/mhz)?

Thanks,
Chukun

-- 
2.25.1

