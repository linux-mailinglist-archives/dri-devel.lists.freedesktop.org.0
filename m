Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4768C83DD23
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 16:12:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C19710FB63;
	Fri, 26 Jan 2024 15:12:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B6510EE9C
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 09:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1706259457; x=1708851457;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wBQ4xfAfXtn1FLfmimQlpQJ+HcmxcQEmSqcJyqP6Px0=;
 b=PrKilppnBmch0CAVl61IH3pQu9sJHL61j8hreTot/ZKHNO1zTo5HjVxbTw4defKf
 54FsbVmAz4a9b7/z8LExmMEWPgHOiHKYYhDWQu1Im/xXJosatrsSwMexIMx026o5
 l2WWdgGpCxM7m/ho4wq9ygWBiE84hvsRt7FoQ0bhdA8=;
X-AuditID: ac14000a-fbefe7000000290d-bd-65b37401dcb5
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
 (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 27.F9.10509.10473B56;
 Fri, 26 Jan 2024 09:57:37 +0100 (CET)
Received: from lws-moog.phytec.de (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Fri, 26 Jan
 2024 09:57:36 +0100
From: Yannic Moog <y.moog@phytec.de>
Date: Fri, 26 Jan 2024 09:57:26 +0100
Subject: [PATCH RFC for upstream 4/4] arm64: defconfig: enable i.MX8MP ldb
 bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240126-wip-y-moog-phytec-de-upstream-pollux-lvds-v1-4-8ec5b48eec05@phytec.de>
References: <20240126-wip-y-moog-phytec-de-upstream-pollux-lvds-v1-0-8ec5b48eec05@phytec.de>
In-Reply-To: <20240126-wip-y-moog-phytec-de-upstream-pollux-lvds-v1-0-8ec5b48eec05@phytec.de>
To: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP
 Linux Team <linux-imx@nxp.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>
X-Mailer: b4 0.12.3
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Berlix.phytec.de (172.25.0.12) To Berlix.phytec.de
 (172.25.0.12)
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbSyVYRjH3c+bx6nTnh7KTQsZ6c1LTXZ/qFattduXVOpDlumMezkjzo6j
 JVtFp+QQqaWRnRASGo6XwxnZRDmzWPNSeclMNS/FzNuI5Oms5dvv+l//67r+Hy6eFr8xjrwy
 SkPUUYpIV07GlDlYbfQEmirik6LdgNo+5lNoqigVoLLGDgqt1mbQ6FlLB4u656Y4NNwTgEoe
 1zMobXSYRoaRXhbpll7SqMuUw6G86RoG3U0uYtFUfR9AbbphFiU+fEKjO40t1mjFaGBQ8WIN
 QKPV9mjRpGdQ9Y8MFqVMeiDtwMGjDrhMXwZw43wug+uzB62xoSSZwwO9DRzWm8/goZR3FK4q
 uInTU7QsXpirYHHlZB2F01d8cEbDDVyQ2cPhqvZ4PGNwOi0EyQ6FkUjlVaL2PnJJFq41VdKq
 FvbazCO3W2Cc0QEbHgq+8LNueY1lvCg8p2CS+a21pRgGsKlpDEguTnCDI6NfWB3geUZwh7++
 H5dkWyEQ9mjNfxfJhc3QnPWVkSy0sBuWm7wlmRacofFnDi3JcuEiHHsdK6G4hrqREAlthGCY
 cNtTumkn6Dg4YXjPWSZnAcw3ultS2sKk/D5KYlHYDkc771tbdGeY2TFBW/g8rJk1Ug+AmL0u
 T/b/PNnr8uQCugSIV5ShEUStjPBShcdpSKhXGDEA6RXsrGR1IC0HNwOKB80A8rSrndz3YCUR
 5WGKuOtEHR2ijo0kMc1gG8+42stL7wUSUbis0JAIQlRE/a9L8TaOt0Dq/HJFQnGwb+0+F6c8
 uwt9LzY0xE76rAR4+C/VGNnfy8auVV3UicHozMKnxcd6HQLV43WtnfGiauZNoZC4I0Hf6K/a
 2bopWraQpY0U2bP1+vyEglOm/iFmKOlV967+UqRXsgufiNmP4uwrptvLz6Xt/eAXtIVsPXnD
 5fAcfcCViQlX7N9Dq2MUfwBl3OZO+AIAAA==
X-Mailman-Approved-At: Fri, 26 Jan 2024 15:12:02 +0000
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
Cc: devicetree@vger.kernel.org, Yannic Moog <y.moog@phytec.de>,
 upstream@lists.phytec.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Primoz Fiser <primoz.fiser@norik.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable the i.MX8MP LDB driver used for display support of the i.MX8MP
LVDS interface.

Signed-off-by: Yannic Moog <y.moog@phytec.de>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b60aa1f89343..acd71548cf29 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -850,6 +850,7 @@ CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
 CONFIG_DRM_PANEL_SITRONIX_ST7703=m
 CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
 CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
+CONFIG_DRM_FSL_LDB=m
 CONFIG_DRM_LONTIUM_LT8912B=m
 CONFIG_DRM_LONTIUM_LT9611=m
 CONFIG_DRM_LONTIUM_LT9611UXC=m

-- 
2.34.1

