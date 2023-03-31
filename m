Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8116D2438
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 17:42:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE4110E13E;
	Fri, 31 Mar 2023 15:42:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 435ED10E0E7;
 Fri, 31 Mar 2023 15:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680277353; x=1711813353;
 h=message-id:date:mime-version:from:subject:to:cc;
 bh=/9XaHUJp5ZUmaJSIoGVSuXacneUsPz+Qss8RWglgH7Y=;
 b=ZXXD9TspUDETRNUis0Buzb3d1lp7CGTXqiTCWhvErJFOWdccQkHwRYjM
 TtqlrGcD8MNhTjyU9DuwZvI7OLQ0VSw8TgS1twhNlJqMOcIgz+P/HgMP3
 AR23lKNMVOynBWVG5U8LiOly0HFh0oPiEKpjlkhrn5w34DKPfF/MdUHp7
 owGjryWPO8QM1WQidRX7NWkFmEMs2OnXfSLPOtNbxYyi8R+p2kFeUHXzU
 IWnnc6FhCgb3qTuemzgty6Cemgu2ClIIqpFUZuFJyK+y69xdbdhkwZ1M/
 aox/jDHm6sDpI2s+tpym1sX1haK+x0WU1ax82jSv1ecNB/d1bTmtS54sS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="340208201"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
 d="scan'208,217";a="340208201"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 08:42:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="635330746"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
 d="scan'208,217";a="635330746"
Received: from bawinitt-mobl2.amr.corp.intel.com (HELO [10.251.209.55])
 ([10.251.209.55])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 08:42:29 -0700
Content-Type: multipart/alternative;
 boundary="------------BwqGWNW47EsYm0LcsKQr8wu5"
Message-ID: <36f4efa4-26e9-49df-287e-d193422c990d@linux.intel.com>
Date: Fri, 31 Mar 2023 17:42:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PULL] drm-misc-next
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Language: en-US
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------BwqGWNW47EsYm0LcsKQr8wu5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dave, Daniel,

Small update. Slow week. Felt like sending a pull request regardless.

drm-misc-next-2023-03-31:
drm-misc-next for v6.4-rc1:

Cross-subsystem Changes:
- DT bindings update for adding Mali MT81xx devices.
- Assorted DT binding updates.

Core Changes:
- Documentation update to scheduler.

Driver Changes:
- Add support for the same mali devices.
- Add support for speed binning to panfrost.
- Add B133UAN01.0 eDP panel.
- Assorted small fixes to bridge/ps8640, bridge/it6505, panel/magnachip.
- Use of_property_read_bool in ps8622 and ofdrm.
The following changes since commit 82bbec189ab34873688484cd14189a5392946fbb:

   Merge v6.3-rc4 into drm-next (2023-03-29 16:00:23 +0200)

are available in the Git repository at:

   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2023-03-31

for you to fetch changes up to 7d690f936e9bc9fbd6394fb3d4ad181af03ee393:

   drm/panfrost: Add basic support for speed binning (2023-03-31 11:44:11 +0200)

----------------------------------------------------------------
drm-misc-next for v6.4-rc1:

Cross-subsystem Changes:
- DT bindings update for adding Mali MT81xx devices.
- Assorted DT binding updates.

Core Changes:
- Documentation update to scheduler.

Driver Changes:
- Add support for the same mali devices.
- Add support for speed binning to panfrost.
- Add B133UAN01.0 eDP panel.
- Assorted small fixes to bridge/ps8640, bridge/it6505, panel/magnachip.
- Use of_property_read_bool in ps8622 and ofdrm.

----------------------------------------------------------------
Alyssa Rosenzweig (3):
       drm/panfrost: Increase MAX_PM_DOMAINS to 5
       drm/panfrost: Add the MT8192 GPU ID
       drm/panfrost: Add mediatek,mt8192-mali compatible

AngeloGioacchino Del Regno (11):
       dt-bindings: gpu: mali-bifrost: Split out MediaTek power-domains variation
       dt-bindings: gpu: mali-bifrost: Set power-domains maxItems to 5
       dt-bindings: gpu: mali-bifrost: Fix power-domain-names validation
       dt-bindings: gpu: mali-bifrost: Add sub-schema for MT8192's power domains
       dt-bindings: gpu: mali-bifrost: Add new MT8183 compatible
       dt-bindings: gpu: mali-bifrost: Add support for MediaTek MT8186
       dt-bindings: gpu: mali-bifrost: Add compatible for MT8195 SoC
       drm/panfrost: Add new compatible for Mali on the MT8183 SoC
       drm/panfrost: Add support for Mali on the MT8186 SoC
       dt-bindings: gpu: mali-bifrost: Document nvmem for speedbin support
       drm/panfrost: Add basic support for speed binning

Bjorn Andersson (1):
       drm/panel-edp: Add B133UAN01.0 edp panel entry

Caio Novais (1):
       drm/scheduler: Fix variable name in function description

Dan Carpenter (1):
       drm/panel: magnachip: Prevent error pointer dereference in probe

Fabio Estevam (1):
       dt-bindings: display: seiko,43wvf1g: Change the maintainer's contact

Hsin-Yi Wang (1):
       drm/bridge: it6505: Add range and selector_reg

Krzysztof Kozlowski (6):
       dt-bindings: display: panel-simple: merge Innolux p120zdg-bf1
       dt-bindings: display: novatek,nt36672a: correct VDDIO supply
       dt-bindings: display: panel-simple-dsi: allow vddio variant
       dt-bindings: display: panel-simple-dsi: document port
       dt-bindings: display: visionox,rm69299: document reg
       dt-bindings: display: boe,tv101wum-nl6: document rotation

Maarten Lankhorst (1):
       Merge remote-tracking branch 'drm/drm-next' into drm-misc-next

Pin-yen Lin (3):
       drm/bridge: ps8640: Skip redundant bridge enable
       drm/bridge: ps8640: Add a cache for EDID
       drm/bridge: ps8640: Return NULL immediately when EDID read fail

Rob Herring (3):
       dt-bindings: display: Drop unneeded quotes
       drm: Use of_property_present() for testing DT property presence
       drm: Use of_property_read_bool() for boolean properties

  .../bindings/auxdisplay/holtek,ht16k33.yaml        |  2 +-
  .../bindings/display/amlogic,meson-dw-hdmi.yaml    |  4 +-
  .../bindings/display/amlogic,meson-vpu.yaml        |  4 +-
  .../bindings/display/bridge/analogix,anx7625.yaml  |  4 +-
  .../bindings/display/bridge/cdns,mhdp8546.yaml     |  4 +-
  .../bindings/display/bridge/nxp,ptn3460.yaml       |  2 +-
  .../bindings/display/bridge/toshiba,tc358767.yaml  |  2 +-
  .../devicetree/bindings/display/dp-aux-bus.yaml    |  2 +-
  .../bindings/display/imx/nxp,imx8mq-dcss.yaml      |  4 +-
  .../bindings/display/mediatek/mediatek,hdmi.yaml   |  2 +-
  .../bindings/display/msm/dsi-controller-main.yaml  |  8 +-
  .../bindings/display/msm/dsi-phy-10nm.yaml         |  2 +-
  .../devicetree/bindings/display/msm/gmu.yaml       |  4 +-
  .../devicetree/bindings/display/msm/gpu.yaml       |  4 +-
  .../devicetree/bindings/display/msm/mdp4.yaml      |  4 +-
  .../bindings/display/panel/boe,tv101wum-nl6.yaml   |  1 +
  .../display/panel/innolux,p120zdg-bf1.yaml         | 43 -----------
  .../bindings/display/panel/novatek,nt36672a.yaml   |  6 +-
  .../bindings/display/panel/panel-simple-dsi.yaml   | 24 +++++-
  .../bindings/display/panel/panel-simple.yaml       |  2 +
  .../bindings/display/panel/ronbo,rb070d30.yaml     |  2 +-
  .../display/panel/samsung,s6e88a0-ams452ef01.yaml  |  8 ++
  .../bindings/display/panel/seiko,43wvf1g.yaml      |  2 +-
  .../bindings/display/panel/visionox,rm69299.yaml   | 25 +++++--
  .../devicetree/bindings/display/renesas,du.yaml    |  4 +-
  .../display/tegra/nvidia,tegra114-mipi.yaml        |  2 +-
  .../display/tegra/nvidia,tegra124-sor.yaml         | 12 +--
  .../bindings/display/tegra/nvidia,tegra186-dc.yaml |  4 +-
  .../display/tegra/nvidia,tegra186-dsi-padctl.yaml  |  2 +-
  .../bindings/display/tegra/nvidia,tegra20-dsi.yaml | 12 +--
  .../display/tegra/nvidia,tegra20-hdmi.yaml         |  6 +-
  .../bindings/display/ti/ti,am65x-dss.yaml          |  6 +-
  .../bindings/display/ti/ti,j721e-dss.yaml          |  4 +-
  .../devicetree/bindings/display/ti/ti,k2g-dss.yaml |  4 +-
  .../bindings/display/xylon,logicvc-display.yaml    | 22 +++---
  .../devicetree/bindings/gpu/arm,mali-bifrost.yaml  | 87 +++++++++++++++++++++-
  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c    |  2 +-
  drivers/gpu/drm/bridge/ite-it6505.c                | 34 ++++++---
  drivers/gpu/drm/bridge/parade-ps8622.c             |  2 +-
  drivers/gpu/drm/bridge/parade-ps8640.c             | 65 ++++++++++------
  drivers/gpu/drm/drm_mipi_dsi.c                     |  2 +-
  drivers/gpu/drm/msm/adreno/adreno_gpu.c            |  2 +-
  drivers/gpu/drm/panel/panel-edp.c                  |  1 +
  .../gpu/drm/panel/panel-magnachip-d53e6ea8966.c    |  2 +-
  drivers/gpu/drm/panfrost/panfrost_devfreq.c        | 30 ++++++++
  drivers/gpu/drm/panfrost/panfrost_device.h         |  2 +-
  drivers/gpu/drm/panfrost/panfrost_drv.c            | 37 +++++++++
  drivers/gpu/drm/panfrost/panfrost_gpu.c            |  8 ++
  drivers/gpu/drm/scheduler/sched_main.c             |  2 +-
  drivers/gpu/drm/sun4i/sun4i_backend.c              |  2 +-
  drivers/gpu/drm/sun4i/sun8i_mixer.c                |  2 +-
  drivers/gpu/drm/tiny/ofdrm.c                       |  8 +-
  drivers/gpu/drm/tiny/simpledrm.c                   |  2 +-
  drivers/gpu/drm/vc4/vc4_hdmi.c                     |  2 +-
  54 files changed, 356 insertions(+), 179 deletions(-)
  delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.yaml

--------------BwqGWNW47EsYm0LcsKQr8wu5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hi Dave, Daniel,

Small update. Slow week. Felt like sending a pull request regardless.

drm-misc-next-2023-03-31:
drm-misc-next for v6.4-rc1:

Cross-subsystem Changes:
- DT bindings update for adding Mali MT81xx devices.
- Assorted DT binding updates.

Core Changes:
- Documentation update to scheduler.

Driver Changes:
- Add support for the same mali devices.
- Add support for speed binning to panfrost.
- Add B133UAN01.0 eDP panel.
- Assorted small fixes to bridge/ps8640, bridge/it6505, panel/magnachip.
- Use of_property_read_bool in ps8622 and ofdrm.
The following changes since commit 82bbec189ab34873688484cd14189a5392946fbb:

  Merge v6.3-rc4 into drm-next (2023-03-29 16:00:23 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2023-03-31

for you to fetch changes up to 7d690f936e9bc9fbd6394fb3d4ad181af03ee393:

  drm/panfrost: Add basic support for speed binning (2023-03-31 11:44:11 +0200)

----------------------------------------------------------------
drm-misc-next for v6.4-rc1:

Cross-subsystem Changes:
- DT bindings update for adding Mali MT81xx devices.
- Assorted DT binding updates.

Core Changes:
- Documentation update to scheduler.

Driver Changes:
- Add support for the same mali devices.
- Add support for speed binning to panfrost.
- Add B133UAN01.0 eDP panel.
- Assorted small fixes to bridge/ps8640, bridge/it6505, panel/magnachip.
- Use of_property_read_bool in ps8622 and ofdrm.

----------------------------------------------------------------
Alyssa Rosenzweig (3):
      drm/panfrost: Increase MAX_PM_DOMAINS to 5
      drm/panfrost: Add the MT8192 GPU ID
      drm/panfrost: Add mediatek,mt8192-mali compatible

AngeloGioacchino Del Regno (11):
      dt-bindings: gpu: mali-bifrost: Split out MediaTek power-domains variation
      dt-bindings: gpu: mali-bifrost: Set power-domains maxItems to 5
      dt-bindings: gpu: mali-bifrost: Fix power-domain-names validation
      dt-bindings: gpu: mali-bifrost: Add sub-schema for MT8192's power domains
      dt-bindings: gpu: mali-bifrost: Add new MT8183 compatible
      dt-bindings: gpu: mali-bifrost: Add support for MediaTek MT8186
      dt-bindings: gpu: mali-bifrost: Add compatible for MT8195 SoC
      drm/panfrost: Add new compatible for Mali on the MT8183 SoC
      drm/panfrost: Add support for Mali on the MT8186 SoC
      dt-bindings: gpu: mali-bifrost: Document nvmem for speedbin support
      drm/panfrost: Add basic support for speed binning

Bjorn Andersson (1):
      drm/panel-edp: Add B133UAN01.0 edp panel entry

Caio Novais (1):
      drm/scheduler: Fix variable name in function description

Dan Carpenter (1):
      drm/panel: magnachip: Prevent error pointer dereference in probe

Fabio Estevam (1):
      dt-bindings: display: seiko,43wvf1g: Change the maintainer's contact

Hsin-Yi Wang (1):
      drm/bridge: it6505: Add range and selector_reg

Krzysztof Kozlowski (6):
      dt-bindings: display: panel-simple: merge Innolux p120zdg-bf1
      dt-bindings: display: novatek,nt36672a: correct VDDIO supply
      dt-bindings: display: panel-simple-dsi: allow vddio variant
      dt-bindings: display: panel-simple-dsi: document port
      dt-bindings: display: visionox,rm69299: document reg
      dt-bindings: display: boe,tv101wum-nl6: document rotation

Maarten Lankhorst (1):
      Merge remote-tracking branch 'drm/drm-next' into drm-misc-next

Pin-yen Lin (3):
      drm/bridge: ps8640: Skip redundant bridge enable
      drm/bridge: ps8640: Add a cache for EDID
      drm/bridge: ps8640: Return NULL immediately when EDID read fail

Rob Herring (3):
      dt-bindings: display: Drop unneeded quotes
      drm: Use of_property_present() for testing DT property presence
      drm: Use of_property_read_bool() for boolean properties

 .../bindings/auxdisplay/holtek,ht16k33.yaml        |  2 +-
 .../bindings/display/amlogic,meson-dw-hdmi.yaml    |  4 +-
 .../bindings/display/amlogic,meson-vpu.yaml        |  4 +-
 .../bindings/display/bridge/analogix,anx7625.yaml  |  4 +-
 .../bindings/display/bridge/cdns,mhdp8546.yaml     |  4 +-
 .../bindings/display/bridge/nxp,ptn3460.yaml       |  2 +-
 .../bindings/display/bridge/toshiba,tc358767.yaml  |  2 +-
 .../devicetree/bindings/display/dp-aux-bus.yaml    |  2 +-
 .../bindings/display/imx/nxp,imx8mq-dcss.yaml      |  4 +-
 .../bindings/display/mediatek/mediatek,hdmi.yaml   |  2 +-
 .../bindings/display/msm/dsi-controller-main.yaml  |  8 +-
 .../bindings/display/msm/dsi-phy-10nm.yaml         |  2 +-
 .../devicetree/bindings/display/msm/gmu.yaml       |  4 +-
 .../devicetree/bindings/display/msm/gpu.yaml       |  4 +-
 .../devicetree/bindings/display/msm/mdp4.yaml      |  4 +-
 .../bindings/display/panel/boe,tv101wum-nl6.yaml   |  1 +
 .../display/panel/innolux,p120zdg-bf1.yaml         | 43 -----------
 .../bindings/display/panel/novatek,nt36672a.yaml   |  6 +-
 .../bindings/display/panel/panel-simple-dsi.yaml   | 24 +++++-
 .../bindings/display/panel/panel-simple.yaml       |  2 +
 .../bindings/display/panel/ronbo,rb070d30.yaml     |  2 +-
 .../display/panel/samsung,s6e88a0-ams452ef01.yaml  |  8 ++
 .../bindings/display/panel/seiko,43wvf1g.yaml      |  2 +-
 .../bindings/display/panel/visionox,rm69299.yaml   | 25 +++++--
 .../devicetree/bindings/display/renesas,du.yaml    |  4 +-
 .../display/tegra/nvidia,tegra114-mipi.yaml        |  2 +-
 .../display/tegra/nvidia,tegra124-sor.yaml         | 12 +--
 .../bindings/display/tegra/nvidia,tegra186-dc.yaml |  4 +-
 .../display/tegra/nvidia,tegra186-dsi-padctl.yaml  |  2 +-
 .../bindings/display/tegra/nvidia,tegra20-dsi.yaml | 12 +--
 .../display/tegra/nvidia,tegra20-hdmi.yaml         |  6 +-
 .../bindings/display/ti/ti,am65x-dss.yaml          |  6 +-
 .../bindings/display/ti/ti,j721e-dss.yaml          |  4 +-
 .../devicetree/bindings/display/ti/ti,k2g-dss.yaml |  4 +-
 .../bindings/display/xylon,logicvc-display.yaml    | 22 +++---
 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml  | 87 +++++++++++++++++++++-
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c    |  2 +-
 drivers/gpu/drm/bridge/ite-it6505.c                | 34 ++++++---
 drivers/gpu/drm/bridge/parade-ps8622.c             |  2 +-
 drivers/gpu/drm/bridge/parade-ps8640.c             | 65 ++++++++++------
 drivers/gpu/drm/drm_mipi_dsi.c                     |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |  2 +-
 drivers/gpu/drm/panel/panel-edp.c                  |  1 +
 .../gpu/drm/panel/panel-magnachip-d53e6ea8966.c    |  2 +-
 drivers/gpu/drm/panfrost/panfrost_devfreq.c        | 30 ++++++++
 drivers/gpu/drm/panfrost/panfrost_device.h         |  2 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c            | 37 +++++++++
 drivers/gpu/drm/panfrost/panfrost_gpu.c            |  8 ++
 drivers/gpu/drm/scheduler/sched_main.c             |  2 +-
 drivers/gpu/drm/sun4i/sun4i_backend.c              |  2 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c                |  2 +-
 drivers/gpu/drm/tiny/ofdrm.c                       |  8 +-
 drivers/gpu/drm/tiny/simpledrm.c                   |  2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  2 +-
 54 files changed, 356 insertions(+), 179 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.yaml

</pre>
  </body>
</html>

--------------BwqGWNW47EsYm0LcsKQr8wu5--
