Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3A8CE9ACD
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 13:34:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A7D10E8E0;
	Tue, 30 Dec 2025 12:34:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dpEsUYm0";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j0pJNWPc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC75510E8E0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 12:34:30 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BU5S98d900113
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 12:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NAs9cDcXq7JdZBOmv0oBqsRd++k1ZPNg9na3e0+ANvM=; b=dpEsUYm0oR1J1bmf
 zXsXUpkVO9/8ZB8FHrGcZK3S5HDAaHGlYFuNx3DJkI2v4fbAjVJO2L2eSxl0dfKP
 RfVHiRBqP/Y7wUoACzLB0XvB+9V2v61zkGayQ2yPeff+Yr4EdhanrWxySGVyyzq9
 2O98wOM1UNTYbBRkwDFahZH9xpybeWOVih8yBQ0Kzexgj22R43KGZCdtriZYpBg3
 BDaPiBuEnxmCttR1wu04dTsIHS45Ere7Zz/frmNLZW48PFmWIgRRgROOGpj8jyAe
 gJnejGK7YRAdYET69ohDCjzjX8o7K5WADU8PdC5uh/4dEbV5oT1vYDNpaKNV+4qe
 C2/CpQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc8ky0x5t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 12:34:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2a0f4822f77so273915235ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 04:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767098069; x=1767702869;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NAs9cDcXq7JdZBOmv0oBqsRd++k1ZPNg9na3e0+ANvM=;
 b=j0pJNWPcmeNqXM8SFn64DyJ13CuLLDXyweMlKFmfNTEZlC7L86mS/rR6Drq8EIGjhu
 FNEBXrdCf1z/XHTcRDYgJFgrnAU+naVW9UZcOJzW/YiORFIgmxIJmLEfSWXFZ/NzBe4D
 cModJZi0uEFWJCaqQGo3CGh4EV83QOTTuAwsFPGawPTJR1eGvGS6KD2mP076LfLUTuzL
 X+V8jC8oH01mIuou6+SoQ2AMG4gNFGioPs3HPBEXISf2/BBemkIUN5WbUpTZ9Ib07fWz
 fLpuDw5MlhfVJlr2WzyAB+z8tMTUx2HL23Io7u7V4n/7ul2jQ0xGck+ekx875MAMZgv8
 ME/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767098069; x=1767702869;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NAs9cDcXq7JdZBOmv0oBqsRd++k1ZPNg9na3e0+ANvM=;
 b=ixXpz9uQ8AJuAQzGzrlhrydBKXgBUIxpgcOV5bqnI9GWGGGDKUefVOHZ59sVODMhE5
 mk4fqyYbWiZDJjFBVOVZ7MaW3y9CC9gPN+xoC4D4VvzeBf3cLTz92RZ4nNu+EnoFKpLv
 XJV34gvZzPht5gg73g1YzHTpAF2OgfpDafatEO1PFC5T3xU6bYx/32k7/gZXAMkMf1iR
 7qnK4EujARDpMdpHIaIy5QkC48YMO2f2oCLIupUjz36s3KkW9PLKRbcJH0SJMZTjE8fy
 3k4cGCCffG+E2K6f7zmxIb2OhFM4Qj+K2pk+dN36Yd1E23afXR6VWoVYmEnjUOdgQPln
 Zdxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwavL2Ep7yPoWxbYgwfGN/F7qI1OIKQ4rmBv79bDgdu4FNr762kjuS7TtKUZC4PUMZfzs4g2Itgqo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxAGCUz3SkccO9NaWkuovni5aXKR2WPMZRaCEcic6M+fuTXag6
 AdRYF1D/9VKVQ1wINoKVjJ1vDoNtJkGzykjxP/vC0ivdGEPm/8OxW46i8Ksq/MVACLkE+NWXDrD
 IuYwpLG6AFFEmu+47CRmhKNRh6FIuzJxPkXc5/fyPshxsm6FlUX3jrlDhVXA0YS6OWL4C5n8=
X-Gm-Gg: AY/fxX4dMmPIHuUEQz1K8BuYugzR4IROgIqQq7GJPRFhXAY8Lcq8gdlPEcbStNNOsju
 TjNrzmQycYw5zCRXXG6QrdH0bFuOldtl7zhDRAqm688bFM1PanWKINftfueZGbg3BwsOl+9ouVU
 7/i6/Dx37BJEIfBpOEDHE9UxUJv6Fj0xXixKuUvn5ZLtEK108BxOmieJ5gem6OE8dB2QMXnJGK4
 ARHJ80Sx+J+piAdBI0oo9WiM7nmZvXgtELX9Ay9Z4hy9JFjFkxejhmKkP75Y/H5eQaIYBdf8MkT
 AFhITrqgMz3k2DuIQNQ3S3cfedAM3Wfr6o78UwOl2qhN1w6HWze7UcGE2sh0tx7qUsDC21Pgag7
 bzQ2g1NfTfpY34/ZRah++UXoevY27x9wUkQ==
X-Received: by 2002:a17:903:1207:b0:26c:2e56:ec27 with SMTP id
 d9443c01a7336-2a2f222b5d3mr347420315ad.19.1767098069471; 
 Tue, 30 Dec 2025 04:34:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFOj+Jt7FWW/tx6wdupg4tsy4BPTQK2YMy5OILP4nJWqDLIJNYeaaBFj8U9AoZfQNJ1CYnfzg==
X-Received: by 2002:a17:903:1207:b0:26c:2e56:ec27 with SMTP id
 d9443c01a7336-2a2f222b5d3mr347420015ad.19.1767098068884; 
 Tue, 30 Dec 2025 04:34:28 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3c6a803sm295748695ad.6.2025.12.30.04.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 04:34:28 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 18:03:28 +0530
Subject: [PATCH v9 4/4] arm64: dts: qcom: qcs9100-ride: Enable Adreno 663 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251230-a663-gpu-support-v9-4-186722e25387@oss.qualcomm.com>
References: <20251230-a663-gpu-support-v9-0-186722e25387@oss.qualcomm.com>
In-Reply-To: <20251230-a663-gpu-support-v9-0-186722e25387@oss.qualcomm.com>
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
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767098036; l=823;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=JtBAApNY0JeyhPIQIegtD9qcHVqaABy0l3e+bF7RSVU=;
 b=coZRt5MPySgLfD644OsvQcRrvI/RAD6aN9OJ8pn7yvtm2GmqPTvY734oMDaaw1BsYl3rteTjF
 HiMwmWv/QRqBmtC/Qnn3PLJ9dU5st1Al6NxXmXvVM9yGHzbD49H0JBq
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDExMyBTYWx0ZWRfX5wrEdvGqRI1B
 /pDn4MPkcERDonOGxVoST/Li4rnhF3S7z6zEkCZQes32QXWyBeTnXI9oNgBbqOfrztCLVUGIixW
 uH1E5wiAwKwAhhHpoGA/Cgu6UL6kJRuabW0fwIqm5fW27Xfb6sRnD0unelkkF4GJY7SjIC91Oy/
 aj3l/sBtsoC39k8pfbL4Xj9PGCx1qtUgeU87e5mDAeAHE96byBBq2jO70RaDUgUMELJbiXGHkip
 IC2GEwUMQxMdWq6Fr+yA3D+cOY3a7c36MmHGV8brq1CoTQJSSc1QVrnXCWhdX9sVN4DUuQgS6kp
 6cnvi7JIrIYnYGl8M6q2buBwhp+fz+mNVvD2Dl43osTMkYoov+6LZuPRgSWwdgotzyHkwsDt7Ke
 aGuymYONt3eKKdQlgJsekxhl2wizGiIe6T3QHsgO4eLCDlUvJ0e/7zpiaJBavAAX7s4U+rCQ2+u
 U/qWjeWfHxlqd3Xr3Iw==
X-Proofpoint-ORIG-GUID: qPc_FxT2VULUMHemCJYSAxK2MBNZ7IUE
X-Authority-Analysis: v=2.4 cv=BuuQAIX5 c=1 sm=1 tr=0 ts=6953c6d6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: qPc_FxT2VULUMHemCJYSAxK2MBNZ7IUE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300113
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
index c69aa2f41ce2..8fb7d1fc6d56 100644
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

