Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 575FECDEE7B
	for <lists+dri-devel@lfdr.de>; Fri, 26 Dec 2025 19:31:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B54C910E138;
	Fri, 26 Dec 2025 18:31:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="D8pc3kO8";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H49a8qC9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E2410E138
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 18:30:58 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BQ8bmnt755128
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 18:30:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 l4XGWR0+KNvc3ed5ArMjwMlC+KzNK0mXGZ2jEfsyOiY=; b=D8pc3kO8GCjjvm8/
 Qfq9GTjdv2cFMFM98PAyKmDBNqElyY3uyRSyWFdy6T3X2nIwgRvPJVYlglFFkis+
 Der36k3jGegfD8cJ7OgI5J+j+DhCmoSYGK2V/oEGXTEN2nBuxV13xr/pRY2CerWv
 vosC+Vlrr4rYq6LLayf4LJJiZvqQbG45X0l6wb8S57ie8j06JC4iGuIfhseplquj
 AT4qJUK9qzAqLODlIqDvJOvXyA+4/vtUG5H0p7rzFQSSdtyQKlqHgZC7Tqm7cWEH
 AC+sfsrJSzqIxTb8lfnxxnEy66m6X1+OniKWoTNhg1MUo4g33pZAcEadPtFKWL+o
 FdBzzg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8kbuvha8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 18:30:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-34aa1d06456so16970471a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 10:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766773858; x=1767378658;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=l4XGWR0+KNvc3ed5ArMjwMlC+KzNK0mXGZ2jEfsyOiY=;
 b=H49a8qC9wC0GQ2QpAUAPUrqDVM70Ne579ii0MMbAo9Oux44N91uD+PFfRnBtyMGbS+
 xf8DcRjBVoU+whkoE+/vKrg2u6BDryqIHpqJ8i8wb6otyErOw4jzt/KhFE3Q1prnPrLo
 giT4EGIbsI5l8O1e4Z/BAu1Xk5Id4S+j+A9UtpdcIfbuUlPH+dOoqFmY6eFUmpa7jOWB
 LT8manNxaTDsQSNbGI1ywYzvGvZ0CnQLHOAblQm9WRt+E3pQw3rrloUo6v1KKbiQm34F
 BGUQ4/aZvi3oBaOavWDNI7oTIVPOc5j3Z2yRRJOw3h9sUaF6Cb93+vuYAbpNl5v9elOT
 feXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766773858; x=1767378658;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=l4XGWR0+KNvc3ed5ArMjwMlC+KzNK0mXGZ2jEfsyOiY=;
 b=n88Ta6O5YonQ8BzlmIlq0e6Xes7i/Yf9aNzr6r9j0jiayD1wuKb1ZN2seL9AVcmRm/
 x16LYBGtWqVs3K8Y1TRNCbfckAgy9oINm9xMlxZcDhyp3XVSoMbF71THGNoPSC3C1JvG
 ccuQIezyXJRPgAjEqlKNtMo4PIbalvuwws9ZB3s7Etyh1rG9CgZrShrjSjUZBbEvw11r
 qiwzw7JyjkKpvjZaGximjokMfP/5r02Db/MBk1yEI1somX8V3z36t3q3tLkx3ym5TyAj
 X8cCmnZygzCpg3URqc//IJNAwtWdFbsoBZpcFUn8jUZW/FszwPJWuypvLkRfp/eizO44
 cZDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTqf8tkPFycQimJa4N+BFRRTmM0e+OY2XRUzfu6X2/ixmdB1I0E0fqZFhMr/Do+/zlYE1Ko13Q0eQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRpq6aI/j2Hym9fbUnJuZ0Fm5NpGDcri+JETcoyCVKZSTMnKiI
 TC1CqZf9h29ItMVXvI+Fy13iSDSzzBpqU249ZKi9zrfXiBGkcbTpbhF8rLmZnLGbhdiadQ0khhY
 8ObyhwKO8hmtlMtNHoKCJDetcHOkMejVwo7loC8KH31QGj38oRFiHWn3JrV3Mo8len8I5+ZA=
X-Gm-Gg: AY/fxX7QjpKE7bS66eHtfYuSKc7mQC9/+FDdRd63xzJ/h0cDoRaBvYYQxFHgwIh8zkc
 e5slAvkbJic+51SOeyBV4eBJ62t0L61B6ixCa+skVZhhLw6zf5420wJj9GIAQ14ADDJyCFURghP
 udcETpeLt/gDCr0H9w+3gT0OCCeRXmvyrYs+oryxYXtLOHNlxBJ9Hb/rKxht8c+g3gbCCmex6zg
 iz7JqSR3rIn+AW85mFiGuyp2Qylpheyh5V117OXfUSH6dhVAHIaHQTtuEUn7jzz63q5EQ3wuQOn
 hd/htgpy9gMJgqIykUStlFcOEMNdf2JKIyEVoDwb/Q4GEyQtiB6OWUYYzniBlqMK1MsaRvzuITk
 b6QWViu83JThdA2YCs7fuKpUQV3OprnE8rw==
X-Received: by 2002:a17:90b:134d:b0:34c:ab9b:76d6 with SMTP id
 98e67ed59e1d1-34e921b9fb1mr19395504a91.25.1766773857551; 
 Fri, 26 Dec 2025 10:30:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3cB0r3VF84oECQbOBHaUHDcFCfAqqe4vcXRfkQ8idCGmHLWTD3venrh6qLQpSG+LSK5JShQ==
X-Received: by 2002:a17:90b:134d:b0:34c:ab9b:76d6 with SMTP id
 98e67ed59e1d1-34e921b9fb1mr19395472a91.25.1766773856989; 
 Fri, 26 Dec 2025 10:30:56 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34e70d65653sm23808883a91.5.2025.12.26.10.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Dec 2025 10:30:56 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 26 Dec 2025 23:59:41 +0530
Subject: [PATCH v5 8/8] arm64: dts: qcom: qcs615-ride: Enable Adreno 612
 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251226-qcs615-spin-2-v5-8-354d86460ccb@oss.qualcomm.com>
References: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
In-Reply-To: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <jie.zhang@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Jie Zhang <quic_jiezh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766773796; l=1566;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=0wHTfSWxkpfoiE0HDndY5tE5UXZgiygEg/pFzVW0/Yo=;
 b=7NYLN0NLICnqtnhMSXKEIZo1luiDJXgB6Id6mOqyxkwcLkGqEmCDvSzZ09RxWzPo91OdrMaLl
 eRg+kWNr+1CBK2CNmzfooccSkUtX3Uu6cA8v8tXeGTHNNi7yTPbMm8w
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDE3MyBTYWx0ZWRfX0HgTJuNoFRwK
 NHJfprfmu0oC3Wyv005fp0kYJzi3zYcnu3lP7SDI5noUKkIk4y87cAWJYdJTjj/i2VP45x35mOF
 xwLKPxr6T9lnmU/X2NvsJxe31O3wvdP8PqQ/m5oPCfmm5LMpls2Ndc637SJyfD3l+18A1vVmafZ
 uUyzI0hdyGYzXOo0s5VAVc1nhn1QWIMYtzPGi1awMYAfYXFdaD3NcAQ81BhdQ5UP3TZznbH6bYM
 11CRX593bZedNQHHy8LUSnF1Oc6rJt6pDjk6gy2EF0cJ7b1L5QpDnu/gv/TgbyL0AarmZGwyt6p
 d+CdicRIcPlOND3gU+2wB/Kp0iGUV11JPlc1wOc+9kqOWpfWKbC1ZYYw4ubTvp+9iUqmzn30axV
 d0VhVgBzJRfFTmF2lS8g/4VBMvJUbybl4+o6W0X4n6qKQ7SW+wJq08jLQUEM/uf4rb6J5Mx3RW2
 j6nkzm4OL/E7IfVeB8A==
X-Authority-Analysis: v=2.4 cv=Vtguwu2n c=1 sm=1 tr=0 ts=694ed462 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=zVnKP5-pAmSyy1jt-DsA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: waFSJHMJc8Pu3I9D_71Z_EFW-mg3hmYl
X-Proofpoint-GUID: waFSJHMJc8Pu3I9D_71Z_EFW-mg3hmYl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512260173
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

From: Jie Zhang <quic_jiezh@quicinc.com>

Enable GPU for qcs615-ride platform and provide path for zap
shader.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 8 ++++++++
 arch/arm64/boot/dts/qcom/talos.dtsi      | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index be67eb173046f9e4ac58157f282c3af41e53d374..33e33aa54691d38f96e5c76596719691e2596eb5 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -358,6 +358,14 @@ vreg_l17a: ldo17 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/qcs615/a612_zap.mbn";
+};
+
 &i2c2 {
 	clock-frequency = <400000>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 7c2866122f9a13b8572fd9e6fa9d336176765000..606f5e234e4a02caaa03f1084336e137768dba1f 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1902,7 +1902,7 @@ opp-435000000 {
 
 		gmu: gmu@506a000 {
 			compatible = "qcom,adreno-rgmu-612.0", "qcom,adreno-rgmu";
-			reg = <0x0 0x0506a000 0x0 0x34000>;
+			reg = <0x0 0x0506d000 0x0 0x2c000>;
 
 			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
 				 <&gpucc GPU_CC_CXO_CLK>,

-- 
2.51.0

