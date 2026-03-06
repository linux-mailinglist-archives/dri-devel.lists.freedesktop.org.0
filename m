Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFHVMyAFq2nDZQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:47:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9CF22557F
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 17:47:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED2610EDDA;
	Fri,  6 Mar 2026 16:47:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AR/QBSVF";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TLoLv2ag";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F8710EDC0
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 16:47:22 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626Fr5vJ082645
 for <dri-devel@lists.freedesktop.org>; Fri, 6 Mar 2026 16:47:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wdo2GXNLuey4il0IRDIYFRsck7+hcgeJ1IZK0URwteg=; b=AR/QBSVFwClPDB+4
 l/HAexU3pYvX4cVToD+jpZAcP8E3/Mg+NmRwxxY2Nvr0GKlDs0R4ufepixHJ3JRN
 G6sYsWtKj5nWTKySjqFexMw9N4EzMl8d9Dp5PQi+g/a4H9YGNYUa8bazgaOwLuWU
 5zWVjhOP6+xkt7mZmT19rcniO7drEKsFHUtwGrhXu3Ro/tyBPhAGlKt0MJe3iGlS
 NGlHw/oC7La/5Bgor/E0v8BYQc3CCZUGOXA0gU3U9P6iJocKbfPD/UkLexFAUK7V
 MBrlnFlaC2vHHeSglMFYLJ6NS+JWHcCZGQonpQnKWvS4LLKmFVys/SOT6giszHT0
 0/JoLA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv98hbyt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 16:47:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c71500f274so1017711285a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 08:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772815641; x=1773420441;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wdo2GXNLuey4il0IRDIYFRsck7+hcgeJ1IZK0URwteg=;
 b=TLoLv2aguUlQKzCtnreB7dQLGqtIBr7YVe2amDvZacgyYgfzARYNA279o0r0YCe7DQ
 ZFROgZubqWoZTCuKYlMMijhVr+nQMA90AmxMg0PXoISgQnW3C3HJGaVfdNhCV2GPz8nr
 BRonO1ogTwUh0ReyWrGSfl3x7xD8pNPawK+B9K3koGrSh9vo5y9VCUpcSK96J8M6S/x6
 3cFDUVZ6Sk4PtkYPeGMU93CIgaIfKOg24SeEu8zvToU4mEJ2VEI0aDPL66L16UnZrVl9
 bHWLH4MPeoAiA1Ak3G0Drzq/gAtrE+nUQnjGbrEcz+qg99xPMQdjrOPduyNF0i81dv9U
 MisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772815641; x=1773420441;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=wdo2GXNLuey4il0IRDIYFRsck7+hcgeJ1IZK0URwteg=;
 b=FCm6Ubsd0FCdQeq0HBYdP9CW1fJA5tE92Xk8gr92lEXABag6Yk9YjWq5ReLl+cU5ww
 cHlJ1A4ZP8MlICW3SrMrz1k6hU59krVar0QRsdnf3VyVnWR5ihC37rURwxX88D6nGzNS
 vvtG8J0h4bgdTBoLlqHNgTRwtN+MrRNFSPdUtrU3KXMqmC8E/RF6rzUo1iFM85bmReXT
 un6vxf8ko+uI7t3Fa/9yjcv8e9dALrAqIzGuqDaKvJhxc2R470H+miy7IAO+bMMNRXi3
 A7CCvx6iSVuLmowaa29kUPx0r7AisnxxUsoD2nlKcnGP+pGwmQ1G09yIdih8SBpFhKEh
 wvcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoQZr8+KeYJiLfhVdAzLy/ffpiBzHFnUCrpccDFwkz46i62PMnDgOJXflzKpZ7XOrGQbAkb4PYtFk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwobbAXjE3SGsPyKjEyRvZSK6NOqwW8mXqBxghHxXhzPo4MsL8C
 ynVxW6i5SkccNrzD9//WqfGAJ+I+MlwjTzfp/VnxfVRP/6LEvScyWUX6w/hSUMYt9hJDHrKxxNA
 wAh2pq4bbfbaDWuaW9AXLqatDa+Nb456AlsHciSV9DA7CxrleAQNAKRWrOeWtc6bm1JcnXOQ=
X-Gm-Gg: ATEYQzzhIPw1LtxjpHcZBNjcBrqvJhPTXYj7obr44k22Lkzl7jRXN41RUGoEycQihaj
 ORI2LZcOq/BOUB/p7ICRBlyqFDCpgm/99aFkON8K2JcwnN7syVkKyRn8GfBjaNNIMT0STY5A5j6
 D8QCeGxOH0H2kCgIW8wb66NaTf7z6YG7OwjLK/2wexCi+x9lWYcIxOgWtrVWOSisQrxj05tSoiE
 NvqBgaNsfnRApBhq22AFmYVtO05imdH4pfIDvp53nx4k0VOIo8lgg2OZ2y+Q5Fj+5f2VtJFKyBE
 Jp6+Pdw9cdQh/0Rrijo0uRufIK2pxb7S8KivXaI3VXrdQh0cAr+OfTCpgYEbzsceKpUXKFlEzQr
 exnxIYDIEw2FeTNnpFtVmY/0pc9EgiuxbqQBhihQyubmR5699x2uTwY1FJ28Ex2r6aY62ODALOD
 v17sz+gMR4Oy/RYiZe9u/oo5dC4pySeo68xWg=
X-Received: by 2002:a05:620a:254b:b0:80e:3af7:7a0c with SMTP id
 af79cd13be357-8cd6d427f57mr320734685a.43.1772815641170; 
 Fri, 06 Mar 2026 08:47:21 -0800 (PST)
X-Received: by 2002:a05:620a:254b:b0:80e:3af7:7a0c with SMTP id
 af79cd13be357-8cd6d427f57mr320729785a.43.1772815640568; 
 Fri, 06 Mar 2026 08:47:20 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:47:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:10 +0200
Subject: [PATCH 04/24] drm/msm/adreno: Trust the SSoT UBWC config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-4-9cfdff12f2bb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5880;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=E5AQkqpaNuM1RXBAxJ/mn1wbVur7sOZpcfQb1l6t7DE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUNcrd3Clb2VbkETRm3VJ329lWcfofTbuf+R
 8sNyI+pXsOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDQAKCRCLPIo+Aiko
 1epOCACPBE/Ez45bG59m+rxF+b7Y+dB+iiT1mwMky3RRe9bKHf+QAjNjEQgUpYb19T/GX2Q5v6W
 /E2LxY41xBx9FsTo8wfrPEEWJAYO6k9oNY7Te5BQStmhWBjARC5LiiBx4je2u5tV2R8WDYvymeZ
 0idyRf3YdUvqHz//58i1PeeLLruv24bwZa2b9wzC4vEWNHtPVEdMkS+zxhHtNLHgd9lsASJG4O2
 MvpWYQoUXvCwkZJtGpEhSNJqUupfGc/QVhXhFbhP7nWRfGQKvzo2YpZ1vCVEuHC17Yqr8NzJaqN
 SQ5llqmoB7a5fTZYVldyzMRYgW3nqKnAiCRCzRmQ2IyyrBL/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 2Pq71RLrIpJ6scJAFbrxsKmFQqxoRRHn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfX38+rM8XW4ybB
 p9Qyu6t7OxT4yDXDsC1F4ewTQeE2s9Rfwu7Y3BDxxFUF+TOk0BapJmuwryQbS7ZLNAmB7LbfAgR
 O+Er0lrAmb/lCjn6QVnAtzuiYUVZTkN3p1yATJ65UwtBLndsw4nYTh++cbQ/8KFnmfRmqAJxSVy
 52piu60K2Ev+epu0mA7S6kgzNZA+BLy5GSqvR3zz8lruwwZCnHpoqFO9FfKhHWHSgkTwtBByr9u
 p2M9zZhQdnnDRZmxLN8arQyR4kq/3XvqUt/ysjxRT7WnX9GHu+bciVoTfzND0VH1fWYKwyqziZh
 l4463LLvZ/mGO3CmVsPxN7sxu08AEiz9NT/a15vExv0ybo4BhuWQDtwQzyHu7BS0kRSKaTjTYmh
 wt9VlRqlY3CqyTOqzFu6YAeLqwsiyYdI9ZUcirDlgWD0jA0Ovs2WBW4BActZvdwn/do2F9pqxoT
 0sqBonsmEz0Zbjo1uwA==
X-Authority-Analysis: v=2.4 cv=LbcxKzfi c=1 sm=1 tr=0 ts=69ab0519 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=IhcC-CrlSmvFA89tYH4A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 2Pq71RLrIpJ6scJAFbrxsKmFQqxoRRHn
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
X-Rspamd-Queue-Id: 7A9CF22557F
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

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Now that the highest_bank_bit value is retrieved from the running
system and the global config has been part of the tree for a couple
of releases, there is no reason to keep any hardcoded values inside
the GPU driver.

Get rid of them.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 11 ++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 82 ++-------------------------------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  5 --
 3 files changed, 6 insertions(+), 92 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index ef9fd6171af7..513557741677 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1727,7 +1727,6 @@ static struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
 	struct adreno_platform_config *config = pdev->dev.platform_data;
-	const struct qcom_ubwc_cfg_data *common_cfg;
 	struct a5xx_gpu *a5xx_gpu = NULL;
 	struct adreno_gpu *adreno_gpu;
 	struct msm_gpu *gpu;
@@ -1765,13 +1764,9 @@ static struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 	a5xx_preempt_init(gpu);
 
 	/* Inherit the common config and make some necessary fixups */
-	common_cfg = qcom_ubwc_config_get_data();
-	if (IS_ERR(common_cfg))
-		return ERR_CAST(common_cfg);
-
-	/* Copy the data into the internal struct to drop the const qualifier (temporarily) */
-	adreno_gpu->_ubwc_config = *common_cfg;
-	adreno_gpu->ubwc_config = &adreno_gpu->_ubwc_config;
+	adreno_gpu->ubwc_config = qcom_ubwc_config_get_data();
+	if (IS_ERR(adreno_gpu->ubwc_config))
+		return ERR_CAST(adreno_gpu->ubwc_config);
 
 	adreno_gpu->uche_trap_base = 0x0001ffffffff0000ull;
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index d6dfe6337bc3..6eca7888013b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -729,82 +729,6 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A6XX_CP_PROTECT(protect->count_max - 1), protect->regs[i]);
 }
 
-static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
-{
-	const struct qcom_ubwc_cfg_data *common_cfg;
-	struct qcom_ubwc_cfg_data *cfg = &gpu->_ubwc_config;
-
-	/* Inherit the common config and make some necessary fixups */
-	common_cfg = qcom_ubwc_config_get_data();
-	if (IS_ERR(common_cfg))
-		return PTR_ERR(common_cfg);
-
-	/* Copy the data into the internal struct to drop the const qualifier (temporarily) */
-	*cfg = *common_cfg;
-
-	/* Use common config as is for A8x */
-	if (!adreno_is_a8xx(gpu)) {
-		cfg->ubwc_swizzle = 0x6;
-		cfg->highest_bank_bit = 15;
-	}
-
-	if (adreno_is_a610(gpu)) {
-		cfg->highest_bank_bit = 13;
-		cfg->ubwc_swizzle = 0x7;
-	}
-
-	if (adreno_is_a612(gpu))
-		cfg->highest_bank_bit = 14;
-
-	if (adreno_is_a618(gpu))
-		cfg->highest_bank_bit = 14;
-
-	if (adreno_is_a619(gpu))
-		/* TODO: Should be 14 but causes corruption at e.g. 1920x1200 on DP */
-		cfg->highest_bank_bit = 13;
-
-	if (adreno_is_a619_holi(gpu))
-		cfg->highest_bank_bit = 13;
-
-	if (adreno_is_a621(gpu))
-		cfg->highest_bank_bit = 13;
-
-	if (adreno_is_a623(gpu))
-		cfg->highest_bank_bit = 16;
-
-	if (adreno_is_a650(gpu) ||
-	    adreno_is_a660(gpu) ||
-	    adreno_is_a690(gpu) ||
-	    adreno_is_a730(gpu) ||
-	    adreno_is_a740_family(gpu)) {
-		/* TODO: get ddr type from bootloader and use 15 for LPDDR4 */
-		cfg->highest_bank_bit = 16;
-	}
-
-	if (adreno_is_a663(gpu)) {
-		cfg->highest_bank_bit = 13;
-		cfg->ubwc_swizzle = 0x4;
-	}
-
-	if (adreno_is_7c3(gpu))
-		cfg->highest_bank_bit = 14;
-
-	if (adreno_is_a702(gpu))
-		cfg->highest_bank_bit = 14;
-
-	if (cfg->highest_bank_bit != common_cfg->highest_bank_bit)
-		DRM_WARN_ONCE("Inconclusive highest_bank_bit value: %u (GPU) vs %u (UBWC_CFG)\n",
-			      cfg->highest_bank_bit, common_cfg->highest_bank_bit);
-
-	if (cfg->ubwc_swizzle != common_cfg->ubwc_swizzle)
-		DRM_WARN_ONCE("Inconclusive ubwc_swizzle value: %u (GPU) vs %u (UBWC_CFG)\n",
-			      cfg->ubwc_swizzle, common_cfg->ubwc_swizzle);
-
-	gpu->ubwc_config = &gpu->_ubwc_config;
-
-	return 0;
-}
-
 static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -2721,10 +2645,10 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	msm_mmu_set_fault_handler(to_msm_vm(gpu->vm)->mmu, gpu,
 				  adreno_gpu->funcs->mmu_fault_handler);
 
-	ret = a6xx_calc_ubwc_config(adreno_gpu);
-	if (ret) {
+	adreno_gpu->ubwc_config = qcom_ubwc_config_get_data();
+	if (IS_ERR(adreno_gpu->ubwc_config)) {
 		a6xx_destroy(&(a6xx_gpu->base.base));
-		return ERR_PTR(ret);
+		return ERR_CAST(adreno_gpu->ubwc_config);
 	}
 
 	/* Set up the preemption specific bits and pieces for each ringbuffer */
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 1d0145f8b3ec..da9a6da7c108 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -237,12 +237,7 @@ struct adreno_gpu {
 	/* firmware: */
 	const struct firmware *fw[ADRENO_FW_MAX];
 
-	/*
-	 * The migration to the central UBWC config db is still in flight - keep
-	 * a copy containing some local fixups until that's done.
-	 */
 	const struct qcom_ubwc_cfg_data *ubwc_config;
-	struct qcom_ubwc_cfg_data _ubwc_config;
 
 	/*
 	 * Register offsets are different between some GPUs.

-- 
2.47.3

