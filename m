Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AE83A1ECE
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 23:17:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC886EA55;
	Wed,  9 Jun 2021 21:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A465E6EB23
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 21:17:33 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id n12so33267814lft.10
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 14:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7I80h9aVhqiz7KKnY4LfQ8riY+ihQMK3yCgtkJKzH/0=;
 b=fv1cLJSI3524YDZiumnkJfXc6sFqc6WWnUb1zi0ZoQ6nZx8UbjsJRkvdH4d0t52wAU
 RkQ/tclAVDbWuPCy+RcYD3+7hvMy9LWZgGEREbMEmL29hRg6J+j5DyOPjr7CUZgfGAZC
 fXiTMeGeEKjOWpvz2dhFDlOEfPDTKXNC1naJ8DBq8/NyhLOeIy2ePURzarCgMa7QpGG6
 KfWRWePz5EN1EV7OTWXV1nxNRjdfCFezqlI72OoRxfj1qNBfV4zKIEgHm9GKMkr2tkPL
 OgbGUun88yDH+/Ml9C5z2iF1J0yn73tKmMPfYZWR4LZCH6aZ9iJD83+WQ6frZ+BHomzV
 7DOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7I80h9aVhqiz7KKnY4LfQ8riY+ihQMK3yCgtkJKzH/0=;
 b=DdL+NMD//8Z4bXp0wVPjnmFoFuCQ5MsDbiw20FcibECPcca9E89d/q+/ebj/zSpA4F
 tio+NLeDBigVnDJOZwkaiYxA/Pkw726Nlax/Y5VwmGEup7TZVQ0aXrnPCW+l0g5FrhfL
 CRh8dW2wo7kHGiYNL642d7QSjfHRs0+R6ERWaSCJ+OAMC6GYzGCN7POvLwq9GcvDm1XE
 VBjWpPXOTWy9ERkSCKbZX8yDU8rKQFCi23tpLHdZE5lbOo8vtv7+3fmRVIYwezpwuFWf
 Vr17ptjNxMkmfwdmSy3CBS8I4Rw2129L2iMHXw9wUbSCJvTd2CTUFyop+MrfQeKexouX
 1CWw==
X-Gm-Message-State: AOAM531mPXr+95MCtMfX7B1wRuUqUrgGE+AhSRimRzZ5FiM/y/vwbhXX
 1ggtBHqgcYbEZ31vFrHx6OLxQQ==
X-Google-Smtp-Source: ABdhPJzljl9x2hLLYMZTN0snwVTcfT0Bx/Khf4JdiNZLWRQ15EdGWpJs3mYvySS2N7/VnbAZfH4JXQ==
X-Received: by 2002:a05:6512:20d9:: with SMTP id
 u25mr866893lfr.452.1623273450612; 
 Wed, 09 Jun 2021 14:17:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id z20sm95329ljk.50.2021.06.09.14.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 14:17:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [RFC 6/6] drm/msm/kms: drop set_encoder_mode callback
Date: Thu, 10 Jun 2021 00:17:23 +0300
Message-Id: <20210609211723.2565105-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210609211723.2565105-1-dmitry.baryshkov@linaro.org>
References: <20210609211723.2565105-1-dmitry.baryshkov@linaro.org>
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

