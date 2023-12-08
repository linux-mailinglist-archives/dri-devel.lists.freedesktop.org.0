Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3977B80A835
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 17:08:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DBA610EAB4;
	Fri,  8 Dec 2023 16:08:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE9210EAB4
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 16:08:03 +0000 (UTC)
Received: from i53875b61.versanet.de ([83.135.91.97] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1rBdOQ-0000BK-RJ; Fri, 08 Dec 2023 17:07:58 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Subject: Re: [PATCH v4 00/17] Add VOP2 support on rk3588
Date: Fri, 08 Dec 2023 17:07:57 +0100
Message-ID: <8765245.NyiUUSuA9g@diego>
In-Reply-To: <20231207075906.651771-1-andyshrk@163.com>
References: <20231207075906.651771-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: devicetree@vger.kernel.org, chris.obbard@collabora.com, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kever.yang@rock-chips.com, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Andy Yan <andy.yan@rock-chips.com>, sebastian.reichel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

Am Donnerstag, 7. Dezember 2023, 08:59:06 CET schrieb Andy Yan:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> This patch sets aims at enable the VOP2 support on rk3588.
> 
> Main feature of VOP2 on rk3588:
> Four video ports:
> VP0 Max 4096x2160
> VP1 Max 4096x2160
> VP2 Max 4096x2160
> VP3 Max 2048x1080
> 
> 4 4K Cluster windows with AFBC/line RGB and AFBC-only YUV support
> 4 4K Esmart windows with line RGB/YUV support
> 
> The current version support all the 8 windows with all the suppported
> plane format.
> 
> And we don't have a upstreamed encoder/connector(HDMI/DP) for rk3588
> yet, Cristian from collabora is working on adding upstream support for
> HDMI on rk3588.
> 
> My current test(1080P/4KP60) is runing with a HDMI driver pick from
> downstream bsp kernel.
> 
> A branch based on linux-6.7 rc4 containing all the series and
> HDMI driver(not compatible with mainline rk3568 hdmi) picked
> from downstream bsp kernel is available [0].
> 
> [0]https://github.com/andyshrk/linux/commits/rk3588-vop2-upstream-linux-6.7-rc4-2023-12-07
> 
> Changes in v4:
> - fix the POST_BUF_EMPTY irq when set mode
> - use full stop at all the description's end.
> - address Krzysztof's review about dt-binding in v3
> - keep all VOP2_FEATURE_HAS_xxx macros increase in order.
> - address Sascha's review about debugfs
> - Add const for rockchip,rk3588-iommu compatible

very nice, the error messages on "mode changes" are gone now.
Display and even combination with panthor still work of my rk3588-board

Tested-by: Heiko Stuebner <heiko@sntech.de>




