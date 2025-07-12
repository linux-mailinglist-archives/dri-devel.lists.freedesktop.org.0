Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88126B0288D
	for <lists+dri-devel@lfdr.de>; Sat, 12 Jul 2025 02:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 990AA10EB02;
	Sat, 12 Jul 2025 00:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mK9dcDmu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0279610E16D
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:42 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BN32C2022589
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FtDMkE/nYvcymb9V2MvjT6eL01NcAA2GyDnTtlSRCMc=; b=mK9dcDmu/p4ImfHO
 j8vjU+nuAxRlrek/XbbCsHHIB3y61NLTmrvLRPnmWhwYJ54XNozT3d831EvNG04Z
 q0cXIQjTYyffeEAvretA62opuwVgGo44UV3kGvBJYKlxnhF9PSAawiXtPyx6B0Zp
 CivnL3qqMv+BaDIRzUbFWNmp2GunpYvxgTBiudpkKdW5s8jmAFE9wPiRTokDxB2Z
 ifGLzpHzPnQs8t7BKNTMpYapF5Qn+IPsKf4hXfZks1eGqX5PZSuvSM5G9PbXRg+C
 vrA78rMUIzwfEYzo9ZA+WL9B1a+CdppL5rd/hR2v2mNdbdzKyGDz+6IXgLwuBqIh
 t5qKTQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b1b8s6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-312df02acf5so3057451a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 17:58:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752281921; x=1752886721;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FtDMkE/nYvcymb9V2MvjT6eL01NcAA2GyDnTtlSRCMc=;
 b=J84vsEogsT7LtaehQTDvG6AfuG5CXQfprOVx8uAdaJ3bwGQ7gy0MQM/W8HmGuGKnFR
 LOjkjczXd5zHHPWms079rGfPWLpAcGGkegrD+v1Bae080JlUZsG4Qe1JmHAgCcLgYRt5
 nG7pPO99K2yL5Bmnr+nbCee3YLpo2Bt8RPGnEMQZltrmS/+W1QKs2sX3un436YZyIH5i
 61sY584pQ6WXsEmliFmVug7nhZyET7glZl2DcN12LhvTZeh07l9nnoIleM8ynI1nxPdO
 KxXDgjQYzaZt4siLkACDA0CCpmD4fp1t7Wg+e55C8Xl3FfA/XLyhuqlnMxDG6G+TJn4L
 gypA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVB6P6YlJ+GrQuPlJvyEBaaZYoRVQMpmK9EkSLafFFEemmkD/kvXFEIg8CNorKeNOexXGBxQY8kViw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYhnAqdXvOATXZsI/LL8GkgjFuF0qPqrumM3Y0jfCwtThzfrJi
 XJKqNcDGHWpqVBM/fpxb0MqsoRVlkI9IkuR0iKse9jETy+MZleDeJ9tT9OPUNujmkbDWmIuSm2Q
 Ip06SYVwQoQRt6J/whnR4hlIdl24uSwsh/xrvKYv7P02IyEV3SqX9iiNW69um6EddCeIKMAQ=
X-Gm-Gg: ASbGncvUPxDQhgb0zzFO009losSB9H//bl0fDemkyANoCFet9KulHLrs8kkdndPxoym
 SSaSWiK8UvwhF6NDtwhDP+ywgSOCUpGrNZ8+qTJJ9J715GYd1qGc14D94/zeN8MWZWMWnCS6OP8
 PyeTgny4aa9A9YYQ6+4cCtkHHV6tZrOeAKLV1aXRq3VgciVhuWsdVDNykDwq3ryap5v7vtAxeVG
 X0m0/NGzzZDiy/w46hXRQMuN6FHrQB4GfcjaBRj4yv2MWaKyRqVMhxfLr/dwg/JFSWn1IGA/zVZ
 voXlpsgaDtUk0peNVw8nohpNMiBPH8fDwYdUG8nQUWl4+N7ZKHk5X0b/zAXJ5kdCF0dFxz39Rcr
 fy2ZEyHkm1LIlHybdNR79YYvk
X-Received: by 2002:a17:90a:e7d0:b0:312:dbcd:b94f with SMTP id
 98e67ed59e1d1-31c4d4cf62dmr6563732a91.11.1752281921311; 
 Fri, 11 Jul 2025 17:58:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkmyvyut/CURZ5YzbZaUOdCU1WWcrvWnhSu6oPk2z13iP/0OOjcK8+xnbnEI46xI8fV/XCXQ==
X-Received: by 2002:a17:90a:e7d0:b0:312:dbcd:b94f with SMTP id
 98e67ed59e1d1-31c4d4cf62dmr6563680a91.11.1752281920613; 
 Fri, 11 Jul 2025 17:58:40 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 17:58:39 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:14 -0700
Subject: [PATCH 09/19] drm/msm/dp: Replace ST_DISPLAY_OFF with power_on in
 atomic_enable()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-9-33cbac823f34@oss.qualcomm.com>
References: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
In-Reply-To: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=1734;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=czxDsq22LT+pLoYLzhxwBsQa28JP07lsZiCICURAXyo=;
 b=XhpMkCEr08Yom6OH/qj4yFXw2PuaeopNT+hn2CIYsc/UvIaRDghEcO05XoTOrr/0rliS3F66p
 QxV+5b5f5q+BLyFCJzJrnez36qE+LlI4Akf6ai4ujGbBP5Cx23+BH7W
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=6871b342 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=c02wphsZB3Yn0AVd1wgA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNSBTYWx0ZWRfX5EOpaGu39m5v
 FBxcN+Nb5urRGH9Y2QVYZdEYF77DHpd0ol9tZoWVaiaftsG+xbL+1Q9TvoZd9jlxYkna7O4gl5F
 Uq2K0yrr1tonudAYPe9oyIqTLi1+074yJ4CWbxY1XNW7UmERpf4P9eaq1/yZ2+3JtTdEb2gKjiu
 fJQLpHfi6/BcQ80VE7pyR8Pkar5nHah4ir3LX0WhgJODYZM+i+NX6apdQUK8RDjK2Wu0t58S/pF
 Y8PDBl6eaSEn5rJawQdjm7a6UvpwODw+etN6d9c/7gshDyYbBy31236kVllYzbYufWFlw5BtwWc
 oTIALExi5lDhSYfgDfJnGi78hQvnc6IfF492afkHi/pka3IVOao7QAKXNZzrkpSvdTee3ExqBLe
 J3+wpxFtZ90toZ5VeNfzG6lpIcFQ8U2y2e2ebSugrD+m7TnvHKaM/nsGJDyiFKQ86Ah7gmtw
X-Proofpoint-GUID: 5d6Y1xJ4hkmRFjnwm4pcDgbtzczH7t9K
X-Proofpoint-ORIG-GUID: 5d6Y1xJ4hkmRFjnwm4pcDgbtzczH7t9K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507120005
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

ST_DISPLAY_OFF check in msm_dp_bridge_atomic_enable() is used to check
that if the display was disabled while still hotplugged, phy needs
to be re-initialized.

This can be replaced with a different check as it just means the DP cable
is connected but without display being powered on. Replace the
ST_DISPLAY_OFF check with a combination of connected and
power_on checks.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 98f5274f123e..6535c1cccf84 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1564,7 +1564,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
 	int rc = 0;
 	struct msm_dp_display_private *msm_dp_display;
-	u32 hpd_state;
 	bool force_link_train = false;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
@@ -1585,7 +1584,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		return;
 	}
 
-	hpd_state = msm_dp_display->hpd_state;
 	if (!dp->connected) {
 		mutex_unlock(&msm_dp_display->event_mutex);
 		return;
@@ -1598,9 +1596,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		return;
 	}
 
-	hpd_state =  msm_dp_display->hpd_state;
-
-	if (hpd_state == ST_DISPLAY_OFF) {
+	if (dp->connected && !dp->power_on) {
 		msm_dp_display_host_phy_init(msm_dp_display);
 		force_link_train = true;
 	}

-- 
2.50.1

