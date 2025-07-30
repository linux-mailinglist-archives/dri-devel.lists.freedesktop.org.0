Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAC9B162D9
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 16:31:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8656810E374;
	Wed, 30 Jul 2025 14:31:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VRWNVQCE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3353B10E374
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 14:31:22 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UCbA7k012721
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 14:31:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=IOeotSDa9sAJWWk+JU7QUA
 OahqMPTXl9EkoBb7yQEcA=; b=VRWNVQCEj6ONysbJZS43fCoYh+UyLdua12P+Zv
 mJCE4Hcnc0humLdbTkymAmzUhHhaOXVK85DWORo3LBCD49Fg/0doBNZXeDgiiL+r
 wEvMZXJt6kyrQEHQ7nZFL7x89XzWILpcYdiYs2hlp4oq7o8TMsU4Q4E360q1dtGp
 mVBd7zu2i6dzyaRWnEYkCQWdBuN/3ncqWzDxc7YWTOavT95RGd7DE7AlSt5IggBK
 MPPscNGNQPW7Sn0qpmJbuCCwjDo+OIxhaSJyPO/TkkhGn8Hhd1A0mWiJ7nh2phr+
 sc6JNhzwxqSI4roMYRNoh5SwlOI7/N68pkF62koXCL7a7ikQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbm3yj9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 14:31:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2369dd58602so75045885ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 07:31:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753885880; x=1754490680;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IOeotSDa9sAJWWk+JU7QUAOahqMPTXl9EkoBb7yQEcA=;
 b=OOYaAQnh4ktqc1binzmvVlucalj9bG7Qq+NOjcHHWAS1d6blfXYccVe4tWEuWSS2Kc
 P67VHRn+vg7tH/3vNJ0NYA9Gv3NUDTYDxnSfCWtkl/lR3XHjJ+E96qVqJfEzfrIWa5c0
 3h8DqNelSyQfJU+kPRVrYWVWYbSYUUJxjCx89sEhj80HGr+4Br9IHGUa2ZAvoS8GFnAr
 09UcZeFZLEw5EjE5WuT3ZAX4p7/tXCzggtJrv3rurU6F3/8XFU0XjOddinbaAhhVC+8C
 bKTApjENqvsnECAJ+Cv4mssf8xk48ds6oQx6otLq6dEhLCkI6fBqqdJSi+PT+neADNKH
 mb/A==
X-Gm-Message-State: AOJu0Yy/Ri/jlgEyOe7fYqFCn58y5MH8tMFB06aru7xaXBTn87LQVLbn
 WgqREXLl6v2NJtathVSqNdiSwaxB6thEXTPfPZU+0Opl01Mk+ihJ4lz0bXj512+rseQzXy65Ux3
 S7eEj9SZTLgeBw0dPI59acnNDQ+8gYxeC5JODjOoH/piujFCMgcJ2CW/WJM2lKnUOnlFN9w==
X-Gm-Gg: ASbGncuCfwMRc4Pn0Cv6Mxln6OpVmOZtKmUf6QirVsG0yL4lXxVxAdhrpbCSxUbeeAx
 RmYQZU7ffEFOSLaEab8Swxsf9At7/aRwKVGAz4IW9wdV0S9T/LexY5qt8gMCEd/pDWRNaN3JUow
 1qpaxn3J4coBXFCVCJ9r4wpZP14HJtUeyzC0T+Bdl5rc79sa2MIUWrwsmRUJuKQsHUB/xthi+8K
 R+wN8sjYAt94g7QYSFZ8HHMAPrvjs+SV8VuFe32/ORcMpgtV+Ys3LrLxvJTuudr0SPMbhhE550b
 2SYec/TqM0mTlmPS9jzonqQr8aRtX2kaAkfoafPeOjCE0iAf+5LoN4Zu+z/nscWn6w==
X-Received: by 2002:a17:903:1b67:b0:23f:8bcc:e4e9 with SMTP id
 d9443c01a7336-24096b103b9mr50543075ad.23.1753885879421; 
 Wed, 30 Jul 2025 07:31:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBsUTPJJLGBNeiJAu1ltEoNzfJVdZ4yRETnlLRHV+4sqfRaaJSO27F0HyDp34BZXEPCI5Pag==
X-Received: by 2002:a17:903:1b67:b0:23f:8bcc:e4e9 with SMTP id
 d9443c01a7336-24096b103b9mr50542515ad.23.1753885878929; 
 Wed, 30 Jul 2025 07:31:18 -0700 (PDT)
Received: from hu-nlaad-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2401e95207fsm75090365ad.54.2025.07.30.07.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 07:31:18 -0700 (PDT)
From: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 20:01:10 +0530
Subject: [PATCH] drm/bridge: lt9611uxc: reset edid_read on disconnect
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250730-lt9611uxc-reset-edid-v1-1-3ea4d5b16197@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAK0simgC/x3MSwqAMAwA0atI1gZSv+hVxIWmUQOi0lYRxLtbX
 L7FzANenIqHNnnAyaVe9y3CpAnwMmyzoNpoyCgrqc4J19BUxpw3oxMvAcWqRWbKuRyLkSuCmB5
 OJr3/bde/7weB0WIeZgAAAA==
X-Change-ID: 20250730-lt9611uxc-reset-edid-cc03c5b4bc60
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 venkata.valluru@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
 Nilesh Laad <nilesh.laad@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753885874; l=1143;
 i=nilesh.laad@oss.qualcomm.com; s=20250718; h=from:subject:message-id;
 bh=bS2qx1gmX4rTXlznVDRT/ViuSl9zXtuoHBiML9oxlLw=;
 b=Z0MGmNCuZpuFUkRw8jcSMRQlh1OJbHHfoebSoIfqMi9WbQWl1kKw16uvL63BnpjRDeSyI6FUg
 fK/Sy9WYjEqBNHf5XTUB93DmA/bGN/uOZpadNDX9uvw13ovvn66nfRP
X-Developer-Key: i=nilesh.laad@oss.qualcomm.com; a=ed25519;
 pk=MjLHvGipC16awutyYh0FnLpT1nPxL/Cs1dCevHMrrD4=
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=688a2cb8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=epPyvgG4nFS5MlfyoUcA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDEwMiBTYWx0ZWRfX6MnI3HMGw8+l
 mKl9Ya1jv/r7GVC3b7kG8MY6eX78IabMDc34Uxm7G5TlhiQ0JnjzF3IdUcgrWBgn+E55oOYa6IE
 PmNZzgg8M1dbFOb6oUQX8FZ4ft/P+a/zGY48CyZvpgNIqNBTOWCAYsP69vA2mzRJF78U5BIav+7
 8rTVrjksfwnZlZ7X4Ju9Jy1btXpdT+lMMyAG5eebOAlffu8q58BUxtKURzYz7o9fV3AjdQ4LU5a
 jtISHA53165UsNm3w0ftVByMzbn65007fcHCqxzQ2av2r7VZLzMvU++mCSLyExiGBm7O13KkTqm
 kU3tcjbUfj00Zqea42TrM8wURbbhkTdi1MT+nrolRw3pAg8U6nWKBGKCOhahMeN52GByWMO0asz
 Sdyhh/zmiZzFPypVf1KwIU1Fi8SxO644Mdc1IR9MAmsaOHBgd+CZkJEtgZuDM9jnXg6C2uo3
X-Proofpoint-ORIG-GUID: iPid80gjxeJbQjQnJUUyTv6IM4uWCMYM
X-Proofpoint-GUID: iPid80gjxeJbQjQnJUUyTv6IM4uWCMYM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507300102
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

Currently edid_read has value from previous connect session
and resulting in drm using older edid before new edid is available
in lt9611uxc.
Reset edid_read so that correct status is updated and correct edid
is available for drm.

Signed-off-by: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 38fb8776c0f4..f5c887d126fe 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -171,6 +171,9 @@ static void lt9611uxc_hpd_work(struct work_struct *work)
 	connected = lt9611uxc->hdmi_connected;
 	mutex_unlock(&lt9611uxc->ocm_lock);
 
+	if (!connected)
+		lt9611uxc->edid_read = false;
+
 	drm_bridge_hpd_notify(&lt9611uxc->bridge,
 			      connected ?
 			      connector_status_connected :

---
base-commit: 85c23f28905cf20a86ceec3cfd7a0a5572c9eb13
change-id: 20250730-lt9611uxc-reset-edid-cc03c5b4bc60

Best regards,
--  
Nilesh Laad <nilesh.laad@oss.qualcomm.com>

