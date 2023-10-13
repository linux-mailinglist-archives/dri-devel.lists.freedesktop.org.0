Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2217C8022
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 10:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA01A10E0A7;
	Fri, 13 Oct 2023 08:25:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6191110E09D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 08:25:20 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4056ce55e7eso18860135e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 01:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697185518; x=1697790318; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M+uauCSgQKcWUCd6FsYiqka8NNHbjlLVkJ7rYh7s+Tg=;
 b=D0c6RpG11uFJFKXOupuYSTBxMsbSJfOmi36jmwCnOza0ZrUP0rQaRbpwHvrQ8YbQET
 XuPrfitwulEEViFVqYY0Q1POZRCSyjdz9o5LpaxVBvFQQrlMByURZcL+czpZn3V/aIN+
 NUmUCPTj/qXJjZM0Dov5hjR1sOmIHVcukSFT52KH75I8vEqZFYQPpeiV4b0DNCa+mkO9
 OUfMFjSvQrvocXW/5vpk7S3sscmaUYPxEcGy3NzmA+OUkl51yLhPEQfcfvD2n07p2/Ru
 N/Z/p3PsH9umKG5yJMAlwguGFFo0XGYPiuXBkosO/ftFP8ggYMeXaOUu/rVmNr8hzsrH
 viJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697185518; x=1697790318;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M+uauCSgQKcWUCd6FsYiqka8NNHbjlLVkJ7rYh7s+Tg=;
 b=ZBhsmHOWSBY+F8WeOFs7UeH1noGqPwxTNPSJMgELAdsP9j/r4zbsLNVns+GjbnIVMa
 N1bGCnwkCwFpq7pl9ID4oE5Yp9Ivuh4GSxgldtlygp8xNtvvqQZeZxg7d21XtdXd2R9i
 0+jIRNcIlaDYFHE4YpEB6E2VNtvTgKSTuOCU+yu7+cA3M/gYEklY9dpq4DgrXmAMM3v0
 S2PkZ1YWuB3qwpehJwdrkyfqGxx4kSgP8YGb7mt+FXb+JFeAiwK6gpJnpqR9MsDHuk9D
 fxiI2lTeAQNvPLOveetBuz5Ks35eudEhj7qKHVhDM3KwcgEwnqmxKcfYc7r0vOogfSq6
 ADqQ==
X-Gm-Message-State: AOJu0YzzIHv0wBs3ArtOj0EXrgXe5ZcI64ovjsbHdQGC5k9sIvlpIbZQ
 YXvHkMu9fDtYb19kC8U0QFj3ex2Ew8/u5bUn/+w=
X-Google-Smtp-Source: AGHT+IEjRa/nZrp2h3uISb8MvRVIEmCnprt03btuSLuHCUEtgB3tAH3dRRIg0+64ePhtBFCv/YHqZg==
X-Received: by 2002:a05:600c:282:b0:406:44e7:ef93 with SMTP id
 2-20020a05600c028200b0040644e7ef93mr24194490wmk.1.1697185518504; 
 Fri, 13 Oct 2023 01:25:18 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 t9-20020a05600001c900b0032179c4a46dsm20236629wrx.100.2023.10.13.01.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 01:25:17 -0700 (PDT)
Date: Fri, 13 Oct 2023 11:25:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH v2] drm/msm: remove unnecessary NULL check
Message-ID: <ZSj+6/J6YsoSpLak@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: freedreno@lists.freedesktop.org, Su Hui <suhui@nfschina.com>,
 Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This NULL check was required when it was added, but we shuffled the code
around and now it's not.  The inconsistent NULL checking triggers a
Smatch warning:

    drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:847 mdp5_init() warn:
    variable dereferenced before check 'mdp5_kms' (see line 782)

Fixes: 1f50db2f3e1e ("drm/msm/mdp5: move resource allocation to the _probe function"
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Added a Fixes tag.  It's not really a bug fix and so adding the
fixes tag is slightly unfair but it should prevent this patch from
accidentally getting backported before the refactoring and causing an
issue.

Btw, fixes tags are often unfair like this.  People look at fixes tags
and think, "the fix introduced a bug" but actually it's really common
that the fix was just not complete.  But from a backporting perspective
it makes sense to tie them together.

Plus everyone introduces bugs.  If you're not introducing bugs, then
you're probably not writing a lot of code.

 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 11d9fc2c6bf5..ec933d597e20 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -844,8 +844,7 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 
 	return 0;
 fail:
-	if (mdp5_kms)
-		mdp5_destroy(mdp5_kms);
+	mdp5_destroy(mdp5_kms);
 	return ret;
 }
 
-- 
2.39.2
