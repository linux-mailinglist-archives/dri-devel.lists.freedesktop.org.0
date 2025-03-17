Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFFDA65B34
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 18:45:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E9710E440;
	Mon, 17 Mar 2025 17:45:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="J4Cqq/sa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 087D710E440
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 17:45:03 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HAmBrd026106
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 17:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PZ4TVLTWNx/gGQLOA3+7bg0q2y6wNvK2yyuXjQgEGjk=; b=J4Cqq/saBNeR6xDU
 KdCrWM3ZHY8mdkcj8vR59Q2rf5RCerBW1LVUBGyUnw7p5x5hwGkiWW0Ft3ULr7+i
 ui7YSWnnOTNLdtFFkles5Wx936lVAAv3SFsjtB/ZUxr6xYWv3cs4UFu+udQVBJZO
 beYFqSey1eR3oJUhDVaLAMgko4kGN5UmuXl2t2Fh1T/TwrpJqyx/BQRciq8azisX
 VEtchdXjufztadLVxnngZIRxAYbLKpKzkVsVgjyqonsQMmG/torf1UhCsof+Jn1/
 w8FzLXig7wzvX6FiSreKYG19M7m89rhcZjjioFTj6fjcyz73JUPQ5wC2/91mhUJl
 L6gpTA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1x7wga9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 17:45:02 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e8feffbe08so128717586d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 10:45:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742233502; x=1742838302;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PZ4TVLTWNx/gGQLOA3+7bg0q2y6wNvK2yyuXjQgEGjk=;
 b=QWAb6xnmOXuZmhFAI3PyPBLF0fP8EWlC0uv9M4zrDWLLdFh+rGf92z0ueyTSN+TH9M
 46J1yMVd+s0RGEP2rSXq7Hsxt2IqO/8GuGtgwRHfaKTMZuZR36MdkC84pMe6wE6Li8OZ
 wevQ8oy3VBOg66XWFtdKnwTh9V+MVdP8VgtcczUGhpnSSASyazKYr+I4FZEu7XqCUejY
 TvQeBpi+02MkcxSIaCpCmmGkwQM4ZHTHhIFc4Fzb+x3gxGorWDz7mf6KQCFrYUbIoIFl
 hrXtim0/SfvLhuN45+jAVoW7em08gJYBg90wg2vk/FM9i/L2qt/u0Xj95YBVlXaLVAxM
 Ym0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPBPfwD0dv6uPKoSwSd7/Cgy2XMA9VfbvZiXAKwz8iePVuOLnZdAz+Uhqea0BAExNrfPsQ7kRo8C4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLmXrFK18ha2KJcDKDY9Gn92zTUdwFgESXjIr+0SqDx9G/OU2o
 PcAq5jiYeYLhPW/EX6iwNr0mqIP3JHZ/+IUlvG+Lr2Don3SkDoDxAYlMQ+Csxq+xugUFGEqSUY3
 2uNwlkWWg4rSpABmE4e+nE0Hr0a/I71XhiBrJ/QtbvFeK9k3C6wlo6wxOkb1sFJ4UeJg=
X-Gm-Gg: ASbGnctOpZm5q/6T54nnF6QWqsp+y1lT/WjYO7BtoeOBTnPIBBaRwt49kot+6CD3H5a
 AJx1A9NuIfXAp1JEYIimNGipH6XiwM7kLLaItn0AY+zXDD0eWk7ENDbUNofac+U+R/G/J/8t46I
 pLIytLzFdjVkh14zL+BUuVYCV/WMfRJdEczgyBdek+gD3leWjSkw/VOZfln8PXxYj6c83Q48SPt
 26JirjEQ7NA3o8VmSzkAASL1NEuHK2QzLPqhi09oRVyVuN8nObysWBvRM8bOxN93+VCOkzPNnrk
 YHx2Aag1AThgGpODMO67mMncu4mIlyw0I2PH8xmtBws9HMcG9hhh2f5JEbA5fBdagMXmy34V/9M
 Tp0yoNzKFzhOwIiMuD78l933b3qhV
X-Received: by 2002:ad4:5f46:0:b0:6d4:238e:35b0 with SMTP id
 6a1803df08f44-6eaea9fac05mr187988626d6.17.1742233502182; 
 Mon, 17 Mar 2025 10:45:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbtkhZoh7ZKjpQve+rs4/e9Pgietbgyg5OyGK6q/QtHdKWWg1YEVRp+W9jdcYyAx96l9bmHw==
X-Received: by 2002:ad4:5f46:0:b0:6d4:238e:35b0 with SMTP id
 6a1803df08f44-6eaea9fac05mr187988106d6.17.1742233501747; 
 Mon, 17 Mar 2025 10:45:01 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30c3f0e9985sm16687121fa.29.2025.03.17.10.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 10:44:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 17 Mar 2025 19:44:41 +0200
Subject: [PATCH 6/9] ARM: dts: qcom: apq8064 merge hw splinlock into
 corresponding syscon device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-fix-nexus-4-v1-6-655c52e2ad97@oss.qualcomm.com>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
In-Reply-To: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
 Andy Gross <agross@codeaurora.org>,
 "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
 Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
 David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1360;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jexDBYn9BNqo5ubVBhdyniVFq50lVyAorid4LoYZ4a8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn2F+HrvJahQkZGPwOjUg+kkUB7W4G48kd9aCWw
 r7W1ash9DeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9hfhwAKCRCLPIo+Aiko
 1RTFCACyTCsSbBBguAPI+l9LhhuDNYE3CZwWSivzYEB+8936g5PZxR2jhNUfSJYvtsA7/yTN3EN
 etytkcTaqPPy14Y3mJaIxfR1Grm1XTWQaIRWHOY6s1K1RiutiCO98ZTLqaLIerm89N7XZEehCSy
 OcXVKt64FJU0PZIABwDELDc8yJs8DNqZqBH98+8e9Aw0DBFnKMJVLwVehz+dcp20QkHJxtmD1UO
 TaBEK9puloembdOTAJ2jlWX4HTi07+l4KPJ1sPmVREy3IUSRwOpslwJggxzH9h7003j1ueEAvUw
 HBoBovqszxUPCunPJADDKteSoyLz9dbcuNk/Vfs3ozzeykV3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: qXy4YDAx3In2qT45oYSlFWgujdRmJTr8
X-Proofpoint-ORIG-GUID: qXy4YDAx3In2qT45oYSlFWgujdRmJTr8
X-Authority-Analysis: v=2.4 cv=Jem8rVKV c=1 sm=1 tr=0 ts=67d85f9f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=rbKIQ1AqokDPPu1yVMsA:9 a=QEXdDO2ut3YA:10
 a=FZlSnJes_g73BORgF-R2:22 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=631 spamscore=0 mlxscore=0 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170128
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

Follow up the expected way of describing the SFPB hwspinlock and merge
hwspinlock node into corresponding syscon node, fixing several dt-schema
warnings.

Fixes: 24a9baf933dc ("ARM: dts: qcom: apq8064: Add hwmutex and SMEM nodes")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index ba99e794dcd2236f65f2f3d8c49213cfdaee5f6e..3728875a5506397b36a4c0d6a5ad12c067bbdd8c 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -213,12 +213,6 @@ sleep_clk: sleep_clk {
 		};
 	};
 
-	sfpb_mutex: hwmutex {
-		compatible = "qcom,sfpb-mutex";
-		syscon = <&sfpb_wrapper_mutex 0x604 0x4>;
-		#hwlock-cells = <1>;
-	};
-
 	smem {
 		compatible = "qcom,smem";
 		memory-region = <&smem_region>;
@@ -305,9 +299,10 @@ tlmm_pinmux: pinctrl@800000 {
 			pinctrl-0 = <&ps_hold_default_state>;
 		};
 
-		sfpb_wrapper_mutex: syscon@1200000 {
-			compatible = "syscon";
+		sfpb_mutex: hwmutex@1200000 {
+			compatible = "qcom,sfpb-mutex";
 			reg = <0x01200000 0x8000>;
+			#hwlock-cells = <1>;
 		};
 
 		intc: interrupt-controller@2000000 {

-- 
2.39.5

