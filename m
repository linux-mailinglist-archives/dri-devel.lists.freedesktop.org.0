Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF1613FB0C
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 22:06:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A11E6E291;
	Thu, 16 Jan 2020 21:06:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17DCF6E291
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 21:06:22 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00GL6IUU088314;
 Thu, 16 Jan 2020 15:06:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1579208778;
 bh=vYA+wvvgu2+aVUd78cyvNM3+t7Cx6lfmscrZXxzmqic=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=HgJQIB6vAjWsATme2AAO6LWTC+t2gUwqcbJdA1zC2buTHZTrh/J+g1NaU0Yf4Hh5t
 ENolx5RxS8WwBbaxfAeq8ygOFKC+BhSpaQfLSB7hHLUR7ar33bsXvG3HJ9kU8gcW4I
 EgwradSgAzVerejY6ljsc3LwlBxxZUr7C6DzClEc=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00GL6ISA050989;
 Thu, 16 Jan 2020 15:06:18 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 16
 Jan 2020 15:06:17 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 16 Jan 2020 15:06:16 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00GL60ie107315;
 Thu, 16 Jan 2020 15:06:14 -0600
From: Jyri Sarha <jsarha@ti.com>
To: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v7 5/5] MAINTAINERS: add entry for tidss
Date: Thu, 16 Jan 2020 23:06:00 +0200
Message-ID: <a8d5b5dfad831b780d6d2639bd291089c4c5b0a9.1579202260.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579202260.git.jsarha@ti.com>
References: <cover.1579202260.git.jsarha@ti.com>
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
Cc: yamonkar@cadence.com, praneeth@ti.com, sjakhade@cadence.com,
 robh+dt@kernel.org, peter.ujfalusi@ti.com, tomi.valkeinen@ti.com,
 laurent.pinchart@ideasonboard.com, subhajit_paul@ti.com, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add entry for tidss DRM driver.

Version history:

v2: no change

v3: - Move tidss entry after omapdrm
    - Add "T:     git git://anongit.freedesktop.org/drm/drm-misc"

v4: no change

v5: no change

v6: no change

v7: no change

Signed-off-by: Jyri Sarha <jsarha@ti.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index aa9add598b7d..d8f65dc1dde8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5630,6 +5630,17 @@ S:	Maintained
 F:	drivers/gpu/drm/omapdrm/
 F:	Documentation/devicetree/bindings/display/ti/
 
+DRM DRIVERS FOR TI KEYSTONE
+M:	Jyri Sarha <jsarha@ti.com>
+M:	Tomi Valkeinen <tomi.valkeinen@ti.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+F:	drivers/gpu/drm/tidss/
+F:	Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
+F:	Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
+F:	Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+
 DRM DRIVERS FOR V3D
 M:	Eric Anholt <eric@anholt.net>
 S:	Supported
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
