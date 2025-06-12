Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73690AD6FE3
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 14:13:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE97010E811;
	Thu, 12 Jun 2025 12:13:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="d+RkCAVL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7850F10E80F
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 12:13:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1749730388; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=JmJQM+jRvKt3sfgWkyOX4HaeWFVmPbVAO8KKw41WsufLNG+hkfi3klar7FzBKqa0rb+LNIFbWFaE/9rwZE+W7v1Grghsny1FiPBo8dhL0YYtuBgOKYn7PojELsZdUPV8SeUsJhRonIaMm6EpPFZjyhQI9cEn3U0UtqxZhgtXQTA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1749730388;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=xHyHeKSFmeGChzEgnyhjfuWXXlgy/EN/udP8iYeBM9Y=; 
 b=Ib9ekT7AwMRUYhGvgD9uKKP6GelvUKk6hJUYqrrJ6CRYajukgppFIPL0voa2jIlyrM90yRs02e71g334VJGyTiT4sOp+9d15BoOjXB4WPx6gOIKEO9sIp8l/KeAt2GUT/6cyZP0MsYHZ28SMss613cMocZObIwa/2LKTP+cGTrc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749730388; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=xHyHeKSFmeGChzEgnyhjfuWXXlgy/EN/udP8iYeBM9Y=;
 b=d+RkCAVL7ZCghwxV5Eux+3bXYGhO6sl4hXL7ifOJnCTCeQn2zHcqD5oCqiGsg2z4
 wY20o06EDmfS5LlTr/thtEU5z02fLNUC06JV0yXduO/kai1CtJB7ziqGHNeofc9ov2u
 xQGtnTc+H1+LtJ9QDY6+Br9AGt45A8vIQDGO5a8A=
Received: by mx.zohomail.com with SMTPS id 1749730386061466.0088473265579;
 Thu, 12 Jun 2025 05:13:06 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>,
 Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-rockchip@lists.infradead.org
Cc: kernel@collabora.com, Andy Yan <andyshrk@163.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH 0/3] arm64: dts: rockchip: Fix HDMI output on RK3576
Date: Thu, 12 Jun 2025 14:13:00 +0200
Message-ID: <3011644.e9J7NaK4W3@workhorse>
In-Reply-To: <20250612-rk3576-hdmitx-fix-v1-0-4b11007d8675@collabora.com>
References: <20250612-rk3576-hdmitx-fix-v1-0-4b11007d8675@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

On Wednesday, 11 June 2025 23:47:46 Central European Summer Time Cristian Ciocaltea wrote:
> Since commit c871a311edf0 ("phy: rockchip: samsung-hdptx: Setup TMDS
> char rate via phy_configure_opts_hdmi"), the workaround of passing the
> PHY rate from DW HDMI QP bridge driver via phy_set_bus_width() became
> partially broken, unless the rate adjustment is done as with RK3588,
> i.e. by CCF from VOP2.
> 
> Attempting to fix this up at PHY level would not only introduce
> additional hacks, but it would also fail to adequately resolve the
> display issues that are a consequence of the system CRU limitations.
> 
> Therefore, let's proceed with the solution already implemented for
> RK3588, that is to make use of the HDMI PHY PLL as a more accurate DCLK
> source in VOP2.
> 
> It's worth noting a follow-up patch is going to drop the hack from the
> bridge driver altogether, while switching to HDMI PHY configuration API
> for setting up the TMDS character rate.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> Cristian Ciocaltea (3):
>       dt-bindings: display: vop2: Add optional PLL clock property for rk3576
>       arm64: dts: rockchip: Enable HDMI PHY clk provider on rk3576
>       arm64: dts: rockchip: Add HDMI PHY PLL clock source to VOP2 on rk3576
> 
>  .../bindings/display/rockchip/rockchip-vop2.yaml   | 56 +++++++++++++++++-----
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi           |  7 ++-
>  2 files changed, 49 insertions(+), 14 deletions(-)
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250611-rk3576-hdmitx-fix-e030fbdb0d17
> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
> 

For the whole series:

Tested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

This fixes HDMI output for 4K resolutions on my RK3576 ArmSoM Sige5.
The DTB checks and bindings checks pass as well.

Kind regards,
Nicolas Frattaroli


