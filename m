Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73357A14111
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 18:44:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F101110E5B4;
	Thu, 16 Jan 2025 17:44:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="U+70jTvY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 373B310E576
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 17:44:22 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2166360285dso23949075ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 09:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1737049402; x=1737654202;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uBtKYlWCmsTWJXAsi/P2qVR1BJEci/r4rzSkSdKkiNI=;
 b=U+70jTvYo+Or4crUI2Vkzy62kDen3avkCI/qc+Hu4lNkPlNcuFTh15HyzplRwyeO2J
 zXdfzpVleLNQoc8xUZBfVCpr+6GDIt9PwCOnp1YLkQDGyEmPC8xJIBRAjpFTTuzDbzjK
 pQQzFG4LwcZxE0dghQDx6HSSUwZP6oHG2MSzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737049402; x=1737654202;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uBtKYlWCmsTWJXAsi/P2qVR1BJEci/r4rzSkSdKkiNI=;
 b=oQ0Z9xM+DS7VmR1u2GUL3WRAQtGGgmXUBjTSeXAg7SaMuDVcifhSyl76X5h+x5Pm+F
 tFb3eLolcDiGFfU/NPPNhFiJSyEM16wobRjEXgXteN2WviWgNPl5RTDFbNJ0gCmWn6vi
 mmXRBW58f4JUIoDPhd/VGHhshVIUGqylG7EJi4ukE/eqwijzHStEW6RjpD9DRmGoEplV
 hicuvYdkUEINtIWGxXa+tojcNWvqoOgU1vvDgrXV14eJcJoL2IWjMBANFP5QpXc6Y6D5
 5L2d23/8DHQr34lMqu2JDy1WVi7KZAzyI0hFgybnljXqod49gfA5561/QFgGAPSL+FoP
 0M/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdk3NmAjEzl9oHs5gBd12Dr0JCHlunQ8shOMdvCuL4dvJbsVbkaEe5lhFcOORPPmcgMf9cxKLfM/I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyi9mJi9NyJlKJEa6BQYiYZ9rS2yHttzDobQ0lG4QJ/zr6lxNrO
 T+k3YpZwyA1SkIFJTklkiF9zRiG7OPCrOng8q3mSrFcTAJXl5QzdieAnvevirg==
X-Gm-Gg: ASbGncs9KubRceVNk2uj3OKSA62xqZ04wNdoqp5VL9f+qW+1xiDaZPB2njH6J2XcsVH
 agmygE72ydEAnazBRLLcpOqiHRBsfQHeOAHFnwO+wW9nO4pENesyNbewkqMaOqm7zkKk/kMl4RW
 0hntaqFVk2WWeG0H18+dTIO4A0k1QpL9MTTMEIGULZhXTLJ4JSQTPt1UPI9u2wbIDzpujMJML6Y
 lmzen+xcEIXqQGjnr/XAJSH3QOwcNMR19aqyDgwDAabl1stzCOluG5B8dhths0oZgR8I0DRD28J
X-Google-Smtp-Source: AGHT+IEoWJyIWX3XBujOXaws+wrtmniQvJSQSjRB+r+y96gKyl0M0uolS/sv8wolEPPpMrJANi3UYA==
X-Received: by 2002:a05:6a20:2593:b0:1d9:aa1:23e3 with SMTP id
 adf61e73a8af0-1e88d2d5e64mr65470929637.32.1737049401836; 
 Thu, 16 Jan 2025 09:43:21 -0800 (PST)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:8dc2:8743:5c90:724f])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72daba4956esm259207b3a.128.2025.01.16.09.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 09:43:20 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Douglas Anderson <dianders@chromium.org>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 CK Hu <ck.hu@mediatek.com>, David Airlie <airlied@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] drm/mediatek: dp: drm_err => dev_err in HPD path to avoid
 NULL ptr
Date: Thu, 16 Jan 2025 09:42:50 -0800
Message-ID: <20250116094249.1.I29b0b621abb613ddc70ab4996426a3909e1aa75f@changeid>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
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

The function mtk_dp_wait_hpd_asserted() may be called before the
`mtk_dp->drm_dev` pointer is assigned in mtk_dp_bridge_attach().
Specifically it can be called via this callpath:
 - mtk_edp_wait_hpd_asserted
 - [panel probe]
 - dp_aux_ep_probe

Using "drm" level prints anywhere in this callpath causes a NULL
pointer dereference. Change the error message directly in
mtk_dp_wait_hpd_asserted() to dev_err() to avoid this. Also change the
error messages in mtk_dp_parse_capabilities(), which is called by
mtk_dp_wait_hpd_asserted().

While touching these prints, also add the error code to them to make
future debugging easier.

Fixes: 7eacba9a083b ("drm/mediatek: dp: Add .wait_hpd_asserted() for AUX bus")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Unfortunately, I have only been able to compile-time test this code. I
hit the NULL pointer dereference on a device that's nowhere near
upstream and it was running (sigh) a heavily modified copy of this
code where the eDP stuff has been forked out of DP. Specifically, you
can see <https://crrev.com/c/6073744>. It's pretty easy to understand
that the same problem affects both codebases though, so I'm posting
this "blind" in the hopes to at least fix upstream.

I'll also note that the fact that mtk_edp_wait_hpd_asserted() calls
mtk_dp_parse_capabilities() feels weird/wrong to me based on other eDP
code I've worked on, but I've only barely looked at the Mediatek
driver and perhaps others have already debated this. In any case,
that's not directly related to this patch.

 drivers/gpu/drm/mediatek/mtk_dp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 0687672f0e52..ccd104d8851f 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1763,7 +1763,7 @@ static int mtk_dp_parse_capabilities(struct mtk_dp *mtk_dp)
 
 	ret = drm_dp_dpcd_readb(&mtk_dp->aux, DP_MSTM_CAP, &val);
 	if (ret < 1) {
-		drm_err(mtk_dp->drm_dev, "Read mstm cap failed\n");
+		dev_err(mtk_dp->dev, "Read mstm cap failed: %zd\n", ret);
 		return ret == 0 ? -EIO : ret;
 	}
 
@@ -1773,7 +1773,7 @@ static int mtk_dp_parse_capabilities(struct mtk_dp *mtk_dp)
 					DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0,
 					&val);
 		if (ret < 1) {
-			drm_err(mtk_dp->drm_dev, "Read irq vector failed\n");
+			dev_err(mtk_dp->dev, "Read irq vector failed: %zd\n", ret);
 			return ret == 0 ? -EIO : ret;
 		}
 
@@ -2056,7 +2056,7 @@ static int mtk_dp_wait_hpd_asserted(struct drm_dp_aux *mtk_aux, unsigned long wa
 
 	ret = mtk_dp_parse_capabilities(mtk_dp);
 	if (ret) {
-		drm_err(mtk_dp->drm_dev, "Can't parse capabilities\n");
+		dev_err(mtk_dp->dev, "Can't parse capabilities: %d\n", ret);
 		return ret;
 	}
 
-- 
2.48.0.rc2.279.g1de40edade-goog

