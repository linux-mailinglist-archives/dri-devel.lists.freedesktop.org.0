Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFD63BFA35
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 14:29:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C2326E8C3;
	Thu,  8 Jul 2021 12:28:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D57D6E241
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 12:28:52 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id p1so14898586lfr.12
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 05:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7I80h9aVhqiz7KKnY4LfQ8riY+ihQMK3yCgtkJKzH/0=;
 b=dZAt1g6wH7fjpFQDlowAYZN8LtG7zjesMmpA6jmrhqhJAE1HfXHW7YzFzwRvWx1byI
 Dt012MPl6hYgduqdcjBogdsG+Fvg/tvP5s3Hj1WX86YPrM2GkPc7RjLF3Iii8SroKNkM
 3ug7axUM0HJ8atvA5l08Qn/Zsf62TUILw9Thg7Ti0tAefyhiVF0TZfl8RgaJ8n8Yym14
 gYCdCim+evV7ZlnE+Ia1nU/qUgExdopbWe4jkbAtNM2XJOhoCnZjbyPRvQuBOaOBYUsD
 ZcmYp7kCvy5GjvBBAhN/qElPHe0llzlsIdCEbNDzsRK8FMo98+xUtB+q1HCz2q7LRfpt
 O58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7I80h9aVhqiz7KKnY4LfQ8riY+ihQMK3yCgtkJKzH/0=;
 b=eg/O65ut0CKjx4qq9meK+gL5cjpkYqJK2V8A50RthGpo5fAzDAkc3z4vXyn94UJf+S
 ED1KP9P7bg+D0uWjLUlJfIQmOJlb7BjY/NrKPZjuapRS4hRrLpVEeIdE05fBt7JaPtfN
 eaF7RvD24da3YS4w6/H+GVSEnaR9gWUJAjJ/NNbQznOeJlJzD3OxX0LdPArY9PMEOrIe
 C4PJVRZFIp19Ydcq8CHaBy2t8wv6fLjT2Aadk8IRIK11LQTfh7xmYPjZYpYxYJupO2pw
 zj41y0zVG8DzDg9sDYI4X29GfwqG+piEv8LGria7qaXxowPJMhhu0WLZqlMv/nIcDWkU
 F2KQ==
X-Gm-Message-State: AOAM531NeGfjcDqKR0NOmjI+Uzj2u+17elOS7IOwinEg/8RVqB70vCDd
 TrLoOs2fPz9187psYQYqIAEllw==
X-Google-Smtp-Source: ABdhPJxcesU2QBAkJa39kbKnQyTZPVM6HeuqpeKl/QOq4QlQUQTGSkaTJaHkvInbFM8r2vb4I0+J8w==
X-Received: by 2002:a05:6512:1385:: with SMTP id
 p5mr24551389lfa.447.1625747330880; 
 Thu, 08 Jul 2021 05:28:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id f1sm184368lfs.211.2021.07.08.05.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 05:28:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v1 7/7] drm/msm/kms: drop set_encoder_mode callback
Date: Thu,  8 Jul 2021 15:28:33 +0300
Message-Id: <20210708122833.363451-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210708122833.363451-1-dmitry.baryshkov@linaro.org>
References: <20210708122833.363451-1-dmitry.baryshkov@linaro.org>
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

