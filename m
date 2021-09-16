Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E784640D5A7
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 11:14:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129436EB1F;
	Thu, 16 Sep 2021 09:14:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23FBF6EB1D
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 09:14:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4E1A0611CA;
 Thu, 16 Sep 2021 09:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631783661;
 bh=HpXVplz89oKyc+hivBPzxb/s0fvvid7dqIkLDoV0E8s=;
 h=From:To:Cc:Subject:Date:From;
 b=lRyC+Gl6hpA65PTmNoIvzIyVlFwS1vvgpOXA4IShHvXBxni2jYB5SiQUoU+fAPpe7
 MhnOfSEDpi0f8ZqYssR8CnOyMA/WbCzxSWt1mOakOCY8TqwNRCL3kQrQCKrB2zWRIB
 5G0n7Tz6Uoky9NsNn5NDTtSzpSpYgyGclzrBZA3Gs8NpLY4HEgX3PjaPn8FmThtKR2
 aBhvThsya5NVQoLmW1gxaxwHQwFF6ykyqS6fssrJvf8d7OLU9EwLMDYNfhy/Dw6CY7
 InDJMP3HNKwr3VvEbl2g/5QXYa9v7CBmkpGyauf133KiKGoSP98tRVlSt1Mjgaucod
 b9jsm+2PWf6gQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1mQnTH-001sKa-8R; Thu, 16 Sep 2021 11:14:19 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Evgeniy Polyakov <zbr@ioremap.net>,
 Jakub Kicinski <kuba@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Martin KaFai Lau <kafai@fb.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
 bpf@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kselftest@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org,
 netdev@vger.kernel.org, sparmaintainer@unisys.com
Subject: [PATCH 00/24] Fix some issues at documentation
Date: Thu, 16 Sep 2021 11:13:53 +0200
Message-Id: <cover.1631783482.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi John,

The first patch in this series fix a bad character used instead of
a "(c)" UTF-8 symbol.

The remaining ones fix several broken references to files
under Documentation/, several due to DT schema conversions
from .txt to .yaml.

Mauro Carvalho Chehab (24):
  visorbus: fix a copyright symbol that was bad encoded
  dt-bindings: net: dsa: sja1105: update nxp,sja1105.yaml reference
  dt-bindings: arm: mediatek: mmsys: update mediatek,mmsys.yaml
    reference
  dt-bindings: w1: update w1-gpio.yaml reference
  dt-bindings: mmc: update mmc-card.yaml reference
  libbpf: update index.rst reference
  docs: accounting: update delay-accounting.rst reference
  tools: bpftool: update bpftool-prog.rst reference
  tools: bpftool: update bpftool-map.rst reference
  bpftool: update bpftool-cgroup.rst reference
  MAINTAINERS: update mtd-physmap.yaml reference
  MAINTAINERS: update arm,vic.yaml reference
  MAINTAINERS: update aspeed,i2c.yaml reference
  MAINTAINERS: update faraday,ftrtc010.yaml reference
  MAINTAINERS: update fsl,fec.yaml reference
  MAINTAINERS: update mtd-physmap.yaml reference
  MAINTAINERS: update ti,am654-hbmc.yaml reference
  MAINTAINERS: update ti,sci.yaml reference
  MAINTAINERS: update intel,ixp46x-rng.yaml reference
  MAINTAINERS: update nxp,imx8-jpeg.yaml reference
  MAINTAINERS: update gemini.yaml reference
  MAINTAINERS: update brcm,unimac-mdio.yaml reference
  MAINTAINERS: update chipone,icn8318.yaml reference
  MAINTAINERS: update silergy,sy8106a.yaml reference

 Documentation/admin-guide/sysctl/kernel.rst   |  2 +-
 Documentation/bpf/index.rst                   |  2 +-
 .../display/mediatek/mediatek,disp.txt        |  2 +-
 Documentation/networking/dsa/sja1105.rst      |  2 +-
 Documentation/w1/masters/w1-gpio.rst          |  2 +-
 MAINTAINERS                                   | 28 +++++++++----------
 drivers/mmc/host/omap_hsmmc.c                 |  2 +-
 drivers/visorbus/visorbus_main.c              |  2 +-
 .../selftests/bpf/test_bpftool_synctypes.py   |  6 ++--
 9 files changed, 24 insertions(+), 24 deletions(-)

-- 
2.31.1


