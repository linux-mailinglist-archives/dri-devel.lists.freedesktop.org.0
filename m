Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 107FF268746
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 10:35:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE316E40B;
	Mon, 14 Sep 2020 08:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32DAB6E40B
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 08:35:04 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08E8Yrmq073096;
 Mon, 14 Sep 2020 03:34:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600072493;
 bh=OtUJw9pF0/V94gjsFe91EQ7kB6QMIBRd/w6benwAlu0=;
 h=From:To:CC:Subject:Date;
 b=jblw+EUDLQJaVhw/MrRvtOAueC2QAY0Pa0jNj8n1ugHnQecHI//O4BP/9HS5lGVNU
 DFedMAHLk2otSHMeYabFbWeoYBVJRjnUbdjmraO5xmvupQjg70JthRUfRY4cJBBHA/
 DwClzdlw5p/0KrTBuAM11EqG4im43nfNrZcKBzqw=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08E8YrES078826
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 14 Sep 2020 03:34:53 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 14
 Sep 2020 03:34:52 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 14 Sep 2020 03:34:52 -0500
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08E8YpKw095196;
 Mon, 14 Sep 2020 03:34:51 -0500
From: Jyri Sarha <jsarha@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/2] drm/tilcdc: Couple of minor feature improvements
Date: Mon, 14 Sep 2020 11:34:48 +0300
Message-ID: <cover.1600072407.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: tomi.valkeinen@ti.com, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The vblank interrupts have been always on when the display is on for a
very long time, so I decided that it is about time to fix it. Then the
following patch is just a cleanup.

BR,
Jyri

Jyri Sarha (2):
  drm/tilcdc: Do not keep vblank interrupts enabled all the time
  drm/tilcdc: Remove tilcdc_crtc_max_width(), use private data

 drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 52 ++++++++++++++++++----------
 drivers/gpu/drm/tilcdc/tilcdc_drv.c  | 38 +++++++++++---------
 drivers/gpu/drm/tilcdc/tilcdc_drv.h  |  7 ++--
 3 files changed, 59 insertions(+), 38 deletions(-)

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
