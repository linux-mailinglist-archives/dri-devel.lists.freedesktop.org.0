Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0450E4AD253
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 08:37:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A57BA10E66E;
	Tue,  8 Feb 2022 07:37:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C88810E694
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 07:37:27 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id e6so17431023pfc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 23:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RKltf19DtHiRc15a3iaZ/NnDb+6ppKujiVxWZQto3YU=;
 b=UQRrh4b2cYpExbUb5sYjfYPmvD9zbPX49JL8Al9S0glKbqkZ0dmzb/DWvs20vFsU4I
 O/YgtlkeyONvN4ODXkKbAwbVKcjSXwNHy1KNIzNLS8S85I1c3k2dDioajk+vyYjTK0vr
 kVR0Zgv0Jb0jFEIXVFA9s6SyAAU+51lA2FXMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RKltf19DtHiRc15a3iaZ/NnDb+6ppKujiVxWZQto3YU=;
 b=IkLICuHaafycTf+EusJv3MQsj7PGz/II5yoWn4wxYc44O2q8Qsc9cUhqA/4soPtGXq
 OPinhnoCGgqxdzeWhiO4AEZQopqiHs88u8Gu/F7nMuGelEhgfoEaZ615nQX1A4o8Nvkd
 NyOXWmrJVzBNNeXqFKrq24meJtlKUR7S3lAWYSasgoe88f2zHkOM0V/mX8y8tkKKsUTA
 MpCRDI1sMM5Xd9JWq8WHLbWkzRe0EZ9UHSO/hDoY5JBJUkJozcUl/NS1pb+zUrMG+ogi
 JQawz/Lq9VqkCDuxkhbP8Aue+yBLbyCQUOh9DGm8/bFRfNRgCDMftzH0W58kLvXR5nNV
 Dn7g==
X-Gm-Message-State: AOAM531/vX4CVGeqyHCebrf2wTolCG5KxmUlVq3ux0oNpUmtVNaL9fUF
 bw1ZH7sTib1pBIVo5S+0pkrV240CY0CjYg==
X-Google-Smtp-Source: ABdhPJx2727H/bIFB7AiNJuAQfngpGnHTMQX3kn1wApGZnVIxbe2t19Z6gDkwdss+b2K2QYmV7K1CQ==
X-Received: by 2002:a63:8a44:: with SMTP id y65mr2554451pgd.590.1644305846835; 
 Mon, 07 Feb 2022 23:37:26 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:7d9a:166e:9d34:ff4f])
 by smtp.gmail.com with ESMTPSA id ip5sm1677243pjb.13.2022.02.07.23.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 23:37:26 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 3/3] arm64: dts: mt8183: Add panel rotation
Date: Tue,  8 Feb 2022 15:37:14 +0800
Message-Id: <20220208073714.1540390-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208073714.1540390-1-hsinyi@chromium.org>
References: <20220208073714.1540390-1-hsinyi@chromium.org>
MIME-Version: 1.0
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

krane, kakadu, and kodama boards have a default panel rotation.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index b42d81d26d7211..d29d4378170971 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -276,6 +276,7 @@ panel: panel@0 {
 		avee-supply = <&ppvarp_lcd>;
 		pp1800-supply = <&pp1800_lcd>;
 		backlight = <&backlight_lcd0>;
+		rotation = <270>;
 		port {
 			panel_in: endpoint {
 				remote-endpoint = <&dsi_out>;
-- 
2.35.0.263.gb82422642f-goog

