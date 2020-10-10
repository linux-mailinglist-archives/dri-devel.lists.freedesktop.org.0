Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5D128A0F0
	for <lists+dri-devel@lfdr.de>; Sat, 10 Oct 2020 19:01:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B8BB6E090;
	Sat, 10 Oct 2020 17:01:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F5D86E090
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Oct 2020 17:01:04 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09AH11lo048844;
 Sat, 10 Oct 2020 12:01:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1602349261;
 bh=SfgjGEHYpXLPpSJOKLHqjJmQVAc7p+uhV71h6O24abA=;
 h=From:To:CC:Subject:Date;
 b=LlFdruq6Bj3G+YXMeCd90QEWU/dcZuTRorgX6IH+3OpjJWquZsiIF6xCAjee3Ntnh
 LMzg3NoqZdvTdagRLXao9ntdRbLFn+k6A3uyWlbf5+hTTUP0bLh2H7W+jQI+52CVGd
 NYWTvJzebOlS4t9f5ryZiLt4ctCWC640Xc/zvRM8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09AH11Qs036813
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 10 Oct 2020 12:01:01 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sat, 10
 Oct 2020 12:01:01 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sat, 10 Oct 2020 12:01:01 -0500
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09AH0xKJ012138;
 Sat, 10 Oct 2020 12:01:00 -0500
From: Jyri Sarha <jsarha@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 0/2] drm/tilcdc: Couple of minor feature improvements
Date: Sat, 10 Oct 2020 20:00:57 +0300
Message-ID: <cover.1602349100.git.jsarha@ti.com>
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

Since v2:
- "drm/tilcdc: Remove tilcdc_crtc_max_width(), use private data"
 - Add reviewed-by tag
 - fix:
   -:106: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
   #106: FILE: drivers/gpu/drm/tilcdc/tilcdc_drv.c:289:
   +       if (of_property_read_u32(node, "max-pixelclock",
   +                                       &priv->max_pixelclock))

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
