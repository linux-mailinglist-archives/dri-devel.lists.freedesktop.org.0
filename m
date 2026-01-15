Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D98D22CF1
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 08:29:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C0B110E6BC;
	Thu, 15 Jan 2026 07:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ApFqPLMn";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fh9GYyqU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B31310E6C1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 07:29:13 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6g3vN783457
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 07:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=h72bZwdSi+QRO6gwAB/PZa
 NU8NpDQH/mFKJvFIHBoMk=; b=ApFqPLMn4dBPDTyNTmXb9QMxAItLkKkUzkW2yL
 kmM2waxBqeFB5qLZ6Kw2JPDus/IdLKlMTR8m1ycmgr09/Q+tDLt2RHGfPvdPpTw7
 1+JzOp2ZBH2wEn62oLDwiC0I2B1jKQ4MgYwAZu9VBF86zeDMibW2FdUnRyMvggaj
 4lZbMks/DX+GmzHzKhts4eyR4L//CelWddgSut5TscvYUJGn0cMsyx8puh8pTmma
 zlOBOMFogkDTS/kpUgH1nlOPbBuX7Cj84tPefpYIFfz7dO9xyz/e0CKjTmwjf+6Q
 mJvZJ26xt5kpkxZG/2qjSanLS2Xv90TXha9hBJaENL98JxpA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbj5jyxq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 07:29:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c52fd4cca2so160765785a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 23:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768462152; x=1769066952;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=h72bZwdSi+QRO6gwAB/PZaNU8NpDQH/mFKJvFIHBoMk=;
 b=Fh9GYyqU3TztJEFmQZE+W9Iog50RlBMjqxZ8inqdp3ugwi+GQh9+Rhs5DDfgvRkcNe
 MWYDRAOrU7NFfHScv0sxEBYc1z7r7yY52LYnbTyXH3PIQ0u9Qf9Z+Q8dvL6ng7E0HEB/
 cvmgUlULQrK9aR69KH9dEJd4NV0PY4uIakpumTDzibRg5uG6g01cyR36+Pn9RdKjU3sN
 BcnD0l3IowtZmRMDHJgsrpoJYeJlkw8lBdpfoEv67rNdQVWBiYYvMxBJfYGhA0zKCBQ4
 PrDL1oaujISPh26YihnTuS6SxrAmuAlsJTGBjfS0FDLOQ33PBhz3/heZowPHPJf7U2wr
 MpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768462152; x=1769066952;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h72bZwdSi+QRO6gwAB/PZaNU8NpDQH/mFKJvFIHBoMk=;
 b=L0FzWzTAqZNJNwVTg18u0XUp9QxGvoHPJROXzLo4DylkuJnWFtQ0AB30Mo5UgXDbDI
 F8aYp2qWOeYGzV+miN+CavzRsy1kIsQC1kZdZzg4eqsMXu5Qsyu9HBuMwOlM8dWM47F8
 VQRCLKnDMHUn1+LvPHFeV7J06L9J1SOn6CL1KYbVKfrYc2z3Y44aLXXonMx4SSZUgvx1
 Qs4pWhCp96wlU07dn3k9ehQoMwRE9SKMFj6uamU2ZkxfBRtv4S/7LSYE92hyepAKYfHA
 ga8jXm+994i2OlZWcg9tQ4sfOkYzysnj3qwF8G7iJprets8+rvxUR0QkF5u30a7T+Jk9
 E08Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJNm1VqGBq/NqlP68U1503IBONtwgjcYJtAA1fUy5HUcBpw/eoPFOLNU2lU1K75mcyrWvGhtovQJQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZud48U9/mMhbh20ExWzfGBKJKWd4HAetVrGhGQup42MQDrdEx
 GqUMOpqPyzUDM5p9mYKAXB1DIjpo/r1VzopXBfBxjfkb7SWbP1+qhUON25mRlhjeXwDbd+x8UrF
 y1ZwdClaebSK9KWqHrSew9fTXXyxekmwkyDQphcDROFN91Uw9ZNfCeZBa+Xav6QQGC2dl+uQ=
X-Gm-Gg: AY/fxX4iuwH3hDzIIwKxwq3FEOzyFS4SjRwSpNuqTf5jS+iNZmklUhkJNasd4aV1HK+
 H3HNsiAB8iBSiiU0IDwoXHIZJgjwYA1uEjGEMX0aKCOs1AzwIro2Zjk60LfogMr1EWXe0+ynRZ3
 vVz/ekVM1lMZYU4upGfFfudsKtdAEgWVsFNM+PMFCBL6INMhAaUkep7yD7o85xFMLrHlFt5TgFN
 kv0dbKcobEYxAVgpyyNn/J1gu9t+duXFa+Jlox29CeBOeJgTkKuccAt7P7K0eOZWyG8AyetAkxT
 6AzqcC35UCWPMYszOok7BsDmZhUaNfP18f2xBmVuswtROMW3vq3bh5XmH6axPJXZpMh42jpEEEl
 leyAyYfBbCS462XmamV1WXD7ZoNKP0z9aDn65VcSMugwjoJvnm2DuW7O7q+UbUGlCLxxhfBYp3B
 K2PI75pkYtt7GttlvZR5iBbVU=
X-Received: by 2002:a05:620a:2808:b0:8b2:6bdf:3d15 with SMTP id
 af79cd13be357-8c52fb236dcmr733254785a.8.1768462152325; 
 Wed, 14 Jan 2026 23:29:12 -0800 (PST)
X-Received: by 2002:a05:620a:2808:b0:8b2:6bdf:3d15 with SMTP id
 af79cd13be357-8c52fb236dcmr733251685a.8.1768462151808; 
 Wed, 14 Jan 2026 23:29:11 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-382eb7b1a4dsm58078801fa.17.2026.01.14.23.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 23:29:09 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 0/8] drm/msm/dp: Drop the HPD state machine
Date: Thu, 15 Jan 2026 09:29:05 +0200
Message-Id: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEGXaGkC/23MwQ7CIAwG4FdZOMsCBWTx5HsYD4x1jsS5CUo0y
 97dbh6MxkuTv3/7TSxhDJjYrphYxBxSGC4U1KZgvnOXE/LQUGYgwAgDindjwyO2zt+GyK1GMLU
 xWxCO0ctITXis3OFIuQuJzp6rnuWyfUNWym8oSy64Ur52vgLVKr0fUiqvd3f2Q9+XNNjiZfgYl
 ah+DCDDtholWi2dU3+MeZ5fq8r3g/MAAAA=
X-Change-ID: 20250523-hpd-refactor-74e25b55620a
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2608;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=m86ld7IhIkQDXjy3Y5weZUVJI4ZHVj+c8sLf5mumz7s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpaJdCjtkDFa+i+6psenegKh3OkYiHeRBG1uY8b
 PGr671WMd2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWiXQgAKCRCLPIo+Aiko
 1VQLB/95pAha7y+54mAYSqmZqac8WgGav2PRQ47+7Zke6AgWGNysjTJVTTjqoBnn66z8mDHpyJ8
 Y+iPRFFzDJKxHcn3zEeU10ufB+ompE3/bJwIs0i6V30hoQUaR+BfJMkHWGdPwlinMfQZkMkinwA
 efV1tdiHaXjpT1iPPPTfwPZloBosQtNMYEogflSKtLPS/x8LZqdEKpVrhRiExI+OQb8R8+4B3pO
 HTPsIeIsMUU2OtGYHdSG0k9L8JNAO0mKHnCFGYgrZzIGNotfwSQzTL3LAAUMEhV7NLzwy1gR/qb
 3UQugs9NDQ45L6Q7U7EzqccbSuxoMzLK3ocCuhyOVRqyn6fB
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0OSBTYWx0ZWRfX9KMCaqAvvhPJ
 9MKYKEnY3UNn9rB2lhgfEjDN+OjXEVzU2ELiInwfWm5Tn1EgeAX9l186LvuYL4ieoBDe86yQi3i
 ZhjOm7p/TR9yBAm+5BUcv4r4IFZVzgzTBj2r1a2m3JkFbrIJPX/xcXqbbyjywYf25oteLGWqLK7
 5kzqb30OdG/38Ln0qSWlbqEz3F5AOuHypT8KI0cHd388keYId+F3RBq6lYRem996zkpI+Pi6GMZ
 /wQkx5zSH0JUv0t+boGyZUOEFwBSNON9+fxY8ragWIb+tIpo1DUI8d8Paq13CJCe9JpycxUWzUY
 JzxUnXDT1G6eTbf0MsU1AmNfcSjngWVU2PxkmvrNeijbMNAeErDuD0eIsccYX40rvVA57M9pxPy
 +bpLV7H595RlgwnXiJ61ICk3LU8LB6uLcwRNGbbWACKwW0YNbpr8yr/LdlEAPaA4ZI/JWCbr9RR
 uhkRJAaLtyeHFPXb1kw==
X-Proofpoint-ORIG-GUID: qJtZP_XPjaBOS8FTJ8FEAnYArPCCO1r3
X-Proofpoint-GUID: qJtZP_XPjaBOS8FTJ8FEAnYArPCCO1r3
X-Authority-Analysis: v=2.4 cv=aapsXBot c=1 sm=1 tr=0 ts=69689749 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Q-giyGzHwlFVuBBPpRIA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150049
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
- Remove event queue and move internal HPD handling to hpd_notify()

I'm not completely satisfied with the PM runtime handling, I might want
to review it at the next iterations or with the another series.

Note: eDP is mostly untested.

[1] https://patchwork.freedesktop.org/patch/656312/?series=142010&rev=2#comment_1201738

---
Changes in v3:
- Take over the series (thanks, Jessica, for the previous work!)
- Major rework of the series, squashed the set of patches touching the
  HPD states and handling, it is easier to do it this way rather than
  pulling the strings one by one.
- Link to v2: https://lore.kernel.org/r/20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com

Changes in v2:
- Dropped event queue (Dmitry)
- Moved internal HPD handling to use hpd_notify() (Dmitry)
- Reworked bridge detect() to read DPCP and sink count (Dmitry)
- Moved setting of link_trained to plug/unplugged handling
- Dropped msm_dp::connected (Dmitry)
- Squashed all hpd state related patches (Dmitry)
- Link to v1: https://lore.kernel.org/r/20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com

---
Dmitry Baryshkov (1):
      drm/msm/dp: drop event data

Jessica Zhang (7):
      drm/msm/dp: fix HPD state status bit shift value
      drm/msm/dp: Fix the ISR_* enum values
      drm/msm/dp: Read DPCD and sink count in bridge detect()
      drm/msm/dp: Move link training to atomic_enable()
      drm/msm/dp: Drop EV_USER_NOTIFICATION
      drm/msm/dp: rework HPD handling
      drm/msm/dp: Add sink_count and link_ready to debug logs

 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  22 --
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   1 -
 drivers/gpu/drm/msm/dp/dp_display.c | 673 +++++++++++-------------------------
 drivers/gpu/drm/msm/dp/dp_display.h |   2 +-
 drivers/gpu/drm/msm/dp/dp_drm.c     |  22 +-
 drivers/gpu/drm/msm/dp/dp_drm.h     |   2 +
 drivers/gpu/drm/msm/dp/dp_reg.h     |   4 +-
 7 files changed, 208 insertions(+), 518 deletions(-)
---
base-commit: b775e489bec70895b7ef6b66927886bbac79598f
change-id: 20250523-hpd-refactor-74e25b55620a

Best regards,
-- 
With best wishes
Dmitry

