Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6034A35EA7
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 14:18:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B903610EC93;
	Fri, 14 Feb 2025 13:18:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KdgoSTjN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77CBA10EC91
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 13:18:04 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4394a2af558so3116385e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 05:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739539083; x=1740143883; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WI6/TNYNauOLLkWpwha0LbPDDPCCxmIwr+Pcoxb9Ezo=;
 b=KdgoSTjNnb02qmyIsSwXMgSCItagwIWQOZEYcZWsPnveGE752ePZ5xbHXjQJusDbX3
 dFFdFhQ8f9lmpL36sWcw44LJU+broW4g/GDA4BlDUSVtRP/jIlL7vSCBrH9Q6vnIcU9n
 OYrCXEv4tPqTTRyh2YKPrE23eeAy8ihjfTeCHea+GtUr5g2NqjEb54SChqxv8VgE1zc/
 l000rXjxWfEb+r953fIJCrDf4MAO2DS0IBKXqzW+59O6qNb4e+mW3keLL1Ii6P0nekr1
 J8T6q2DbzBDosZLw/TAoJHX715VE1h/6wBeXiyd2HBzrmo6ALCvdE+d8MbmOywEuoGJ2
 bXCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739539083; x=1740143883;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WI6/TNYNauOLLkWpwha0LbPDDPCCxmIwr+Pcoxb9Ezo=;
 b=F7VkVWyH5u6/1S6Q3MzUBQjM7+lbB8ZXEGibgFnawBtgIj5/rudd008niE0i8GRF6y
 +MhgILekDwA+WRMFs6lsTtPmq/+U2ovqFTzyupDhjeIcoFSC86/l1aLpYBGHwoUMj2jV
 3TCb/2H+uW9c4ooRaOWZzwbApzgcwsJgkDBdAzfXFDpPw67Z2e4cKIrEUQY8RikMcfG+
 94nei6IvL8AzJT2+aENKhqYHB29wcNbM/qBKVCQ9XIMEq7Y7AMLVfdAsKylyKHQ8QYGj
 MPxEfNQqc1dnGCRvCtlg78KL6chKNpG5qxJrASITKGB7+5tbj0rOcPx+zyUeDPxc8wAu
 W8lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6vqOL3NAec7SFd92tecnMMnUQuns/zFiptKrezRQu6jaHEoeODKvWWhcV1U+rZ2HhaaoWq3nYqew=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzLv/qg9iL8WPuAAqMKtGeLAJQ1ZTnPmNwvCq6QpmUF6Zn9HZv
 +9Hd96HGyLH3cbx18Fbj5EEnS2degcJ/ccA2x/9TZJrVcoA/xpKHIoFRXRj91Cs=
X-Gm-Gg: ASbGncuYFWsXy5jcSDNXtz08377bIa3XKNj6KnDQYmUI4nFrSZYX2xryfoOZHQTPVfG
 fW3w6G0JktOKDgq/z55nR7H/yCcxBbk/PvX53A/yEY1O6sduUI4acnIb5kYcvtcS0X+FKAG5EoQ
 LdiFqUCfip5shuxHBahgimrMTWN/WACxJHkJ+bQFPcw8eGXygMZcbViMLI6baVCc4UgttyyotkR
 lnjM/EWW/JjDX87Ixcbr3PHNuOLM62drtG6CxjlbAIEIu2EF+LTuypeuZ9VsJ9yccc/PmCRsyZ0
 MNUyOqAU05E+cZMRhkDUMNRZqYmSbWo=
X-Google-Smtp-Source: AGHT+IFL1PyC7Gr+eB+jAKZETUep7XKaMZD3nNdLMQxR8ZPDBgf5ouh3/XF1rDv2ZuwsE2CUo4Jr1A==
X-Received: by 2002:a5d:6484:0:b0:38f:2685:8457 with SMTP id
 ffacd0b85a97d-38f2c5e60e5mr1589269f8f.0.1739539082916; 
 Fri, 14 Feb 2025 05:18:02 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5655sm4607690f8f.77.2025.02.14.05.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 05:18:02 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Feb 2025 14:17:47 +0100
Subject: [PATCH v2 4/4] drm/msm/dsi: Drop unnecessary -ENOMEM message
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-drm-msm-cleanups-v2-4-1bec50f37dc1@linaro.org>
References: <20250214-drm-msm-cleanups-v2-0-1bec50f37dc1@linaro.org>
In-Reply-To: <20250214-drm-msm-cleanups-v2-0-1bec50f37dc1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1080;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=d16enuUHr2tsjXZlT4oW1ZXn1HEuh8ApCU8a6MrU7bs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnr0KCwJWc8DDG4UnvVS1DRfS8YoAu1sErX0eRq
 9XLMHspTXeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ69CggAKCRDBN2bmhouD
 1wymD/0XLt6GJCvc0hRmyqQAQeQ2Xl6T5oInv1r89dudN+E6TGz+0kVkW66XvIlulKZ5QbZZeZt
 XLP1rhSZTNo5C4hsYZJ1FXXS6vFbrpiJHMfXtrDAFebnrfp0oGDCaoPfj+2JuCPPh3EId3Fo2pV
 zgKF6maGiUM1mfNUQ/TzH/wRuMKhVM7d/efMHMf/lAtZcRkra4lSoH4slPLQF/iBN1dHa3cIQaJ
 R6pJwOQ501mGT9ovA26GCWVN3a68CfGlgO8q+NQv7ZTcP3/cMEIGmoI5RUUnhfUlf4G886LbPaT
 nLlZUg6neWgVaCkcAYry6hPxjx74KuWlJ+7QIVeumlWICWwCRDNAoMMK2Hx56xG7z/z1RvxSPF/
 ECVYAUoz6x8S8yp4tfSsxN1/o4FQqH1rYX8L/AslqjaUxcog0B+PdIuRmPRrCTBWir2DSJr+IUM
 oVPxb25Dc8eZV+jjjkmXjbkitDNLYwGdEbst4YLnf9vo3u1CphW80Em4SF7Lsgh+rQ57IgWnsRm
 Siweuta9/F+p9n0frosueEF0hVXodaPwyq3iQ7EHaARqq1qDrSFFalI45hxFiMpdq5GlmZPKARq
 fD4AZ1bLjVVQ43zSmqGTq8a5F5AWnRsKF8ZVcyQS2Ym0bQY9b48rsBFMXfBQSTN7bQBuTMITJzV
 P4QTwq+mvFuP70Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Kernel core already prints detailed report about memory allocation
failures, so drivers should not have their own error messages.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 051e26ae1b7f20d47969c3aff4e7fc6234f18d1a..2218d4f0c5130a0b13f428e89aa30ba2921da572 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1910,10 +1910,8 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 		return dev_err_probe(&pdev->dev, ret, "%s: unable to initialize dsi clks\n", __func__);
 
 	msm_host->rx_buf = devm_kzalloc(&pdev->dev, SZ_4K, GFP_KERNEL);
-	if (!msm_host->rx_buf) {
-		pr_err("%s: alloc rx temp buf failed\n", __func__);
+	if (!msm_host->rx_buf)
 		return -ENOMEM;
-	}
 
 	ret = devm_pm_opp_set_clkname(&pdev->dev, "byte");
 	if (ret)

-- 
2.43.0

