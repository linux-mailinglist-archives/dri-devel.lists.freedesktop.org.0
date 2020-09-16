Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDE226C48F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 17:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0056D6EA59;
	Wed, 16 Sep 2020 15:49:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC906E158
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 11:07:10 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id t10so6487120wrv.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 04:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9nu6UrMqV2SVJMMVWIQbvvsBT41Bk/x2/rbQZZMvR5c=;
 b=RPRtBcCg7Nlj0wORAHGE/VDKI3mlLQS/qXvivUL4M7/JW5ECAKalvw72hjSbxez8Aw
 lMCZYbPq15i6bIjwQAxfIDpzMfPNPU/WZzWlPgKpy/oc+Y6L6jiGzWLpVMJB08/BtSZT
 oD2dRBEBNsclb8R+SHrzd4iEmmwYG8+TCQGsqD7GKc1k8aVkk3vybhh7XzdFgXUgO9lI
 QYDm0ol0pN3tx1rzzGaDqWMGc+wiiGj82UfSpSfbYEgpd1LIf+jsy1e4OB0MSuUMFEro
 jQSQHm/io9aXGCi5lKWqazsAZMtxawDIHKwA08vwThJ4DSoOkZZBbBDobGS4XE3i1iKb
 ItAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9nu6UrMqV2SVJMMVWIQbvvsBT41Bk/x2/rbQZZMvR5c=;
 b=d3yiHM9nV2UqX8IA491OVYmvq3rYfIFCWcytWMLl88e6tGIjxGCHNOmV8Tu/LRiErc
 lG/LPehPsT1DOt9ycdQvBoaV6LSwJrWVycwhL5TjTkSFU/6hJWyHxU4Upenx5oTcJtgE
 JWLiW9GOv3hM5UFtFqtrERjYAgt1bDcTVpKFZBJJn4BQt+G0VpGsSJ9BA1PEj4hGu+l3
 iy44z2jENbRFL99dF5JZFPwRSf8MxQz0L/gIjAPXte0Bg4kVJd2BJu9cutCogNo39ObS
 MiM++T709vAP2zAIb/B/KbpAX+VDtL/RD2l/jBitWxCbesGt7xe42+0lwCWJw2/tO3Uj
 0B5g==
X-Gm-Message-State: AOAM530KOqg0OI0HM9zP1sDqQmTFEviTunwik25/qduzyFK+X56x91PA
 99U09Fdb8SglVuDNTIJQXr9q5A==
X-Google-Smtp-Source: ABdhPJzs9y1RZuz1TgxiB6r0FtvUq2fsAnxRCKUrCMfPgN1zHNdHumy2WgbVHV91xEdhhPCKXoSDYQ==
X-Received: by 2002:a5d:60d0:: with SMTP id x16mr25862069wrt.196.1600254428922; 
 Wed, 16 Sep 2020 04:07:08 -0700 (PDT)
Received: from localhost.localdomain ([212.45.67.2])
 by smtp.googlemail.com with ESMTPSA id l19sm4682554wmi.8.2020.09.16.04.07.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Sep 2020 04:07:08 -0700 (PDT)
From: Georgi Djakov <georgi.djakov@linaro.org>
To: robdclark@gmail.com,
	sean@poorly.run
Subject: [PATCH] drm/msm: Remove depends on interconnect
Date: Wed, 16 Sep 2020 14:07:06 +0300
Message-Id: <20200916110706.6671-1-georgi.djakov@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 16 Sep 2020 15:49:22 +0000
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, georgi.djakov@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The dependency on interconnect in the Kconfig was introduced to avoid
the case of interconnect=m and driver=y, but the interconnect framework
has been converted from tristate to bool now. Remove the dependency as
the framework can't be a module anymore.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/gpu/drm/msm/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 5c55cd0ce9f9..3348969460ab 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -6,7 +6,6 @@ config DRM_MSM
 	depends on ARCH_QCOM || SOC_IMX5 || (ARM && COMPILE_TEST)
 	depends on OF && COMMON_CLK
 	depends on MMU
-	depends on INTERCONNECT || !INTERCONNECT
 	depends on QCOM_OCMEM || QCOM_OCMEM=n
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select REGULATOR
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
