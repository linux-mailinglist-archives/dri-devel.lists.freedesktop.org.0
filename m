Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gElrG6gyn2lXZQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 18:34:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCED19B9C7
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 18:34:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2527D10E7C1;
	Wed, 25 Feb 2026 17:34:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KJgqvo0Y";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VFGUJX4U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 402DC10E7C1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 17:34:27 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61P9SilK1088217
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 17:34:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=WFH4qf6p9+Eos++j2RKIHD9SrjwpwAU3m49
 79uhTn+c=; b=KJgqvo0YdZaRcE8XpwcMf31ts5feh7S+bEVEiovEa25WNVq9MAg
 d0vNCMLpN1TpkOd4QTrC9pmIkXpCQkzh8oNeWnahaqC+RmeXAWaQ4bnXjkmEvtNo
 Ykf2eiEgDCm0xim1VOwvRVAtZtFtxyi0z1s9/AVCBTqevyqTh8Y0nYo6nrcgVCq4
 H/S9zoeYOXs2NRo9GHD9DmG5Uei8btHAi0iq78KGYNmyWpzJTH+cYq2ppHmGYOsZ
 1gzepG91ieqLigewPfl774CT7DqhtEEZcsbTzUuEGlvdZ8WJ98O7EkfNSeGW7y5c
 RimuL8w4NT5RfjpMRW6fLDRg2pppF2+Fo7g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chh473x6m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 17:34:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c71655aa11so8464947985a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 09:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772040866; x=1772645666;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WFH4qf6p9+Eos++j2RKIHD9SrjwpwAU3m4979uhTn+c=;
 b=VFGUJX4U8stqN15STPafQxHhHKBm7PbNoViljE6PFw+B1iBK6PUczxvd2OJoW0Uspy
 4P3l8dlRlUIXCsSEGUHj086/R2cjN8dFqEqtMsgvIFsy4ObKiuynvRDq3Mh+BWswDfXq
 mWJYYTW8LVRt35DxpCoJ8JG9PUUfiJgZ9pnDcNgG9huwGZmLhXlMPndAk6pg0L18G2Gn
 V6ud0/JSHc3As357sSbPluxSsrEDdBGslZJ0Cftjg7VtVmE+noxu7gdhURqo+Wv/hXgA
 1Oy0h9D0ERmFxEz6sCTlnkm+0u09/zrbNCigDoQpW3EZ9kUCO/x3KvRcYSS1zCrzQ2Mj
 SgWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772040866; x=1772645666;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WFH4qf6p9+Eos++j2RKIHD9SrjwpwAU3m4979uhTn+c=;
 b=mZZ+GAQXnA61gooiXbilF9H39vDmfvmYjcTVMR63WD1Zpe7muveWVzi+CR0lipiXEt
 /gmX7IEDbmLOLfaa7iJluJlu5OhmTnybRtgdSbCQ0VuPxKgyi4Luf2W9Lrst6UVeOA4B
 9HPoUdJA3r8nC2oRwNTtnQQg4vKZiQAARd/xeUz+t2G7kFbH9JWa6P9me08a/YZcodVr
 DEfJxe+ggnKJ+AYJUQmok5Fb/Il7JnoOZBBL6bgAX/7r9MRDRFM3zFiJJSiFCwIUezUO
 ADO2pcVWn4IIortkszOQbMIoqY/wN618Hb8BO0zLRtXLfWHiIgR9AAQHUp+hPdkHPAWa
 VL1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKwkW+MvT5EcPoEbRBPvnOBTLrjmtJlFPEgHuJ/2ttxbjjksh/IunRu1tzdZzSp/1k4dl56B9m7cg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7ISj1KLKEm5lUPrT0CAwv7et7aY8DDDTHa9P9IXbyS4DlAsEE
 ngMtHOYGOUC1s0nKUNM/zo+EmjVErf+0uhzRl0wzPlSqy/h6+XmuT2179GHH2qWpY8YEFeqm465
 lkwNTUOQ97/nmTJ7mVR4DBc/jy0pMnspr+kSGjAiJl/Lj444w8gZBHhKCAWpYJGjRAl0+oec=
X-Gm-Gg: ATEYQzxJXtOoQlL3AW2WFvDjYvRoYo4nR753C28FDyE+X+WUusd6VgAe6CEuLPUyJ7l
 APfjyeMCuoX0d/45hHhsnpL/D6I2oaL7YKTYg0sb0RmuNfrvRMqE2heTDHwhGlHJrF2HYY6DGt4
 ajCjRySoFZNhP6nDBsmQPmZl//tUJXpHgx+5PGd+roLAg20ZTcOCykZyOjFLh8cX8sQVlWbPKdf
 ja0UEg9iuqc+hyG5mFBaBiyz+tApNwBUtncwRPjHSpdEiFhQagkjNffTnFykUCktD2XNjx4iQZ+
 1tFX+zGxV89dEy8Sp3GYbaTMhyy44Y+d/wAY2w32axopcpjr9BiO3JsQ6QYUJs6klbxdBbsJy0k
 8mZmul2qIrF6urQv+DZ1B+EcpmBwsoa10jHbvDQ==
X-Received: by 2002:a05:620a:480c:b0:8b0:f2bd:4762 with SMTP id
 af79cd13be357-8cb8caa17b6mr2108789485a.75.1772040865694; 
 Wed, 25 Feb 2026 09:34:25 -0800 (PST)
X-Received: by 2002:a05:620a:480c:b0:8b0:f2bd:4762 with SMTP id
 af79cd13be357-8cb8caa17b6mr2108786585a.75.1772040865213; 
 Wed, 25 Feb 2026 09:34:25 -0800 (PST)
Received: from quoll ([178.197.223.140]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd7141e4sm88628945e9.7.2026.02.25.09.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 09:34:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: display/msm: qcom,sm8750-mdss: Fix model typo
Date: Wed, 25 Feb 2026 18:34:20 +0100
Message-ID: <20260225173419.125565-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=985;
 i=krzysztof.kozlowski@oss.qualcomm.com; 
 h=from:subject; bh=htoFfnb+Q5MDi5Nm9SghpLmCXyC/5Gu37ciBqln2dA0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnzKbzbaWb8TaPhMshhVrWiY4izNSheH7DMLi7
 EeV+Zj50cCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZ8ymwAKCRDBN2bmhouD
 1zmuD/4wXP77oUUIpFSiATWSdb6f/J4vZxdsQrSbYremuG1BVNr0P1zIkNpHbK1GGekX4tP4Pjp
 nMEiWC1MkLOFekRs3gIwPJW+gfutLlHKy1XICcM0I0+7MLZnmzOKY7jBU7Zz7sb5Qf6oJ6bZLhs
 iL+yvc0j6St3lebPoFXbxhix8420rLhcKk9B0Yo8mRNTRWKMaHacV1jzW1Ylwc/4Kr9zfq5s450
 K5UOd0Z76Cs53fUcsORaj3M0wONYMiF1C5wx/yWZdq8j3jmHGSijG/gnE+WxhbHMs/ZxjIXaoui
 0QoGQL6eCiD8JI7eEMVj068GmEcpUp88XGXg/YyieuBOtnU78j1cIiTEDf+0aRO9uOpO8mGBQSJ
 YrP0WjUSQKBsRVAlAGJWNLnqh+t4KbP8wFc0ykl0l5yB2YI4jcr1SU/wR0/4FOVcpmOGPnU6VYk
 +oaJijLTJCXunvvFkfQs6DJ4sTN6RxAX8I1PUDzhzAZQj5OMg5tIDUAHSCj7Rz/vx+CFCdb5NOb
 O7tDb+gplE7nw3vfFylp4FE1hjexXlEmRwJzUxocw7GYoBiysPkajk0wt7WUv2QM89HY9uDAA7/
 EF2WAoHLPwdG1X0WnZYPP2CqBeYku4ZskPteZ7ObPWALqzYabLsE5rf7e+3vQuZAiWTe8G9FEBL
 OwAnM+NCMd4k45A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: yECJzxFYeGYLFQmkq58RUiNeYCw2F8JV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE2OCBTYWx0ZWRfX/jBeqR5OuRLg
 ByGCAU5oPmJTizYGc3zQ/O8RVij8cScZYPN46V+k90lVTHNFepLiPxoctdpM17mMD3bFhNf0vfU
 qsTR+tWU2QLWJQ7SymMjl4CqaHGYkRJRvYGkJ394dkdHsH7sVLWgF8RIoXFuQSiUTvp2YxwxY84
 mpt0z96MVWJnOxvxhpi2SwMNyvH/OjNrXY/JnBdWmqKHUN/+agCYNLWCoLm+eUtzdMsjB6FhePl
 +sKDPaFOx0OrUcFRLMuhs1aDJrmej9vf6qIQhUZ+WNH3Iar5hIgu4Hmsp7dBf1z8CG9uSHn/hjm
 FQMS4CFqCVY580KT8wMyv3PojaTyLNxvS5+7eKQeVNYGsLKn5rlM78ciY0jjOVuQPOA5OIG8Z4e
 +nMnGeIGMGiiZw9XHHodIooyuSLqRBVv+4sldrPIxg7DsLr+NBgA+624iweJJdCjtBIkRsoYtVf
 OEjXNR4Pva1AHkK767Q==
X-Authority-Analysis: v=2.4 cv=fvDRpV4f c=1 sm=1 tr=0 ts=699f32a2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=-U9ul3v_K11_8AXDuf4A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: yECJzxFYeGYLFQmkq58RUiNeYCw2F8JV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_02,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602250168
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 0DCED19B9C7
X-Rspamd-Action: no action

Fix obvious model typo (SM8650->SM8750) in the description.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
index d55fda9a523e..a38c2261ef1a 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
 
 description:
-  SM8650 MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks like
+  SM8750 MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks like
   DPU display controller, DSI and DP interfaces etc.
 
 $ref: /schemas/display/msm/mdss-common.yaml#
-- 
2.51.0

