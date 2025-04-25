Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E89FAA9C44D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 11:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB50310E926;
	Fri, 25 Apr 2025 09:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="G+7V3tXs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0595C10E91D
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 09:52:13 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T6VU015997
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 09:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NPo6Q64R8Ie+grYGknWiayM+abt8O8HAhJ3oPPs/n34=; b=G+7V3tXs6P9jPY9Y
 Ss134wveIjwo+kW2gY/B+9zv69ehzifyGoON/whd07TrJe2SwXP0fwybchl0u+vF
 qiSs4PSHFGx+pqHVDJatoTX7wfO0VmxlWSfsxsbwwOCSlI2pg+MymoUnhgSK/XQh
 MJQuxd3oYUIAWjJwr8EIAkNiyJr9OZuKyDa5t+CZ/5PE882kgalhe82ZzPOc+hmD
 TDHgulhv221Yjkc/6i/lKemMNyreU6pEA+ymvpz8ip+FsKZzYaLwpsCdLuSEwKv9
 84AULNPK4qPfWX+Piip9ZbdBoxUezuuMXZQO92m18knQ7Oj5sD6E7LaXjKVP5Tmo
 aV+QtA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh08jkg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 09:52:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c955be751aso340511085a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 02:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745574732; x=1746179532;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NPo6Q64R8Ie+grYGknWiayM+abt8O8HAhJ3oPPs/n34=;
 b=Lu5kgvr0Y846d07U5h36OJR4PhF+1NShIrcXZGUC+V8nqZ5le7iFykrkKF4ZHLtrJE
 tox7CXuuhiWBTbxwmxRCpkw/eB49VFTMNB5foQLVukNCtsxB5aHb740UyV/sjnFeQMYR
 cDpDqQigArk8Zdjp4zRwlXhCuDgFoxrhIGU/wcoVZKw/hTAhZ9fi0VOPYpe4fbQEVIqP
 MFnUOFH9KNw9M0KEd90Snycv991wfYGvVWZUzP7k/pYrkVXRWAe8phgE99N7w41z2Vu+
 zpR1Ulji7K8AOZymApxDj+q2v8I1hsqonBdjvzHY8u1WVMJUCNr6KX6YCdK5EaBs6Wuj
 h6hQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJWQrFRmfMUW1y8suuNbbpoDdcm6nX1nyXlbLYMA3jaAY2lSU+Pkx95KLdXhnLVwkne6OsLw5YEIA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyt1a1KqQGSkhbp1vdyO0EkFcFtrUWuAX2f5nld1SI5Mz02Mul/
 quGZztKeEENEseV5yc/XLScCJYIvNqp+7SMTlRbbK8JCbog4Nh4a1/ASaDCu1NSOVlt2EdLAWcf
 CN8c4rahkJA6mknVYS9kcfbeGR+nRRlxxUDraJL6RZJI2zCOKd1EGP75PDelMDFD3N5o=
X-Gm-Gg: ASbGnctyXAZACR0f6WMPhmJPDWCTsHddKyZw042a6pRzaNL6KhtfaaOh76vUKxrVU5s
 rjXT6bqWQrBYzeOWwavHQca952s+iefYjxonBiPXr98n9Y7EKpSeioLILKP1B0ho6YXqDzZanXL
 3dfXjczXa4bqFASv4WjfOIUC7TRRMx8D3XJOABVCal5bOeGXI4pLdJbK9ogU/HN/OKAxXKSIw0c
 ZzHtCLOahIdH1Vxw44obi3Z9haabgX4mCGZBdLpJTiGDkmKmvCl2CH+gHCEkJy+H+8VGDcVQRzq
 u9XCkc8oR7JX0dmv+vnRo5z38lTdnnQg7AkkwGcKlMkkci7BesVZI1J/MqHkeQms4zimAUzJCza
 eBnzKYWSUcoV1U7suwm5YQqeg
X-Received: by 2002:a05:620a:43a2:b0:7c5:4b18:c4c3 with SMTP id
 af79cd13be357-7c9619a84c3mr221794785a.30.1745574732230; 
 Fri, 25 Apr 2025 02:52:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxNIuYNNjaQb8PK7de3lCR9P9YcVtolbk+mly+U7z7/oU1wPkDB+IRFiFcg0g6m6VaQc/Dgg==
X-Received: by 2002:a05:620a:43a2:b0:7c5:4b18:c4c3 with SMTP id
 af79cd13be357-7c9619a84c3mr221791385a.30.1745574731855; 
 Fri, 25 Apr 2025 02:52:11 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7ccb7c99sm539164e87.218.2025.04.25.02.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 02:52:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 12:51:57 +0300
Subject: [PATCH v4 7/7] arm: dts: qcom: apq8064: link LVDS clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fd-mdp4-lvds-v4-7-6b212160b44c@oss.qualcomm.com>
References: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
In-Reply-To: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1695;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=gTQKG0fLWpD8Mjgk4DoVlbsZZVw4cfaJYQqKJoHiGbg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC1s6eKqblmHbFW4oNBrTuCB4SRcfiIHrdxIln
 Z11Q7ZLLwyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAtbOgAKCRCLPIo+Aiko
 1TWQB/9/M8KQR/dnVmy9NtEwx7xnrdi4/+6hjugHCYXxnOB/WAIT1s5H1KOWGVTHXCaw07Gdxl6
 v0jvX1yDPdUVVX9GYmZ60MW3p1eooDEw1NUbqvBbbQdPhQIw68HrZKdPpeoOBEFsbf6OW24FXX7
 PusgB4xwCfBNzefYVzBZrVX6gybe6g3rvNERHa2tROfi/4h+r1NdQZBdZfUNCGDU2hZu3tv65Qo
 OtW2TZGeffWeRa7Nr+5p4N5KRxATqLwMYZuVfq1fskGvmBQHWmG9jnOWGQgVmQKcfRmFaHMmnT4
 yDTiRIhPUbCzo+GRNTROdUaFD/fmODG5bTtU+8DxtypOzLyK
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA3MSBTYWx0ZWRfX3FKat9EarUtY
 NAgo5RA7bLsXXQEdA9W5r3puhbNELz3/FjgAinTm7YUf62Nr/fSUmyjuZX7ptbjaRKg9dYMkRdU
 NqVFgV2pfzM9zBKMOzcfPufI2LPwhgt3Iv7tP9hzm0jRo+nTvVZ2hSRavtCply1lz4oUXzSXJZO
 DM0K/lLZ/UtYX6T+sVn5zRg1PSTFpA6sq03msxDmA7AGTTW03bh9vWDY+hZrEIiqexI1XFLHr39
 L//bA6LucORFosJj/pt814n8UN8SSsNEts6E8Gib74FkmDnchuvkNczXeCFP5Ds1i+gB/khfN4h
 wAGEM9f8ugVon8VNMT4/0dvozms0qSznhbgqLInEaJB6teiFo/BiiTL+tmQ5bC008TbgKAo8jGz
 uar7z9nj87xXCs9avHiBCpKSpg8idNN7OT/wMqeX5DLtikBkUm1UGopP+hztMH/Om8m3+GCZ
X-Proofpoint-GUID: CDvFjB8U4oYBUdpT846d95XWLevpeyTx
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680b5b4c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=qzM9u8Bgc55Ixitz76cA:9
 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: CDvFjB8U4oYBUdpT846d95XWLevpeyTx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=780 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250071
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Link LVDS clocks to the from MDP4 to the MMCC and back from the MMCC
to the MDP4 display controller.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 5f1a6b4b764492486df1a2610979f56c0a37b64a..b884900716464b6291869ff50825762a55099982 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -737,7 +737,8 @@ mmcc: clock-controller@4000000 {
 				 <&dsi0_phy 0>,
 				 <&dsi1_phy 1>,
 				 <&dsi1_phy 0>,
-				 <&hdmi_phy>;
+				 <&hdmi_phy>,
+				 <&mdp>;
 			clock-names = "pxo",
 				      "pll3",
 				      "pll8_vote",
@@ -745,7 +746,8 @@ mmcc: clock-controller@4000000 {
 				      "dsi1pllbyte",
 				      "dsi2pll",
 				      "dsi2pllbyte",
-				      "hdmipll";
+				      "hdmipll",
+				      "lvdspll";
 		};
 
 		l2cc: clock-controller@2011000 {
@@ -1404,13 +1406,19 @@ mdp: display-controller@5100000 {
 				 <&mmcc MDP_AXI_CLK>,
 				 <&mmcc MDP_LUT_CLK>,
 				 <&mmcc HDMI_TV_CLK>,
-				 <&mmcc MDP_TV_CLK>;
+				 <&mmcc MDP_TV_CLK>,
+				 <&mmcc LVDS_CLK>,
+				 <&rpmcc RPM_PXO_CLK>;
 			clock-names = "core_clk",
 				      "iface_clk",
 				      "bus_clk",
 				      "lut_clk",
 				      "hdmi_clk",
-				      "tv_clk";
+				      "tv_clk",
+				      "lcdc_clk",
+				      "pxo";
+
+			#clock-cells = <0>;
 
 			iommus = <&mdp_port0 0
 				  &mdp_port0 2

-- 
2.39.5

