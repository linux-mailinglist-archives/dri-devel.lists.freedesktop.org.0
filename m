Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJnGA6uTqWlCAQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 15:31:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE25F213760
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 15:31:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA8C610EBEF;
	Thu,  5 Mar 2026 14:31:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ceLZRLgV";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EApreEsL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B4B10EBEF
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 14:31:04 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 625AFmDA4171030
 for <dri-devel@lists.freedesktop.org>; Thu, 5 Mar 2026 14:31:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XHiLCL2Q/VJoKNHmnopqEVjk+hwroQfPTl82ni3pxPw=; b=ceLZRLgVk8jHQ9/M
 hohkNADPvfLT5HyhOkDJjY5LBvmfBSeuirkaFv6Tbc4CvJPP+Nm3oDz72ZploFhz
 D4jgCv7R/q9JVP69bcseYtk8xxWM6+iOkrPPOshkMW4DuranxeRQBIcsJZPXoCgI
 McA1i7uMdphKd0ZEJVJubojxy4sW0BmZQr39/l5hysITHcdqUPX4DweVebmP8NRG
 Ku5LWmow580/bCRsvY7hz1lWMd25m26z6eM4SnDbo2WOiy6Euz663dI3Nhb/fFCc
 8WM7O8ed5FsezrJ7P8CmbqBR7ggR4ZuSIFD4nndIMKRJ2T3Dk+PsuiBqTf3Zxbo4
 p+sLbw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuhb34e2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 14:31:03 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-5fde8914fccso9264654137.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 06:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772721063; x=1773325863;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XHiLCL2Q/VJoKNHmnopqEVjk+hwroQfPTl82ni3pxPw=;
 b=EApreEsLF6ndegWTFHkFxRFewY2sH88WVKkKfqnv3E9jrb0nOWK4PObiKiQDjegvOz
 Hh7WM0vK1pH3dCzSuMOAUnhpyIGf01NSNLqCJGzyB8uwzZyMiWOJuMo1+yVrTqUTIjSk
 Cqhr8n2Qt7Q3Z+SffwlMw9Gy9aE2Thx3YVOfDZf09vw0cwNHriCVG8w8RVXYcOWgITdk
 tl2pis6bhZTtlURfhHv3YQhn58led4mlZnzhOBv+v3g6VtmmvVZsJSDWwtknSiORQld6
 VUZw1xEdsnP1blvowPeW/bp+Gw8fIQoteKHJIvJGOV1SZvULFbWg8NkrTgM8sKFd4huS
 DiwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772721063; x=1773325863;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=XHiLCL2Q/VJoKNHmnopqEVjk+hwroQfPTl82ni3pxPw=;
 b=C3XUUBj0O28azN13QIDJfOz/dgWVUzXGE9ZqaCphTAViDsymJSyp9TwE/BbpQQ+Sou
 lsDCxcI1B/wofRLhecz6E/owTf0dKnUDa4fIligRB3ew454hB/hrX+mrcZDO5Wb5DAyg
 GP61uZi3zzn2Jcs6eZG3cCFp3ebNH9zK45bNqrPpGxOH+mkrhDwUu3HWabKJdpvFP5mi
 m0F19JxGOFMFhTY6yiXEPvDNZPLzGLObSCtjm0uS1Jkpe0U1m7U8cOz3HMQAeZx5cNQx
 K6Y1hDBzcuGaETXRchFz0LNQ7Sj6N70LJGjvxoFnB1cLFt5DuEnRzJX4aoXeBLnJHbHR
 rz8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWODrqsrX7qBRe3lzvNeyQaShmXJb1N15bnJ24qPgke+WFXCHFdUbEMY9CLcvRXPV4r1MlXUIrljYg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySOQzmMQxifasUIU+vL7HWk6KykMGRXCG1iVcRcke7CWxRnCfb
 5QKn0VYk64gK/8zHg2vZ+TAPjRUbjcPakdSh2x0QqGcFeIbgG+G+bssKYZpl3q12rL4NiiqcCZk
 GtZ8RQT5CPsXNGbT+hQ8jNQlO9DNHlRpIyuLAyQXorTLeEM6XQ9b4SJdxMYuE5ssRKC0xTPU=
X-Gm-Gg: ATEYQzzjcQ99Z/DZB1a1VDPRg1A9rtBOMD9Gbbr5jQ4QjgqQrueBStLCLFo+hr1R5Ni
 TMw+lt8v76U+9xIuuBQjPcV3BjFYhWytOKU6SCJgX9yqt8ssMYlhEqmmgtkqxH+A+xJQs50WpiX
 O5HcRGGdGAjfSZjXto1wDj58u5SU+iaLT0/OCbJMx+p/3ioyYvpnb5hX0ppZbEsFM5xQQuNHKaA
 o/nbPzBFqSyN7jbz4JMxVm1XIK+D9oPGxvgkvzQASHEc97XxgtrNBY9ZV9A5si4Ahu6C+LStIEU
 0HXNK1rQQNUKmm+mTnOBNmO4MhPc7JmqUqsMxtTvAqPee8o7hTB2PrsG3KwRxqZGwUQqoXEdQ71
 vHJJgdV9OIFWgYwlNPE7RCRheSGQnwpmru1pg1wQYzUUDm6Y1MBQHOIXNvoFVnYVtzfpMSG+kBP
 uOp0B2iIWxobnrP7Hl6Isf8SOZ/FcMwHZSVCo=
X-Received: by 2002:a05:6102:2913:b0:5ff:cd6e:85f3 with SMTP id
 ada2fe7eead31-5ffcd6e8968mr775542137.33.1772721061200; 
 Thu, 05 Mar 2026 06:31:01 -0800 (PST)
X-Received: by 2002:a05:6102:2913:b0:5ff:cd6e:85f3 with SMTP id
 ada2fe7eead31-5ffcd6e8968mr775509137.33.1772721060212; 
 Thu, 05 Mar 2026 06:31:00 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a126fcf563sm1522618e87.27.2026.03.05.06.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 06:30:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 16:30:48 +0200
Subject: [PATCH v4 6/9] drm/msm/dp: drop event data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-hpd-refactor-v4-6-39c9d1fef321@oss.qualcomm.com>
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
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5908;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=uXjrwf6kVU4yfPAvO2dRImodIsQs6Els2Ljkho09jGo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqZOZPMNKFcGv9m5Q3LD4Nvt36+SPyZqiRmLc3
 KrK2MAgHmSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaamTmQAKCRCLPIo+Aiko
 1Rx7B/kBlcyEkD3uku+ktv4gegHOeY5dLhX2TnHEj2QvBgblCGeJoRfZRtGEa2bKZ5VnX/yzpJY
 SzUfiiffJEGa/UdrYDgzCBUhXp7H66bNhKzIWc4858VqdOK9UPBlZwr9mZoFVbVQbmL3qhRTHGF
 czSgR800dgvtkjmrMmYjzxABc0Yd1yPvrLC6E00bKZh+XemXl8nCXVim6mjB7aX+aVsNDRUgeTP
 CLVzbIqs3IysSyr0QXLeMJtnsDVrbxp17mi67y4WH9E0XQZuE/UYfQy7jnQ+uViJFzNz4YMAjTA
 UNFChVpyRyjlsHO6/oOp3BMBoQx2Y5/mrOJjjLXukasOVlCB
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDExNiBTYWx0ZWRfXzqp+GLwNG1kv
 kT2BLd+D4oJqsAyy56jrJstgqlkeyM1QF76Mw8hhWGlq3e5w7A4XugWjIwGxanuLgOhcDbXGuXD
 2aCZE2mzfMC2odfI1Pf4/7CMDS/ARE9ixuA0c7+bvN8V1o0cUJc/oHPdvPLpLaVxxukBKqIwcnQ
 7hWNCkJgOceSdY56UOzzqfkqUHPMAAHBcSwY+Ao3O2+ubIp92dVr/Jj1D00MRl0ZZSlWWHLrugE
 caEXoHLZUEjMODNwTZSi58Z6ff7mWo732C4aR6c/MgKaQRo2Ila8afnxGeB3foqhHr5AFgC2OLu
 qC8ikvdfrycu7ZIA13cRMbaB2GOAc5N2hdpQCRbqRf2urk2IHB7vNUmSjAK4tlSlQmTM+n5lGDv
 jD83th19S1Vtl7hNMK7vkx5NframJhpn75NJMYC+luIl0MSp1xBoQ9BKywhaBDZKA4x5WJ+pMQJ
 JumHo8WDIQ0hnlAtkpg==
X-Proofpoint-GUID: XEdG60Dc8nK14aAV4AcPoByEk7Sfxm6R
X-Authority-Analysis: v=2.4 cv=SqydKfO0 c=1 sm=1 tr=0 ts=69a993a7 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=zd47t_UtYfsHpvN5YEcA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: XEdG60Dc8nK14aAV4AcPoByEk7Sfxm6R
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
X-Rspamd-Queue-Id: AE25F213760
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
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:quic_khsieh@quicinc.com,m:yongxing.mou@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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

With EV_USER_NOTIFICATION gone event's data is no longer useful. Drop
it, removing also the argument from event handlers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 39 +++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 05c292e27126..bc4078c229cb 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -69,7 +69,6 @@ enum {
 
 struct msm_dp_event {
 	u32 event_id;
-	u32 data;
 	u32 delay;
 };
 
@@ -218,7 +217,7 @@ static struct msm_dp_display_private *dev_get_dp_display_private(struct device *
 }
 
 static int msm_dp_add_event(struct msm_dp_display_private *msm_dp_priv, u32 event,
-						u32 data, u32 delay)
+			    u32 delay)
 {
 	unsigned long flag;
 	struct msm_dp_event *todo;
@@ -236,7 +235,6 @@ static int msm_dp_add_event(struct msm_dp_display_private *msm_dp_priv, u32 even
 	todo = &msm_dp_priv->event_list[msm_dp_priv->event_pndx++];
 	msm_dp_priv->event_pndx %= DP_EVENT_Q_MAX;
 	todo->event_id = event;
-	todo->data = data;
 	todo->delay = delay;
 	wake_up(&msm_dp_priv->event_q);
 	spin_unlock_irqrestore(&msm_dp_priv->event_lock, flag);
@@ -576,7 +574,7 @@ static int msm_dp_display_usbpd_attention_cb(struct device *dev)
 	return rc;
 }
 
-static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
+static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 {
 	u32 state;
 	int ret;
@@ -602,7 +600,7 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 
 	if (state == ST_DISCONNECT_PENDING) {
 		/* wait until ST_DISCONNECTED */
-		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 1); /* delay = 1 */
+		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 1);
 		mutex_unlock(&dp->event_mutex);
 		return 0;
 	}
@@ -644,7 +642,7 @@ static void msm_dp_display_handle_plugged_change(struct msm_dp *msm_dp_display,
 							plugged);
 }
 
-static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
+static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 {
 	u32 state;
 	struct platform_device *pdev = dp->msm_dp_display.pdev;
@@ -706,7 +704,7 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 	return 0;
 }
 
-static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
+static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
 {
 	u32 state;
 
@@ -724,7 +722,7 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
 
 	if (state == ST_MAINLINK_READY || state == ST_DISCONNECT_PENDING) {
 		/* wait until ST_CONNECTED */
-		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 1); /* delay = 1 */
+		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 1);
 		mutex_unlock(&dp->event_mutex);
 		return 0;
 	}
@@ -1079,7 +1077,6 @@ static int hpd_event_thread(void *data)
 			todo_next = &msm_dp_priv->event_list[msm_dp_priv->event_pndx++];
 			msm_dp_priv->event_pndx %= DP_EVENT_Q_MAX;
 			todo_next->event_id = todo->event_id;
-			todo_next->data = todo->data;
 			todo_next->delay = todo->delay - 1;
 
 			/* clean up older event */
@@ -1105,13 +1102,13 @@ static int hpd_event_thread(void *data)
 
 		switch (todo->event_id) {
 		case EV_HPD_PLUG_INT:
-			msm_dp_hpd_plug_handle(msm_dp_priv, todo->data);
+			msm_dp_hpd_plug_handle(msm_dp_priv);
 			break;
 		case EV_HPD_UNPLUG_INT:
-			msm_dp_hpd_unplug_handle(msm_dp_priv, todo->data);
+			msm_dp_hpd_unplug_handle(msm_dp_priv);
 			break;
 		case EV_IRQ_HPD_INT:
-			msm_dp_irq_hpd_handle(msm_dp_priv, todo->data);
+			msm_dp_irq_hpd_handle(msm_dp_priv);
 			break;
 		default:
 			break;
@@ -1212,19 +1209,19 @@ static irqreturn_t msm_dp_display_irq_handler(int irq, void *dev_id)
 			dp->msm_dp_display.connector_type, hpd_isr_status);
 		/* hpd related interrupts */
 		if (hpd_isr_status & DP_DP_HPD_PLUG_INT_MASK)
-			msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
+			msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0);
 
 		if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
-			msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 0);
+			msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0);
 		}
 
 		if (hpd_isr_status & DP_DP_HPD_REPLUG_INT_MASK) {
-			msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
-			msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 3);
+			msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0);
+			msm_dp_add_event(dp, EV_HPD_PLUG_INT, 3);
 		}
 
 		if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
-			msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+			msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0);
 
 		ret = IRQ_HANDLED;
 	}
@@ -1649,7 +1646,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	}
 
 	if (dp->is_edp)
-		msm_dp_hpd_plug_handle(msm_dp_display, 0);
+		msm_dp_hpd_plug_handle(msm_dp_display);
 
 	mutex_lock(&msm_dp_display->event_mutex);
 	if (pm_runtime_resume_and_get(&dp->pdev->dev)) {
@@ -1721,7 +1718,7 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
 	if (dp->is_edp)
-		msm_dp_hpd_unplug_handle(msm_dp_display, 0);
+		msm_dp_hpd_unplug_handle(msm_dp_display);
 
 	mutex_lock(&msm_dp_display->event_mutex);
 
@@ -1843,7 +1840,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		return;
 
 	if (!msm_dp_display->link_ready && status == connector_status_connected)
-		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
+		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0);
 	else if (msm_dp_display->link_ready && status == connector_status_disconnected)
-		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0);
 }

-- 
2.47.3

