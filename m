Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33799780DF1
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 16:21:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC2510E02E;
	Fri, 18 Aug 2023 14:21:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D81B10E02E
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 14:21:36 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37IELQPf051319;
 Fri, 18 Aug 2023 09:21:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1692368486;
 bh=oMNxSRj5uqphmrFCYO6QY2YaCMxHE+iCM6ib96SFL58=;
 h=From:To:CC:Subject:Date;
 b=d3CI4h0E6/c+WQS2CRMUchAx3hfNlSMO9+CDHoPoZwspbp369bKyC8rCKh79y6QDQ
 KXEXXLwmbHmegmkoYajoXvZGUaHTaDJ8KslEZI6zqUPZbzp4O/tA4cKCbk0xaKxGlK
 dVfB7mp9G4weNf0/ohwRJkxx/7nGdogL7NzrRVi8=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37IELQMW020425
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 18 Aug 2023 09:21:26 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 18
 Aug 2023 09:21:25 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 18 Aug 2023 09:21:25 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37IELPSX005275;
 Fri, 18 Aug 2023 09:21:25 -0500
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jyri Sarha
 <jyri.sarha@iki.fi>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 0/2] Add DSS support for TI AM62A7 SoC
Date: Fri, 18 Aug 2023 19:51:22 +0530
Message-ID: <20230818142124.8561-1-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Aradhya Bhatia <a-bhatia1@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series adds a new compatible for the Display SubSystem (DSS)
controller on TI's AM62A7 SoC. It further adds the required support, for
the same, in the tidss driver.

The DSS controller is similar to the recently added AM625 DSS, with the
key difference being the absence of VP1 output on the SoC. The VP1 in
AM62A7 DSS is tied off and cannot be used, unlike in AM625, where the
VP1 was connected to 2 OLDI TXes. The video pipeline that corresponds to
VP1 still exists and can be used to overlay planes on the VP2's primary
plane. This can be done using the overlay managers inside the SoC.
Moreover, DSS VP2 can output Full-HD RGB888 DPI video signals.

I have tested these patches on AM62A7 SK-EVM, which converts DPI signals
to HDMI on the platform using the Sil9022A HDMI transmitter. All the
patches, required to enable display on AM62A7-SK, can be found on my
github fork[0] in the branch "next_am62a-v2".

Regards
Aradhya

[0]: https://github.com/aradhya07/linux-ab/tree/next_am62a-v2

Change Log:
V1 -> V2:
  - Correctly sort DISPC_AM62A7 macro after DISPC_AM625 in patch 2/2.

Previous Versions:
V1: https://lore.kernel.org/all/20230818131750.4779-1-a-bhatia1@ti.com/

Aradhya Bhatia (2):
  dt-bindings: display: ti: Add support for am62a7 dss
  drivers/tidss: Add support for AM62A7 DSS

 .../bindings/display/ti/ti,am65x-dss.yaml     | 14 +++++
 drivers/gpu/drm/tidss/tidss_dispc.c           | 53 +++++++++++++++++++
 drivers/gpu/drm/tidss/tidss_dispc.h           |  2 +
 drivers/gpu/drm/tidss/tidss_drv.c             |  1 +
 4 files changed, 70 insertions(+)


base-commit: 47762f08697484cf0c2f2904b8c52375ed26c8cb
-- 
2.40.1

