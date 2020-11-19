Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 084DE2B9952
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 18:31:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A07D86E5CC;
	Thu, 19 Nov 2020 17:31:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150079.outbound.protection.outlook.com [40.107.15.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE9446E5CA
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 17:31:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hI46MBshFKqu6mfAlzkRux0xSVEC9VLuS8WqKrXvTgJvEeUrna2J1p1Ane2WFtzoUDYatPRdfkpI+aPTTlDf9EJpuFXXsQ8cTwLeXposBKgp7LrhdnkSqB8xsjG+SmcV2BUsdT2od5nV9dE34I/za2cqCZ1QGzw1d8Xogo+rBi9BxxWbY10lLBqHFqeK84X578uiTiwHPUJR317r5T5pX7bCdRTpv4pYYKWxYTl9ryWV8AuFTQQ6/y9hbIO/GbDkdeQO8GaJQe/vV7bdGzCpGcLwCSetBXhlkNNbuK53MWQvIKKonrYk4Ybb53INwHKoJ1uZ2wdxEQdlivqR5/Qb3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CgrxvMj3VobVRTz5+t9k2mRET9lRpnLYIPfWQdyR+tA=;
 b=hJCbd3GDI/Ar2Fd12MMlaWKDCuYQEr91Xi3NFxgz3AiNl80r6GSsrmm/deDlpA9+jVUuHcYKJgeDVlYMM9ETFX4/kkyoeyWBKIK8stmAOMHOEmODzL+wS6pvNHkHVQh3NDTBPkuKhVE+hRKtexFK3wOOi8VTDx1T8yBUcH226IZacN+7g4UY07CTCWB1Tf1WX3aQdVKN1guxJkDsJTQg0fKG3IXVfm8mFsfth/3/JeiZoXyCGnuKOX5FW3g0uVfFC/dhvg0co+2pDMxb0pnknZscFFwbyUnuWFC9t2/vmSdhB8pr6a94xsYjvpSRNmTYB0JKkHvglAtmeyy2xDmmng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CgrxvMj3VobVRTz5+t9k2mRET9lRpnLYIPfWQdyR+tA=;
 b=DUW5RHtG6ngNFul9CAxvzakbGaUstJnEPd6YgTLz23cHVSEs0JDYlPnNVb5FP74n0YaArasAY4e97XM6g9cHr5yxhBZqrjXCFswjK59ajE4tIvNEwjaDslLyUtopb0jPXMfS0KmdMyu1jM3ecHtGrmzJZVY4FYgAdOzOFTp4RFM=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR04MB4477.eurprd04.prod.outlook.com
 (2603:10a6:803:6e::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Thu, 19 Nov
 2020 17:31:00 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::705a:b82f:c52f:5f5a]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::705a:b82f:c52f:5f5a%6]) with mapi id 15.20.3589.022; Thu, 19 Nov 2020
 17:31:00 +0000
Date: Thu, 19 Nov 2020 19:30:55 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH 0/8] drm/imx: Introduce i.MX8qxp DPU DRM
Message-ID: <20201119173055.geaaori62wgtrfvh@fsr-ub1864-141>
References: <1605777745-23625-1-git-send-email-victor.liu@nxp.com>
Content-Disposition: inline
In-Reply-To: <1605777745-23625-1-git-send-email-victor.liu@nxp.com>
User-Agent: NeoMutt/20171215
X-Originating-IP: [83.217.231.2]
X-ClientProxiedBy: AM4PR0302CA0014.eurprd03.prod.outlook.com
 (2603:10a6:205:2::27) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141 (83.217.231.2) by
 AM4PR0302CA0014.eurprd03.prod.outlook.com (2603:10a6:205:2::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Thu, 19 Nov 2020 17:30:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bb5aa52d-c5ad-40ff-4f9b-08d88cb0e14b
X-MS-TrafficTypeDiagnostic: VI1PR04MB4477:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4477B1A168E1FCD1336CFBA8BEE00@VI1PR04MB4477.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q8cSK4EJ1n8ESDnJ/e32x3XW6peRH0QdaEab5KUP82aE4xjJndJfzqX5q5zSdu+WI467ldFREgy8gqyNzBK99HT1ZCVfiVZR9dEmlTu3AnGt0U+MUeHQsEgKR+6CZQzV8ek2xlvghP9Xn4uhtukyXbgi0ZSvT72BD7sVkkzKhxQc6P318FDGugtNf7Vgx4OZSDrDvTPVu//k/pBZ7tTyQxFgcevlwYbE9HoF34cfYtuMcV4yXYBFbXMaURdlxPrYQ6NcUOdz1nshYBT/Mi3h6iYFHP+6GllHGXx4qaLdSh3V6E5VY/FmnOUCZw1TLjrpVEOM0neuc/BJxrKEnVelpltnp/4zGoLDLIZ5jTzI0RN83w2h548SMGafgseHASkh79M2cixPrch4rsKbW/LEJg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39860400002)(346002)(396003)(136003)(55016002)(9686003)(26005)(16526019)(956004)(966005)(6496006)(44832011)(478600001)(33716001)(186003)(8676002)(4326008)(8936002)(316002)(86362001)(6862004)(2906002)(7416002)(52116002)(6666004)(83380400001)(5660300002)(66476007)(66946007)(1076003)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: IlMR5aXYIwZGFO7fDGIaIee9gCqh4YOfWN71TPaPJ+E6Q1fy0xz6ckeKUI0k8pZbO0mI2joScm6aehQKVTgpDK8V3hmpDRgsxiBTwNjRXB3UdnlfmLtOn6wAHymtg6ifltHjUZa9iFK5DeaMvRkK7lmOjCGivD8zEAl5bH+oW16wj1R9gqcx4VjVcNU/3uUdXWEX9jkkXdjS+kc5RSMGbaSva7LVuVsye0CWAZyxu0vMQHNHN2sMLMn7l3qCTo7kkVaJ6Bam+iY+eW6oFhjqGMrDcjBoQz+9UrzeJrNiYUPqljld49zsytjzDSSVUjDoR2elhzEFIioMrFZGjGYCYPuOHaQ0cHSBUi4mMN1FlAWpGBDxOKPQJNHsn+tIx17xGdXwzHNgBV/61cnOdkUPcOu1rWzFviFx4tvAD/gDDDicEu8OvbuZ01gUCmX3JwJR7TIU9bMAnI2anyRkQJsZSNfx5coN3t0bRREqqxkhEAu/8+N6i7ZQ0iFLuHjSSH1SxOuVnsD5nJme1M/4Mtwen7lYzd+EfR7++oH8WZCLoHq+2SmHqVuSkGLNpLD03CH/SpkG3TFzsxZEht7EnCRNiKj3izZFX3JYxlCoKxMwrbmgZqbGEocToXXW5BzMJinVFh9vfO6xjHIwkEQjpAnTdET6K+y+c2c1riFubQ0vT3Y+GyPwuT5LOqdzINq1kUzNfHY9qqgV/Y/BECMMhC28KRfV/0bdz+0bg75qlDjKhI0kXfd1RRmSaJnYYs5Pg69I9EbNRKT3It8NNyLEYlHGjYhUaG2jj/0X6zLj5I5tj0TT7P1oqepbjZ+BUvyIcloR/6wnFuHqadQc8yoINjYMFL1C6sZXE1n3YgVtvt0wNhTF4+RdapW3N9tLKbEoepqX3wzdWr2ISR0LKLnuRd+Nig==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb5aa52d-c5ad-40ff-4f9b-08d88cb0e14b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 17:30:59.8934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +5xhGWxOmN8WOV+2NG1Y+UvU20HGU6fd5nx2GUQQoi9trsU06QWy4lZ2eRiTaES6mG49sWTRpfKDJMB8fLesjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4477
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

Hi Liu Ying,

On Thu, Nov 19, 2020 at 05:22:17PM +0800, Liu Ying wrote:
> Hi,
> 
> 
> This patch set introduces i.MX8qxp Display Processing Unit(DPU) DRM support.

Glad to see this series out. However, something went wrong with it as
patch 5/8 didn't make it to dri-devel mailing list... :/

https://lists.freedesktop.org/archives/dri-devel/2020-November/thread.html

So, people on to dri-devel may not be able to review it...

However, it did make it to LKML:

https://lkml.org/lkml/2020/11/19/249

Not sure what happened here... :/

Thanks,
laurentiu


> 
> DPU is comprised of a blit engine for 2D graphics, a display controller
> and a command sequencer.  Outside of DPU, optional prefetch engines can
> fetch data from memory prior to some DPU fetchunits of blit engine and
> display controller.  The pre-fetchers support linear formats and Vivante
> GPU tile formats.
> 
> Reference manual can be found at:
> https://www.nxp.com/webapp/Download?colCode=IMX8DQXPRM
> 
> 
> This patch set adds kernel modesetting support for the display controller part.
> It supports two CRTCs per display controller, several planes, prefetch
> engines and some properties of CRTC and plane.  Currently, the registers of
> the controller is accessed without command sequencer involved, instead just by
> using CPU.  DRM connectors would be created from the DPU KMS driver.
> 
> 
> If people want to try this series, clock patches can be found at:
> https://www.spinics.net/lists/arm-kernel/msg856137.html
> 
> and, power domain patches at:
> https://www.spinics.net/lists/arm-kernel/msg856097.html
> 
> 
> I will send other patch sets to add downstream bridges(embedded in i.MX8qxp)
> to support LVDS displays.
> 
> A brief look at the pipe:
> prefetch eng -> DPU -> pixel combiner -> pixel link -> pixel to DPI(pxl2dpi) ->
> LVDS display bridge(LDB)
> 
> 
> Patch 1 ~ 3 add dt-bindings for DPU and prefetch engines.
> Patch 4 is a minor improvement of a macro to suppress warning as the KMS driver
> uses it.
> Patch 5 introduces the DPU DRM support.
> Patch 6 updates MAINTAINERS.
> Patch 7 & 8 add DPU and prefetch engines support in the device tree of
> i.MX8qxp MEK platform.
> 
> 
> Welcome comments, thanks.
> 
> 
> Liu Ying (8):
>   dt-bindings: display: imx: Add i.MX8qxp/qm DPU binding
>   dt-bindings: display: imx: Add i.MX8qxp/qm PRG binding
>   dt-bindings: display: imx: Add i.MX8qxp/qm DPR channel binding
>   drm/atomic: Avoid unused-but-set-variable warning on
>     for_each_old_plane_in_state
>   drm/imx: Introduce i.MX8qxp DPU DRM
>   MAINTAINERS: add maintainer for i.MX8qxp DPU DRM driver
>   arm64: imx8qxp:dtsi: Introduce DC0 subsystem
>   arm64: dts: imx8qxp-mek: Enable DPU and it's prefetch engines
> 
>  .../bindings/display/imx/fsl,imx8qxp-dprc.yaml     |  87 ++
>  .../bindings/display/imx/fsl,imx8qxp-dpu.yaml      | 358 ++++++++
>  .../bindings/display/imx/fsl,imx8qxp-prg.yaml      |  60 ++
>  MAINTAINERS                                        |   9 +
>  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      |  64 ++
>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi         | 313 +++++++
>  drivers/gpu/drm/imx/Kconfig                        |   1 +
>  drivers/gpu/drm/imx/Makefile                       |   1 +
>  drivers/gpu/drm/imx/dpu/Kconfig                    |  10 +
>  drivers/gpu/drm/imx/dpu/Makefile                   |  10 +
>  drivers/gpu/drm/imx/dpu/dpu-constframe.c           | 170 ++++
>  drivers/gpu/drm/imx/dpu/dpu-core.c                 | 880 ++++++++++++++++++++
>  drivers/gpu/drm/imx/dpu/dpu-crtc.c                 | 926 +++++++++++++++++++++
>  drivers/gpu/drm/imx/dpu/dpu-crtc.h                 |  62 ++
>  drivers/gpu/drm/imx/dpu/dpu-disengcfg.c            | 114 +++
>  drivers/gpu/drm/imx/dpu/dpu-dprc.c                 | 721 ++++++++++++++++
>  drivers/gpu/drm/imx/dpu/dpu-dprc.h                 |  40 +
>  drivers/gpu/drm/imx/dpu/dpu-drv.c                  | 296 +++++++
>  drivers/gpu/drm/imx/dpu/dpu-drv.h                  |  28 +
>  drivers/gpu/drm/imx/dpu/dpu-extdst.c               | 296 +++++++
>  drivers/gpu/drm/imx/dpu/dpu-fetchdecode.c          | 291 +++++++
>  drivers/gpu/drm/imx/dpu/dpu-fetcheco.c             | 221 +++++
>  drivers/gpu/drm/imx/dpu/dpu-fetchlayer.c           | 151 ++++
>  drivers/gpu/drm/imx/dpu/dpu-fetchunit.c            | 609 ++++++++++++++
>  drivers/gpu/drm/imx/dpu/dpu-fetchunit.h            | 191 +++++
>  drivers/gpu/drm/imx/dpu/dpu-fetchwarp.c            | 247 ++++++
>  drivers/gpu/drm/imx/dpu/dpu-framegen.c             | 392 +++++++++
>  drivers/gpu/drm/imx/dpu/dpu-gammacor.c             | 220 +++++
>  drivers/gpu/drm/imx/dpu/dpu-hscaler.c              | 272 ++++++
>  drivers/gpu/drm/imx/dpu/dpu-kms.c                  | 543 ++++++++++++
>  drivers/gpu/drm/imx/dpu/dpu-kms.h                  |  23 +
>  drivers/gpu/drm/imx/dpu/dpu-layerblend.c           | 345 ++++++++
>  drivers/gpu/drm/imx/dpu/dpu-plane.c                | 703 ++++++++++++++++
>  drivers/gpu/drm/imx/dpu/dpu-plane.h                |  56 ++
>  drivers/gpu/drm/imx/dpu/dpu-prg.c                  | 389 +++++++++
>  drivers/gpu/drm/imx/dpu/dpu-prg.h                  |  45 +
>  drivers/gpu/drm/imx/dpu/dpu-prv.h                  | 203 +++++
>  drivers/gpu/drm/imx/dpu/dpu-tcon.c                 | 249 ++++++
>  drivers/gpu/drm/imx/dpu/dpu-vscaler.c              | 305 +++++++
>  drivers/gpu/drm/imx/dpu/dpu.h                      | 389 +++++++++
>  include/drm/drm_atomic.h                           |   4 +-
>  41 files changed, 10293 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dprc.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-prg.yaml
>  create mode 100644 drivers/gpu/drm/imx/dpu/Kconfig
>  create mode 100644 drivers/gpu/drm/imx/dpu/Makefile
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-constframe.c
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-core.c
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-crtc.c
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-crtc.h
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-disengcfg.c
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-dprc.c
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-dprc.h
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-drv.c
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-drv.h
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-extdst.c
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchdecode.c
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetcheco.c
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchlayer.c
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchunit.c
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchunit.h
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-fetchwarp.c
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-framegen.c
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-gammacor.c
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-hscaler.c
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-kms.c
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-kms.h
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-layerblend.c
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-plane.c
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-plane.h
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-prg.c
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-prg.h
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-prv.h
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-tcon.c
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu-vscaler.c
>  create mode 100644 drivers/gpu/drm/imx/dpu/dpu.h
> 
> -- 
> 2.7.4
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
