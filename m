Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23681CE9ABE
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 13:34:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 810FC10E8D7;
	Tue, 30 Dec 2025 12:34:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OEFFuAyE";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NOfYXecW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44CC910E8E0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 12:34:24 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BU54LIh3539781
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 12:34:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 aEVGgk43InWXkMlLBp7TeOfwGrquzepV3s4rSmf6aYs=; b=OEFFuAyEu7bJS70j
 bzvtz8ZbQct21UjEyrooakqrq/RColVR96ir5rpwryYthuhoYskAimiy0KUcDJ4v
 CB1ZaRlaMZQm57L7Xb9CDim6OpD7Kr+l3q+TSLMPb/+MJrZlApgIQrF2yfbFnsH1
 KIXZ9AxZPeCM4pIUqPCm+pWeZEiag639mhuzJhLavRVjHWN1eVZReqD2ipuSf51s
 6aTNfxUwOpRLAY3qBh9nkscwciObwroleFYYuJgEe7LYUQ18qqDNLz9QmNUqBUcV
 MKyE4cL94ggyfNJInCv5uvJRuDdY/Zl3K8PhvlD7AhKsgRL9tEt+dBxGvhZE0zla
 1n/GAA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc88yh051-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 12:34:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2a090819ed1so81387935ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 04:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767098063; x=1767702863;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=aEVGgk43InWXkMlLBp7TeOfwGrquzepV3s4rSmf6aYs=;
 b=NOfYXecWiv0IaPG4YD5eFvMRPoR2Yn1oa9D9xUg3fYlA4I9nYrUL3QKYo7Xre+uyrb
 d1fIVYFHqj5BLGGuICdJSxBx+lCIsQOPxa0iPJEHRvAbNcYalgC/dfvGiKE/0VxHqdtR
 O9Ie8IKVvw5NZ82Bigur14VyeAuyfH0MXmaCzyNRLxzN2E0soBN0hu63S/YtpU6ptQen
 NYGfGY7ilXFuasCOGLjvlppCSuSv905WnRIhGrDWjZFncz0clgKiR/7nosJbrOZK1nDO
 NpdCibB2Ab2Ce++6q8/N2w988gymQauOwXtNiy/0NHLCAfubzIHVpVE636LIwsNAZx+i
 TCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767098063; x=1767702863;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=aEVGgk43InWXkMlLBp7TeOfwGrquzepV3s4rSmf6aYs=;
 b=H45Jt55aueMMSgUU2kDW+iCk/l6Id7uJuuIvaOCpQy6rn131gwmvcb05dpXT9MnFVi
 W7Ihzd0KwL93Ncs8ys/9x4dXS8udDqdkPClZbhMndsz9gN/+kCCasmVIAMhTO2jFz3zB
 jaexcUg7kcgt9vlOEcNoGGlr/rx8pN36CcL0T2EayFPat/0lnJsGLruT99TNJKzjAJMY
 wahQPM/8lrDmq6grhHwjOVWINGJS5rNmGrii0FnMah7/MVr4SrAn6JThkE5RM67JIp8X
 unOzrZQGq51X/Fs975/CN5wAk5npFIMHTNPJKDgUY/JznkShZyIu1w7RVyHEJO6lkcSL
 a2Tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgkmKO1m5fX7oj8ANt4R5Bv1ME3q4MC8lL2d2wxSYbyPKGY392thnf+ggHLAUXxg1RJTtzuWbS0Uw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMqbTV9Pe2ILfKejsUIkQ/v5tYBhNr+aRVVSlgin1b1r3osfI2
 vXKW/i4phJJsnLx3x+Kpl/k15Tn3GWDk2uUpvajeowLx2KXBOdJbPanEB3BsYn8dse2FMQVCnZB
 pXw490To4YtDLjVZdjkziz4zVYtc4YvbL5BtXTHad/iNh1mfimITUheETZdhikAgjyTsCSTc=
X-Gm-Gg: AY/fxX6phLt54zo6xQUOiCEwZEfWg1w2EjwU+0RPGtzR3I6Nu0x1AZ/wPNpI6xst3ks
 p8ZvjK0ZTybaOyNJcU5ZUH7Hm9wF4Hp1QdR5a9EMuq8v/mEPtVELJpj3fdcNK7TGD2tY0g+tk93
 raJFBCyP+8bTQnaOkcjg7k4+HufGOv9sgcFJJdpNJDU4ghBkz853sVfxpU0M9Y2PfsW3QBCoNAs
 Llays5u/p1kLOez/whX+WC1hdgqn6ylxBXB9Jw5RuTq5vgFfCYZDsyrDDieKFJQyChSOXzI41wc
 vOvEtzHIuITcJJC+7mt5iWFKUfwlaBqsmFm7VenuUMcQh3pWGEGoMiWQf2YZJle2b+f9FaNTmQN
 t1SIMV2kAC8EXrsdND//zD0h3PtugALai1A==
X-Received: by 2002:a17:903:2a8b:b0:29d:975a:2123 with SMTP id
 d9443c01a7336-2a2f2a4a33dmr253486435ad.60.1767098063064; 
 Tue, 30 Dec 2025 04:34:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmUlMjN0jkXXsLDM0SUj4DZctVdikMsb13RbrT2rvJj3FRqIOh6cgbO6/abhTatzQ9x/L5Dg==
X-Received: by 2002:a17:903:2a8b:b0:29d:975a:2123 with SMTP id
 d9443c01a7336-2a2f2a4a33dmr253486345ad.60.1767098062600; 
 Tue, 30 Dec 2025 04:34:22 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3c6a803sm295748695ad.6.2025.12.30.04.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 04:34:22 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 18:03:27 +0530
Subject: [PATCH v9 3/4] arm64: dts: qcom: lemans-evk: Enable Adreno 663 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251230-a663-gpu-support-v9-3-186722e25387@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767098036; l=748;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=3NuLQ7ILP4nX4v4WKID3hOQ6idOK6brJb8aAZsNOqx8=;
 b=wUjP9BE+EXI92DFSQNDKgSm4uzwATlh0dVGWbBXws19VW6ZI1MhWCZLGxCpMCy9LMdlKGJ+tJ
 z/PjNhxzyJIBHB0iAm2tYl7SXz949/61j2aCy/sdteGpxiL7YyXzmdr
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=POcCOPqC c=1 sm=1 tr=0 ts=6953c6cf cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: xz4-Y4yjLNm2umEXEm9x0ZstG_K2LBhq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDExMyBTYWx0ZWRfX96B+qF4bhVXy
 H0IE1Gae+sFE16Yft1vRJbQXG3IlpHzUlyLtbeRst8WErRWzHuONFWhmfQSMUTdxzbV4UoVd0P8
 7qrulSSttJzKp1ExGH8mTf/cqepagZebgl/413CF2LcE+KVoVwnMWnl2QHJebU7BVh0YCiVNitd
 4jB5OUMy5RlCm8p5sQbK6udNwRu+Ms7rKUrZaoMsCqwTr91lfX2mcVm+UVJewQYXIARrmX3rGnd
 LY8Dv5+VIG/7fOo2Rx9Ny/nqf3gkpSPUdMO2zWG+PzFGYI92jjSzJJIhKOsEZZF6ln7sBpGvBtz
 7py6oyHbvSAzvypW8Eti6TRHK44ZXiW+iWifkO1aokpcannoI4/xcu/UQ/WXnkWkokMEo5t+D9i
 8pjuzlI8pxXGqKsbVHo1Y6FwPV5TfHcF/2LZ822KgIl3x5pdFMJ02pg23WMacq4w1kBE+84KkM6
 T6WfDa55slNWEhV+6pw==
X-Proofpoint-GUID: xz4-Y4yjLNm2umEXEm9x0ZstG_K2LBhq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300113
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

Enable GPU for lemans-evk platform and provide path for zap
shader.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index b40fa203e4a2..28bf152f5fa8 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -454,6 +454,14 @@ &gpi_dma2 {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sa8775p/a663_zap.mbn";
+};
+
 &i2c18 {
 	status = "okay";
 

-- 
2.51.0

