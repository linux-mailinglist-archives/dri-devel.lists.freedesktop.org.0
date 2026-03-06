Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPZnOzcFq2nDZQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:47:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96208225670
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:47:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0633F10EDFC;
	Fri,  6 Mar 2026 16:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="X4WtKU46";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Clha/6uh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DBFF10EDF7
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 16:47:40 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626FqwFl082499
 for <dri-devel@lists.freedesktop.org>; Fri, 6 Mar 2026 16:47:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YzMnkl155rfInvEKL9ifI6QydBewp39sV6azipPoMOc=; b=X4WtKU46ctLZhQ3K
 myQD/6t1G7Uew7UkRZ7ZwluxW7JZFqWQDZc302cpeE1vEpCamD9Osc/s6lXHxvxI
 r9jusATZRfXGkC5mUK3skAHr7RlyzP4YerRWh5sHpAXRTnE6UP2vBC1Unr+2fvm5
 UDvzvGRub0By5hX5u5o6ZbCixFvLycq5cNVpLRCYlosWgy9Hda8xzN38hC54Xmy6
 hdxKwkBnBeKgp/jFOuiePVSLaMZqymgrUPLboiw327tP58mwqjCzzijQlSH7eJ9T
 fwy6R04xRVV5S/LoD3V+qiczdjOze6UI18+dtOdgbB6T7aQ11UVKbN+Lp80fEgXL
 HPXJcQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv98hc16-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 16:47:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb413d0002so5927998685a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 08:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772815659; x=1773420459;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YzMnkl155rfInvEKL9ifI6QydBewp39sV6azipPoMOc=;
 b=Clha/6uhUqdev1ARguJuWI22/MRIiQBBHYrBGKJuBV2JtAzQE/qS8ZH2q20KL5MVNk
 fGOlSvTzouTBOETDsnA+hDKF6WnXObf961uyyxVER6aF15tK75HjY14Tjj9rb0Bn69Xz
 QmvYYzmzY0LCNf0f6igrfeX0FK96RTlJ4sPb/xnSU2gTt1q/rbMXPiF0z/jA9utM8ALw
 0zr0rGzpVxghSobPffSd5nMo0TqEWsfTVtE6NaZb/ikvs3hNhCGk1dcJQEMau3fsnvcs
 yyezXmxflOT0z0xHTaXWHHCey4bfoTLYq6KevX5Rk0TofeT8bOzzd/wLNkZu2S9zfiE/
 K8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772815659; x=1773420459;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YzMnkl155rfInvEKL9ifI6QydBewp39sV6azipPoMOc=;
 b=QQWt60jIcraa5KMSF4vfJuSZhUbO4Gj6A/uqn2laRt0NP3Fzpdw7LMHABNBpZp5t1f
 bh9sre3Pr8yDHIX94fpkEqK7sJNmqADskVz0uExHX0TDMIHpajen0rJq40/dVy6Xr4AX
 0G1uH6jTlSBw+5zSK56WkuqmhkAsOnevxUc4pmH8D7eRL5GA/lNgrkh/zB5je/mVjUus
 Cmtu65upx3FDFKYBrjyq4e3G+n8tP/mqoQ/ueJDcGDcVHkyNcSLVmw3DkdBuxTCRCyYi
 sJrnLsjQ4DQEt++qBMlg022KAR9iScu0yFRhLd2BO8vTmJvahRMhmwh4Cq7oQ0/o/yHG
 165g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlyR5qcvgP6R9RHseWGD1vEzbuY0R8u0jal1SXGqLvoKhu9qEt7fFiA4ognO6ESwbmNdx6SQZQb+c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzI1NXZAt6nfRDLX0mXSeNh03JNrULkXVM768dRF/2etQNNXA5e
 som/9pmfdgaRfgoE0B1/AL6eqNdzbyN4llTpEBeAvM6cS0L2QE9iwwRy/3Fk3676668NED25a6/
 ZzV4PP6fv52UO34wEAxwagKVLZw8jwBwDo7qXqRDVmzynNZNRdAv12xL3CP0QE+Ebme4kyA0=
X-Gm-Gg: ATEYQzzEDkWAuao+ffiRDW/HIGsu62ywp0JuZDbIsE7Atr9YCsV0aNFfUKfgkM595IB
 tDas/TbA9hp0KLEleLHQ0j9jUQfcGn3A9st21qyMTjTTnw5vCMyGkIHX5Pvs0s7D683YnYEzryR
 6kyABQXxgIU4gtp4KqLapE3bnFi7vL1kmA2lHzy9QSVLXpYGXss1E4AOQc3k9HBVZHOYbpCcnjo
 eEZ5QdjdxkH5mcdmLGGCvs51c6Zgung2NanfAXFt86Qrd/5vO5oey3mpo9mJ5u2CQ4wxD+demJW
 +sQp4W4ob6g4HI+DxztqsHrgeaFVwHun0qbwM9edwu6Jx+UCscc4J4bVtaAGgKhcfp9/lvnQIgw
 duEe5BobJb8h2wflYwyA7G+3Xu1oNdAVFe/IgWUkDOnsnyEYwQSQiY/9YT8HSNFD9bPqiqQuMeg
 TW0UnDAba8cctsBas9y2j7dUELz88PgMBU4N0=
X-Received: by 2002:a05:620a:4056:b0:8c5:3045:854f with SMTP id
 af79cd13be357-8cd634f4e24mr744634485a.30.1772815659105; 
 Fri, 06 Mar 2026 08:47:39 -0800 (PST)
X-Received: by 2002:a05:620a:4056:b0:8c5:3045:854f with SMTP id
 af79cd13be357-8cd634f4e24mr744631685a.30.1772815658631; 
 Fri, 06 Mar 2026 08:47:38 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:47:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:21 +0200
Subject: [PATCH 15/24] drm/msm/adreno: adapt for UBWC 3.1 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-15-9cfdff12f2bb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=744;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jQr7R3+YepKvgcTe6jp82KzUXB8bK1KOSbD7btdKNGs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUO2Mh9VtIMGbSLApYQvh1/12VtHGBuGs96J
 LKj2n9wd2CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDgAKCRCLPIo+Aiko
 1fM0B/0aePn2nUdVqrcTb/zKAEPyRqZvsdd/RFmXHhDcTIM1DzeaDRpKCBdbgCBupqy7wxdYpeT
 Q28bxCxttL64fQMq5FfqaQU5YYfaYGQOd/pdtZvyIrlxv0Kh0rgt6UtETgp9+kmr8w7ySgjBkxD
 yY+NTnmmhTo11WoMqXRadin0/nNVIud9JU1aQuA6OBOwL0kLtCL0AwkwmHQWpZ+H+/Z4imEoIQw
 d26bCyB1xLGkmsiMQ4Im6KSMjQTgVUhxNZsYMOmYVFvuiztrFIOVqkU0BLkglfde+F83fPVpwLl
 WMDUtthT8s4nfWrZNR6I1HOYSKt8P2mEwooM77KkSR9RtkJ3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 8f9bcye6ZYtZoehg6dQk-Vf9xqDSl3r0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfXz6MfavmsJzb+
 IAIpFbDc0JgVAqWzFgrZSgToJCbQuaDzuAO+4mnh+gzbJUMr1IVsN6hx7DakJfWhz5fYFLretH7
 hxZXauQ2UjB+2AaFynffdw9KTjevdBKlOjvik+dWMtzuu17ncpzaNztliGVlvoeI6Vx1qN+oMYr
 SQNt2HLKSuDh19JnXEVFlq9ZfloasCJxIyOliz8TM/rWyKGpXRwtR7nc54Rsq11KT+lac0ZdOqY
 /j7/VyUDcBG4iPxikJRTnIXbEnnn10F5C04kl6bi/3wkrSv6Dd8vbEyNhHRtFIn+Tn47fUQpko3
 DNlHz1H5viVQKLWKKq7z16GrpxSkz2D4IQcugjR/Hbxfu3jqmsLQeCOGw4oluvXniQuYnQhSSYf
 C6xnWBA2QfqnqBrPXf/fZZvrTs035ljJfOViPPqt2xfK72fxSyvGQogKXJtBsQceHP5Q2JVoh3E
 Tv/MOh3UJQ0eJmv2zbw==
X-Authority-Analysis: v=2.4 cv=LbcxKzfi c=1 sm=1 tr=0 ts=69ab052b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=h0EdKdWjJzRczO_IdhYA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 8f9bcye6ZYtZoehg6dQk-Vf9xqDSl3r0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
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
X-Rspamd-Queue-Id: 96208225670
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Extend the driver to handle UBWC 3.1 (in the same way as we handle UBWC
3.0).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 680f0b1803a1..45f260db729f 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -289,6 +289,7 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 		fp16compoptdis = true;
 		rgba8888_lossless = true;
 		break;
+	case UBWC_3_1:
 	case UBWC_3_0:
 		amsbc = true;
 		break;

-- 
2.47.3

