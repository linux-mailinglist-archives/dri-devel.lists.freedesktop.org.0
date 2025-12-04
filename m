Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57274CA3CB3
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 14:23:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA8410E984;
	Thu,  4 Dec 2025 13:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YbcK/3jZ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PGGfeR8G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 728A710E982
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 13:23:11 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B4AExpq1043083
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Dec 2025 13:23:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 l4XGWR0+KNvc3ed5ArMjwMlC+KzNK0mXGZ2jEfsyOiY=; b=YbcK/3jZRpAbITpn
 N95hbaYlcEOYxiyETZHzMcjZVe50HDrtdTTYdVVxLbX/gHUtcQ/C0BcH8scfAQnd
 afwK4BXsYPM/DriBXkuXLDXQMG8sfJGCy6n1AC1xr9DmGoPIeJDsGeijjL5IsUUA
 1c4ql/ojdZPbu0BOzHryfD86mzQimF4FQY66RkiJLQt7eFYJ43QzxolulYejJquT
 rfTcCGvV5u3aa3U5uWsUfwPyZ4EiAoqA7pjnRVpMdBkFLe2cY/m3zzW83lK1tElm
 w8v+0KV5ILkp5BxVqcRGM6HwPxasd9W+8ujElLB+sKOMdvxYdwPzPICRQquvCVX5
 uxRXjA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au6xp0v8s-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 13:23:10 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-34943cc3221so1761029a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 05:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764854590; x=1765459390;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=l4XGWR0+KNvc3ed5ArMjwMlC+KzNK0mXGZ2jEfsyOiY=;
 b=PGGfeR8GTWOAh2SMA5lDG9mSo4c3gucaeovTUumCHAEm2i6M1pDAwhciIW9IL3vSbB
 RZfhWL4W7QBm3XilBN1q3PRj37V0v6LA42rgvMunCndvuJ7d9BODVKp8ZYdlb99OrAwD
 +6jJkzh3/8s3MQJ82ZCBLkychTI9k3gX/o47QbRdyczCjUNUEurRzqY1oLEKW8C19a5Z
 1VbATjG0iJ6HbWYbt5x8T1v+mBCETdc/DEHk0v9eEu4Ywky55JlFjpMoaRu4PjVzb2rK
 jPxsyz53NSytW57UZ40AesL9lJDatJwXAwLoPxKjb6G77tEfd788TR9T7T+rkliZKRJp
 aRzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764854590; x=1765459390;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=l4XGWR0+KNvc3ed5ArMjwMlC+KzNK0mXGZ2jEfsyOiY=;
 b=A1z6uLtA8feegOCLR4cVimqg8ot4Pa6T5vClbRXQlRBSB+5JEp59cn/hFDRbJXNRtn
 QyB+mKlbK+5E3aLTwTh4QXBxQRYC5mkPCMlpJ76FJ34Ea8+14c6BmZ9jC5n6GC/lplc+
 JrNfAkzCXFUh9ZxpQOmoWIhjNlRQ/UzR0JtZjs+ae3a6vTmmOF85cU+kptxuA1jC14bc
 luPJ9tggzh7DtXUE4fYUfGxiFTaHzfju7iDD2m6b9xxNT/NtsuhiKP8idXka5Z3bygnl
 o7J5KCiSlif3uheHxLCc8y1oYmE02ko0fVR0KVy7E+QJvekh7YvoC8VdiB2bkKYaSnsm
 rJtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIVPV+zinan006lEBfjhOQa4LKyacX2BkU+lkA7Anla6zQmoEM2u7KwdEhsfuJOJTfoZyQDBwC+l8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVqcEmXJPL99rDIE1ojWM5tl8fup3sqO06YmqudK8ww88IajxV
 EIo91s9aTO0prCTsau0XNWjWv8a9T6hXG2v4+M8TXU1ibsNqDl9raXmvZ9PK95YDBIczhCy/tBd
 OqWOPlleC5kkf5EHJqwRWfj7ix1OU6PF7qKxjaUFikwhIBTshQheUsNuS+phAAzkEPl4uCXQ=
X-Gm-Gg: ASbGncufLayC+/RDakSo+Ca4EamOKlgS0AhBMqBUZkFjYs2FwnsHdjYUTkQZYIJ+rgA
 xGOFRX71EDcKg8H52qOKCOK0KWoY5H0BUYFJg5gEbQ24aPjJ757j9gRo4+rnHSqaLaPWueBehWK
 4oZD10nRZ/rOFC0/6EK1yMmvJYLk6IFPWjyoK3X29lhyYk1U9/wu0251InirzneABb0eInoOrDT
 5feJV/HjZpiN2j8htxuD3tiTvuZf4FDRIoB/7Mrlefd75bXJi+E5xCoKUGazV7AbruEHN89vWxF
 Y7RgwquGG7Ma6M/03nZ28DORTyrVKcYgJcPJlbmlGKg+XpzqTmIs8g4nMIvDr7bGyLfhGbiEobD
 XII0qmiGmGI7/a3S0+u/Gij2dfQQCQ+9IOA==
X-Received: by 2002:a17:90b:6c5:b0:349:1597:5938 with SMTP id
 98e67ed59e1d1-349159759cbmr5564595a91.23.1764854590238; 
 Thu, 04 Dec 2025 05:23:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKzX3dOZ2Hed+4VMOvlHYme2ZNasP8l1XGATI6EHYuBs9xYFVOc2YLttTn9Lh/jO8gK1QmSw==
X-Received: by 2002:a17:90b:6c5:b0:349:1597:5938 with SMTP id
 98e67ed59e1d1-349159759cbmr5564563a91.23.1764854589700; 
 Thu, 04 Dec 2025 05:23:09 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3494f38a18csm1914740a91.1.2025.12.04.05.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 05:23:09 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Thu, 04 Dec 2025 18:52:00 +0530
Subject: [PATCH v4 8/8] arm64: dts: qcom: qcs615-ride: Enable Adreno 612
 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-qcs615-spin-2-v4-8-f5a00c5b663f@oss.qualcomm.com>
References: <20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com>
In-Reply-To: <20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764854530; l=1566;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=0wHTfSWxkpfoiE0HDndY5tE5UXZgiygEg/pFzVW0/Yo=;
 b=BT9DxCp3kv924ILRfxcKowJzBmBolBokUx75jKxcl5PUPI5A13T9PpRfwo13VB5Ouhk+XVvSd
 gegMdNlntBmAZUZ8Jh6VosyxPJd5d6yzxVmXY+6J7IZzJeGaejvpP3D
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=RKW+3oi+ c=1 sm=1 tr=0 ts=69318b3e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=zVnKP5-pAmSyy1jt-DsA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: BFgAte5MlKg9DXreOSNEy_hYb8oTW6sA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDEwOCBTYWx0ZWRfXxP89U0ZeU6DM
 aaQ/389ulc8aPggdjNmDVeh8R1ZfEEkNRWwDJulQ1Hu/ozHoENq765ARmDeNBVrWJDIffbdyHZm
 HKcw2U0MWRjAMNnCSAnTTVFhEjVmLuokMPblpYBfW/ryTY5A0lRfKmHrLtseBdZUlATmbSs8Qrn
 wpR6wFoY6ZN8WnMOYJVKj63KolqP8hGm4TCeXbGkiHtPM1kXFlpy4NbrqS1diaiiTvuL4zaatI0
 mgyrYVp6rqsO9kcXS2GtvNvImHHCddkqN8s5oQUfuySkq45QecgQTpNphiWGKkDXWPM4ejh8QyU
 52E3IVSMVuIbHf2BsL2nK7ICoR0mtGj0lTYEZufwcNpcGTZfVtY5j9wI0hux9r/n3GMNE6y75ZH
 7WMzg27udFoNWWV+Q4fn71lyktih6w==
X-Proofpoint-ORIG-GUID: BFgAte5MlKg9DXreOSNEy_hYb8oTW6sA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040108
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

