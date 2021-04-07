Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C68B356658
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 10:21:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D1D898ED;
	Wed,  7 Apr 2021 08:21:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7624898ED
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 08:21:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8F450613CF;
 Wed,  7 Apr 2021 08:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617783662;
 bh=1IWlmRG9OD413dWYIjvrcWiKG5N1mPS/69ftZBnxCPE=;
 h=From:To:Cc:Subject:Date:From;
 b=MU/hOdvwtzxehLxToSu65R5aOnRU3HIBxCz57ZiasngM+1MaaWazON3N+zEdOJZYr
 lE/KionJZjqUql+6V09QR1bUu6M/Qzp30HMFgSPenbnw9CCxb2i+Qqcl0VX7BDmpmR
 72Bj0HiREn8JRuhw+qPf2Z0zeTluUs0xTJtuLdltHzF1SvY7HcsWGui04BfyRIU/J3
 RBXvcAMPzUyJR/kmeTo5tEfpXoyEyzNJ088/ukU4X+xY5oshHbYlcUgWMGVUob0u3b
 6EIxlJUed/GABQ+UyyICvPqtEJrxu8Ym8Ad1HvtfmGdAqRpoZG0oW++4Tx/bGTfSnR
 oSZ3RBmaWKnhg==
Received: by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1lU3Qq-005i24-4N; Wed, 07 Apr 2021 10:21:00 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 "Jonathan Corbet" <corbet@lwn.net>
Subject: [PATCH v2 00/19] Fix broken documentation file references
Date: Wed,  7 Apr 2021 10:20:39 +0200
Message-Id: <cover.1617783062.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Akira Yokosawa <akiyks@gmail.com>,
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>,
 =?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
 Harry Wei <harryxiyou@gmail.com>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Joel Fernandes <joel@joelfernandes.org>, linux-i3c@lists.infradead.org,
 linux-arch@vger.kernel.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-iio@vger.kernel.org, Federico Vaga <federico.vaga@vaga.pv.it>,
 linux-input@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, linux-pm@vger.kernel.org,
 Daniel Lustig <dlustig@nvidia.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Vitor Soares <vitor.soares@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jon,

As files keep being moved around and DT bindings are 
converted and renamed to yaml, their doc references get 
outdated, pointing to an invalid places.

This series address those. It is based on the top of docs-next tree,
and most patches here are independent from the other ones.

v2:
  - Dropped patches that were already applied, Most of those
    will be following via Jonathan Cameron's iio tree;
  - Dropped patches that don't apply on the top of docs next.
  - Added some new patches fixing other breakages.

PS.:  
  I placed the dropped patches on a separate branch. I'll track 
  them and re-submit any missing ones after -rc1.

Mauro Carvalho Chehab (19):
  MAINTAINERS: update ste,mcde.yaml reference
  MAINTAINERS: update brcm,bcm-v3d.yaml reference
  MAINTAINERS: update fsl,dpaa2-console.yaml reference
  MAINTAINERS: update mtk-sd.yaml reference
  MAINTAINERS: update snps,dw-axi-dmac.yaml reference
  dt-bindings: don't use ../dir for doc references
  dt-bindings: fix references for iio-bindings.txt
  dt-bindings: iommu: mediatek: update mediatek,iommu.yaml references
  dt-bindings: i3c: update i3c.yaml references
  dt-bindings:iio:adc: update motorola,cpcap-adc.yaml reference
  dt-bindings:iio:adc: update dlg,da9150-gpadc.yaml reference
  dt-bindings: power: supply: da9150: update da9150-charger.txt
    reference
  dt-bindings: power: supply: da9150: update da9150-fg.txt reference
  docs: update sysfs-platform_profile.rst reference
  docs: update rcu_dereference.rst reference
  docs: vcpu-requests.rst: fix reference for atomic ops
  docs: replace transation references for reporting-bugs.rst
  docs: translations/zh_CN: fix a typo at 8.Conclusion.rst
  docs: sched-bwc.rst: fix a typo on a doc name

 .../bindings/display/mediatek/mediatek,disp.txt  |  2 +-
 .../devicetree/bindings/hwmon/ntc_thermistor.txt |  2 +-
 .../devicetree/bindings/i3c/cdns,i3c-master.txt  |  6 +++---
 .../bindings/i3c/snps,dw-i3c-master.txt          |  6 +++---
 .../devicetree/bindings/iio/adc/ingenic,adc.yaml |  5 +++--
 .../devicetree/bindings/input/adc-joystick.yaml  |  4 +++-
 .../input/touchscreen/resistive-adc-touch.txt    |  5 ++++-
 .../bindings/media/mediatek-jpeg-decoder.txt     |  2 +-
 .../bindings/media/mediatek-jpeg-encoder.txt     |  2 +-
 .../devicetree/bindings/media/mediatek-mdp.txt   |  2 +-
 .../bindings/media/mediatek-vcodec.txt           |  2 +-
 Documentation/devicetree/bindings/mfd/ab8500.txt |  4 +++-
 Documentation/devicetree/bindings/mfd/da9150.txt |  8 ++++----
 .../devicetree/bindings/mfd/motorola-cpcap.txt   | 16 ++++++++--------
 .../bindings/power/supply/da9150-charger.txt     |  2 +-
 Documentation/scheduler/sched-bwc.rst            |  2 +-
 .../translations/it_IT/process/howto.rst         |  2 +-
 Documentation/translations/ja_JP/howto.rst       |  2 +-
 Documentation/translations/zh_CN/SecurityBugs    |  2 +-
 .../zh_CN/admin-guide/reporting-issues.rst       |  4 ++--
 .../translations/zh_CN/process/8.Conclusion.rst  |  2 +-
 .../translations/zh_CN/process/howto.rst         |  2 +-
 Documentation/virt/kvm/vcpu-requests.rst         |  2 +-
 MAINTAINERS                                      | 10 +++++-----
 include/linux/platform_profile.h                 |  2 +-
 tools/memory-model/Documentation/glossary.txt    |  2 +-
 26 files changed, 54 insertions(+), 46 deletions(-)

-- 
2.30.2


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
