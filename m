Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B12F946C4B
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2024 07:40:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5887F10E0D5;
	Sun,  4 Aug 2024 05:40:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iyVpT5nk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B113A10E0DE
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2024 05:40:34 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a7ad02501c3so289206566b.2
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Aug 2024 22:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722750033; x=1723354833; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jZj9/52rwWNE6aCx1N5+a52yjuW6g5rJuFXIxcVgEH4=;
 b=iyVpT5nk0Z739YB3wnowK6TaKjUuaww1L+eqASNzw+XDVOCQoXjZ6j3YWAhHZRWRZk
 mUTe+SozJi9waixNt3Y1CMB4wMKPeSoXoY2L9SPCb5ogdJtaEZjMyppUizUXWzrEL/8Y
 ol5TM29tGOAYk1RGCTbspwzTu/UrKYIdcscLbfkWGVvoV/wnjnEkqYhn8xnfBIYZC/8K
 9mplZEeKmG22oGhgZ1wV7FItfG0F0JdiRJj88Yk+HTkNN7E4fhFGpNH1NA2P6lylZ1d1
 rczQSVgM/OcXbbzASdeKYvABtEgR4OSvpHiyeQiagU1bYq13H4cTgjq6x7fn8h0TQ/aj
 zj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722750033; x=1723354833;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jZj9/52rwWNE6aCx1N5+a52yjuW6g5rJuFXIxcVgEH4=;
 b=FlwSsSgX76dDUYAPFQuAghq7t9ke6kG08wsWPjcphNaaOD2JZ2JHbMX1BNy8Y4rNf9
 EUkjt99Kd4hefoBd30N3/muwQvia7dZh/s8bxtzSFPFUgADj6y54SX9VHyl2K3Djve8D
 Rx+T8CNcGWDkzoWWMN5pjH7J73XCRZ0OqibxHNn8s+ygjmbJM32VpYm3eP5jYVvfVUK8
 WyJYcUiqTvvatt5cG/fgKV2FDHPaOzu54BCSwLqUmEYnT9O/WjjFnRFHVaYn8c9RDI/0
 kdLbn1b3t4yJoafGIGJjxQnBxuEHeVdjV+ntP3uMERlqxMmrWtN1lhso1VN8HFdS+5KO
 bAXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2qzggcqiwx0cSGe42yTzy6JUXLPyg+GEV8gzNMsH41e0GHdGfi310UHEE37AhwIa7I2najAFevWD2KAWWj81ZE0ZSXXWqLBWs/jtXJACU
X-Gm-Message-State: AOJu0YyJmV3ksOUkG7mul8+W84/IeDba2181dztcPDDrcGZpT0Kp/sGT
 vQd6zBjrz5feD/py5TEZVkXmQ6MB/Ei9nO6KA85LDS+Wm4LULRIQuZhY+88DSvM=
X-Google-Smtp-Source: AGHT+IHbci0hVaQgSOMpebGYXLXoRbSJAPdeMpWLhfgxvxEZR+HSx4w/E5jZTEcJ0B5zpBDG5TQSnw==
X-Received: by 2002:a17:907:968b:b0:a7d:c9c6:a692 with SMTP id
 a640c23a62f3a-a7dc9c6a8a1mr583045066b.51.1722750033049; 
 Sat, 03 Aug 2024 22:40:33 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9bc3bd7sm292248466b.34.2024.08.03.22.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Aug 2024 22:40:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 04 Aug 2024 08:40:13 +0300
Subject: [PATCH 09/11] arm64: dts: qcom: sm8350: add MDSS registers
 interconnect
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240804-sm8350-fixes-v1-9-1149dd8399fe@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1178;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=+6qOXA/nRYvF+LJ3fyjiDmQq3/m44DEzHQz0B5kY010=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmrxQ/EZqpfORfNpqmB+gfbID37iTSi1xyvFhc8
 yGcwAyMPX6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZq8UPwAKCRCLPIo+Aiko
 1fEVB/4poQ3kFh5IcUQVcpD9WN/E8hoOPvW5xikRPjmU3YFD3FWnNBXl0NKC2mQ7WS3PnupHux4
 FvdTXUXKBbSus3+FQxXGfy1KvXfiw8Rfq+bBZ1fSt//qdVQNygZHM/LAU4xRdOcd0+0YshgpLif
 r0DdSq9HK0mJds3+Utjv76o8LBIV0Vzu5vPJe/TAp8BdLUk/GneFDKIGgPfPx4Lvj2JAd/N/Jfm
 uj2wWVPXuNxiDTBUBJGcAVBivZkGTIFe0kMQBzzL3kS0L6oPgcGjU2goCBY29+xl6qt+IoIIgnv
 qFb7CLYVIuCQMxxpLvagpIAeRD5Gpp/pQ9wrZrumALkiMHSh
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

Aside from the MDSS<->MEM interconnect, display devices have separate
interconnect for register access. Add this interconnect to the display
node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 38ee0850c335..27f36e6366df 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2490,8 +2490,12 @@ mdss: display-subsystem@ae00000 {
 			reg-names = "mdss";
 
 			interconnects = <&mmss_noc MASTER_MDP0 0 &mc_virt SLAVE_EBI1 0>,
-					<&mmss_noc MASTER_MDP1 0 &mc_virt SLAVE_EBI1 0>;
-			interconnect-names = "mdp0-mem", "mdp1-mem";
+					<&mmss_noc MASTER_MDP1 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "mdp0-mem",
+					     "mdp1-mem",
+					     "cpu-cfg";
 
 			power-domains = <&dispcc MDSS_GDSC>;
 			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;

-- 
2.39.2

