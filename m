Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CFE2B8EC1
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 10:29:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53B089A56;
	Thu, 19 Nov 2020 09:29:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60082.outbound.protection.outlook.com [40.107.6.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A43889A1E
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 09:29:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZ3d/V3/1yP7i87d6asLHmcg3neybaioWXLWu7f7FUbw3EAdKXzpHq+CsbklcZYo1mKy+wOF4EKGQ7GQ3V1Dw+qa2PjneliNSi0VeWbTFi4it68L4DZTLLpNtdwvsNXgE0JnqmsLXINa9KwnWFHf1kITPbT8pxRVbMcji6zJdFc0qdKMdtm9960qET2vTWxQzQDJQlD6kfDrSbtvexEGef0DiHxIqvIvsbmmLJ5FA4tGd+i0RRnj4NOu4k25NAmCV/mdOC6xWCPu9slCq5HjwO9oEON531nZGnR/xVBPzii6OEX3PCtJCMm53v5Bcxyuhgk0ry2IcGkJxvA4wgbIWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUaIFSvzvuQgfvpJfSCLqtEQ3126IMImmx5e/osevEk=;
 b=jhdpkutLSMPArdqGsxkuqyq45okijKCkXFvkjEegT1xWUJrPMBxVprjCYnvFfMzJxOq2MPVZagPQc3u2SnlI+BGD9VdQI9z0uY8i4QyHLcTijynU4vn0a77ZgFS6Wn2AHPFkPCQwODwLjWWfzo9/l8eYuQZgOv9zpDAmmVNRjAFFt+3iQZTjbAyU+K2vdKYDGXMkWzw3uTC6RxqbNUjKGc0aavtHMR7WSpm52AiBR/FdQgDcOtuVT7OcirdrP5eZbwdWqV2/nvkXTGCrI8P4seqMTkkkoR4mWnSLwngW2GZbRtjQPWePt6tRlKvbAnw2+PaI3ZLTrXO1skus/BBSTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUaIFSvzvuQgfvpJfSCLqtEQ3126IMImmx5e/osevEk=;
 b=Wq4Y4zNAxSjswBmWRwQmRD8VLFpynb995tBc45IsQLoMDoz+Pwp69i0/st4plS3LESbervDfYU9e3Q0QOVQnYzfrHZ+lUmSfBStLKwW6rFA1NjLjn49mZtFahnqNEI80nbT9rZR4j+eq9MZToIjFJBLE0tpzY0mmJEXoutxdQ1c=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB2973.eurprd04.prod.outlook.com (2603:10a6:802:10::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Thu, 19 Nov
 2020 09:29:23 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3589.021; Thu, 19 Nov 2020
 09:29:23 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] drm/imx: Introduce i.MX8qxp DPU DRM
Date: Thu, 19 Nov 2020 17:22:17 +0800
Message-Id: <1605777745-23625-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR0401CA0002.apcprd04.prod.outlook.com
 (2603:1096:3:1::12) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR0401CA0002.apcprd04.prod.outlook.com (2603:1096:3:1::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3589.20 via Frontend Transport; Thu, 19 Nov 2020 09:29:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6ed29312-29d1-4d4c-65bf-08d88c6d996f
X-MS-TrafficTypeDiagnostic: VI1PR04MB2973:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB2973CB9379AC4BDA8DAC2E6198E00@VI1PR04MB2973.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oN8RputEVvhFl55v5KJXEDt16cDJa/I2EKqxKXzFdFRQjiX2lXSEnHSMQXhGq/2PLp3D/YtumPlrV1XfGXJjIVbYlU1JPHu7CcoIAzDEhRaznZqgzeEX0gF7O97e1luO+tsgppI0ksbAwKzChQY/pxcRxcuxZS+zdA0zWjaT5qQJjS5ylmhEXRPL5DXIBQPchZIcoxlZQDqxQXmIX1gCVx0dM0NvI6K5lBUQ4orRX9pMb7Ar43CLcjIcsgEVcduu450jq8/bTX+EWOYJDZX+kvJCLCWIZpF50c7CnbD2f9mYwDYOInM0ArrL1KH7V+WnWmX97KzQ7NCfcM2hJeTfmesAT0vwolCpHx0W0gp5Z6gBGYx/QWCJOCwk4C9hmg+ACngFKpcKbei8jmdWq/Rp616xW8puhJCqMMye7+ULQCrKQNKlR0XzqANbIFCyzWZ5ATjF/SXDpkforKR+Y/T8tQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(376002)(136003)(39860400002)(2906002)(6512007)(26005)(16526019)(186003)(956004)(86362001)(5660300002)(66476007)(6486002)(66556008)(52116002)(36756003)(316002)(6506007)(66946007)(8936002)(966005)(478600001)(4326008)(7416002)(8676002)(69590400008)(2616005)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: xvCzFmokWm4erHe3BzCcN5sqqD3GXeexyac9FqmeXceMTDhe78acuJJBEbaeDavyYLkDuYVkeLDJYe33xeiYCYc6pQGawQPcl45+vqICmdJIEs/4jxQbf6O7IXIzka7I+NnuNkaL75gzgnLJ1KFskYv/AfnG+qPXnKnXhrFJ+e+eNVrYZCnMmOrIR61aX5oLul/cgGMVMircgtfUqhNEV85AhU58Lp9gxxynA0FK2aSlcUMUVwiPsKKqEg66PtaCde4A6SwUq4/CvPJH0PCTLn0ff9Kkl4gkH1aZsdIVYgreT4CTyrbmCUdnDwAr/ySjXiR1ylW8jWck4i9KMItfgUgxQ6HFKASWRJVJq74Mg1sa47DSShKdJLZhayp+nMFmjMABmfYD/GZOk/T6A0WjelrBnSAtvufa1Tx7ipibJyOcYq9RvAzCGwimGhzQebm3j0IFQhV1k/qFnmxNLBTqn84qspegKRMG8VdT0J90d9BDTm8edFCfbHRpCoa5vfDK0GOseU70XvX5+/O1ANkY4NKT6Imw+9RmhAlAYR+04Cg9ai7c+Vzj6SItImnJOKdO5c3KL4NXcjOH2tlCdUUbQW2pnrH7mtTYt/j3kgxpEb0TaQDhqoEOO1dKpygoiGg8lwnoUyqEddcq3mxMir2RCw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ed29312-29d1-4d4c-65bf-08d88c6d996f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 09:29:22.9372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 68GmB5h88GfssdCM2thSZtvjJSqKNLfuekxNf5dRcbl34XVUSwzfuwN7qrPR3TZvtRr4tjcpMpvOQOOS9b/ddQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2973
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
Cc: tzimmermann@suse.de, airlied@linux.ie, s.hauer@pengutronix.de,
 robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


This patch set introduces i.MX8qxp Display Processing Unit(DPU) DRM support.

DPU is comprised of a blit engine for 2D graphics, a display controller
and a command sequencer.  Outside of DPU, optional prefetch engines can
fetch data from memory prior to some DPU fetchunits of blit engine and
display controller.  The pre-fetchers support linear formats and Vivante
GPU tile formats.

Reference manual can be found at:
https://www.nxp.com/webapp/Download?colCode=IMX8DQXPRM


This patch set adds kernel modesetting support for the display controller part.
It supports two CRTCs per display controller, several planes, prefetch
engines and some properties of CRTC and plane.  Currently, the registers of
the controller is accessed without command sequencer involved, instead just by
using CPU.  DRM connectors would be created from the DPU KMS driver.


If people want to try this series, clock patches can be found at:
https://www.spinics.net/lists/arm-kernel/msg856137.html

and, power domain patches at:
https://www.spinics.net/lists/arm-kernel/msg856097.html


I will send other patch sets to add downstream bridges(embedded in i.MX8qxp)
to support LVDS displays.

A brief look at the pipe:
prefetch eng -> DPU -> pixel combiner -> pixel link -> pixel to DPI(pxl2dpi) ->
LVDS display bridge(LDB)


Patch 1 ~ 3 add dt-bindings for DPU and prefetch engines.
Patch 4 is a minor improvement of a macro to suppress warning as the KMS driver
uses it.
Patch 5 introduces the DPU DRM support.
Patch 6 updates MAINTAINERS.
Patch 7 & 8 add DPU and prefetch engines support in the device tree of
i.MX8qxp MEK platform.


Welcome comments, thanks.


Liu Ying (8):
  dt-bindings: display: imx: Add i.MX8qxp/qm DPU binding
  dt-bindings: display: imx: Add i.MX8qxp/qm PRG binding
  dt-bindings: display: imx: Add i.MX8qxp/qm DPR channel binding
  drm/atomic: Avoid unused-but-set-variable warning on
    for_each_old_plane_in_state
  drm/imx: Introduce i.MX8qxp DPU DRM
  MAINTAINERS: add maintainer for i.MX8qxp DPU DRM driver
  arm64: imx8qxp:dtsi: Introduce DC0 subsystem
  arm64: dts: imx8qxp-mek: Enable DPU and it's prefetch engines

 .../bindings/display/imx/fsl,imx8qxp-dprc.yaml     |  87 ++
 .../bindings/display/imx/fsl,imx8qxp-dpu.yaml      | 358 ++++++++
 .../bindings/display/imx/fsl,imx8qxp-prg.yaml      |  60 ++
 MAINTAINERS                                        |   9 +
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      |  64 ++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi         | 313 +++++++
 drivers/gpu/drm/imx/Kconfig                        |   1 +
 drivers/gpu/drm/imx/Makefile                       |   1 +
 drivers/gpu/drm/imx/dpu/Kconfig                    |  10 +
 drivers/gpu/drm/imx/dpu/Makefile                   |  10 +
 drivers/gpu/drm/imx/dpu/dpu-constframe.c           | 170 ++++
 drivers/gpu/drm/imx/dpu/dpu-core.c                 | 880 ++++++++++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-crtc.c                 | 926 +++++++++++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-crtc.h                 |  62 ++
 drivers/gpu/drm/imx/dpu/dpu-disengcfg.c            | 114 +++
 drivers/gpu/drm/imx/dpu/dpu-dprc.c                 | 721 ++++++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-dprc.h                 |  40 +
 drivers/gpu/drm/imx/dpu/dpu-drv.c                  | 296 +++++++
 drivers/gpu/drm/imx/dpu/dpu-drv.h                  |  28 +
 drivers/gpu/drm/imx/dpu/dpu-extdst.c               | 296 +++++++
 drivers/gpu/drm/imx/dpu/dpu-fetchdecode.c          | 291 +++++++
 drivers/gpu/drm/imx/dpu/dpu-fetcheco.c             | 221 +++++
 drivers/gpu/drm/imx/dpu/dpu-fetchlayer.c           | 151 ++++
 drivers/gpu/drm/imx/dpu/dpu-fetchunit.c            | 609 ++++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-fetchunit.h            | 191 +++++
 drivers/gpu/drm/imx/dpu/dpu-fetchwarp.c            | 247 ++++++
 drivers/gpu/drm/imx/dpu/dpu-framegen.c             | 392 +++++++++
 drivers/gpu/drm/imx/dpu/dpu-gammacor.c             | 220 +++++
 drivers/gpu/drm/imx/dpu/dpu-hscaler.c              | 272 ++++++
 drivers/gpu/drm/imx/dpu/dpu-kms.c                  | 543 ++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-kms.h                  |  23 +
 drivers/gpu/drm/imx/dpu/dpu-layerblend.c           | 345 ++++++++
 drivers/gpu/drm/imx/dpu/dpu-plane.c                | 703 ++++++++++++++++
 drivers/gpu/drm/imx/dpu/dpu-plane.h                |  56 ++
 drivers/gpu/drm/imx/dpu/dpu-prg.c                  | 389 +++++++++
 drivers/gpu/drm/imx/dpu/dpu-prg.h                  |  45 +
 drivers/gpu/drm/imx/dpu/dpu-prv.h                  | 203 +++++
 drivers/gpu/drm/imx/dpu/dpu-tcon.c                 | 249 ++++++
 drivers/gpu/drm/imx/dpu/dpu-vscaler.c              | 305 +++++++
 drivers/gpu/drm/imx/dpu/dpu.h                      | 389 +++++++++
 include/drm/drm_atomic.h                           |   4 +-
 41 files changed, 10293 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
 create mode 100644 drivers/gpu/drm/imx/dpu/Kconfig
 create mode 100644 drivers/gpu/drm/imx/dpu/Makefile
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-constframe.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-core.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-crtc.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-crtc.h
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-disengcfg.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-dprc.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-dprc.h
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-drv.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-drv.h
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-extdst.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchdecode.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetcheco.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchlayer.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchunit.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchunit.h
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchwarp.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-framegen.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-gammacor.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-hscaler.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-kms.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-kms.h
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-layerblend.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-plane.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-plane.h
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-prg.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-prg.h
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-prv.h
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-tcon.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu-vscaler.c
 create mode 100644 drivers/gpu/drm/imx/dpu/dpu.h

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
