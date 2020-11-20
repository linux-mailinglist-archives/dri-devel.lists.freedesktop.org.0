Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 225B92BA04D
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 03:25:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6CA56E85F;
	Fri, 20 Nov 2020 02:25:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10058.outbound.protection.outlook.com [40.107.1.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40746E85F
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 02:25:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kM7FNjj/XzfJzuj5Og+Mc45zjDyPBgKJf8VTLwD0rgPHH2LWp+yBgrio8ImLOudE2+V9uc9SZOF0DFPfY/u3rdmcMSRRz5rInjMShv9E04Hdw4VCzEa+amWLMDFg/45PoOS26dZx01pv09u5uXynYxxqNnxw+xjpei6ZdCm8j1X9EOrhUevzL6QuD8JYvBg2t7YlTfPvC2XOmgatcbCc5KGCO9PJrZOWTloelNZ2HzvxoSnTjsDCXayfDDkrz8CwwnA6Q2ryPylaK4lIll62WYH4ehSHNv48doiyqYEdGXYfaXCJi62LqFgqbfWDa6lKK9SrNGM9NnGrFWdR8XOyZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8qRRka45cH5qHNlVMjSWD6D4w6zti43Sr8vA4EixUUc=;
 b=Isbt1G8v2nk7/Mln3PBdWyZQYBBvAH8qNbJBqJnUfA742wYtYM83nifISvPp2ux9HuhXdnNsBow9atTujn4+qlcU6adol7bY70K3uzyT4k8L9U37MNRYheiopTZl6Ae+dFNai3CK/3gUAQkWV4hGYZiBXqFfsKPPomoDnkbHickeL8xcYK5X/L8JNusWMValxijUTkqGcdOA/J4TsoyZweGPJKZkuQ1KVqEGsg8KfS2qLuqPLc4CdF5kktW91sT5F9rrsyl1RPiF7SSESpiKqpgzQ7H9k3num8O0YVwKmurFzDgr6KYh76agn38lbsdhe6K7OJG1255UD9KrkKTAgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8qRRka45cH5qHNlVMjSWD6D4w6zti43Sr8vA4EixUUc=;
 b=c5CdF9Qy40xXYdLFFqEtlFIGHP948wOrebSINYitJ0arR+5ZJuUf7QAU6eASwdigpYRh/L2mZmGVPRPZD21cwa1CI4wqmoR0sM3HFcEJq9wSLn/+yBG3r2hrzeoxp5sUA1iACmaHZQr6+VvHwo6fSgcjYicruGVlKYqbf7dw2eE=
Authentication-Results: oss.nxp.com; dkim=none (message not signed)
 header.d=none;oss.nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0401MB2317.eurprd04.prod.outlook.com (2603:10a6:800:28::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Fri, 20 Nov
 2020 02:24:57 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3589.021; Fri, 20 Nov 2020
 02:24:57 +0000
Message-ID: <fb134d2ac1e9cebdb27b780ebacf9d944d517205.camel@nxp.com>
Subject: Re: [PATCH 0/8] drm/imx: Introduce i.MX8qxp DPU DRM
From: Liu Ying <victor.liu@nxp.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Date: Fri, 20 Nov 2020 10:23:03 +0800
In-Reply-To: <20201119173055.geaaori62wgtrfvh@fsr-ub1864-141>
References: <1605777745-23625-1-git-send-email-victor.liu@nxp.com>
 <20201119173055.geaaori62wgtrfvh@fsr-ub1864-141>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0102.apcprd06.prod.outlook.com
 (2603:1096:3:14::28) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry.ap.freescale.net (119.31.174.66) by
 SG2PR06CA0102.apcprd06.prod.outlook.com (2603:1096:3:14::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Fri, 20 Nov 2020 02:24:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2337a684-9a2c-4371-21fd-08d88cfb78f7
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2317:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB23172B050A0E128A14A63D5498FF0@VI1PR0401MB2317.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yQniOzl1MRtjTHe7rLB35x1pJVFnVwACDq6Rwqw5x4oARGhMZalk7gR/m5sQ2jq2pey1jMQXOCHOnyQISNTolhRpoOq8WPnyvPXk3ZCNhs/GK0McmdX+EYo/j0w2OLLovUyHvlL0xfbeQLSZhTbHl5/pMwIwvaJKfOtc+6v37yDlJWPKSPSlxMafrnbaynXd1haGY6V1oLMzyqL+XRoDO32UeQPjE3jeEZKK5vkoK7D6Wo3io0FPuyv/pqL9yUcrCBmEoxP6maydvdpk/hIrGUWW5EOAPtRxIjmkBPF7wFxv91FoyXt+PJ+YuMnKdb4vqGumW6QiVOZdHhD+DDI75IjiHlg/RsdKA/3TPcWh61cVvYi/LTaks39QXX8BIJrKqRi93Oc+/aHxC2s/rSKmlQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39850400004)(396003)(136003)(366004)(52116002)(83380400001)(86362001)(8676002)(36756003)(966005)(6506007)(6486002)(6666004)(6512007)(478600001)(5660300002)(4001150100001)(26005)(16526019)(66476007)(66946007)(2906002)(66556008)(186003)(2616005)(7416002)(6862004)(956004)(316002)(4326008)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: zbbo9Ayp4+D7Ts4I98/RCBQy96gDkZp3gVtfVAlZHtajhA9YxMGwFX2nOKjrsZZ0RV784Ar5QVyDw7FDm3Pq/TTLWa/k23lF19xlSES2HeT3ZsG5a/zbhlrHx0n8CboHs+cfNydqiHp05gwxBgA6Lz3CdItG9NrMsoLAFBYVbxkrzSBTuG2kC/Bm6kZgivhJbfkF89CgzEfq5Ixpi0BN3YKhvIUla3WBqpu0PH+I11Te+WXnejJpXoH8F6sdTMsYJNa/qU+XGuLTneh3qjCecO/oeGoireCvQJEE4jym80+OMVRiNYW4285akWsaN8mo9JLfJuuImDVixPS8kZ7GsUJ6soSbalMRZOs2BHgARtajMVw3fkYGuKGaKVLeR87vZK42vqtZb070lwF7JWlOOYVFGNZPOFehwqFbokVgemyijn2lxzLXlck5/oCxm2wZXuWjat2h8WNhyzed2GdyOaXMAPXbXHuAkmuxjOLbCb72u7JT2pyidhr+23kWVAnxgQlSkbP/556qkOmF5HrsVE2Ya+XwNRBx6H62qQM7LoFu3Gz5LAQmWV55qOEXdzUnbUIzA92fk6ow5pVGwwgZ1CDLsRhIqLZam7kpp2zZXLZMBXHomHfl/0BZL22YPgI/k08oHldeTsVXIE4+Ni/NOw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2337a684-9a2c-4371-21fd-08d88cfb78f7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2020 02:24:57.4372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AuX6mq394qwXxRuHcpVH+xIl3qPTvrEb8byFeh5tPE9a2Lz6LF/J1uzIEunV8whY4Zyegrn988WUled8BKd3Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2317
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
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de, airlied@linux.ie,
 s.hauer@pengutronix.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, linux-imx@nxp.com,
 tzimmermann@suse.de, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurentiu,

On Thu, 2020-11-19 at 19:30 +0200, Laurentiu Palcu wrote:
> Hi Liu Ying,
> 
> On Thu, Nov 19, 2020 at 05:22:17PM +0800, Liu Ying wrote:
> > Hi,
> > 
> > 
> > This patch set introduces i.MX8qxp Display Processing Unit(DPU) DRM support.
> 
> Glad to see this series out. However, something went wrong with it as
> patch 5/8 didn't make it to dri-devel mailing list... :/
> 
> https://lists.freedesktop.org/archives/dri-devel/2020-November/thread.html
> 
> So, people on to dri-devel may not be able to review it...

I think that patch was held for a moment, it appears on dri-devel
archive now:

https://lists.freedesktop.org/archives/dri-devel/2020-November/287958.html

I did receive an email from 'linux-arm-kernel' that says the msg body
of that patch is too big(> 100KB), thus being held for moderator's
review(I hope it pass now).
Maybe, dri-devel did sth similar.

Regards,
Liu Ying

> 
> However, it did make it to LKML:
> 
> https://lkml.org/lkml/2020/11/19/249
> 
> Not sure what happened here... :/
> 
> Thanks,
> laurentiu
> 
> 
> > DPU is comprised of a blit engine for 2D graphics, a display controller
> > and a command sequencer.  Outside of DPU, optional prefetch engines can
> > fetch data from memory prior to some DPU fetchunits of blit engine and
> > display controller.  The pre-fetchers support linear formats and Vivante
> > GPU tile formats.
> > 
> > Reference manual can be found at:
> > https://www.nxp.com/webapp/Download?colCode=IMX8DQXPRM
> > 
> > 
> > This patch set adds kernel modesetting support for the display controller part.
> > It supports two CRTCs per display controller, several planes, prefetch
> > engines and some properties of CRTC and plane.  Currently, the registers of
> > the controller is accessed without command sequencer involved, instead just by
> > using CPU.  DRM connectors would be created from the DPU KMS driver.
> > 
> > 
> > If people want to try this series, clock patches can be found at:
> > https://www.spinics.net/lists/arm-kernel/msg856137.html
> > 
> > and, power domain patches at:
> > https://www.spinics.net/lists/arm-kernel/msg856097.html
> > 
> > 
> > I will send other patch sets to add downstream bridges(embedded in i.MX8qxp)
> > to support LVDS displays.
> > 
> > A brief look at the pipe:
> > prefetch eng -> DPU -> pixel combiner -> pixel link -> pixel to DPI(pxl2dpi) ->
> > LVDS display bridge(LDB)
> > 
> > 
> > Patch 1 ~ 3 add dt-bindings for DPU and prefetch engines.
> > Patch 4 is a minor improvement of a macro to suppress warning as the KMS driver
> > uses it.
> > Patch 5 introduces the DPU DRM support.
> > Patch 6 updates MAINTAINERS.
> > Patch 7 & 8 add DPU and prefetch engines support in the device tree of
> > i.MX8qxp MEK platform.
> > 
> > 
> > Welcome comments, thanks.
> > 
> > 
> > Liu Ying (8):
> >   dt-bindings: display: imx: Add i.MX8qxp/qm DPU binding
> >   dt-bindings: display: imx: Add i.MX8qxp/qm PRG binding
> >   dt-bindings: display: imx: Add i.MX8qxp/qm DPR channel binding
> >   drm/atomic: Avoid unused-but-set-variable warning on
> >     for_each_old_plane_in_state
> >   drm/imx: Introduce i.MX8qxp DPU DRM
> >   MAINTAINERS: add maintainer for i.MX8qxp DPU DRM driver
> >   arm64: imx8qxp:dtsi: Introduce DC0 subsystem
> >   arm64: dts: imx8qxp-mek: Enable DPU and it's prefetch engines
> > 
> >  .../bindings/display/imx/fsl,imx8qxp-dprc.yaml     |  87 ++
> >  .../bindings/display/imx/fsl,imx8qxp-dpu.yaml      | 358 ++++++++
> >  .../bindings/display/imx/fsl,imx8qxp-prg.yaml      |  60 ++
> >  MAINTAINERS                                        |   9 +
> >  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      |  64 ++
> >  arch/arm64/boot/dts/freescale/imx8qxp.dtsi         | 313 +++++++
> >  drivers/gpu/drm/imx/Kconfig                        |   1 +
> >  drivers/gpu/drm/imx/Makefile                       |   1 +
> >  drivers/gpu/drm/imx/dpu/Kconfig                    |  10 +
> >  drivers/gpu/drm/imx/dpu/Makefile                   |  10 +
> >  drivers/gpu/drm/imx/dpu/dpu-constframe.c           | 170 ++++
> >  drivers/gpu/drm/imx/dpu/dpu-core.c                 | 880 ++++++++++++++++++++
> >  drivers/gpu/drm/imx/dpu/dpu-crtc.c                 | 926 +++++++++++++++++++++
> >  drivers/gpu/drm/imx/dpu/dpu-crtc.h                 |  62 ++
> >  drivers/gpu/drm/imx/dpu/dpu-disengcfg.c            | 114 +++
> >  drivers/gpu/drm/imx/dpu/dpu-dprc.c                 | 721 ++++++++++++++++
> >  drivers/gpu/drm/imx/dpu/dpu-dprc.h                 |  40 +
> >  drivers/gpu/drm/imx/dpu/dpu-drv.c                  | 296 +++++++
> >  drivers/gpu/drm/imx/dpu/dpu-drv.h                  |  28 +
> >  drivers/gpu/drm/imx/dpu/dpu-extdst.c               | 296 +++++++
> >  drivers/gpu/drm/imx/dpu/dpu-fetchdecode.c          | 291 +++++++
> >  drivers/gpu/drm/imx/dpu/dpu-fetcheco.c             | 221 +++++
> >  drivers/gpu/drm/imx/dpu/dpu-fetchlayer.c           | 151 ++++
> >  drivers/gpu/drm/imx/dpu/dpu-fetchunit.c            | 609 ++++++++++++++
> >  drivers/gpu/drm/imx/dpu/dpu-fetchunit.h            | 191 +++++
> >  drivers/gpu/drm/imx/dpu/dpu-fetchwarp.c            | 247 ++++++
> >  drivers/gpu/drm/imx/dpu/dpu-framegen.c             | 392 +++++++++
> >  drivers/gpu/drm/imx/dpu/dpu-gammacor.c             | 220 +++++
> >  drivers/gpu/drm/imx/dpu/dpu-hscaler.c              | 272 ++++++
> >  drivers/gpu/drm/imx/dpu/dpu-kms.c                  | 543 ++++++++++++
> >  drivers/gpu/drm/imx/dpu/dpu-kms.h                  |  23 +
> >  drivers/gpu/drm/imx/dpu/dpu-layerblend.c           | 345 ++++++++
> >  drivers/gpu/drm/imx/dpu/dpu-plane.c                | 703 ++++++++++++++++
> >  drivers/gpu/drm/imx/dpu/dpu-plane.h                |  56 ++
> >  drivers/gpu/drm/imx/dpu/dpu-prg.c                  | 389 +++++++++
> >  drivers/gpu/drm/imx/dpu/dpu-prg.h                  |  45 +
> >  drivers/gpu/drm/imx/dpu/dpu-prv.h                  | 203 +++++
> >  drivers/gpu/drm/imx/dpu/dpu-tcon.c                 | 249 ++++++
> >  drivers/gpu/drm/imx/dpu/dpu-vscaler.c              | 305 +++++++
> >  drivers/gpu/drm/imx/dpu/dpu.h                      | 389 +++++++++
> >  include/drm/drm_atomic.h                           |   4 +-
> >  41 files changed, 10293 insertions(+), 1 deletion(-)
> >  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
> >  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml
> >  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
> >  create mode 100644 drivers/gpu/drm/imx/dpu/Kconfig
> >  create mode 100644 drivers/gpu/drm/imx/dpu/Makefile
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-constframe.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-core.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-crtc.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-crtc.h
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-disengcfg.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-dprc.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-dprc.h
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-drv.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-drv.h
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-extdst.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchdecode.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetcheco.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchlayer.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchunit.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchunit.h
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchwarp.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-framegen.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-gammacor.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-hscaler.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-kms.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-kms.h
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-layerblend.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-plane.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-plane.h
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-prg.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-prg.h
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-prv.h
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-tcon.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-vscaler.c
> >  create mode 100644 drivers/gpu/drm/imx/dpu/dpu.h
> > 
> > -- 
> > 2.7.4
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
