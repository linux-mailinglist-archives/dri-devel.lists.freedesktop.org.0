Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CAF4E8ABB
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 00:42:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D367B10E9D7;
	Sun, 27 Mar 2022 22:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C34E10E59C
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Mar 2022 22:41:36 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id t11so17906004wrm.5
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Mar 2022 15:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TwcBGQ6dA75HdxpcUCrD8mvsn7/MZTlw7uERAWlwKmI=;
 b=AYDLTANXWRzGnB+sIMp01grvGk/SH+cQkVVSn0Jme+Sp0Hdpav8Wlpi1giPYDpywOB
 f6+XMddOzg//0bbLhJQCLnkfAV0Ch64BSBs9oAbxmdSQ0aFw6LF+1eH4sCXHn+oCWJK9
 HAUXrfbNKPFhPTj2hSbp90b+fYh/KO1rXKZin8vWp75AbJyk6dGaR6kJh+zhJpkys+jQ
 Pk2FkzjQ/WrzkwnRLJGntCY5EY+d50uMvlP3KirJCkkCRn482UEZBSRYDpkR0UJ46DUu
 laMi+vD1+SNfyKxtrkIT5iuFhSooYpFxBbnxJgCDry2m5x5p4qdMYjJqUvDmSn3XsbJm
 bITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TwcBGQ6dA75HdxpcUCrD8mvsn7/MZTlw7uERAWlwKmI=;
 b=y5vnHoVidjZHcXTDb+8WKTLJl0R6k1y7GIBQt/mT+HwSYABO4m9VM9D93cQtqWh4G0
 ctO3eEGocLquJoXEN27UesBhZvinPIh/n3RZJSRo3/bXOJBl41zNPKXdCR6yPIcCWs4D
 V0V2Ty+2JOqd+08DnrNeZEIyBtB9MLYtkBK97fun3BDpyYNOloBCbuCU8nSlAPjPOpPh
 XYwhZj/vHPHyXAbik8N4UVMlNnXtgCWHDef9VsYBszpIF6uYh0EeWfloc92f7Qs5M+7o
 UVZEU+nnw9ueyBhmO8KJU0XBxgF0EABVHjFHQHCnfxngb+vnGlDFLon/9CTCS394NNg8
 BIwQ==
X-Gm-Message-State: AOAM530oCL48IggRdokGuPyYqKhVehoPsF6ZuMBO5ruRu+pbk344wbS2
 6Nu4ahjQnsUNTMmQSSMIbRolvw==
X-Google-Smtp-Source: ABdhPJysfkYMrMgHwodSSnzMkqerBi1jwSuIF2iefWJ4/FcOg7MYEeM+UjIlCWYlQv0Ck0GULeS7uA==
X-Received: by 2002:a5d:6daf:0:b0:204:12b6:a15 with SMTP id
 u15-20020a5d6daf000000b0020412b60a15mr19676354wrs.340.1648420894641; 
 Sun, 27 Mar 2022 15:41:34 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6341-357e-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6341:357e:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id
 v5-20020adfe4c5000000b001edc1e5053esm10400867wrm.82.2022.03.27.15.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 15:41:34 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: airlied@linux.ie, angelogioacchino.delregno@collabora.com,
 chunfeng.yun@mediatek.com, chunkuang.hu@kernel.org, ck.hu@mediatek.com,
 daniel@ffwll.ch, deller@gmx.de, jitao.shi@mediatek.com, kishon@ti.com,
 krzk+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 matthias.bgg@gmail.com, mripard@kernel.org, p.zabel@pengutronix.de,
 robh+dt@kernel.org, tzimmermann@suse.de, vkoul@kernel.org
Subject: [PATCH v9 21/22] drm/mediatek: change the aux retries times when
 receiving AUX_DEFER
Date: Mon, 28 Mar 2022 00:39:26 +0200
Message-Id: <20220327223927.20848-22-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220327223927.20848-1-granquet@baylibre.com>
References: <20220327223927.20848-1-granquet@baylibre.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jitao Shi <jitao.shi@mediatek.com>

DP 1.4a Section 2.8.7.1.5.6.1:
A DP Source device shall retry at least seven times upon receiving
AUX_DEFER before giving up the AUX transaction.

Aux should retry to send msg whether how many bytes.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index e099491cc6a4..7a197c4a7143 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2016,7 +2016,7 @@ static ssize_t mtk_dp_aux_transfer(struct drm_dp_aux *mtk_aux,
 	bool is_read;
 	u8 request;
 	size_t accessed_bytes = 0;
-	int retry = 3, ret = 0;
+	int retry, ret = 0;
 
 	mtk_dp = container_of(mtk_aux, struct mtk_dp, aux);
 
@@ -2050,14 +2050,21 @@ static ssize_t mtk_dp_aux_transfer(struct drm_dp_aux *mtk_aux,
 	}
 
 	if (msg->size == 0) {
-		ret = mtk_dp_aux_do_transfer(mtk_dp, is_read, request,
-					     msg->address + accessed_bytes,
-					     msg->buffer + accessed_bytes, 0);
+		retry = 32;
+		while (retry--) {
+			ret = mtk_dp_aux_do_transfer(mtk_dp, is_read, request,
+						     msg->address + accessed_bytes,
+						     msg->buffer + accessed_bytes, 0);
+			if (ret == 0)
+				break;
+			usleep_range(500, 600);
+		}
 	} else {
 		while (accessed_bytes < msg->size) {
 			size_t to_access =
 				min_t(size_t, DP_AUX_MAX_PAYLOAD_BYTES,
 				      msg->size - accessed_bytes);
+			retry = 32;
 			while (retry--) {
 				ret = mtk_dp_aux_do_transfer(mtk_dp,
 							     is_read, request,
@@ -2066,7 +2073,7 @@ static ssize_t mtk_dp_aux_transfer(struct drm_dp_aux *mtk_aux,
 							     to_access);
 				if (ret == 0)
 					break;
-				usleep_range(50, 100);
+				usleep_range(500, 600);
 			}
 			if (!retry || ret) {
 				drm_info(mtk_dp->drm_dev,
-- 
2.34.1

