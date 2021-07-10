Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 017573C371E
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jul 2021 00:20:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA006EB74;
	Sat, 10 Jul 2021 22:20:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA526EB71
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jul 2021 22:20:15 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id i5so2326706lfe.2
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jul 2021 15:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XvCGkdShjzVXwoehYqCYEiIRtFRTu+7v5aX+Z4YnzDM=;
 b=AbSrNyT1Qv0iE0yHJGNbuwMtMN/4W5A+21UiqaoqYP5C3+GsyF5EXW+CZ4Ejww4uyD
 HHzCw7F6vSgxHI2rrZQcRckEyn3zuL3E8wE7nKimNYUVLWzZ0hJPHT8QN7QULxzDaX6e
 WoFvRkVturRh5b8L9ia1Hx+6Ach9VFWXKwHUG6N5+8IyXBLpow8tFJDEWeDjG6+ySp7/
 m6VKPS2YmQDqkNT7EgQobRalVkhqrd9VXrE9EfUQ17EfYKVais0y2kTkLs0v2OSzf/BU
 uhlhb5M/Ow6AouhManNW1e2ZoMMARYaBa9W0JGAHZ5Cu6s7l6x8kdMFjmHtsI/sR0VEW
 7y0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XvCGkdShjzVXwoehYqCYEiIRtFRTu+7v5aX+Z4YnzDM=;
 b=MFcp86yG9/toIUtTMZIcmo21y0QfiJgeDRcQ4lkLAXQACU554rp+K6usmdZ4KvmWKH
 fOlbCRD4MkZ3Q4/PkB2WTI0Ilr2esN66SjP437nOX/yYWjkKqnS4tAL5xOWZlqAbafYP
 CBNDDTnfFko4vfKMOq/1hzItex/IvedctMJ6GJ/vm7Te1p9EBNwU8R6IcTPX6dwNuthF
 ktotmrcQzsh0vcngtlo147K/SvaAOnpJYkTZJhIJ7Dmlqhn/oWKbn4Vm1S4udVi2V2fb
 l+LoW/sGzzOqmWZ1Ul0M0qpMPiMmLCj2hzWOu7NSxzcnAylz10dyuW9/L8XBHPD1ovOE
 xEjA==
X-Gm-Message-State: AOAM532ot7921Snz4OLWhwbyWmqrca3c3QT+XenyHHSqnrGYKwY7i9yx
 XRnx60JmA0LXoGkxHotp0Q3UvA==
X-Google-Smtp-Source: ABdhPJx9go2nTN1VQ1gr4+FIrJMDpmM78pdvL1SfG/6V/+r9kCoyk91v6KNTUw4rFqlWGlYmTF/XIQ==
X-Received: by 2002:a19:910f:: with SMTP id t15mr17444636lfd.287.1625955613994; 
 Sat, 10 Jul 2021 15:20:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id s15sm795466lfp.216.2021.07.10.15.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 15:20:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v3 7/7] drm/msm/kms: drop set_encoder_mode callback
Date: Sun, 11 Jul 2021 01:20:05 +0300
Message-Id: <20210710222005.1334734-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710222005.1334734-1-dmitry.baryshkov@linaro.org>
References: <20210710222005.1334734-1-dmitry.baryshkov@linaro.org>
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

