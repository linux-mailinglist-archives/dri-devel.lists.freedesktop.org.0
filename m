Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFBB13BECE
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 12:46:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F2406E92E;
	Wed, 15 Jan 2020 11:46:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63FA16E923
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 11:46:01 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00FBjtDc039172;
 Wed, 15 Jan 2020 05:45:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1579088755;
 bh=XUYcuVswJdw9DYiE9R2CTyQZnrE8jxwn4oUjT5xgvBU=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=e00Ip39t9UvKn0uFQLj1QzkDK4UWory+VRizYB7vvirbIyvHKRrF7q/VYxcX0zNeS
 QCN24sFTL78RSvqvuGqieie7Ib/4df4pR4c2SU/XrgNCWFbiUenEqzs+fvp6VrtXAR
 EHYa+Z8TR5WbbqirmipdvP9/i3LyCQk6hLepOE8I=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00FBjttP099738
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 15 Jan 2020 05:45:55 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 15
 Jan 2020 05:45:55 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 15 Jan 2020 05:45:55 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00FBjdgW054185;
 Wed, 15 Jan 2020 05:45:52 -0600
From: Jyri Sarha <jsarha@ti.com>
To: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v6 5/5] MAINTAINERS: add entry for tidss
Date: Wed, 15 Jan 2020 13:45:39 +0200
Message-ID: <36e19f49cd0ea3cc215d30a76273a05aaa07846d.1579086894.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579086894.git.jsarha@ti.com>
References: <cover.1579086894.git.jsarha@ti.com>
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
Cc: yamonkar@cadence.com, praneeth@ti.com, peter.ujfalusi@ti.com,
 tomi.valkeinen@ti.com, laurent.pinchart@ideasonboard.com, sjakhade@cadence.com,
 sam@ravnborg.org, maxime@cerno.tech
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

Signed-off-by: Jyri Sarha <jsarha@ti.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 741e3f433f6e..e89fbfb1ce06 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5559,6 +5559,17 @@ S:	Maintained
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
