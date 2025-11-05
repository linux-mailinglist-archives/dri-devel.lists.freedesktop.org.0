Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F631C36FA2
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 18:12:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A8B89233;
	Wed,  5 Nov 2025 17:12:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FDp2Vvcc";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L2Y/K1If";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B60C010E07E
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 17:12:14 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A5D5pNK4056238
 for <dri-devel@lists.freedesktop.org>; Wed, 5 Nov 2025 17:12:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Js4xfc8+ozAN4gatGrEl/M6dM+koKQCIKD1ockMt0Kk=; b=FDp2Vvcc5kkhMu1x
 kf+ZCCrdvjVFJ6zIQVALqwYHAcCxlZJ739V2v6S5i7Ole7c5Wm5WQarbdZTPp4qJ
 Xaohmz+Y5q3rWUQhdapN2BmHa7+F0eockQ8mxHS5YOcAMfV8MFlS7Yxy2ol9uKTl
 7/e3z4M/6y3mwIexaqlsiD2efdW17toS+qnjDHixvqBaLCcndf0z7iAyR5w/xI49
 l3f2DLmoBKPiQPGbyW1SiQOgejroc2mHh9lOGmDtbNNjcvpeZN9evY5rFoxHCCc9
 /E8kpYm+tMyNefzo60SmbDIytDPNkuYBNQumO8w1wLjnv8bJ/8IZYt11Qo0UQuCK
 tqLiVg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7yp621ky-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 17:12:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2956a694b47so884515ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 09:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762362733; x=1762967533;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Js4xfc8+ozAN4gatGrEl/M6dM+koKQCIKD1ockMt0Kk=;
 b=L2Y/K1IfiPDB5NLbEp2dxVGCZuSrgAZPB5Gf6SushKSGp+0y2t7DFO7dkrKQbVYsGn
 GHoR92dV0C7d0BjtrLrHA/IBlyIy6ir7BeT6LS+ClrNHaOzqILa54dHgvlQDxta6OlFl
 hM+RAUtfZ/IBvIedAOyiZN8JjDSYkqTHgtiXJ3rePBs4w8e3O8SVs/22LHJYRE58D8zt
 ZwKmhQgzhsx4u45Qz01nJO100oEg7xvUsxfhtJmIGoSti2v0D8ZPn+jUoPhQBTgmE7sM
 YjYGts1C0yFsFosY9uzVWAJQvtV0gNDn/7gkrnpiADXvBoHdDD4Shr4wHirOPoBfe0Q8
 8A+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762362733; x=1762967533;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Js4xfc8+ozAN4gatGrEl/M6dM+koKQCIKD1ockMt0Kk=;
 b=ICWMMJ7Q7MubILdmLl9gk7yHn5ZyCDyTuKhJSZEtM393idR1UjPpy4zuMxiBh9995v
 HH24E6aQCjAgwW3WJbJdWaXB/s8yRosb3nz/TWZpX2bijQQbY0VtPs0iiKpTPN2GHTsm
 jAa3ZJhxSr3PFSjB354tZQjMHz952mvi6rE692/2ymQyw0a6NRXM6FF4FyuLxawuLScb
 LhxR4FQamvNj567btl7aXbmpwtiISwXYYTUYCUCjA2LFUd1bQE3YDts+sT99fmzwXX96
 rz1H6JTXV8sxkRvO2FKGckqZl3SKOi/lLpJDigWZpq7Vx9qjLv08gwPVPIFLB8vCyZyS
 EvVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVm0n08GlLH/NJENVmHlTT9z2uuRo9oDJn2drASj5WGb1NcCoHOhInrQ6/S60SLwf74fK++Rg6+2o8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfqJT1cD5/0hdORnfPvRodr92PZy+9nQLM+kDx5gwaiB3qN5Cg
 RZ5kEnZJ/pQe4W63jsFsRm8gllFXCMrbuRMyxxaSzvD/fcTQAW5SuLqs9c6qOfT4RgIYgEnPEr9
 VUUvU1qJg5MLboDBtoNoeDK/i3+/7jX507RKyx+r38fdceTR9IibzzHNY0x0KvFtNC5MzZRg=
X-Gm-Gg: ASbGnct/qCz1TOAM3MqgEgkxCNTtJZ91hIjqA5MSRf9yCc+f4KyXAxljzYBCuFtYp7G
 CRxlXfBDMr2B+cSYAyJMAyFpDO9Vq97vJoTujtFAxOaD743QrXQym2qeSl3lWYd7+27UGSGvsID
 lICGBOq/GhG3i6+lGiTiM/eS6cc8Ou8FccBHND7kjAEcgIHy60VhUjMPZBfrysI/joBoj9kmL9k
 R928Wzbg3I7E+wTyHcf+nf6XK2QkoyI0BDlHdOz81n/fWyp1Q7pI6167dSYg8kPA87QYfty/ID+
 EVaY857FbZ/NfvZf/TE6EiAkQTH/bXGto5x6GudTs7OtdTCLo57eFKc1XcbLLI9AJlmtUoQwLrK
 dJ4Xc0Hr68EzPhZB0sx3jcI4=
X-Received: by 2002:a17:902:f609:b0:26d:58d6:3fb2 with SMTP id
 d9443c01a7336-2962adb413bmr44339445ad.12.1762362732786; 
 Wed, 05 Nov 2025 09:12:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGuEDjsIFDrY2gegEIb7NYgjqogYlaMPvPO8F5SsTXlPwaMngvCVHdiskWFWbz25o5v+MPfZA==
X-Received: by 2002:a17:902:f609:b0:26d:58d6:3fb2 with SMTP id
 d9443c01a7336-2962adb413bmr44338975ad.12.1762362732090; 
 Wed, 05 Nov 2025 09:12:12 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29650c5e3c5sm813955ad.43.2025.11.05.09.12.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Nov 2025 09:12:11 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 05 Nov 2025 22:41:35 +0530
Subject: [PATCH v8 4/4] arm64: dts: qcom: qcs9100-ride: Enable Adreno 663 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-a663-gpu-support-v8-4-62a7aaa551e3@oss.qualcomm.com>
References: <20251105-a663-gpu-support-v8-0-62a7aaa551e3@oss.qualcomm.com>
In-Reply-To: <20251105-a663-gpu-support-v8-0-62a7aaa551e3@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762362697; l=879;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ya263B/ZSqT4MVjFdASA/QB9AUBc/m4QKS8TyGIHwqI=;
 b=IAZEIZIGmwKj0WtzWs0RoGHvuDSjQGmW4oW6OqfFnAKUQc+91elEGHBsnIoEEKB68amq7aAIr
 I0L2SKafqXXCjmeD8fC0tQrFvKPIk1XB/cwyo5KsIqVzxklYv9BZXUr
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: 5WA8wtRNHWQUkIZyGV8EwhMP_42bZit3
X-Proofpoint-ORIG-GUID: 5WA8wtRNHWQUkIZyGV8EwhMP_42bZit3
X-Authority-Analysis: v=2.4 cv=TsrrRTXh c=1 sm=1 tr=0 ts=690b856d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDEzNCBTYWx0ZWRfXxLhH1dsya5Dx
 i0hKE+fBftn2eguHk4EYE3qDpKDROjbKFTZLq8I3JtbYwN1o8zWE/yf0nTzsIjEUrK7uWcQgji0
 iupNoTNXpXwoHpVZ4irGmEQeGtAy2cY9EDWzx/d2VK+wfZ5DpBoo5VYhfeRT28ZbxAdZmesG2TL
 1WtQqFlwa3CbfYAJsqpBxPdgS0tfxaSJzJpht9+1kQssinzPZZONMJ/o59UvCYZTVWwQ+wZNGJH
 WbhLnJnDVQpMAbm5siglm51HDhhgLhdOPvZHtX4Kjafz6uOrNf9lS7th/1BbX+cBdu+f1mVtU+x
 nxrkmqP8nv8i/uR8acfp7gxeNO5YNZlC8SHw/D7JqsMdovDYllX2nmxLrpcbtYm4iMB5Vsmwcqp
 1yxMlAQl7/9nQEHli5J0Yq5faz5vzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050134
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index c69aa2f41ce29f9f841cc6e6651a8efc38690e19..8fb7d1fc6d563288288d24eb5d8288e7748f2c16 100644
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
2.51.0

