Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uL3+K9v+dWmDKQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 12:30:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E6680380
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 12:30:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 633BA10E35D;
	Sun, 25 Jan 2026 11:30:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="orwP/rvO";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VXgpgQNK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5222410E07D
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 11:30:27 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60P8s8pg3794811
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 11:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Quz1+hYLS+IVpR4ioPDtziPJPuojhivjRtEFcR5Dsis=; b=orwP/rvOgOr07q9M
 4EhmZ7D1T2kHlpfZ/EtB0+x7hFVjXRFOVHHWyp04fUSTC1M+wUcGqY0Wmko41k/E
 Dh+5YpgR7jaFfHvBJc260QCxZ0uQpG+yOp+L5rCYV1YAiQYUalHnpbCBgR8zNh0B
 AojxTpam9rSNeYlKkY3GadGCRmragM7Mh6MERMlLN4xsUNMVGvX/I//vHl0UgZAX
 OmnOQeHmssIYA89q7oG14DEt6d0QBH5QOGsXBafryaSt+r46qnWF67RfZbqOZF3/
 2gt87uXx5CcvsVZCmfyuFi1owhyyX0vtF/4XnPxSE5Mfwb2rgFpDXPyqFIarzmCW
 TwDjkw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq3ha23d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 11:30:26 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-894766748f9so173328586d6.1
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 03:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769340626; x=1769945426;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Quz1+hYLS+IVpR4ioPDtziPJPuojhivjRtEFcR5Dsis=;
 b=VXgpgQNK7lKDza7YJ6ezz+doEdgr8y1ieGEXTLT6Yd+KlgK3S9KZ+sTUF6JqnE1OFc
 ySojDU5HQGcNBOY/axA0wxqkvVzFPzcxMCid614Uk3N+paugWy3nRLzfuL/WOmGaYQN0
 54gpUImbJGytx/dAeLs/uNcXBJaLpmGLN0QxJRvj4la0zC32dc8I8xR3/h3E+r1kIi+Q
 p76Y/f3Mm4i6XLhouoAzY/V05BEBL6iZptjQlultb8Ownjhz8DP9Nc6JawPG56qeLi6e
 zk+UD3IT9hNc7IfKAgqppm13s8P5nfiWMa6kwY55bn1QyGEZ4aQgRMIJjDjvlTHKkYaJ
 pDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769340626; x=1769945426;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Quz1+hYLS+IVpR4ioPDtziPJPuojhivjRtEFcR5Dsis=;
 b=aJCXIjoTAvgyzqu6+MEmIJboVDZCGByI1FS98HDZk78QuVIxWYn9IV9ef7P5YiIYls
 tTfu3AuJqVSzujxKwVkZ+XRzWwkv933uzVYsgL+AO5uLzcmvVDlozNUTgnNqARYHfvGc
 bQ+EjBdSJsUdypUzbJkfKLFwOx3JiDS4jmT8IWWF4rjph4cUkv7f3Qu6roqPubqrXzYf
 v7CkSOgF0/ARqfOd5iS5Ik8fL2Fs5NuCMQssccmjy9lLxBlGnP7zR73h7tAuGwygM9Pk
 sZsjmwlKOGTeQUyNZCOySzRHReVK7hQyLqg+O4UJk2erKp2NHddQuJ4yUI3CytZwRw3M
 mRRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQYgH8e4Sd31dMWGX/Mgwn6QiAXhgHxIuB8cEiExD/dzVHNuidjgCH2BvTcVOUEqhxkdxUWTsncQs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwkzLaHLspQqXgLm7HQW7ShFGOhV/dovxb2+7xgMXCRIpymtMr
 t80SNDDAJpoUkoeNQi0HeqdefUOYPf/HiPwyYrRT1mxNTl17PJM0bBsSC2VsOZIv4gZdyMU0Cc7
 KWMLVRKp96C7Zh/ZOwT3LmE88Nmf6fuBX2orMbYaaqMrBvXIOdH2s3COKgnELaUJ+3af/DkA=
X-Gm-Gg: AZuq6aKbY+PsKNOjn+Q7OOOGrEjrRJ8HlRRTERY1djMK0VjnaHfmPWIG6Smtj8aH90F
 3zNlHhNGTdJzNe18XorglsxWyX4pBDGRVWZF/KIYX6PV4tABYaz/HH1OvWuip4aDhigtez3U9ds
 aLD2dGS53KGHkHAaCtYVYIOKPuR+fGlsQbqUcAMHKcjhm3Kov8blHMMjJ2DX1ulsKJeb0ezdT43
 w49aQ7/xDXxmB5HWXgBE+kXh2FPkLqymv/f6VPwJlmGsM01pTM+3/NHEEO+vl0U9LYijcZ7RMtW
 p86PvDOHv1G9TuKxSYWpDHhQMuqPpmV9PL4B7n/s4FuIZeCEYM+Z2WzTPi/Lq+Y035TqbgRpmSN
 SV9JqpBuTfrfRcoWukrGPhArZ28xFGzcsY+l3EP6SI+lqEsmO3+BTEUWNAMOIlWCMM2AlKCiptk
 vKMuaqh2S55BjoKXUoFwFw7tk=
X-Received: by 2002:ad4:5b89:0:b0:888:8460:837d with SMTP id
 6a1803df08f44-894b0787d51mr14522726d6.54.1769340625812; 
 Sun, 25 Jan 2026 03:30:25 -0800 (PST)
X-Received: by 2002:ad4:5b89:0:b0:888:8460:837d with SMTP id
 6a1803df08f44-894b0787d51mr14522336d6.54.1769340625377; 
 Sun, 25 Jan 2026 03:30:25 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-385d9fec3c9sm18583451fa.15.2026.01.25.03.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 03:30:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 13:30:07 +0200
Subject: [PATCH v4 5/9] media: iris: don't specify highest_bank_bit in the
 source code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-ubwc-v4-5-1ff30644ac81@oss.qualcomm.com>
References: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
In-Reply-To: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2440;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1QlP7Ht2G4UJJw6JsObuL9FKuIo3jLuJ5rs2/0xHro8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdf6/r9zdhR2iKyAbSX11n20suTgW+K9YftcoI
 NVAg9rr4ICJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXX+vwAKCRCLPIo+Aiko
 1X+HB/4riUCiGg6RCWCNMesbYC6BLiL6x2sWDtCbGxLkltxGcCaLLex0/2qjeqe/SJT/ND7ZsGX
 76IqgmogkTiqifrGRDIUTLhUaG0jFJdWAImlggiAHpAN0TP4oEinSkDCnNS6r4q86fBxaJTMUn9
 ZO+FFDO7i61sFrfJ4sDBMexgTrsBbDycBfqbxxVyOQWHZ6JtevffRvE+4hpqvNbbIkd+NVvRHg4
 I94uQT5+nz+yXDTYdOwXmXv9omwrES8so1OiDgnfbVDDhDKGuOMO5ARLPa1XF+y/unjeRrz5klr
 EDxRwnUsT8VeTe3h5OM3XUZ4xx4XKHMAqrex4dfYD2i9/xjY
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDA5NSBTYWx0ZWRfX7KlALSQcb0v3
 A5ZnNbaQ6v0NQ/cYmDxKr1LAwl7Tr+umx0Dy16/7DYIafB8MqLK120TWJPAHYK3WJfMMeRHMfS+
 hmpwIR6TD8OuSWmopN2KV3KvuQpHY6tNQWRHIUY09WZX4Y1u1p2Q0qspuHoOxZzs1CixsugEjAv
 EeUdvY4QJfhz/02ZL+eAHojWACkAAfIKquly6xxv+VxqhlFEdqV8baTlx5RH9DbnxWlWjBjMvJJ
 dMSVT+3X5UcXQBoNLmHWJZM0DXeZ92o/pyG6BtoHXK81EfVI4tURYL60cNmkxftRq7LW+9Dvppy
 4DPggUQHSpNN+QVQbJPyQMin3RdvbSYhYXMFkQhalUT3u/rtEVpfZUC02Yp5K4Mqhk+VEU6EemS
 8BFXwIGPlIiMu+PUyhm0u8QrFIuzOn3np2olXnjcAlg4nNCc609jmSsHbPt/ZruKQ/arqnvzhI1
 5RIW5ZQhkyxn/htoiKg==
X-Proofpoint-ORIG-GUID: NgA0MZGzhhkk0qwmHFM74MgrzIDt0fgH
X-Proofpoint-GUID: NgA0MZGzhhkk0qwmHFM74MgrzIDt0fgH
X-Authority-Analysis: v=2.4 cv=c/imgB9l c=1 sm=1 tr=0 ts=6975fed2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=2VIzI6ABkMI1kr12n-IA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250095
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:akhilpo@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:wangao.wang@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 51E6680380
X-Rspamd-Action: no action

The highest_bank_bit param is specified both in the Iris driver and in
the platform UBWC config. Use the platform UBWC configuration instead of
specifying it directly in the source.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 2 +-
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index aa4520b27739..6dc0cbaa9c19 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -160,7 +160,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->highest_bank_bit;
+	payload = ubwc->highest_bank_bit;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_HBB,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 08a9529e599b..5639eb5a75b6 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -77,7 +77,6 @@ struct tz_cp_config {
 
 struct ubwc_config_data {
 	u32	max_channels;
-	u32	highest_bank_bit;
 	u32	bank_swzl_level;
 	u32	bank_swz2_level;
 	u32	bank_swz3_level;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 01c6ffa7e084..bdeb92e0b7bc 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -792,7 +792,6 @@ static const char * const sm8550_opp_clk_table[] = {
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
-	.highest_bank_bit = 16,
 	.bank_swzl_level = 0,
 	.bank_swz2_level = 1,
 	.bank_swz3_level = 1,

-- 
2.47.3

