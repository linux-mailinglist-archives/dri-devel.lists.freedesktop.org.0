Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA36B02879
	for <lists+dri-devel@lfdr.de>; Sat, 12 Jul 2025 02:58:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF46A892FD;
	Sat, 12 Jul 2025 00:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MESh5Zmo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1CB610E16D
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:29 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56C0hS9q021865
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=59/HKHw0IVO/0EYapAGnsz
 AY1YeM/lgh67PJpUrMSEE=; b=MESh5Zmozy+rIb6QVAQ7No/pTcA9dXtHXSXP9y
 8JOYilDOV/7Rl/3vYA5BDXo0nX+Q9dU+KssGDu1QrlIARsEmL4V40bb8z0lU7trE
 n6k/9smxs+JC9KtZA6CoVIzoblhb28vRNgHUCiMkgXcSwMsCUzO8AZrSE4LWoloS
 JohqtIq6oMxjjikMM8JhPvaO98RYVVbfduyWWtuUjLLJoMVoaGjZSbjW/Tf0qTco
 YAVOebIpcePSQmZpKhru5/zoRoqV5oFBVhZXNmP4qvg/i6kO+sTx76b/swqyRiD5
 P78IE3kZzzkXDUroSKiRt62/eKF2lrcFX1Ni9rC/bHdzvQOg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b1b8qx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:28 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b38ec062983so1916979a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 17:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752281908; x=1752886708;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=59/HKHw0IVO/0EYapAGnszAY1YeM/lgh67PJpUrMSEE=;
 b=Gno7ecqRocOSfZlifBaClHFcg6noVHEPiQtHb8OtVidTGFnqOUwxuO5IZeD/sdAoQK
 djWDqUHX2GGq77b8StpTmQjZkO/AdV0P4RYDspFhHEny9fqiu5xv+fx/nsAd+J3niGHT
 dUTx+wqXYzv2XrsnRshmhtBM5hudjtoIEd4RTFQfacxb2Ohm4+h/Z0AOLs7z35IKT0y9
 WpSAUwO9eWzFB8kQ1kHEI4W2r9iz7cNqDBx7CT/GUhXcIeFb8CX6zh+zCQcl/1UYJqx5
 l/n3uR54Pit0HuOvZVuyOmNn3oDl0iiwxJpnH6ekWOx+o2u1o7PXDscYEfz0EkXBAKKw
 SwLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUV+rbrSi6ROml4k6dYKSn+oX1bBBzEwgutiUZa4gR92oW4E5vPhHZOg9YoWrW6/pkViK5jmyisTB0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHW+xaaXybYci4K6CYpyYhmv7SBZOmU/hb50uyiu6WFaiXIc5k
 cobz7v/eStGa4laK27JOKfsn9sV8Kcvt9WRfuJB4kiBc6Ku6kbrBFT8q7u7ZNtodI0MkSJpOaKC
 2/iOS7wVT0uJjl8xKG/NR7WiRvRMSqMABHRdrtEPry264WKlOSo3tbpUtCWnnmOHHtA23f9U=
X-Gm-Gg: ASbGncsDmMrOgzy7lHVCvwa0FDm1NEvI4X8y3kCTpkZh8CMRewHPakF/FinQWGsM4P+
 HO//rLjKaFPcG54UDpIfxgeX7469ECJFHbamHtG8gaJexuVOIm1leQ70lz7MHViOSVuxLCe0YHS
 BgW+IqM99V+iiRKlJY4CDE9wNai0MdzGuH+HLpKLmTeOq7fzGmN76zBJ9WRGxtu+KXVTvWDwRI/
 4WWaBeIeRgN/t7b7edhlH/ZvindHHJs8viI7IYQWQpSH3C5paz+BupSp4P0IwFykczbVE4BhowB
 ZOp0pTTQEsIrfXNM3ni7q6jkFfkqpiEswTYdXJW9LiYYTSuW+TCwrS1GbPG0AmMsRxq5Gpi1+5j
 fRrDgPuyyMUbagGDMJhh0QU74
X-Received: by 2002:a17:903:90e:b0:234:d7c5:a0f6 with SMTP id
 d9443c01a7336-23dede860c0mr65468085ad.31.1752281907592; 
 Fri, 11 Jul 2025 17:58:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5ock2N1WmtzIDPmpiiQCTGKrRZe9hOCWl4TodKigqVc/zEllu9cAUP8+zwFBxzlBEwxHi5Q==
X-Received: by 2002:a17:903:90e:b0:234:d7c5:a0f6 with SMTP id
 d9443c01a7336-23dede860c0mr65467845ad.31.1752281907189; 
 Fri, 11 Jul 2025 17:58:27 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 17:58:26 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Subject: [PATCH 00/19] drm/msm/dp: Drop the HPD state machine
Date: Fri, 11 Jul 2025 17:58:05 -0700
Message-Id: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB2zcWgC/x2MQQqAIBAAvxJ7TrCtLegr0cFqy72oaEQg/j3pO
 AwzGRJH4QRzkyHyI0m8q9C1DezWuIuVHJUBNZIm7JUNh4p8mv32UU0DI21EI2oDNQnVyPvvlrW
 UD6PqXEBeAAAA
X-Change-ID: 20250523-hpd-refactor-74e25b55620a
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=2419;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=vzUSuTIrJH7xWxMa0K6LSztJDpe0D9azFI2sMNeqfUQ=;
 b=gcCOUPwSZX203psd2518e2CVIRjXICPtUXHrM8Y/BvpZHwTM2reabtyXUnbryy6J+rGPESLtg
 TAXE6IHFfnhC1CrGKZeEGR2gkwtDDMRRgoDX2rc/bmVOeAzDoXcfs+T
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=6871b334 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=DWSsPxsAs24NKD_X_nQA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNSBTYWx0ZWRfX76iE3M54Ac3I
 2frURQ7ZONGUxZYp0rDGQ7427gYAtoliK383Vmc75+oWVVLu/kGGfwOqZ3dzoXQP0HlZVzWNAEF
 fMxreYkWM0mjR/i9Ai5X2a8n78nDwlObdmf8dfHDtVemPLeCE37j2x+VTAdfloUbyksjDy+9YVE
 4xM00zIJKpTK+RuU8o7dzTL53xnmsCcDyRYl6y6hGG5CEt6CXja59vxrlwW087LiXo9XBqgYM8V
 PCtinT3r3trlNi3WJM7bJLTBBTtZiX5+Qea6n+IzzB0KtYz0Qc62FXGGsolIHc4xoHaVYqbBla8
 cUKDdZ4q1ScQTN+dzEYYfW3KLhXzNeLKqgGJkd0pHY1nJ9uAOoL0PjSUMTvwCKY86PsXrI/5ie4
 Y7jzn/f8avk6GvDWX0HQfsRiwopJxu3SK8/3atrgUwQepIT0LUnq3kwJ5uvmSRPrSUDa8Hlr
X-Proofpoint-GUID: Hvl2is_cbIpCjqUHcaRznCydqbvF7BWB
X-Proofpoint-ORIG-GUID: Hvl2is_cbIpCjqUHcaRznCydqbvF7BWB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=827 malwarescore=0
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

Currently, all HPD interrupt handling must go through the HPD state
machine.

This has caused many issues where the DRM framework assumes that DP is
in one state while the state machine is stuck in another state.

As discussed here [1], this series:

- Removes the state machine
- Moves link training to atomic_enable()
- Changes the detect() behavior to return true if a display is physically
  plugged in (as opposed to if the DP link is ready).

This has been validated on x1e80100-crd and sa8775p-ride. Any help
testing on other platforms/use-cases would be appreciated!

[1] https://patchwork.freedesktop.org/patch/656312/?series=142010&rev=2#comment_1201738

---
Abhinav Kumar (4):
      drm/msm/dp: remove redundant checks related to ST_DISPLAY_OFF in plug/irq_ipd handlers
      drm/msm/dp: replace ST_DISPLAY_OFF with power_on in msm_dp_hpd_unplug_handle()
      drm/msm/dp: Replace ST_DISPLAY_OFF with power_on in atomic_enable()
      drm/msm/dp: remove ST_DISPLAY_OFF as a hpd_state

Jessica Zhang (15):
      drm/msm/dp: Track when DP is physically plugged in
      drm/msm/dp: Return early from atomic_enable() if cable is not connected
      drm/msm/dp: Replace ST_MAINLINK_READY with link_ready in plug/hpd_irq handlers
      drm/msm/dp: Replace ST_DISCONNECTED with checks for connected
      drm/msm/dp: Rework unplug handling
      drm/msm/dp: Don't delay plug-in handling when ST_DISCONNECT_PENDING
      drm/msm/dp: Check if DP is disconnected in atomic post_disable()
      drm/msm/dp: Drop ST_MAINLINK_READY hpd_state
      drm/msm/dp: Drop ST_DISCONNECTED
      drm/msm/dp: Drop ST_CONNECTED
      drm/msm/dp: Drop ST_DISCONNECT_PENDING
      drm/msm/dp: Drop hpd_state from msm_dp
      drm/msm/dp: Use drm_bridge_hpd_notify()
      drm/msm/dp: Move link training to atomic_enable()
      drm/msm/dp: Log connected and link_ready for event handling

 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  22 -----
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   1 -
 drivers/gpu/drm/msm/dp/dp_display.c | 190 ++++++++++++------------------------
 drivers/gpu/drm/msm/dp/dp_display.h |   2 +
 drivers/gpu/drm/msm/dp/dp_drm.c     |   8 +-
 5 files changed, 69 insertions(+), 154 deletions(-)
---
base-commit: 7a88d609b069b7d2f4d10113b18fea02921bedb1
change-id: 20250523-hpd-refactor-74e25b55620a

Best regards,
--  
Jessica Zhang <jessica.zhang@oss.qualcomm.com>

