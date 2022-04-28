Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DF75134AF
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 15:16:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A9110E965;
	Thu, 28 Apr 2022 13:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo-csw.securemx.jp (mo-csw1115.securemx.jp [210.130.202.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E99110E7C4
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 13:16:46 +0000 (UTC)
Received: by mo-csw.securemx.jp (mx-mo-csw1115) id 23SDGYBv005922;
 Thu, 28 Apr 2022 22:16:34 +0900
X-Iguazu-Qid: 2wGrSY3sPO1pGNxkIK
X-Iguazu-QSIG: v=2; s=0; t=1651151794; q=2wGrSY3sPO1pGNxkIK;
 m=bTvy+cUh66mFikFBu1CMUwP46MeZjQTe4nnCWw9Qy4Q=
Received: from imx12-a.toshiba.co.jp (imx12-a.toshiba.co.jp [61.202.160.135])
 by relay.securemx.jp (mx-mr1112) id 23SDGXQu017419
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 28 Apr 2022 22:16:33 +0900
X-SA-MID: 3363560
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Rob Herring <robh+dt@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 0/4] Add Toshiba Visconti DNN image processing accelerator
 driver
Date: Thu, 28 Apr 2022 22:11:24 +0900
X-TSB-HOP2: ON
Message-Id: <20220428131128.5053-1-yuji2.ishikawa@toshiba.co.jp>
X-Mailer: git-send-email 2.17.1
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, yuji2.ishikawa@toshiba.co.jp,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series is the DNN image processing accelerator driver for Toshiba's ARM SoC, Visconti[0].
This provides DT binding documentation, device driver, MAINTAINER files.

The second patch "soc: visconti: Add Toshiba Visconti image processing accelerator common source"
and the fourth patch "MAINTAINERS: ..." are the same as the ones in the preceding post for affine driver.

Best regards,
Yuji

[0]: https://toshiba.semicon-storage.com/ap-en/semiconductor/product/image-recognition-processors-visconti.html

Yuji Ishikawa (4):
  dt-bindings: soc: visconti: Add Toshiba Visconti DNN image processing
    accelerator bindings
  soc: visconti: Add Toshiba Visconti image processing accelerator
    common source
  soc: visconti: Add Toshiba Visconti DNN image processing accelerator
  MAINTAINERS: Add entries for Toshiba Visconti DNN image processing
    accelerator

 .../soc/visconti/toshiba,visconti-dnn.yaml    |  54 ++
 MAINTAINERS                                   |   2 +
 drivers/soc/Kconfig                           |   1 +
 drivers/soc/Makefile                          |   1 +
 drivers/soc/visconti/Kconfig                  |   7 +
 drivers/soc/visconti/Makefile                 |   8 +
 drivers/soc/visconti/dnn/Makefile             |   6 +
 drivers/soc/visconti/dnn/dnn.c                | 533 ++++++++++++++++++
 drivers/soc/visconti/dnn/hwd_dnn.c            | 183 ++++++
 drivers/soc/visconti/dnn/hwd_dnn.h            |  68 +++
 drivers/soc/visconti/dnn/hwd_dnn_reg.h        | 228 ++++++++
 drivers/soc/visconti/ipa_common.c             |  55 ++
 drivers/soc/visconti/ipa_common.h             |  18 +
 drivers/soc/visconti/uapi/dnn.h               |  77 +++
 drivers/soc/visconti/uapi/ipa.h               |  88 +++
 15 files changed, 1329 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/visconti/toshiba,visconti-dnn.yaml
 create mode 100644 drivers/soc/visconti/Kconfig
 create mode 100644 drivers/soc/visconti/Makefile
 create mode 100644 drivers/soc/visconti/dnn/Makefile
 create mode 100644 drivers/soc/visconti/dnn/dnn.c
 create mode 100644 drivers/soc/visconti/dnn/hwd_dnn.c
 create mode 100644 drivers/soc/visconti/dnn/hwd_dnn.h
 create mode 100644 drivers/soc/visconti/dnn/hwd_dnn_reg.h
 create mode 100644 drivers/soc/visconti/ipa_common.c
 create mode 100644 drivers/soc/visconti/ipa_common.h
 create mode 100644 drivers/soc/visconti/uapi/dnn.h
 create mode 100644 drivers/soc/visconti/uapi/ipa.h

-- 
2.17.1


