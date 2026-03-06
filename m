Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JrXITMFq2kMZgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:47:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3498722563D
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:47:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A56B10EDF6;
	Fri,  6 Mar 2026 16:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VUFNn2O0";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y0M8+eBf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 357F910EDF5
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 16:47:42 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626FrQuk3960172
 for <dri-devel@lists.freedesktop.org>; Fri, 6 Mar 2026 16:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ywz55t77MzTGeWA2SI0gC7OmSPpeiWuIVuyHjN4dOpk=; b=VUFNn2O04bSHDmBy
 sUJKq5bTCIXbmEqZV60HspAfaAUBL3M6CHYt6j9f3o6ivfVfdztqMUTsy++FxZdf
 QzSfasNBMTvOmAPkbEPgllvhJ/jcK7Yu5AplEse0GA5S3abang4uZub42jcBHx9D
 74Xr/JIfUsonMbe2R74qhiK00DQBBXmllIo1X0OvPVqLVgm0Xk731ALI5m7cEKKm
 6cG5Xt2BreFFMnumKNPaUvWmaXj4Wk4Q42LUFU7llAttQfJxZpcPZ4/oLtOyVdxq
 3+PFpuUKssO7zOFiVoYEfv3XOXf2TPpia/thGfBmlJhRMWFrlklE96i2P/AqzNiN
 ccQXlA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9u9cb8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 16:47:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cb3a129cd2so5931989685a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 08:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772815661; x=1773420461;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ywz55t77MzTGeWA2SI0gC7OmSPpeiWuIVuyHjN4dOpk=;
 b=Y0M8+eBfNH4nAzOL2u5djc1+Ci8MN1jV6K8DH+YpsdyvbMhSzOO3wXmS6cZBjgxnWr
 YhTxjWOyhnDIuj0Sl/r4KuvGlqooj2x+h6tn9/VgfkGD7GXFIEkoVV7BXPoxAIVDuUbe
 0Z8rnlvNdeXJr1VLzDKWupExONOy5bdcQCinBG6wcF1dwNfkmw+AcABUMOzNt+TtR7dy
 9xafyAj4CQPxOVbSYHTDML6JSDjZsONwH4wAp5wvQVvGF0vrWknLTUIpbBRAE9Dl9qyv
 H+26dl/3UzQmICq653Tw4K5XMl9D7XX/Kh5HkUTN2F3GMm/BW2s4P8Sq0ULfeyWEZQjM
 WQzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772815661; x=1773420461;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Ywz55t77MzTGeWA2SI0gC7OmSPpeiWuIVuyHjN4dOpk=;
 b=gW+Ls9kR4mh5rXPAmngayUkGVUEZvof4M/b+En4sSO3c32TVpni8pLOkfZg/nckvBY
 oa8MoSkhf4JUSjDtuyLKWqtQKiLWOjvEemYPv3NBo8WfJmn1oSigTT0LpXXHqVgVNVbP
 7lideLfybu7Ldn18QFkGx+KfzPJ8dI8s38RB/22msV3zuoSJrzrnpoLsj0XgoxRmGIHo
 h5qFuWG+F+xtpjxC2v6mODr2kIdLnyEkUIt3tR+VhnRNK4OdZH7J6/C4tyKM44Twzqxd
 UBT3sKoJBSRIsSvrESmL140uB4xpdePgSLYdCVVmhB+RxkOtQdQEvEOR782uZv40YxMo
 CKdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKhWV6M/s+UoobNjTrXjcfV5H7Zu+ZKTV9X9GACunQ9J3mDeaaIcF3GRfGsZPUSfApW6TfPkEivFE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlTCciZKiZG4H+1InikT3ysXt8+gQnTOAEwjP6I7UOTzqFCIyb
 fLpHsvN2Nb2Ae/27QV7nsRk0qXPLO97Bxl/RZX3k9Uhpq8Sb4MymDURs9yvV4kUXiS+zX8B0Haq
 DUrJARigVTYWBjJbX4K3hQDwYu5btPmH/Yvd+pEaAxh0ksyhRnirg/XkeNEKOo/38sZ5wYYM=
X-Gm-Gg: ATEYQzztsdrNqCgQk+2QQeos9F9JJhrYFWr8LVRPb5vwIdsXeIpT/DAtSJB330x5yjz
 B7Mgp2igpa8PPxdObdgxvEOVyogqU/fCFGHks634rSt7TIJUXBr4a+TNfWOKJJ3uhnhU7bgmshS
 qzkCE5liVOLBVYbfAx3uV8qre3MO3/HVWonrjzZL3WcstW7avF2olPCBHbTgDB6f+WQ4TzBoo2p
 won3Ng2v2YRclduEwljLu9csK9Ie+FgM9pJiK2BmM5APEFwXmbeW5PX8jesHPh280h78qGXcIJp
 dqQEBTK414EdssGJy926lifkCsvc4GlmIlxQxbVbE2ASm11SIqK6D/Io5evPKBqs2nGL8gsDHYb
 VL3elGFhGR2o8cK7NLdkpLD6PlLMRO7+zM9KyBuHmGRsXUTqEx+yBjRDYqvIbMUufWAu8CbHjqF
 QJ8Fm/BDf6L94b4SerysYzoBnNvj1EFM9Mank=
X-Received: by 2002:a05:620a:4014:b0:8c7:1181:779f with SMTP id
 af79cd13be357-8cd63505988mr773192085a.35.1772815660643; 
 Fri, 06 Mar 2026 08:47:40 -0800 (PST)
X-Received: by 2002:a05:620a:4014:b0:8c7:1181:779f with SMTP id
 af79cd13be357-8cd63505988mr773189285a.35.1772815660151; 
 Fri, 06 Mar 2026 08:47:40 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:47:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:22 +0200
Subject: [PATCH 16/24] drm/msm/mdss: adapt for UBWC 3.1 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-16-9cfdff12f2bb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=949;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vwRo08OJVutBorS+YUDrF98Dwqb7dE59/dcjOq0vApo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUPwUEnRX71NuA9Gi5WebRwDt6TiTaRrUNAv
 nUWm6hl8LmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDwAKCRCLPIo+Aiko
 1bStB/9BcXAxIUP2RtzC7dV//W9EtFmgN7NbJA5eNFvekMnqAPi6UQnD4/9sXCZrEq9f2vgbELS
 3fxYn5T9j/rTXhtfElX4KaIkOioOpy0IUwGHDgUOraMjrQUOOiyEW447wUgkdnI5y6jY+pc4WlP
 EHUbIIcHHtDTKStyGC+dGOam5DV8tU6iSS6AYtRVSsqAzry5xtrjAZUJMz+jpHeuJSRh8VUvE5S
 hapj1m0OL/RUg96fiRTvhrTcCiOB3LWWK7JQv4DstQw63Q4tbTGpEA59/x7Z029T/tBwObOIs83
 VojDx08SvHL8z82LStmPD6OjDDMCdmCO3W03OE4JUgEJvJSp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfX24d2uxFWdE1+
 4HNJ1pH8/B9LQwnS0XD7yxwZVYlDhEKD3VRKvX4T8zZAIgzLPscYekoEN8IwOEGXmTIVQNHkwMZ
 PdU45wjXWuFb5bizRuHzpuqSDkFiVRjr8u5nFdM5+3+NwRTENJvwuX3RgJpCEtLvcM9zqucqvht
 sCL3kfZdpMCQVcJfKDTDHj6lLfbu5LntKxbSvtGVdITv0ceElcl28DF6AilWQEUhOG4x1RanIrn
 fvaDvyqfKeNfR+e77I2q0YKeHCJBEi30W+watdpkuZ65nllk0gAqWaoOlkioDAY2Yxe/3Cgz9TH
 tQc4sEOogTcc7VDmDt5KmsxMZ/PKaQCJcQCUHmHgc2EVbavqMpx7Oivax2OptwBt7lhwAfyTNFU
 1q81+oWjEcHldKP/Wr7aJvjbwRh9QWzC7dydjXz/WvjRCu3vCyXaYFEiye6bxSEco3tl1yoL+OU
 5SFQkFi6cb8kAEYyI5Q==
X-Proofpoint-ORIG-GUID: bT28lpFJhDvdFwC1Ji1hEMW0Efbsxybo
X-Proofpoint-GUID: bT28lpFJhDvdFwC1Ji1hEMW0Efbsxybo
X-Authority-Analysis: v=2.4 cv=eJoeTXp1 c=1 sm=1 tr=0 ts=69ab052d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=ou6ODICaiX18ouMgCewA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
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
X-Rspamd-Queue-Id: 3498722563D
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Extend the driver to handle UBWC 3.1 (in the same way as we handle UBWC
3.0).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2c2cfefe9b9a..a63a3545929d 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -190,7 +190,8 @@ static void msm_mdss_setup_ubwc_v5(struct msm_mdss *msm_mdss)
 	if (qcom_ubwc_macrotile_mode(data))
 		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
 
-	if (data->ubwc_enc_version == UBWC_3_0)
+	if (data->ubwc_enc_version == UBWC_3_0 ||
+	    data->ubwc_enc_version == UBWC_3_1)
 		value |= MDSS_UBWC_STATIC_UBWC_AMSBC;
 
 	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));

-- 
2.47.3

