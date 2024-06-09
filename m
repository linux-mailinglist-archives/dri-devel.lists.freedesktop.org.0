Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 881AB901727
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2024 19:20:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D7710E1D9;
	Sun,  9 Jun 2024 17:20:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ne7+itJP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7649910E1D9
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jun 2024 17:20:37 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 459Dvjc6007933;
 Sun, 9 Jun 2024 17:20:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=QmTFdlGWYyA/ILag9RXZOE
 j0+0c5s9ALptIYs4JMCQo=; b=ne7+itJPDvWoA4KGL/9jKKo4MoISx+tLOfnvtw
 8HmNUxh3jIGuzPAV3ittmRaKooqFSS7WxTjapjM2GGStC5Sz/405ftBNkCv5exMy
 GW/I1kkQq/ZXJ4SbdN/al4SRVdaZvYH4NwF11Gt8q9VxJ7jNx1REEsKlzYfZkhW1
 Z67+glk0t6uCYNXdOZeK0eExpCRVKPcFpqZahcvrkpJdtYDENTM4CK0GIb/18wFG
 hTvIjjq5k81vOT9Hwu9rFZqm9rZqVy8u+EdTvY5XIYpYmjkFNJ/AI0eFOY9j3Vg9
 fMKZnCBpJoWhmzlXmmBpNP77b/VF8sLV9+RZGtrp5TLv0GbQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymemghy5a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 09 Jun 2024 17:20:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 459HKTog004295
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 9 Jun 2024 17:20:29 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 9 Jun 2024
 10:20:28 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Sun, 9 Jun 2024 10:20:27 -0700
Subject: [PATCH] drm/tiny: add missing MODULE_DESCRIPTION() macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240609-md-drivers-gpu-drm-tiny-v1-1-6905fe4ada50@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAFrkZWYC/x3MQQ6CQAyF4auQrm0ygKJ4FeNiYAo0cUbSAsEQ7
 k5x977F+zdQEiaFZ7aB0MLK32TILxm0g089IQczFK64usrVGAMG4YVEsR9n2xEnTj/0ZXl3+aP
 ubpUDe49CHa//8uttbrwSNuJTO5y9D6d5xeh1IoF9PwAx38zJiAAAAA==
To: Gerd Hoffmann <kraxel@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, "Hans de Goede" <hdegoede@redhat.com>
CC: <virtualization@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>, "Jeff
 Johnson" <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: QT3iqX2zLqdwJZM9mFcQzj5MnZEEMNwf
X-Proofpoint-ORIG-GUID: QT3iqX2zLqdwJZM9mFcQzj5MnZEEMNwf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-09_13,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 malwarescore=0 mlxscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406090135
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

make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tiny/bochs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tiny/cirrus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tiny/gm12u320.o

Add the missing invocations of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/gpu/drm/tiny/bochs.c    | 1 +
 drivers/gpu/drm/tiny/cirrus.c   | 1 +
 drivers/gpu/drm/tiny/gm12u320.c | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index c23c9f0cf49c..d15f4d3baeab 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -736,4 +736,5 @@ drm_module_pci_driver_if_modeset(bochs_pci_driver, bochs_modeset);
 
 MODULE_DEVICE_TABLE(pci, bochs_pci_tbl);
 MODULE_AUTHOR("Gerd Hoffmann <kraxel@redhat.com>");
+MODULE_DESCRIPTION("DRM Support for bochs dispi vga interface (qemu stdvga)");
 MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index 4e3a152f897a..89484f7084bd 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -760,4 +760,5 @@ static struct pci_driver cirrus_pci_driver = {
 drm_module_pci_driver(cirrus_pci_driver)
 
 MODULE_DEVICE_TABLE(pci, pciidlist);
+MODULE_DESCRIPTION("Cirrus driver for QEMU emulated device");
 MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index 0187539ff5ea..07c6640022c2 100644
--- a/drivers/gpu/drm/tiny/gm12u320.c
+++ b/drivers/gpu/drm/tiny/gm12u320.c
@@ -755,4 +755,5 @@ static struct usb_driver gm12u320_usb_driver = {
 
 module_usb_driver(gm12u320_usb_driver);
 MODULE_AUTHOR("Hans de Goede <hdegoede@redhat.com>");
+MODULE_DESCRIPTION("GM12U320 driver for USB projectors");
 MODULE_LICENSE("GPL");

---
base-commit: 19ca0d8a433ff37018f9429f7e7739e9f3d3d2b4
change-id: 20240609-md-drivers-gpu-drm-tiny-a3370189f560

