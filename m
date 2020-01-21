Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EC9144D2A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 09:21:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14DE689740;
	Wed, 22 Jan 2020 08:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36DC16EBD7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 08:29:29 +0000 (UTC)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00L8Re4d005791; Tue, 21 Jan 2020 03:29:05 -0500
Received: from nwd2mta4.analog.com ([137.71.173.58])
 by mx0a-00128a01.pphosted.com with ESMTP id 2xkyta6spf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jan 2020 03:29:05 -0500
Received: from SCSQMBX11.ad.analog.com (scsqmbx11.ad.analog.com [10.77.17.10])
 by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 00L8T2vE052554
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
 verify=FAIL); Tue, 21 Jan 2020 03:29:03 -0500
Received: from SCSQMBX10.ad.analog.com (10.77.17.5) by SCSQMBX11.ad.analog.com
 (10.77.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Tue, 21 Jan
 2020 00:29:01 -0800
Received: from zeus.spd.analog.com (10.64.82.11) by SCSQMBX10.ad.analog.com
 (10.77.17.5) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Tue, 21 Jan 2020 00:29:00 -0800
Received: from btogorean-pc.ad.analog.com ([10.48.65.146])
 by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 00L8Sm9Z001010;
 Tue, 21 Jan 2020 03:28:50 -0500
From: Bogdan Togorean <bogdan.togorean@analog.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 0/3] drm: bridge: adv7511: Add support for ADV7535
Date: Tue, 21 Jan 2020 10:27:18 +0200
Message-ID: <20200121082719.27972-1-bogdan.togorean@analog.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-21_02:2020-01-20,
 2020-01-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 phishscore=0 mlxlogscore=913 mlxscore=0 suspectscore=1
 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001210072
X-Mailman-Approved-At: Wed, 22 Jan 2020 08:21:10 +0000
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
Cc: mark.rutland@arm.com, robdclark@chromium.org, jernej.skrabec@siol.net,
 narmstrong@baylibre.com, airlied@linux.ie, gregkh@linuxfoundation.org,
 jonas@kwiboo.se, wsa+renesas@sang-engineering.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, alexander.deucher@amd.com,
 tglx@linutronix.de, sam@ravnborg.org, matt.redfearn@thinci.com,
 Bogdan Togorean <bogdan.togorean@analog.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch-set add support for ADV7535 part in ADV7511 driver.

ADV7535 and ADV7533 are pin to pin compatible parts but ADV7535
support TMDS clock upto 148.5Mhz and resolutions up to 1080p@60Hz.

---
Changes in v4:
 - get out ADV7533 v1p2 voltage selection of this patch set
 - removal CONFIG_DRM_I2C_ADV7533 from Kconfig moved to new commit

Bogdan Togorean (3):
  drm: bridge: adv7511: Remove DRM_I2C_ADV7533 Kconfig
  drm: bridge: adv7511: Add support for ADV7535
  dt-bindings: drm: bridge: adv7511: Add ADV7535 support

 .../bindings/display/bridge/adi,adv7511.txt   | 23 ++++++-----
 drivers/gpu/drm/bridge/adv7511/Kconfig        | 13 ++----
 drivers/gpu/drm/bridge/adv7511/Makefile       |  3 +-
 drivers/gpu/drm/bridge/adv7511/adv7511.h      | 40 +------------------
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c  | 20 +++++-----
 5 files changed, 26 insertions(+), 73 deletions(-)

-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
