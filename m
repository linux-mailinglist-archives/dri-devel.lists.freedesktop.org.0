Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7223C2BD9
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 01:50:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 520836EAA4;
	Fri,  9 Jul 2021 23:50:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A506EAA1
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 23:50:33 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id q4so10625677ljp.13
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 16:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XvCGkdShjzVXwoehYqCYEiIRtFRTu+7v5aX+Z4YnzDM=;
 b=pGXH7SAhltogfutLQ/zeZfz62JPmTkJ/1LApDK/tGH5I+dfu/VPri77jJFsBx6qljU
 ohFqHJf6nt6ZnSz59BxmXeKf/nb5F4GqEBVWvMPo5TZXe/VvH8VoIp5pck+9/yZXAsIk
 Kkm2sSChJ/N6c7XQxBd4hoqYSPxCnOFx05VbddU7oSHQmNiWQUMIWBUPKZJG/TyYAYRK
 BOh9UwUXgwSVouoRKTy3HSNj+FEU7TLBI3Ak+qzOuqes8bApRxMADc20X3sRbZh2now8
 mokMI9kuz5B+371uu1CxuDigrcXbgVDUpSOrFYqxtrBj+ojUq9FTklfqZ+2sPzPRMWdb
 QRWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XvCGkdShjzVXwoehYqCYEiIRtFRTu+7v5aX+Z4YnzDM=;
 b=sETeR9TAlJOkqrVSKy/MRKcnTh5jkrRm9ZfvlCKpiiKEpoVQHYRQIS06LYgTiUf+as
 OlAvpgOtmzAd6Y9g6otSsRU1bo87H9/yZ0g4dgJ4iidvdr04Fgnru9SXAXjv9WSHYVqS
 pe29wgeKm7pY/KNpEkzy0vvrp7XhHGxXjdwHfrEITEFH1S6H8lj1Osoa1ORDtJ0MwMIo
 W0XtoKxmVDkGex2vZFh0BjiHLfNf7AUA9BTyBPvlvau4wHFsXtv9Ms8HmE7RrNmxMrPz
 DdHpACYohZx6TFvcZW+Ja1MY1mDNENjF31fXHCu9EcaxVCTdhL+GTDyKRKzNo9I1CxGz
 pGVQ==
X-Gm-Message-State: AOAM533aqH55AmsaRKtzD30UrZv3P0uBLHCul8eXozxI6MeTKu8+dcCF
 trsxmfwR5/vzfg99TnGt+tNHaw==
X-Google-Smtp-Source: ABdhPJySk4bNYi9lDVMKK3/g4W2wWjseacmtJPphy6Gp3sXceQXGIOfFkILwTY3/QUcvU0Q+24r+yA==
X-Received: by 2002:a2e:2e09:: with SMTP id u9mr5443219lju.322.1625874631652; 
 Fri, 09 Jul 2021 16:50:31 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id v10sm718964ljp.20.2021.07.09.16.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 16:50:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v2 7/7] drm/msm/kms: drop set_encoder_mode callback
Date: Sat, 10 Jul 2021 02:50:24 +0300
Message-Id: <20210709235024.1077888-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709235024.1077888-1-dmitry.baryshkov@linaro.org>
References: <20210709235024.1077888-1-dmitry.baryshkov@linaro.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

set_encoder_mode callback is completely unused now. Drop it from
msm_kms_func().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/msm_kms.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 086a2d59b8c8..9484e8b62630 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -117,9 +117,6 @@ struct msm_kms_funcs {
 			struct drm_encoder *encoder,
 			struct drm_encoder *slave_encoder,
 			bool is_cmd_mode);
-	void (*set_encoder_mode)(struct msm_kms *kms,
-				 struct drm_encoder *encoder,
-				 bool cmd_mode);
 	/* cleanup: */
 	void (*destroy)(struct msm_kms *kms);
 
-- 
2.30.2

