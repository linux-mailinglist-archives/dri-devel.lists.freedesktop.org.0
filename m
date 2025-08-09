Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DCBB1F193
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 02:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD3D110E99E;
	Sat,  9 Aug 2025 00:35:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LV0hx5sa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B228010E204
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 00:35:50 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578F8Vj1020568
 for <dri-devel@lists.freedesktop.org>; Sat, 9 Aug 2025 00:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PiZ22avjMQ6yPSDZ6+PmnqKblqG/QInLtG55ppMw6bc=; b=LV0hx5sa7UOFHmvt
 K4N5be3m9douJyU9YeYoEbgSBnU50CLRN5ntDb/xiGsPfn8yJUGFBGERALz3hXDu
 IGN2WkM5Xum8J11P/Nrs/3PSjpOjNA2BSBi3RXmYsVqeM9p/CWd4gcoOGLAjTrF2
 2gFoRFtMx3nq1w+dzF7KRKwjhnzcwnViqADzwglvcdViQTZrko6SZvCcMIJVoIfU
 6FS/hbVwxSKUWuQlmlmbl79+IrcDP0vHoEpzVtr4hN3uvtFB5uE7XJ5mH6KwOoyY
 xw79v6+7V9wPXwP98nkt4cGc2e+lPJmhTNMJaEgJ4y/qTme13nhG8rkcznFptBGI
 ObMVHg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy8kjhj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 00:35:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2400b28296fso41905245ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Aug 2025 17:35:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754699749; x=1755304549;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PiZ22avjMQ6yPSDZ6+PmnqKblqG/QInLtG55ppMw6bc=;
 b=KHKjosN4rgYyGOkrxeh2kAZnHeW9hyxHBG0bPkQOnXtJT1a+ysNoM5fbULBcWTZ45d
 dgPoGnxD/qIUnoKrWSNed+QsMlnNlGls1vo+w7AMfTdfXP1XnAJW1FaaqjAfuJa0vF1d
 LqBdz03moUyuCFXwUO0i1H9Xq/7R/ODV2eFE7rsa9a7WkZ4RuvkNVtAd/OGSW5xQsr2E
 1LbGBOxEEr68UfApMvrboGZa3ZQKI6hOXSnxFVMCx3EzZfMOzQds1l32RgTklTI2CEs2
 IdL3roQNeWEH26LC1IyY2M7MhPB3BOvH1UaPZljRHzfz7ozX9sTsgez+RfMvn2F8rDFT
 vKzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzNaemqw1RFVPPAwFWqFOLXMvVGgol5wemf2anpFBpJ9nj/xs6ccxnttm4r6B0qKfQWKKhQY2B+hw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvgsZ6T120EP/COw/ShpZhlBaDW6q1njs+bXG66AVSdyWia7S5
 BqbXTiddjEYhNObkvevlaWNNtC6VUShFWBa5ktpaIfBLcPSgDOqIjd/S/LQent0gD3J8DjOCiwQ
 5L2qZ/qwRnf/PZ0zi+CfS39htSsQy5QE1vDX3BnTgH/ybDSf9qKjLJwU06WNAAmia5wlWL/0=
X-Gm-Gg: ASbGncvO0fFepX65KO8OwpAwL5TXN9xajqu9HMJ1msKIikhtB8xjTkr471MQPZck/Fi
 S3QkoSKmS/zYAW0doCJt9XgjVjpkbC3AmsP7KO7MT+HHt43mPzLnlCUdLUAotIpn2+76HV+00hi
 PWNxBj4dxoxM/+LgcOeLwmKSTX9+VZ3G3I9AOLU0FN3M+RTWSqP7maHy/wP4ZAcHREzZcyH6zJt
 pwP5YV7yUBV7ZHqM+ZE+9Em3+2fHCnCBcevdDMAFtE2TtldGFY9i65z+bQxoj/1k4JJ0e3Y+CEZ
 bcsurXfTZudSksdPEO1ePvjlQt7CvuV41iw6Pcgri+2X3uvnLE259UE7fbI3xTiCUysadPe7NlL
 7WFu3fjZdjd9p5uqZsm3uXLWb
X-Received: by 2002:a17:902:cec8:b0:242:9bbc:6018 with SMTP id
 d9443c01a7336-242c2277f70mr67504875ad.56.1754699749337; 
 Fri, 08 Aug 2025 17:35:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRcmkdoPKn0Y/gtVgwKawEtn3XJx+wDXdjs6KbTeVW7Zyo7yLwrrGGpLbIydsVcXp/EeUE5w==
X-Received: by 2002:a17:902:cec8:b0:242:9bbc:6018 with SMTP id
 d9443c01a7336-242c2277f70mr67504525ad.56.1754699748876; 
 Fri, 08 Aug 2025 17:35:48 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef678dsm219865355ad.39.2025.08.08.17.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 17:35:48 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 08 Aug 2025 17:35:22 -0700
Subject: [PATCH v2 10/12] drm/msm/dp: Return early from atomic_enable() if
 cable is not connected
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-hpd-refactor-v2-10-7f4e1e741aa3@oss.qualcomm.com>
References: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
In-Reply-To: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754699734; l=1258;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=4NtupbLbHXZJKW3LGWuziF6T3O+S2Clq0/ZFSk/f48A=;
 b=pzZTjzYITZ80tgTHFP+3PXCECEW+ccVzZNuZooIm+CrqIvDUL9LgrFJnwSPGcSTtpuU2/mngE
 3yJTVSVx8BHCAAqhjaPQm2i2nj4ByCXG0skte9RwSkKuNRukmpO0gIp
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-GUID: enRwBP_k0oio-onYvtFp8GH9FHgMW35K
X-Proofpoint-ORIG-GUID: enRwBP_k0oio-onYvtFp8GH9FHgMW35K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX9yHeYYFvmHwp
 Yy1+d54B9RXH4WxG4BjJzw4Ma9QhJCf9vsERzKdPPsJeawEdpYwoCJS11XicA+trBkeLkD8wl7g
 EUe8wgqKwc+O1OyRp3phZajKAChYMEtH7u3NCpWtCJ+RUmvbWge68xKOwFRI8f+TKFSIpfKV/NX
 /4lpYSb4MJiXdzwC24ewr5+/DtB8IEaH8Hk2vwGwC7ejpbzowqSmBEnQ8xMO13rt0ZXPTU8ToN7
 PzqfkEmZLpyWtRywx7BS1cId7UowNn+C6pSb54sOYuNWsrKGwAhml9vw2P0sWC8paQj9WpvSc7b
 YuGFtW5RTJ5AryibCYPCflHJ++OAhjLFzD1kB80lAhaoPEiCsUHfANtN7yAavVAKpuFImZsN2G8
 LJiABsyX
X-Authority-Analysis: v=2.4 cv=GrlC+l1C c=1 sm=1 tr=0 ts=689697e6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=C9iwNz8zScVtocZF6eoA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_08,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009
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

Replace the ST_MAINLINK_READY check here with a check for sink count.

Since atomic_check() fails if the link isn't ready, we technically don't
need a check against ST_MAINLINK_READY. The hpd_state should also never
really hit ST_DISPLAY_OFF since atomic_enable() shouldn't be called
twice in a row without an atomic_disable() in between.

That being said, it is possible for the cable to be disconnected after
atomic_check() but before atomic_enable(). So let's change this check to
guard against sink_count instead.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index dd3fdeaacc91..82f0b6bdbf39 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1444,7 +1444,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	}
 
 	hpd_state = msm_dp_display->hpd_state;
-	if (hpd_state != ST_DISPLAY_OFF && hpd_state != ST_MAINLINK_READY)
+	if (msm_dp_display->link->sink_count == 0)
 		return;
 
 	rc = msm_dp_display_set_mode(dp, &msm_dp_display->msm_dp_mode);

-- 
2.50.1

