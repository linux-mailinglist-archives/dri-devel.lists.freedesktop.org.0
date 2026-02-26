Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yG6UOVhPoGmIiAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 14:49:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8508E1A6F28
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 14:49:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD08310E939;
	Thu, 26 Feb 2026 13:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y35umf1F";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kTBEhH4W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B84E710E937
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 13:49:08 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61QAKiKx906609
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 13:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=YtUMEIXmDJnWNO68ZEgijJ
 9MgAuywjdoylJ/BWpR2xc=; b=Y35umf1FJ4OdTunj84WKhtwSsSeR7cePIAakHY
 ObS2dOHRyGUPJoaFUvaFbVLkP+aR/ul3C0aLDn5XMvDQYjiddFMFMaE4fUpygyI/
 p+51QOj0QT7K5/jpnracgDVmCOrsMPMo5d/To0+dWEVAK5/W31OB5KYR5xJoQI6J
 THRsu6L3rlM0WIN7Hm//9l4MB4ZJaGSuW7b48akGKmak/rMLFtS+fFuNFGxi16sF
 1UQ7coSBRNYANrb6OsrV7pP0h4xFP3PdkljCsjoABmj/mMsJEfbkys2OHfUaRbyr
 IvUB/dC/mEXOWhCoNg0favVcPjQVfxZeNE5dUfhRo044rA9A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjk2v0uw3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 13:49:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c71304beb4so465625285a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 05:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772113747; x=1772718547;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YtUMEIXmDJnWNO68ZEgijJ9MgAuywjdoylJ/BWpR2xc=;
 b=kTBEhH4WcE2x41SGISK045AoIR250wRTDKXNz2w1yVrYAKkZESMKGMQLKg0E9ky7ub
 mG6BU1xGfDs+pZSnfQKdc/5dGFNBcGyptVNxGZR4f0ZCDBwrMll81uk8IToZm29nmc3v
 VhJ5LETuAILMfEnxw/LEtdxqPGcgNVbVnHURPkAQFhTyYzbgbuq5Og2Gajrw/iVja9sH
 QJ5KPHixrM/D8xEl2SrK2+Fn6jNJsTYM2t9QEx7DjcyAwotMrOZvuWC8dxAV/TRhxmMM
 7Q+0Y9xBVYkwIIo/zP8AO5ugiQlA0DFVMIZxWWDv+eX8lmW1DGoNJ32wrlpU4mWhjPBo
 DAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772113747; x=1772718547;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YtUMEIXmDJnWNO68ZEgijJ9MgAuywjdoylJ/BWpR2xc=;
 b=Er2QEt+Olv02ZfUge3MWZA1ney3gYmDgwmX6VGF17bNn4ZAT2p/26pgt6qnrJsKGWh
 jpo0w5wqka8St5H1I+2/stjSh3llBKskb5PR5dNi/aXZ4A3M4DwRRQFkLdQ/PyDuww5f
 FQI84m3gG60UNt0gatIP32N8RNyOp6tMxiS/X97MxZPRQr2mSzcBmOvxZ9WwfomF3Jt9
 37cMf2Q9zitZgxUyfl7JnZ7VTOcDqj/h+ELORdb+2wH3Yf/mh4SnGn8Bb1TFg0cR0MWH
 P2p5oQO6BEt9aKMgiZ7ir8H4HeZKk6JwTPNiIat4BSeYy3H3f11G4Zc/T5339piTHszc
 mjcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnLUlYcLKSiu2OIwMpUAZJCmdwZMQgYuFroaJRSKDooW4oOVJARnDSHs1rLXZ0W9SN6UlnLAwxUZU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyggKXlO8cjbnX4jrMvszOmCa/GUj6dRKrbf0LW7Hk/HtRIdY+W
 V+3w4iXAtHOroBWCTY/dyAeqmGF8U09zyidjR5aKQBn8XFxh/f2nE0b+jgUro+ZhJP4k8wNIWNH
 yGdnm7WzyMEHJG/bf4gbz9AgoDasXvaeg6BI6a8myO8scfQ2p1WLAGMmDLr4lg1z6dia8FkhLOP
 wcHpk=
X-Gm-Gg: ATEYQzzXhk8zYQbyyVDQUZlE7NOMY4b1os/8yP+we+WuYxTAGaZO+MmUS3w83u7sxjZ
 UCz0XWJNU/Qe+cpewUbd+b1o6EwfHO2JztZ+J2rQB4BMYvQ9a84BwxOHEgDRWvkEph2kBQJlm7k
 Fu13A5Y5AWvD35haged+NLn2h40vlwsfu+vEVneaD6qg3VWj7Msn7U10ksi3VJ5+8BkABidhM77
 nXYfPLJgRC6pPoKNGjF+UfDFt/4lJ4vRifewhHQYfUl1mWvOE20zF8m9z0MqeILvffB0AyzauZ8
 FokwEx0KUlyFNzx2CA5OiqyVBS9rKU7tuYf4nXpCjcICmQh7JuzbfomxaQMbjpkOje8w8/Yf9hV
 QneIlP+XltDJw/ilF9AgA9Gt0km0RQJT4MuOaQ6AfriaP1JiI3zdw6kf2CMB2vrFacPp6xbtG6s
 Ytx8ImBBACEFNGiPWx624R4z/K0rfhMOUGtQg=
X-Received: by 2002:a05:620a:319b:b0:8c6:b45b:9e2e with SMTP id
 af79cd13be357-8cb8ca65f49mr2439751885a.38.1772113746863; 
 Thu, 26 Feb 2026 05:49:06 -0800 (PST)
X-Received: by 2002:a05:620a:319b:b0:8c6:b45b:9e2e with SMTP id
 af79cd13be357-8cb8ca65f49mr2439747585a.38.1772113746254; 
 Thu, 26 Feb 2026 05:49:06 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a10a319f1csm846490e87.54.2026.02.26.05.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 05:49:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 15:49:02 +0200
Subject: [PATCH RFT v2] drm/msm/dpu: enable virtual planes by default
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-dpu-enable-virt-planes-v2-1-87971236fe86@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAE1PoGkC/4WNQQ6CMBREr0L+2k/aRoS4cuUBjDvD4rd8pAm22
 EKjIdzdhgu4meTNZGZWiBwsRzgXKwRONlrvMqhDAWYg92S0XWZQQlWikkfspgXZkR4Zkw0zTiM
 5jljr2rCgk2FFkMtT4N5+9uEH3K53aLM52Dj78N3Pktyjf7tJokTdV5qEaBoh6ouPsXwvNBr/e
 pVZoN227QdyWdPVyAAAAA==
X-Change-ID: 20250514-dpu-enable-virt-planes-7b7ce0a6ce2a
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1449;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8i8tNnbsqOxhBX+7vt8ZmweWiDsBCJ1prDtobbiR6z4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpoE9RHq3AyAQJWnBsH5MCEJxQnuBUPW53HTlwK
 0yZO/2Nk/6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaaBPUQAKCRCLPIo+Aiko
 1acVB/0e6xKqCxQipAifHQkcio0bhtrcjkKLq/BZqsqhl3U67aB2T28scuPBnmmhFeDsoeBqyvL
 uGvULJiypwpTuVzA/O+Z79t/eed2ScR6ww8tp0JULhHyqzTas5XjeAFuBApM/2WFaSQwr1J3PqW
 kNudw9qgXlMv9oBUCRmEd2guJy5oXuHgHfTVO4g0p85Kmjg8RgF+VxyO9UBOSVF/kI7p1OCg+85
 JnBBHL9UIVhp7n/tv0HKDfWGcbCj5WbHttatrA2qs8AvT5RXAnVf6RLt+TSjzSg0HvhgZti4dOe
 KlRydB1IPXuR5DWz+lkc4NRNb15H34xJDNJUx1QRRRsRZaRv
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: JK1T4p3-ZEEX-9y1DWQn2cEYAq7RKURS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDEyNCBTYWx0ZWRfX3WNZI1RMnZAG
 fMdJlR3xE1hujZN5CwGCGMdIOp0vVGCrK9hoZMROUSgDOG5psngw/TBt3KILvBqZ+g+/ugVUBPl
 TLKp0UKLa7+EA1HWxJHR14Yrqx1NRfeBhsDt0uioAUW7oiwSr5c2yywQEty00oBsy74D543P9G0
 FCVW73KsD40iqBKAy0Q60mfXRV2HAAiEQj0XvOkBZoDBWaYrW61kO++ZqPnnXM0NzGVfb1qpjXz
 Kg+2vnFAoDdoR5+GFzo1KQkGM1J6DUtu62NEdm5govVZOjWGr5/LS93B7O736Ag9IuOxq9iihqJ
 jDv/zWg+UMA+HyoIka2lLwAM+DxPD4UYpBQnSeErFxKnQX3e3s/vRq7rAYNg77XCypM0nGiXpd2
 mnpSSuuVBLvtd34WuesePZ9L2NVXb4htmjlQCgDUcnRx6c718T207EwzZbvzPM8SghpStq0ZDmZ
 r4POUHYhii8TBv1R6jw==
X-Authority-Analysis: v=2.4 cv=PO8COPqC c=1 sm=1 tr=0 ts=69a04f54 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=4RDPIAw37ivmvRzZDt4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: JK1T4p3-ZEEX-9y1DWQn2cEYAq7RKURS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260124
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:quic_abhinavk@quicinc.com,m:lumag@kernel.org,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:robin.clark@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[quicinc.com,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 8508E1A6F28
X-Rspamd-Action: no action

Turn on the switch and use virtual planes by default, enhancing
utilisation of the display pipelines. It is still possible to use legacy
implementation by using `msm.dpu_use_virtual_planes=false` kernel boot
parameter.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
This is being sent as an RFT for now. Please give it a test with your
compositor of choice. X11. Weston. Sway. Wlroot. CrOS. I plan to turn
the switch for 7.1
---
Changes in v2:
- Rebased on msm-next
- Updated the cover letter, targeting the switch to 7.1
- Link to v1: https://lore.kernel.org/r/20250514-dpu-enable-virt-planes-v1-1-bf5ba0088007@oss.qualcomm.com
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 0623f1dbed97..7c5b3495bddf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -52,7 +52,7 @@
 #define DPU_DEBUGFS_DIR "msm_dpu"
 #define DPU_DEBUGFS_HWMASKNAME "hw_log_mask"
 
-bool dpu_use_virtual_planes;
+bool dpu_use_virtual_planes = true;
 module_param(dpu_use_virtual_planes, bool, 0);
 
 static int dpu_kms_hw_init(struct msm_kms *kms);

---
base-commit: 50c4a49f7292b33b454ea1a16c4f77d6965405dc
change-id: 20250514-dpu-enable-virt-planes-7b7ce0a6ce2a

Best regards,
-- 
With best wishes
Dmitry

