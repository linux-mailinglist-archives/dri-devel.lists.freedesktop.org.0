Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC67AB58F06
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 09:21:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0534D10E6A7;
	Tue, 16 Sep 2025 07:21:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.b="Eb2jzNPR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com
 [95.215.58.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B859510E606
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 02:32:42 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
 s=key1; t=1757989961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jGHWHtxYrh7BhZTaz7WCOtU0mmIBJYnKsduPAHkKxfg=;
 b=Eb2jzNPRRJAGQU5mqxLFlfAK8RQsO0ZdVk/5Zayx9MnPErLjr2rjAS7rSxwHiWh3z/XoUl
 FUKVthXz9Sll+79o+Il7ih9O1m9DFedciGkw2123S/obSUMtOC6nXXtlejr9HUNnGMu9K3
 AjY1IKGcqbFgzX8wTXcbEH+dOiPKPmiFganwzUS5Y1y4GxCuFoj84VQxpuLQHZ0CzD+lUU
 GaJg1UFbyd4xq5ishI7tqws+reUERqobXKP2luJs4e1Vko86Cpr4J078wB8PfSnoX6naO8
 kGRoC1Gez8NhcXDK6Z7qg9qDwOge0VGABut68dvzpX29VZhqyq3srwv4M1GEtA==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Mon, 15 Sep 2025 19:32:12 -0700
Subject: [PATCH v2 1/3] Update MAINTAINERS for lg,sw49410
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-judyln-panel-v2-1-01ab2199fea5@postmarketos.org>
References: <20250915-judyln-panel-v2-0-01ab2199fea5@postmarketos.org>
In-Reply-To: <20250915-judyln-panel-v2-0-01ab2199fea5@postmarketos.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
 phone-devel@vger.kernel.org, Amir Dahan <system64fumo@protonmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757989951; l=814;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=a4Xw2iLxDUzyz7eq8OF1R9c3YLE4PdzVtLs6KNJOq4E=;
 b=2NG2Va4BOC4emWOZSkySoPI75aAuqbKuwkpVOdNC3dtP7dOthFKbGd34Tlpo7RdCzG2GHs6Mb
 Q3/Mw+RWO0VD9rl5jOc6RyHylPENpcECSuGexoO6twFqt1kFCB4NpsJ
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Tue, 16 Sep 2025 07:21:33 +0000
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

Add myself (Paul Sajna) as maintainer for lg,sw49410

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0c1d245bf7b84f8a78b811e0c9c5a3edc09edc22..f6c7f3cd80d7db6551351432215049adb3a5f626 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7584,6 +7584,11 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
 F:	drivers/gpu/drm/panel/panel-lg-sw43408.c
 
+DRM DRIVER FOR LG SW49410 PANELS
+M:	Paul Sajna <sajattack@postmarketos.org>
+S:	Maintained
+F:	drivers/gpu/drm/panel/panel-lg-sw49410.c
+
 DRM DRIVER FOR LOGICVC DISPLAY CONTROLLER
 M:	Paul Kocialkowski <paulk@sys-base.io>
 S:	Supported

-- 
2.51.0

