Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73232B447EE
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 23:02:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A60F210EAE2;
	Thu,  4 Sep 2025 21:02:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Kf1xmPu/";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="TCjRtOvQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6612910EAE2
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 21:02:11 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cHsNy1VJnz9tVN;
 Thu,  4 Sep 2025 23:02:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1757019730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wqU7xp1+W9R+baMvCQxiUj41CrVT8BIVhS8OUQEgZOI=;
 b=Kf1xmPu/LW9ZwEIyRVMUxKqegvfsy5jHlRDxsq6T1kfQkOqXYpwIkOHsP9ljGRrSz1Q9FS
 mRqK8rwdnxJbVpenjwNgqufC8DkOgOY6H3UHg0qeG+YTjWmveHwOPX3+0kcAbxqNejQ0jm
 3uxjJKab1qamdDnQ8HiJiZkyUtL+A/Z2yl5JmP8OPDDMslSzWS4LRq0uzUzbjTmzkjeaVn
 okb/+i/zT+L1nOAEK0TiFDkq1KLUNyKlvRrB1EthgN1oPjsYbyO3ExBk2xYi66lPaYM/bX
 CazsMokmUsnjhtXrMeCHqh8rZc5bR7DpJ8esrkRK1c50APcW5+ynPlARoD84mA==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=TCjRtOvQ;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org
 designates 2001:67c:2050:b231:465::1 as permitted sender)
 smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1757019728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wqU7xp1+W9R+baMvCQxiUj41CrVT8BIVhS8OUQEgZOI=;
 b=TCjRtOvQOTd5Ib+bNqPx5p9NOK4YkYBi0o9sUwwlY8uJqo33Tao/benGId2bUNOKGKzd8f
 /55OjnbP4CBvtq3XDz13GpHw5NavhCkkXnayF2QZVgB7EVEVXYxxo5Af2yDD1U97XReRcP
 /3wLiqSOodtv+CIKKdppfUgcLKQf1vdzU/prJ4jk+xVs5B2aPE9q7ds0ENkjPuz6v/K5BZ
 Pr/lMtNxs7XtHmHTBCMfDO9gjb3agGYnhbj0zbb7kFmTsOGeAz8DZAm2Dorp24xK/fJydN
 TLQJE8jcrX+MkX0Bs2Vxl2VghGkgkwV31+/+OYonloJPlxmyuhS3eXhTo3+BTw==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 2/4] arm64: dts: renesas: r8a779g0: Rename dsi-encoder@ to
 dsi@
Date: Thu,  4 Sep 2025 23:01:19 +0200
Message-ID: <20250904210147.186728-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250904210147.186728-1-marek.vasut+renesas@mailbox.org>
References: <20250904210147.186728-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: jgpki1enn3iy349w3o7s6yigtro3g43i
X-MBO-RS-ID: 1cfcd2651b6b8b12aae
X-Rspamd-Queue-Id: 4cHsNy1VJnz9tVN
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

Rename dsi-encoder@ node to dsi@ node to follow node name pattern
in Documentation/devicetree/bindings/display/dsi-controller.yaml .
No functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: No change
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 8d9ca30c299c9..4fae063bf91b6 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -2476,7 +2476,7 @@ isp1vin15: endpoint {
 			};
 		};
 
-		dsi0: dsi-encoder@fed80000 {
+		dsi0: dsi@fed80000 {
 			compatible = "renesas,r8a779g0-dsi-csi2-tx";
 			reg = <0 0xfed80000 0 0x10000>;
 			clocks = <&cpg CPG_MOD 415>,
@@ -2505,7 +2505,7 @@ port@1 {
 			};
 		};
 
-		dsi1: dsi-encoder@fed90000 {
+		dsi1: dsi@fed90000 {
 			compatible = "renesas,r8a779g0-dsi-csi2-tx";
 			reg = <0 0xfed90000 0 0x10000>;
 			clocks = <&cpg CPG_MOD 416>,
-- 
2.50.1

