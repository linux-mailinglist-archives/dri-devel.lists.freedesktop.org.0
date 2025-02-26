Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 001ADA45934
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 09:59:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF6D10E279;
	Wed, 26 Feb 2025 08:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QkmxyfaR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E2010E2D9
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 08:59:42 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-30a2f240156so68600671fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 00:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740560381; x=1741165181; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CHcNOzm1hcrclCZti3P3V9XcVq0n02C20x1XRNCo8a4=;
 b=QkmxyfaRDwRff/DKixkuzls15wFUBRugACHhP3gfPjppeNndXWTLsgp5q2/vCSQJ3j
 7zdSJEMU/Bzx3DVVU6ZCcN/bFwhJLrb0bIpP3ChXfsJjOUV65nd1AAQJES/yCZ+yIhkt
 tIycrAZCASrqFlORL7kHeBx/3hWltGw7Spo0taJTDoraN7nsTD9N1Ze1lULjjMpGL09I
 8xPCWsWUeEXb3FBdhI4rSxAsEx4Sgawq/uLTE35eOqP7TuHTCIXofVk6CdRrVQUlRya7
 NXw2v+wMo8LTEKkTcyOwaKlrSG0sf2WofQ6yvLYF96/mqnhvrZWXYFUWrpFSg9efQjAG
 Zlkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740560381; x=1741165181;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CHcNOzm1hcrclCZti3P3V9XcVq0n02C20x1XRNCo8a4=;
 b=mO/Afash2+cJ/BFjX6NDbOs7Qv4qcd8uxFWtEwTxZdlo9Pefu4wh30aIReNTR8H1UP
 CMoCm1F27bOww8osg6YNkLv0l7k+FfmMaf7vlreQ29QGBp1c328aBaglIUnLrJ3a+2uc
 rHqlF+WgNldBvH+6P+BSQiGOGHPaPkMGxBu1VHmRF/zOyZXdiPzdEy5xgebnpP2e1LJ0
 f0nYltdyckXmecwjfCgv5+20TEBbAO0IRJYaUcJ4tCfKl3309jQJEUleWiQTrl3RFdHI
 mGC6juhA0KmI8fRny1LZ4kpgy2GXSjLttRaj5QIzhU10BKbYP2DfiKFFZXbq5PuF/MvS
 /VeA==
X-Gm-Message-State: AOJu0YwkaVjEy456fwI3FEpSrR7DoTaPVasuNDyGOMtMfOJ2MDDS7b8D
 zQRUXzaVVsI/ulRv1peXB4IbtFeePrxznZbXeNN/U/FlcibIy2YnFvU2BWoGCh4=
X-Gm-Gg: ASbGncueWa9hYKWie+7npf0Mgh5HSwY3kDuUGTPfeOQhVlPIrfKVEL4hIS7fXT2G5LV
 3Gfi7McV5TVPK0eq/04P4WGPD/S0oL31JE6M0VD23Amw6zaWFiBgbwKoWuYotkq61rf2EUzXdHd
 9OdcJOcV7leVht0cneVH65mOuvZT2y1r+NBfO9cxe1sEMu5qRRE7wkE2Sa/8T4+hBMDhus7Qbh/
 1UieS58NycPtsYO/RSalDRZH6h9q64B8D2K3hc1tq2S5naY2tPboj1sTyez45t/Eu0lGG+an+0u
 1QpqE4XJeFd9olPQ0xW0GHCO9CvDzm97Mg==
X-Google-Smtp-Source: AGHT+IFIstiUWb828AgIqSu/ljVx7698UENLpRl0AsY21WG4mplxCihJ20chMJifNN+VTAFh8RwL3Q==
X-Received: by 2002:a2e:b609:0:b0:308:ec6f:7022 with SMTP id
 38308e7fff4ca-30b791832cbmr23531521fa.17.1740560380799; 
 Wed, 26 Feb 2025 00:59:40 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a819e0c49sm4556641fa.10.2025.02.26.00.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 00:59:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 26 Feb 2025 10:59:28 +0200
Subject: [PATCH v8 5/7] drm/msm/hdmi: update
 HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-bridge-hdmi-connector-v8-5-340af24b35cc@linaro.org>
References: <20250226-bridge-hdmi-connector-v8-0-340af24b35cc@linaro.org>
In-Reply-To: <20250226-bridge-hdmi-connector-v8-0-340af24b35cc@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1225;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=KlCjBmWN3HQI30P1/iEnVtV7zXNb45CFcF9NRTzfcWY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnvtftzKFbgYCMbYXDtuTbkps1sLO/1BiE+TJuB
 fQwesvAqTOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ77X7QAKCRCLPIo+Aiko
 1TsuB/4pVV9CMv49UiMTJIEgL+qiw5buub248rfTYgGygTN/itp4QgFwwr0+m/bI+EZhR80wdXe
 SeTxFF6CBjSL+yR+/JP22/h73WF7RhXo+92/5L+l57liwAENoxErqEu+5X19KIwKlbxnXRNh007
 YEA9AUa3SFYTENk9t44L4glEILLtjW15xp5uR+ImONmslyIE3nB2sIKusOUr3VGXTY+AAMCTNt9
 nfPZckgIIHRwEgyAFl55ZRscpnOgLWSI3mLS9pWbEPFqhOL9IPnVoJ9z5jcApJJiUhjuj7V1nX+
 BApcipfWgqtuiNniAYB0g+s54XmYhvEVgrj/okw70eq6ru7s
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

The GENERIC0_UPDATE field is a single bit. Redefine it as boolean to
simplify its usage in the driver.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/registers/display/hdmi.xml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/registers/display/hdmi.xml b/drivers/gpu/drm/msm/registers/display/hdmi.xml
index 1cf1b14fbd919e041fd7ac8a0731d554d4468f4f..0ebb96297dae80940dc8a918d26cd58ff2e6f81a 100644
--- a/drivers/gpu/drm/msm/registers/display/hdmi.xml
+++ b/drivers/gpu/drm/msm/registers/display/hdmi.xml
@@ -131,7 +131,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 		 -->
 		<bitfield name="GENERIC0_SEND" pos="0" type="boolean"/>
 		<bitfield name="GENERIC0_CONT" pos="1" type="boolean"/>
-		<bitfield name="GENERIC0_UPDATE" low="2" high="3" type="uint"/> <!-- ??? -->
+		<bitfield name="GENERIC0_UPDATE" pos="2" type="boolean"/>
 		<bitfield name="GENERIC1_SEND" pos="4" type="boolean"/>
 		<bitfield name="GENERIC1_CONT" pos="5" type="boolean"/>
 		<bitfield name="GENERIC0_LINE" low="16" high="21" type="uint"/>

-- 
2.39.5

