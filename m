Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPb0AaiTqWlCAQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 15:31:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7714213744
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 15:31:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0235910EC33;
	Thu,  5 Mar 2026 14:31:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bvJd+QZV";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eVs7ezsE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 357B810EC2C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 14:30:59 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 625AGMrG2119366
 for <dri-devel@lists.freedesktop.org>; Thu, 5 Mar 2026 14:30:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gM1FM0OVfdRIp4jLyHcwDI8KJBwQikDnEiW6JeMAtS4=; b=bvJd+QZVd1cuXnBe
 d1Iu4H0BCI2RvIQ9+FkYoE1LMp3W7g5Uc6RN07q/YdOmW1zHapFWPIWyeWiFKAav
 YKH24h5m0nbgSt8D74Xju/mrNkgbx2PV26C/BNweWP0lsDNrG33K7h7XW1jU9VtR
 ew+d7k8hen45yRRSpoaDEZEXf0S9Q67KHumSzIg3f4YYC50wNAO5bLBlSc8Dn30+
 Kz/97wUNFKI7vThte+/E6Q2jg4qNXVGeogaG+SZqwXWDg/1m3iilIKYb64Lif0G/
 pA/RQEexF2cAUbDw1dY8n4GUS4DBcdTo1srCJ+CSPFRv3E/dvZwg0tRzDTichBoB
 EgXcFQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0m3nxd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 14:30:58 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id
 71dfb90a1353d-56a844fc7deso9300730e0c.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 06:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772721058; x=1773325858;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gM1FM0OVfdRIp4jLyHcwDI8KJBwQikDnEiW6JeMAtS4=;
 b=eVs7ezsEowX3YdxKC4eSLkv4aaqYWqZRGYw4t5QJjHC6E86slvoMoimfbDp6AlTIaV
 FOecgFaeqCCOgwUEQ61con74Sl/4OVkEIYLprBB7Zo/N7DW8zbuPlX/C0KhbuTutXR8N
 61L/EGJQcpHGUkBT6tbj9OtnLZRHtD/vXFv6zeFEYXvkBitzNlJYgDMt+OxEEM8dHj6N
 72zyYTrD920BesvxrwFN6TqiE+8w6tjCVTAcQXP7IvO0iHTEzI7CpbqqCya/fV3V5EzD
 sCKMedrAM4LrgyEiPpPeHGSZ+Z16HIrSd05cQpUPJSinzEtKa2GV6e+1DuuCez/hCLE+
 ZCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772721058; x=1773325858;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=gM1FM0OVfdRIp4jLyHcwDI8KJBwQikDnEiW6JeMAtS4=;
 b=XowkxiRCXJhhzEMXWra+eKW1juEnbraWoqFo+xeGdp99g+ldGhyHZ7duwQQWFLRw5J
 e59MnbKmcW2CA5AQ4VJt9V88/MUwjlMjboAy0cnHVwJIjUm38llieVEfpfWWXI9SpEYT
 BNFTGTqVdja64dFydm4fNsQgpsRsDT/bTNNqgmaEC3lZ4ulzTXcs25dAyXlf+77XBkTm
 mDDP2VqomQX0j3232hWOwBTKSpu3Y2gGB7CWBhwOeybJeu2vl6BMMdTVD2UTWQxlWrPv
 qdjQyTOuyqwo/nMh4cjZB9SpdrAip/nZ71D0oe8OpIEwyEk+O7GTepL9TAu9tfx6KeAT
 MOXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3rmm72lF8QeB8WsA5q8I8f99GMd5bPPSTzANSKR2SPVkxvkW+j3Ze7SS6ONk5CxDSn39Hw19bkIg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQx6q8as/CdSzpVWEvp563KRTDzvxbqDn+vglNLimz1Xv5o6gf
 zFZKI8BFPNB4UCVPWr4dXVaG+Q4+If/Ufkj06M9I5i2rJ3McBGyCKSbpyObmQrgXEskuUuy1kzp
 oN9nijOQs6uYZqfobX13ME9rjFP9/8I/IKORlA0InbFBb3gcJ/zZ/GLBHIhgNbdsP2ii+5VU=
X-Gm-Gg: ATEYQzx2RZy/FVEyEHixockc1ZwH7V+KtNTlZsswwIYqW4E9G/qNxPx3h7PACYboYUf
 7S6MPzWSB2B1mY3qa8y6C89+Zuds87Q2vMlRD6wSfvXhw/Ql0pjV5AXLLrw0k+g8Xc5sHqIM9BJ
 Yl6Hkd/mw49iWU7mXFBrq5V2nDwxTzudPXqTBnBC1oj07r5yPg4wuNqfWC4piLe2xeLezYD7SXN
 33tmAlLKw+d559VFlQsGd+l4pz29/QkXjGR9bQ7aRRinrumaAihUfJArtU2t+E5zxwpWnKfHuak
 LAg0j/ckQIyTJdoABdEosiqeWjV+ZqLKl/w4PZvrjfJp7R7iBKcKycuirsp9UryXBTh6zdoGi32
 69uoUAuK8tQlyG0HCsEy9Q/lvCAhohjIdYg8WJlg/BXhLBLxIyF5WKH4PqycBHxhAgjFz9MCH4Q
 olQkRTfPjfQxQXtFLdae5TGbuXBDVGW2hmlRY=
X-Received: by 2002:a05:6122:3b11:b0:559:67df:5889 with SMTP id
 71dfb90a1353d-56ae7603caamr2234056e0c.6.1772721057662; 
 Thu, 05 Mar 2026 06:30:57 -0800 (PST)
X-Received: by 2002:a05:6122:3b11:b0:559:67df:5889 with SMTP id
 71dfb90a1353d-56ae7603caamr2234012e0c.6.1772721057127; 
 Thu, 05 Mar 2026 06:30:57 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a126fcf563sm1522618e87.27.2026.03.05.06.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 06:30:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 16:30:46 +0200
Subject: [PATCH v4 4/9] drm/msm/dp: Move link training to atomic_enable()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-hpd-refactor-v4-4-39c9d1fef321@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1716;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=JI7bZYAZgZZoG3QbCYkVN62ORKAZ93CC/pbTrYikaXc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqZOYJcHCddaM4Ycs5ue+0qxkZQCBHCEMF1NlK
 SScGLBEaXeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaamTmAAKCRCLPIo+Aiko
 1QzyB/9fUSrBJ7tXabZzoPSyhUByYGbsn2dwnTzGpCkrAjntqwc/Mvda3/QcMsW+TyTExxAMs2M
 uJn3K30cHJ3NJjol+mvY7nv8c/FVBw+JaAhKVwwyVripMBXYbheLqRTwnliIo00Oxn0Lw0kXZxe
 2Gcb2i4YIg0IUhgubc3D4xY1EAS8M1wYZuCFDNuIdykwpshp8qAkQ6GGUD6Vrtdm4tmLA4CM7M/
 eY7KoHPqppMk6+nsWgXJ2P61V2eInZvVGs1gPd1Yuh/BbFLf7zmCw3qluHzYcWR0EXJQvpS8VeK
 hi4FHW4s/frRPcAQmJYOucfohIoY5zf9dG1PzU1M8RcZTCKm
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=e6wLiKp/ c=1 sm=1 tr=0 ts=69a993a2 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=IoBVowuyLm_M3JZO-XQA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: Wh1oKM_gcNQkuN-94aJkG9KnE5WLKiFp
X-Proofpoint-GUID: Wh1oKM_gcNQkuN-94aJkG9KnE5WLKiFp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDExNiBTYWx0ZWRfX/htvthNxL1Cv
 2typj9xpnQoNC1WGfsnbrltSvC1Xzzm4ztWKUQRnNR6YsadKCatvKkPodbLf7OWYBmYWrh2GESJ
 NsYC/d0I8k5u6fj9MDm8rWIqbnfSyuBEFqsXigKWyE8vAZ/Vb4WX2WWjKlIOWu/FPQ1Drjl1wFC
 /l9UJxIW2B2Vxo104MS5yoQT5aymLLlpwF6uURVTZRHv82a4wPJjrqhpbC8XC2DOIrw1rHJBQbY
 XguBv3lMlxGKZCLf19dgW5MXdVcSk3WcWsabm3P5ZoGA5rHa555SG6bJHwx/BM2+kPLj4hG6DbS
 V7TN06RO+LCaUnViCY2r8HMUt78yZ9HHJI1bHLMGAcXxEnB9mhJP9/GwEE5vNV3rLzTkOyaI2RZ
 l7bh5g6/c9uazsn3txdD2MDHFj0nAv+o/a0xYkgtXALn1bA4v0B51vbgE91QB6tCd/7chU/lYAk
 GcTrlISm0Lh18jJWpyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
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
X-Rspamd-Queue-Id: A7714213744
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

Currently, the DP link training is being done during HPD. Move
link training to atomic_enable() in accordance with the atomic_enable()
documentation.

Link disabling is already done in atomic_post_disable() (as part of the
dp_ctrl_off_link_stream() helper).

Finally, call the plug/unplug handlers directly in hpd_notify() instead
of queueing them in the event thread so that they aren't preempted by
other events.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index a05144de3b93..e7b1ed5491c4 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -436,11 +436,6 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
 
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
-	rc = msm_dp_ctrl_on_link(dp->ctrl);
-	if (rc) {
-		DRM_ERROR("failed to complete DP link training\n");
-		goto end;
-	}
 
 	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
 
@@ -1695,6 +1690,11 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		force_link_train = true;
 	}
 
+	rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
+	if (rc)
+		DRM_ERROR("Failed link training (rc=%d)\n", rc);
+	// TODO: schedule drm_connector_set_link_status_property()
+
 	msm_dp_display_enable(msm_dp_display, force_link_train);
 
 	rc = msm_dp_display_post_enable(dp);

-- 
2.47.3

