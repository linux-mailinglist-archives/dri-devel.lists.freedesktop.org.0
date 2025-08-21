Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A233CB2F677
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 13:25:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A13610E2F3;
	Thu, 21 Aug 2025 11:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kwufe1Tg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F6210E2E4
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 11:25:18 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9bEwr027115
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 11:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=K5bFmBCY/LeA6pTwVZP6+I
 KrEIU/bbWARlNfUXNazJQ=; b=Kwufe1Tg574GGRir7NZrcYjVXLEsjFQdWpRW1O
 rG5vVLrTSIdnHH1jrITYXRRfdjF3vzuJJaQ3RCmQE9E8W3++0IheV7VtrGvUPmsJ
 uS/mkZDDjj5QIAbogUqpl6b787FH1FzZhfZtQAyew8cU4tFsuykXfAU6orupFCCg
 7b7ij0u6BFlUnHp64rQZaV7SM+lJDy8unCYi7pZOujmWZjShF+jWYmV81YCj/Ykl
 iUGDI65SMKI0Yqh2hoAxkpEeA6xvK0PPKqKJOcHcRYPOaX5eN8HgYDdj2olrncFp
 zixtzpSbd4m6tsgnotQrMdAfIGeuCEsIi8nAOAKzydb6s43A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528w6au-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 11:25:09 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-70a8b32a6e3so20090666d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 04:25:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755775509; x=1756380309;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K5bFmBCY/LeA6pTwVZP6+IKrEIU/bbWARlNfUXNazJQ=;
 b=oY/SSQFZiQ8v3y9FqBmCFl0EggnMeuO5XtGnhoLr1WuiXhv3cSAE6os29ZZHChcs+5
 nYkCl8W52g3Rn7IhmcHZaaNYfWFOJXJvnnWKzdznRgP8SuusUG3ZD+8My2L+DtuADNhd
 CblM5G+2Ts3bIqKvxM//gli7/pu+G9ulfqNcnQ0F+eFSyspIxquHz00zt544JOytGph5
 kMXmcQzJSlPL/vKrDs1iEfn7HcZ0bFYxn3sbOc0cNjGjLreoyA43EuMgZEVtNKc01t/j
 RI/tJMf9OtJG748oUvZSs34MkDkqxwIqFbc+/dnJsOpLNIMEFpOuGHiRelxf6o6pg+YP
 dRHA==
X-Gm-Message-State: AOJu0Yx0dQcAw682WvxNqz16riSrSZjs9FT6ypXntC4OMyrIgcl54z4T
 KUaKUIFmt7sEkrJ+WdjPnYfR15AZ9On+uBoGq1rOjUJ/7sK7IYchNYAqMNiyYwxL3o2LAHAXlnL
 tRvO77hH5jOcZh0uUajtSmayTaaVY+2+/JQLvMITZ6u8zvO4usemu/YwrSLNtk1jMiLYVx6U=
X-Gm-Gg: ASbGnctzIXzvbz6NhUBZ196A7EwZKvs1vxaZhGiJsPozO/8is6mV/iUY/AG93b4NYgG
 l67xd2M1LY4DJULbyIBgpO/ea+KpNEhPru6opirCp3Yuxl+nJ8aGC54Yy5ZyLss0w1+/BnR1oJy
 7vbz4n+nzZPgvHOBdacdoWmqbNxAwk6Q0sTy1SuSLC56BTrMf23wqZrLFP6tMvif5BNkOLAud9L
 hCz235aAqr3LNnJMai7T2VQ6L7WOea8+U5efFoYGJQCAHYxMJEqqHNpDrX85fePhJu0W51W82cp
 k6XPL46KtLFjBweg+7Ix2QlRiJeB1u/C4LRlTvLrfhAGQVGl9Bq29DYT81mrXMbEeaAi441140X
 uRdTKkglAKBXu9FGfnB61lMuqs9XFrRsNBUk4jkwW7mQsitAX6/97
X-Received: by 2002:a05:6214:5b13:b0:70d:8aef:8d0a with SMTP id
 6a1803df08f44-70d8aef8e39mr14441066d6.59.1755775508631; 
 Thu, 21 Aug 2025 04:25:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFodSb08ta1eWH/VHLUq6PuKUZ3A+ZaIt2Sp/dt1JtT73SO4rzYoR9Belx6Wuxth+OnDD7Spw==
X-Received: by 2002:a05:6214:5b13:b0:70d:8aef:8d0a with SMTP id
 6a1803df08f44-70d8aef8e39mr14440566d6.59.1755775507940; 
 Thu, 21 Aug 2025 04:25:07 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef35163bsm3055405e87.25.2025.08.21.04.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 04:25:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 21 Aug 2025 14:25:06 +0300
Subject: [PATCH] drm/tests: make sure drm_client_modeset tests are enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-drm-client-tests-v1-1-49e7212c744a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABECp2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCyND3ZSiXN3knMzUvBLdktTikmJdYyMzU3MTY6NkQwNjJaC2gqLUtMw
 KsJHRsbW1AJunTRJiAAAA
X-Change-ID: 20250821-drm-client-tests-32657432c103
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1016;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9pNcbOr/t5znsqk1yELfqWRWZ5Kb0hIeMOc2+a66FkM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBopwIS3zQpbiuKMTHmp/gqkdHVus3vmXbJLIQkF
 vt4Kf7CrnmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKcCEgAKCRCLPIo+Aiko
 1bcNB/9VFpvMlWtKFzlt0JVYiQpSKWeIWhsj6mkvIA0pgxgxZXSwoGUbI5NNP/NAgSgLEqH4lDh
 iK2cpLZwkrTpV4cJtfAVBul9sjeOS0PvwKWxT75JxktCz6xw12FIHWB7PKDG0++icuPr+MI2zKL
 MfRmbwE84PwJrIdn33I50EET0TnTcgbr+g9oBtTWsG2e9Jq7tKPSXlDLHwXuHakSNftyGMRzP7a
 koHnbN6BisSmzigTuSMtaVfgD5lRBeZQzDkU1K/xhiHGuuvgVusoW4FSDZU3tSoFtJEX0q/qRqQ
 78TK8VyGnPOiR+3ioRFGdcGlmF/7QUBdVzC1LXs7iOWykv+Z
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=I4c8hNgg c=1 sm=1 tr=0 ts=68a70215 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=RgqmURRhr6E-9W_eTqwA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: e7JTg4zrwCx0LfKMAToLfvCVPRY4xfut
X-Proofpoint-ORIG-GUID: e7JTg4zrwCx0LfKMAToLfvCVPRY4xfut
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX1MLbp4mabSIp
 HOkopSygWU9yYcUB0i//5l7vrv7piHm2Chm6GGnXnM6KqpZugmO0+1f4eO4rTRdz1kGXOad8bFP
 PbiUsxQE8WqzXa6xD4jUttR85naB1LjLcTF+aU8KeAOU98pn5uCG7zk0A05ORtLwUJQSyHOKP3t
 KN9mZeZgtgYDGv3UyIZQQKsXd+VEuIy3yUKnqUArfdk++D96ZLVSVYxTZdDS2v5UmnZklJvcmHp
 Tid7U76LezqnddR5UIGJ+G3DZpYxmLivtWoZcbzJ9c/DZlniJCZ13HMpIRP6Tsiqt3X+2zhTM6v
 ARxZyydpxsDJth5cNk2sLCpoaGNt36RYCrf6oT11nRha5i3qJ6n5ed5y63a+yIBm5jbRMn5jsZv
 4dZUZC9NZQpAuTsEvKChqkAH1MYYGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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

Default config for UML (x86_64) doesn't include any driver which
supports DRM_CLIENT_SELECTION, which makes drm_client_modeset disabled
(and correspondingly tests for that module are not executed too).

Enable DRM_VKMS and DRM_FBDEV_EMULATION in order to be able to run DRM
client modesetting tests.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/tests/.kunitconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tests/.kunitconfig b/drivers/gpu/drm/tests/.kunitconfig
index 6ec04b4c979d45a082a5fb078b81346e1f60b0d2..5be8e71f45d5c3588ca67f117e4c44b995153f63 100644
--- a/drivers/gpu/drm/tests/.kunitconfig
+++ b/drivers/gpu/drm/tests/.kunitconfig
@@ -1,3 +1,5 @@
 CONFIG_KUNIT=y
 CONFIG_DRM=y
+CONFIG_DRM_VKMS=y
+CONFIG_DRM_FBDEV_EMULATION=y
 CONFIG_DRM_KUNIT_TEST=y

---
base-commit: c8cea4371e5eca30cda8660aabb337747dabc51d
change-id: 20250821-drm-client-tests-32657432c103

Best regards,
-- 
With best wishes
Dmitry

