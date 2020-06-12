Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 414831F82C4
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jun 2020 12:18:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEE0D6E457;
	Sat, 13 Jun 2020 10:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [62.157.118.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 824A26E544
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 07:22:45 +0000 (UTC)
IronPort-SDR: kFzpo+SWmIZJxj+pgKObsPVPmC3Jj8KNADu68phuk6W+FpdCA0HLUCDiPugnNZkoTAFMqEvu/K
 Ga8jn09QtRxPc+xxaRVkS5bxBZxqD0CbIqUvbMDmTBidaL0oqrQNDl4+qepCK2tgRvK2n+TM5Q
 r0aD79RVjh51/tNjnmnIlQdl/IL1RntZ3+MNAKw+gGnaEaYqItI21VrtAj4FaxbbDfcdaSL8Gb
 e2dY9TyY6F7ZEQyqP7xjGFWzeCQUomf5qWmldrmlwq9kLZk0zhkDIw89IuinyF7RYg9xt/1wTd
 esU=
X-IronPort-AV: E=Sophos;i="5.73,502,1583190000"; d="scan'208";a="12657242"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 12 Jun 2020 09:22:40 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Fri, 12 Jun 2020 09:22:40 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Fri, 12 Jun 2020 09:22:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1591946560; x=1623482560;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=NNs0T11lkBWKAhTjjHyrxpI0XkkykM9XmH661Mwcs88=;
 b=jJWKxZAtX/MFwCEdKBeMGSUnL5o8q4z3eYyWY4HZi3y8M2xvQoBi6DkC
 4BsU1QbY5o0ECVVV/Km12qKQAb1b3ZkT0kvVVEqAvC3dloJ4n8xCy79D5
 3evrt1eg4Oz7jo/qH3A5DqyE+wlCuxehQ0vU7U5fEbIJOcg5l0VYTPnQf
 AUfqskSmwSiuewbvHinDMjCFkaWCznYLLf92DBKm7bzHnbCfxxeZpZG0C
 KBqxguGTpNRoDdWWGTLKUfxvPkgc6I47nk/M4G0GfktXqtk0LWMXmwMXt
 uUxiVra5md86+2oiUQuoF5/JkE4cYGFsOCJNSGuAWcsqbgLAfxFhXkK8H A==;
IronPort-SDR: Ll3CvXsfOq+gsZFdH9upLbZ6vZ9ic1wrsPaY9tc5ewEKmCZFVtWtuhrUaiREGhzJlvf7uLVf2t
 A4MEmnBPW9gVVtwLN11AQZ52GLEOlIgo0ZheO1+PgVAjDtRtOqz62r4DL0bnF50IYrNYHZE+n3
 fimtytJTFanfnzkzSsNBVa2WhwYs/xoAXbk8fJwqeWYNwhYvzcP3cUXmSTmcIAZJ3S/sVO8OzR
 7X/93zkl5/BmufXAV95ncLXtgNsokP7O4oypzEVWS/Z7U+wp4Hj4LTGvAxAeBcV63qdnyA5tM8
 Ijg=
X-IronPort-AV: E=Sophos;i="5.73,502,1583190000"; d="scan'208";a="12657241"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 12 Jun 2020 09:22:40 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de
 [10.117.49.26])
 by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 72E5B280075;
 Fri, 12 Jun 2020 09:22:40 +0200 (CEST)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH RESEND v2 1/4] dt-bindings: display: simple: add CDTech
 S070PWS19HP-FC21 and S070SWV29HG-DC44
Date: Fri, 12 Jun 2020 09:22:16 +0200
Message-Id: <20200612072219.13669-2-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200612072219.13669-1-matthias.schiffer@ew.tq-group.com>
References: <20200612072219.13669-1-matthias.schiffer@ew.tq-group.com>
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
