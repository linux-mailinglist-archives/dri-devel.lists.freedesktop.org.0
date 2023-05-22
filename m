Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E80B70B6F3
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 09:48:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BD6710E266;
	Mon, 22 May 2023 07:48:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A27010E261
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 07:48:08 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f6042d60b5so8451285e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 00:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684741686; x=1687333686;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7XMgaZJPGsrQVomCNqgAU3/ENZApSDLqMYm/e5VaXxw=;
 b=o1KZiUY0+94ILPWC9thOe+05sNJsT9m47nDU9niy/0e+Elik++Sfj78+DVBL89cSHw
 pw4lEj5H243X8aAV66ocyCPQNAYaUgr9QOYT+kLkLWdwbY6nWhoNBY26yB3ODLy4RA6J
 7HaK5wNYk0LPiIeKAoo913TUJO/NwBPRJ/JYKqZWPDdr5rM/YQ/bLo8HHP9BRwlnAy5R
 9bIiARG8Khqs/BCjGKx9oiNwBwegb4HHHLZeiCEZkkBhRyC8c9ek0znXbEUY4jgNyu6g
 kga1xHYITtKp7GVxEhCjlR4KFZAATp/jP5I+KiiX/ktmxA3QN1m6A+G5dMeEwEOL8+Nv
 9Itw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684741686; x=1687333686;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7XMgaZJPGsrQVomCNqgAU3/ENZApSDLqMYm/e5VaXxw=;
 b=dT5u01rvPD7n6LfJcYF+mOk4ndB9XNrCHe9UPjIgxnejQ8jQ6ESryl0+z3Xd+FH1l7
 7qPg2x6cVuz1OSO9k9700vChgtNY5b5YNT9ks3G5wSJJowciif6huAyDnMbiRB80eQKp
 ssJNahb/DQKCa4O3q/XKPp9itI4IYQx3ASm+Ew6RQZgoeDv9uL8S7SxlXc2IlEV0Oem/
 fskd2SrX08jfcmDwWJPoTnyEFQU/w1xAm6Ih1ShyaQHxFCNvvVp56wSsQWdhu9RRUWOV
 NeatG76AjvFC440dmznDhBhVDDSvhQVo/dZesGH0vx6WYvCwEwvj67zxCpfR9UDS2h4F
 zcdw==
X-Gm-Message-State: AC+VfDz8HslSD9OjWzd5snT7cc/cNIqEySsqZTqjeG922kKczmPpcdl2
 maSQkkodMfZ2fYvR4jv0IqITjw==
X-Google-Smtp-Source: ACHHUZ45kpDtJdUknRe4eZfAOKeBPDqYXozusnHk6IjXHiCBaDluwN8/yjIW82K5hNfL27FxQcI/UQ==
X-Received: by 2002:a1c:7512:0:b0:3f1:789d:ad32 with SMTP id
 o18-20020a1c7512000000b003f1789dad32mr6942704wmc.11.1684741686242; 
 Mon, 22 May 2023 00:48:06 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 m13-20020a7bca4d000000b003f4dde07956sm10636763wml.42.2023.05.22.00.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 00:48:04 -0700 (PDT)
Date: Mon, 22 May 2023 10:48:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jeykumar Sankaran <jsanka@codeaurora.org>
Subject: [PATCH] drm/msm/dpu: signedness bug in
 dpu_encoder_phys_cmd_tearcheck_config()
Message-ID: <897779a0-1a1f-4193-9dd3-bc4f87e73e3c@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Cc: Archit Taneja <architt@codeaurora.org>, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The "vsync_hz" variable is used to store negative error codes so it
needs to be signed for the error checking to work correctly.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 74470d068622..b29e6d1ba7f6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -320,7 +320,7 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
 	struct dpu_hw_tear_check tc_cfg = { 0 };
 	struct drm_display_mode *mode;
 	bool tc_enable = true;
-	u32 vsync_hz;
+	int vsync_hz;
 	struct dpu_kms *dpu_kms;
 
 	if (!phys_enc->hw_pp) {
-- 
2.39.2

