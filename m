Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3974E79D5
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 18:17:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5640A10E989;
	Fri, 25 Mar 2022 17:17:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 987A510E905
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 17:17:31 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id r7so4827842wmq.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 10:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sPZ7FGjoeMWGizm+Tvir8n+ep2Y5gqfNLr6cPfnxdL0=;
 b=QwhQpZiXoY5TVYEr11zMmZ5/ne6KHxjlFBW2/Hw5FR4FrIs5FKHyQACQKH8bld+/Nu
 dqT7jE/l0j4JIRasbWDPOT8ueCgPbeNDIGWGkmqJXNpm6Hp83fe8jZ/1Nx0ffNYJQqSR
 Ej720UwBmE920nZ6u6/NaX7CnJDYHnhutF/+lQRbbtoP9NgV3A33nbW9QmQEh5+Ox/Zy
 d2Vk6Oz+snY7HZPKMcxfOlDfFgw1Oa8o5n1UFv4rKkM2wRN9yg7lQBp1L1A/VgaX7NE4
 Sg3rGnqXCeeFQh2F9R7xmwF3IIcneN77jJF2xxiS3kVdKTEOHMtG1GZ22aT99OGW7Bit
 dRXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sPZ7FGjoeMWGizm+Tvir8n+ep2Y5gqfNLr6cPfnxdL0=;
 b=DLnBegQNjwBWC1DnXzX7yxkcXmfCXOAEYOkvn8PpsceSsch6KeL2xmhxGMAxKFidid
 fugRyGaEoKMviq/tKvSS/bqqeyJ9mVFpcv66VCPC46JHGafWbzzf73bOjlCZs6l98a9E
 Ex39Dfaz8w6b35PCUgEsYWVxkY1whz0CCV8TuC4ypUByI8vyjhSDJP9qd+A+/LcApn7Q
 ICzZt12XuWrLnce1FV/hiEvftoewsJwqzGwFR8h3JfUozBNoMVvn+yLed22klzXezNPZ
 Sk6f9C+tXt1RoRlvBah0tNXhuDmO4FRuUhvTkIz5vDCMX6Gd7DVqwkfpwxZpLx2SdcHv
 10ZQ==
X-Gm-Message-State: AOAM533dPf90SP9+Kg3Yk8uY9THh+lT+b6Vj2pcbSR11BUOeapOUNepn
 N0RgmRnBW7oO0wOPSms/pnFmNQ==
X-Google-Smtp-Source: ABdhPJzx5XeQEx/NjraCkgpGyTOwzN4hvRuQFeGLZUD9Q64Ryk/j+SV+JBkrRHUjiG+2bCFJQXYLyg==
X-Received: by 2002:a05:600c:34d4:b0:38c:5ec7:1e38 with SMTP id
 d20-20020a05600c34d400b0038c5ec71e38mr20281401wmq.184.1648228650139; 
 Fri, 25 Mar 2022 10:17:30 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6240-cc41-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6240:cc41:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a5d6390000000b00203ffebddf3sm7547464wru.99.2022.03.25.10.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 10:17:29 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, matthias.bgg@gmail.com,
 chunfeng.yun@mediatek.com, kishon@ti.com, vkoul@kernel.org, deller@gmx.de,
 ck.hu@mediatek.com, jitao.shi@mediatek.com,
 angelogioacchino.delregno@collabora.com
Subject: [PATCH 21/22] drm/mediatek: change the aux retries times when
 receiving AUX_DEFER
Date: Fri, 25 Mar 2022 18:15:10 +0100
Message-Id: <20220325171511.23493-22-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220325171511.23493-1-granquet@baylibre.com>
References: <20220325171511.23493-1-granquet@baylibre.com>
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
index 4981a3a3b9ca..de2a1c1b4f8c 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2018,7 +2018,7 @@ static ssize_t mtk_dp_aux_transfer(struct drm_dp_aux *mtk_aux,
 	bool is_read;
 	u8 request;
 	size_t accessed_bytes = 0;
-	int retry = 3, ret = 0;
+	int retry, ret = 0;
 
 	mtk_dp = container_of(mtk_aux, struct mtk_dp, aux);
 
@@ -2052,14 +2052,21 @@ static ssize_t mtk_dp_aux_transfer(struct drm_dp_aux *mtk_aux,
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
@@ -2068,7 +2075,7 @@ static ssize_t mtk_dp_aux_transfer(struct drm_dp_aux *mtk_aux,
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

