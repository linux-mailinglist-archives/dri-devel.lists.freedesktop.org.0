Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90341B5158E
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 13:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B2610E8EB;
	Wed, 10 Sep 2025 11:26:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WF5z1w/i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F5410E8EB
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 11:26:37 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AAFEkI031279
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 11:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uTuT+xoD9CIqTmF+XCt73ZauYNq2xf3D0o4LX/E4JG4=; b=WF5z1w/imCQRNDQV
 2zRa8DS5c2KZfi1kyN94/IxTDYN+cV4qP0SE8/EqgupTZv89TB35c7CCNwVPy/La
 2DU4vfWz8ijebHnw2wExRXvpsDDKhfUWJh8Hb9BTpweQf4h2BxBS44HVxDqJDWkx
 rxBOyFmPh8C/YoKIv8iR1qX0A8ZhMhtmXGeNFApHYPg+nVzESXwETtDCtOTWiOJx
 rUhFc0mfMOqHRc6U3DO2qxA0ccGRI3C2STLYSuh5Nn+yvxPypKrDUed6eEaDqFN7
 tUqrPLwB/MJdVIRcG6z2a3KI26sIcx0uPT+TWFw+NAPNdPX4FSuQGSyZxgjjWe94
 cFeJGQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t3803mp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 11:26:37 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b4e796ad413so10335183a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 04:26:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757503597; x=1758108397;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uTuT+xoD9CIqTmF+XCt73ZauYNq2xf3D0o4LX/E4JG4=;
 b=rcATUFdBB2OChCtP7H7XyowANO312ULDzzQXXZCfNxt0Fd2LjDpwRpVRoquurAOPpu
 DDRoKi/vShlTi2j0JBphB61wkZbYGy5qzLBkosJ6giU4uxrTyPNF8GL4ndBw/5UJCp4P
 CjR+jdwHh2C5u32viXSguYorGjTuPUVRRR7f4p2MkupphVNTvNrIrdCYls2oWsl9d2rh
 mc4K8iWSLrJJ3A7QYlPwkejtJwCvBrAWfsrcBdGLmRK7NFPJ5eED+kEaiH5zyy9jNekR
 aOG1adpRyuDfoxAJfzABeuTBTTveLK7kZl8jRU1q6ZmWka3b8JhZtgRGlenblfrg6PJY
 inYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCViwNIdcMHLlR7ZfLLhpfEFyKbvl8/eWRKMdKSgbOK10GtPC7e/wp19TqwSdZee+77wYEgImyePU0k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNEH1qXqrPi/NmWKmU/Yj8WRQ/cchSLmRuw9XcXxYNt7vnEtQ3
 JCnBdgdKVNRd1druH0Z8EaOmx4Qk4n1AZ9MZPSl+F0KgXOTaCM+cjCBWJ/Y1a92yWKWKPAPuxdX
 JtyyQQSlHlX72ELNzdibDx67EkoOcIn4fQpLYFAqqQNwx8TuiofNgf5rD4o6p0sQ18tg+LBQ=
X-Gm-Gg: ASbGnctZP22zgxRE9EgcjP4HlRIKqgngAqkcqGcI5WI9kxpdQWvvSBhtQgjAEA0o5x8
 U4Sa5Zb3XeTYUr5SHAKWacryrbEWS8WiLDvzXJxIXZNazMppWsYVRsU8NBxF9imsb47kNZz5vLT
 X56c+EPbbQqNRQeM50uZX8JyiWYmos89+eizvZAhNNfl9rU90EJKoN5YPrsZhuCw9BhnNc8DUyA
 MbtyWkWiwwtOWET6WmvVOslAMyt+/mzATpg83PEoL3Oh6QTvUsIsJX6gUijRtf+QURmNYIKtFuN
 LBhpWOkZtoVjPpO4aeIFNJcDviWbtY5BX1Y48VhKf/RoPmtKopoUjZ4cYfoLuu38
X-Received: by 2002:a05:6a20:918b:b0:245:ff00:531e with SMTP id
 adf61e73a8af0-2533e94d135mr23613221637.12.1757503596572; 
 Wed, 10 Sep 2025 04:26:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHu8n38cqjdfKt9/1s/M/MeQK58nlWTbkHvgUjuxlUJFIC4snQmD4oj/oPkqGgfcrDAzAET9g==
X-Received: by 2002:a05:6a20:918b:b0:245:ff00:531e with SMTP id
 adf61e73a8af0-2533e94d135mr23613180637.12.1757503596105; 
 Wed, 10 Sep 2025 04:26:36 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-774662c7384sm4862260b3a.76.2025.09.10.04.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 04:26:35 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 16:55:25 +0530
Subject: [PATCH v6 5/6] arm64: dts: qcom: lemans-evk: Enable Adreno 663 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-a663-gpu-support-v6-5-5da15827b249@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757503556; l=802;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=lvtizlHL6MS7eo9olZSEO8tIpxGFiSCKBoj2b3IlTA0=;
 b=JAVAIdqmrnue5/ks+VzoXSDwPNFYkasv5RLMnK3+t3s4vjQQ4iplYXmNDUzqGDU8F4giYFc6Z
 NdvaJx8nFTYCc26y9qynH/pfcd6GTfKURUIPJewQ3LieME0ZjgXcWcW
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: lHfFhGYx8pACPihX24o-rHq5jky-s9tS
X-Proofpoint-GUID: lHfFhGYx8pACPihX24o-rHq5jky-s9tS
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68c1606d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX0hEWLwBYQvIz
 JIK+wL+dqe7Drt83o8YRVk7/uB7//5JyVgBhLPGouhPNu+m4tUtho6kBihAS77eS4FKsY7achOn
 qjw0OUlH0LPoi050rB+ieEUxm10L7RZJB8K3dNOJgGOHbhDfZ8T2lFunxA/lIIuq7fMyh1DoPq6
 p0/bSsP4bGIKtSffxNQQdr41qrnuJgCXhRSP5eiPfWXZxeuhT5Ie19xZjQfaZASSj43leHiLBho
 8R0ki+hl1PLlgS6nHB2Sn7ejzlIKN4lnE2bF7zfvD4F4SqYOpAyPAG1dn+VMh1TuXXxlPWeZr+D
 cFp3QBXKC2M+dsiDcTc08eIzelkmLVDSNiLF0VJn02Ff94cNBdW+iSZsSVbP2RLX/c1wOxGyRZe
 wsgYKAfQ
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

Enable GPU for lemans-evk platform and provide path for zap
shader.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 669ac52f4cf6aece72141416068268531fd9f79a..876f43d761870b968e43ea1ecc360b4403f19fef 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -253,6 +253,14 @@ vreg_l8e: ldo8 {
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
 &qupv3_id_1 {
 	status = "okay";
 };

-- 
2.50.1

