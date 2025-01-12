Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97838A0A9DA
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2025 14:48:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18BBB10E31A;
	Sun, 12 Jan 2025 13:48:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gnxNZCCH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A2810E31A
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2025 13:48:02 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5d3da226a2aso600438a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2025 05:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736689620; x=1737294420; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bbxVYu0IbvaHRTDG5HwA2u3rBHeuhGmSjOg2YycVEJk=;
 b=gnxNZCCH77uRVb1XSkRh0af4yQsFiXBvl7pQxtFd30Y6LZLArCdcC0Xvi6aQpVsPvy
 haTJbwCTOyekmD0YN44PZafvySqM3MpUnRDiKNmRstz9MEklBAR/h0zBQ2TpyopRN10P
 Zgp+dzWwv+j/djCoJ7x2J9jTbYB2brnP+J2dmCGVtT+qzWaWsggUpHiv8ehUPFcaNl7V
 pX9H9jAcRxyiiu31E0AX8HjAQZnIViSkMKttFbqPkEC1TEnk8xELNRrBO6vkQe5m0oTM
 nZrl5UghmCLpwvcMi/OCgQKu3XPT3Lu+K1mvqZGXfpl5pkFI71S85t0u6IsiwKpVvgP5
 1Lxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736689620; x=1737294420;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bbxVYu0IbvaHRTDG5HwA2u3rBHeuhGmSjOg2YycVEJk=;
 b=RWmuaovhL5eo5BPV8ESe+3VoQwg0GGmhOiW3xcpZHYh9QOY7Cv4c2278kzlqmQX2t4
 anBxzmOBCXSvNRJi7X9oyEB3iB6HmhE6lgSolJljgZN7T3kQ+9+fe6Lin8KDEXGVcoTz
 JdgJ9Lo9ztcgUd6yK+pJ8CBwe0AMDGcP3STp+9lTCt1qhZ5KTD6FmHBx/2ec65vzgCcz
 XhHLQFEczy/Hu7gUH2hVD3X3ZgcOZ1hWIMVa+x8HSEfI+/wFc5cQ70cMmHRoCFYGl7QC
 ItE7YiPb539BWeUNKxAKT4HJiVCSRdPa393ckm01J7XNwR6hHGwG4FPoenNqmF2OC8mk
 xAJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvvnkSeA7QvcizXoK+2Wg/6gWtgmVW5x/V1OCNF+tIwgna1KMcRxqVG38UT8uxAayaAF29yTcOfAM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyItToxU57EZogzcN6MSg4lLT9dxL1a5PgkN1ZNqc1Ez0l+I5Pb
 JLiL6ub8N0KfZRJhBU0TkmVGI2O2JJPvAwGiRye13YdnfWP4RYpVuHARkpazIwQ=
X-Gm-Gg: ASbGncvjJd/xpedtmDRbR3NJXMjyHAD+1oz3PIGLBDV76DSg6mzJud73E268nAaJbXg
 SUsZhgcaHOWKDZHMLZMSkxVMBh85Sajp3uQgZOxnucncjARp8IkjdWXk1+0SmDD+cMx8eESYnzs
 aRrVUPcCHK4uPSWMY1Mc0CXzjBxkjK84uKWLjlmjsJzunUDZcvJCatE6oJvqxewtziVSrvjvPeA
 5SA7I15m+JEuZu+fB1xhTcy2SL4vWMrjYoT3WApm6nuy1dQCryj2E9FEuoZxHzs/4Ersuw=
X-Google-Smtp-Source: AGHT+IEpIvsGla+Ov4UfGh2+Pd2aPmExvsUpO9s/aN42c3rfCE/c1aj3fcB5m5mkeA8g4mfR+NruJA==
X-Received: by 2002:a17:907:3f98:b0:aab:daeb:e298 with SMTP id
 a640c23a62f3a-ab2ab6d2881mr578955766b.13.1736689620487; 
 Sun, 12 Jan 2025 05:47:00 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2d0ecdf99sm345076666b.17.2025.01.12.05.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jan 2025 05:47:00 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] drm/omap/dss: Use syscon_regmap_lookup_by_phandle_args
Date: Sun, 12 Jan 2025 14:46:56 +0100
Message-ID: <20250112134656.46069-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
syscon_regmap_lookup_by_phandle() combined with getting the syscon
argument.  Except simpler code this annotates within one line that given
phandle has arguments, so grepping for code would be easier.

There is also no real benefit in printing errors on missing syscon
argument, because this is done just too late: runtime check on
static/build-time data.  Dtschema and Devicetree bindings offer the
static/build-time check for this already.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/omapdrm/dss/dss.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c b/drivers/gpu/drm/omapdrm/dss/dss.c
index 7b2df3185de4..692df747e2ae 100644
--- a/drivers/gpu/drm/omapdrm/dss/dss.c
+++ b/drivers/gpu/drm/omapdrm/dss/dss.c
@@ -1236,21 +1236,15 @@ static int dss_video_pll_probe(struct dss_device *dss)
 	if (!np)
 		return 0;
 
-	if (of_property_read_bool(np, "syscon-pll-ctrl")) {
-		dss->syscon_pll_ctrl = syscon_regmap_lookup_by_phandle(np,
-			"syscon-pll-ctrl");
+	if (of_property_present(np, "syscon-pll-ctrl")) {
+		dss->syscon_pll_ctrl =
+			syscon_regmap_lookup_by_phandle_args(np, "syscon-pll-ctrl",
+							     1, &dss->syscon_pll_ctrl_offset);
 		if (IS_ERR(dss->syscon_pll_ctrl)) {
 			dev_err(&pdev->dev,
 				"failed to get syscon-pll-ctrl regmap\n");
 			return PTR_ERR(dss->syscon_pll_ctrl);
 		}
-
-		if (of_property_read_u32_index(np, "syscon-pll-ctrl", 1,
-				&dss->syscon_pll_ctrl_offset)) {
-			dev_err(&pdev->dev,
-				"failed to get syscon-pll-ctrl offset\n");
-			return -EINVAL;
-		}
 	}
 
 	pll_regulator = devm_regulator_get(&pdev->dev, "vdda_video");
-- 
2.43.0

