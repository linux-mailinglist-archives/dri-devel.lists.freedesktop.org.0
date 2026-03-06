Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AsYBSMFq2nDZQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:47:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA30F225597
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:47:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0182810EDE1;
	Fri,  6 Mar 2026 16:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lLFbSbs1";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="djQ3Bw9T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 713B510EDDE
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 16:47:27 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626FrHP52008839
 for <dri-devel@lists.freedesktop.org>; Fri, 6 Mar 2026 16:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tABjXUq/OjxQFlltJI7qwEI7Ulj0yf3Q34M6i0RzZsQ=; b=lLFbSbs1utfFOzhT
 MNqN4JdLQ/gvQYGAXTfaKD4P6yfbNcY9uzCf41ZsXgKMJadHItt83twX3qhbC8lf
 hUDsr8jEaGbGCSZZN6GJCTHR74h/854kMP0QlCWQsc67v3c3mOt5m6qP90seRu//
 CcuvZtP/pl8aQDOFhHA6UKUKX9om9xK57tUVkKiIbMXSQibzEqfnc33zllTz5sA0
 p5SokMCIv5oq4+6bXYHaP/2Qb3V1zQrS5nVp1lPqdpqbHHaPGYsnAx3xm/sR67/j
 KJCEwpndr0mF8/jMvEMna3kO6ov4vv/B7FCKfFNgCivzVmJsI5PI0v5/h+4b0wNq
 kc/oEw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9ahcjj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 16:47:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cb3a129cd2so5931922785a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 08:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772815645; x=1773420445;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=tABjXUq/OjxQFlltJI7qwEI7Ulj0yf3Q34M6i0RzZsQ=;
 b=djQ3Bw9T0gpa43h2IY9zxSRFoYBk9XI44DZaKqCXyagCQr0t7WXzUbwiw+M4XsQt+n
 robadFzMN4mwSCHwlKYzf931jWllH0Ms/9Ldj1p1pQ6tjxUa1hwMPnYJ93o/81R2B7TO
 D2w681uSVvY0fLYdyTwVf0+iJXe+6ixUZgGIJ+iNJ1ZecXqCht3vxtMuGOjpNmV1MVgv
 qL5be5vi4/QUgZ2hxAZoBXyo83LSOjahT2P0WGaBfwE5u06qPXlDRROHrX8Bw0rcbxrJ
 Wp25Vtd85pTQndenHBWKovIcrqZITZv96V7DHQpsBwF69jWzmhLlHJ7vM9GDcNrx2dSG
 mMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772815645; x=1773420445;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tABjXUq/OjxQFlltJI7qwEI7Ulj0yf3Q34M6i0RzZsQ=;
 b=cIt7+vzsiXXWQAK0UVWpd6/VH9aAfp5zs/L590IwI8OS01CwFmPTzogtKa68R3JPGp
 v7Sa5U37NWbFGTQ+S17WI1x0CzmD17F2U9buQ7i4lXaan60c0nAiLtzjHw3/HMvL+7vU
 m5bW9Tu8tHronP3EAL3WLvK2DXEqq21Whkyx2NkatvMGtAnS6qwzbeybqd5wMF7/tvfq
 tlxbuh4U6iJvYn23dNuixe+QSXSFRluPhZnl9tMk3qkemh6eziwrry3MnYYzZNtR0sV+
 xVEJXXk4yZ8ZYNwPscz35L4j7/XBG244Q2HgtB7RGLM5yQJLyfH0vj7+zHecphRS6eC5
 e9iQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUx+rlrbMPKXHeDIGtKauRi9r8WQQyPlxgpJHXBZZU4+BIQ0Di4YYaWClBmuynVNiSGbuo/61yhh1E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIsCotYea9WYfM0vwL8GWYYm2Ld4JSsnBRsFXXpmMYtD5Iy3ku
 hGJUQ68qSzFfCh3bM6nkv34pqlDLxy+yPBeQ3pOhR45fR2QPkCx+sgt3YfaGT+ezKALdHHo6suC
 3oQ6FEv8MV84JrUTmCwDfRDmK3iY9NFfNNsPtavkK3CdH4Jk1P+PIZnd/QtaAG4KaeCKbbvI=
X-Gm-Gg: ATEYQzwdDmilOM7yRFuXBYwFgcRQrf76ZLiCkF6wwML8DTWTqErXzmQhs4kFURv+K83
 WwnV1RCiRnBf1jXySNXzYoVRH0irYbkL0LkpTSg29YLxw/TYeCABMu49hbjyomvnsoEb/3zJckd
 bQgmEMYnIK8XuUPRPFEmK3wfFz4S0kSIH/RMVCeKuQ7HORNvdXuGul+FgVCcOb44rCaFlpmQqwE
 TwPFPWXDnfZjHJdJSQb38xDwPwBAN44HMkv17J4uBuq4hwD0Bm3HRt7Kme59MuFbXznaqKGk2bi
 eZX0I7dh8U9jGk1oEVu1C0vFDTQUmd+Y+RdMyyzc0u/cyMm7gWBb0a+hfeQE7bvQt9Rzmql5pjY
 aRoDyyNgOC93Tv6HSGqC8MEVcPlzXXOAccPrNZKVWh0Lk3B6jAvpfj5hepM2GpWm8VKVvd6EtHb
 KLE356aXPikXMuuQLnyN4ghOUiMTwU9gwnFHM=
X-Received: by 2002:a05:620a:199b:b0:8cb:5566:c947 with SMTP id
 af79cd13be357-8cd6343c5cemr797014085a.17.1772815645254; 
 Fri, 06 Mar 2026 08:47:25 -0800 (PST)
X-Received: by 2002:a05:620a:199b:b0:8cb:5566:c947 with SMTP id
 af79cd13be357-8cd6343c5cemr797009685a.17.1772815644753; 
 Fri, 06 Mar 2026 08:47:24 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:47:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:12 +0200
Subject: [PATCH 06/24] drm/msm/adreno: use new helper to set min_acc length
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-6-9cfdff12f2bb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1349;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vcRHbEAGLYLgXe4iaZftIzhetGkuS44tvnfyt/ZXY1c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUN0M51LuLgAx3YyuCL48phbnK5fMROS9qi1
 euBp6KEcTmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDQAKCRCLPIo+Aiko
 1WJlB/9Oz7JEzX3QKA7BjY8IyUp2+2tsRDo2zVU5FKUVwpGc9iyqGM4h3U1PlrmwvgX3DV0dVvh
 CV2xUDKSOESWI0vMmSyFDF8wMGMcfZdHX868x5tsU90+PDmp5lhO74oXF49f6a2Gz08a9hoXMI/
 LLTSoslChzkN0lGLVH8rRiQRvBztGeiyt5FtXit2+diGGo7K29j8LlYymUZ1/ZO5+pqSe0vFEq2
 JenIZic/ODA7a1FXTiS1gWaRZQWnge2646sghNpqP56COCqOe6L/TiRPD6WbMhImm8TbuZvxxhp
 jSebVtaT4XqFmziMacklq7vcn2lzi/g2/5QvYZYrc2wbP+ix
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: SqCpNQPUSfIS1T_TGjutS6W73BHT5qGA
X-Proofpoint-ORIG-GUID: SqCpNQPUSfIS1T_TGjutS6W73BHT5qGA
X-Authority-Analysis: v=2.4 cv=G4wR0tk5 c=1 sm=1 tr=0 ts=69ab051e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=X-e67srwgh_QgMMAbO4A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfX+f8m8wiWdAf/
 C0b5e/MgPzO1BdOy3kafQGn7dMKSd5JwUEAtFpC53DU8+xJTL9sRjF0cHUUnj9JdRESVgFpv9g1
 0pFhaesnJY0NZahMUumr8Vigbh7vLmT36PbNFCOCcraDMl64gy3L1BgFZG8+cHhPMjUw45uRqyo
 XaZ3iQoUI0LP1t+TTP6fJ3zgpWv9aNBSItlwmfdngvh8tahyKxs5sORWX2JcJ1LLhe8VEATFegB
 gzug3BvKpHJcX+XUDVXQzukY9m3s0DBfnC1OVanL4HFQbR0AtvKSVkKi3jeelyY4P0yNMH/3ZI1
 38e+PisLWpXphMxQZ+ZfjpTtTGPCu4b+i1J/Aq1aIV+G3HbBRMZg7VDEzNpqtY/f2CvXCpa894k
 QMIvlf1zbdAXTS8uZWzPlbXALLJGKj4a+HRev/RLP4EeLLwtO2hlfv1kzxU/Yjev59j5nQkGnc1
 DNKL3p6OaNIlmDCsgDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
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
X-Rspamd-Queue-Id: BA30F225597
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
	NEURAL_HAM(-0.00)[-0.984];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Action: no action

Use freshly defined helper instead of hardcoding the checks in the
driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 6eca7888013b..2027e479d5b1 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -744,7 +744,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL2);
 	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
 	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
-	bool min_acc_len_64b = false;
+	bool min_acc_len_64b;
 	u8 uavflagprd_inv = 0;
 	u32 hbb_hi = hbb >> 2;
 	u32 hbb_lo = hbb & 3;
@@ -752,8 +752,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	if (adreno_is_a650_family(adreno_gpu) || adreno_is_a7xx(adreno_gpu))
 		uavflagprd_inv = 2;
 
-	if (adreno_is_a610(adreno_gpu) || adreno_is_a702(adreno_gpu))
-		min_acc_len_64b = true;
+	min_acc_len_64b = qcom_ubwc_min_acc_length_64b(cfg);
 
 	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
 		  level2_swizzling_dis << 12 |

-- 
2.47.3

