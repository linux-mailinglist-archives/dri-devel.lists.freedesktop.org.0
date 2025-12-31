Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3646CEB965
	for <lists+dri-devel@lfdr.de>; Wed, 31 Dec 2025 09:46:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34EDE10E99D;
	Wed, 31 Dec 2025 08:46:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="M+FYPg+h";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YRNHNCtA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E390910E99E
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 08:46:40 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BV12OUq3971194
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 08:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hSJVO4tK87kiMBy9KdDNkzWDHU8geTacMo07r2QMtRA=; b=M+FYPg+h+wwGyt4K
 J4uNakAEcu7oXIxs1dMPENFXZuor+sO7IM9qoWGbpH4xca/tqPZS7HmZYH/YOJbF
 5lf1QgnlYHGvqBEi4jEeTcXUzVvodN9SecSqF1FqfoZanZ6fNPz2qfOuqXsXQyJi
 0HcobTvHj/iHlEeAWbGw3A7IbJLwtFXE8muYNx5WqEDB/892IBuFnBuqgRg4cvaR
 SYT5ycuikmKO0zjIrSpTY6QzpcpRDkCzYcNeWuMhKJDmcJOqPin54Cmv+xbnSAMF
 M5YH1ytZ/meYgC0NEFjEKXGG2I0va8li2jIrFXWZlA+zrolGEJcoDVtIYWFseMYP
 2Nmbyg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcdky2aea-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 08:46:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-34c5d203988so22501381a91.3
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 00:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767170800; x=1767775600;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hSJVO4tK87kiMBy9KdDNkzWDHU8geTacMo07r2QMtRA=;
 b=YRNHNCtAjRv/OHWCYyE4Qh6GsnYx0YBsLjkzJpUXQnj7Tkrs9ug2bTdlfzEIf0V1sa
 DmA9cQAlqJYKvBg3R7Azn6BBCB+1Jyt/XE05VYigcSYtq0V4W4ZEh84o7tIfhFycxZdW
 z/U9//mGxR4BYY0gfr3JGWMoBK0/D1MyP7scYGgr8G9q6tX7jUIrqwX9hCLnKKtlmsfq
 Dydf+8wS9EKj0BVyiumjUgd3TzFcgVkdh3wK8kujCaiEt1hk3Gq3QLh3LyVcsDH61aGx
 xTHv2TNGALXf/MwrCR6TdX728lNtzIKraNip050124YEcHQ+lXtD0YwpepQ31U2U1pdq
 QpXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767170800; x=1767775600;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hSJVO4tK87kiMBy9KdDNkzWDHU8geTacMo07r2QMtRA=;
 b=oFp1CLDO3SAU921M1Gz07xitrCTqrsMj358OkP667tE/0oPaP26fHcdGWkHAKFJdFp
 FXXWI2GaK5uOD3+FLUnwUUnTNiOyzg2adre4kJK0c8beMPmntsz7jhFwiu8rG1mUcGjI
 bUuM3QYhlw2fGRZlZlmTCXtLcH3cPrwn5RieZHo+BR0d0LhUYfFAzAaxSstazN/kUvVh
 R3P5g3DwYjsUInZIWeVHnw2NRqqbUQNbDB4OuS0mApQkYEabzpUL2b8l/bISlfaO1HxE
 mIP10PTI8l4of0Tjc/gsnHqzf0KP/iw8wCWFTos0sBeSBY9IccG3evfu3y/YKBL1wYCc
 Bahw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEA0ZtHwz+mHHbl0zgM52M6txfHBUmh3G0cqjB8dYD8h11GngzZSnS5FfUrRh4w68TviywEwNL8y4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlS4Z67TmjjAVPVbrE0TCL7tp0imCTMFHsDJLl0+vHnlAXgjS8
 C3ATgzdGlnSAVpljzxOuK8JH5/FICsI9Ihs+SZbKLMhk0P1UJ/puS/96F3QOXAnk8YUzDPaBXJR
 EqQ2PJLLWy/sq2O6NPW+bKEheR9bScdhHNYPPQgypRr1AeVGRkaND5exRH+qtH0+dp/EW4k8=
X-Gm-Gg: AY/fxX4A3xZ7+CUXmNFHNCoJkoyJx5FM1Xcr1C3WyYxZ3asrOWxuJ8fZSuzPhCqoSoJ
 NHJ2wOIdxW7nw/bSW0XfL7YzJzFpbcWh/B3IMIf3nQWn6/qxqwzRcMwI8jZbHbaLGf7R4MUWxIg
 9Mro0vgkv/nrg2W/Afxfyfd4WuOPwAVijPa/CHh1rxR84zX8Vmsr8lGjZ0W4CHULSVz3qHX1dsH
 0b6P2JF+LWfZbpOEn/nExngOX3M+026BdOPW9lF0DwyeDnQkA+S6B5CA2wg9tnB55FGMtUYc01x
 AO2aaIOECKSSGBz1VuygCtUUjqdiTl/UEgPaBYJNiWm5a+v/3uSVGuJG9g4MYreFwWTgxNignza
 7c252x6Jg5GtjB8YGHyDubE4mcg8i7K7kyw==
X-Received: by 2002:a05:6a21:3287:b0:342:a261:e2bc with SMTP id
 adf61e73a8af0-376a75ef289mr36084150637.10.1767170799750; 
 Wed, 31 Dec 2025 00:46:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3LZj3aQ3RmMZbRWDxlR3G3JhJ3X0q7dn5q/A2YUImhvN5Ny7zsayFNxHV8gsdTQfjWlbRwA==
X-Received: by 2002:a05:6a21:3287:b0:342:a261:e2bc with SMTP id
 adf61e73a8af0-376a75ef289mr36084134637.10.1767170799263; 
 Wed, 31 Dec 2025 00:46:39 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c1e7a018eb5sm31356070a12.16.2025.12.31.00.46.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 00:46:39 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 14:15:29 +0530
Subject: [PATCH v6 8/8] arm64: dts: qcom: qcs615-ride: Enable Adreno 612
 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-qcs615-spin-2-v6-8-da87debf6883@oss.qualcomm.com>
References: <20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com>
In-Reply-To: <20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767170740; l=885;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=svB5zAKLQ4ilLlulEeGxv7KOsmVUcgmPTb7ChJwfn9M=;
 b=SKf1bNvomDSWmG3I8m4P7wZQxwQfsnNcfm+afJ+hVBPYV2hrCwZL4JR/ccPbJ5L1auWMMFXym
 jLF8qQlA3EoDRG8q2Cgu1Ohk4yJFgA49MCX9/x51y4BAwFJrJjdAWNM
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA3NCBTYWx0ZWRfX+ABfFfg7LjGF
 EfPNcQf8+dcrTpXqH16jJGTKZ1I2MLo2TuGjE+pifhZnQu29UeYt7LLW4kRaBGXIJKK8/S5WCUZ
 qua7GpyRb9TeAutNxXQ6bEPRBQEYiuCa7G5sj2wyFs5SYuz7/LS9JZXWg7xeZnNcWq/rQM2LXI+
 8mLli86SaZVM4WSUVRK1/+LeFRehXLx8z0KocOZBJjjYzPVjNffZlkD9UM33U0kBGTRI7l1ia+v
 AZgDjmzqUGEjwJVogx/5cScScFnXKgLAB/DdrMaIBXJ8Stulw9viNFaQDe5HY22wOrrA6DBLMDX
 D/HHX9kH0Kr8UGxt+/UlFBA+raS2qyOslwMXdE0Wn+uodaTw6bUfwM0jPLnwE6UEHf3ot5Tj4HS
 vjCKqgimf1xfNQdcEuJ/nC+MUsxvjE2A1j+xFncmfxTWXV1XndGqh2y56FXsVOjtAIgtmWHzs7U
 UE+oKC2nLEnuEKG84mg==
X-Authority-Analysis: v=2.4 cv=Wskm8Nfv c=1 sm=1 tr=0 ts=6954e2f0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=DDenb0FKNr3EH7qfFfMA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: aeZAMPlIsiDJ7CG1MrCVV1G4d30qlBT5
X-Proofpoint-ORIG-GUID: aeZAMPlIsiDJ7CG1MrCVV1G4d30qlBT5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512310074
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
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index be67eb173046..33e33aa54691 100644
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

-- 
2.51.0

