Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFdzBagsqGk/pQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 13:59:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7371FFF0E
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 13:59:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0810410E9CB;
	Wed,  4 Mar 2026 12:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WuZW4Bdk";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YYTE4s0c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17AD10E9E3
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 12:59:16 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6245SPCK2861128
 for <dri-devel@lists.freedesktop.org>; Wed, 4 Mar 2026 12:59:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ixwUNY3FhPaLn0RIA0x6OgA9msiCTyxEpi5p5oX17h0=; b=WuZW4BdkRexaYpNV
 P+EENcPl7dwLMtle/8EhyG0s+YqpZeqwHv48Z1c+YYBoqOJeC1fMCxg1XiBxjlBI
 CX7Q25qs7OLIM3f/MLCp35fiPoWw+Sk7m/q7grmtuoX8OdZhKMHhiw0FQFJNx7N/
 1qCEu1p8ISCl8xhAE2gEaSiyvxlfTFVgKopitM138EeyWEdmNKKngkMlmD/qpZTh
 sonmODZj0M23AZ9L3UoLYljYlu54kbMskRQHvhGIeb3+IEypo3L6TMkuclq8Zuiu
 64aSCtslbiHUcRV4O/ZcfXsg3mkhlFjiachs4kyQzmuoxquoD2MFPoB06+raT1n/
 DolPow==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp2c9kxtk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 12:59:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8cb3a2eb984so4871009485a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 04:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772629155; x=1773233955;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ixwUNY3FhPaLn0RIA0x6OgA9msiCTyxEpi5p5oX17h0=;
 b=YYTE4s0cQCPhP5YvO9gnsW/fNNz8+54YXcwLVdLGkv1iXFi8096YU5S+NQjUIlTUbX
 aMnTFNVD8zxLvCgqku5hp9CRNetE97npBJtrrzwQUnDsiz+XiHW4owKo41XD97IQivyy
 4ySsvdlgxHJBBGceCDFNT17s19EqFIP9pwmASLMmQ5lwJCPam1N1rF0/WMuJecN7Z7sn
 NMvtFq/iFawq99+UtsAee+8AN0QfDyks66aO2n86l8bhdB2DK+5NDKPFkQho3csseILg
 eEF8pmYlhOkuCxXvbbmNLZG59ff1iY5RL0t7t2zoJQZsJ+Ns/PmX2LcC3miK+TbM8649
 D2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772629155; x=1773233955;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ixwUNY3FhPaLn0RIA0x6OgA9msiCTyxEpi5p5oX17h0=;
 b=q7gxbeQtkU85H/aduPB2PXajeYwTF2igC/1rRFsxf6v206fueX6ss9cro3TerDkcCB
 b8XmDvHgFkl8sP4/ljdgBdlf7oyjIS1ytz/r+0xRMSMMgMIYLfvzpJmtBGpu11CVHGuI
 /D9gjb/H/JFD1+ofnc4Zx3a4czfVo3tJrj3CADMqdTnBjRfUA/QNSuZVFTbuEfGQXfly
 1Ku60kkjXlIHoQAl3Djzfm5n8RvwrfLjrWw83FfNdJpHAIikdyeZX5CRdqaqByWM6+Tp
 A0EZmQIBtydnoRpHSGynS7nIdTq0bj/Z+ii12BTUGRMfcTAGHWsbf+giXE/3ue29e7gu
 gcDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWj7KXn5WIL4yKwnRc11xK6+ljdvBrCdWWO8bdn4HwOvR3gyc//g66pZzJg60hZwQdKEnI0UP7dAaE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTde0DyC9utNeveXcUSwh/ibHzKuBloF3A90ThiVyxb3hRT3V0
 U9XYZtoomjzQf0+jza5OkYnH7KKTMjQukYOGmkGm3NqN0odZwxHPZ4wLm23Iz4Hp9ME/3tzzAYr
 1sOvUzjGpvQKzyrKA1yj8P7icTpq4Xv85vQ4xVgTrTpj0S28vnN647MnY91JOUQCrxJEqPfHiun
 JQLJU=
X-Gm-Gg: ATEYQzywKNTNYQs747ov7ZHv3nNty5WuEJMzTVK1LbA9lBztK25sqbbc3O4MOcOHZ3w
 k11VoITqmRIswvZwcxqouj1+PgyRC6jUQnTpL0erP8X449lFp6q3ui0v9F5ye5R64D6cYSh7HoR
 wmhRW1moZtymNqQLI5+iKEXzDpz/4aVzE8Eg+rHPuEPsUof6bzZ86PBZ9oqrgLsh/wLuReDR4zC
 XT4lYoEI1E1Q2KbIFp4VsB4UGiezBPfG3zxPpGmni/bmE76LhzILacGMzTnFhxIr/PD3vt0dlMB
 7+T68vKROCGVr+dP4tDpItjIrTzMMT6p5jWWeuY6rM8fyfQFTas7PSA6z0ydE2JiOVaa3Jl4fjb
 P0uO/0c3Djeob5/ilGrVAHrAzvnDHyRSZ9At+9XjsJig7
X-Received: by 2002:a05:620a:690f:b0:8c5:2d4c:4f0e with SMTP id
 af79cd13be357-8cd5aefb869mr209346185a.25.1772629154883; 
 Wed, 04 Mar 2026 04:59:14 -0800 (PST)
X-Received: by 2002:a05:620a:690f:b0:8c5:2d4c:4f0e with SMTP id
 af79cd13be357-8cd5aefb869mr209343885a.25.1772629154510; 
 Wed, 04 Mar 2026 04:59:14 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439c1fc577bsm11318491f8f.19.2026.03.04.04.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 04:59:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 13:58:48 +0100
Subject: [PATCH v2 6/8] soc: qcom: ubwc: Add configuration Eliza SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-drm-display-eliza-v2-6-ea0579f62358@oss.qualcomm.com>
References: <20260304-drm-display-eliza-v2-0-ea0579f62358@oss.qualcomm.com>
In-Reply-To: <20260304-drm-display-eliza-v2-0-ea0579f62358@oss.qualcomm.com>
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
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1611;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=A0isBPfvtv19/rZF96jjkXvuTjw3cs72aAEpUz1TX/g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqCyPA7rdAeJeKkp3B2oG0OtmhA3bWB1CytGVM
 MPyrhLeajqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaagsjwAKCRDBN2bmhouD
 1zXED/sH4ElI088Uuw9/j1e01n/LV0h8NX6F4MbebFIP11rTOcoqlpwyBQ+jui/P6Kp74V3q420
 lyBv7olmR5rX0vqOv2oe3Bb5ecafcbdTU+n6WWKNqrKxpPfz629IikyO0nmK4Uweqgn21ZTpMm5
 5d1BsIexofV70PghYwAgK1o7H8h2FpQqLfGnfH0R++MPczNV6nRjYhq7p8tzGE806DBNlv9gs1N
 RPyRS+Ou4WqrclwhfXxyRFPtGobqGW19V+QYUay6d6zff34icNfFW6XTc+7DrpvbLD5amClDSch
 UcigbuPTVAAkxQcniS7oPWUVSdfrCqqomtMMheoSTUr0waL6yypLRr5mxJRgww39xm8kYW0Irig
 pe625vKqz7RTzDvv40d1vygKar5Cb9K5DK2LybipbO0fUAMHGc7WCmTc/HkrKOBhIMLuYxc79bP
 nDNjPurNiM8mbclG13jGhqAn57xznsg5YhItI9MCvJjCQmPILrP6ihllk0AR8m/DchkALlo8W4m
 5+9J0KvU0Y18ymxnkD0qbdl5Zex09dw1/4oZV5tWJ7kilCsK3oJZaaaAgq1K50VglqqVS+NYO+0
 eBu7IObwEekKMclLEaxM7cecu6Se+IL7Z0LfgO0ddXsWFlGrIdBuJJa3C18UOEKhqyjXoN4u4yQ
 QUz34oqo13KAA2g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwMyBTYWx0ZWRfX1Nz8BtWUjJKK
 hG8tYDerTWnWyQ/LebFa5llKl374lw/MVfjtq2OVV4Ani2ZrmltAwKbxl5121jaBNxOc9LRK9og
 +PsHFqiFk2F6mnyRqTtTCzq3vzb17W0165jf88GHq0cFbY2pwf6khjLM40Zx2RBBdarpOezePlA
 /G9WeUAzGEkcrJGWpWtXjuUemsyppCZkSCNa34M8gzcL5FYhlQXr4gQ2UhLP/dyELHPGjBpcnHt
 BpRojdZ9XyXyQRW9Mjp0OakCz8gjSMs5+77vgsnS2BOOWSeas2LfbywXFg+wY+kdEI6HSqGVdFX
 4SsIDxQLcQMj0zkQe5ckAvPgpSunMBaRtEZMmLSkNUUZxGgL4YsN4tWqpzvid5ocNa6Ibf8QrZJ
 s8KeOQnHcbOYZ2VG5GoqTS/GzxnELAp8t68VFNxnCfjztZU5A161/RAkOmqaI1hmUWkk+k5gRdC
 yICbPBxTjCjil68xk5A==
X-Proofpoint-ORIG-GUID: hpGAM2nkLGWoOoRhAa1SGjzXrTp-TIRN
X-Proofpoint-GUID: hpGAM2nkLGWoOoRhAa1SGjzXrTp-TIRN
X-Authority-Analysis: v=2.4 cv=EefFgfmC c=1 sm=1 tr=0 ts=69a82ca3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=-43RnHntoZIaUBb-iF4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040103
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
X-Rspamd-Queue-Id: BA7371FFF0E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_khsieh@quicinc.com,m:jonathan@marek.ca,m:quic_mkrishn@quicinc.com,m:neil.armstrong@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Action: no action

Add configuration data and an entry to OF table for matching the Eliza
SoC.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Use data from manual (UBWC v5 as pointed out by Dmitry, but different
   highest bank bits).
---
 drivers/soc/qcom/ubwc_config.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 1c25aaf55e52..633d1efa0883 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -16,6 +16,16 @@ static const struct qcom_ubwc_cfg_data no_ubwc_data = {
 	/* no UBWC, no HBB */
 };
 
+static const struct qcom_ubwc_cfg_data eliza_data = {
+	.ubwc_enc_version = UBWC_5_0,
+	.ubwc_dec_version = UBWC_5_0,
+	.ubwc_swizzle = 6,
+	.ubwc_bank_spread = true,
+	/* TODO: highest_bank_bit = 14 for LP_DDR4 */
+	.highest_bank_bit = 15,
+	.macrotile_mode = true,
+};
+
 static const struct qcom_ubwc_cfg_data kaanapali_data = {
 	.ubwc_enc_version = UBWC_6_0,
 	.ubwc_dec_version = UBWC_6_0,
@@ -245,6 +255,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,apq8074", .data = &no_ubwc_data },
 	{ .compatible = "qcom,apq8096", .data = &msm8998_data },
 	{ .compatible = "qcom,kaanapali", .data = &kaanapali_data, },
+	{ .compatible = "qcom,eliza", .data = &eliza_data, },
 	{ .compatible = "qcom,glymur", .data = &glymur_data},
 	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },

-- 
2.51.0

