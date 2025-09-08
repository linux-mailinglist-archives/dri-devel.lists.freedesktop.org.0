Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E140B49A33
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 21:40:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE8E10E5B4;
	Mon,  8 Sep 2025 19:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EDEelVb5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4CE10E5BF
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 19:40:48 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588GQMwW022422
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 19:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 itWnLUDQYz9rGMnzsBXBwWW0Rd78skgWmOLQTl9Qpc8=; b=EDEelVb5QOzbOCtY
 x59I1bFXpz8wZOSNVjit2YR8zEXrOvhG4AP7cPiAqCWidY1AZX2gP62OOHA2Kjrt
 HENFFz5XBpfBDcJXPW64sFPgJR1Daiu4IA/0h6v2mFwViQ0jzpgdJS75krpFBQJd
 +IXRDRKK+6nr/W0JCZgE30ViUU6PApFyMsqLsAcG2ts8aoEsl9hD0bn7wRdL2adU
 7HIoq3msOSHaHq/VsEzTEwCivP/lbFR4yivjbZsAAuO1wPPl+HDVLuzJma9RZ/Vu
 ti4ID6BdzdvhKZ6UDlu+MZJ3fWnthZjrNPlhKe8X2TRRQswEvpwMv5lfvvn4BAF9
 IU0MwA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc21s3g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 19:40:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-24caf28cce0so117017095ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 12:40:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757360446; x=1757965246;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=itWnLUDQYz9rGMnzsBXBwWW0Rd78skgWmOLQTl9Qpc8=;
 b=KmZ+B4wwqnqhhaxcLmDdbzYin2A3OxNSg5r7Xnxg/b+T19IUhT4YgLL4UHCUJEOolu
 m3nCTmN+q/jdSP/0C9M6oABTvl4YNEP/jYN+nKPY2tnybDCBnZFr5TF/EJ2dnmytzc0L
 Q71DMJCwFNgaakU8wIhW6WP/y549ZpI9lc/11N8NHenZwHcaQo5zbTdJa59XEyX/ygle
 8xGImvJnwW32KsG6gKCxIX2jQpbiMdMUdeGxsT9e4aJRmH/alh6868hQ8HXSWkMPgU6N
 ocygqhy5Gx6A1N7fssbRErVrfGN+EDC9UvvKugtVV4W1ii140WRP+AaIA6AN1JEWIwVP
 IvNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+gJISKdhvOqzhnNFQfBWNCZVRNA91wKfDK9AUlKqEfMant7IHszQA/EJi7OrddXUvU7PuDvh6WAo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4eizI1XeE0dFCN1B8BMi7QrkW7eYkTYR29O+UUJiHiB4DjQNK
 ZP0otnK4CljBYJTLSDUoekj9Am82rQFxf0TSf8StMMnZpTP8s7QOfwhzwORltX//vQrGOS/5fz1
 PSPzSpwwOPKl+AIb5N97zjN4GeTfbWKmm3YxjkYg/uP2eV2K+g6D/4sIqspo3t8h7uP0uTrM=
X-Gm-Gg: ASbGncu3bPCQG7fZCNIfWDdXlEgBxf8xigcoSA2n/SvVtzer/K2AFmEKwC+SLhRVa/F
 DOBuBQcXKgZqdn1vRikynqjRud/bhclIkz0IDGBLbVVyRUsw5ko28OwwtTh2LNTXHicBxzNRUuR
 3dSdoU26YWDJRVgcDjxu87D+FsIoqr/SsJYjFvSygig3x/Y7HqcQIgEVl09fvw2mWB+1EuyF7aN
 s/RkISK5OvYe18fbXcBYW6ZhUSGbbOP7RKBDn8aaTl/Kg/MS1m3jteTCO5HFFMesBOnjqZrtQ+/
 FBRA/oq0WtOsHSivpGl0M3gz7ZWSsyN6pCe/RXWn2CAM3JcpvrdCS/pag6ZAGh3V
X-Received: by 2002:a17:902:ea0e:b0:24e:bdfa:112b with SMTP id
 d9443c01a7336-251761616c1mr100018015ad.61.1757360446323; 
 Mon, 08 Sep 2025 12:40:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+9JOK8BMb3sXLnKBC+xc+bC3hh8II9OXtGKKTgCzvM+sstpMkCgxC9RzDwJ1IJu9Z0f7IRA==
X-Received: by 2002:a17:902:ea0e:b0:24e:bdfa:112b with SMTP id
 d9443c01a7336-251761616c1mr100017755ad.61.1757360445770; 
 Mon, 08 Sep 2025 12:40:45 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24ced7ea5e8sm104008475ad.104.2025.09.08.12.40.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 12:40:45 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 01:09:41 +0530
Subject: [PATCH v5 6/6] arm64: dts: qcom: qcs9100-ride: Enable Adreno 663 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-a663-gpu-support-v5-6-761fa0a876bf@oss.qualcomm.com>
References: <20250909-a663-gpu-support-v5-0-761fa0a876bf@oss.qualcomm.com>
In-Reply-To: <20250909-a663-gpu-support-v5-0-761fa0a876bf@oss.qualcomm.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757360399; l=879;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=9bfHDTw8kTerdOD9ddHzM0+SjSgjN/43Tp5eBUWS4yw=;
 b=ipTZYtF2nW644chXYPKQvMmaRxyK67TXes3EoDWwCmqC0y+G+acBzHYQk8Zq8DjgOEkmPZRFG
 YeSNaDji+duCoUv05rfDBL8ZXrVvNvt5yi8+ocBBT1XDvOeaIWoSyp+
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68bf313f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 3qh1gDA5Ncj2jDwvuy1MslzIDMInQ5eC
X-Proofpoint-GUID: 3qh1gDA5Ncj2jDwvuy1MslzIDMInQ5eC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX6O9NkMb1Rxt6
 0caUUGgXnvUD/YkTC+F/8XCtpek5w1Ml1DAk/ijRCaeWIVHLkrmoJkk5GZOliUY2XxKi/3tM1/Y
 P6fQMKmYUVTAVHo+f4lk9PtXX/+vWtNdrtsIKLu8M2Cg/5JkCflegnYMjo8UhWdDhQXlq5GOB0O
 0vfTIS/4wZqbAMGMSGBDfZTadoMYn2QYw3KPGyIPztSvco8Jha0gDJS8IbaUdc23wQ2Cbp9fpmu
 6j3+5P3ybmAAqLMEWNqxDAxeo1RBp5zcEDFzMiZ2Nzfh8RcCGUU6KctpFkQDnDnCO/YjCVn/iej
 HOgTao6f7w6LP54pmG66oJPHlD8dFbF2XIPMI7/yxojBXys1fmkpxopaJD3eIuPV4mABF1r019I
 XM1OyQr2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094
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

