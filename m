Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJCIGDwFq2kMZgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:47:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12281225698
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:47:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F228610EE01;
	Fri,  6 Mar 2026 16:47:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="A2f4iqvG";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OSp5cAsw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEA3610EE01
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 16:47:51 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626Fr0fT549932
 for <dri-devel@lists.freedesktop.org>; Fri, 6 Mar 2026 16:47:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vA3WhLlP1iWl7UcsLAeaGw5jmPq/306vzHJjVKcA9Vk=; b=A2f4iqvGh5/XTNxD
 4BsQ1urPOXzpo2jJkDEyA+P+E5+678DZqJB4tOYGf2b6C2Lc3HtfdYVByFj9uvvh
 W2sHYGapgvK8Za2JHW8JEvi9eKAObnJjbxpHYPZ0ABbuVu6QQbu26O72MG0ElRx0
 YIYMwoNVWxQWMO/bwt0TNWwK1X7ONAtpNgHIpdnJVXuXGp1Qd+UTxdIGdEb3fhWy
 64wETICqqpcdy8U1f0EGhGuezmIl3LN7mM2VqXqj0EK2wR0xKhY1Q9ooe+qMCvZJ
 n+YEOzdYbpdLA7/LF/8k45G4euVRIWQRbahEIBQ9S22oCymIHqmGJHE+i4Hg481k
 /Xly3g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqruka69x-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 16:47:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cb0595def4so6476600985a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 08:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772815670; x=1773420470;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vA3WhLlP1iWl7UcsLAeaGw5jmPq/306vzHJjVKcA9Vk=;
 b=OSp5cAsw+lnshwSjDENc5PTuUBcF8xjOorlGX8YZ0fCARBb9H36IP3t+iSmh/nDLNS
 gkF1cYOYvnmZJGmTOHQXOtKRHnwcG1rIaR3/d4kZwlCRklHTg+4zfEu/uJtyU4VfU1kK
 VLVrqle/2u/wYw2qBz6AGFukur+3q9c1UKIxt9FzUoycybRU0KCbPgbPRRsG3fj3qVq7
 17e0XZAMeGnfZl5MD6UKmk04x4lXO9FQcx2XXLFUUMoF/kCJhpqJmZfnpKAU6E1viy99
 WDL7GCreUWuk8LmeqQS/Ti6SUbeOAoqvXp9+C+IaDSBUcYY/rMxxz+1U5l2LD+xP7G+0
 kbzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772815670; x=1773420470;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=vA3WhLlP1iWl7UcsLAeaGw5jmPq/306vzHJjVKcA9Vk=;
 b=rMqRJWm8l7wQ0DPTBtVwW7T/WmdtBXly2u3gmPBVYCg+pIcy4ox0Nka7dBknh/PxeG
 g4/adYCpFTn8ecfwrRkE0SC3P8pDCkIhtEoLs53nOn+0OdxLBu2O2hgjNLQuxAmKd/vf
 4BpV3nmhxYRjjWrkomJA3zyJXKiOYJirsMK2lWxlZa97t7E+ozp3YxFcaUMz7yezSiDK
 tZ84dbo4usU5mcWG7eYbwigPFOtlC/ccAHpBG6qgCzwW8AS5prhQriCNuhj0HiMfxovI
 Hv9NPFNfxR69M4EOaDFolx48VLX+oQgsH7EWo6ja+qPM9dfQmfF5QreUsGgQFN97Zxzf
 hoTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIMb2P2ae/P0dbAu/cypAeOQL2use3/K4usEK1M8DzCxo9yURJU9nMNjY7EWHXrVmrAhKAdqtaklk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/pKUvvqZk5/XQoJdg/43hX15q4BiKnKOGqT70eF3S5DJT9KSW
 QtnrpYmqzEZPd4jvr8A8RRrbRTVjSFqSFu3aM/LDF+kJG9/4uNiuRvwvbPmxGh5cTb2tFitw2oK
 cTLgFwMf1gyoBum3rwsHImXkvmMuu7GtYHhoo9tY0XN9I5qd2Yo9unFQr/fWbFMT4MveUwXU=
X-Gm-Gg: ATEYQzwbgerOOZl0iE+x52hHoZIues2rxnDZRSR/G6cAhw9H28ZmVPOaW1MozfDYee2
 yqWTiult+RQGC/LsBn0ocPrNnusRr6CyBGjRyZeFmImG96S/j3FJQvaGooZp2Y3OtUtaziock6I
 NwC/xLBah52YUezghEUU80IToYyFKHNwZ/5NSCXBB6zPg6mq/Lty+JHbLevEcjPrB+THlGnVFK0
 9/UmKaq3KxlmQorwM9FdbSIcKcoHkqYPKy/tfod7vl4ybvJh2D+tcKG7MZ2XBNY8351Xdt37vBi
 mLEXCSFY5fIqOZtAPP+iOUlfhNPkn64WPZ6Bf2ewfA8Yyh2nqd1OJvWMfAlTAEHghWmCXNW0DDE
 QtT7AzH9KdFnp7QNmNhOoChJvAGzzTEljtjkgH258i++2XLEC9DbIRrqEOYxqLRDf/R1paJMqiL
 iazDsQbjeHEXgiAafIbNaWGWdClJNkBi/MIn0=
X-Received: by 2002:a05:620a:1a2a:b0:8c7:79d:f91b with SMTP id
 af79cd13be357-8cd6340944dmr796463885a.6.1772815670161; 
 Fri, 06 Mar 2026 08:47:50 -0800 (PST)
X-Received: by 2002:a05:620a:1a2a:b0:8c7:79d:f91b with SMTP id
 af79cd13be357-8cd6340944dmr796458785a.6.1772815669559; 
 Fri, 06 Mar 2026 08:47:49 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:47:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:28 +0200
Subject: [PATCH 22/24] soc: qcom: ubwc: use fixed values for UBWC swizzle
 for UBWC < 4.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-22-9cfdff12f2bb@oss.qualcomm.com>
References: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
In-Reply-To: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5938;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tj6XzNi8kmutyETp0LxvPkXmIY6ffqvxy5q//a2BCA8=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGmrBRDIinuB5A3uj3d1RagdnQTSCFpIvCmm/XUFw1DrPZ2uS
 okBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJpqwUQAAoJEIs8ij4CKSjV4rwH/jRY
 pPq5zx6h96JKw20tkm5J1a3/9U3wAxmnVKSgEH/W5IKGN8m2rXObPKmsT0yndu9ogJ301zVtdLZ
 l+exOi6aBj24x/cd8Jv2uni9gAkcFJBtZ+McTmRJhdG93gaA759YowzZXt4KaSQu+Hy1uADwPEG
 GJp7IA1m82AzotujR36vroGpqziCk4Ra75MquvlFwjtz0TroezsCvghusAflWjX81jV9rxnI4oW
 VDQnR+I7JkxCWgA5C6sE4LnKV22oeawjA0+p6K1RKl+dbTGjQSQQZo7Ccpd986sXAy6yOBSFnfB
 UdnxYzutczs/Yl0/Znk+4dNtw0q0JuOoc3NYzTw=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfX4CyFa3vWzQ3o
 DbQziSZkjB6X/qHd/ha2taxthQJAlFt4D9SIvA8TjvHjd7JzFuO6giZ6P3FGnRbfeuq0TarX6ms
 /Un1FkYar4CtyyT7JAdt+fZtSh4efm/hhUhDWNtdRmsMbO4RxUXWDh+SiQLCvFAbjHOv2yhBN4B
 RlftS/qbstQN3SlJPs0//HEXf9cRCdjE1Ypbnmyg7CuP7WWsypejQx/9H2I+KMUSEi9XGxjKlba
 p3i8xn3Xu8a2ZWuH2uEBNNviK9kdEpGiX/RsNFb+HPtmNp2d5jV7KDBcXF6Ip+7hdB5TIx+3e4J
 jytI+UD48IvsWr6uskVTLdX1wJftrnmndfT3f7XpL4Gh9a/RidbO74W4F9e2UMvqwdoEq9C/jj4
 PuQhBLYz3RkH1tzXpMz8tKWntIFM8KlNTdQLS0dG7ePB+5bWSPzdsanGf/2M1EJoHpdLwtwgMT3
 znFXZKW6JyNyQJUbrQw==
X-Proofpoint-ORIG-GUID: gzVCWP_zCbdscto3LFYX0A6nMMJO5KoH
X-Authority-Analysis: v=2.4 cv=DvZbOW/+ c=1 sm=1 tr=0 ts=69ab0536 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=8a_ODPMxA7UucN5sxwIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: gzVCWP_zCbdscto3LFYX0A6nMMJO5KoH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060159
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
X-Rspamd-Queue-Id: 12281225698
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:andersson@kernel.org,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

UBWC devices before 4.0 use standard UBWC swizzle levels. As all the
drivers now use the qcom_ubwc_swizzle() helper, move those values to the
helper, leaving UBWC 4.0+ intact for now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 34 ----------------------------------
 include/linux/soc/qcom/ubwc.h  | 33 ++++++++++++++++++++++++---------
 2 files changed, 24 insertions(+), 43 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 51de36f5f40b..49edfabb5e18 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -25,17 +25,11 @@ static const struct qcom_ubwc_cfg_data kaanapali_data = {
 
 static const struct qcom_ubwc_cfg_data msm8937_data = {
 	.ubwc_enc_version = UBWC_1_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
-			UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data msm8998_data = {
 	.ubwc_enc_version = UBWC_1_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
-			UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 15,
 };
 
@@ -52,94 +46,66 @@ static const struct qcom_ubwc_cfg_data sa8775p_data = {
 
 static const struct qcom_ubwc_cfg_data sar2130p_data = {
 	.ubwc_enc_version = UBWC_3_1,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 13,
 };
 
 static const struct qcom_ubwc_cfg_data sc7180_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sc7280_data = {
 	.ubwc_enc_version = UBWC_3_1,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sc8180x_data = {
 	.ubwc_enc_version = UBWC_3_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 16,
 };
 
 static const struct qcom_ubwc_cfg_data sc8280xp_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 16,
 };
 
 static const struct qcom_ubwc_cfg_data sdm670_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sdm845_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 15,
 };
 
 static const struct qcom_ubwc_cfg_data sm6115_data = {
 	.ubwc_enc_version = UBWC_1_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
-			UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sm6125_data = {
 	.ubwc_enc_version = UBWC_1_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
-			UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sm6150_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sm6350_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sm7150_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sm8150_data = {
 	.ubwc_enc_version = UBWC_3_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 15,
 };
 
diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index d4a0cfb133fa..0cbd20078ada 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -22,9 +22,6 @@ struct qcom_ubwc_cfg_data {
 	 * UBWC 4.0 adds the optional ability to disable levels 2 & 3.
 	 */
 	u32 ubwc_swizzle;
-#define UBWC_SWIZZLE_ENABLE_LVL1	BIT(0)
-#define UBWC_SWIZZLE_ENABLE_LVL2	BIT(1)
-#define UBWC_SWIZZLE_ENABLE_LVL3	BIT(2)
 
 	/**
 	 * @highest_bank_bit: Highest Bank Bit
@@ -55,12 +52,7 @@ static inline const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
 
 static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
 {
-	bool ret = cfg->ubwc_enc_version == UBWC_1_0;
-
-	if (ret && !(cfg->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL1))
-		pr_err("UBWC config discrepancy - level 1 swizzling disabled on UBWC 1.0\n");
-
-	return ret;
+	return cfg->ubwc_enc_version == UBWC_1_0;
 }
 
 /*
@@ -88,8 +80,31 @@ static inline bool qcom_ubwc_bank_spread(const struct qcom_ubwc_cfg_data *cfg)
 	return true;
 }
 
+#define UBWC_SWIZZLE_ENABLE_LVL1	BIT(0)
+#define UBWC_SWIZZLE_ENABLE_LVL2	BIT(1)
+#define UBWC_SWIZZLE_ENABLE_LVL3	BIT(2)
+
+/**
+ * @qcom_ubwc_swizzle: Whether to enable level 1, 2 & 3 bank swizzling.
+ *
+ * UBWC 1.0 always enables all three levels.
+ * UBWC 2.0 removes level 1 bank swizzling, leaving levels 2 & 3.
+ * UBWC 4.0 adds the optional ability to disable levels 2 & 3.
+ */
 static inline u32 qcom_ubwc_swizzle(const struct qcom_ubwc_cfg_data *cfg)
 {
+	if (cfg->ubwc_enc_version == 0)
+		return 0;
+
+	if (cfg->ubwc_enc_version == UBWC_1_0)
+		return UBWC_SWIZZLE_ENABLE_LVL1 |
+		       UBWC_SWIZZLE_ENABLE_LVL2 |
+		       UBWC_SWIZZLE_ENABLE_LVL3;
+
+	if (cfg->ubwc_enc_version < UBWC_4_0)
+		return UBWC_SWIZZLE_ENABLE_LVL2 |
+		       UBWC_SWIZZLE_ENABLE_LVL3;
+
 	return cfg->ubwc_swizzle;
 }
 

-- 
2.47.3

