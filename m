Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E8C946C44
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2024 07:40:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9096C10E0D0;
	Sun,  4 Aug 2024 05:40:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xe5eBr4b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B40610E0C8
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2024 05:40:30 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-52f00ad303aso14144641e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Aug 2024 22:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722750028; x=1723354828; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=D/cm1jjd1/iMw8x+MPa4aHpCJxIMLcu4Yu6VZJrkd+4=;
 b=xe5eBr4bL0VCWQuEvTQ1vb3NBT3eKG/KNBhi0mbXp+aV+864b3HsaLaC/Vd2o2lt8W
 KbK/SA1VZoMqW6EJkmUCBrR+yiNX7iZ6Esiy0RXpovV0HU9qY+DoQjCfbWRLgQhIGN02
 uY8rcJfxU0mh5PM4Gyiyw5MWyzkdk5vjt94qsxJOcj9FWbwPCofBpZq/sRKG6CwWKFhH
 grK21e2KzrAkJlK5xhvLWU1cyl5gemYG3RLix0G6Fmz1oUJwBateE8fy/JOPkhvaQ9CY
 X03KdKqM5ZdnJtz6schCuk4VAkiExq5LYLmyr5cJaLjBZMgycxB6nVnsxau93P3fnZ9/
 Zb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722750028; x=1723354828;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D/cm1jjd1/iMw8x+MPa4aHpCJxIMLcu4Yu6VZJrkd+4=;
 b=IEDii3CrtbX8akost5lBS4WqlP80dLEx94Cvg5ogEahmh9bgiZO1atQCEOrGnBCupM
 Ovg7prI3gxFRbjqp5EiWXHdmyxzSC7bE/63FYR43vWqKoHTNUosGGGME0P9X5j2nb4LW
 TNtJ1fLIFYAjnHcDl9kejhri7CyqzjsBlTR2oZKUIXcLa4DEsoYgK+0SWBXbWnlRCTe7
 3gXnLTuniiG/QeD8W9v8k2jJRq7h0mg1kdduBc2zwGx1kejGF6PtqoxrqIA+jJc1yIBr
 M13Cs3+TzLCg0iqxMeyU3pglkuPHiPoLy/jdy42s/KkqR+PaRStQ7+JfSYTeisdrl1rv
 o7sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/FTfqyzyc/+HPzeo/1djzGFGOUrB3Vrl4u42pocJQiXpvc5JgKlPIJFjOpobsp50rQlX9gdolEKzeIh9rOApCT0JAOy/TF7tBpr4MOp4Z
X-Gm-Message-State: AOJu0YzsI/A3tlRBHXEHePaX8grTurmRU1DqU0I6zhXJIGivDCrHCCqc
 rvIRVO/Jsk+ivC8Os3na+7+etI075Zcu/rGyr2OCGkuuQnblrBIZ4oJzp64FhUk=
X-Google-Smtp-Source: AGHT+IE6GCHKaYeu075bskYasZyEb1ipCnNJJfXpONn3eXOF68PSgyACnVQniJRme2MpKU/LdTcexg==
X-Received: by 2002:a05:6512:eaa:b0:52e:be1f:bf8b with SMTP id
 2adb3069b0e04-530bb3d42b1mr5422436e87.47.1722750028079; 
 Sat, 03 Aug 2024 22:40:28 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9bc3bd7sm292248466b.34.2024.08.03.22.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Aug 2024 22:40:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 04 Aug 2024 08:40:10 +0300
Subject: [PATCH 06/11] dt-bindings: interconnect: qcom,sm8350: drop DISP nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240804-sm8350-fixes-v1-6-1149dd8399fe@linaro.org>
References: <20240804-sm8350-fixes-v1-0-1149dd8399fe@linaro.org>
In-Reply-To: <20240804-sm8350-fixes-v1-0-1149dd8399fe@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jonathan Marek <jonathan@marek.ca>, 
 Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Georgi Djakov <djakov@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mike Tipton <quic_mdtipton@quicinc.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1599;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=6M151A/97deCg4Tzy6kbdcdNo2uWiEunw9WlWKXXE4A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmrxQ/a5ai99IBr5oLB8ihNDDVEDnC6eztQD2HB
 FkuS5H6ISyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZq8UPwAKCRCLPIo+Aiko
 1ViwB/9juYoqen35TB+9r5HLnBBlnG536bV8RJOZZNMkwuu/waZjRhGhQ2VDNJczXk5zaGvPOvG
 drisN5/S9gg+LmPxTOxmaCZv1CQWFlrokspmyhOPC+aAksf2Qo2dmfMbTMsGQDYVBKrWtiCsame
 0gWlHLYx878V+EPtrF/d0XvSJznPWW74EKe90xRKbd5McrDXSsEwIhimLUZH/ZbhbZ+E+LmbGdB
 MagDA5tAYUGDxowGRVXnmmW87XayUf1XbWy6FJqt0XyWJJjHVm6R6ZISzAKPHVNF/95idOh10ON
 v68ACSaDApfvmxV2mBKHgVWLDfKCncRi2s4pDsve1YZjiwDV
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

Vendor msm-5.x kernels declared duplicate indices for some of display
nodes to be used by separate display RSC and BCM voters. As it is not
clear how this separate BCM should be modelled upstream and the device
trees do not use these indices, drop them for now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/dt-bindings/interconnect/qcom,sm8350.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/include/dt-bindings/interconnect/qcom,sm8350.h b/include/dt-bindings/interconnect/qcom,sm8350.h
index c7f7ed315aeb..2282f93607bc 100644
--- a/include/dt-bindings/interconnect/qcom,sm8350.h
+++ b/include/dt-bindings/interconnect/qcom,sm8350.h
@@ -119,9 +119,6 @@
 #define SLAVE_SERVICE_GEM_NOC_1		16
 #define SLAVE_SERVICE_GEM_NOC_2		17
 #define SLAVE_SERVICE_GEM_NOC		18
-#define MASTER_MNOC_HF_MEM_NOC_DISP	19
-#define MASTER_MNOC_SF_MEM_NOC_DISP	20
-#define SLAVE_LLCC_DISP			21
 
 #define MASTER_CNOC_LPASS_AG_NOC	0
 #define SLAVE_LPASS_CORE_CFG		1
@@ -133,8 +130,6 @@
 
 #define MASTER_LLCC			0
 #define SLAVE_EBI1			1
-#define MASTER_LLCC_DISP		2
-#define SLAVE_EBI1_DISP			3
 
 #define MASTER_CAMNOC_HF		0
 #define MASTER_CAMNOC_ICP		1
@@ -149,11 +144,6 @@
 #define SLAVE_MNOC_HF_MEM_NOC		10
 #define SLAVE_MNOC_SF_MEM_NOC		11
 #define SLAVE_SERVICE_MNOC		12
-#define MASTER_MDP0_DISP		13
-#define MASTER_MDP1_DISP		14
-#define MASTER_ROTATOR_DISP		15
-#define SLAVE_MNOC_HF_MEM_NOC_DISP	16
-#define SLAVE_MNOC_SF_MEM_NOC_DISP	17
 
 #define MASTER_CDSP_NOC_CFG		0
 #define MASTER_CDSP_PROC		1

-- 
2.39.2

