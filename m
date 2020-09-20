Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4352D271635
	for <lists+dri-devel@lfdr.de>; Sun, 20 Sep 2020 19:10:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A04696E08A;
	Sun, 20 Sep 2020 17:10:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 628 seconds by postgrey-1.36 at gabe;
 Sun, 20 Sep 2020 17:10:33 UTC
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C319E6E08A
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Sep 2020 17:10:33 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08KH015c065064;
 Sun, 20 Sep 2020 12:00:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600621201;
 bh=jDtjElGIQszP55sdh5J6GlLnVH8ecsGjcqGKVnJTk6w=;
 h=From:To:CC:Subject:Date;
 b=L9CJS+nPOXEK0e3ivydEL6BI9FDOWMPgRQV2yOTJ/H9FCut8I21k0Yy/mzY2QzeBQ
 Q6eEmRI+FKla0xfwHEp5yB0ayg+yYwgjOUYEsgGOTi9if3wgnbG4gizVuaHw+8GFsY
 WylLMxzxKjjIOGZ9MN+K5Ut5uHrjEgzGlCHDv4xE=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08KH01ic127204
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sun, 20 Sep 2020 12:00:01 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sun, 20
 Sep 2020 12:00:00 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sun, 20 Sep 2020 12:00:01 -0500
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08KGxxja005978;
 Sun, 20 Sep 2020 12:00:00 -0500
From: Jyri Sarha <jsarha@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 0/2] drm/tilcdc: Couple of minor feature improvements
Date: Sun, 20 Sep 2020 19:59:56 +0300
Message-ID: <cover.1600618063.git.jsarha@ti.com>
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

Since first version. 
- "drm/tilcdc: Do not keep vblank interrupts enabled all the time"
  - Add reviewed-by tags
- "drm/tilcdc: Remove tilcdc_crtc_max_width(), use private data"
  - Put TILCDC_DEFAULT_MAX_WIDTH_V1 before *_V2 and


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
