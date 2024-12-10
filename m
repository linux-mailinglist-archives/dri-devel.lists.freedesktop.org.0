Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D379EB2EE
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 15:17:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 995BE10E8E5;
	Tue, 10 Dec 2024 14:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YSJtlOXP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E607710E3BF
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 14:16:55 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5d3f65844deso3709556a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 06:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733840214; x=1734445014; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6+crVXPu3DLH2LlYuBMFmzZfW/018nLXCNXzwVqSUhk=;
 b=YSJtlOXP32U9VJw5bB9qznHxI1ub2I8Clckmt+/C/+h17J/SHJNKGVKH4ziXGAGNRX
 S5hSuxOQq9p+pCcQeo4UEXmfsqkZhyR/h8VxCfACDoAqFWt42jAUo04lDskO+NbRF2te
 cIi29sMP7NeHFdegWzVHG9i/hfmG1/jOQtGtxzFFTy5KGFq53Uqv6hKSo0j+H+PvNhOM
 BoAlaaTns6jjmimU9DfuaGXvRQP94itl5vi760ZfuygwyrlG/aIjuZ0qWedW0Kb3pRFY
 Z59CCV8Ge1KeZmM2uz2MTOF9VjVHr77DecJTyshOTqkyFuvCaEsj8Seixv/AdEkOt2/h
 b7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733840214; x=1734445014;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6+crVXPu3DLH2LlYuBMFmzZfW/018nLXCNXzwVqSUhk=;
 b=iFe+R3sBr0FLcJ0vaVqeTc2UvMPSSJgrnzkt34eYaP57nQFwZ0eRbfDDt0E9lWDGE7
 V5Ldan4sWhqZ7hpwQuqopS3kVHilK64/qAFu4QArtVTd0jsIjCxuxWhpvKl8t5SjYBpQ
 zsv1TCvwPuvhoMuAqHYEScv5mGBBiGv8kRvOwAUAFU8P9rfKUrZTlsmS6/McmXHy4QDr
 hRF59ZYd1/YJJfc1BGaCwE2TCKsr0A+UirYfRES6h/pyk0yj8MuHRTprpk5cEbuLt8tn
 PQU5InAnHf78n2W3EhzjKNO/TJtLB7pAjVw9qItB9wr3I6Cfd5VI5TVmVz7ifFKRvBv9
 WCDg==
X-Gm-Message-State: AOJu0Ywh3cLZyyoyG33BfNhaNClSDt98SojsOOZWffZsLy+hX+APF5H+
 bWWmcOUM8nFLdeDyS3LX4IhkZAkQa7RH2xXxOJPIQ91vgOBKAl+dJqjt4qcQVgQ=
X-Gm-Gg: ASbGncsMjbPtSs9gCKmOrVChjVAqzjZeO8lAHMSzhdhYrA8IaqgjzHokbkqgFDFHeqi
 +ygLjRIoRRqFCGFXY/S52mZQz54o1GY/pGSjfA5nnWEHTf99HGrHaFIiVB1SZEq9mxCSwrPIdsA
 5GrENXOr5fbkx36dnA5HltWzi5a9LXyGlx0Y0PwsUhBzeF7j3hbNKl3cFRw71zxWW9qyvkfxSOB
 5gSwbali5B51bHRZ/OGiCXNiJNuVhVtfnhYKlMZbVftKC2fZxBpbZYqyfMi3g==
X-Google-Smtp-Source: AGHT+IGxZHjKR5SCMI0IfbjDGhMhOA5BIzHnQ1eSiwRBGeabz2+uUXHR8Rsyhp3v0sQ66agXWWUdHA==
X-Received: by 2002:a05:6402:1f11:b0:5d1:226e:e3bb with SMTP id
 4fb4d7f45d1cf-5d3be715252mr15513178a12.19.1733840214182; 
 Tue, 10 Dec 2024 06:16:54 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3dc2602b0sm5104362a12.18.2024.12.10.06.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 06:16:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 10 Dec 2024 16:16:48 +0200
Subject: [PATCH 2/4] drm/bridge: ite-it6263: drop atomic_check() callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-bridge_hdmi_check-v1-2-a8fdd8c5afa5@linaro.org>
References: <20241210-bridge_hdmi_check-v1-0-a8fdd8c5afa5@linaro.org>
In-Reply-To: <20241210-bridge_hdmi_check-v1-0-a8fdd8c5afa5@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1627;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=rB/0Gsa/+27l3uQdwPdG65mhrhs66t5UJhoR+oY4WrY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnWE1SrdHcDpzN/kkXAE+ciWoTZRgyac4hMJI58
 4e4awoizfWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1hNUgAKCRCLPIo+Aiko
 1c0XB/4wCdakY+iL+5vJu8w6sDWGCs1YreJcnbtzjAEPWnpXIXQe9AtTgrQ7y8qGSCkS94VMf34
 WPn9zTT1BAhvOBqitBey1l0Z/m45w/2OirgOn8X/LJGqXRqGtK0mhvauVdMdfMZszXABfn/BQwh
 A8nuYp6UNxSTdqSudtixSGD8jZmgwOuGHd5ynNstJuhuW9e6S4sRlkC22M2ERLr7WNSFNukqNRE
 KFZ+CW76ORQdCjyTPmRe9ZE3nwpYwf9XQ/z+KfHgK664N6wg53/Nf/f8VkeDILhC68jlJApptwi
 lwG3uuOZwuujl2LZAyWkFqNu2qDVp6b6pOccFcxzDOKBDJ0h
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

As drm_bridge_connector now provides atomic_check() implementation which
calls drm_atomic_helper_connector_hdmi_check(), drop the duplicating
callback from the bridge driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/ite-it6263.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index cbabd4e20d3ebbe632a60f7cac73302815fab7d8..902444317d67e7a65ab05568fbe6f4571c500585 100644
--- a/drivers/gpu/drm/bridge/ite-it6263.c
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -550,15 +550,6 @@ static int it6263_read_edid(void *data, u8 *buf, unsigned int block, size_t len)
 	return 0;
 }
 
-static int it6263_bridge_atomic_check(struct drm_bridge *bridge,
-				      struct drm_bridge_state *bridge_state,
-				      struct drm_crtc_state *crtc_state,
-				      struct drm_connector_state *conn_state)
-{
-	return drm_atomic_helper_connector_hdmi_check(conn_state->connector,
-						      conn_state->state);
-}
-
 static void
 it6263_bridge_atomic_disable(struct drm_bridge *bridge,
 			     struct drm_bridge_state *old_bridge_state)
@@ -793,7 +784,6 @@ static const struct drm_bridge_funcs it6263_bridge_funcs = {
 	.mode_valid = it6263_bridge_mode_valid,
 	.atomic_disable = it6263_bridge_atomic_disable,
 	.atomic_enable = it6263_bridge_atomic_enable,
-	.atomic_check = it6263_bridge_atomic_check,
 	.detect = it6263_bridge_detect,
 	.edid_read = it6263_bridge_edid_read,
 	.atomic_get_input_bus_fmts = it6263_bridge_atomic_get_input_bus_fmts,

-- 
2.39.5

