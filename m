Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C937E1F82A3
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jun 2020 12:17:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D4D6E409;
	Sat, 13 Jun 2020 10:17:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [62.157.118.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A426E161
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 12:42:30 +0000 (UTC)
IronPort-SDR: TIOjdQpI7EX4mYTl6bOiqmqLxd3sKOM0UkEt3jLqwCq+X7XoAYx3fKaNKm/53Iiav8CiekTdOV
 hiPVKR5mRP5eAjrkmyJlvvry6fJvUyUxPj3njpWrsFT2GXmXvZmp16QzIGWcrj7yINK3hl5zMH
 FHRuzZWDCYh6tWHHzi675Q88Uo9qO0poCdJKuw0wojGC40wC/60T2fOpt1jjEistKaPSvmRi7u
 dlc5FaWiSSmUy2wsqLAWpKTtk4dTGMdCSS7bCxttoCWz2mwG/Z3FYiYb89YFnel/NUi/eMB1Qy
 3DQ=
X-IronPort-AV: E=Sophos;i="5.73,499,1583190000"; d="scan'208";a="12649665"
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
 h=from:to:cc:subject:date:message-id;
 bh=+2RXMPGnWi9PFwcXzBsGtjQvnkutWbl2BGcACrG6Fe0=;
 b=Fpc9HtUmTObOSv3/RvejS9Kmv2/r64NFCl5PKuHLk1En9S3oJj8dViaA
 WETZe6BmOltfSn7HZrgmCtaDRgUnySBqAiEhpuQU9nPMvHhCexhyCrymB
 gYzSYbdPWnr+qB3FCwDOYx6HK5EfAV0DZ7bGNX6bx39oMRlRJz4SUQLFC
 zVpbZlMyaSDeipQo9wZZp1vWf5PpR9UUr0raqo1uLf2affJoOEH4OZwxF
 u9r5WoZ/YYCP1t/sb9h7sud9YvN7R+wkdjmODK7ojl0TM01zq9mAo5EEi
 BdKS+YNH45s9HAj15Sfr1c0HL0vEPO27yg4+Xziz3HkB31EetdkZEKiUO g==;
IronPort-SDR: v1GgtVD97D+jfWVsgX8naYKvRTrX6R5wwmOUH2+2K3tuckV6ElLCS5eP5zZm7SOA2+uTE65u7l
 pgDJBlirfZSLovZrIL/ESyFOm6g6FYwdYq3EddT8+kvmHcBD0IwvwGQk5uQ8ss/uRix7Y/kHWg
 YmhdcpbBEADBk56vy8WQ8kmJpVunmmdXZD94QQA/YYnrqirVAldBsoeAx7amEVzhQrIQnLop+M
 8I57WNCyldH6J2oy3LSgLGOKhlJzQs2hLsSrmFpkRZXWIumxoeF7sghYt2RYDLmu0jvXn5pVq5
 UjU=
X-IronPort-AV: E=Sophos;i="5.73,499,1583190000"; d="scan'208";a="12649664"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 11 Jun 2020 14:42:26 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de
 [10.117.49.26])
 by vtuxmail01.tq-net.de (Postfix) with ESMTPA id EC913280075;
 Thu, 11 Jun 2020 14:42:27 +0200 (CEST)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 2/4] dt-bindings: display: simple: add Tianma TM070JVHG33
Date: Thu, 11 Jun 2020 14:42:07 +0200
Message-Id: <20200611124209.25028-2-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200611124209.25028-1-matthias.schiffer@ew.tq-group.com>
References: <20200611124209.25028-1-matthias.schiffer@ew.tq-group.com>
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

Add the Tianma Micro-electronics TM070JVHG33 7.0" WXGA display to the
panel-simple compatible list.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---

v2: no changes

 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 2ddb520edc6d..6deeeed59e59 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -251,6 +251,8 @@ properties:
       - starry,kr122ea0sra
         # Tianma Micro-electronics TM070JDHG30 7.0" WXGA TFT LCD panel
       - tianma,tm070jdhg30
+        # Tianma Micro-electronics TM070JVHG33 7.0" WXGA TFT LCD panel
+      - tianma,tm070jvhg33
         # Tianma Micro-electronics TM070RVHG71 7.0" WXGA TFT LCD panel
       - tianma,tm070rvhg71
         # Toshiba 8.9" WXGA (1280x768) TFT LCD panel
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
