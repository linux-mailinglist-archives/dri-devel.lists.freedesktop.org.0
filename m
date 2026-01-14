Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB058D1F91C
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 15:57:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5288210E114;
	Wed, 14 Jan 2026 14:57:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="NiWput+k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F8410E114
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 14:57:54 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60E6j56h2080564; Wed, 14 Jan 2026 14:57:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=dk201812; bh=ncNj+cGXELQYzYgS6T0Igmt
 Gd37oPAPAP6Oqw0nuRsw=; b=NiWput+kinztGUQCRcgkwqT1DzIPT5xTvX23V2V
 BmH1xrkSgiQsshcyjwHiKoMrRVH3HHAK2oN11AMPKa8yUE++8eA6Q6oqKtO3/TrX
 kRI/OZN4YbMxfFvmGXuyFA5WwRsEhBvEr4XYwlEa7Og7XiKRsm0oNR6U849xkoYm
 K4AswjLLMxPhjDt+vuGmWB2Y0fyFYF7Kyw3yQCSLXcaAWQRsivmMLk9O1yMC2Eia
 G/2CTlgnDSwGXq+hu2HWp2yPbvPc8ozHMFCCao06U0HeK088CpGa8FYGdxtvg+am
 O3FQ/buEVPUdE9TkcLwUhGgtLuEeG5kpei2xUlbX1Qpb9bw==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4bkdwqjpys-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jan 2026 14:57:38 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.4.28) by HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 14 Jan 2026 14:57:36 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Wed, 14 Jan 2026 14:57:21 +0000
Subject: [PATCH] drm/fb-helper: Add force parameter to stub function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260114-drm-fb-helper-stub-fix-v1-1-3a1934b42c93@imgtec.com>
X-B4-Tracking: v=1; b=H4sIANCuZ2kC/x2MQQqAIBAAvxJ7bkEtCvpKdMhca6Es1opA+nvSc
 QZmEkQSpghdkUDo5sh7yKDLAqZlDDMhu8xglGmU1jU62dBbXGg9SDCel0XPD6rKq9Y6Y6nRkON
 DKOt/3A/v+wET4EV8aAAAAA==
X-Change-ID: 20260114-drm-fb-helper-stub-fix-03f07bd2be61
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jocelyn Falempe
 <jfalempe@redhat.com>
CC: Frank Binns <frank.binns@imgtec.com>, Karolis Mituzas
 <karolis.mituzas@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1188;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=Pvucvy+HrWrccZu3X4vPaPzqlm1afakhqZrmd8BlMX8=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMWSmr3ug76zY1ae//Pj0vyk1SlqekbV3j19p6r/jPkvfa
 ePKkLX7OkpZGMQ4GGTFFFl2rLBcofZHTUvixq9imDmsTCBDGLg4BWAivxMY/lflnbz6aSrXwzNH
 nqYdU2E+37Mt0NgiK0FpzYFLJhJO1Y+AKqbPPqJ0/evBksCbsy5Nia9XmLCBaf/2Pw7Tn0447jL
 nGRMA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.4.28]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEyNSBTYWx0ZWRfX6SD5lR9s+7EG
 libWm+T2dkhivFl/nmUt3VwCvhuXf9NNpVC5vxkmpWgoTWy/1Qo6EhlEnRJJ92dM3HM4dncN1+J
 +stni+BkN6ZuG3lNfX+r70I6g8HqM/WKP3sdEhwSLkBoKTStJ9ZrVI8Tk6nVdbhsGcuhPz0i1uP
 Gf3E64oppFt0DYbukq5PDdNUng15Gz38z8soEHfK6qjh4ekW5IM1dGEJjCVIB0yQDDQCI/H4tgp
 U8gD7fUCQpDZs2hNJcjq80G9q3ttfKAALHpoCZhL60SUHzxmYfsmpDKitkDywYH+bhxHc2/gGJq
 uvIPq7smXvhYdUZvwVRieCi93i18MK0IFOKjNsp/YdP7s+lElkrG0OopmzdbsnD9rsQKXQM9bIs
 bRW0/VhPUibUHsSsp5ocnLT/3TMTOAu43GP6JDYYx0fHWrvJn3JR1UNlL8z+Kvf1cyxKgzod13y
 vGNNHacMkM3yCj+DgxQ==
X-Authority-Analysis: v=2.4 cv=OdCVzxTY c=1 sm=1 tr=0 ts=6967aee2 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=CzDp7rjNS_MA:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=r_1tXGB3AAAA:8 a=xX4eXBEwZkmTL3rznbUA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: 4b31vVVupbyiLfnnRWBTn5RwzmOc10Im
X-Proofpoint-GUID: 4b31vVVupbyiLfnnRWBTn5RwzmOc10Im
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

The signature of drm_fb_helper_restore_fbdev_mode_unlocked() was modified
in commit 943240d342f14 ("drm/client: Pass force parameter to client
restore") to add a force parameter, but this was not added to the stub
equivalent for when CONFIG_DRM_FBDEV_EMULATION is not enabled.

Suggested-by: Karolis Mituzas <karolis.mituzas@imgtec.com>
Fixes: 943240d342f14 ("drm/client: Pass force parameter to client restore")
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
 include/drm/drm_fb_helper.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index dd9a18f8de5a7..eebb36a099698 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -333,7 +333,8 @@ static inline int drm_fb_helper_check_var(struct fb_var_screeninfo *var,
 }
 
 static inline int
-drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper)
+drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper,
+					  bool force)
 {
 	return 0;
 }

---
base-commit: b91a565ed14fcf900b4d95e86882b4b763860986
change-id: 20260114-drm-fb-helper-stub-fix-03f07bd2be61

