Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0263153AAC3
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 18:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80CE210EEBA;
	Wed,  1 Jun 2022 16:13:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDBC010EEBA
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 16:13:52 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id z13so2523414ljn.11
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 09:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+I+UyB3gaDAOBGduxnIltchs6IwUUwLGZ1KorhAXgf8=;
 b=YC59mP93jx3kqFL6TDmwE41jd6r7Wr9Duz81GvIgZ5xjLK1EmcKx3ajfJCQnHpnlmM
 0SiEZvngmNOOZKaf7ujE/L49RQrw8JgpQZbspnUvl+wvL0/Ie0SEbP0k7eJV2q4RZsiR
 6UuVRKeh53CNgLO4OjGWqegvYGe3XaELbwRznVIGHK8SPu47x2kh0IFrPqtDTRIspnNs
 MRL28KwGagb3zgFpjaTrT2shbK6uZiEdcp+2SeBxBPl8BFOe7hW77bx+KtCIKmv02juW
 K62BAQ2IQAVOTKwqA/xy00st1A/Iik1KNomcU9eT8AE4Ax0UIZUy7L0GKqrR3Tl4tqdu
 QYyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+I+UyB3gaDAOBGduxnIltchs6IwUUwLGZ1KorhAXgf8=;
 b=fuLBgooEXZCWAOHsqYCsx26+zYi8Ni5LDwdLQpWXL99rJUxWoJmrIAX9oY1l3q1MQj
 y+y5Vpvd2J7y+P0fm3frS0yGV1wLWCZpBfxAji1LPjpxjOj3jONL34rkjJFSfHbXJ2tr
 IXHFM3eRTcgJmqvIHFELlFGZnw2EsHfxpHIwpm4ViB33bmCHE7pLsRkWNVTbXWm0DjWz
 wXwB8k8IcnWjixQLfXbPiEUqQtMO8ewXGwpeWw+RbxLpB9pejAixUH/nMiZc1n29wCGG
 4p+voDYPglAn2cHE/T4UGmW/fsyx+pKZcPiFDq14Uf7YEC7ugmLNTqZTjQaPg/OoEMVW
 fsBA==
X-Gm-Message-State: AOAM5334zVdfVGmdBEl7aEJC5bEEiVedZUhd0xDwWysKCJLg3DWap0mN
 1S7U0hBlc/sgHdpTaj5fj6SzYg==
X-Google-Smtp-Source: ABdhPJzR1vk7pIRkoF1uACdua+p+j7XZ6aU5L+tQ75c8TMnbvNO2GpfgyqyC1WznfffN1nTrncxZ/Q==
X-Received: by 2002:a2e:9b97:0:b0:253:eb92:3440 with SMTP id
 z23-20020a2e9b97000000b00253eb923440mr28964723lji.316.1654100031072; 
 Wed, 01 Jun 2022 09:13:51 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 k2-20020a05651239c200b00479066d45bcsm339545lfu.214.2022.06.01.09.13.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 09:13:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v1 1/4] drm/msm/dpu: drop xin_id from struct dpu_hw_blk_reg_map
Date: Wed,  1 Jun 2022 19:13:46 +0300
Message-Id: <20220601161349.1517667-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220601161349.1517667-1-dmitry.baryshkov@linaro.org>
References: <20220601161349.1517667-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop the unused field xin_id.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index 550b2e2b3e34..e8adb118fa85 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -20,13 +20,11 @@
  * @base_off:     mdp register mapped offset
  * @blk_off:      pipe offset relative to mdss offset
  * @length        length of register block offset
- * @xin_id        xin id
  */
 struct dpu_hw_blk_reg_map {
 	void __iomem *base_off;
 	u32 blk_off;
 	u32 length;
-	u32 xin_id;
 	u32 log_mask;
 };
 
-- 
2.35.1

