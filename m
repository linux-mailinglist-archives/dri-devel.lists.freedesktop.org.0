Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mK9sCrCTqWlCAQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 15:31:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA81A213785
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 15:31:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060F310EC31;
	Thu,  5 Mar 2026 14:31:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LzyRhKtx";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gcIk1gUX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D4710EC3D
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 14:31:05 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 625AGAmj4171325
 for <dri-devel@lists.freedesktop.org>; Thu, 5 Mar 2026 14:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hA0YMMrWeRTI3WTeWLsPvkfJar0/KW3bNGEZxQ3XIL4=; b=LzyRhKtxGE1kumbe
 53/WcnHYKeqZlXoy0NckKVM5OTwtZInDZk0tQA0vxUnFbZVuVCF2GDizxm6WH+au
 rQrgphU5NlGPrHxCFFNvR1ho0F01IweDwrGobvmld7SGjmNqyz2GUgnW8uLkxhhi
 kP7hcCfw7B10P5uuLZyOdPuLmz8CP2SZ0jDX2iXuyyW75NJiPofUdcCiGUu2u1qv
 pcZRoMHafQ3GRJhP4x25dsinTnVARzDNIccUf1HxG49z4hMbKcKu3x31/HrpUX5p
 mkfDhGk3HNWXBk7MBQckhBEP1kDZeVHS/lJzHVcfPX70hQ16cgPKGa0XdMaBj9J9
 PXfOWQ==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuhb34e8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 14:31:04 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id
 006d021491bc7-679c29b437cso64068511eaf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 06:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772721064; x=1773325864;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hA0YMMrWeRTI3WTeWLsPvkfJar0/KW3bNGEZxQ3XIL4=;
 b=gcIk1gUXBBFc3BLhZ6H1JZvvjMM2lLm+TcnawE7tnn5Gqorr62bJuuUe6Y5kw96DFU
 62ork/EpBjv1QCipJjThgRnHpS+/ZzkPyBs55PFV0VJ8rCkxx97vZNd6hYZL+Obz0dF3
 MnFETG655zd4343FMFdoUOHWLJIBEOc22Yf3Y71JoT0lVHv5NHdU0K4lMnTPK4DgX1sO
 IV4Jv6gCs2jOs06Q6NRQGwwi6XEUMz+T95d+oxzN+1aYu9cLdk8+h68OXnEl+URKd6D7
 vXWe/VMe+/zB3ifsZpAGFHOCdMgcBHwQ/B1IzLwQmRAhktAOfDI0K9zBJlWEnN8d3789
 qPng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772721064; x=1773325864;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hA0YMMrWeRTI3WTeWLsPvkfJar0/KW3bNGEZxQ3XIL4=;
 b=jchUyeq83baUhD4+uIX3tRrCWSpR752ag6lOrCjvaGuL7R1l52Q8DlsXZqUTsT0P7h
 nPc+satQ3TAqn5RrjjENEcPB+LwnJwMbAnl7q4pH5MqdnRRXZ1AHQ2AYVH5ajGp04bZa
 EqB4lfQHLVChWHjQWSLU7kjj1ZnMdHSrrcgsmvekyKaYh4DAKk2xk/IKcvgLQydyHlyH
 nOxRKswa0+hYgbCeTpBnfimMsycVTJmBO+5nfC8Q0rJV2+6T0PLix+26c01BVYF/Xn0A
 owKFkt539ksLJ/eEtxy+UBEY8qWuYNnEWHdZvhfiI5hywdlyQn68j1SJzBtgklpsdR/9
 JDwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuQ1JZ4CMbRowFiz0lYA+LOdGo6S+o+blfk46yl2Fi3TQq927xhFx4ulLj+QOvpKzo5rsiRMW2ICo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwN2w4OtIBAv1BJPoyJ6xuAiYuqMbdh7aTKV0y7iDzTvCdkHvOQ
 tiHu3Qy8z6nbpHLV+PCpM7kshQHEsyf+M/6X0ywjxrr46CcH6gUhicXY55L0xy7HUOKja0iaAaD
 LTvri2r+3B8FimoFao+GV8h15qGXebENisr/GDuri6HkLD4+WArax4l3NYfVfL+QqOILPL70=
X-Gm-Gg: ATEYQzzriLKot8UklWnJmMDIcnmwcBq3+mmo4CJ0ZXvqcc9zVmSUr0dYzoDsIaAFmS+
 Tfp/MOaeC7q8azNr/x/oOYCv1Wo2x3NtcosWJM8YF2lphWL+c2Vi+hCmgBYozDtJZkyX69oVmBf
 3wPZHuOnf+Ha5XSKs3VB8E2b6CWDBdAiE7WQdPIvVK9cRSoPFP4ZGnJroPQ3hNoASLxNJWW34kP
 dBYO8nyKx7x45lQhOO+qoOoqWxswhGQi0mAycDZ0WCcdDEg/tdAJQGV3+3KMp8RTReHg4J6zUMj
 GSLTFgxGYWZAe/KW82glX7+6dhzI/SCFzmXlwlcn5MGRydFG2r9GEzpCINBRouZXn7w7ugPMhMa
 wn0x1cr27l3hnRignI/60hYbyl8aJH6vLSaEArP76142n481a3FO2cM7z230dFj9ZRygVVHznWB
 NsNakK4aXw+cPjtu3K5PHbw8o4n+s5VgXN8uw=
X-Received: by 2002:a05:6820:f00b:b0:67a:2e3:2236 with SMTP id
 006d021491bc7-67b17700617mr3432243eaf.23.1772721063859; 
 Thu, 05 Mar 2026 06:31:03 -0800 (PST)
X-Received: by 2002:a05:6820:f00b:b0:67a:2e3:2236 with SMTP id
 006d021491bc7-67b17700617mr3432231eaf.23.1772721063474; 
 Thu, 05 Mar 2026 06:31:03 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a126fcf563sm1522618e87.27.2026.03.05.06.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 06:31:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 16:30:50 +0200
Subject: [PATCH v4 8/9] drm/msm/dp: Add sink_count to debug logs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-hpd-refactor-v4-8-39c9d1fef321@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3288;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Fiq6vHHLOBAD6Z/SIX1bFh0DDbKNiDPpLSiB5DaPkUs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqZOZbZlxeWdGne2srEmPPStsGpSKCc0T2LuT7
 bUf8mTP6dmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaamTmQAKCRCLPIo+Aiko
 1VLkCACEcsY6owVA3haEIzVFQ6Jyh1RAU/1aWnOWCnzrqIFQxJUnCx1iPVXPwc2vYuq1X6du9uG
 Vff+VdXFteq7wmA4j4M2hOdGVdZ7P5MpTpDQPYwbScDEDpdbxJhwJ0/4b0ykSpW4FTui8bzmLJH
 QtjwtnuQMLNL8KDgNomhcOBMl8JKmOrITHk1XxWzXodRjQ5qt8ivsz35+MP6Nw9L28oNB3bVfce
 3lClwyL8TNNMtQAac2oJ6L8uuag3vUB2ee74ZUDzUcP+JwvGfBIR3LX/qvpngOQhLU1zbK2Mu0N
 /LO5FbkYOLPIJfJbw1FoIXrZmK7GfGq74rKwvwQwqZca1mRF
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDExNiBTYWx0ZWRfX6tX6mxY5D9J2
 uOkPpc2AiWO128d24ryGevE723B84FuaBbY7gq1Nng7E6Gxsx/vlSG/VL20mFeD+/Dte7hYyVcC
 XmcZD4MKlEKsQbMMhUwF8gQv0Hlv3tzHB5RtvPBQXytmmMwXvdzh2D88of+6cz0TOAnZcnYBAre
 TzMJ4hp+BexENDFDXcoGHZo0LvRr4lMynWvOyrJqTMwk9T4A6+a98IBbj0YhwCEsQRDdzYzfpPw
 wSFKXYwlJ79an9UHTLSGx1Awvx2FSX+f61jX/v929J03BNIjQTzNi/uAaBpXaRJQe9Ao/wcexDA
 +Ck9p7qfPVIyhCS18zOG86zMngNIc1MdTPsZikIMbWZ6Fi3YCRtmNwB5EPHBsQJj0Ryov6s/to/
 98l4CnzRrmMay00ixnWZDmMufDopcqLW4JxhUWn01d5wDB2+Kjyj9MMi8AEMwIPJbRZVC3hwNV3
 mx4Zt/3RYdC/wj8y9iQ==
X-Proofpoint-GUID: HDAsnec6AsJjG_a-cI3IUtvYFHYHrJDo
X-Authority-Analysis: v=2.4 cv=SqydKfO0 c=1 sm=1 tr=0 ts=69a993a8 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=D6o9UKO1UCu5gje6phcA:9 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-ORIG-GUID: HDAsnec6AsJjG_a-cI3IUtvYFHYHrJDo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0
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
X-Rspamd-Queue-Id: CA81A213785
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

Add sink count to the debug logs for [un]plug and HPD IRQ handling.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
[DB: dropped link_ready handling]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e3b43d73b67a..a1fb9c62bb0e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -388,8 +388,9 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 	int ret;
 	struct platform_device *pdev = dp->msm_dp_display.pdev;
 
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "Before, type=%d sink_count=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->link->sink_count);
 
 	if (dp->msm_dp_display.link_ready)
 		return 0;
@@ -411,8 +412,9 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 		pm_runtime_put_sync(&pdev->dev);
 	}
 
-	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "After, type=%d sink_count=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->link->sink_count);
 
 	/* uevent will complete connection part */
 	return 0;
@@ -440,8 +442,9 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 
 	msm_dp_aux_enable_xfers(dp->aux, false);
 
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "Before, type=%d sink_count=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->link->sink_count);
 
 	if (!dp->msm_dp_display.link_ready)
 		return 0;
@@ -465,8 +468,9 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 	/* signal the disconnect event early to ensure proper teardown */
 	msm_dp_display_handle_plugged_change(&dp->msm_dp_display, false);
 
-	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "After, type=%d, sink_count=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->link->sink_count);
 
 	/* uevent will complete disconnection part */
 	pm_runtime_put_sync(&pdev->dev);
@@ -479,8 +483,9 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
 	int rc = 0;
 
 	/* irq_hpd can happen at either connected or disconnected state */
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "Before, type=%d, sink_count=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->link->sink_count);
 
 	/* check for any test request issued by sink */
 	rc = msm_dp_link_process_request(dp->link);
@@ -493,8 +498,9 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
 			rc = msm_dp_display_handle_irq_hpd(dp);
 	}
 
-	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "After, type=%d, sink_count=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->link->sink_count);
 
 	return rc;
 }

-- 
2.47.3

