Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0128B1F82A9
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jun 2020 12:18:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F386E3EE;
	Sat, 13 Jun 2020 10:17:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [62.157.118.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C68E6E161
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 12:42:29 +0000 (UTC)
IronPort-SDR: 6QnX83bhfwIv1Z4tDtveh3u1j+WPRJSeVorbP4ncaFK7bSs2xiFNRcwRO3k9bf4cQL7Ddc9+Mg
 5NEVUUJhPX1VK/OqH1BJEcC7rxmIlb58UtfsMbTkGAUH4V1uIv1c5bhU6mcrriZVvVtTMbbuLS
 iuP6W8EmamhTz8ZTRrkvtOuCkVQ6EyewwObkjjnS40PWNs/WiwPY5KDIbElAA6tZZxkBe+btlz
 uLeI5k8uidrcJ7kUBvTIUI8AeTHjLDutNZ8DryAf1tJYGaMBJUj1UE6ZAioLOMIXh7xc/WYeEW
 bFQ=
X-IronPort-AV: E=Sophos;i="5.73,499,1583190000"; d="scan'208";a="12649663"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 11 Jun 2020 14:42:26 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Thu, 11 Jun 2020 14:42:26 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Thu, 11 Jun 2020 14:42:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1591879346; x=1623415346;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=NNs0T11lkBWKAhTjjHyrxpI0XkkykM9XmH661Mwcs88=;
 b=fsSJ58/e22UxJjae6B/e+653HRdwf+MJkgD6XeYgUvzenlr8yd1Iwnvl
 SWMmzngtJXiHU0VM+f6pxi2wqPosDIbr06519xGBGZIglgfBqSiLGYAFW
 PU4LvttKDlGjNdM5Z2Eid3EoirLCXCQZfRZgwsTQRuo88BQINQhnpqz2D
 s5p1zcFJ297u/RM5xIsggGF9O4d7hJELbqZ6/5JPgXWvP7YnHL0bf1KGD
 HeIbrrPC0xmseUNi+02d4mnpZhQRuuslD82QIBswOD5aAcyL1Zc/hIQyd
 aecqV4YEoRYpnDD37SCQlQ+Uc/wi37oOm+GpVgUZlWSQFkvC09XXM7M2S Q==;
IronPort-SDR: F1rP2yFbODOsrNpGQkIWoLiPAoNvfFGTscZcMgcDODq9xCNSgQ3dC4mItNoE3q44WXCBL3AeAC
 YipbP3XCn4HVo1eZ7ca/LCkFUX1z+Aa4z/TU8TF/buEBAedJh6fpd+KmIPU/RBHaPvXZjX/dzE
 bFoMEDYqmyMCeKOfva698cC5jNWeynZ6jNeiu7YaLaL5lvozQrxDRnidzaH7L4w5BprslgParq
 OQvAF1c0hWu8dZJWoe/p9Tq44+fT+HeyCn/X9s6cHLY9x8yYXkcS+IZ4kh/Qw4OJecmD9xmRa8
 Jys=
X-IronPort-AV: E=Sophos;i="5.73,499,1583190000"; d="scan'208";a="12649662"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 11 Jun 2020 14:42:26 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de
 [10.117.49.26])
 by vtuxmail01.tq-net.de (Postfix) with ESMTPA id B77A4280065;
 Thu, 11 Jun 2020 14:42:27 +0200 (CEST)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 1/4] dt-bindings: display: simple: add CDTech
 S070PWS19HP-FC21 and S070SWV29HG-DC44
Date: Thu, 11 Jun 2020 14:42:06 +0200
Message-Id: <20200611124209.25028-1-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200610120131.3069-1-matthias.schiffer@ew.tq-group.com>
References: <20200610120131.3069-1-matthias.schiffer@ew.tq-group.com>
X-Mailman-Approved-At: Sat, 13 Jun 2020 10:16:46 +0000
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
Cc: devicetree@vger.kernel.org,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the CDTech Electronics displays S070PWS19HP-FC21 (7.0" WSVGA) and
S070SWV29HG-DC44 (7.0" WVGA) to the panel-simple compatible list.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---

v2: no changes

 .../devicetree/bindings/display/panel/panel-simple.yaml       | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 31e3efc73e00..2ddb520edc6d 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -81,6 +81,10 @@ properties:
       - boe,nv140fhmn49
         # CDTech(H.K.) Electronics Limited 4.3" 480x272 color TFT-LCD panel
       - cdtech,s043wq26h-ct7
+        # CDTech(H.K.) Electronics Limited 7" WSVGA (1024x600) TFT LCD Panel
+      - cdtech,s070pws19hp-fc21
+        # CDTech(H.K.) Electronics Limited 7" WVGA (800x480) TFT LCD Panel
+      - cdtech,s070swv29hg-dc44
         # CDTech(H.K.) Electronics Limited 7" 800x480 color TFT-LCD panel
       - cdtech,s070wv95-ct16
         # Chunghwa Picture Tubes Ltd. 7" WXGA TFT LCD panel
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
