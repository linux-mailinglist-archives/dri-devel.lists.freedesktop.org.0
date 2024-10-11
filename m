Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8DF99AC8E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 21:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF8A10EC29;
	Fri, 11 Oct 2024 19:22:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PRUJsmPY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A90D10E1E1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 19:22:26 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-37d43a9bc03so1339408f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 12:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728674544; x=1729279344; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4kBIYBhNJLveBi0X8buyeW3/XiOUmPsQpigk1+cdvIw=;
 b=PRUJsmPYdB25ZmYBXJD8dZpBynX0DTJZMNnSAeFcOR0rJPev2Jf8wmAfbyxxXf/E7a
 /mJr5BFU/dkoSIi3QGtrDzSjOHrntwCnZ5CnqeYvm3bCvGcIum2cndj6m/NPFtKHsB0M
 vR3r8f8dhzM6uq1OpH1w6GCRDVGHeyFXdEK4aDONAYUkPWRtFFoIlaAxYkB38fHkVhty
 gzrculOAfBpYNLTYpO+JyPOFI5jJvcbwLSgeQg12VAKc5bpY32hR3xtt6oeVtOSgvh3F
 LOOzTc3TAnc0HmQytxKjcmve8PVX32ewu1m/qIbkr/MmUb3P49c7jqomBFo8x147N9/h
 2SxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728674544; x=1729279344;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4kBIYBhNJLveBi0X8buyeW3/XiOUmPsQpigk1+cdvIw=;
 b=vhhLy9vmbvmxF1ByElRkzyMEjRmb1QZyWrCtKPjReGDi7mBkFXFK52aCwvo69bswFI
 eQK8uUnC0mZ+zDfNnRTnpNnNy62gmV0Dm9Z8RA54ix6mV8rgEMn01NittlFKUmv81fP7
 XOiUOz4IKJrPHwVxrkrIgGex5zegjgCF+aQViM9exUSy1Phsi+M2xP4GBRDcTs6uDHtd
 begqvGo7lgyTY1OkMNfpUL1XjCEjSdpzu0ZaWjksr9JBoiMxMviCL3OWFmtJc54KgUjj
 EVbr88Jd4slixZZLvH3RdY45QUx/VhqI0FMykfZ/yHF+Z+swf91ZTrNYYz+SEgbK/UbS
 OjWA==
X-Gm-Message-State: AOJu0YzwbCai38JSUiy11+3h7tBsvqJwMSaC0a7gF+0kXbKXosIkaj2H
 ykP1k+T6meAeVVUO1uj8HtgLN75VR32ub7dHmZeA1VGKaI9PMqMvGEvBr27J
X-Google-Smtp-Source: AGHT+IEPObY61TTZUljSGVbxJ83DtlRp1vP8GuFprN167lb4Pr6rcaZZVUv+UkSSbZYzG56rZDvzaA==
X-Received: by 2002:adf:cc8f:0:b0:37d:4937:c9eb with SMTP id
 ffacd0b85a97d-37d5feb13acmr443072f8f.21.1728674544198; 
 Fri, 11 Oct 2024 12:22:24 -0700 (PDT)
Received: from [127.0.1.1]
 (2a02-8389-41cf-e200-55c0-165d-e76c-a019.cable.dynamic.v6.surfer.at.
 [2a02:8389:41cf:e200:55c0:165d:e76c:a019])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d4b7ee49bsm4581663f8f.100.2024.10.11.12.22.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2024 12:22:23 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 11 Oct 2024 21:21:51 +0200
Subject: [PATCH 1/2] drm/mediatek: Fix child node refcount handling in
 early exit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241011-mtk_drm_drv_memleak-v1-1-2b40c74c8d75@gmail.com>
References: <20241011-mtk_drm_drv_memleak-v1-0-2b40c74c8d75@gmail.com>
In-Reply-To: <20241011-mtk_drm_drv_memleak-v1-0-2b40c74c8d75@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, CK Hu <ck.hu@mediatek.com>, 
 "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728674541; l=1023;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=GACFWz+z5+whIxiIEf5wTm2vjO+WqH2Y46iheppGzXc=;
 b=ctsLXzl8itXZ6YjbYlz1K50LW7nQRM1QFq2Ygrbx/fh9qsjr38w6zeU3uGz61wTvN3/n+WyDJ
 l0VO+LnC28wBFlo1TkzxIJ42L0f2a0eNe3vsDXXc4rOBCnHRlQ/or2M
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
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

Early exits (goto, break, return) from for_each_child_of_node() required
an explicit call to of_node_put(), which was not introduced with the
break if cnt == MAX_CRTC.

Add the missing of_node_put() before the break.

Cc: stable@vger.kernel.org
Fixes: d761b9450e31 ("drm/mediatek: Add cnt checking for coverity issue")

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index a4594f8873d5..0878df832859 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -406,8 +406,10 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
 		if (temp_drm_priv->mtk_drm_bound)
 			cnt++;
 
-		if (cnt == MAX_CRTC)
+		if (cnt == MAX_CRTC) {
+			of_node_put(node);
 			break;
+		}
 	}
 
 	if (drm_priv->data->mmsys_dev_num == cnt) {

-- 
2.43.0

