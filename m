Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA766B0287B
	for <lists+dri-devel@lfdr.de>; Sat, 12 Jul 2025 02:58:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D385010E3D7;
	Sat, 12 Jul 2025 00:58:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="P+9h6yKf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 233AE10E3D9
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:33 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BN32Bw022589
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5mAPtKDSfIXrr3Q2q4T60fVOj5r9JaUUy2rjzWEDKfE=; b=P+9h6yKf/+JnoHlp
 SeY/HCdrAxxKpGLQjBnlR/RLS5NAtE5+kJ2y/7JdFzZpukzlzip6ILmczpwcYLBY
 suQLGyP5qIp9aWYhn25yI3tf4afl9Dg91qim/ubJmCIlXKF4fliiYWcm5OphpL4D
 B6FVkMGPcDTveXG7Z/llJvkZ+u41qKFwWiGrEeYwi0MInTn1IKXfQWRc+f8RVVig
 AufKV72pW7RgZYO2uSnbnjyjA8zLHldwk6lTlv+3cgM59+LQxTzREAL6oQKWYwS/
 Pde7TQrN3p9z9NFMD70ip/9Dl9252QFD696tJfwh+O16D2XtkH6jOIlidjrpdjzj
 uyDXdw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b1b8r6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:32 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-315b60c19d4so2223274a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 17:58:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752281912; x=1752886712;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5mAPtKDSfIXrr3Q2q4T60fVOj5r9JaUUy2rjzWEDKfE=;
 b=B2LeFOgz8TWcHa01kqHAJTKdMVhySw/wn15rlugHe2Zurrzo0ws4+MjlkzMrJuE3Fn
 MCW4nnSXbQJKxR7e60eXjnonI1+Ljos8HnMI5pbSfPX3eu+ghe8aSJ84W6FnSCNwznNZ
 IPjzHkxiEe351zXyKBEj2kg2IGpYLRxRKLZ3z8Znsf4dmKqcpy0xpaOFqTAGaITyxVqZ
 4euABxZ5lmNQPnJl9R/wy8kY7IOBAyqq/4q+vnyteV2pP4kEyWRXmkmeokUDCbjVo6oP
 nEcRjE+rIvPFlCh1oh0KBRx7UuOK/gqZw0jte5I6cYPYWJNillw1NV2ngwAjXA5NFjds
 Paug==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8ttotsv/Wzib57UZ55Rl4Mpskg93DzqE/2sz1EG5DZ81NdCtBhiANtiUXRaZnJP+mGSLV+b3IpSI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymA09mS8gq9c50QqqZQAoBFdAKbN+LKt2tbalPoVx5lyvSc4ve
 fkAl/y88QmDtsDFFx6j1wr2z7XYMg690ws2TujemPM9wQSdkC1ZYsDVSvcUBBSX03oDi2ieRR6E
 D71Syg/+YqFJ0e7Ht+HdSxwrsw7TqqPdUlx1L3xG1y6VDP00E/5AElCyDBOpOLFms6RIumRs=
X-Gm-Gg: ASbGncv/gqIwjDPyTdCGhI0krSlKstGKe9WwWeFXWFdP8dAJ/qYUjnKDYoJYW82dqF1
 /TmlX9XlfMTP3ezYwYqJJWhTzGE+umXiwwJSKnV8FpdSI7uJo2sdz8Hh7klRvCfqhsd506ab+vM
 32YKFtxD5dLRDbLXbtzVYBXAO1IZYu/7rwoVftMT7yMk70u6S3Z5BEOumsQaWaT+3/pwa3mBbCp
 4hCbJD1MJLhgR8BmQ9g/SPD7sk8qv90i8x8n6VTT7WH6ls0vbqiIYSuXUEyRQ/5dzSK3u9Ept0a
 cBiH7S/n8gYff5g1e6AaNw2f+xA6Jg64BXlQPHrEajSD4zNZQCyJXlD2vEk0vbcgcFMKqjKpNo5
 TYT9PSdLddOSvaJOV8XOjzE5h
X-Received: by 2002:a17:90b:5404:b0:313:5d2f:54f8 with SMTP id
 98e67ed59e1d1-31c4cd148b2mr7794406a91.33.1752281911657; 
 Fri, 11 Jul 2025 17:58:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEq4f4FD1KyBoQ3RY2kpDLTIO0B98CWBMG6U/eFOvveZwt51uaf+y550/LpdWY6uMhEFIxlSw==
X-Received: by 2002:a17:90b:5404:b0:313:5d2f:54f8 with SMTP id
 98e67ed59e1d1-31c4cd148b2mr7794374a91.33.1752281911279; 
 Fri, 11 Jul 2025 17:58:31 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 17:58:30 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:08 -0700
Subject: [PATCH 03/19] drm/msm/dp: Return early from atomic_enable() if
 cable is not connected
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-3-33cbac823f34@oss.qualcomm.com>
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
 Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=1248;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=yTgqnB2dprf/Nj1ZzdiqTo9frUxLDJhIMuoIkqdGswI=;
 b=yjOQEw8i14tfTRd06tsg94/QUzhqjZkPogQvCBkFcs9cMN7ePscuKKGEamrhgXNfxOaO1Hkxl
 z+N10idpSCiD1fACySqT60gko49fsibuORGnQlrCHdURey5hsdsSXbA
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=6871b338 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ONubTFmf6e6OPp213KoA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNSBTYWx0ZWRfX+B4QHfL51PTd
 qRFQcYBn8oIKRNi2kcgMfD9Ec5bXqH8NCVfPYNGVI+AGd1GaEB3ztfxwzZsI4Jgj+l0VJBWcIu/
 b0d9QBNiZqICRLIodqHUlESN8rzdXym21e2VNfXYDP66k0+uJFDwRJ3/aLrDE8mIOE2MqfwW2Wr
 Xj0jKxEWcwDwvao8kwjli7yT7EJQFXmJSZ3T2XNvmA1/PlQTCSofl+lpUGtShInG1iri6Fam52t
 R/gac7dOKmodR1S4YNefBHGMzkJi9ISuaTQDuifrFB3pa6Q4ZN2RzZ9HjVHxeTpPh0oi27chBZs
 2AzN0C7xPqRueHygy1kUwdgWboLqi5kYQMUW0Rlr3vNo/t+QtYDTvBYcyn1UEEgxHBGst1y4yRn
 ZlxQ/SrnMBSARG5yWpwYQ3Du281IZec82sNRWTU6yCl5ePU+86pO7+K4lx1hGvj8QFlOn/DS
X-Proofpoint-GUID: _4IJ7gIexJaidHcUWrgzRJNTMRK91Efn
X-Proofpoint-ORIG-GUID: _4IJ7gIexJaidHcUWrgzRJNTMRK91Efn
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

Replace the ST_MAINLINK_READY check here with a check for if the cable
is not connected.

Since atomic_check() fails if the link isn't ready, we technically don't
need a check against ST_MAINLINK_READY. The hpd_state should also never
really hit ST_DISPLAY_OFF since atomic_enable() shouldn't be called
twice in a row without an atomic_enable() in between.

That being said, it is possible for the cable to be disconnected after
atomic_check() but before atomic_enable(). So let's change this check to
guard against msm_dp::connected instead.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 1072b5fc00ae..fe38ea868eda 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1606,7 +1606,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	}
 
 	hpd_state = msm_dp_display->hpd_state;
-	if (hpd_state != ST_DISPLAY_OFF && hpd_state != ST_MAINLINK_READY) {
+	if (!dp->connected) {
 		mutex_unlock(&msm_dp_display->event_mutex);
 		return;
 	}

-- 
2.50.1

