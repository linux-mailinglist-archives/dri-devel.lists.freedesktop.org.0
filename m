Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 486AB1F62F4
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 09:54:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF0F26E897;
	Thu, 11 Jun 2020 07:54:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [62.157.118.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 118276E0F1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jun 2020 12:08:53 +0000 (UTC)
IronPort-SDR: J/gN24/4kJBxEitJluGVskRJnfAnmDih90Y0DwLPqEjxutALrF5SM/q1gaqBGWci1K3Fjkp37t
 OgRl1GZ6RzjkmBdqY1jpJNWKNdSVWOC5O6R4sDtNhzH29DYjqtYzRJHLhV9czrvrpjLjCLRza6
 7q3F3bd4hD3fd7ZLZUBEtriWB6Vw1+DJCu4gC9EfESuRpsKEV9Jkk6palhEj6cUc1x1XevO8DZ
 GSgaAyMriU9buQ+1MtmE7K+SBonGs7bpT8HHxgFY7fmyOnezlv+gFCFsnRW1XgtCTu9batpOh6
 HZo=
X-IronPort-AV: E=Sophos;i="5.73,495,1583190000"; d="scan'208";a="12636788"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 10 Jun 2020 14:01:39 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Wed, 10 Jun 2020 14:01:39 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Wed, 10 Jun 2020 14:01:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1591790499; x=1623326499;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=aj/H469Jt70amsuUxn3Zl8xKL2aJcivGiaakRkzzSjg=;
 b=deoySOevSLvQWgCq5cDHpnvMSK9UBgwrWn3kOLsdQDCTIK92tZuhlC5w
 kClwRl/JoToHfbpTKOeKYv+lojUiRPFWL2Mta+M52XzzEadMg8eZyjvl0
 V6NI+Kz2qFjOHLpC1hAAC7NdVsByV2K3GYtHJvzsLVKtO7fNfZfjxgdfA
 I0aTY1HIZM8aRKNs/pBmxKGJrTejbICsq3N7lSNV3/5YWbvJ1k7xxmfKG
 1hIoHyK/voAY9C4uur+kwWwL32E8GOhvCzNjVdoVTRV1iRxDmwV14I/e1
 im5ymosLNL2ni0h0+P6gZdcwWUs7kYCCp+mywB7gwTFZnYmfoZCju61Ki A==;
IronPort-SDR: JZeBKhHvGM6ayU5TktaAXaP9iBQsvnkagSSTfwd4mbsTJz09lJxwjfW6Zv1F86bJDqfZ98crCh
 fGlgL0lELqCf/7wzXHxDW9p5OQrqTi2sJQUXw3Dm3AZEt+eUb1kuqEiHFdLe18MZYTpiTN2JJi
 klbSj2Krmo+xBqdbuN8nBTfcLGig7uDj6W3ko7CcdYLajOaP9V9fjB4BTVgIL5zv4+l+ZbQCoi
 iZ7sFKYUGiVePUhl9HqmyLXFaGcLA0rZlpKNvv64h/Ln4oGZQ9jXer0/4Upx6jzzHXRMD7iRzS
 9QY=
X-IronPort-AV: E=Sophos;i="5.73,495,1583190000"; d="scan'208";a="12636786"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 10 Jun 2020 14:01:39 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de
 [10.117.49.26])
 by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 65E12280075;
 Wed, 10 Jun 2020 14:01:39 +0200 (CEST)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/4] dt-bindings: display: simple: add CDTech S070PWS19HP-FC21
 and S070SWV29HG-DC44
Date: Wed, 10 Jun 2020 14:01:28 +0200
Message-Id: <20200610120131.3069-2-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200610120131.3069-1-matthias.schiffer@ew.tq-group.com>
References: <20200610120131.3069-1-matthias.schiffer@ew.tq-group.com>
X-Mailman-Approved-At: Thu, 11 Jun 2020 07:54:02 +0000
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
 .../devicetree/bindings/display/panel/panel-simple.yaml       | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index d6cca1479633..7749fbd14c6f 100644
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
