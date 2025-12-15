Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA83CBCF8F
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 09:40:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB21610E39F;
	Mon, 15 Dec 2025 08:39:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OjWJaUnS";
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G4HVtvEt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4DC610E39F
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 08:39:58 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BEMhtf53680878
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 08:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=Z3dXAwZWQrX
 iznkoQcO7REoUwgPXToMeXoe6XzLEAy4=; b=OjWJaUnSMoVHGmjEYa7k5SmdQNw
 GvXUPQBa1AhpGUJsO+WETgWYbb3W6Hd4/PDRnDiScIA4M02HAjWbz8sLFmCSexCH
 SBZG9MRWqWlH4v2JryvxiPcVB2quUXacP1CxCB/Ky40KCgYwMuP8mN1OHezYRgg+
 kHAc0ZJuInPOM+UpPAmXuVnF//LZF7S+yTAkREgUZyn1+LU1Fqitn6ZbgGre/pb1
 K3bF0FmlD+6ULIk3pCq2Nkbio7ACbjqfI9aaQ3UlfcuTY+6x5Yeyd7wGZ2mPESKj
 x7fcAR2jgJfreVCB2iPivPtwgFXcl2zpMoJP2ZvxKVSeNC0xfUa4Sl4fZBg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11a7urpx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 08:39:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ed74e6c468so45868721cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 00:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765787996; x=1766392796;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z3dXAwZWQrXiznkoQcO7REoUwgPXToMeXoe6XzLEAy4=;
 b=G4HVtvEtAzhxFJgRPpEsKCpKEAkekm/TQwOvIae2qwDFkKsLBXw9wid8NgYySow6Wa
 w21YgdIY4vcgG06yi/3cnAVN7uQN4WJTV6eRlRnplpwLUp7p+dvnr9QZlNDTkSNFCDDy
 ULhBPxsBTyQG1HMuISZmarkrIQ4uNbSkyrQ/tCYt3n3fafenVRCqRAf9e0wDe1bc5r0Q
 cTISt45nvw0DxN26nR9Ve3BlbSSn/Og/aSTlyoHVtr4fiYS8WPHQeMNidjehpfwAcYmj
 ZMMzedJL9YC2T916Q9FZn1uiI0mqZkZ9CPlPwmzyeWw+yzuvNgqTiWt+s0haGZXXk68y
 i3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765787996; x=1766392796;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Z3dXAwZWQrXiznkoQcO7REoUwgPXToMeXoe6XzLEAy4=;
 b=ACp7VaIQoj8dBOS4ojTpwGa0m3eczaVS6BFvA2s002N6MlhkLAUZGieAPlH2cecTJp
 2aaLCtIXEgSBds7ZZM+fRMQUWeOfo8gsjQdlcdSyG5mKtn2UrALjBJZI0JT5Cwt8ifnP
 RBzZ4XfOLvFiz3mhmtTLllvpJUsM0spsWsxlwJYZPye6EvdtC5k3pPwV6hd3lJMFkOuC
 pOCngrApJhFdwhOPhQ0/OwXz4w9X/IahchSq5uNh3oa3YQZ9OesVtsL7mBXTBdTOa9wM
 XXyHO6dtAPZtL6gSRFaLMeM951COBI61zee5Yvojt62JBBhDOQx7rsaoNn0PK2jrebU2
 Yagw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU19PonE6fszfli3gMuURnAr/6Oq+yIblnt0AJTnv8f9UJ7/3Egtp24/UJdGJ5xJceFSCRrmPJ8suY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnaPG89QwrgLZBrzfanxcPD+RCTrCgaMSNVtvtMHUVZ+4PAiI8
 tZzq+bZhV0+WqXwgtxm+66lQlDOfxQWG3pD6vKocVp7c1ZwUFaBVNWTBgMendlOnNk1sZDtG5TK
 w6Rfx+mN/UKsWEqTwwFTzjcKEuBM0+XdXtJJNBXqQqYUdh8NzWQnadCE4c7AGgzUY3+29iEM=
X-Gm-Gg: AY/fxX6mDe3z6cIwprldtevLiuTCHQzrUakc8NY4q3P6G2CuWy2pSj1C9Jvy68O98Yi
 l1IwjBF0AGywmad5UbHZ/juFmd9xqBw7gejlfmNJxLIIGrLYlzL2V7iLyGQnaLxvID2XcSeNROL
 Po0xaf4T9QBJz/mykyqV+yi9arOTmm4X76XWtWLX/T1C4TzdBiC8w3WZMgZ7+n4ogK+adJ+Gj1w
 9JCbzO5BzfQl7QxUMhyw2YoRtVwGtKcBp4hz/+Q4aL4u9Ietvm8dzHs1lTWxc2jv9kteLkfNvIN
 Y7TVypy7HHy9jHHNY49xorroNIfdd8Gx4JR6f9XdIAxAABXFZ9mHlOawHrRJzbMr+tE3iMe/ae4
 zfZ7TGh2dw9t66JTCqrWV0m/52pFzQvkzaxlmvT/EJ+PXrdRHH6qIN0AkyhC3IaRpN4A=
X-Received: by 2002:a05:622a:60f:b0:4ee:2984:7d95 with SMTP id
 d75a77b69052e-4f1d04ac58cmr145353921cf.13.1765787996236; 
 Mon, 15 Dec 2025 00:39:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHoFWVPMAV6JlXUuSiLN649BtOiFD1OzCUudJcet20PnZk/76ESO1U7JtloETSwBkU1CL9nCw==
X-Received: by 2002:a05:622a:60f:b0:4ee:2984:7d95 with SMTP id
 d75a77b69052e-4f1d04ac58cmr145353601cf.13.1765787995655; 
 Mon, 15 Dec 2025 00:39:55 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4f1bd6b50afsm90557971cf.21.2025.12.15.00.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 00:39:55 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 yongxing.mou@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com
Subject: [PATCH v3 01/11] dt-bindings: display/msm: qcom,
 kaanapali-dpu: Add Kaanapali
Date: Mon, 15 Dec 2025 16:38:44 +0800
Message-Id: <20251215083854.577-2-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA3MSBTYWx0ZWRfX0xy07V5pPQgL
 l8ESngtlxaLvEi3hmC5nlDAxq8z6iqFdjV2+MNhi8m8wc9px43+TNhgXR6WfguAosXIFofFPCs3
 XtNkHrvcML2aXnEt8KftBP1XVo9wwj1rgMiVILugGWMWOOvMRSflOUKM+TQkrF2qdUgf6iNy3Ok
 DVQAd8yfik+DCoUGwCI+NaggrZeP5jYVdwTzXHNXoa50hqQkPdJXrNT1tg4taSBA7Ook9h0HmtF
 q13FQtW0BCNDNzxUu76seJ7NAq/NE4ni4L4YLAirl7vOuaARzEI3iN/lCq7UVzdchGgnlWCLKAS
 XLsVVVh/9DdWF6MWMR8dLMP5uoj0djTizyszy9jjP7GeP0rYW/siP8zH4prREVvh5nV0il20REL
 6GNkVeEHM3DgBk6GAJCBsdYBB7SDuQ==
X-Proofpoint-ORIG-GUID: tnJntoRWDABrCtWXpH3TgpmCuannFlkB
X-Proofpoint-GUID: tnJntoRWDABrCtWXpH3TgpmCuannFlkB
X-Authority-Analysis: v=2.4 cv=aOf9aL9m c=1 sm=1 tr=0 ts=693fc95d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=LEfPF28z9Y6gGZEU5FYA:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_01,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150071
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

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Add DPU version 13.0 for Qualcomm Kaanapali Soc. The Kaanapali
DPU and SM8750 have significant differences, including additions
and removals of registers, as well as changes in register addresses.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index fe296e3186d0..e29c4687c3a2 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -16,6 +16,7 @@ properties:
     oneOf:
       - enum:
           - qcom,glymur-dpu
+          - qcom,kaanapali-dpu
           - qcom,sa8775p-dpu
           - qcom,sm8650-dpu
           - qcom,sm8750-dpu
-- 
2.34.1

