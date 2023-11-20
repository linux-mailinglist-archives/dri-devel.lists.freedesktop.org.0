Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C80507F12F1
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 13:13:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A3110E3B5;
	Mon, 20 Nov 2023 12:13:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB3610E3AB
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 12:13:11 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5437d60fb7aso6255063a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 04:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700482390; x=1701087190; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XQ0ypSe1N8mypAau3OPEaXjK2/eDjD7aM7p9a0KkeYY=;
 b=c/5CC20sh99F+OtkL8N7F1/1CcmByZhFugm7Vw+I8CxUD2s1ZXfxSWgNIiKhtbkCfs
 +ikt95BOz6K94LhsnueLn/gzTRuFcrdj3HaDJzt2yFcLY9gIw/vsWoS4e8gA++b/1HB3
 t26wErvHhGQPOcbPS4Im6Qds2DOXUR75zFEFMj5tUASv4lYGzYfpGSHmTnsEcXWob+AR
 jr1piaL72nJZp6xvASdHXPcFIrDIbbeHDS44SFdQWQ/wssvs1s2t9/2RO5GX0L9o/LbD
 1Fir97NIMkd093bJR8GlzdtnEYBEZxSA+/ZkH5G4lxfLp/IdmSUat82QGWttuNXWZUcK
 uSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700482390; x=1701087190;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XQ0ypSe1N8mypAau3OPEaXjK2/eDjD7aM7p9a0KkeYY=;
 b=ph8Fr+ftJ4kyqX8i17PUSHsFbf2gaPKD7G0loeK1dr5MmiHAX0z/UhOEIxwfq+fJro
 i+kdfUs3Eo/knDAe4Ox3Zl7eSh/1IxD2PElBRNxJp+w0bHZI8crdBke9SnkNXsLvQHd+
 hP9XCePbDvMeBWiAte5988cof7UrJesjeo/IqAmlpm63zj55I0s6la0QXxKJYD51nUnc
 29kTE12K8V31ONY47Jth5avISenEvRXp0E+4KmoJ14ber5IpjcUFSj/agQnzNtmDpLug
 vakfxAlAVXFDHG2RWH9Dsq2WzIwKXXv4YQzw9PiJ5Q3z8tOB+ajZaiTy8t5n1F9U1zTL
 /ESA==
X-Gm-Message-State: AOJu0Yw4i/XYU4GcogrCmPHYa6rIAGXATz+B0lmEhOWwhovUUU8Er6b6
 PBJoxWaWDfLH+UQjPJ80e59nxw==
X-Google-Smtp-Source: AGHT+IHgHEWqlDlsQXQAl07jhTuaRXFLhW6gDO2Rl+xkYrooOqkwo/D69PwFKDS16PgzgicY1iZj2Q==
X-Received: by 2002:aa7:d795:0:b0:53e:29c1:ae1f with SMTP id
 s21-20020aa7d795000000b0053e29c1ae1fmr6220141edq.19.1700482390140; 
 Mon, 20 Nov 2023 04:13:10 -0800 (PST)
Received: from [10.167.154.1]
 (178235187204.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.204])
 by smtp.gmail.com with ESMTPSA id
 i22-20020aa7c716000000b00548ac80f90csm1324584edq.40.2023.11.20.04.13.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 04:13:09 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 20 Nov 2023 13:12:53 +0100
Subject: [PATCH v2 2/4] arm64: dts: qcom: sc7280: Fix up GPU SIDs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230926-topic-a643-v2-2-06fa3d899c0a@linaro.org>
References: <20230926-topic-a643-v2-0-06fa3d899c0a@linaro.org>
In-Reply-To: <20230926-topic-a643-v2-0-06fa3d899c0a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700482383; l=1308;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=N2IVhDhpEh9zFeokJPv6QBy10GmMVdulaG7b6AuvP+g=;
 b=uG783dcu48EoyZtmTibdT6s18RnNyLq6HJ4ZSeg0kSXPAOezOy5rAXKriMyErZZssZNCUWxWR
 adKpfYAOfdWARCJg24F0tWOT8i81Lrg67x10qpdZ8oWQW/Nxp+Eihif
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Luca Weiss <luca.weiss@fairphone.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GPU_SMMU SID 1 is meant for Adreno LPAC (Low Priority Async Compute).
On platforms that support it (in firmware), it is necessary to
describe that link, or Adreno register access will hang the board.

The current settings are functionally identical, *but* due to what is
likely hardcoded security policies, the secure firmware rejects them,
resulting in the board hanging. To avoid that, alter the settings such
that SID 0 and 1 are described separately.

Fixes: 96c471970b7b ("arm64: dts: qcom: sc7280: Add gpu support")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 58563f8fdc16..db47af668232 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2608,7 +2608,8 @@ gpu: gpu@3d00000 {
 				    "cx_mem",
 				    "cx_dbgc";
 			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
-			iommus = <&adreno_smmu 0 0x401>;
+			iommus = <&adreno_smmu 0 0x400>,
+				 <&adreno_smmu 1 0x400>;
 			operating-points-v2 = <&gpu_opp_table>;
 			qcom,gmu = <&gmu>;
 			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;

-- 
2.42.1

