Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA40ECDCBE4
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 16:42:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF3810FEF6;
	Wed, 24 Dec 2025 15:42:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WqUyzvCO";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H6ndZbrO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A7710FEF5
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 15:42:37 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BOBnhOH461728
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 15:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WFK9tlrLTrmmRkGyHiwM9PyuZyr2PqwfUf6G0d53PDI=; b=WqUyzvCOmyOTyVbS
 z3mMnMNLOuDYRfMYZ7nZ9pdFd4a1vjL2LD7723h0zci3LkOtyMgV9IB7F9vUTb3G
 akXo+scN5oW1WcXZ0vh5KucNQ349zI1FZdjmL3TkOIET9RNvDAPM3hUgomv7XXTl
 NGtLkq72v0AtvOm7I/vq812JYsEOfldGVHL8u2HhTaxwkPro4mk2lv2gCzqpvEz7
 lF93TPoIlfM1zl8CQbmiuLXtGvjJmmY/n0+TukzWrXPgAtVNhgheeEBm0dHP9reH
 QHQfMg/r3lv+kkFuwm1awKeitM+HrjheN3ivJ7ibB3ZXu9xlZB5YNIK9Kng425tN
 7ZglRA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7w8fujk6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 15:42:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ee0c1d1b36so152193651cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 07:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766590955; x=1767195755;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WFK9tlrLTrmmRkGyHiwM9PyuZyr2PqwfUf6G0d53PDI=;
 b=H6ndZbrOfCpwX64ovBuigEO05ISt4FQzwEFexCQpaK5Qha0I0zhHLUKgzx//Mrmr7i
 xaJB9i/qGYL+OlrBuWWN+65STKyCAi22cyVZGQwcF63XJ/FLsg3PmwN17r5DoCHpMtSn
 fT6hjAvoGSFssFC7lbg+n2JPRTaIZajaY/7tFDkBaPDPXmfhlMCPpfHZ6RQpUwDeGyZw
 vLQI/A83RgCxdb7IvlH2ZfQHQgfSxko5WFzH579NT8VBc0u+xcx0K1dFzyucmAsKUoDi
 zVOpBq4cNBWoNca0QZkvo+5vffchZPDHjv/gI4rtSk7HwiXr4BmheBCwlNojdcU2V0Z3
 C7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766590955; x=1767195755;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WFK9tlrLTrmmRkGyHiwM9PyuZyr2PqwfUf6G0d53PDI=;
 b=cgUOt8AeVfmQgQEKPTH5SYWRCwVy4Ddvcvhz2t+5KF5o24uNTNo5EPBEwXtygE/esZ
 uICFW3WjHeEG03XT8n4mcvIPHNBhRtyBZo0naZ8Di65vGY2QyOV2S3pI9rOSqL17HeOS
 Kj5N82wYzCPOcCZ14zk2VRgYGl1WZsOtoMFhv/ll+bLNv1FuyZjx6zsPpMwCjhz4jPHY
 PKv2jgYnAAc7iFq2O6VvymJ5m6dpBMxWEARw7BrSUZ5XptIx3bYjo8rMRjySQsfmrxqx
 /luksbnQ6NjqKfdPYSfV6fZin1d2FpfO529+QmF7E7MonL0XAgOpIYN2Yfq26IDVzw7h
 fePQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCkWIyXGdRSwPhmRY3cexwMiUe6MWG0OZ2Qh5dmkKRqYM0asQvvMocfKPuTxTMTuYH60eUB8SwwIM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7O/jCO72+80xXkO+K7pCM2fOwP7irojdyX65547+ADvMmyTbB
 e85RyISaG+4pcFU4kwHuUbtYUkggZUo8nkWdHNdnXZrG8d6jcDPbMt9bn4HvxVu/b2G8l7j0bA6
 CH2B8yzbopaPIAMxwMZd7w8kdi3pGnewulddfpeHdfZ3kwDIIaBm94bMlWq5/vQK4tX5eX8s=
X-Gm-Gg: AY/fxX5998DhwxKpe1al4ee2/Fz6KtPtcch0ubnr2BhOZ2bTHUZdxnuRGhGGEkdrnKM
 HA9XUoXzL8ioqDOEyGf5mkWqbdH3PeHczzAfaXqIKGoYBsZ79OXVVAVBlNyNzgjxyf03mv72sko
 /PRf4nVcA5xU9DICIwH+Jq9UZzmYRcxMvZCN+iGcG/dGeBmuRqhnQb5pMtqpG1o/MjH9YuJ7U17
 MwJnv8Alw7jNcGD13hCLB3lHVWkmnvVcAoVf4F6JS2xLwm3kjGiNb3hXEU5vnQ2wLop4cjeK3EJ
 miTvwdKnPGJNRjOmOsBsd9e+ip3cSrFW5rxb0gE/1E01SBj448NyjCB6bN1p45rCJmTI2euI9eR
 c1S1gnr17Y79fWIAcq4GgTNlWuiX23/T2rH16UhowflZ8z6S2DkNhNUrSEP9gkarDdr4PhIl3y3
 JERqb1Dz+J/UT+q2F1/maxhUY=
X-Received: by 2002:a05:622a:30d:b0:4eb:a2ec:6e3e with SMTP id
 d75a77b69052e-4f35f455b63mr296327721cf.28.1766590955511; 
 Wed, 24 Dec 2025 07:42:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmmwuYonY8fQpi68f95jCRpUXmpjaX2sHqB/7H6bAV9sQQd21Yjoeg4KD5j0vLzPzYWCgzUg==
X-Received: by 2002:a05:622a:30d:b0:4eb:a2ec:6e3e with SMTP id
 d75a77b69052e-4f35f455b63mr296327421cf.28.1766590955097; 
 Wed, 24 Dec 2025 07:42:35 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a1861f2e6sm5071562e87.69.2025.12.24.07.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 07:42:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 17:42:31 +0200
Subject: [PATCH v3 2/3] drm/msm/dpu: fix CMD panels on DPU 1.x - 3.x
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-mdp5-drop-dpu3-v3-2-fd7bb8546c30@oss.qualcomm.com>
References: <20251224-mdp5-drop-dpu3-v3-0-fd7bb8546c30@oss.qualcomm.com>
In-Reply-To: <20251224-mdp5-drop-dpu3-v3-0-fd7bb8546c30@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1402;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/MJ75vhsI5cjj4o92iPu5gq8x/vgx9is2mnNAWB6edk=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGlMCeehXSUbi4oIEysRtaTYV82kp6fPSKz0qxAudd3ZbyiHs
 IkBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJpTAnnAAoJEIs8ij4CKSjVpYUIAINc
 jhZ0GS07jX+JaZ6RIjwLf4EnHghhkF8Ljv25l2LrEhuGSLdFXOZJA5AizKoC6B5zSZITozzTGXF
 swym0Mwgf9NJGZn1cQniwIIocKxjfa4fwdPa4I3+1Si3afkSX20b/C8BSSOGXYVIM0tLGPJpJjg
 UIUVBnHgvOZpWYzJn84o6pmBJEh2TI4jui7i4GnyUAQadF6NPOZazfaPcw01PK9VmHofFFI1KQF
 6ROzVGBiz88+cQSZgRHZZfCJYyxpSyBz07i7pnziU6lMZoI6AttT6Ah1MyyHyaZEPbocKIHJTy8
 XsDFIEKuZSeqqeT06SrV+7vlyj493Xf+KrLRxFg=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: yECRCaayYo4t1m8bMqhNOh2edYG-liJL
X-Proofpoint-ORIG-GUID: yECRCaayYo4t1m8bMqhNOh2edYG-liJL
X-Authority-Analysis: v=2.4 cv=QutTHFyd c=1 sm=1 tr=0 ts=694c09ec cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=3DtPeeBlMjcqd2FmxTYA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEzOCBTYWx0ZWRfX88dTbqA77Gp8
 +qtp4u2SKrlRv2H+Zr8Ar2iS+FBZexCGyQcv8d2z6ZWjXqMYz+/+18sC1FzTZuxKBLyNhmaYXI1
 amZz8KbKiXmiEDEXPeAeVLNu/U5vyjTEocF21zpSD5qBdz8ResqSXq1X7+Hpl4f40jLAXQ8r1Mb
 W5lIzni/b3cOmItws4icIooWcGsVRlnWK13QEKN9hL+Wg6phLfc2kf7q4dsmoF9ZWr6VVCF0oJi
 g+9WLDgyY23vamb6SbuBBL8JXDA19aSr0mGg2Qp3LfLDzVyyWZjmq4QwO4qovrwFRdA3619HVWs
 wqjd+wqjqPvpbPT9tqXsUfNn1za+haC2rqNzQwfXFhy1tAxKUsni3pWrGuJp92OyN3VuW6cpFCl
 bC93iuqOHyvnEkaBT61yCsPRJAznPFUBLPwTXZk3Wa7GYHnHsoA0sjt/iVBa2OvC619bT/5mqjW
 0NGcvuVYqqXwZbU37Xw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240138
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

DPU units before 4.x don't have a separate CTL_START IRQ to mark the
begin of the data transfer. In such a case, wait for the frame transfer
to complete rather than trying to wait for the CTL_START interrupt (and
obviously hitting the timeout).

Fixes: 050770cbbd26 ("drm/msm/dpu: Fix timeout issues on command mode panels")
Reported-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
Closes: https://lore.kernel.org/r/8e1d33ff-d902-4ae9-9162-e00d17a5e6d1@postmarketos.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 0ec6d67c7c70..4faed35f146b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -681,7 +681,8 @@ static int dpu_encoder_phys_cmd_wait_for_commit_done(
 	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
 		return 0;
 
-	if (phys_enc->hw_ctl->ops.is_started(phys_enc->hw_ctl))
+	if (!phys_enc->irq[INTR_IDX_CTL_START] ||
+	    phys_enc->hw_ctl->ops.is_started(phys_enc->hw_ctl))
 		return dpu_encoder_phys_cmd_wait_for_tx_complete(phys_enc);
 
 	return _dpu_encoder_phys_cmd_wait_for_ctl_start(phys_enc);

-- 
2.47.3

