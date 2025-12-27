Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90097CDF84E
	for <lists+dri-devel@lfdr.de>; Sat, 27 Dec 2025 12:05:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3157010E617;
	Sat, 27 Dec 2025 11:05:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="epRBDnwf";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fz8itGTN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5428210E0E7
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 11:05:19 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BRB0kmL3806803
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 11:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=BPfv2zycZsU
 jT5oCP1yDoGfm6asCBAPyv8E/KDYudps=; b=epRBDnwfuV8FWaKvtD9/woHaByo
 3noIpu6eQTTTeJlKAKgQhjjYWKxg32xGdFc+Gsy/xw6of5BE+a8uMRNd6/Upgy4y
 LzUw/pcRuXtpqJbisl4diqf+HC+p4iLrdK6KNl9ZHyPcrq3B1zWXzDu/v3O6LLw6
 9Pwh/ajKXVAhNFAHm603xpyOKlDfDsh38QLkkZdB+lDlryexQiuhzB4CZRgn+LXv
 AK3DliOM89myCw/1VanOGlZWD6OaRCLFDmFQJU9VrBcnrIPWG4h1d+Y+3l2gH/L4
 8M+OMXKUmgWw4P7UZ3vXm0eMDeenLxkBgqTw5loEUOtGaCGD6PSvJPv+BAQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba55e0mst-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 11:05:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ee1b7293e7so282843531cf.0
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 03:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766833518; x=1767438318;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BPfv2zycZsUjT5oCP1yDoGfm6asCBAPyv8E/KDYudps=;
 b=Fz8itGTNYp/DEoG+vLxDbU0rYZydARatz1J7bWiE4hSmVX5Qr77cVV+vEMKcixXJYY
 979jiMsnG92SznktytMI3LgDOvR9W031IySzHyT1Cc5JtfYV+1i80f12PHM0oIEiFuFp
 xVXbCqlDOdQpnmrLQRAHif1Y2ibT74ewWVY99gpVeq49vtT9PazygMRr0IpuH4nzhCZb
 Jf2MNdNWbkVupizXLmlOnUrAu1zIaFpQpzNT1FPVeqQlW1iFcQvIdhfp+1LqvKTAVCA0
 q/6lWtyOZPqp88b5jZL82LlB5GpC5WbI0obk+f+RJnXwUWqUuioe5AN4EbyEmSsEe92B
 58fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766833518; x=1767438318;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BPfv2zycZsUjT5oCP1yDoGfm6asCBAPyv8E/KDYudps=;
 b=JglU3cJ6IKytadGqocTOrJtl8d5fwGozEqfNcHzUbmDwXv4DA9tkgAx/AwrEMo2Lp1
 iHwHBw4GVwbf/n96TSeJY82ubE7C6YtloIRQaX5SkgM+7LjpQXcPN4RwT5//8mIB8Frt
 R43nS8UJDSMZdZO6rx7HXD5WEX9s5dI/EqMOMdBNeijmjzRbcMuzM2c3PT6802Wud9kp
 wOlQxIpmtiZZZSE1THKWP8GsoHzRIwJfkAPiF51YlmPoDauWTOYroOoZIn7wthl1Ws28
 jaEL0doQoivITBXgncnslSkQQps1oLjTBr5k92Yu8uR85bVv2wobuFN0zLnVMkaelEgK
 xgAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUuzp5tcHjIUzRIulGhCP+GjQbDhqvz9WhZDshp6D6v/CngYBhouoQglgr/hD9Qjjk5s/h814IgSA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRboZGKuHkiFDA0q7BqtsguQgLzob30Y+zRBScaKp41jStF4eb
 AoONvPgno3Xli9Rm5+E6YctAdRm8bC9D+6c09EpADXHq0ThU9TkDOLW3Z2ym7IYJC071BF733B7
 0xgQhSfDudX0IKpILHpjjZdJveGH871cGuyLKsSj/fnA2zfsF0BA1V3QnSVNbe2K/Xvn9UL4=
X-Gm-Gg: AY/fxX5AXzzemRN96CRXeI70jMg044RxhX5+D5/HeqSVpcTciryy/eyBwy8fULFil+b
 ae8si9vfCQ5TC7bIS4vBc37hS7PcXezvFTpOu+5amXbnb6gLbR1LBmC31RoeZIAm4U9f9WMw33K
 4+QikN7TVzEEbWMGDaXb0na3kO7G/E7Y2ZuBcvFonsVb8tgTFfS3zs+ER/DvG0tgIxTEq8yw2wS
 2p07QJIRSGRlKD2ryE5nhG7xoKaHUWGj7dj2DKEis4J8OIMF4EruZgxc9BVnGQP7fQ0e6kUjszk
 L/oaPoTTqxcQTL25gv+bjT5U2LxD6aMG/wTsHs/rtviyV9kUgIafXEK4TTb37LMae8sCg0pXRWL
 Bm4NNPw4OrD5/V9eBkaUxTro/
X-Received: by 2002:a05:622a:1195:b0:4f1:de1c:dfa8 with SMTP id
 d75a77b69052e-4f4abcd865bmr383465171cf.19.1766833517968; 
 Sat, 27 Dec 2025 03:05:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEHvGvRSyzq+3qUQopeLslFpXKkNgnVyM1Jsfx28ck1r6pgHr/0bBLCofpk1Sy1bs+bbzB8hg==
X-Received: by 2002:a05:622a:1195:b0:4f1:de1c:dfa8 with SMTP id
 d75a77b69052e-4f4abcd865bmr383464601cf.19.1766833517481; 
 Sat, 27 Dec 2025 03:05:17 -0800 (PST)
Received: from quoll ([178.197.218.51]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea830f3sm49080283f8f.22.2025.12.27.03.05.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 03:05:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
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
Subject: [PATCH 2/2] dt-bindings: display/msm/gpu: Drop redundant reg-names in
 one if:then:
Date: Sat, 27 Dec 2025 12:05:06 +0100
Message-ID: <20251227110504.36732-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251227110504.36732-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251227110504.36732-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=928;
 i=krzysztof.kozlowski@oss.qualcomm.com; 
 h=from:subject; bh=l/WIpoT5rL3gAyOallcL5sMSQzwxVeXAzYzBpvRRWqI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpT71kyaiPiKFe7xEVyVYavtc+2vx3axBv3bjKc
 RVuwZd7ZreJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaU+9ZAAKCRDBN2bmhouD
 1yCfD/0RWSo7Ulp2JX5p9iSdlRdKoLypBJ1rR5PDv77wXQppqAVjt4sBgBaKPmmJML0bhqedgRP
 gDOJ1HwJDa5VyZtbIjVqvPNjKKgNIDrXi8CTak2hRiaH9mXaAeDqudNmNYV9+WmcmPjBQ4cO6+S
 7y0CjUM2d2oPf0/X6IfuTdvQNfmpzijIpHivwXvRZKNyTQQTHaaFPWJE4zv8AHSLqZI4H9jWubs
 Z4JhYPSdWaLpjrZID5w0VRVGuZ/sqN81j8MqWmE0DoAstAS6NHpG1oLaV9nF9fEaNNzKqRV7SBe
 5d7RespEW8NRsGaYvS+VNNV1qAPqnkjYSQPtySGi0XHK20Pnda6kgYm2kedru+IREXrZHR1FAyc
 tNbeB8tFXGl/UUtf2zKSwrv1LL9U9muVEkT90IiC0p4N2pIaOojPq1q3H4ngW0ZuBGPG3eNw71n
 qv/R42sYhEDsbpMoFtsb90H8Sv9yzuiVdzBMck16KlGsF8aHAi7m6RiuTldvDAh7p7N+BqzmCIz
 d3UXPg+0yy/cIs5by3rxU2C354NDgnJaRpfimkcitx85ghOhYCMe4cB8RBe26yYq+OgJrhUdHgV
 mQlyuxJIBoah8BI8qLvTcDBr7pyiTzw/hzWrLJcBH3yjTaYcvyEErdZTMwr+HxngP1CDhryiM4+
 v9eor4qm4Yqlxig==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDEwMyBTYWx0ZWRfX7xyeb00CApAI
 HZh8/0GpWhWsVy3IXGLGKgjApu9io7w/2l/V+lWM8jz510rCkcesnOGDKzI28/tARhuMQQUsuEa
 4nbhALBkg24jAC4CT1RSn7bq6BW3IIfzymihGAXlyv7/N2AYDVvW1hcY29PudrBfij3kSYKdR2N
 KrRS0EhPFrASV09EJOxP9o+salyYSFbosZ3gezlPsr0/ZCm9kQCVI7j+k0Q3ibcYlnprum46smU
 zLlNOOgQFw2GRuCEbn07321spA+5cLyUR8jNMBL4R2BJfMxIkNyFgYuF4lYyXkczCAfV3YCDjxo
 Yx7LjLi4oG2XuFgN7PYoOmW5AUY+GHPSvagDCJIzKsNSCNJXMFE8w1B0+FFWprDl/1mfRcDX2V5
 SNQ8wf9SOvjE1pIUMKnRhMVqGOpTY91jZRalRS/G1yCUNQKujOfLAx+7AEiFSzetQ6fnnLyFWNm
 x68JCWqJsaqWLj/3yFg==
X-Authority-Analysis: v=2.4 cv=UMDQ3Sfy c=1 sm=1 tr=0 ts=694fbd6e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=hmARNUlj3OVxZ3RlbIsQyw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=MCV8vPsGP35s7PfGzH4A:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 0ktfoIbNi5Jw9xpmOlQ2la4CQuNb8n3y
X-Proofpoint-GUID: 0ktfoIbNi5Jw9xpmOlQ2la4CQuNb8n3y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-27_03,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512270103
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

Top-level reg-names defines already proper order for "reg-names" with
minItems: 1, so no need to repeat it again in one of "if:then:" cases.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 1ae5faf2c867..2e916309abce 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -402,13 +402,6 @@ allOf:
           clocks: false
           clock-names: false
 
-          reg-names:
-            minItems: 1
-            items:
-              - const: kgsl_3d0_reg_memory
-              - const: cx_mem
-              - const: cx_dbgc
-
 examples:
   - |
 
-- 
2.51.0

