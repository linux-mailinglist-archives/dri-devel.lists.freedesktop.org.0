Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAB5B51590
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 13:26:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 953EC10E8EA;
	Wed, 10 Sep 2025 11:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nxhn8LaC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C3E10E8E5
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 11:26:44 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AAFEps031267
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 11:26:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 itWnLUDQYz9rGMnzsBXBwWW0Rd78skgWmOLQTl9Qpc8=; b=nxhn8LaCEa3bDh7F
 fdAiO6mG+7bKEh3PMZQrDeC5ekneoK7d47r11mgCzXfvqBkOzUfBRSODtaIoHtEo
 yBmBDoHV02+lIuySvUlCm/vuNFwoMnP1/2a2DOKEPrr1g2D7HT/vLEi+LWM2TW2d
 vxHHOXM4d+uu8Ir5h0n21omr5DvW/f/4Ty03vQFfkMDsGa52qOH7131PQ0lTvlYj
 hVVE/fkCM2U6iYK+BF19DOOO3Wnydkpc7vb43Xco8SuF4M4pec4lMs9CVzUdr0Py
 nlo3oZ8iz0jVEkt02xoufBC5EpD6gr7qliSdKBkVVF9V5Nzm2eRtIFUrukqFwI22
 lt67nQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t3803n4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 11:26:44 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7724bca103dso5775291b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 04:26:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757503603; x=1758108403;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=itWnLUDQYz9rGMnzsBXBwWW0Rd78skgWmOLQTl9Qpc8=;
 b=f7IUw7VHQRQCvsOq+ScKhjagI/B4uXLyFBRA8OOp1rhGjTLomp/LmN3LiJQxCtrIXJ
 V+TPf8J2O0sTo6+w78K88lXVmrtsusZnoD8US2XVRWyPe8rvjWtmAR6AlboTy59QPcpB
 1tGCc1DlgNYh8HRmbRGjap6e6/S6ZC4Xp+4RlHq3zP85p6op0vzWy80kp94iFVe9iLSK
 duKkq+ZmqkSzA8Jf9PZd6RBWdVrd+I1adxqtfXU9hn1g3YJHiuFKObbbRkRIt3h+8+5S
 /qsx9WTb6utLog0BHhUuw0JnFQTM05wOMznpVgtMSocXIILnfLaySz+rYZveTrq0yhym
 Lf+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFblAckteGjUuE37HadaTi1A5DRsWXeROK/saRU+tXDsDvNCkBliI8rJ/xu0J8jlE+4/AimnZSmvA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypHgd28AydStM38GZZRI2UjMIER8RvYbP3PWZP+q8P4+Tw52Zy
 S7Oe7XGLeJvHz7E5JLCuR2pWHFknyZhtzCw6yfzM6MXLFJzrZi8Z1qp+Xtx++U/1qIxWkd+w75u
 irPwNhj3Tu+V1p5hKCu7PM3W1gcZfrivw78gcRQbiKIEcLSxOGcC4VCH5SphLBHdfWmHkeIs=
X-Gm-Gg: ASbGncvtiOv+6zB9hPu9GHfq96rv5Y0hloaJPYTYsqEM9EeVW3FHeraVBHnUOHWp3EA
 r4TTPRL7xwM3KGXqlBfi7XbDqhxY1+6iAxX7gH7+XWBjkC8GfJ18aLnECIDV6wE2FTxPzGoUJtd
 5mEjutpYkA3c+h5s8eAuvkH8YsL74pnGIHR3RqKDXoE/w6u7l/mHUqYVybL92t+OmStgpTHf9QX
 e8Y8Du0xniMR5wnUxES8egeXBgC0R0SogZM3QJdT24UXZObSIiq5u4rcrf0VJ+3wliCDJSLnMdV
 Lg9dSWoTGYGJkeRobPzJwH0etgzZ8yadfwjWZWN9OlTdbfwhUFv5Kqp8UBvH2z8W
X-Received: by 2002:a05:6a00:1acb:b0:772:43a9:d587 with SMTP id
 d2e1a72fcca58-7742ddf13cfmr15993637b3a.20.1757503603005; 
 Wed, 10 Sep 2025 04:26:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfTJXsij5hahDr1ImNYphI7GxV4OZZqm++kxMfUWKVSn/3R0ZehMj0Y8qLLTvIRj+LObzBYA==
X-Received: by 2002:a05:6a00:1acb:b0:772:43a9:d587 with SMTP id
 d2e1a72fcca58-7742ddf13cfmr15993609b3a.20.1757503602566; 
 Wed, 10 Sep 2025 04:26:42 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-774662c7384sm4862260b3a.76.2025.09.10.04.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 04:26:42 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 16:55:26 +0530
Subject: [PATCH v6 6/6] arm64: dts: qcom: qcs9100-ride: Enable Adreno 663 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-a663-gpu-support-v6-6-5da15827b249@oss.qualcomm.com>
References: <20250910-a663-gpu-support-v6-0-5da15827b249@oss.qualcomm.com>
In-Reply-To: <20250910-a663-gpu-support-v6-0-5da15827b249@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757503556; l=879;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=9bfHDTw8kTerdOD9ddHzM0+SjSgjN/43Tp5eBUWS4yw=;
 b=XpUaKnoeyZk7w/FeU47t7sSg+CjlI3AMryk4mP+ujUW3bZO9QGZth0AXHtgh0Dlc6Hh2YTBlu
 mzbgNxKo85aDvADCC/lnhgr7fWtCz/LRvs6TZLlVAMNXi2DK4XDF7hw
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: CWhF2I4sa6N7ywH7OaOEEUSG5BG82jjj
X-Proofpoint-GUID: CWhF2I4sa6N7ywH7OaOEEUSG5BG82jjj
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68c16074 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX/xv/aRQL9ZNt
 udTzVma+cy6idYV9LCTN+0klVvi4aUKy3PUR7oReIgZ9XTaaS3z+eTlBHkQb9Bce7uo8gUJ+QDp
 vUs41fBD/ebN9GvoKO30xzcFE6DyPii3B3L115BDc7mZ966TcR6OXZ1a5Qd4wTgWC5fd8WfZunw
 r8QE9I9RCwAviJdzz+yHmO3b3biCeu4fzLbNAvxrUT31LYEqHSloz8uvtdt08moOKPja3nvbzxU
 78JWojHg64kdDNWScyTptIOEi64mnn0EaCHx6LSEDrS30GrcMYy27U1zu/9pBpU9yTyxrGMTBqu
 zxmwDY4paBw/5rT+qQJMbKj4QjiQUuZVe8W63V6PbN/EnNZcvmPWO3YDVns1HnwVqpH8eJysmSO
 15U19oi8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_01,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066
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

