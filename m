Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MmSHNf+dWmMKQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 12:30:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2404A80368
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 12:30:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 809B510E361;
	Sun, 25 Jan 2026 11:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XaUMeMpR";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oa6Hci1Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C003810E361
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 11:30:23 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60P7hTso3057008
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 11:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JXzLPzKJmMMfBleWuh+IFIAqE4Ffe4ls9p1aUztqIUU=; b=XaUMeMpR90SZTHdW
 kiMEOE7kQ6uiI+6u9E/sOXjbeFSoV807stnOdr3EbZbr1sFWnPF3U/Zbh8xVwtLc
 iJgCkhH/9HoeGW/zncbR9HxX3An4EHOWgDNSe8mS5PXHkMQJVFKAUOpmOtdXblgZ
 5ymmMkiMsq3RtSH5JzVf1xuToVHThDqprVVVTrE7uij+Tbi5QTSk9vcTXaVqDlR9
 e8gSrKHXQl1ooYTEZh7GL6Y3zByf7N75ZAvmXByuuqNPTNenryAAG5FyWiuvp5i2
 Hw+/cx88GB+8eXTBOPbHIlTp/R+G84ftDWETgfW0e1s36G+nMwefozTsi2ZHVn1F
 fmdN1A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9qj0uv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 11:30:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c6ae763d03so375642185a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 03:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769340622; x=1769945422;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JXzLPzKJmMMfBleWuh+IFIAqE4Ffe4ls9p1aUztqIUU=;
 b=Oa6Hci1ZrDeRH3Zvk/zd+xCmCvhip3cvAIrGXWHr6n+vQpeOHr/mCi6dR42jAvqad0
 QxO1fW2U/cFTVxz3pWKGbf9UlBmfogR6CgoiFjshqYZSsHrowTNdSpuX8DG6nqkv2C99
 gA45Fcb6UfmglCssPa2RmhQNqmh2CXSmsqR5s9tFK1T8Ii7yKWxe6gOhShRMEi9BhdMd
 3LmSNBeoUCFfKVviJbv0s8TfvX2l2RbV7a3cugVN8288+siwxLTSCZ7zlpxIjNhTgor6
 RCmYBk77YEnrAk7lZWJqhf9jeRKh30VrAW77mEDgxQyOWpmFv4W2T0ekq1a9M8CqMSoj
 Yqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769340622; x=1769945422;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JXzLPzKJmMMfBleWuh+IFIAqE4Ffe4ls9p1aUztqIUU=;
 b=SP4l+hPOnGtw3bPfj73jkkiGPpebtgX9IVokk22dZYsb9kmAddmeqF9p3mM6wTItGx
 HLg+8cmvvJnuZiwnMlzH2qY0BD7YFqDa0uBvyfcmB19z/FV2KSnNpN5SxMGUQ3cXoavq
 eIVD9thx7uQNzoEZmH5/VtkAsvRr+u8aWv76Pg5IcOETPZnSzbRlfPR3eG6SkaxPkVYh
 RCZgWoUMq+tN3/Nr6BjhsDRkSmMVTb1gcT5DUWvPAk1FBIWUUfZjG39/RP2zQvq0KpQT
 eh8gkrfxBQA/I2QyfgdYJeBSUifZLL2nU7l7gvXjW13Zs9dj47eRPj4wpYsolNmrTPgY
 fQAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVW53g8IxS4GOgC100BZtoC1Vu48FQPGoYrS27SrTd3ryWksKM7Nv2VQrqe94GtLVIMsAyd9P0PYF4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZUJriskZA425P6SGQavJXdiJm55ntVLKLk+tt22gwiDWcaYE6
 TSgWxiDweKQyHV5iBmsi74jb/O9geYTD4+b0Ld9Sd6fL5BLMZLuRiR62nSPLUt+6WuIWUH/BWPT
 sLJF5WtNT9F1IR0R8VEmBOufUfnTgh+FYCBme3l7dbPXNsnHQ+EBEkps95zpkjYXcVBzC1nA=
X-Gm-Gg: AZuq6aJ5/CNiPwPV5bF3z90EpLPGEiW7gwN2wftgK7mx8VP4ikWaXus4URRAXbgyCSJ
 IrkRrOMFgwEtzP92+WjwdNPQBnftu8nbBjv0DQLySkIs2yJEhGh9HQEZARMGSTuSEF8ri2JkCzA
 IowqgIctw9u80E52AC3OKi0aLQKxCaa7KlcxIZS4Cr6dgSDEiXEKJzMHjoSkA9PU/XrUAsIn/u0
 aeJB+GxTg793Z0tu/S3C8x7t2RcUvDpxExVxJuN4Uf6WIJgf3aATIMx67m9FI+5JwJmQLt3q3bX
 xv1ZwFbreAg2T68sEFxwdwRvqLM6sofNWxRUPELhxXqw4ZQ9PqJDTHbBgKFw4+xBMNqC5j36H75
 ntMA17HPQZbTNGA866jDwIdh8JJ6FXVfIJfAon9oZEB6IS3hf/VPn6i1EtttXJsjggXxr9GsxDH
 7jzZZuB3ynrojDXE+AOKtQSP0=
X-Received: by 2002:a05:620a:469e:b0:8c6:db7f:d4f8 with SMTP id
 af79cd13be357-8c6f9565e95mr156279685a.18.1769340622140; 
 Sun, 25 Jan 2026 03:30:22 -0800 (PST)
X-Received: by 2002:a05:620a:469e:b0:8c6:db7f:d4f8 with SMTP id
 af79cd13be357-8c6f9565e95mr156276685a.18.1769340621720; 
 Sun, 25 Jan 2026 03:30:21 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-385d9fec3c9sm18583451fa.15.2026.01.25.03.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 03:30:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 13:30:06 +0200
Subject: [PATCH v4 4/9] media: iris: don't specify min_acc_length in the
 source code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-ubwc-v4-4-1ff30644ac81@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3117;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vCjp6Otef/xE5vbuvwNoduQVTq2eHsexFqb6kzgabfE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdf6/dUSxAP7UblvRb8kGWVJzqs8Ocmet1os/n
 4l7WYzjvrGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXX+vwAKCRCLPIo+Aiko
 1UQhB/0SdagutS0t8C4HAwNbbEbmfVRmSBvi7KeOdANOhfifoGEYcJhf0NCoVJ0o7Zpq+QCcfwT
 RqNqFHyNatMyikz7X+AbeH2PZWC1mcQ+zDMrH+4kiEpcERHEsIhWkay2vihuYye4hjmEL1Y9Jbi
 +hC7FB1FwdAa5RltdrpCu4e0fMQf3sQOoy9iuXRqZbvc6umprPFNCFRHSuc3vz/j7w/EZ7O1xcj
 lZY6Sh8U9Ppuq2w81+JiuLNPCFuBtAh/ot1/wzFQ2yuf8wCs5KbVr0Wo2C4WlUhY82NItnRROky
 uKYbzA46dT4TKAb0Xs5vhyK8a0EaoTDkyWl+EMjZjjEPuL02
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: mC45jb14YZjqu0RrNcTe89gEKbySgnFu
X-Proofpoint-GUID: mC45jb14YZjqu0RrNcTe89gEKbySgnFu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDA5NSBTYWx0ZWRfX4/TOmzr3EuCY
 u+L8JggGf24Jq4laRU1NRRPOds0BlMJyc6csxWUUNcdZB6C43bwf/y14tqWYShuuOe8V6h1UG9M
 3dj62p83oV1c8IvYgKAkMH1mKItvuwdbdQIhwUw/pWs0Y5JpLVQM3zkhSbQcGE3KgU6jRAy2IKb
 3kFbZRrmglR7NXhw2PA6WTMfRpfAwT/jX5vIOcNyRf1knvfcixaKUzVQXe9dR1SI4YLHZUqU5Jn
 L5cCRp+f135nP6Y9s7vBgxHltN94FfOS8RDWm4lOWMj/AGJUSaD2IE90XK5tc8ubgphQjrkSLJd
 ZZuOVfdZg9Q4L1WL0G4JlJ9GvKQu1JuwjtsoUleEri45ZAR6foO9C15Es6QsKFRroS8QkNrXMlO
 lCE4Bd9pDo8PRlv0cp7C8pX0mgp1QzmwH1+RV0DNmQA1g00rY2m2JMpjnnNMQsRHP1z466wz6OG
 NvtpBOfNBn82fn/Hi/g==
X-Authority-Analysis: v=2.4 cv=TsTrRTXh c=1 sm=1 tr=0 ts=6975fece cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=qS6nuPEoivtXufaKKhMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 2404A80368
X-Rspamd-Action: no action

The min_acc length can be calculated from the platform UBWC
configuration. Use the freshly introduced helper and calculate min_acc
length based on the platform UBWC configuration instead of specifying it
directly in the source.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 6 +++++-
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index d77fa29f44fc..aa4520b27739 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -3,6 +3,9 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/printk.h>
+#include <linux/soc/qcom/ubwc.h>
+
 #include "iris_hfi_common.h"
 #include "iris_hfi_gen2.h"
 #include "iris_hfi_gen2_packet.h"
@@ -120,6 +123,7 @@ static void iris_hfi_gen2_create_packet(struct iris_hfi_header *hdr, u32 pkt_typ
 
 void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_header *hdr)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = core->ubwc_cfg;
 	u32 payload = 0;
 
 	iris_hfi_gen2_create_header(hdr, 0, core->header_id++);
@@ -146,7 +150,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->mal_length;
+	payload = qcom_ubwc_min_acc_length_64b(ubwc) ? 64 : 32;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_MAL_LENGTH,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 5a489917580e..08a9529e599b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -77,7 +77,6 @@ struct tz_cp_config {
 
 struct ubwc_config_data {
 	u32	max_channels;
-	u32	mal_length;
 	u32	highest_bank_bit;
 	u32	bank_swzl_level;
 	u32	bank_swz2_level;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 5da90d47f9c6..01c6ffa7e084 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -792,7 +792,6 @@ static const char * const sm8550_opp_clk_table[] = {
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
-	.mal_length = 32,
 	.highest_bank_bit = 16,
 	.bank_swzl_level = 0,
 	.bank_swz2_level = 1,

-- 
2.47.3

