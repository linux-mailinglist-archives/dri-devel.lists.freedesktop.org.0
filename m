Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEZQAKSTqWlCAQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 15:31:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B0B213725
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 15:30:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD7710EC1B;
	Thu,  5 Mar 2026 14:30:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GAXLPrD1";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y/LXtDj4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1104510EC1B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 14:30:55 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 625AFgho1783427
 for <dri-devel@lists.freedesktop.org>; Thu, 5 Mar 2026 14:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8vpj08mJ5C/IUKaBXReHEtx5aeFlsT0McmKWTl0bc1g=; b=GAXLPrD1frPdI5+x
 frD907lL5gWpKAxy7pDP9NgZupl5VWtMFNnBiwexg7hHSYe5qcnJO82li5g6kkVe
 JLZqEVZ5Z5GGk0AzJLPAODF+b6YZhGPN0YCDVuPxbvE5uP+/oBlZkgDnA72pzoC8
 Dgi2dyUrLJrk5uMrT3zWkQ1UhTzPYvnFW/3NhXJZ84BKHyxkq1PFR5YI97EXCvzI
 eUfmjSHVrCVl7Mg1Ty+lCy+B2a6HYn+8TFMt9Dkl7hRYeUT0iFnyZApmfxTkaxyM
 mEd3vwdEo1sfZkkKudDU/3UQoxWJffyKF2VSfLBJnC26SFu9SpyKnvL08aApmqSb
 +I8Y5g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq1pk226s-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 14:30:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-899f474fae1so292096176d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 06:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772721055; x=1773325855;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8vpj08mJ5C/IUKaBXReHEtx5aeFlsT0McmKWTl0bc1g=;
 b=Y/LXtDj4fH6fp3SmCEZnWwyj2vwIVTAd3Uqo4DLtKV5TOUr3FAH9ch4cu40ayisBGy
 IIR8bvKpXlUH1M6lwtL2gq3UHMK1gFJ4AYGrHMvmWCygvv7DJCxki32Gq+4VKsU8w3Ei
 C/DMN6JKfU5j1+zZi7ySkQnTP0T3My8U/u/s1FuU+8qk6vj1E18xFYtZfOEET9pQQ+vw
 jRiFF+qHqZX5j3nO9NtorbSZtYJd0s89q2snhOWP1nLgaYUgYELDlc/9tqva5NJX1Zet
 yG48lkCqk88zkCgQkMdSZsyXCVO2sxpcaics3rjoEArgxBCWmaHpXzEiQB1Hwf4HtgYO
 TXgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772721055; x=1773325855;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8vpj08mJ5C/IUKaBXReHEtx5aeFlsT0McmKWTl0bc1g=;
 b=MXyC2Nxk6OBJGIkT05Ndx2c2Cg9TUW8A6Gx7hoSvaUvg+hpV6SwhHAJdMGJmRxnkOS
 lL213eTavn4m0Y+t+OYi2vB0bZE3ovDW0RrUqFN8RA+OkOal0n46eZd46RlqtoCEvXBS
 QelmrUAr0ldkyBljflwfwbx13cKH1OKijB0dfiLf9OyDEeSvps6CWHzvabKT4ltXpQyA
 HGAutFGRs9vuCzYnMKhd7+qnP+aVmfQGhr/+XvES3ZXDaDANkBlOLIgC2lf8DHiJKk86
 3UuZzkorZFd/hpV1thnqhXLphGCLprQ42tR6/u4bZFs1w4y6fENly6t/BIKVQVWrcGYO
 IiCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5rvWNDnPixaMI26fanCrbkNvRrqTN4+5nXRmP/f3jSgXt+KtexSHifUQk07ZZoWy5dzokbH0eyWY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyb6XW8XhaXoY/LkTny0HnMAGzFmWRsdlxczYL5Fl4q8UEEW5c6
 vwuS79nIE+HjcSOC5qTGSvOs9ygswRthEoUiRg9Io1FcQ4RIjAnWM/fv01au5otBh3K0TApHx/S
 lpjkpUsvyQKS/lChukT8qzANQja19DbgBFJlCWW1Yvm1yRDO70kKPccLe0rcRMOPEHSpdI4c=
X-Gm-Gg: ATEYQzxE5FI698Gg2BijOmY6XK4LaHknbF2M+FbgNcTiawlm0yQBkbK6AI/7p4NPHhu
 X3DEpkbke8pSwmSrjpt3oqtvDjsHUxVhj67fBhpqxahNVV8SdaZlOV2vciaHPp/Dvt0WoXXDD7L
 asgosIEOl9eAVkwU84Cmh4HRnMLc4EFr9Ea5xZ7h4zlf9vxH0U0cAnDkexI/Kuk7AuOkMZeVPMh
 Hargw+cx2XQh1DI+o0CGKqazO9ouTMo3EIxvW304geuM04DruXgxQH2s+XPx3q0DxAdpZyQcoY5
 Fc5aLSfoHISAuWLfiAzmsUcWp1SSjb3mSBC8bL5wfbLpqhmpCmafnnuqzQJlEIs8mw+z37ca0tf
 hdhvUbFCs7upKJ4O4ahwOX7tk/Hs3KTNfxPrtnooYF2QxNkQIDkfwfOye3OL6FIAXjzEwIZ0Dgc
 FMikr0ibf0KPh+QNpMuX/wwTAvNrAizE7KlJA=
X-Received: by 2002:a05:620a:25cc:b0:891:7008:f2e0 with SMTP id
 af79cd13be357-8cd63409339mr278189685a.8.1772721054548; 
 Thu, 05 Mar 2026 06:30:54 -0800 (PST)
X-Received: by 2002:a05:620a:25cc:b0:891:7008:f2e0 with SMTP id
 af79cd13be357-8cd63409339mr278166185a.8.1772721052543; 
 Thu, 05 Mar 2026 06:30:52 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a126fcf563sm1522618e87.27.2026.03.05.06.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 06:30:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 16:30:43 +0200
Subject: [PATCH v4 1/9] drm/msm/dp: fix HPD state status bit shift value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-hpd-refactor-v4-1-39c9d1fef321@oss.qualcomm.com>
References: <20260305-hpd-refactor-v4-0-39c9d1fef321@oss.qualcomm.com>
In-Reply-To: <20260305-hpd-refactor-v4-0-39c9d1fef321@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1209;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hzwfWK5+EPLPBOMgkg/4Azem10iuzkilPWoxif3rO60=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqZOYlpTbWo3CEyOsGYWNlPaqDWWExo3CkIsuF
 0D84zyAIS2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaamTmAAKCRCLPIo+Aiko
 1Ua2CACOHrZcU20ETV8sAZ3SKCn35AIhtfhY1woMLphDSsS4bQFmltLTHXaKWBu/2yA4gRW29gJ
 3NNse0O4xCty8GG6VNZvNHkgE4FahLW/ENcwEii/TSDuZCQTTcKmX0BMYgrAXJi19hpNwP7t0m3
 TpZEhkFKgrF/yPtD42PqXsjgbymMmqp0OtC5JTpWAuVRzikl+fA+rO3rppSVU9bXf1YfO2ROqgm
 dQI4tedzx/EA9X+PsFVa1rtwc4Cq1jj19gJ+QLdO3f2tMOrAckzTVjAZecec/U4zVSysay0Olmi
 vTwCPjAyEksRF04Oqvr1K95P/kqXQmUbYlfkwYMX65TzZxco
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: RyrSUBQAxbGhZlpMiXDkNdLMRe9EkUFp
X-Authority-Analysis: v=2.4 cv=Gu9PO01C c=1 sm=1 tr=0 ts=69a9939f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=IBRk8GtBIsankUNt0b0A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: RyrSUBQAxbGhZlpMiXDkNdLMRe9EkUFp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDExNiBTYWx0ZWRfXwcmE2BTOxnWP
 lxOIee1QwTeRx4eOme/JbQxZtLzyRXXqzgkoFhrht6OLFkd8sd/6Z6Qc8Ad7HPYPKH6PAFh9mUY
 mOUDulswSIGpfAZPps1xj5fDGhRsVXnqNk2bURJHHWp5TglHlAJ5OWWE2kfhn1gXnqM8VCRzjjv
 eRk1QGx5TSyoMTr+fqfue+Ve63CwDb7+9MGI4FoODwgXmJGwMEs48ZdOc2jcsu5+vTuAmpacqzh
 c0CWn6ZV99aJtAJRywj28rF2efBF+P85ss/lpLimXKVgbGB0YFnfhVKKgEWzerjHlagHv1vGwPU
 +z6sHNMAfN6kcwoGOhgmfbJOjlSD1rrt9m8e5zjE5EzUzuMoU92ynffg1QmEnOrPm9YRz9snNF3
 pkq4tLg8yHiyRS+X5kJYVMSht6L+zNuIxpEwS8Er6fujQkwVjWSEa8OWp7F/8bHCYwFXZ0u5EJw
 g2xFDUdqorLqEtw1+cg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050116
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
X-Rspamd-Queue-Id: A0B0B213725
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:quic_khsieh@quicinc.com,m:yongxing.mou@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:jessica.zhang@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

The HPD state status is the 3 most significant bits, not 4 bits of the
HPD_INT_STATUS register.

Fix the bit shift macro so that the correct bits are returned in
msm_dp_aux_is_link_connected().

Fixes: 19e52bcb27c2 ("drm/msm/dp: return correct connection status after suspend")
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_reg.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 7c44d4e2cf13..3689642b7fc0 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -68,8 +68,8 @@
 #define DP_DP_IRQ_HPD_INT_ACK			(0x00000002)
 #define DP_DP_HPD_REPLUG_INT_ACK		(0x00000004)
 #define DP_DP_HPD_UNPLUG_INT_ACK		(0x00000008)
-#define DP_DP_HPD_STATE_STATUS_BITS_MASK	(0x0000000F)
-#define DP_DP_HPD_STATE_STATUS_BITS_SHIFT	(0x1C)
+#define DP_DP_HPD_STATE_STATUS_BITS_MASK	(0x00000007)
+#define DP_DP_HPD_STATE_STATUS_BITS_SHIFT	(0x1D)
 
 #define REG_DP_DP_HPD_INT_MASK			(0x0000000C)
 #define DP_DP_HPD_PLUG_INT_MASK			(0x00000001)

-- 
2.47.3

