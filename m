Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 268B6A3D037
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 04:59:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ABBE10E8C3;
	Thu, 20 Feb 2025 03:59:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ClSaBuSp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24DB810E8C2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 03:59:41 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-30762598511so4526241fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 19:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740023979; x=1740628779; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9GONTdbG86yZro8yaESxJ4TpZYRnEloO1TeuZMx3gBM=;
 b=ClSaBuSpW2tnQFaXpwYdpJLCztSXF0YYnJVVgG9ikma7Jxpz+E9ofkgQU3p0zX9J3u
 kzdPNwxWxdlOTsetNA3CxBF6mLdl0HOnxRI0AUYjf4NZCpTDDAvXDIoO7SiuhFYPagSP
 lqRU/nYVyLiJNjAUydKjoI2q2SqTPRml1EzV7/XDGdnzf+BxmkRYs+j0whmp6/SAhRS0
 8ti3CO20ZNEp3fdVFDzhFuvYHgEChbiMwswm1ZQCIGnHL4LmZPWdcZ4GAMf9mzhL2dQZ
 HCIjBhNNMWT8S0jYDHsbq4mYnyYJqmcj+nAcNN/7neE1u3yJfXSp5cvJIT8a0aJF7ybw
 emgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740023979; x=1740628779;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9GONTdbG86yZro8yaESxJ4TpZYRnEloO1TeuZMx3gBM=;
 b=okHUpYnrSSGVlLdCZr4R92Rj0Wm9v3NJZfAm1d9WkTHbNaqCm8HMqEG0GrHNzV36QF
 8+QkzLDOC7PmMYl0Lohq3LCAjNgc0//BbfBrXuiLgHpGElhkKGMdl4siuN725nJip+kf
 er4QnALMksEujDFzmvg2zd2oVSAEzV23c069F4/sBnIOQg1Ij9xgroKqwDTcRHCKJTVb
 bkWzfQpe195wVL8dQKGnqLP78ee8lo+/SjsgjvqKI7U4E1nSboRy76+rhf+6luEtAh0Z
 x/y8pEbOsyWZ4p6rkB0eTZxcOBG2D3D6ncD2QSHBMdgQpHLNrgHLk67DLA2chXbUz6I+
 AzdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4yLIRtf8YZmdwg0YLRUkm222y4Ia36dIQRmRO9xp5w1LDpQHKuhfj+kaHvWILR1ryrBmrtNg/sI0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPc4jr4yZAZsjbfRTvafS37zoOEgBz7X61GOxihxlE9fgOnzBP
 wJmbjLF6l1+PWYllyWKok/fiWvhsu12t1lyXeqLeoEDzw4aY0/Htnyg2e+XKa0E=
X-Gm-Gg: ASbGncsSGjGTbtO2+SaA1eJxX0nvcKNwMun2jkSSc/CDK9/jH729LrjqkQhIFfIb5RM
 qQoz9MoVqLzjQcu78wtKcornRkN7zVcoiyB1tsPpAk4K2zn4ALzN37y8bdgdhhDjIRD7YfdT93M
 G3yk7r2Wy0Et1Xsso9345yTJDLCATeV8x/Q7Ei3I8KNmeoYe0I41+P6CqlTkkYRCabuwS1SHt1/
 zp11JVjrt7wouM7C42iBejfu+KycJcsp5olOUwn4rc/136Q5W3yQvjUwYFPD5MlFz23f/XrtwKN
 9SvyAdSVxcc8aVPulC9Q8g8=
X-Google-Smtp-Source: AGHT+IEhhy/z8VtOIqW4qjL7UAytFR0EnzQu+f+Os3W5yJxEdSUFdt89d6o9y72QFALZRA2LauuJNw==
X-Received: by 2002:ac2:430b:0:b0:545:3032:91fd with SMTP id
 2adb3069b0e04-54530329210mr6349493e87.16.1740023979295; 
 Wed, 19 Feb 2025 19:59:39 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545225f22ebsm2143909e87.16.2025.02.19.19.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 19:59:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Feb 2025 05:59:26 +0200
Subject: [PATCH v2 5/5] drm/msm/dpu: enable CDM_0 for X Elite platform
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-dpu-add-cdm-v2-5-77f5f0df3d9a@linaro.org>
References: <20250220-dpu-add-cdm-v2-0-77f5f0df3d9a@linaro.org>
In-Reply-To: <20250220-dpu-add-cdm-v2-0-77f5f0df3d9a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=974;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Q0AAoFwflM5C/JzoUWd/DlT7FRIKp6S0uiQ3bl9uOHU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBntqiduKMlpqumEmY5OPFLoCuQXyc2gb70SXzyJ
 mywbLuvK72JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7aonQAKCRCLPIo+Aiko
 1b3MB/wPJEdUn5qcCCIEys0QHQbx0quVb/3EjLjFhCH3MdRYOPBQH1q31C0F4p7f+e+OVF7/QZH
 xS9SxWgd+TAv9ruf2lZt6fOkC1V+laRCZUz0pQsU0dZPi0DArTjuC8YfZxoWN1oSpHfqwriv5Xg
 tBS4RgB5isOHZnrA0R6xjA7DTCyKsAqSJPsj7+5I10eTetG/ZJ4EJ+K2gBmxZ2oKshysEgPCunS
 NQOiT7IognnfI77uzPrw3cTJah8MCWi9ngQp86N3Pm9bBxS19eetcS4UWbDb+hboVDZncBa7rQR
 aM92Cs9GyUESrpBUh37NHHYmUIJpkiONB88BNUMij4JM4ucZ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Enable CDM on the X Elite platform, allowing RGB to YUV conversion for
the output.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index 6b112e3d17da6a4423851525262b66aa6c8622e3..8977fa48926b40d486110424f70344c4d29abe80 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -453,6 +453,7 @@ const struct dpu_mdss_cfg dpu_x1e80100_cfg = {
 	.mdss_ver = &x1e80100_mdss_ver,
 	.caps = &x1e80100_dpu_caps,
 	.mdp = &x1e80100_mdp,
+	.cdm = &dpu_cdm_5_x,
 	.ctl_count = ARRAY_SIZE(x1e80100_ctl),
 	.ctl = x1e80100_ctl,
 	.sspp_count = ARRAY_SIZE(x1e80100_sspp),

-- 
2.39.5

