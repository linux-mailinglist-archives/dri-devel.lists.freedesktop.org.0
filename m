Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B00321F62F5
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 09:54:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4026E89B;
	Thu, 11 Jun 2020 07:54:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [62.157.118.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D51A86E0F1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jun 2020 12:08:54 +0000 (UTC)
IronPort-SDR: mUmeoboEu3vDQMJ8IwQQcgidPHNARVYQUZAgV0JlBUJSNHbstWTtvef2vX8zH3b9fju8aTr2Lv
 4CK2yTS0HrNMXyOx7VNBZtHGKfqU/Yk2lDNe+Fwz7rF9dKMBpMoXSxEwvLdPl+TZsYt29qURX7
 udHLmuS8umsIduWvPmDV2r8GHo6OAoSPxXkDpjtZGl5aCTYAFkNe2SNm3J9X3HHbbbWL9tpq3t
 hyWJJuZmnGH3FgHiy6T6l8ZWxlMpotIeTW0gVcWGgJ+5yaF934gPisdZQcSuB9ElYDLFb/jFuP
 REA=
X-IronPort-AV: E=Sophos;i="5.73,495,1583190000"; d="scan'208";a="12636792"
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
 bh=PDXAYXZawwVFkPqDUx8c9ur4W53kvMuf6DO86ph2FQQ=;
 b=b91mw2NqybIx8rJT/kmnS3ILhd8IFtRN4JLBTQt+tM4zU8AAp/KamAkm
 sVmQe0JyaA19/mDbIipFOEsz88oCayI3BpRieuool1fzQvnI8HFnEtkjv
 rNTPV6iGQYbPQO7V0tlcIIqHz8xYwl/t/1grBoIsH4JmS+EkI3y1o/ldq
 GyHGeRo+ff7EVE7DApH60n5+/e6fNkJ755cfoDNXRKVzWQIzWlqqLus2m
 ItnMG3L3nwAloXr/cZSk6SUmXtKU4hmYxrtNVgpGafMkfSGZHJHQOCc1w
 +Eu8kWBhPR/eABv77xAV+tzBmdJ+LDdqEYrd7SrxeGPfLFd5VYKsjzbsU Q==;
IronPort-SDR: V9itYVaEPJgwGTGrseKjJ4gDL/y7xrzI0RTw5Ha8K2OfibaiBDH5fW1BraekSWQC+r3qQznDA7
 cFoPIwDHD38e5YggBHkUthAOvoH5RZO/izMGK9kxnwx7/JGJU8SOmbQGNsAK8ZjOHx9KQaVdfR
 U0UgZYuhpJ+LJj6k0m7XqFzrsYAk268BqZijMPTo9zJ30f0f3P23cBybUzbMfRuAdH5zyczM61
 dAQnfMVeB6B8aSJlfjYK21p4hjbBxqKBtQcVuzjvERXrMkfzxiAqkph+d30uqG49F0j7vtLvgW
 aes=
X-IronPort-AV: E=Sophos;i="5.73,495,1583190000"; d="scan'208";a="12636789"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 10 Jun 2020 14:01:39 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de
 [10.117.49.26])
 by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 996B5280065;
 Wed, 10 Jun 2020 14:01:39 +0200 (CEST)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 2/4] dt-bindings: display: simple: add Tianma TM070JVHG33
Date: Wed, 10 Jun 2020 14:01:29 +0200
Message-Id: <20200610120131.3069-3-matthias.schiffer@ew.tq-group.com>
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

Add the Tianma Micro-electronics TM070JVHG33 7.0" WXGA display to the
panel-simple compatible list.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 7749fbd14c6f..3d5edef2ebad 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -249,6 +249,8 @@ properties:
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
