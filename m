Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC6CA773B2
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 07:12:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B61610E038;
	Tue,  1 Apr 2025 05:11:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HHFGQ5FP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42EBA10E038
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 05:11:54 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VKGQUR008415
 for <dri-devel@lists.freedesktop.org>; Tue, 1 Apr 2025 05:11:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=+EPeDpvToH2ZUao2pgt3uT
 HZyzpTU/iARIUmURjbN1w=; b=HHFGQ5FPRReHPZrr7G1VrC2IXk62gc/ADsAA7A
 0xqtqarsZEKExO6CiyzzFSDCGtuVpqYdXhp4dNoaN7GDVlAFuXJAFxqVmrXRC7Uu
 J4HlhBvVJ+GRRCkaYMKOf2YOmgrFWbzgi4Ks/nCr6pogX7mxuJYNs/y/TJx0TENW
 HP3kNliwOGXWlI/ucJ9YHFL9g+5XDHvgPb20WxlB2b/f1dKJ/FnGFP/rNrr/8Pyq
 CnM10yax0gOx2CcNw+Zsosg2eiLOAtGIi38jUs0JX0lhxCIYPmk4KvIklZeYGkrQ
 o7y/SJyRnnTTWstYNNPkA/0nr6jizKhPE+JNZCrbsnH2Ut2w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45r1xnh0b3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Apr 2025 05:11:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c544d2c34fso688467785a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 22:11:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743484309; x=1744089109;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+EPeDpvToH2ZUao2pgt3uTHZyzpTU/iARIUmURjbN1w=;
 b=E4ziYZEt/XMPAfh8iPbuzXTsufBM7we45q9kTvZnNR8/WYRyCpEkRIgA9LqrEJwOP8
 svF1nGJznVwIU+P/+4kMnA32KVrnuYv5DHBLVYm0YfQYzIlfK/YTbmLeSR47hsMZawuS
 WrWxgNMsPRk6RgTDINKCZbQ6dkuYeG3yFtQgtX4H/RG55MEvpidaUubq8frSoAJ51pqP
 wMgEi3/2f8aw5yAGjDHHWlSFuHmYOgK1XjfSV+UJYbTxw3RRWQNrDRnMj+E2+SdV/XAm
 u6GgUqU8gs6NlN8zat0I/jPz5PqqolPdHtIgOu+rCXQxKUFU05N1HCXM32GBHInIy0ma
 URNw==
X-Gm-Message-State: AOJu0YwYbelm65SC/WiG3IB2sRBObG1dL4pyBTtVbFqMDOtWcbA565fu
 Mt87S+A38ReA0+dFnPD3c8pJpbsqqY8IUsWWAyBve0YQVs39GeZCSCGIpzxtn5zlg/kjxdX6Nel
 0i2BMuBSeMomWR9yLQEcbuUDufpQetwlb7PC26oNkocvsRzGT/JWUbezhS+VDbmVDZ3g=
X-Gm-Gg: ASbGncuG6j/uC2Zzm0dL5pvaAP0pA7i1WUHHpaHHAsMTL+Um/WCxbQEbzDIZ3pjAnxv
 p/FN2c8QQ7TH+MLWbB+Qaaf0zKTxPjpDbdjMgztOLwHcoFrc+qP/40c4bDZrzTXazd6XY3I3gFN
 bkqtDVTaPb+H0lwtn7/QFphrroxD0A6LOwCMVw4qv0sUBnacOHK+Zbj58EwsG9sty4rnBcMeqHC
 tekkmIAe+EdaBoosXCGafTlPj3OQ3RiKO3mn7Q/eEoe7zganZ1Mlrn3m9PqDrmvZcJgy81rjtAz
 WJWVH6Rg/UI/x7KoJoaWSh82/nWrca2hQV93lPESqrZUMJ2fXIQlHYCROjfNGPdpv6trQD56QD0
 iDuGg9LXeOqMw8RWcza9w9LT8+MBK
X-Received: by 2002:a05:620a:3786:b0:7c5:642f:b22c with SMTP id
 af79cd13be357-7c68fc9c427mr1179507585a.20.1743484309487; 
 Mon, 31 Mar 2025 22:11:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEw0h7OvYxBYLmSOyl75V1etk82f3aJ3QHnXH1+LOjNwNHGZAqQ+1Wd4ShPpCzhdZHdPuudlw==
X-Received: by 2002:a05:620a:3786:b0:7c5:642f:b22c with SMTP id
 af79cd13be357-7c68fc9c427mr1179504885a.20.1743484309122; 
 Mon, 31 Mar 2025 22:11:49 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54b095a21b0sm1251697e87.243.2025.03.31.22.11.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 22:11:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/7] drm/panel: make prepare / enable / disable / unprepare
 return void
Date: Tue, 01 Apr 2025 08:11:32 +0300
Message-Id: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIR162cC/x3MSwqAMAwA0atI1gZav+BVxEW1UQMSJdUiiHe3u
 HyLmQcCKVOALntAKXLgXRJsnsG0OlkI2SdDYYraVMbi4YQ2VDovFYw7e/RVY6fW0ujLGlJ3KM1
 8/89+eN8PDoYCOWMAAAA=
X-Change-ID: 20250401-panel-return-void-d461c71ebd35
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1521;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SWWLsVJ94ivCtL+DLwM/6VWMFnGr1UzXt+xSuS2kHlo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn63WQYuWY5EwCNpnvnxAAfQzVeq0N44OVy4EHD
 dmkMLK0xEaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ+t1kAAKCRCLPIo+Aiko
 1RwjB/sEtfEVtJlP8flqkFOxdr44wnBrYs1CcjgzVSjjmdaoosaFOW5tuB81DuH89srrcEj68kP
 RP9l9unzeAPIbHWKxQzYovGqyrlR8rSNwqR0IDlv4dBJpkpU4Fiw1qCCmWq1EpR5jyqHbMNE6hX
 yFSj/iOW6Olkq5DmdHu00f485ywe7NouIRYpbByjw5K893e2/8YQ+Ud4aS2VuWhD5Leu2qsk5Dj
 fICvAVouhNNOgtaOzxqaHpcYl6ETvHxBmQESmz7B7x8qxz4MNUx3+2LOl1iThRB/Ona7VyHM0zc
 BGxur1j0auBfyMzAoacojcdaBdDxedzC9k0m4cQX0xOSfKMB
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: jyRRmcM0Gll1W7z9Uwso-c0DVaJXdGYt
X-Proofpoint-ORIG-GUID: jyRRmcM0Gll1W7z9Uwso-c0DVaJXdGYt
X-Authority-Analysis: v=2.4 cv=Qv1e3Uyd c=1 sm=1 tr=0 ts=67eb7596 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=At1--SbbbmmVrC5aaCAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 mlxscore=0 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 malwarescore=0 mlxlogscore=821 lowpriorityscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504010033
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

While it makes sense for panel callbacks to be able to return an error,
the state-management functions from drm_panel API are usually called
from atomic callbacks, which can not fails and must return void. Make
drm_panel_prepare(), drm_panel_enable(), drm_panel_disable() and
drm_panel_unprepare() follow the same calling convention and return
void.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (7):
      drm/bridge: analogix_dp: drop extra calls to analogix_dp_prepare_panel()
      drm/bridge: analogix_dp: drop unused argument to analogix_dp_prepare_panel()
      drm/bridge: analogic_dp: drop panel_is_modeset
      drm/bridge: analogic_dp: drop panel_lock
      drm/bridge: analogix_dp: inline analogix_dp_prepare_panel()
      drm/bridge: analogix_dp: ignore return values of drm_panel_* calls
      drm/panel: make prepare/enable and disable/unprepare calls return void

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 107 ++-------------------
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |   3 -
 drivers/gpu/drm/drm_panel.c                        |  54 ++++-------
 drivers/gpu/drm/panel/panel-newvision-nv3051d.c    |   9 +-
 include/drm/drm_panel.h                            |   8 +-
 5 files changed, 33 insertions(+), 148 deletions(-)
---
base-commit: bfb20a655848a9088e3e9ae24b1dcce1bbf016c2
change-id: 20250401-panel-return-void-d461c71ebd35

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

