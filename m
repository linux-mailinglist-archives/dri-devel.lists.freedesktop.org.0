Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 869D4B30270
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 20:56:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B919210E3A3;
	Thu, 21 Aug 2025 18:56:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mLgRJJrz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B7810E38D
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 18:56:52 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57LI9rH8027506
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 18:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 L+vnrfh5wkxvST6moGu8zFwo8y31WtRfprWTPNuMSjg=; b=mLgRJJrzeWOzkkBq
 xCdYQeB0PJkwP3l8K9NTongMTO0eSNXFlAhDK+wUFynDp81nQaIRKh7VfQtXOdiE
 xuNxQC9G5nLfpCnYQ5YrcmR8Tnw8E9nrUo2LxtYJH3kR25h+g4omYtf/tpgSpPMm
 3W2mzK6+YR1LZBLUFpCIEYUwfMMsnV73/pN4oRBoVwSh03Ewz28xC6dc9y3vLvDl
 lp3dk6Q/U9HBqsCJXymhGt/iUaVtzVa/xirDK9/vtjMtF7DBADWB99Ta6/53WWOh
 NmwRBcpWwHyBeEl4BBaZ1BQNgfHoI7YDF+DgnMr+dEZcZMQWXo5KUYCgMxluHUSe
 SfZafw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528xgvj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 18:56:51 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-76e2e5fde8fso1289947b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 11:56:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755802610; x=1756407410;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L+vnrfh5wkxvST6moGu8zFwo8y31WtRfprWTPNuMSjg=;
 b=sJfMMChkVOgKirP7U4o2Nt20wsMCD8X7HMR8NezLYmVFHWfUctVn4E6YXOnzkK8V/L
 nuSMlrBJqHZKf03wh2hk2S5cHVGDWjD5RfgsIC0ej+OL0qcxFAuVcSQt4Rb0zs8Tgd1f
 bjPuJArvBAfTqYgcOdOdY1wRHZTuKERvWHBNVUwj5vwC107zqvjur4Jq1JrrLKPEJfcd
 MGwslBKviyEu2erfkj/EmYfQszd9LhIs1QDiyQFdmUfhoGg9oKnUW2ejDbJgWthGeVgq
 /wTtITE8sQY2QYgyvM3yJrgUY9W9S8iTfM0g4CSI7QZLAV0Tt1xldetOGZ11snj4wckE
 qeSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiKgM1zhIuPUn2Bm8XNZr3DyPyOp4bpfqsVEOSSDbHW1x083oHicflYlIBwHi3s+AO+iivrWy8LfQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yym9qqG4o8fG4wKofoMOBMjzGugHimsy7q3sLAKH8/WgpfTn1qw
 qVv1kIZqonI8sKyI9c2dBzNdhLJ+vQpQ9yJciNJpPymglTvRI62pY5v4nMAVC/13KjFy3rsdEHK
 Iy4XwiKiz2rLvc4QP5HXO4f0TFhMxN8r8dLeqXe+bNACyBToZ5NJ4VoW5+h3axD5BRU5zM9k=
X-Gm-Gg: ASbGnctZd6avW0++Cdi87iHdEQANAuYPJkNtP3V66omwmvLU+yqUUEd0klT5ljXcebx
 vXcexnfd8sGZ8Vp2RdgB5cJyul1qHrbPH28WOypTYI2Fl9Yealo1BhGVSJTyVUnjjdyavSpIKB2
 7RHSvMFKFduRKSCkcs6Y1146qNE5oZOE5v8Qjg1bw3D7ne/zM0yzufKzEoMaTrQ6f94H1ScNSJv
 GNrq6eWfElU7Wh7Vdn0uGsaYPJtubJsHb68UzOyb9WiXyluYSKRZTyx2UYJVtJ9lXmup8WGbS4y
 6EXKXBUXctSIkJkFFVoBP8CO47ZvGEhFmRiw6+7SDq3AvBgi9dJgIUQfQEy/Jhzh
X-Received: by 2002:a05:6a20:72a2:b0:220:9e54:d5cc with SMTP id
 adf61e73a8af0-24340daf836mr290730637.31.1755802610062; 
 Thu, 21 Aug 2025 11:56:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbkoS9Oleg0BMcUAm50PQQmuIuPc1U5sybFr6bqhLl0blAssfD7XkEWCeGVPUZNhzXoPJurw==
X-Received: by 2002:a05:6a20:72a2:b0:220:9e54:d5cc with SMTP id
 adf61e73a8af0-24340daf836mr290691637.31.1755802609615; 
 Thu, 21 Aug 2025 11:56:49 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4764090b0esm2106977a12.37.2025.08.21.11.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 11:56:49 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 00:25:31 +0530
Subject: [PATCH v4 6/6] arm64: dts: qcom: qcs9100-ride: Enable Adreno 663 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-a663-gpu-support-v4-6-97d26bb2144e@oss.qualcomm.com>
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
In-Reply-To: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755802565; l=812;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=EfCx1AnACdzORFWTq7a/mK0KpOzkdsdN9am6A77xvlQ=;
 b=XGnXES9y4qk+wZkRRx2ofUbx6TA5EXdyY08i0sz/1HJLxVoi0TaTp4HQb61vD0riKc2tD5RrK
 1hNS0+25QZAB23PNN4ZH5Revq3TcNgTO+Zc4bv5OXYJfmLzq12ECf0c
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=I4c8hNgg c=1 sm=1 tr=0 ts=68a76bf3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=jbU5qkt2-FsioPMlu34A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: gZq5nGsBdl4bI6VL9AmNugS9NyMnrrF-
X-Proofpoint-ORIG-GUID: gZq5nGsBdl4bI6VL9AmNugS9NyMnrrF-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX0HhPnMfyRX+B
 PEluUxl5zAC4Dq+aWUifHHalRdmqY17DzReu4i+kqU1drX6WW6X24xONx94MLTgT2DgGBZaNW6Z
 A3rQlzG7wy7LNlI0V+uJ4zIEXdMeBtXDlDO14ZRlL/VHaHblet+HmRG90BsMbW17f7QuN1WSkAB
 2Aq17Q1vX9VwAfnSYbW63RGYt5Z2kl1u8c3PbV/TlGCKMl+1m7Elg/QWVSMw8Fj21FC82TIT2eP
 6ZtAAnLUPW6E+KyyUKuEXHbNcUMNCwMz9byMu0Vecdb3XB0Rrdtz369T7jGu9ODN9lG8hMCuTDm
 jTRG8zLZQgL+mR9UUN+dyseMI+cpJExJm9gUSobTOFvBtYYUO0Is3RdtUMa6Us2yFuThRYncEmT
 YINDGOrU2eiyWQYWjA4qCvBus+OQQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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

Enable GPU on both qcs9100-ride platforms and provide the path
for zap shader.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 25e756c141606fbe0876ed48a54809b372650903..e9540cbff78ee44d6d92de10464c660a05a68db9 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -436,6 +436,14 @@ vreg_l8e: ldo8 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sa8775p/a663_zap.mbn";
+};
+
 &i2c11 {
 	clock-frequency = <400000>;
 	status = "okay";

-- 
2.50.1

