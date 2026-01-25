Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHJgNOD+dWmDKQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 12:30:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DA4803B8
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 12:30:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D426810E29D;
	Sun, 25 Jan 2026 11:30:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KPRczrnV";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WSe3Lb9o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E337810E364
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 11:30:36 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60P3v3cr2106708
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 11:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 W/n8lIy6TJAx0t/SbpKSBMWtMGWB6AELaqSTzQbbTRI=; b=KPRczrnV+oICXGre
 /DrF3ndbq2RfM8w/pZWsupYBj1IAQ6rZZ68kBQkydinT2AsyEjv13VIoGDYjXUyy
 iNR3bxCca6vFcWdtHPcbmXn3K+ybDDrff401OYE0b9udkR+CwH0JZfM/LKHbeKRb
 8B5NHgbv7ivylRMRgYZKFV+u3Fm/m5E6zJD8LcvcE9moTFbHJTlKdHBrYkA2UkNA
 l1vKqioshrSWQwBiDVWRRwyPaEmG2jMzfAo1Mt7ChJuKkHdUygwSlX+ot7ugP2B4
 66mosvVlv1uv1jHSZ0TbSw8sry0WezppTdXkSZGxsZlJ0Ny6naahKaoGonz/+xQ9
 BCRxhA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq6xt140-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 11:30:35 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-88a2d8b7ea5so41541776d6.0
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 03:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769340635; x=1769945435;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=W/n8lIy6TJAx0t/SbpKSBMWtMGWB6AELaqSTzQbbTRI=;
 b=WSe3Lb9ocmPLW7bzgtolZ4wEA2oAlNAKkrvJX1VXPBLLLisW28qQlCh7UmVyUU5SsM
 UDb78uFJUOMGcwMwggbDebLiNEGMZ3iuFqG/7k0MjWeJBgws3SBg2NmUP4dBV5qz1kek
 CBBcS80OwZzTBkI+XGutbC9mLMnQ0PFrHqQZ6freQzUx6vMDDuRdnHbK8JZpvFjaphb5
 vcoRPGbQc9e9aUFLRa3UienfFFpybZ3/+1HigLgYIZCcd03AKFxNOc/+jeKFMwxOKN1X
 vuJaagDbEqEMrrAFc1w7P+Zs0mUqhbzOAlJvLMGWR5F8xDpOPY90Wku+xtXe3sjwxePY
 czag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769340635; x=1769945435;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=W/n8lIy6TJAx0t/SbpKSBMWtMGWB6AELaqSTzQbbTRI=;
 b=bAYlceVau3ymcSLY+j8RhUtuOShFJ0LENCPgaFdUibVVpJ/M4xLjTDXLyrlbsH/ZgD
 HPaEFTZlQEj3YMJyHdiAKR0zFD4wGij/jS+X+TFUu9qEvBSnenzpPOb2WI9q38P0F41P
 M0UJVluz6A21vv7Wkil635Kjp5+alEk3aWJga2qeydQ/rWX5lqxwh3gSfAeOZ3YMlest
 x4T+Dk97A0Xet+YXdUkEAPKeqxPhCZDPbZPiZAqQsyv4Ge6vncQ9LYc396K2UrF4yvLy
 Jf/akCzBuZqCay++P6jLd+PMTwVEvCrJomGiVZ4/bOmbplV7+nFhBz8rPKPrszucIgoG
 p3Cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfoolCCeeh2e0DPsVLZBmD1qrFjYIpuIkASR2jmrgFt410a+i/aqYqkphMJSuZX+kTk8P1CLwm5Dg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPVcaC8G+lDm6NpcewfXfKnhwPKXv/1fX/b96G6gZ/DyG5FGnl
 WW5GFjjj3CSvf0+kAAEk4Lq7py8ccGPg11JtbzfIVUBksqpDC6POSQ8cEFtaGDnYPlfU/nXba5k
 dQsb9q9e2WbyqLQapli1QGj6AyRo4AvXI4u0PEAP9B+NTvuNtewe/Dz+IZNy4ZQgbgXyDs8A=
X-Gm-Gg: AZuq6aLNbf9OaH2005uOMGKtSkWIcFe/e5E944XEFU+FOTLBOteak4/liJDT2DkhFOq
 uE9WdeyEylKHo/AxUFUiHD9fALIpQ0bzbXUa0TxFf/+X2TvnUmZ3xn3l8Hw0awXnuadA1Uvq59P
 HMFueoqjKvpQ1r91pouz8yRzTZjeN1/P2zsKYFik2Y9MMTta6S2+s6C0df0XRG/L+0ihPMYFzzF
 Ud7VnwGDn8VE2IeNQRm+DcSn8rVIQMG7ubW0EgZ2mVSylJFuYLSQcAbY/6Su8+Ojm2jRIwEqRjk
 YglMTSAC5TgKYGjwbhHxhaLCUSPWgFODKaFT8fafQH647JDUZV2kGxytTOlIikpIx3zRqfEaWDo
 QgPGqx9yYMUre2Mz3Tei4LLF/stVQ+Xn+Vok4N6fWeFdInJZPGR/ieSW9H8W7OjHCAbF+6etKXh
 Dfmdlz6ujoOZTUvKjcUeFdLqQ=
X-Received: by 2002:a05:6214:e45:b0:888:8174:5bbc with SMTP id
 6a1803df08f44-894b05dbf24mr12272626d6.0.1769340635402; 
 Sun, 25 Jan 2026 03:30:35 -0800 (PST)
X-Received: by 2002:a05:6214:e45:b0:888:8174:5bbc with SMTP id
 6a1803df08f44-894b05dbf24mr12272316d6.0.1769340634877; 
 Sun, 25 Jan 2026 03:30:34 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-385d9fec3c9sm18583451fa.15.2026.01.25.03.30.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 03:30:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 13:30:11 +0200
Subject: [PATCH v4 9/9] media: iris: drop remnants of UBWC configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-ubwc-v4-9-1ff30644ac81@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3291;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/9nEVbBbZylkYnurLYSAS/hZukhtGTEGsaxE9DNa3To=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdf6/ashi/qdiuGeLL32ceRnKUHTnGuZo99BO2
 zghxKQW6t6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXX+vwAKCRCLPIo+Aiko
 1RgMCACc7Qbkgnck/W7AQhj2sxH0m2vrJSNQyiJHi78KV7E/DEvYsUYPBgWy0jiBSqrhoOkZqSk
 +GRgr2r/sP7cG121FwQO2Aj/I9S2f+fg2jbWUlNQbZnf6O4QJmspgQPThVMFyLcfHbU8UR+j9b9
 mN9vUTqsopuG7bpx6S5kTEZaxYsfwN3M2UOK+j93CkicgrgWPBzT/SQUB/hDtedPVDLW/NExzc3
 XtykJv2g2P+h/y9M6s5WP1YN87vaO1WC3UiMwvEDoxnPGBBiGvPUB0Gi4Z5h0Nptqig4bLDTpWI
 pXTUbz5Ij56XkPvTKfdwa8YGzM/npwN8k/KQYoJaJ3hrCYff
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: iUnOSfrNy5J5cQLMLQm9fFqikMC_NkNj
X-Proofpoint-ORIG-GUID: iUnOSfrNy5J5cQLMLQm9fFqikMC_NkNj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDA5NSBTYWx0ZWRfXzYUp9OVdmTXk
 QDY5ORokJa+rLq62mFnVydSMrEfAxU0vihj/Li7VP5nPNbGLBcAwT6IP5o5vePIFOE9Y5UtstLz
 O9q1y/NttpZJDTa3c1twxXQr1aq6MkKLQavYxxcJd4UlYYV12TxontMW2IMksDAnX9oDKaX1YAe
 pQWrOnEUofvsfqG+t6rQ/QsDuPTuCw7kIEh4n2+Awavp4JJcizw0Hzbrk0UybfOpOUFHb/zlQQc
 Ggyc0STv6kY8y+Vxa65z8t1ameaT802jBOZnRYpZJSVqp/feDJeqLXGx67SREZCJ6lMzdiyVc0d
 gaCq2sWFKuNiriVUhG3EwwTVML6tnZWnsj04+j8td71eSy2CtXr6NTHqXm/1bxOFyLUmKG+lnvz
 twzeZQdrn7B8mqFbtqbHm2PV7Iv6JeE62whc8FeY7izGFbmDzwo76PiMUei5zT0qfZd3rtvylqX
 438ITT+FuSvKiCjUaPg==
X-Authority-Analysis: v=2.4 cv=Htd72kTS c=1 sm=1 tr=0 ts=6975fedc cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=0TfDEXg-tPZCovj8PBUA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 85DA4803B8
X-Rspamd-Action: no action

Now as all UBWC configuration bits were migrated to be used or derived
from the global UBWC platform-specific data, drop the unused struct and
field definitions.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 4 ----
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 7 -------
 2 files changed, 11 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index e8b5446dce76..f42e1798747c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -75,9 +75,6 @@ struct tz_cp_config {
 	u32 cp_nonpixel_size;
 };
 
-struct ubwc_config_data {
-};
-
 struct platform_inst_caps {
 	u32 min_frame_width;
 	u32 max_frame_width;
@@ -241,7 +238,6 @@ struct iris_platform_data {
 	u32 tz_cp_config_data_size;
 	u32 core_arch;
 	u32 hw_response_timeout;
-	struct ubwc_config_data *ubwc_config;
 	u32 num_vpp_pipe;
 	bool no_aon;
 	u32 max_session_count;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 05b1dd11abce..a526b50a1cd3 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -790,9 +790,6 @@ static const char * const sm8550_opp_clk_table[] = {
 	NULL,
 };
 
-static struct ubwc_config_data ubwc_config_sm8550 = {
-};
-
 static const struct tz_cp_config tz_cp_config_sm8550[] = {
 	{
 		.cp_start = 0,
@@ -949,7 +946,6 @@ const struct iris_platform_data sm8550_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
-	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
@@ -1054,7 +1050,6 @@ const struct iris_platform_data sm8650_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
-	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
@@ -1150,7 +1145,6 @@ const struct iris_platform_data sm8750_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
-	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
@@ -1250,7 +1244,6 @@ const struct iris_platform_data qcs8300_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
-	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 2,
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,

-- 
2.47.3

