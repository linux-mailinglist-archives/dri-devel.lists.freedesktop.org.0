Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 875989D3395
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 07:34:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E752C10E080;
	Wed, 20 Nov 2024 06:34:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 836 seconds by postgrey-1.36 at gabe;
 Wed, 20 Nov 2024 06:34:19 UTC
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2123.outbound.protection.partner.outlook.cn [139.219.17.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914AB10E080
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 06:34:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YFVVFuN08r/ShbCum8oG3LqjG/fT7ZCoDDbLJYF4/4O0KlcARW+tgy2JF6u86ONU4ARJ9sdnF1t56aoDWkaWOkmDlaJF83XxHeLqb7ztlCebt5Stp9u3lYLVGiUp6a443bjzaDg19j30H3pp9KbW9egdvxCali1ClUsNMZJCjVjrx3EwWnIVEgahnyba3xhewdSY58ZcU4whpsIWvUv6ldTtmO43Zufoasc1hKLiWn4fnz4YYE3ookYxWhKuBor+45ZrP+ukBN84Jhp42kHeihYWYnES3YMFV5oi4JqLw4Bkj9EaLKwnlzmVhcS3qpi2mDvm2fvjLkQ607E2wc7Ejg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NuZ6BSCN+ZObqUsci2IwS9mryUuPuo3v52xSXvDq/Sw=;
 b=npHp8HuJi9hqrg32oz1uBibi9Qv9UnmAZqsw0PYSX/PQU5mrKAxHeT0gNgJVWp6ULJyEAA53Q2qDoK4xlBaSoQqwwzP777b6oTv/zggG0J9aBCED2CmW5mhiu+gW+lQMEa8zHtN/jF2ibE8UbZQBo/LfLBu5hQYgmNTzYK4u1DOpT6su5LlfNJiMH4ImTfUXnkEW2FpF8eOLOivmdaXHVj+D/Vw7riRYOwGSA9OFRcbjYeUfSRmVZmu4LIB20ORUasfV07VZsz6oPC404kYd4cVAgkYcChvGWN6RYRF2Sn4RgljuPHqgRqx6QRl7OeMqFt9wOUvuVXJPUfdSyC1lRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:1::6) by NTZPR01MB1100.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Wed, 20 Nov
 2024 06:20:17 +0000
Received: from NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn
 ([fe80::512d:38d7:ed9f:dfbe]) by
 NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn ([fe80::512d:38d7:ed9f:dfbe%4])
 with mapi id 15.20.8158.023; Wed, 20 Nov 2024 06:20:16 +0000
From: keith zhao <keith.zhao@starfivetech.com>
To: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 william.qiu@starfivetech.com, xingyu.wu@starfivetech.com, kernel@esmil.dk,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 p.zabel@pengutronix.de, changhuang.liang@starfivetech.com,
 keith.zhao@starfivetech.com, jack.zhu@starfivetech.com,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/9] drm/verisilicon : support DC8200 and inno hdmi
Date: Wed, 20 Nov 2024 14:18:39 +0800
Message-Id: <20241120061848.196754-1-keith.zhao@starfivetech.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJXPR01CA0059.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:12::26) To NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NTZPR01MB1050:EE_|NTZPR01MB1100:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e479c53-b93b-4337-39e5-08dd092b669c
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|1800799024|41320700013|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: gQx8P8+b/zIRI9cXVfS8FsBIXdZjZkhX4+1xiHC3eVCkwObLQfRg0S4jCeNqRNq2U1JlW/uNCM1/k9hABOSQMISMBp0NHzHwV1aUJlctlJWMLz5AoUwUkenmrYvjoOTUKZt35/CZu+S1E07LXZ2SYFmHQvXZZIxIIO1N6fSlS+rvU2q/lJa4XBwq4L7Yxum0da+C2YfWqGB5t8s/BMld9UZywULpEtmntmI5oi5+hkBxogk1XhlZ3FN3tJr4cBiNAreBpoTLSrbJmTqIAtwfcmD0gvjdH6LPq96j1yzHY3jItEYD7XfhOEBKy5y+2ocbUs1SNUV9JzQIaBMgm5V8FBPIPv+8YKW8jy0y1gzVrMXAreRUIJnT3Vt+PTBznXRzgTIXY0wFLJLH9q/2jvKb7MBN80AMBhtxX2M1QWZ+EL2xsWoFkj5WuNO9hc4xYRElU+HKf6QhQ12Phdi3pgAja1TLOkiNXPZWpWu8pPaXeqEDw0hwCG4Y4Q8NcJOTW6mebDtmMxLsd3xcg+4PL26COVoTt/3wSOKpyB0SNPl58Ta9MOH5w46HJbO+SBTnL/mx4Vmi+q+7XIqrUmuxRkI6lI/OGMaIcR7c657s9gLALX2xktkIuqfm/LllzoA0eif4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(1800799024)(41320700013)(366016)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1+17I0RphJC397qWEfZbsSAocPbAAxS6fSeW4K//AC4PRlLrGlPSZjj6/pXb?=
 =?us-ascii?Q?ghMqRAWmRIXB3xXPVOqDawbNNWEjmak8AelFiavT9X02djU2DdruiOhLNXuu?=
 =?us-ascii?Q?CAskdLnWQcH3h14Fk2inbf4Z2mvWYQLaaEdQ2BAqNPhJqaB9/g16KFZU78SB?=
 =?us-ascii?Q?BGWNHKE30B2wM8gNQKL/ETGzgb1tspnaryXkShGNG5sUEyaO8jSpHsmn4RWM?=
 =?us-ascii?Q?tS+a3V4fRKxoThdkf5MWVX0tCrdRSIB9eN0fUsVnfJhLuxjAGxIh4YZ996CJ?=
 =?us-ascii?Q?ZfayJg/K0OzjZO8qjpaZoXAhGBHKpDks/LIB6ovDZNTP/hhEjkUYl7Tx9keV?=
 =?us-ascii?Q?jU8iSlOcX93xi2ktaA0rcYoWwfTCtzwdyOeiYlFXq7Ht2MOBsAgaVAsSU5/0?=
 =?us-ascii?Q?6ZtFPnnw9k5tcCjwdpKLYZbvWmfzi2ZFlsAHhvUn0Nt/Sj7aOHbHWFuhXlQ4?=
 =?us-ascii?Q?G/if5cYjlXByn+nSgQK2oJhAXfIyGu4KqSIFEkXY0lwB47+5iGQqt8mWN/Wz?=
 =?us-ascii?Q?HwHiYrreAPUzq41cmkFUIloNz7vBJfJB15NOOvNflBC2HOnvVdGiALXcn63F?=
 =?us-ascii?Q?iZy8YuFyZMPi6zukpWc631PEoGe9ANeyVfXixkaBUsLwZ/421BffaGAO08h4?=
 =?us-ascii?Q?IN3X+DmcMAtWh49Cmno4hsG+rm8venAxuCfNpTRi6Mi4LEb8zRPxxPigjRM9?=
 =?us-ascii?Q?AwdLhSKnuYEQI0DstB2R7cTJqq6ysyn1RZu5neuXzE68/Q3Phcna7F/JShcU?=
 =?us-ascii?Q?QPRz/0eTQXhfo4nXap/WZ77ZZjz4udOt6ZImXOCpeM16loE1dbOrYECvypLR?=
 =?us-ascii?Q?COBmFUUplXQflzpeHv6wo1/qgZpb6tPdYjwNdHPccgWdqJUjhSyd06hwW5eb?=
 =?us-ascii?Q?XCZnGwxb5pphrmbGfd88SUz3uMIIrE6hjWxsIFaccC9JyBljSiy56mfaVP+R?=
 =?us-ascii?Q?GyCoQR4vwcPk2OBaFtzVVAQBhNfRcmEvmDb8TLA14iZiL/qC/IWAHGPK9jRI?=
 =?us-ascii?Q?LyiibJaY/U1Ehs6ayJJ3LMWmIu6BOSvPh3zp7kyXr1k4JN0pGR99k6DLsfTq?=
 =?us-ascii?Q?W8TXX37jeYtboMwhwVeOXqCpdfjJoAgBlP475psJaHURsmnRrsV1/QbyGBkc?=
 =?us-ascii?Q?CtKyL0EM7UQF85gu4BHSI6HmnRkyrvEvKb9hNME1FpNhubGYmyqLZ2fNBQ1q?=
 =?us-ascii?Q?YfUluTT/ZII7d2rEpCzRgiuFjwld60qNseOE+hepcq9kxedjRhbJ8q0JyfmS?=
 =?us-ascii?Q?YybHwRbQNdZlMaAzI8Y1wJpJF0SP5j1z0Cq3wfko620QDxCwUFEzGEtcd+yE?=
 =?us-ascii?Q?+9Q06UVPEdc7n85NL/hqfMIO+s1bwdcjqL3aH9o9FB9tdURBH277mUKrhyMb?=
 =?us-ascii?Q?xytXGGlxBH1L2/5IfIBkP1UHBUTm7/Y3qky5+kgmoFiH9z7dyXIA9BvDXfVJ?=
 =?us-ascii?Q?ePf9yBWq/uehgidcVbokMG5K1LYw2gJsi3BSO4/MtKGXYBdDdq7mRd/BOq42?=
 =?us-ascii?Q?VTPUtrGTIbHW2XUX7dqRmb/NFwRfLuXvx6/t/mQrfPVEYdyFonGwItvXlY9a?=
 =?us-ascii?Q?gT6rAwAe/hg5DJuu4Y0bjoEKIqN239kNRTS5dUCeBvmRPDGyGpEMUi+TjSxq?=
 =?us-ascii?Q?Vg=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e479c53-b93b-4337-39e5-08dd092b669c
X-MS-Exchange-CrossTenant-AuthSource: NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 06:20:16.7725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZzxGKO0l/JwdeZ6HefNKxN+roPPOIZdY8MxrmFGbwqCD8uOdmug39mzcRssJvC8ANazMUBY6FiD9aByAYeQpg8frWuB+41UB8kKdTLjVXqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB1100
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

Verisilicon/DC8200 display controller IP has 2 display pipes and each 
pipe support a primary plane and a cursor plane . 
In addition, there are 4 overlay planes as 2 display pipes common resources.

The first display pipe is bound to the inno HDMI encoder.
The second display pipe is bound to Internal custom encoder, 
which is used to find dsi bridge by dts node. 

This patchset should be applied on next branch.

V1:
Changes since v1:
- Further standardize the yaml file.
- Dts naming convention improved.
- Fix the problem of compiling and loading ko files.
- Use drm new api to automatically manage resources.
- Drop vs_crtc_funcs&vs_plane_funcs, subdivide the plane's help interface.
- Reduce the modifiers unused.
- Optimize the hdmi driver code

V2:
Changes since v2:
- fix the error about checking the yaml file.
- match drm driver GEM DMA API.
- Delete the custom crtc property .
- hdmi use drmm_ new api to automatically manage resources.
- update the modifiers comments.
- enabling KASAN, fix the error during removing module 

V3:
Changes since v3:
- Delete the custom plane property.
- Delete the custom fourcc modifiers.
- Adjust the calculation mode of hdmi pixclock.
- Add match data for dc8200 driver.
- Adjust some magic values.
- Add a simple encoder for dsi output.

V4:
Changes since v4:
- Delete the display subsystem module as all crtcs and planes are a driver.
- Delete the custom struct, directly use the drm struct data.
- Tidy up the inno hdmi public interface.
- Add a simple encoder for dsi output.

V5:
Changes since v5:
- Refine the Innosilicon HDMI by quoting bridge abstracting.
- Delete the encoder driver, which is created directly by internal functions.
- Adapt to the changes in kernel upgrade APIs, such as drm_client_setup.

keith zhao (9):
  dt-bindings: display: bindings for starfive,JH7110 display pipeline
  riscv: dts: Add display property
  drm: bridge: inno-hdmi: add inno bridge driver.
  drm/vs: Add Hardware Functions for VS DC8200
  drm/vs: Add Base API for VS Mode Configuration
  drm/vs: Add CRTC Functions
  drm/vs: Add VS Plane API
  drm/vs: Add Innosilicon HDMI Support
  drm/vs: Add VS DRM Master Driver for JH7110 SoC

 .../display/bridge/innosilicon,inno-hdmi.yaml |   45 +
 .../display/rockchip/rockchip,inno-hdmi.yaml  |   27 +-
 .../starfive/starfive,jh7110-dc8200.yaml      |  176 +++
 .../starfive/starfive,jh7110-inno-hdmi.yaml   |   91 ++
 .../soc/starfive/starfive,jh7110-syscon.yaml  |    1 +
 MAINTAINERS                                   |   11 +
 .../boot/dts/starfive/jh7110-common.dtsi      |  125 ++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |   41 +
 drivers/gpu/drm/Kconfig                       |    2 +
 drivers/gpu/drm/Makefile                      |    1 +
 drivers/gpu/drm/bridge/Kconfig                |    2 +
 drivers/gpu/drm/bridge/Makefile               |    1 +
 drivers/gpu/drm/bridge/innosilicon/Kconfig    |    6 +
 drivers/gpu/drm/bridge/innosilicon/Makefile   |    2 +
 .../gpu/drm/bridge/innosilicon/inno-hdmi.c    |  376 ++++++
 .../gpu/drm/bridge/innosilicon/inno-hdmi.h    |   34 +
 drivers/gpu/drm/rockchip/Kconfig              |    1 +
 drivers/gpu/drm/rockchip/Makefile             |    2 +-
 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c |  690 +++++++++++
 .../{inno_hdmi.h => inno_hdmi-rockchip.h}     |    0
 drivers/gpu/drm/rockchip/inno_hdmi.c          | 1025 ---------------
 drivers/gpu/drm/verisilicon/Kconfig           |   32 +
 drivers/gpu/drm/verisilicon/Makefile          |   10 +
 .../gpu/drm/verisilicon/inno_hdmi-starfive.c  |  553 +++++++++
 .../gpu/drm/verisilicon/inno_hdmi-starfive.h  |  194 +++
 drivers/gpu/drm/verisilicon/vs_crtc.c         |  241 ++++
 drivers/gpu/drm/verisilicon/vs_crtc.h         |   42 +
 drivers/gpu/drm/verisilicon/vs_dc_hw.c        | 1104 +++++++++++++++++
 drivers/gpu/drm/verisilicon/vs_dc_hw.h        |  492 ++++++++
 drivers/gpu/drm/verisilicon/vs_drv.c          |  777 ++++++++++++
 drivers/gpu/drm/verisilicon/vs_drv.h          |   41 +
 drivers/gpu/drm/verisilicon/vs_modeset.c      |   31 +
 drivers/gpu/drm/verisilicon/vs_modeset.h      |   10 +
 drivers/gpu/drm/verisilicon/vs_plane.c        |  358 ++++++
 drivers/gpu/drm/verisilicon/vs_plane.h        |   27 +
 drivers/gpu/drm/verisilicon/vs_type.h         |   54 +
 include/drm/bridge/inno_hdmi.h                |   56 +
 37 files changed, 5630 insertions(+), 1051 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/innosilicon,inno-hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,jh7110-dc8200.yaml
 create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,jh7110-inno-hdmi.yaml
 create mode 100644 drivers/gpu/drm/bridge/innosilicon/Kconfig
 create mode 100644 drivers/gpu/drm/bridge/innosilicon/Makefile
 create mode 100644 drivers/gpu/drm/bridge/innosilicon/inno-hdmi.c
 create mode 100644 drivers/gpu/drm/bridge/innosilicon/inno-hdmi.h
 create mode 100644 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
 rename drivers/gpu/drm/rockchip/{inno_hdmi.h => inno_hdmi-rockchip.h} (100%)
 delete mode 100644 drivers/gpu/drm/rockchip/inno_hdmi.c
 create mode 100644 drivers/gpu/drm/verisilicon/Kconfig
 create mode 100644 drivers/gpu/drm/verisilicon/Makefile
 create mode 100644 drivers/gpu/drm/verisilicon/inno_hdmi-starfive.c
 create mode 100644 drivers/gpu/drm/verisilicon/inno_hdmi-starfive.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc_hw.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc_hw.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_drv.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_drv.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_modeset.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_modeset.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_type.h
 create mode 100644 include/drm/bridge/inno_hdmi.h

-- 
2.34.1

