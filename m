Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD6D519EF0
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 14:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB4410E504;
	Wed,  4 May 2022 12:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31CA410E504
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 12:08:12 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nmDnc-0001Vf-Sm; Wed, 04 May 2022 14:08:08 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Sascha Hauer <s.hauer@pengutronix.de>,
	dri-devel@lists.freedesktop.org
Subject: Re: (subset) [PATCH v11 00/24] drm/rockchip: RK356x VOP2 support
Date: Wed,  4 May 2022 14:08:07 +0200
Message-Id: <165166602794.882666.15451667003983474386.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422072841.2206452-1-s.hauer@pengutronix.de>
References: <20220422072841.2206452-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Andy Yan <andy.yan@rock-chips.com>,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 22 Apr 2022 09:28:17 +0200, Sascha Hauer wrote:
> It's v11 time. There's only one small change to v10. Discussion seems to
> have settled now. Is there anything left that prevents the series from
> being merged? I'd really like to have it in during the next merge
> window.
> 
> This series still depends on:
> drm/rockchip: Refactor IOMMU initialisation (https://lists.freedesktop.org/archives/dri-devel/2022-April/349548.html)
> arm64: dts: rockchip: add basic dts for the radxa rock3 model a
> 
> [...]

Applied, thanks!

[21/24] drm/rockchip: Make VOP driver optional
        commit: b382406a2cf4afaa7320a7ad4b298ed6e2675437
[22/24] drm: rockchip: Add VOP2 driver
        commit: 604be85547ce4d61b89292d2f9a78c721b778c16

 - Made checkpatch --strict happier
 - move vop2.h binding header over to here

[23/24] dt-bindings: display: rockchip: Add binding for VOP2
        commit: 74015e2650bad641a02100cdf0ac23a96c1a2553
[24/24] dt-bindings: display: rockchip: dw-hdmi: fix ports description
        commit: 4073e42028de0f6ebbd86a9b30aaa5501bcdff59

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
