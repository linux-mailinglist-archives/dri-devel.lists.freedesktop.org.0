Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C41352374
	for <lists+dri-devel@lfdr.de>; Fri,  2 Apr 2021 01:24:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F02096E15D;
	Thu,  1 Apr 2021 23:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpcmd0876.aruba.it (smtpcmd0876.aruba.it [62.149.156.76])
 by gabe.freedesktop.org (Postfix) with ESMTP id 60AB16EDBC
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 23:24:24 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.168.220])
 by Aruba Outgoing Smtp  with ESMTPSA
 id S6YzlD4W1HTbyS6YzlYTd5; Fri, 02 Apr 2021 01:17:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1617319042; bh=JSvoWMS/fePUFcFpVRkBCt4jZ6UaCd8sEYjvfe8v38w=;
 h=From:To:Subject:Date:MIME-Version;
 b=hd5LhLrsSCsj5Q+rpeDeCfdscuOb56BYHurhjJZ8IVpI1+sqAMeCWMlrENzSVIObR
 VuF4DDFcEKlUx40D0oYg+IWTkajWVCIiKHvGGZF6s+6Z5YuQ1MM0hU+IRwg3FZXuCQ
 6dkaW9oAj8usTo9ch0zXo5NRuIl64aJJAxA1dg2stPqv86kQQA/iVzFwgVmvE9Xakf
 m4ESn5IueyoGNMG5q0/6YzfGjc2WWvviUIkM/tc/FP7U02922wkF3BrbOm53fupjEH
 0fYDLw+25pPCmXAegfr7xhbbUEwYaCtMZ+piEixFXM1ofic2gMBcuLohQbXy7gUDst
 zgxbKp5kgTdxw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 0/9] Add 4 Jenson simple panels
Date: Fri,  2 Apr 2021 01:17:11 +0200
Message-Id: <20210401231720.2470869-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210305234427.572114-1-giulio.benetti@benettiengineering.com>
References: <20210305234427.572114-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfOL9AQ4RcJL649SgpWxnuzzFzsY6X41cjGOyr1mDgbIcV3RK+zL7bNLpVfgTYd+Fq/MgpwJSKFTMyDYQ5sweB9MbYG7aPEPXB8VgXG8r8XAwEPxv7G07
 hUAQqG6AyHlCdSMDjG+6exQMKlCostH02aJfVN/kX7VzHnpikc+t/2/n1kNZKAETrqEDj9MmSWOPg3sr+fJUj+vDJPIqk56m7b0xA9FuuG6qjP5xhfbx/KYr
 bSlWdrS1F2vXwRTZU3PG6NQFG1WTEp+KicDyUt5OKYUfWDCzyBZgJbC7SN9Q7VWvKcjBzkvEQ9DTOHiWyB+AB6jfEJUvG/f4eVKYByQ6U2TkIWMPptWg1K9v
 2ii7tPwAd/ndIFSTGmhKiX8RYRVTmxndOxovzcOIXG6SeG7j5WYHqTGSzRc4snh1MnRMXZbTpqTx1YDkxBkhserR0vXBSbd7+YIVDw3nkhBI4EOQAuU=
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset introduce Jenson vendor and add 4 of its panels to
panel-simple driver.

---
V2-V3:
* changed my SoB and authorship
* added some forgotten acked-by
* fixed alpha-numeric order on adding bindings
---

Giulio Benetti (9):
  dt-bindings: Add Jenson Display vendor prefix
  dt-bindings: display/panel: add Jenson JT60245-01
  dt-bindings: display/panel: add Jenson JT60248-01
  dt-bindings: display/panel: add Jenson JT60249-01
  dt-bindings: display/panel: add Jenson JT60250-02
  drm/panel: simple: add Jenson JT60245-01
  drm/panel: simple: add Jenson JT60248-01
  drm/panel: simple: add Jenson JT60249-01
  drm/panel: simple: add Jenson JT60250-02

 .../bindings/display/panel/panel-simple.yaml  |   8 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 drivers/gpu/drm/panel/panel-simple.c          | 108 ++++++++++++++++++
 3 files changed, 118 insertions(+)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
