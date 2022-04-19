Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AECA25075AE
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 18:59:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A370810E88A;
	Tue, 19 Apr 2022 16:58:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo-csw-fb.securemx.jp (mo-csw-fb1514.securemx.jp
 [210.130.202.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6343F10E09A
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 08:02:01 +0000 (UTC)
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1514) id 23J7PlgV002291;
 Tue, 19 Apr 2022 16:25:47 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1516) id 23J7PdWU030637;
 Tue, 19 Apr 2022 16:25:40 +0900
X-Iguazu-Qid: 34trMBIs3Na1y4kWSk
X-Iguazu-QSIG: v=2; s=0; t=1650353139; q=34trMBIs3Na1y4kWSk;
 m=uXFWnbtiQ23UePFHNF7vTD0gPGLu65yRjXE5K8HzdWY=
Received: from imx12-a.toshiba.co.jp (imx12-a.toshiba.co.jp [61.202.160.135])
 by relay.securemx.jp (mx-mr1510) id 23J7Pcgu036787
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 19 Apr 2022 16:25:38 +0900
X-SA-MID: 2667865
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 0/4] Add Toshiba Visconti AFFINE image processing accelerator
 driver
Date: Tue, 19 Apr 2022 16:20:14 +0900
X-TSB-HOP2: ON
Message-Id: <20220419072018.30057-1-yuji2.ishikawa@toshiba.co.jp>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 19 Apr 2022 16:58:45 +0000
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

This series is the AFFINE image processing accelerator driver for Toshiba's ARM SoC, Visconti[0].
This provides DT binding documentation, device driver, MAINTAINER files.

Best regards,
Yuji

[0]: https://toshiba.semicon-storage.com/ap-en/semiconductor/product/image-recognition-processors-visconti.html

Yuji Ishikawa (4):
  dt-bindings: soc: visconti: Add Toshiba Visconti AFFINE image
    processing accelerator bindings
  soc: visconti: Add Toshiba Visconti image processing accelerator
    common source
  soc: visconti: Add Toshiba Visconti AFFINE image processing
    accelerator
  MAINTAINERS: Add entries for Toshiba Visconti AFFINE image processing
    accelerator

 .../soc/visconti/toshiba,visconti-affine.yaml |  53 ++
 MAINTAINERS                                   |   2 +
 drivers/soc/Kconfig                           |   1 +
 drivers/soc/Makefile                          |   1 +
 drivers/soc/visconti/Kconfig                  |   7 +
 drivers/soc/visconti/Makefile                 |   8 +
 drivers/soc/visconti/affine/Makefile          |   6 +
 drivers/soc/visconti/affine/affine.c          | 451 ++++++++++++++++++
 drivers/soc/visconti/affine/hwd_affine.c      | 207 ++++++++
 drivers/soc/visconti/affine/hwd_affine.h      |  83 ++++
 drivers/soc/visconti/affine/hwd_affine_reg.h  |  45 ++
 drivers/soc/visconti/ipa_common.c             |  55 +++
 drivers/soc/visconti/ipa_common.h             |  19 +
 drivers/soc/visconti/uapi/affine.h            |  87 ++++
 drivers/soc/visconti/uapi/ipa.h               |  87 ++++
 15 files changed, 1112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/visconti/toshiba,visconti-affine.yaml
 create mode 100644 drivers/soc/visconti/Kconfig
 create mode 100644 drivers/soc/visconti/Makefile
 create mode 100644 drivers/soc/visconti/affine/Makefile
 create mode 100644 drivers/soc/visconti/affine/affine.c
 create mode 100644 drivers/soc/visconti/affine/hwd_affine.c
 create mode 100644 drivers/soc/visconti/affine/hwd_affine.h
 create mode 100644 drivers/soc/visconti/affine/hwd_affine_reg.h
 create mode 100644 drivers/soc/visconti/ipa_common.c
 create mode 100644 drivers/soc/visconti/ipa_common.h
 create mode 100644 drivers/soc/visconti/uapi/affine.h
 create mode 100644 drivers/soc/visconti/uapi/ipa.h

-- 
2.17.1


