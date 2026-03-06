Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDaKGCoFq2nDZQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:47:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6342255DA
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:47:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00ED310EDF0;
	Fri,  6 Mar 2026 16:47:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SHyqn30/";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ki+q8n/n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F09EB10EDE8
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 16:47:32 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626FqvN6549917
 for <dri-devel@lists.freedesktop.org>; Fri, 6 Mar 2026 16:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gmnFPJlHzxIIFhYmKoQungMgxWFw/K8lJH5qH0kO8lQ=; b=SHyqn30//lKMgHjk
 YbJvYJ4ll9vpAgyGxrgQNSXvNDSWaMUVX9IRRfmNNKHyNAEpA4OFXUaSfS0DiPYI
 ymFOZyRxXCQ9tkv0uIsYhQ1SFRSqEKEtqYGhuEk4pMmQCWiMUTQr8KD3NfcBGQ9X
 /DwkdMpy98DWXY4mNzNVwTOz28E3/rYRtP2BtenQOG48G4iy47sbrqM4QpvG/x4H
 qJyB68zyWfG8ja7EW1cGBAG2qTW8sSk3XbNskmFhyBHvn+Pe2P1KsLUMXdkdc5lW
 nwvMd4gQK6wJ2Zt7zBsVZgINpuENU0G9kCkRpp/+pNt+BW0YH/wa+aC2d/kQ95yX
 /+BKTg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqruka682-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 16:47:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8cb403842b6so5878318585a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 08:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772815651; x=1773420451;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gmnFPJlHzxIIFhYmKoQungMgxWFw/K8lJH5qH0kO8lQ=;
 b=Ki+q8n/nylaGzzjRYggmZ1PWiuSFpN0G3extG0sUVoOU1Tx0klmGUVs0lA2qDhQbUw
 8SaElroVT1VrSkDfePIsWWwNIqlsmTFuAoOwi+297UzNPrORbexXLHlLjJrrP9EEBJel
 /fTHLNdlJwfsvkjBq5zTkN2HfUll+ol/zX0tmVXyLnjXJcrqiTpUxuvLfoJYwSRZoC/R
 W4B142BrCNO/JH2uCF/AwE5YZHDN6YzSeegLy0nwLBq1y+y7/tJ+9LMA+GJXejM+lXGR
 1XkHyplpL/EM165shTACJk/zULRN26Dx5jd2+5N3UVvVzSVvTtAOYARGYVVRfpmcQHtu
 ooDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772815651; x=1773420451;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=gmnFPJlHzxIIFhYmKoQungMgxWFw/K8lJH5qH0kO8lQ=;
 b=EQX3kB/97IPWvDhdlf6D4TrRnsQXS3YSOH1Gd6/YsTHrqAci4OwgFh9hWYilOiEwrj
 7nZPTEj5LS1Ug/6lZ99xIr78uNzUfmQ7nYNze84C6qO+mZcI8ZfmEZ2qzJ4Tfsqqw4YG
 YjhmrTLc3pdsOMPs0hifJq7cGXyWsGfRkc++t0BW7UMDu4Huyb5FNVsgZqMG6u+TZxcs
 32dzrAicdcJHqm2UaFq1aVRaTSR/oCy5XvHJDTc5k6S6Fb3rTTVwG8mzNSChHwZLE6OA
 XK0WWk7LT/6bcs4j+MJta+2YwDXkBlCoVU1uYCI+QjZkmHU17jdGlzqhUepG8x5ewDPc
 6ASA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUC5jIziGVOiq42Blxdda59GVuJBRMOFkj/bdA5zIrNqkDuPXZuEXxOl/dPn89HSdj0wolVJ6Sjr1E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwInFhQf0l14nl0y2YHPKyVRlBz2sQTVjBrpbZRZHo2uWlbCWjV
 uDSEzFjxd3OOFbJEToxZBcNTebxiUN9g4r1baqsvi83CBmz49GQw++L8DxJbr3QaMFGdXxjc/9L
 LZtrQkfah5p7BX9gYE5epRC2w/1cESQatYTaK88+uOwe0RllM1FH0FOK+/3KqcA2kvqDltdY=
X-Gm-Gg: ATEYQzyJeZO8TIrRSrLzoSMGk5/73LUb1r2RbJqWARqmy/n2lKroIkDaP6DNoNxclc9
 BmYZ+68QYb4cBRVoQbS9fnM5uJ05KGbUK1iph4rL4ps9et2WnQWbS0oQ6AgAZRnv3OJw9A3XQak
 +nlax90vMb/VbGBHR4iK5+yhbrh2ClIkhXID5y4j73m9Fcn6GureqxaS/1RKrgeiAcCH3xf5BdA
 StFXfM3P7CjKO9rRb4I2jdfHLgYNvpDjwAfpa2YBwh+r/DGVNLVJ9awCnK6NiMTUgdYkF8XXF/P
 8pChYXP0vNx/46Kiy4qP3eecI4BkWjHptoWeiwB3uay5sT1n41LWuR+bgqGaN2dva3L8EQVqSTa
 Vjms/uAdkiIqAwMSqmkJXxnyEQ4B8ilUiWhM3MDscAD02z9mrDbPDTd9ibgopZJzOU6/UKx1/pP
 9DVnhTfijr6uTQBF9VLnVGhE+p9cELeyjn7bI=
X-Received: by 2002:a05:620a:f03:b0:8b2:d72d:e41c with SMTP id
 af79cd13be357-8cd6d3d9183mr369893285a.5.1772815651570; 
 Fri, 06 Mar 2026 08:47:31 -0800 (PST)
X-Received: by 2002:a05:620a:f03:b0:8b2:d72d:e41c with SMTP id
 af79cd13be357-8cd6d3d9183mr369888485a.5.1772815651062; 
 Fri, 06 Mar 2026 08:47:31 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:47:29 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:16 +0200
Subject: [PATCH 10/24] drm/msm/mdss: use new helper to set UBWC bank spreading
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-10-9cfdff12f2bb@oss.qualcomm.com>
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
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1239;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=T4XlIf9sWC6G5eodtz3g7Nl/H7ebAymEe1iQ8N83kkg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUOCroA14RUSjBXpDlMJpG4G9tbOzhXJ7jnX
 AHTxgYfdp+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDgAKCRCLPIo+Aiko
 1cCLB/sH5fdyjgJAnBqdlTRluLWUCiX+r9ZILouuB0tLMDmHwLENSLGdiFpafUBOnwRtvXV4sS/
 72MZ27DxVesz+OFeul+RrNQCrj6YomzTsVqIeWRrhmUulx/MlLuCrgyCTCSTBJYDVMRWPBJYaKb
 YILzDE9wkXQJf2puwhieUS7rZ9MfRAy2ZcwCwJczI0qRjyk4VJmEq/V9fQN9hTfeH0mfiwpaYcx
 uSwIQOU27/dhRM0QJgEcaqZQE5debAvAgCA9X/BdgFGByPzRxtdhJ9wA55scqELFuD0FHnpr7+Q
 zJ5/2s6mTr//sVQ9Um2aCrUz8D4Pq/f3DCPW0xHH4TQkz2aq
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfX4+Sc7rIcE9wd
 +RwOC7rNLa3VLEWc7u8x071oykbO7WpQyO4VD1a79A+RIXVowfJHgDHfh2uSS/a1YPKORg6/nRC
 8OWYRWQNxgs/vQxvATikHVBNcMPdmYTCxNseU6mECsPnJUG19cEb7nZKV0p3lH/wTikkaFTwVt4
 Tdr3lF9hhrH23/dXuUt4IvXC8XpuGuiGBMMFKGGU9GY3r+rqAxCaDUH3Rgj3j4k28a+kQmf7E3D
 +ziVxNoLfTzaRz+m77LNkLRkHlHUwmagb6In8h/CPaluJbteOg8A9xBfUCgYgZmM82uV4aGabwe
 ZRwJFxuekD+Sb1pEh9ifYIfimkE9AzFeU9C4AODbBu86VqnDI4cEr+kxSrJfikOBiHGM4o9tTEv
 2BU2N64OqBDSWkIBTFBZNoY765UwgOhzF/pRlNoXxeHJNMgL6BxcA8VAbYB7OJPpDOfCJc+eYpP
 qC3EwRsl88gnHP+Z6cA==
X-Proofpoint-ORIG-GUID: f7whUtHtDB6bJqyFGcSpJdroErz5hcMi
X-Authority-Analysis: v=2.4 cv=DvZbOW/+ c=1 sm=1 tr=0 ts=69ab0524 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=ujCctoy6CNRHcyqwK_8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: f7whUtHtDB6bJqyFGcSpJdroErz5hcMi
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
X-Rspamd-Queue-Id: 0C6342255DA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:andersson@kernel.org,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	NEURAL_HAM(-0.00)[-0.985];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Action: no action

Use freshly defined helper instead of hardcoding the checks in the
driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 41289606407a..90a4b579776a 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -183,7 +183,7 @@ static void msm_mdss_setup_ubwc_v5(struct msm_mdss *msm_mdss)
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
-	if (data->ubwc_bank_spread)
+	if (qcom_ubwc_bank_spread(data))
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
 
 	if (qcom_ubwc_macrotile_mode(data))
@@ -204,7 +204,7 @@ static void msm_mdss_setup_ubwc_v6(struct msm_mdss *msm_mdss)
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 	u32 prediction_mode;
 
-	if (data->ubwc_bank_spread)
+	if (qcom_ubwc_bank_spread(data))
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
 
 	if (qcom_ubwc_macrotile_mode(data))

-- 
2.47.3

