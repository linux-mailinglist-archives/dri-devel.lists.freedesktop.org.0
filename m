Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B8F2F8239
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 18:27:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 529D76E0B8;
	Fri, 15 Jan 2021 17:27:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2075.outbound.protection.outlook.com [40.107.21.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B606E0B8
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 17:27:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GvcL1qZnViMZ80T5n5sjV7tcKwoY7VCDEufcu5i+Wv2WZd4vjAtufXKZRtPIK7y6gCUTm09R+pZ7OJh1nyMDJxmN1DMqo2VpU+YbNluJM5eGtSdKnRmEyyoN7ZvEkYniRFiOpiTkfs+Ox13ZdYiWcuv2HlZ5CEfdoJYykxza/EIjufYmTdSFeA0XCb3ARd/IJuTIlDsWuVyZY/0aPJxgwj2qFII1Ql4J3ueujyP6hCPHN1HzoCMUqMroOQrfhzPce4paY30+9ZruRTZeejV2Yuh6zc6Ol6qzGe8VaWDbcXxEbcIYwYlkqNMmi4sSXPbhz8AnIXBhprFm7WCuBRszMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LePxBe/X4IrMmmG/jdHLC5bleM7ww2aPwLSXEjciWOA=;
 b=DBRrUdy0K2oMuvlalMgDuzstDlhRfZDlPkeafYSls0TSjI6QEc+bTJlRGHKivwJ4QNYwYVL8AfJ4JoA4XdU1LnrrIO5J9izkx8SGdQfBM0fcxZqvwwawX9Hb5LHi9q4R+Z5JYtQeFtXr7BE0YExga0nuCurklHr1XAvdRGLsIuSEPh9ViE+UfsXN/8WBMyyllRCYLb4d5EV+/G2MjhqnKT5lEtQL4VjPmgnPkhjJD1aFx6EqyibuQmR5vL/p5yi1Lufe6JHemGCEzsjs9C5jRBGjNxyJyTKxEaj/CUMMD5VmPMaYGOLlfV4cmP2i51/dqISuAxopwmlIU2cNhf+Zqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LePxBe/X4IrMmmG/jdHLC5bleM7ww2aPwLSXEjciWOA=;
 b=FBqKcxG8ynQaPFkldnxM+1rTQ2lpAW7hcMI0QucIfkCtMsB66fW+KjbV4+igoCVQWvLgrdAlqHBMJM1wpw6FWng7UUrOS6F4AZm+wCLtdBP5ZNTBR6y32LmDKBjVIuaaTtaKA74v6rq0K7ZabZEFQ7ZaP+05wYUV1MGIL8UkZ4s=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR04MB4991.eurprd04.prod.outlook.com
 (2603:10a6:803:57::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Fri, 15 Jan
 2021 17:27:32 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::41ff:37e2:c7f5:56a1]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::41ff:37e2:c7f5:56a1%5]) with mapi id 15.20.3742.012; Fri, 15 Jan 2021
 17:27:32 +0000
Date: Fri, 15 Jan 2021 19:27:26 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v5 5/6] drm/imx: Introduce i.MX8qm/qxp DPU DRM
Message-ID: <20210115172726.vixzl7wc3kt2n5u6@fsr-ub1864-141>
References: <1608261833-24772-1-git-send-email-victor.liu@nxp.com>
 <1608261833-24772-6-git-send-email-victor.liu@nxp.com>
Content-Disposition: inline
In-Reply-To: <1608261833-24772-6-git-send-email-victor.liu@nxp.com>
User-Agent: NeoMutt/20171215
X-Originating-IP: [83.217.231.2]
X-ClientProxiedBy: AM8P189CA0006.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::11) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141 (83.217.231.2) by
 AM8P189CA0006.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9 via Frontend Transport; Fri, 15 Jan 2021 17:27:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3a464826-cedf-4824-4d6c-08d8b97ad6ac
X-MS-TrafficTypeDiagnostic: VI1PR04MB4991:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4991AEFC37DAECEA9781188CBEA70@VI1PR04MB4991.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nPSJJ0xvfwsq0wzcXKjGREps/Qnb2+z8cLdP39ptOLZOvKW5cDO9YQMIkbSOxxWT9CRtXTl4TQA3vzoMFZ7+qM5mW1yWBd6SCzcjHFx4Le2NUwZkgNKYDB/5YqomOoNNxjkWWizDwA87IpB1r99rKodzTL3Uo4bqrUCo+jHYP1AWPCmeub4f2Fh1tPKTH/2sk0dw9L0w/Z8CjPuCwY825TOAZkXt4fcF6RBWh5FUWMycOdaW0dwgM5kpVlvrSH1OjAAZZ88DVQOr8JvbhPJ9iXg6Gu1vAbf7tdVuF5xPp0ApsIQTqCMC1JjyJLaawHPlUPSZPADCgdvD9VXFGdYmhMu0P9/qRf8uKWI/206nhzyN7+Mjy5eBW3o3hoQqupC6T9/eD/NEhJXaniJXNPe5/MYRwWOByNCwqoJAzTxrqnx9+Jgr81OVLSpY4NIg4tziA3zozkFwFI/t123c78b/oOP00wO7Z2I9aSWP/CtLH3VA9deQ3QyDccAen8PdPHfacNGsWk5E7OBHGgKvGlYHLPN52pWrwo4aLjrowA6k/DXL00f9VhiSb8YAeInxYW2YqOB7AomRGwRrZwVHZ5+Wgb2Rp83dUGlYFMPuhLnqn+g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(346002)(376002)(366004)(136003)(966005)(2906002)(66476007)(8676002)(9686003)(1076003)(5660300002)(478600001)(7416002)(956004)(316002)(26005)(44832011)(6496006)(8936002)(33716001)(52116002)(4326008)(16526019)(186003)(66946007)(6666004)(55016002)(83380400001)(30864003)(86362001)(6862004)(66556008)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?c3Hfhf1bmU9pZSpgSvkzO7pUgBirx2I9rkKIMrmY3HeTpaahZ+cakShjzEer?=
 =?us-ascii?Q?8+OyoEu2LOhwjUpiSB/Auymk7W/GuFGVI98O02Pg9RZuh4IDjbdrr+f0joB2?=
 =?us-ascii?Q?2elO6fyoCrTQLy61e3rCxcaVYR2WkkJRHNXTg534Ph2Vl1LpPYPzolJ3PL/V?=
 =?us-ascii?Q?gm+ZOpqb/wRrqD/i+fTboV2rXD432rjvgvB7ve9XgjmIubcP52EzEXTr7Pue?=
 =?us-ascii?Q?mxXPUYFo5WBYDv6vbG+zIcf2DAkoGAW3VmaTEyZfoYAk9mBdFPN0hdEcox9J?=
 =?us-ascii?Q?jhIxMDOo0Sg1qEMiHqZSbmExDbnAWIDf/pBHyo0tchw+xH21BKv6h68znOo9?=
 =?us-ascii?Q?9R7BqJBzhEq8QUUwK535rPaoaf0A8A6UvfuMdt5oQhERmlt/l4jwhgCrk5JQ?=
 =?us-ascii?Q?2qAR/USsUacMel9FqaVvakTD/YXUNSmUhVYsawJFuVkd2vsZVBvSYle/16OC?=
 =?us-ascii?Q?Fs9Tn9g9WpTtTI4FCdfMVIGuszcM+cJgLEd8XTAKKMuga30xUrHWf855xfGm?=
 =?us-ascii?Q?akqZYXjk+/md5gS836OQ8sB+gRdIRJEatFBJJZzN35XAmOYRdPRdfGz54MT4?=
 =?us-ascii?Q?pVkstV4ohC/lmjvMP42+bo/I6eWkjIh9bY3j7mWZLP7SB8bR527vKOsHHTT0?=
 =?us-ascii?Q?Xhsr6D/DyDhJjnw6sNiyt+TkWRL6cTIxFSryYEiK6B4ntjHlKOWrYNH5JLVZ?=
 =?us-ascii?Q?zOmT9/LfJVoNna3FI1IZm8UHyDtiXuhArHiDLcfl2Aa/8RAIUzP7RZukbPiq?=
 =?us-ascii?Q?rb6em4CV11N67q683vHdm928HLhRpcCPNPzNeww15ks9OmIDkg0PiI7OR2Gg?=
 =?us-ascii?Q?YB5WOKfTQlcF4+Neq5ZzknTXSHqX8iZ4GcPx6HXglzEgK0qggIaTVBwOkLKc?=
 =?us-ascii?Q?Crz0NIpk0rWODN3wLLrbcSSwMkiP/XvxDglfhGtjktslZGOEiwPonpNhS+Rg?=
 =?us-ascii?Q?z6PMbO+NKhxDvZGZgeZ5KUZuLzPdbKOdzSm+XWS7Bhk=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a464826-cedf-4824-4d6c-08d8b97ad6ac
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 17:27:31.9235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v+dzmOA86X444WIor36VIipzTVcCkVlqzdNPDYVqDTD5wqtGcgqM5fF5jUZ7/WnqkrqU3EJdwe8I2Ylazo1mhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4991
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
Cc: devicetree@vger.kernel.org, tzimmermann@suse.de, airlied@linux.ie,
 s.hauer@pengutronix.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, linux-imx@nxp.com,
 guido.gunther@puri.sm, shawnguo@kernel.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Liu Ying,

I promised I would have a second, more in-depth, look at this and I finally
managed to do it.

I have to admit it was a challenge. Partially because I'm not very familiar
with DPU but mostly because of the abundance of macros used. It's true, macros
make the code more compact. However they made the entire code hard to read,
as neither ctags nor cscope were able to cross-reference it properly, and I
fear it will be even harder to maintain in the long run... :/ For example,
trying to figure out where dpu_*_hw_init() functions were called from was no
easy task. Or dpu_*_put(). Or dpu_*_get(). :/

Also, most of the macros are not in-line with Linux Kernel coding
style when it comes to macro usage: they affect control flow and some depend
on other local variables being already defined.

The good news is most macros can be replaced with helper functions and it would
not add too much extra code.

More comments below.

On Fri, Dec 18, 2020 at 11:23:52AM +0800, Liu Ying wrote:
> This patch introduces i.MX8qm/qxp Display Processing Unit(DPU) DRM support.
> 
> DPU is comprised of two main components that include a blit engine for
> 2D graphics accelerations(with composition support) and a display controller
> for display output processing, as well as a command sequencer.  Outside of
> DPU, optional prefetch engines, a.k.a, Prefetch Resolve Gasket(PRG) and
> Display Prefetch Resolve(DPR), can fetch data from memory prior to some DPU
> fetchunits of blit engine and display controller.  The prefetch engines
> support reading linear formats and resolving Vivante GPU tile formats.
> 
> This patch adds kernel modesetting support for the display controller part.
> The driver supports two CRTCs per display controller, planes backed by
> four fetchunits(decode0/1, fetchlayer, fetchwarp), fetchunit allocation
> logic for the two CRTCs, prefetch engines(with tile resolving supported),
> plane upscaling/deinterlacing/yuv2rgb CSC/alpha blending and CRTC gamma
> correction.  The registers of the controller is accessed without command
> sequencer involved, instead just by using CPU.
> 
> Reference manual can be found at:
> https://www.nxp.com/webapp/Download?colCode=IMX8DQXPRM
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v4->v5:
> * Rebase up onto the latest drm-misc-next branch and remove the hook to
>   drm_atomic_helper_legacy_gamma_set(), because it was dropped by the newly
>   landed commit 'drm: automatic legacy gamma support'.
> * Remove a redundant blank line from dpu_plane_atomic_update().
> 
> v3->v4:
> * No change.
> 
> v2->v3:
> * Fix build warnings Reported-by: kernel test robot <lkp@intel.com>.
> * Drop build dependency on IMX_SCU, as dummy SCU functions have been added in
>   header files by the patch 'firmware: imx: add dummy functions' which has
>   landed in linux-next/master branch.
> 
> v1->v2:
> * Add compatible for i.MX8qm DPU, as this is tested with i.MX8qm LVDS displays.
>   (Laurentiu)
> * Fix PRG burst size and stride. (Laurentiu)
> * Put 'ports' OF node to fix the bail-out logic in dpu_drm_probe(). (Laurentiu)
> 
>  drivers/gpu/drm/imx/Kconfig               |   1 +
>  drivers/gpu/drm/imx/Makefile              |   1 +
>  drivers/gpu/drm/imx/dpu/Kconfig           |  10 +
>  drivers/gpu/drm/imx/dpu/Makefile          |  10 +
>  drivers/gpu/drm/imx/dpu/dpu-constframe.c  | 170 ++++++
>  drivers/gpu/drm/imx/dpu/dpu-core.c        | 881 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/imx/dpu/dpu-crtc.c        | 925 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/imx/dpu/dpu-crtc.h        |  62 ++
>  drivers/gpu/drm/imx/dpu/dpu-disengcfg.c   | 114 ++++
>  drivers/gpu/drm/imx/dpu/dpu-dprc.c        | 721 +++++++++++++++++++++++
>  drivers/gpu/drm/imx/dpu/dpu-dprc.h        |  40 ++
>  drivers/gpu/drm/imx/dpu/dpu-drv.c         | 297 ++++++++++
>  drivers/gpu/drm/imx/dpu/dpu-drv.h         |  28 +
>  drivers/gpu/drm/imx/dpu/dpu-extdst.c      | 296 ++++++++++
>  drivers/gpu/drm/imx/dpu/dpu-fetchdecode.c | 291 ++++++++++
>  drivers/gpu/drm/imx/dpu/dpu-fetcheco.c    | 221 +++++++
>  drivers/gpu/drm/imx/dpu/dpu-fetchlayer.c  | 151 +++++
>  drivers/gpu/drm/imx/dpu/dpu-fetchunit.c   | 609 ++++++++++++++++++++
>  drivers/gpu/drm/imx/dpu/dpu-fetchunit.h   | 191 ++++++
>  drivers/gpu/drm/imx/dpu/dpu-fetchwarp.c   | 247 ++++++++
>  drivers/gpu/drm/imx/dpu/dpu-framegen.c    | 392 +++++++++++++
>  drivers/gpu/drm/imx/dpu/dpu-gammacor.c    | 220 +++++++
>  drivers/gpu/drm/imx/dpu/dpu-hscaler.c     | 272 +++++++++
>  drivers/gpu/drm/imx/dpu/dpu-kms.c         | 543 ++++++++++++++++++
>  drivers/gpu/drm/imx/dpu/dpu-kms.h         |  23 +
>  drivers/gpu/drm/imx/dpu/dpu-layerblend.c  | 345 +++++++++++
>  drivers/gpu/drm/imx/dpu/dpu-plane.c       | 702 +++++++++++++++++++++++
>  drivers/gpu/drm/imx/dpu/dpu-plane.h       |  56 ++
>  drivers/gpu/drm/imx/dpu/dpu-prg.c         | 433 ++++++++++++++
>  drivers/gpu/drm/imx/dpu/dpu-prg.h         |  45 ++
>  drivers/gpu/drm/imx/dpu/dpu-prv.h         | 203 +++++++
>  drivers/gpu/drm/imx/dpu/dpu-tcon.c        | 249 ++++++++
>  drivers/gpu/drm/imx/dpu/dpu-vscaler.c     | 305 ++++++++++
>  drivers/gpu/drm/imx/dpu/dpu.h             | 389 +++++++++++++
>  34 files changed, 9443 insertions(+)
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

[...]

> diff --git a/drivers/gpu/drm/imx/dpu/dpu-core.c b/drivers/gpu/drm/imx/dpu/dpu-core.c
> new file mode 100644
> index 00000000..52224ae
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dpu/dpu-core.c
> @@ -0,0 +1,881 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +/*
> + * Copyright (C) 2016 Freescale Semiconductor, Inc.
> + * Copyright 2017-2020 NXP
> + */
> +
> +#include <linux/dma-mapping.h>
> +#include <linux/io.h>
> +#include <linux/irq.h>
> +#include <linux/irqchip/chained_irq.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of_graph.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/sizes.h>
> +
> +#include "dpu.h"
> +#include "dpu-prv.h"
> +
> +static inline u32 dpu_comctrl_read(struct dpu_soc *dpu, unsigned int offset)
> +{
> +	return readl(dpu->comctrl_reg + offset);
> +}
> +
> +static inline void dpu_comctrl_write(struct dpu_soc *dpu,
> +				     unsigned int offset, u32 value)
> +{
> +	writel(value, dpu->comctrl_reg + offset);
> +}
> +
> +/* Constant Frame */
> +static const unsigned int cf_ids[] = {0, 1, 4, 5};
> +static const enum dpu_unit_type cf_types[] = {DPU_DISP, DPU_DISP,
> +					      DPU_DISP, DPU_DISP};
> +static const unsigned long cf_ofss[] = {0x4400, 0x5400, 0x4c00, 0x5c00};
> +static const unsigned long cf_pec_ofss[] = {0x960, 0x9e0, 0x9a0, 0xa20};
> +
> +/* Display Engine Configuration */
> +static const unsigned int dec_ids[] = {0, 1};
> +static const enum dpu_unit_type dec_types[] = {DPU_DISP, DPU_DISP};
> +static const unsigned long dec_ofss[] = {0xb400, 0xb420};
> +
> +/* External Destination */
> +static const unsigned int ed_ids[] = {0, 1, 4, 5};
> +static const enum dpu_unit_type ed_types[] = {DPU_DISP, DPU_DISP,
> +					      DPU_DISP, DPU_DISP};
> +static const unsigned long ed_ofss[] = {0x4800, 0x5800, 0x5000, 0x6000};
> +static const unsigned long ed_pec_ofss[] = {0x980, 0xa00, 0x9c0, 0xa40};
> +
> +/* Fetch Decode */
> +static const unsigned int fd_ids[] = {0, 1, 9};
> +static const enum dpu_unit_type fd_types[] = {DPU_DISP, DPU_DISP, DPU_BLIT};
> +static const unsigned long fd_ofss[] = {0x6c00, 0x7800, 0x1000};
> +static const unsigned long fd_pec_ofss[] = {0xa80, 0xaa0, 0x820};
> +
> +/* Fetch ECO */
> +static const unsigned int fe_ids[] = {0, 1, 2, 9};
> +static const enum dpu_unit_type fe_types[] = {DPU_DISP, DPU_DISP,
> +					      DPU_DISP, DPU_BLIT};
> +static const unsigned long fe_ofss[] = {0x7400, 0x8000, 0x6800, 0x1c00};
> +static const unsigned long fe_pec_ofss[] = {0xa90, 0xab0, 0xa70, 0x850};
> +
> +/* Frame Generator */
> +static const unsigned int fg_ids[] = {0, 1};
> +static const enum dpu_unit_type fg_types[] = {DPU_DISP, DPU_DISP};
> +static const unsigned long fg_ofss[] = {0xb800, 0xd400};
> +
> +/* Fetch Layer */
> +static const unsigned int fl_ids[] = {0};
> +static const enum dpu_unit_type fl_types[] = {DPU_DISP};
> +static const unsigned long fl_ofss[] = {0x8400};
> +static const unsigned long fl_pec_ofss[] = {0xac0};
> +
> +/* Fetch Warp */
> +static const unsigned int fw_ids[] = {2, 9};
> +static const enum dpu_unit_type fw_types[] = {DPU_DISP, DPU_BLIT};
> +static const unsigned long fw_ofss[] = {0x6400, 0x1800};
> +static const unsigned long fw_pec_ofss[] = {0xa60, 0x840};
> +
> +/* Gamma Correction */
> +static const unsigned int gc_ids[] = {0, 1};
> +static const enum dpu_unit_type gc_types[] = {DPU_DISP, DPU_DISP};
> +static const unsigned long gc_ofss[] = {0xc000, 0xdc00};
> +
> +/* Horizontal Scaler */
> +static const unsigned int hs_ids[] = {4, 5, 9};
> +static const enum dpu_unit_type hs_types[] = {DPU_DISP, DPU_DISP, DPU_BLIT};
> +static const unsigned long hs_ofss[] = {0x9000, 0x9c00, 0x3000};
> +static const unsigned long hs_pec_ofss[] = {0xb00, 0xb60, 0x8c0};
> +
> +/* Layer Blend */
> +static const unsigned int lb_ids[] = {0, 1, 2, 3};
> +static const enum dpu_unit_type lb_types[] = {DPU_DISP, DPU_DISP,
> +					      DPU_DISP, DPU_DISP};
> +static const unsigned long lb_ofss[] = {0xa400, 0xa800, 0xac00, 0xb000};
> +static const unsigned long lb_pec_ofss[] = {0xba0, 0xbc0, 0xbe0, 0xc00};
> +
> +/* Timing Controller */
> +static const unsigned int tcon_ids[] = {0, 1};
> +static const enum dpu_unit_type tcon_types[] = {DPU_DISP, DPU_DISP};
> +static const unsigned long tcon_ofss[] = {0xc800, 0xe400};
> +
> +/* Vertical Scaler */
> +static const unsigned int vs_ids[] = {4, 5, 9};
> +static const enum dpu_unit_type vs_types[] = {DPU_DISP, DPU_DISP, DPU_BLIT};
> +static const unsigned long vs_ofss[] = {0x9400, 0xa000, 0x3400};
> +static const unsigned long vs_pec_ofss[] = {0xb20, 0xb80, 0x8e0};
> +
> +#define DPU_UNITS_DEFINE(unit)			\
> +static const struct dpu_units dpu_##unit##s = {	\
> +	.ids = unit##_ids,			\
> +	.types = unit##_types,			\
> +	.ofss = unit##_ofss,			\
> +	.pec_ofss = unit##_pec_ofss,		\
> +	.cnt = ARRAY_SIZE(unit##_ids),		\
> +}
> +
> +/* units without Pixel Engine Configuration */
> +#define DPU_UNITS_DEFINE_NO_PEC(unit)		\
> +static const struct dpu_units dpu_##unit##s = {	\
> +	.ids = unit##_ids,			\
> +	.types = unit##_types,			\
> +	.ofss = unit##_ofss,			\
> +	.pec_ofss = NULL,			\
> +	.cnt = ARRAY_SIZE(unit##_ids),		\
> +}
> +
> +DPU_UNITS_DEFINE(cf);
> +DPU_UNITS_DEFINE_NO_PEC(dec);
> +DPU_UNITS_DEFINE(ed);
> +DPU_UNITS_DEFINE(fd);
> +DPU_UNITS_DEFINE(fe);
> +DPU_UNITS_DEFINE_NO_PEC(fg);
> +DPU_UNITS_DEFINE(fl);
> +DPU_UNITS_DEFINE(fw);
> +DPU_UNITS_DEFINE_NO_PEC(gc);
> +DPU_UNITS_DEFINE(hs);
> +DPU_UNITS_DEFINE(lb);
> +DPU_UNITS_DEFINE_NO_PEC(tcon);
> +DPU_UNITS_DEFINE(vs);

Wouldn't it be better if you defined the unit structures directly? Like below?

static const struct dpu_units dpu_cfs = {
 .ids = {0, 1, 4, 5},
 .types = {DPU_DISP, DPU_DISP, DPU_DISP, DPU_DISP},
 .ofss = {0x4400, 0x5400, 0x4c00, 0x5c00},
 .pec_ofss = {0x960, 0x9e0, 0x9a0, 0xa20},
 .cnt = 4,
};

I guess dpu_units structure definition would need to change too. But this would
help get rid of cf_ids[], cf_types[], cf_ofss[], cf_pec_ofss[], etc. Also, no
need for macros.

> +
> +static void dpu_detach_pm_domains(struct dpu_soc *dpu)
> +{
> +#define DPU_DETACH_PM_DOMAIN(name)					\
> +do {									\
> +	if (!IS_ERR_OR_NULL(dpu->pd_##name##_link))			\
> +		device_link_del(dpu->pd_##name##_link);			\
> +	if (!IS_ERR_OR_NULL(dpu->pd_##name##_dev))			\
> +		dev_pm_domain_detach(dpu->pd_##name##_dev, true);	\
> +									\
> +	dpu->pd_##name##_dev = NULL;					\
> +	dpu->pd_##name##_link = NULL;					\
> +} while (0)

The above macro could go into a separate function:

~~~
static void dpu_detach_pm_domain(struct device **pd_dev,
                                struct device_link **pd_link)
{
       if (!IS_ERR_OR_NULL(*pd_link))
               device_link_del(*pd_link);
       if (!IS_ERR_OR_NULL(*pd_dev))
               dev_pm_domain_detach(*pd_dev, true);

       *pd_dev = NULL;
       *pd_link = NULL;
}
~~~

> +
> +	DPU_DETACH_PM_DOMAIN(pll1);
> +	DPU_DETACH_PM_DOMAIN(pll0);
> +	DPU_DETACH_PM_DOMAIN(dc);

And instead of the macros, you could call the helper function directly:

dpu_detach_pm_domain(&dpu->pd_pll1_dev, &dpu->pd_pll1_link);
dpu_detach_pm_domain(&dpu->pd_pll0_dev, &dpu->pd_pll0_link);
dpu_detach_pm_domain(&dpu->pd_dc_dev, &dpu->pd_dc_link);

Wouldn't that be OK?

> +}
> +
> +static int dpu_attach_pm_domains(struct dpu_soc *dpu)
> +{
> +	u32 flags = DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME | DL_FLAG_RPM_ACTIVE;
> +	int ret = 0;
> +
> +#define DPU_ATTACH_PM_DOMAIN(name)					\
> +do {									\
> +	dpu->pd_##name##_dev =						\
> +		dev_pm_domain_attach_by_name(dpu->dev, "" #name "");	\
> +	if (IS_ERR(dpu->pd_##name##_dev)) {				\
> +		ret = PTR_ERR(dpu->pd_##name##_dev);			\
> +		dev_err(dpu->dev,					\
> +			"failed to attach " #name " pd dev: %d\n", ret);\
> +		goto fail;						\
> +	}								\
> +									\
> +	dpu->pd_##name##_link =						\
> +		device_link_add(dpu->dev, dpu->pd_##name##_dev, flags);	\
> +	if (IS_ERR(dpu->pd_##name##_link)) {				\
> +		ret = PTR_ERR(dpu->pd_##name##_link);			\
> +		dev_err(dpu->dev,					\
> +			"failed to add device link to " #name		\
> +			" pd dev: %d\n", ret);				\
> +		goto fail;						\
> +	}								\
> +} while (0)

This one should go into a separate function:
static int dpu_attach_pm_domain(struct dpu_soc *dpu,
                               struct device **pd_dev,
                               struct device_link **pd_link,
                               const char *name)


> +
> +	DPU_ATTACH_PM_DOMAIN(dc);
> +	DPU_ATTACH_PM_DOMAIN(pll0);
> +	DPU_ATTACH_PM_DOMAIN(pll1);

And these can call the helper functions directly:
ret = dpu_attach_pm_domain(dpu, &dpu->pd_dc_dev, &dpu->pd_dc_link, "dc");
if (ret)
        goto fail;

Would this add too much code?

> +
> +	return ret;
> +fail:
> +	dpu_detach_pm_domains(dpu);
> +	return ret;
> +}
> +
> +static void dpu_units_addr_dbg(struct dpu_soc *dpu, unsigned long dpu_base)
> +{
> +	int i;
> +
> +	dev_dbg(dpu->dev, "Common Control: 0x%08lx\n", dpu_base);
> +
> +#define DPU_UNITS_ADDR_DBG(unit)					\
> +do {									\
> +	const struct dpu_units *us = &dpu_##unit##s;			\
> +									\
> +	for (i = 0; i < us->cnt; i++) {					\
> +		if (us->pec_ofss) {					\
> +			dev_dbg(dpu->dev, "%s%d: pixengcfg @ 0x%08lx,"	\
> +				" unit @ 0x%08lx\n", #unit,		\
> +				us->ids[i],				\
> +				dpu_base + us->pec_ofss[i],		\
> +				dpu_base + us->ofss[i]);		\
> +		} else {						\
> +			dev_dbg(dpu->dev,				\
> +				"%s%d: unit @ 0x%08lx\n", #unit,	\
> +				us->ids[i], dpu_base + us->ofss[i]);	\
> +		}							\
> +	}								\
> +} while (0)

A separate helper function dpu_unit_add_dbg() would work here too.

> +
> +	DPU_UNITS_ADDR_DBG(cf);
> +	DPU_UNITS_ADDR_DBG(dec);
> +	DPU_UNITS_ADDR_DBG(ed);
> +	DPU_UNITS_ADDR_DBG(fd);
> +	DPU_UNITS_ADDR_DBG(fe);
> +	DPU_UNITS_ADDR_DBG(fg);
> +	DPU_UNITS_ADDR_DBG(fl);
> +	DPU_UNITS_ADDR_DBG(fw);
> +	DPU_UNITS_ADDR_DBG(gc);
> +	DPU_UNITS_ADDR_DBG(hs);
> +	DPU_UNITS_ADDR_DBG(lb);
> +	DPU_UNITS_ADDR_DBG(tcon);
> +	DPU_UNITS_ADDR_DBG(vs);

And these could be changed into calling the helper directly.

> +}
> +
> +static int dpu_get_irq(struct platform_device *pdev, struct dpu_soc *dpu)

This could be renamed dpu_get_irqs().

> +{
> +#define DPU_GET_IRQ(name)						\
> +do {									\
> +	dpu->irq_##name = platform_get_irq_byname(pdev, "" #name "");	\
> +	dev_dbg(dpu->dev, "get irq_" #name ": %d\n", dpu->irq_##name);	\
> +	if (dpu->irq_##name < 0) {					\
> +		dev_err_probe(dpu->dev, dpu->irq_##name,		\
> +			     "failed to get irq " #name "\n");		\
> +		return dpu->irq_##name;					\
> +	}								\
> +} while (0)

And this macro could be put under a new dpu_get_irq():

static int dpu_get_irq(struct platform_device *pdev, struct dpu_soc *dpu,
                      int *irq, const char *name)

> +
> +	DPU_GET_IRQ(disengcfg_framecomplete0);
> +	DPU_GET_IRQ(disengcfg_seqcomplete0);
> +	DPU_GET_IRQ(disengcfg_shdload0);
> +	DPU_GET_IRQ(disengcfg_framecomplete1);
> +	DPU_GET_IRQ(disengcfg_seqcomplete1);
> +	DPU_GET_IRQ(disengcfg_shdload1);
> +	DPU_GET_IRQ(extdst0_shdload);
> +	DPU_GET_IRQ(extdst1_shdload);
> +	DPU_GET_IRQ(extdst4_shdload);
> +	DPU_GET_IRQ(extdst5_shdload);

All these macros could be transformed into something like:

~~~
struct {
        int *irq;
        const char *name;
} irqs[] = {
        {&dpu->irq_disengcfg_framecomplete0, "disengcfg_framecomplete0"},
        {&dpu->irq_disengcfg_seqcomplete0, "disengcfg_seqcomplete0"},
		...
};

for (i = 0; i < ARRAY_SIZE(irqs); i++) {
        ret = dpu_get_irq(pdev, dpu, irqs[i].irq, irqs[i].name);
        if (ret)
                return ret;
}
~~~

> +
> +	return 0;
> +}
> +
> +static void dpu_irq_handle(struct irq_desc *desc, enum dpu_irq irq)
> +{
> +	struct dpu_soc *dpu = irq_desc_get_handler_data(desc);
> +	struct irq_chip *chip = irq_desc_get_chip(desc);
> +	unsigned int virq;
> +	u32 status;
> +
> +	chained_irq_enter(chip, desc);
> +
> +	status = dpu_comctrl_read(dpu, USERINTERRUPTSTATUS(irq / 32));
> +	status &= dpu_comctrl_read(dpu, USERINTERRUPTENABLE(irq / 32));
> +
> +	if (status & BIT(irq % 32)) {
> +		virq = irq_linear_revmap(dpu->domain, irq);
> +		if (virq)
> +			generic_handle_irq(virq);
> +	}
> +
> +	chained_irq_exit(chip, desc);
> +}
> +
> +#define DPU_IRQ_DISENGCFG_FRAMECOMPLETE_HANDLER_DEFINE(id)		\
> +static void								\
> +dpu_disengcfg_framecomplete##id##_irq_handler(struct irq_desc *desc)	\
> +{									\
> +	dpu_irq_handle(desc, DPU_IRQ_DISENGCFG_FRAMECOMPLETE##id);	\
> +}
> +
> +#define DPU_IRQ_DISENGCFG_SEQCOMPLETE_HANDLER_DEFINE(id)		\
> +static void								\
> +dpu_disengcfg_seqcomplete##id##_irq_handler(struct irq_desc *desc)	\
> +{									\
> +	dpu_irq_handle(desc, DPU_IRQ_DISENGCFG_SEQCOMPLETE##id);	\
> +}
> +
> +#define DPU_IRQ_DISENGCFG_SHDLOAD_HANDLER_DEFINE(id)		\
> +static void							\
> +dpu_disengcfg_shdload##id##_irq_handler(struct irq_desc *desc)	\
> +{								\
> +	dpu_irq_handle(desc, DPU_IRQ_DISENGCFG_SHDLOAD##id);	\
> +}
> +
> +#define DPU_IRQ_EXTDST_SHDLOAD_HANDLER_DEFINE(id)		\
> +static void							\
> +dpu_extdst##id##_shdload_irq_handler(struct irq_desc *desc)	\
> +{								\
> +	dpu_irq_handle(desc, DPU_IRQ_EXTDST##id##_SHDLOAD);	\
> +}
> +
> +DPU_IRQ_DISENGCFG_FRAMECOMPLETE_HANDLER_DEFINE(0)
> +DPU_IRQ_DISENGCFG_FRAMECOMPLETE_HANDLER_DEFINE(1)
> +
> +DPU_IRQ_DISENGCFG_SEQCOMPLETE_HANDLER_DEFINE(0)
> +DPU_IRQ_DISENGCFG_SEQCOMPLETE_HANDLER_DEFINE(1)
> +
> +DPU_IRQ_DISENGCFG_SHDLOAD_HANDLER_DEFINE(0)
> +DPU_IRQ_DISENGCFG_SHDLOAD_HANDLER_DEFINE(1)
> +
> +DPU_IRQ_EXTDST_SHDLOAD_HANDLER_DEFINE(0)
> +DPU_IRQ_EXTDST_SHDLOAD_HANDLER_DEFINE(1)
> +DPU_IRQ_EXTDST_SHDLOAD_HANDLER_DEFINE(4)
> +DPU_IRQ_EXTDST_SHDLOAD_HANDLER_DEFINE(5)
> +
> +int dpu_map_irq(struct dpu_soc *dpu, int irq)
> +{
> +	int virq = irq_linear_revmap(dpu->domain, irq);
> +
> +	if (!virq)
> +		virq = irq_create_mapping(dpu->domain, irq);
> +
> +	return virq;
> +}
> +
> +static const unsigned long unused_irq[2] = {0x00000000, 0xfffe0008};
> +
> +static void dpu_irq_hw_init(struct dpu_soc *dpu)
> +{
> +	int i;
> +
> +	for (i = 0; i < DPU_IRQ_COUNT; i += 32) {
> +		/* mask and clear all interrupts */
> +		dpu_comctrl_write(dpu, USERINTERRUPTENABLE(i / 32), 0);
> +		dpu_comctrl_write(dpu, USERINTERRUPTCLEAR(i / 32),
> +					~unused_irq[i / 32]);
> +		dpu_comctrl_write(dpu, INTERRUPTENABLE(i / 32), 0);
> +		dpu_comctrl_write(dpu, INTERRUPTCLEAR(i / 32),
> +					~unused_irq[i / 32]);
> +
> +		/* set all interrupts to user mode */
> +		dpu_comctrl_write(dpu, USERINTERRUPTMASK(i / 32),
> +					~unused_irq[i / 32]);
> +	}
> +}
> +
> +static int dpu_irq_init(struct dpu_soc *dpu)
> +{
> +	struct device *dev = dpu->dev;
> +	struct irq_chip_generic *gc;
> +	struct irq_chip_type *ct;
> +	int ret, i;
> +
> +	dpu->domain = irq_domain_add_linear(dev->of_node, DPU_IRQ_COUNT,
> +					    &irq_generic_chip_ops, dpu);
> +	if (!dpu->domain) {
> +		dev_err(dev, "failed to add irq domain\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = irq_alloc_domain_generic_chips(dpu->domain, 32, 1, "DPU",
> +					     handle_level_irq, 0, 0, 0);
> +	if (ret) {
> +		dev_err(dev, "failed to alloc generic irq chips: %d\n", ret);
> +		irq_domain_remove(dpu->domain);
> +		return ret;
> +	}
> +
> +	for (i = 0; i < DPU_IRQ_COUNT; i += 32) {
> +		gc = irq_get_domain_generic_chip(dpu->domain, i);
> +		gc->reg_base = dpu->comctrl_reg;
> +		gc->unused = unused_irq[i / 32];
> +		ct = gc->chip_types;
> +		ct->chip.irq_ack = irq_gc_ack_set_bit;
> +		ct->chip.irq_mask = irq_gc_mask_clr_bit;
> +		ct->chip.irq_unmask = irq_gc_mask_set_bit;
> +		ct->regs.ack = USERINTERRUPTCLEAR(i / 32);
> +		ct->regs.mask = USERINTERRUPTENABLE(i / 32);
> +	}
> +
> +#define DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA1(name)	\
> +irq_set_chained_handler_and_data(dpu->irq_##name, dpu_##name##_irq_handler, dpu)
> +
> +	DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA1(disengcfg_framecomplete0);
> +	DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA1(disengcfg_seqcomplete0);
> +	DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA1(disengcfg_shdload0);
> +	DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA1(disengcfg_framecomplete1);
> +	DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA1(disengcfg_seqcomplete1);
> +	DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA1(disengcfg_shdload1);
> +	DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA1(extdst0_shdload);
> +	DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA1(extdst1_shdload);
> +	DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA1(extdst4_shdload);
> +	DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA1(extdst5_shdload);
> +
> +	return ret;
> +}
> +
> +static void dpu_irq_exit(struct dpu_soc *dpu)
> +{
> +	unsigned int i, irq;
> +
> +#define DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA2(name)	\
> +irq_set_chained_handler_and_data(dpu->irq_##name, NULL, NULL)
> +
> +	DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA2(disengcfg_framecomplete0);
> +	DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA2(disengcfg_seqcomplete0);
> +	DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA2(disengcfg_shdload0);
> +	DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA2(disengcfg_framecomplete1);
> +	DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA2(disengcfg_seqcomplete1);
> +	DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA2(disengcfg_shdload1);
> +	DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA2(extdst0_shdload);
> +	DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA2(extdst1_shdload);
> +	DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA2(extdst4_shdload);
> +	DPU_IRQ_SET_CHAINED_HANDLER_AND_DATA2(extdst5_shdload);
> +
> +	for (i = 0; i < DPU_IRQ_COUNT; i++) {
> +		irq = irq_linear_revmap(dpu->domain, i);
> +		if (irq)
> +			irq_dispose_mapping(irq);
> +	}
> +
> +	irq_domain_remove(dpu->domain);
> +}
> +
> +static void dpu_submodules_hw_init(struct dpu_soc *dpu)
> +{
> +#define DPU_UNITS_HW_INIT(unit)				\
> +do {							\
> +	const struct dpu_units *us = &dpu_##unit##s;	\
> +	int i;						\
> +							\
> +	for (i = 0; i < us->cnt; i++)			\
> +		dpu_##unit##_hw_init(dpu, i);		\
> +} while (0)
> +
> +	DPU_UNITS_HW_INIT(cf);
> +	DPU_UNITS_HW_INIT(dec);
> +	DPU_UNITS_HW_INIT(ed);
> +	DPU_UNITS_HW_INIT(fd);
> +	DPU_UNITS_HW_INIT(fe);
> +	DPU_UNITS_HW_INIT(fg);
> +	DPU_UNITS_HW_INIT(fl);
> +	DPU_UNITS_HW_INIT(fw);
> +	DPU_UNITS_HW_INIT(gc);
> +	DPU_UNITS_HW_INIT(hs);
> +	DPU_UNITS_HW_INIT(lb);
> +	DPU_UNITS_HW_INIT(tcon);
> +	DPU_UNITS_HW_INIT(vs);
> +}

This entire function can be rewritten without macros and it wouldn't
take too much extra code...

~~~
int i, j;
struct {
        int cnt;
        void (*hw_init)(struct dpu_soc *dpu, unsigned int index);
} hw_units[] = {
        {dpu_cfs.cnt,   dpu_cf_hw_init},
        {dpu_decs.cnt,  dpu_dec_hw_init},
		...
};

for (i = 0; i < ARRAY_SIZE(hw_units); i++)
        for (j = 0; j < hw_units[i].cnt; j++)
                hw_units[i].hw_init(dpu, i);

~~~


> +
> +static int dpu_submodules_init(struct dpu_soc *dpu, unsigned long dpu_base)
> +{
> +	int ret, i;
> +
> +#define DPU_UNIT_INIT(unit, base, index, id, type, pec_ofs, ofs)	\
> +do {									\
> +	ret = dpu_##unit##_init(dpu, (index), (id), (type),		\
> +				(pec_ofs) ? (base) + (pec_ofs) : 0,	\
> +				(base) + (ofs));			\
> +	if (ret) {							\
> +		dev_err(dpu->dev, "failed to initialize %s%d: %d\n",	\
> +						#unit, (id), ret);	\
> +		return ret;						\
> +	}								\
> +} while (0)
> +
> +#define DPU_UNITS_INIT(unit)						\
> +do {									\
> +	const struct dpu_units *us = &dpu_##unit##s;			\
> +									\
> +	for (i = 0; i < us->cnt; i++)					\
> +		DPU_UNIT_INIT(unit, dpu_base, i,			\
> +			      us->ids[i], us->types[i],			\
> +			      us->pec_ofss ? us->pec_ofss[i] : 0,	\
> +			      us->ofss[i]);				\
> +} while (0)
> +
> +	DPU_UNITS_INIT(cf);
> +	DPU_UNITS_INIT(dec);
> +	DPU_UNITS_INIT(ed);
> +	DPU_UNITS_INIT(fd);
> +	DPU_UNITS_INIT(fe);
> +	DPU_UNITS_INIT(fg);
> +	DPU_UNITS_INIT(fl);
> +	DPU_UNITS_INIT(fw);
> +	DPU_UNITS_INIT(gc);
> +	DPU_UNITS_INIT(hs);
> +	DPU_UNITS_INIT(lb);
> +	DPU_UNITS_INIT(tcon);
> +	DPU_UNITS_INIT(vs);
> +
> +	return 0;
> +}

This one too. Macros can be avoided.

> +
> +static int platform_remove_devices_fn(struct device *dev, void *unused)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +
> +	platform_device_unregister(pdev);
> +
> +	return 0;
> +}
> +
> +static void platform_device_unregister_children(struct platform_device *pdev)
> +{
> +	device_for_each_child(&pdev->dev, NULL, platform_remove_devices_fn);
> +}
> +
> +struct dpu_platform_reg {
> +	struct dpu_client_platformdata pdata;
> +	const char *name;
> +};
> +
> +static struct dpu_platform_reg client_reg[] = {
> +	{
> +	  .pdata = {
> +		.stream_id = 0,
> +		.dec_frame_complete_irq	= DPU_IRQ_DISENGCFG_FRAMECOMPLETE0,
> +		.dec_seq_complete_irq	= DPU_IRQ_DISENGCFG_SEQCOMPLETE0,
> +		.dec_shdld_irq		= DPU_IRQ_DISENGCFG_SHDLOAD0,
> +		.ed_cont_shdld_irq	= DPU_IRQ_EXTDST0_SHDLOAD,
> +		.ed_safe_shdld_irq	= DPU_IRQ_EXTDST4_SHDLOAD,
> +	   },
> +	  .name = "imx-dpu-crtc",
> +	}, {
> +	  .pdata = {
> +		.stream_id = 1,
> +		.dec_frame_complete_irq	= DPU_IRQ_DISENGCFG_FRAMECOMPLETE1,
> +		.dec_seq_complete_irq	= DPU_IRQ_DISENGCFG_SEQCOMPLETE1,
> +		.dec_shdld_irq		= DPU_IRQ_DISENGCFG_SHDLOAD1,
> +		.ed_cont_shdld_irq	= DPU_IRQ_EXTDST1_SHDLOAD,
> +		.ed_safe_shdld_irq	= DPU_IRQ_EXTDST5_SHDLOAD,
> +	  },
> +	  .name = "imx-dpu-crtc",
> +	}
> +};
> +
> +static DEFINE_MUTEX(dpu_client_id_mutex);
> +static int dpu_client_id;
> +
> +static int dpu_get_plane_grp_res(struct dpu_soc *dpu,
> +				 struct dpu_plane_grp *grp)
> +{
> +	struct dpu_plane_res *res = &grp->res;
> +	int i, j;
> +	int ret = 0;
> +
> +	INIT_LIST_HEAD(&grp->fu_list);
> +
> +#define DPU_UNITS_GET_FOR_PLANE_GRP(unit)				\
> +do {									\
> +	for (i = 0; i < ARRAY_SIZE(unit##_ids); i++) {			\
> +		if (unit##_types[i] == DPU_DISP)			\
> +			res->unit##_cnt++;				\
> +	}								\
> +									\
> +	res->unit = devm_kcalloc(dpu->dev, res->unit##_cnt,		\
> +				 sizeof(*res->unit), GFP_KERNEL);	\
> +	if (!res->unit)							\
> +		return -ENOMEM;						\
> +									\
> +	for (i = 0, j = 0; i < ARRAY_SIZE(unit##_ids); i++) {		\
> +		if (unit##_types[i] != DPU_DISP)			\
> +			continue;					\
> +									\
> +		res->unit[j] = dpu_##unit##_get(dpu, unit##_ids[i]);	\
> +		if (IS_ERR(res->unit[j])) {				\
> +			ret = PTR_ERR(res->unit[j]);			\
> +			dev_err(dpu->dev,				\
> +				"failed to get %s%d: %d\n",		\
> +				#unit, unit##_ids[i], ret);		\
> +			return ret;					\
> +		}							\
> +		j++;							\
> +	}								\
> +} while (0)

This can be made a separate function too.

> +
> +	DPU_UNITS_GET_FOR_PLANE_GRP(fd);
> +	DPU_UNITS_GET_FOR_PLANE_GRP(fl);
> +	DPU_UNITS_GET_FOR_PLANE_GRP(fw);
> +	DPU_UNITS_GET_FOR_PLANE_GRP(lb);
> +
> +#define DPU_FETCHUNIT_ADD_TO_PLANE_GRP_LIST(unit)			\
> +do {									\
> +	for (i = res->unit##_cnt - 1; i >= 0; i--)			\
> +		dpu_fu_add_to_list(res->unit[i], &grp->fu_list);	\
> +} while (0)
> +
> +	DPU_FETCHUNIT_ADD_TO_PLANE_GRP_LIST(fd);
> +	DPU_FETCHUNIT_ADD_TO_PLANE_GRP_LIST(fw);
> +	DPU_FETCHUNIT_ADD_TO_PLANE_GRP_LIST(fl);
> +
> +	grp->hw_plane_cnt = res->fd_cnt + res->fl_cnt + res->fw_cnt;
> +
> +	return ret;
> +}
> +
> +static void dpu_put_plane_grp_res(struct dpu_plane_grp *grp)
> +{
> +	struct dpu_plane_res *res = &grp->res;
> +	struct list_head *l, *tmp;
> +	int i;
> +
> +	grp->hw_plane_cnt = 0;
> +
> +	list_for_each_safe(l, tmp, &grp->fu_list)
> +		list_del(l);
> +
> +#define DPU_UNITS_PUT_FOR_PLANE_GRP(unit)		\
> +do {							\
> +	for (i = 0; i < res->unit##_cnt; i++) {		\
> +		if (!IS_ERR_OR_NULL(res->unit[i]))	\
> +			dpu_##unit##_put(res->unit[i]);	\
> +	}						\
> +	res->unit##_cnt = 0;				\
> +} while (0)
> +
> +	DPU_UNITS_PUT_FOR_PLANE_GRP(fd);
> +	DPU_UNITS_PUT_FOR_PLANE_GRP(fl);
> +	DPU_UNITS_PUT_FOR_PLANE_GRP(fw);
> +	DPU_UNITS_PUT_FOR_PLANE_GRP(lb);
> +}
> +
> +static int dpu_add_client_devices(struct dpu_soc *dpu)
> +{
> +	struct device *dev = dpu->dev;
> +	struct dpu_platform_reg *reg;
> +	struct dpu_crtc_grp *crtc_grp;
> +	struct dpu_plane_grp *plane_grp;
> +	size_t client_cnt, reg_size;
> +	int i, id, ret;
> +
> +	client_cnt = ARRAY_SIZE(client_reg);
> +
> +	reg = devm_kcalloc(dev, client_cnt, sizeof(*reg), GFP_KERNEL);
> +	if (!reg)
> +		return -ENOMEM;
> +
> +	crtc_grp = devm_kzalloc(dev, sizeof(*crtc_grp), GFP_KERNEL);
> +	if (!crtc_grp)
> +		return -ENOMEM;
> +
> +	plane_grp = devm_kzalloc(dev, sizeof(*plane_grp), GFP_KERNEL);
> +	if (!plane_grp)
> +		return -ENOMEM;
> +
> +	crtc_grp->plane_grp = plane_grp;
> +
> +	mutex_lock(&dpu_client_id_mutex);
> +	id = dpu_client_id;
> +	dpu_client_id += client_cnt;
> +	mutex_unlock(&dpu_client_id_mutex);
> +
> +	reg_size = client_cnt * sizeof(struct dpu_platform_reg);
> +	memcpy(reg, &client_reg[0], reg_size);
> +
> +	ret = dpu_get_plane_grp_res(dpu, plane_grp);
> +	if (ret)
> +		goto err_get_plane_res;
> +
> +	for (i = 0; i < client_cnt; i++) {
> +		struct platform_device *pdev;
> +		struct device_node *np;
> +
> +		/* Associate subdevice with the corresponding port node. */
> +		np = of_graph_get_port_by_id(dev->of_node, i);
> +		if (!np) {
> +			dev_info(dev,
> +				"no port@%d node in %s, not using DISP%d\n",
> +				i, dev->of_node->full_name, i);
> +			continue;
> +		}
> +
> +		reg[i].pdata.crtc_grp = crtc_grp;
> +
> +		pdev = platform_device_alloc(reg[i].name, id++);
> +		if (!pdev) {
> +			ret = -ENOMEM;
> +			goto err_register;
> +		}
> +
> +		pdev->dev.parent = dev;
> +		pdev->dev.of_node = np;
> +		pdev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
> +		pdev->dev.dma_mask = &pdev->dev.coherent_dma_mask;
> +
> +		reg[i].pdata.of_node = np;
> +		ret = platform_device_add_data(pdev, &reg[i].pdata,
> +					       sizeof(reg[i].pdata));
> +		if (!ret)
> +			ret = platform_device_add(pdev);
> +		if (ret) {
> +			platform_device_put(pdev);
> +			goto err_register;
> +		}
> +	}
> +
> +	return ret;
> +
> +err_register:
> +	platform_device_unregister_children(to_platform_device(dev));
> +err_get_plane_res:
> +	dpu_put_plane_grp_res(plane_grp);
> +
> +	return ret;
> +}
> +
> +static int dpu_core_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	struct dpu_soc *dpu;
> +	struct resource *res;
> +	unsigned long dpu_base;
> +	int ret;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return -ENODEV;
> +
> +	dpu_base = res->start;
> +
> +	dpu = devm_kzalloc(dev, sizeof(*dpu), GFP_KERNEL);
> +	if (!dpu)
> +		return -ENOMEM;
> +
> +	dpu->dev = dev;
> +
> +	dpu->id = of_alias_get_id(np, "dpu");
> +	if (dpu->id < 0) {
> +		dev_err(dev, "failed to get dpu node alias id: %d\n", dpu->id);
> +		return dpu->id;
> +	}
> +
> +	dpu_units_addr_dbg(dpu, dpu_base);
> +
> +	ret = dpu_get_irq(pdev, dpu);
> +	if (ret)
> +		return ret;
> +
> +	dpu->comctrl_reg = devm_ioremap(dev, dpu_base, SZ_512);
> +	if (!dpu->comctrl_reg)
> +		return -ENOMEM;
> +
> +	ret = dpu_attach_pm_domains(dpu);
> +	if (ret)
> +		return ret;
> +
> +	dpu->clk_cfg = devm_clk_get(dev, "cfg");
> +	if (IS_ERR(dpu->clk_cfg)) {
> +		ret = PTR_ERR(dpu->clk_cfg);
> +		dev_err_probe(dev, ret, "failed to get cfg clock\n");
> +		goto failed_clk_cfg_get;
> +	}
> +
> +	dpu->clk_axi = devm_clk_get(dev, "axi");
> +	if (IS_ERR(dpu->clk_axi)) {
> +		ret = PTR_ERR(dpu->clk_axi);
> +		dev_err_probe(dev, ret, "failed to get axi clock\n");
> +		goto failed_clk_axi_get;
> +	}
> +
> +	ret = dpu_irq_init(dpu);
> +	if (ret)
> +		goto failed_irq_init;
> +
> +	ret = dpu_submodules_init(dpu, dpu_base);
> +	if (ret)
> +		goto failed_submodules_init;
> +
> +	platform_set_drvdata(pdev, dpu);
> +
> +	pm_runtime_enable(dev);
> +
> +	ret = dpu_add_client_devices(dpu);
> +	if (ret) {
> +		dev_err(dev, "failed to add client devices: %d\n", ret);
> +		goto failed_add_clients;
> +	}
> +
> +	return ret;
> +
> +failed_add_clients:
> +	pm_runtime_disable(dev);
> +failed_submodules_init:
> +	dpu_irq_exit(dpu);
> +failed_irq_init:
> +failed_clk_axi_get:
> +failed_clk_cfg_get:
> +	dpu_detach_pm_domains(dpu);
> +	return ret;
> +}
> +
> +static int dpu_core_remove(struct platform_device *pdev)
> +{
> +	struct dpu_soc *dpu = platform_get_drvdata(pdev);
> +
> +	platform_device_unregister_children(pdev);
> +	pm_runtime_disable(dpu->dev);
> +	dpu_irq_exit(dpu);
> +	dpu_detach_pm_domains(dpu);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused dpu_runtime_suspend(struct device *dev)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct dpu_soc *dpu = platform_get_drvdata(pdev);
> +
> +	clk_disable_unprepare(dpu->clk_axi);
> +	clk_disable_unprepare(dpu->clk_cfg);
> +
> +	dev_dbg(dev, "suspended\n");
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused dpu_runtime_resume(struct device *dev)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct dpu_soc *dpu = platform_get_drvdata(pdev);
> +	int ret;
> +
> +	ret = clk_prepare_enable(dpu->clk_cfg);
> +	if (ret) {
> +		dev_err(dev, "failed to enable cfg clock: %d\n", ret);
> +		return ret;
> +	}
> +	ret = clk_prepare_enable(dpu->clk_axi);
> +	if (ret) {
> +		clk_disable_unprepare(dpu->clk_cfg);
> +		dev_err(dev, "failed to enable axi clock: %d\n", ret);
> +		return ret;
> +	}
> +
> +	dpu_irq_hw_init(dpu);
> +
> +	dpu_submodules_hw_init(dpu);
> +
> +	dev_dbg(dev, "resumed\n");
> +
> +	return ret;
> +}
> +
> +static const struct dev_pm_ops dpu_pm_ops = {
> +	SET_LATE_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				     pm_runtime_force_resume)
> +	SET_RUNTIME_PM_OPS(dpu_runtime_suspend, dpu_runtime_resume, NULL)
> +};
> +
> +const struct of_device_id dpu_dt_ids[] = {
> +	{ .compatible = "fsl,imx8qm-dpu" },
> +	{ .compatible = "fsl,imx8qxp-dpu" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, dpu_dt_ids);
> +
> +struct platform_driver dpu_core_driver = {
> +	.driver = {
> +		.pm = &dpu_pm_ops,
> +		.name = "dpu-core",
> +		.of_match_table = dpu_dt_ids,
> +	},
> +	.probe = dpu_core_probe,
> +	.remove = dpu_core_remove,
> +};
> diff --git a/drivers/gpu/drm/imx/dpu/dpu-crtc.c b/drivers/gpu/drm/imx/dpu/dpu-crtc.c
> new file mode 100644
> index 00000000..c21bd1d
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dpu/dpu-crtc.c
> @@ -0,0 +1,925 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +/*
> + * Copyright 2017-2020 NXP
> + */
> +
> +#include <linux/component.h>
> +#include <linux/irq.h>
> +#include <linux/irqflags.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/preempt.h>
> +#include <linux/spinlock.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_color_mgmt.h>
> +
> +#include "dpu.h"
> +#include "dpu-crtc.h"
> +#include "dpu-dprc.h"
> +#include "dpu-drv.h"
> +#include "dpu-plane.h"
> +
> +#define DPU_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(_name)			\
> +do {									\
> +	unsigned long ret;						\
> +	ret = wait_for_completion_timeout(&dpu_crtc->_name, HZ);	\
> +	if (ret == 0)							\
> +		drm_err(crtc->dev, "[CRTC:%d:%s] %s: wait for " #_name	\
> +			" timeout\n",					\
> +				crtc->base.id, crtc->name, __func__);	\
> +} while (0)
> +
> +#define DPU_CRTC_WAIT_FOR_FRAMEGEN_FRAME_CNT_MOVING(fg)			\
> +do {									\
> +	if (dpu_fg_wait_for_frame_counter_moving(fg))			\
> +		drm_err(crtc->dev, "[CRTC:%d:%s] %s: "			\
> +			"FrameGen frame counter isn't moving\n",	\
> +				crtc->base.id, crtc->name, __func__);	\
> +} while (0)
> +
> +#define DPU_CRTC_CHECK_FRAMEGEN_FIFO(fg)				\
> +do {									\
> +	if (dpu_fg_secondary_requests_to_read_empty_fifo(fg)) {		\
> +		dpu_fg_secondary_clear_channel_status(fg);		\
> +		drm_err(crtc->dev,					\
> +			"[CRTC:%d:%s] %s: FrameGen FIFO empty\n",	\
> +				crtc->base.id, crtc->name, __func__);	\
> +	}								\
> +} while (0)
> +
> +#define DPU_CRTC_WAIT_FOR_FRAMEGEN_SECONDARY_SYNCUP(fg)			\
> +do {									\
> +	if (dpu_fg_wait_for_secondary_syncup(fg))			\
> +		drm_err(crtc->dev,					\
> +			"[CRTC:%d:%s] %s: "				\
> +			"FrameGen secondary channel isn't syncup\n",	\
> +				crtc->base.id, crtc->name, __func__);	\
> +} while (0)
> +
> +static u32 dpu_crtc_get_vblank_counter(struct drm_crtc *crtc)
> +{
> +	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
> +
> +	if (pm_runtime_active(dpu_crtc->dev->parent))
> +		return dpu_fg_get_frame_index(dpu_crtc->fg);
> +	else
> +		return (u32)drm_crtc_vblank_count(crtc);
> +}
> +
> +static int dpu_crtc_enable_vblank(struct drm_crtc *crtc)
> +{
> +	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
> +
> +	enable_irq(dpu_crtc->dec_frame_complete_irq);
> +
> +	return 0;
> +}
> +
> +static void dpu_crtc_disable_vblank(struct drm_crtc *crtc)
> +{
> +	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
> +
> +	disable_irq_nosync(dpu_crtc->dec_frame_complete_irq);
> +}
> +
> +static irqreturn_t
> +dpu_crtc_dec_frame_complete_irq_handler(int irq, void *dev_id)
> +{
> +	struct dpu_crtc *dpu_crtc = dev_id;
> +	struct drm_crtc *crtc = &dpu_crtc->base;
> +	unsigned long flags;
> +
> +	drm_crtc_handle_vblank(crtc);
> +
> +	spin_lock_irqsave(&crtc->dev->event_lock, flags);
> +	if (dpu_crtc->event) {
> +		drm_crtc_send_vblank_event(crtc, dpu_crtc->event);
> +		dpu_crtc->event = NULL;
> +		drm_crtc_vblank_put(crtc);
> +	}
> +	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +#define DPU_CRTC_IRQ_HANDLER_DEFINE(name)				\
> +static irqreturn_t dpu_crtc_##name##_irq_handler(int irq, void *dev_id)	\
> +{									\
> +	struct dpu_crtc *dpu_crtc = dev_id;				\
> +	complete(&dpu_crtc->name##_done);				\
> +	return IRQ_HANDLED;						\
> +}
> +
> +DPU_CRTC_IRQ_HANDLER_DEFINE(dec_seq_complete)
> +DPU_CRTC_IRQ_HANDLER_DEFINE(dec_shdld)
> +DPU_CRTC_IRQ_HANDLER_DEFINE(ed_cont_shdld)
> +DPU_CRTC_IRQ_HANDLER_DEFINE(ed_safe_shdld)
> +
> +static const struct drm_crtc_funcs dpu_crtc_funcs = {
> +	.reset			= drm_atomic_helper_crtc_reset,
> +	.destroy		= drm_crtc_cleanup,
> +	.set_config		= drm_atomic_helper_set_config,
> +	.page_flip		= drm_atomic_helper_page_flip,
> +	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
> +	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
> +	.get_vblank_counter	= dpu_crtc_get_vblank_counter,
> +	.enable_vblank		= dpu_crtc_enable_vblank,
> +	.disable_vblank		= dpu_crtc_disable_vblank,
> +	.get_vblank_timestamp	= drm_crtc_vblank_helper_get_vblank_timestamp,
> +};
> +
> +static void dpu_crtc_queue_state_event(struct drm_crtc *crtc)
> +{
> +	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
> +
> +	spin_lock_irq(&crtc->dev->event_lock);
> +	if (crtc->state->event) {
> +		WARN_ON(drm_crtc_vblank_get(crtc));
> +		WARN_ON(dpu_crtc->event);
> +		dpu_crtc->event = crtc->state->event;
> +		crtc->state->event = NULL;
> +	}
> +	spin_unlock_irq(&crtc->dev->event_lock);
> +}
> +
> +static enum drm_mode_status
> +dpu_crtc_mode_valid(struct drm_crtc *crtc, const struct drm_display_mode *mode)
> +{
> +	if (mode->crtc_clock > DPU_FRAMEGEN_MAX_CLOCK)
> +		return MODE_CLOCK_HIGH;
> +
> +	return MODE_OK;
> +}
> +
> +static void dpu_crtc_pm_runtime_get_sync(struct drm_crtc *crtc)
> +{
> +	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
> +	int ret;
> +
> +	ret = pm_runtime_get_sync(dpu_crtc->dev->parent);
> +	if (ret < 0) {
> +		pm_runtime_put_noidle(dpu_crtc->dev->parent);
> +		drm_err(crtc->dev,
> +			"[CRTC:%d:%s]: failed to get parent device RPM sync\n",
> +			 crtc->base.id, crtc->name);
> +	}
> +}
> +
> +static void dpu_crtc_pm_runtime_put(struct drm_crtc *crtc)
> +{
> +	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
> +	int ret;
> +
> +	ret = pm_runtime_put(dpu_crtc->dev->parent);
> +	if (ret < 0) {
> +		drm_err(crtc->dev,
> +			"[CRTC:%d:%s]: failed to put parent device RPM\n",
> +			 crtc->base.id, crtc->name);
> +	}
> +}
> +
> +static void dpu_crtc_mode_set_nofb(struct drm_crtc *crtc)
> +{
> +	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
> +	struct drm_display_mode *adj = &crtc->state->adjusted_mode;
> +	enum dpu_link_id cf_link;
> +
> +	dpu_crtc_dbg(crtc, "mode " DRM_MODE_FMT "\n", DRM_MODE_ARG(adj));
> +
> +	/* request power-on when we start to set mode for CRTC */
> +	dpu_crtc_pm_runtime_get_sync(crtc);
> +
> +	dpu_fg_displaymode(dpu_crtc->fg, FG_DM_SEC_ON_TOP);
> +	dpu_fg_panic_displaymode(dpu_crtc->fg, FG_DM_CONSTCOL);
> +	dpu_fg_cfg_videomode(dpu_crtc->fg, adj);
> +
> +	dpu_tcon_cfg_videomode(dpu_crtc->tcon, adj);
> +	dpu_tcon_set_fmt(dpu_crtc->tcon);
> +
> +	dpu_cf_framedimensions(dpu_crtc->cf_cont,
> +			       adj->crtc_hdisplay, adj->crtc_vdisplay);
> +	dpu_cf_framedimensions(dpu_crtc->cf_safe,
> +			       adj->crtc_hdisplay, adj->crtc_vdisplay);
> +	/* constframe in content stream shows black frame - CRTC background */
> +	dpu_cf_constantcolor_black(dpu_crtc->cf_cont);
> +	/* constframe in safety stream shows blue frame */
> +	dpu_cf_constantcolor_blue(dpu_crtc->cf_safe);
> +
> +	cf_link = dpu_cf_get_link_id(dpu_crtc->cf_safe);
> +	dpu_ed_pec_src_sel(dpu_crtc->ed_safe, cf_link);
> +
> +	cf_link = dpu_cf_get_link_id(dpu_crtc->cf_cont);
> +	dpu_ed_pec_src_sel(dpu_crtc->ed_cont, cf_link);
> +}
> +
> +static int dpu_crtc_atomic_check_gamma(struct drm_crtc *crtc,
> +				       struct drm_crtc_state *state)
> +{
> +	size_t lut_size;
> +
> +	if (!state->color_mgmt_changed || !state->gamma_lut)
> +		return 0;
> +
> +	if (crtc->state->gamma_lut &&
> +	    (crtc->state->gamma_lut->base.id == state->gamma_lut->base.id))
> +		return 0;
> +
> +	if (state->gamma_lut->length % sizeof(struct drm_color_lut)) {
> +		dpu_crtc_dbg(crtc, "wrong gamma_lut length\n");
> +		return -EINVAL;
> +	}
> +
> +	lut_size = state->gamma_lut->length / sizeof(struct drm_color_lut);
> +	if (lut_size != 256) {
> +		dpu_crtc_dbg(crtc, "gamma_lut size is not 256\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
> +				 struct drm_atomic_state *state)
> +{
> +	struct drm_crtc_state *crtc_state;
> +	int ret;
> +
> +	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> +
> +	ret = dpu_crtc_atomic_check_gamma(crtc, crtc_state);
> +	if (ret)
> +		return ret;
> +
> +	/* force a mode set if the CRTC is changed to active */
> +	if (crtc_state->active_changed && crtc_state->active) {
> +		/*
> +		 * If mode_changed is set by us, call
> +		 * drm_atomic_helper_check_modeset() as it's Kerneldoc requires.
> +		 */
> +		if (!crtc_state->mode_changed) {
> +			crtc_state->mode_changed = true;
> +
> +			ret = drm_atomic_helper_check_modeset(crtc->dev, state);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +static void dpu_crtc_atomic_begin(struct drm_crtc *crtc,
> +				  struct drm_atomic_state *state)
> +{
> +	struct drm_crtc_state *old_crtc_state;
> +	struct drm_atomic_state *old_state;
> +	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
> +	struct drm_plane *plane;
> +	struct drm_plane_state *old_plane_state;
> +	struct dpu_plane_state *old_dpstate;
> +	struct dpu_fetchunit *fu;
> +	const struct dpu_fetchunit_ops *fu_ops;
> +	enum dpu_link_id cf_link;
> +	int i;
> +
> +	old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
> +	old_state = old_crtc_state->state;
> +
> +	/* do nothing if planes keep being disabled */
> +	if (old_crtc_state->plane_mask == 0 && crtc->state->plane_mask == 0)
> +		return;
> +
> +	/* request power-on when any plane starts to be active */
> +	if (old_crtc_state->plane_mask == 0 && crtc->state->plane_mask != 0)
> +		dpu_crtc_pm_runtime_get_sync(crtc);
> +
> +	/*
> +	 * Disable relevant planes' resources in SHADOW only.
> +	 * Whether any of them would be disabled or kept running depends
> +	 * on new plane states in the new global atomic state.
> +	 */
> +	for_each_old_plane_in_state(old_state, plane, old_plane_state, i) {
> +		old_dpstate = to_dpu_plane_state(old_plane_state);
> +
> +		if (!old_plane_state->fb)
> +			continue;
> +
> +		if (old_plane_state->crtc != crtc)
> +			continue;
> +
> +		fu = old_dpstate->source;
> +
> +		fu_ops = dpu_fu_get_ops(fu);
> +
> +		fu_ops->disable_src_buf(fu);
> +
> +		if (old_dpstate->is_top) {
> +			cf_link = dpu_cf_get_link_id(dpu_crtc->cf_cont);
> +			dpu_ed_pec_src_sel(dpu_crtc->ed_cont, cf_link);
> +		}
> +	}
> +}
> +
> +static void dpu_crtc_set_gammacor(struct dpu_crtc *dpu_crtc)
> +{
> +	struct drm_crtc *crtc = &dpu_crtc->base;
> +	struct drm_color_lut *lut;
> +
> +	lut = (struct drm_color_lut *)crtc->state->gamma_lut->data;
> +
> +	dpu_gc_enable_rgb_write(dpu_crtc->gc);
> +	dpu_gc_mode(dpu_crtc->gc, GC_GAMMACOR);
> +
> +	dpu_gc_start_rgb(dpu_crtc->gc, lut);
> +	dpu_gc_delta_rgb(dpu_crtc->gc, lut);
> +}
> +
> +static void dpu_crtc_set_gammacor_sync(struct dpu_crtc *dpu_crtc)
> +{
> +	struct drm_crtc *crtc = &dpu_crtc->base;
> +
> +	enable_irq(dpu_crtc->dec_shdld_irq);
> +
> +	dpu_crtc_set_gammacor(dpu_crtc);
> +	dpu_fg_shdtokgen(dpu_crtc->fg);
> +	DPU_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_shdld_done);
> +
> +	disable_irq(dpu_crtc->dec_shdld_irq);
> +}
> +
> +static void dpu_crtc_disable_gammacor(struct dpu_crtc *dpu_crtc)
> +{
> +	dpu_gc_mode(dpu_crtc->gc, GC_NEUTRAL);
> +	dpu_gc_disable_rgb_write(dpu_crtc->gc);
> +}
> +
> +static void dpu_crtc_disable_gammacor_sync(struct dpu_crtc *dpu_crtc)
> +{
> +	struct drm_crtc *crtc = &dpu_crtc->base;
> +
> +	enable_irq(dpu_crtc->dec_shdld_irq);
> +
> +	dpu_crtc_disable_gammacor(dpu_crtc);
> +	dpu_fg_shdtokgen(dpu_crtc->fg);
> +	DPU_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_shdld_done);
> +
> +	disable_irq(dpu_crtc->dec_shdld_irq);
> +}
> +
> +static void dpu_crtc_atomic_flush(struct drm_crtc *crtc,
> +				  struct drm_atomic_state *state)
> +{
> +	struct drm_crtc_state *old_crtc_state;
> +	struct drm_atomic_state *old_state;
> +	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
> +	struct drm_plane *plane;
> +	struct drm_plane_state *old_plane_state;
> +	struct dpu_plane_state *old_dpstate;
> +	struct dpu_fetchunit *fu;
> +	struct dpu_dprc *dprc;
> +	const struct dpu_fetchunit_ops *fu_ops;
> +	bool need_modeset = drm_atomic_crtc_needs_modeset(crtc->state);
> +	unsigned long flags;
> +	int i;
> +
> +	old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
> +	old_state = old_crtc_state->state;
> +
> +	if (old_crtc_state->plane_mask == 0 && crtc->state->plane_mask == 0) {
> +		/* Queue a pending vbl event if necessary. */
> +		if (!need_modeset && crtc->state->active)
> +			dpu_crtc_queue_state_event(crtc);
> +		return;
> +	}
> +
> +	if (!need_modeset && crtc->state->active)
> +		enable_irq(dpu_crtc->ed_cont_shdld_irq);
> +
> +	/*
> +	 * Don't relinquish CPU until DPRC repeat_en is disabled
> +	 * and flush is done(if necessary).
> +	 */
> +	local_irq_save(flags);
> +	preempt_disable();
> +
> +	/*
> +	 * Scan over old plane fetchunits to determine if we
> +	 * need to wait for FrameGen frame counter moving in
> +	 * the next loop prior to DPRC repeat_en disablement
> +	 * or not.
> +	 */
> +	for_each_old_plane_in_state(old_state, plane, old_plane_state, i) {
> +		old_dpstate = to_dpu_plane_state(old_plane_state);
> +
> +		if (!old_plane_state->fb)
> +			continue;
> +
> +		if (old_plane_state->crtc != crtc)
> +			continue;
> +
> +		fu = old_dpstate->source;
> +
> +		fu_ops = dpu_fu_get_ops(fu);
> +
> +		/*
> +		 * Sync with FrameGen frame counter moving so that
> +		 * we may disable DPRC repeat_en correctly.
> +		 */
> +		if (!fu_ops->is_enabled(fu) && !need_modeset &&
> +		    old_crtc_state->active) {
> +			DPU_CRTC_WAIT_FOR_FRAMEGEN_FRAME_CNT_MOVING(dpu_crtc->fg);
> +			break;
> +		}
> +	}
> +
> +	/*
> +	 * Set no stream id for disabled fetchunits of relevant planes.
> +	 * Also, disable DPRC repeat_en if necessary.
> +	 */
> +	for_each_old_plane_in_state(old_state, plane, old_plane_state, i) {
> +		old_dpstate = to_dpu_plane_state(old_plane_state);
> +
> +		if (!old_plane_state->fb)
> +			continue;
> +
> +		if (old_plane_state->crtc != crtc)
> +			continue;
> +
> +		fu = old_dpstate->source;
> +
> +		fu_ops = dpu_fu_get_ops(fu);
> +
> +		if (!fu_ops->is_enabled(fu)) {
> +			fu_ops->set_no_stream_id(fu);
> +
> +			dprc = fu_ops->get_dprc(fu);
> +			dpu_dprc_disable_repeat_en(dprc);
> +		}
> +	}
> +
> +	if (!need_modeset && crtc->state->active) {
> +		/*
> +		 * Flush plane(s) update out to display & queue a pending
> +		 * vbl event if necessary.
> +		 */
> +		dpu_ed_pec_sync_trigger(dpu_crtc->ed_cont);
> +
> +		local_irq_restore(flags);
> +		preempt_enable();
> +
> +		if (old_crtc_state->gamma_lut && !crtc->state->gamma_lut)
> +			dpu_crtc_disable_gammacor_sync(dpu_crtc);
> +		else if (old_crtc_state->gamma_lut && crtc->state->gamma_lut &&
> +			 old_crtc_state->gamma_lut->base.id !=
> +			 crtc->state->gamma_lut->base.id)
> +			dpu_crtc_set_gammacor_sync(dpu_crtc);
> +
> +		DPU_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(ed_cont_shdld_done);
> +
> +		disable_irq(dpu_crtc->ed_cont_shdld_irq);
> +
> +		DPU_CRTC_CHECK_FRAMEGEN_FIFO(dpu_crtc->fg);
> +
> +		dpu_crtc_queue_state_event(crtc);
> +	} else {
> +		/*
> +		 * Simply flush and hope that any update takes effect
> +		 * if CRTC is disabled.  This helps for the case where
> +		 * migrating plane(s) from a disabled CRTC to the other
> +		 * CRTC.
> +		 */
> +		if (!crtc->state->active)
> +			dpu_ed_pec_sync_trigger(dpu_crtc->ed_cont);
> +
> +		local_irq_restore(flags);
> +		preempt_enable();
> +	}
> +
> +	/* request power-off when all planes are off */
> +	if (old_crtc_state->plane_mask != 0 && crtc->state->plane_mask == 0)
> +		dpu_crtc_pm_runtime_put(crtc);
> +}
> +
> +static void dpu_crtc_atomic_enable(struct drm_crtc *crtc,
> +				   struct drm_atomic_state *state)
> +{
> +	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
> +	unsigned long flags;
> +
> +	drm_crtc_vblank_on(crtc);
> +
> +	enable_irq(dpu_crtc->dec_shdld_irq);
> +	enable_irq(dpu_crtc->ed_cont_shdld_irq);
> +	enable_irq(dpu_crtc->ed_safe_shdld_irq);
> +
> +	dpu_fg_enable_clock(dpu_crtc->fg);
> +	dpu_ed_pec_sync_trigger(dpu_crtc->ed_cont);
> +	dpu_ed_pec_sync_trigger(dpu_crtc->ed_safe);
> +	if (crtc->state->gamma_lut)
> +		dpu_crtc_set_gammacor(dpu_crtc);
> +	else
> +		dpu_crtc_disable_gammacor(dpu_crtc);
> +	dpu_fg_shdtokgen(dpu_crtc->fg);
> +
> +	/* don't relinquish CPU until TCON is set to operation mode */
> +	local_irq_save(flags);
> +	preempt_disable();
> +	dpu_fg_enable(dpu_crtc->fg);
> +
> +	/*
> +	 * TKT320590:
> +	 * Turn TCON into operation mode as soon as the first dumb
> +	 * frame is generated by DPU(we don't relinquish CPU to ensure
> +	 * this).  This makes DPR/PRG be able to evade the frame.
> +	 */
> +	DPU_CRTC_WAIT_FOR_FRAMEGEN_FRAME_CNT_MOVING(dpu_crtc->fg);
> +	dpu_tcon_set_operation_mode(dpu_crtc->tcon);
> +	local_irq_restore(flags);
> +	preempt_enable();
> +
> +	DPU_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(ed_safe_shdld_done);
> +	DPU_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(ed_cont_shdld_done);
> +	DPU_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_shdld_done);
> +
> +	disable_irq(dpu_crtc->ed_safe_shdld_irq);
> +	disable_irq(dpu_crtc->ed_cont_shdld_irq);
> +	disable_irq(dpu_crtc->dec_shdld_irq);
> +
> +	DPU_CRTC_WAIT_FOR_FRAMEGEN_SECONDARY_SYNCUP(dpu_crtc->fg);
> +
> +	DPU_CRTC_CHECK_FRAMEGEN_FIFO(dpu_crtc->fg);
> +
> +	dpu_crtc_queue_state_event(crtc);
> +}
> +
> +static void dpu_crtc_atomic_disable(struct drm_crtc *crtc,
> +				    struct drm_atomic_state *state)
> +{
> +	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
> +	struct drm_plane *plane;
> +	struct drm_plane_state *old_plane_state;
> +	struct dpu_plane_state *old_dpstate;
> +	struct dpu_fetchunit *fu;
> +	struct dpu_dprc *dprc;
> +	const struct dpu_fetchunit_ops *fu_ops;
> +	unsigned long flags;
> +	int i;
> +
> +	enable_irq(dpu_crtc->dec_seq_complete_irq);
> +
> +	/* don't relinquish CPU until DPRC repeat_en is disabled */
> +	local_irq_save(flags);
> +	preempt_disable();
> +	/*
> +	 * Sync to FrameGen frame counter moving so that
> +	 * FrameGen can be disabled in the next frame.
> +	 */
> +	DPU_CRTC_WAIT_FOR_FRAMEGEN_FRAME_CNT_MOVING(dpu_crtc->fg);
> +	dpu_fg_disable(dpu_crtc->fg);
> +	/*
> +	 * There is one frame leftover after FrameGen disablement.
> +	 * Sync to FrameGen frame counter moving so that
> +	 * DPRC repeat_en can be disabled in the next frame.
> +	 */
> +	DPU_CRTC_WAIT_FOR_FRAMEGEN_FRAME_CNT_MOVING(dpu_crtc->fg);
> +
> +	for_each_old_plane_in_state(state, plane, old_plane_state, i) {
> +		old_dpstate = to_dpu_plane_state(old_plane_state);
> +
> +		if (!old_plane_state->fb)
> +			continue;
> +
> +		if (old_plane_state->crtc != crtc)
> +			continue;
> +
> +		fu = old_dpstate->source;
> +
> +		fu_ops = dpu_fu_get_ops(fu);
> +
> +		dprc = fu_ops->get_dprc(fu);
> +		dpu_dprc_disable_repeat_en(dprc);
> +	}
> +
> +	local_irq_restore(flags);
> +	preempt_enable();
> +
> +	DPU_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_seq_complete_done);
> +
> +	disable_irq(dpu_crtc->dec_seq_complete_irq);
> +
> +	dpu_fg_disable_clock(dpu_crtc->fg);
> +
> +	drm_crtc_vblank_off(crtc);
> +
> +	spin_lock_irq(&crtc->dev->event_lock);
> +	if (crtc->state->event && !crtc->state->active) {
> +		drm_crtc_send_vblank_event(crtc, crtc->state->event);
> +		crtc->state->event = NULL;
> +	}
> +	spin_unlock_irq(&crtc->dev->event_lock);
> +
> +	/* request power-off when CRTC is disabled */
> +	dpu_crtc_pm_runtime_put(crtc);
> +}
> +
> +static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
> +					  bool in_vblank_irq,
> +					  int *vpos, int *hpos,
> +					  ktime_t *stime, ktime_t *etime,
> +					  const struct drm_display_mode *mode)
> +{
> +	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
> +	int vdisplay = mode->crtc_vdisplay;
> +	int vtotal = mode->crtc_vtotal;
> +	int line;
> +	bool reliable;
> +
> +	if (stime)
> +		*stime = ktime_get();
> +
> +	if (pm_runtime_active(dpu_crtc->dev->parent)) {
> +		/* line index starts with 0 for the first active output line */
> +		line = dpu_fg_get_line_index(dpu_crtc->fg);
> +
> +		if (line < vdisplay)
> +			/* active scanout area - positive */
> +			*vpos = line + 1;
> +		else
> +			/* inside vblank - negative */
> +			*vpos = line - (vtotal - 1);
> +
> +		reliable = true;
> +	} else {
> +		*vpos = 0;
> +		reliable = false;
> +	}
> +
> +	*hpos = 0;
> +
> +	if (etime)
> +		*etime = ktime_get();
> +
> +	return reliable;
> +}
> +
> +static const struct drm_crtc_helper_funcs dpu_helper_funcs = {
> +	.mode_valid		= dpu_crtc_mode_valid,
> +	.mode_set_nofb		= dpu_crtc_mode_set_nofb,
> +	.atomic_check		= dpu_crtc_atomic_check,
> +	.atomic_begin		= dpu_crtc_atomic_begin,
> +	.atomic_flush		= dpu_crtc_atomic_flush,
> +	.atomic_enable		= dpu_crtc_atomic_enable,
> +	.atomic_disable		= dpu_crtc_atomic_disable,
> +	.get_scanout_position	= dpu_crtc_get_scanout_position,
> +};
> +
> +static void dpu_crtc_put_resources(struct dpu_crtc *dpu_crtc)
> +{
> +#define DPU_CRTC_PUT_RSC(unit)				\
> +do {							\
> +	if (!IS_ERR_OR_NULL(dpu_crtc->unit))		\
> +		dpu_##unit##_put(dpu_crtc->unit);	\
> +} while (0)
> +
> +	DPU_CRTC_PUT_RSC(cf_cont);
> +	DPU_CRTC_PUT_RSC(cf_safe);
> +	DPU_CRTC_PUT_RSC(dec);
> +	DPU_CRTC_PUT_RSC(ed_cont);
> +	DPU_CRTC_PUT_RSC(ed_safe);
> +	DPU_CRTC_PUT_RSC(fg);
> +	DPU_CRTC_PUT_RSC(gc);
> +	DPU_CRTC_PUT_RSC(tcon);
> +}

Here you could call the dpu_*_put() functions directly and add the
IS_ERR_OR_NULL() check at the beginning of the put() function itself.

> +
> +static int dpu_crtc_get_resources(struct dpu_crtc *dpu_crtc)
> +{
> +	struct dpu_soc *dpu = dev_get_drvdata(dpu_crtc->dev->parent);
> +	int ret = 0;
> +
> +#define DPU_CRTC_GET_RSC(unit)						\
> +do {									\
> +	dpu_crtc->unit = dpu_##unit##_get(dpu, dpu_crtc->stream_id);	\
> +	if (IS_ERR(dpu_crtc->unit)) {					\
> +		ret = PTR_ERR(dpu_crtc->unit);				\
> +		goto err_out;						\
> +	}								\
> +} while (0)
> +
> +	DPU_CRTC_GET_RSC(cf_cont);
> +	DPU_CRTC_GET_RSC(cf_safe);
> +	DPU_CRTC_GET_RSC(dec);
> +	DPU_CRTC_GET_RSC(ed_cont);
> +	DPU_CRTC_GET_RSC(ed_safe);
> +	DPU_CRTC_GET_RSC(fg);
> +	DPU_CRTC_GET_RSC(gc);
> +	DPU_CRTC_GET_RSC(tcon);

This above could be rewritten like:

~~~
int i;
struct {
        void **dpu_unit;
        void *(*get)(struct dpu_soc *dpu, unsigned int id);
} rsc[] = {
        {(void *) &dpu_crtc->cf_cont, (void *) dpu_cf_cont_get},
        {(void *) &dpu_crtc->cf_safe, (void *) dpu_cf_safe_get},
		...
};

for (i = 0; i < ARRAY_SIZE(rsc); i++) {
        *rsc[i].dpu_unit = rsc[i].get(dpu, dpu_crtc->stream_id);

        if (IS_ERR(*rsc[i].dpu_unit)) {
                ret = PTR_ERR(*rsc[i].dpu_unit);
                goto err_out;
        }
}
~~~

I believe this should achieve the same result, but without macros.

> +
> +	return ret;
> +err_out:
> +	dpu_crtc_put_resources(dpu_crtc);
> +
> +	return ret;
> +}
> +
> +static int dpu_crtc_init(struct dpu_crtc *dpu_crtc,
> +			 struct dpu_client_platformdata *pdata,
> +			 struct dpu_drm_device *dpu_drm)
> +{
> +	struct drm_device *drm = &dpu_drm->base;
> +	struct dpu_soc *dpu = dev_get_drvdata(dpu_crtc->dev->parent);
> +	struct drm_crtc *crtc = &dpu_crtc->base;
> +	struct dpu_plane *dpu_plane;
> +	struct dpu_crtc_grp *crtc_grp = pdata->crtc_grp;
> +	struct dpu_plane_grp *plane_grp = crtc_grp->plane_grp;
> +	unsigned int stream_id = pdata->stream_id;
> +	unsigned int crtc_cnt;
> +	int i, ret;
> +
> +	init_completion(&dpu_crtc->dec_seq_complete_done);
> +	init_completion(&dpu_crtc->dec_shdld_done);
> +	init_completion(&dpu_crtc->ed_cont_shdld_done);
> +	init_completion(&dpu_crtc->ed_safe_shdld_done);
> +
> +	dpu_crtc->grp = crtc_grp;
> +	dpu_crtc->stream_id = stream_id;
> +	dpu_crtc->hw_plane_cnt = plane_grp->hw_plane_cnt;
> +
> +	ret = dpu_crtc_get_resources(dpu_crtc);
> +	if (ret) {
> +		drm_err(drm, "failed to get HW resources for CRTC: %d\n", ret);
> +		return ret;
> +	}
> +
> +	plane_grp->cf[stream_id] = dpu_crtc->cf_cont;
> +	plane_grp->ed[stream_id] = dpu_crtc->ed_cont;
> +
> +	/* each CRTC has a primary plane */
> +	dpu_plane = dpu_plane_initialize(drm, 0, plane_grp,
> +					 DRM_PLANE_TYPE_PRIMARY);
> +	if (IS_ERR(dpu_plane)) {
> +		ret = PTR_ERR(dpu_plane);
> +		drm_err(drm, "failed to init primary plane: %d\n", ret);
> +		goto err_put_resources;
> +	}
> +
> +	drm_crtc_helper_add(crtc, &dpu_helper_funcs);
> +
> +	ret = drm_crtc_init_with_planes(drm, crtc, &dpu_plane->base,
> +					NULL, &dpu_crtc_funcs, NULL);
> +	if (ret) {
> +		drm_err(drm, "failed to add CRTC: %d\n", ret);
> +		goto err_put_resources;
> +	}
> +
> +	/* X server assumes 256 element gamma table so let's use that. */
> +	ret = drm_mode_crtc_set_gamma_size(crtc, 256);
> +	if (ret) {
> +		drm_err(drm, "failed to set CRTC gamma size: %d\n", ret);
> +		goto err_put_resources;
> +	}
> +
> +	drm_crtc_enable_color_mgmt(crtc, 0, false, 256);
> +
> +	dpu_crtc->encoder->possible_crtcs = drm_crtc_mask(crtc);
> +	crtc_grp->crtc_mask |= drm_crtc_mask(crtc);
> +	crtc_cnt = hweight32(crtc_grp->crtc_mask);
> +
> +	/* initialize shared overlay planes for CRTCs in a CRTC group */
> +	if (crtc_cnt == DPU_CRTC_CNT_IN_GRP) {
> +		/*
> +		 * All HW planes in a plane group are shared by CRTCs in a
> +		 * CRTC group.  They will be assigned to either primary plane
> +		 * or overlay plane dynamically in runtime.  Considering a
> +		 * CRTC consumes all HW planes and primary plane takes one
> +		 * HW plane, so overlay plane count for a CRTC group should
> +		 * be plane_grp->hw_plane_cnt - 1.
> +		 */
> +		for (i = 1; i < plane_grp->hw_plane_cnt; i++) {
> +			dpu_plane =
> +				dpu_plane_initialize(drm, crtc_grp->crtc_mask,
> +						     plane_grp,
> +						     DRM_PLANE_TYPE_OVERLAY);
> +			if (IS_ERR(dpu_plane)) {
> +				ret = PTR_ERR(dpu_plane);
> +				drm_err(drm,
> +					"failed to init overlay plane(%d): %d\n",
> +									i, ret);
> +				goto err_put_resources;
> +			}
> +		}
> +	}
> +
> +	ret = pm_runtime_get_sync(dpu_crtc->dev->parent);
> +	if (ret < 0) {
> +		pm_runtime_put_noidle(dpu_crtc->dev->parent);
> +		drm_err(drm, "failed to get parent device RPM sync: %d\n", ret);
> +		goto err_put_resources;
> +	}
> +
> +#define DPU_CRTC_REQUEST_IRQ(name)					\
> +do {									\
> +	dpu_crtc->name##_irq = dpu_map_irq(dpu, pdata->name##_irq);	\
> +	irq_set_status_flags(dpu_crtc->name##_irq, IRQ_DISABLE_UNLAZY);	\
> +	ret = devm_request_irq(dpu_crtc->dev, dpu_crtc->name##_irq,	\
> +			       dpu_crtc_##name##_irq_handler,		\
> +			       0, dev_name(dpu_crtc->dev), dpu_crtc);	\
> +	if (ret < 0) {							\
> +		drm_err(drm, "failed to request irq(%u): %d\n",		\
> +					dpu_crtc->name##_irq, ret);	\
> +		goto err_put_pm_runtime;				\
> +	}								\
> +	disable_irq(dpu_crtc->name##_irq);				\
> +} while (0)
> +
> +	DPU_CRTC_REQUEST_IRQ(dec_frame_complete);
> +	DPU_CRTC_REQUEST_IRQ(dec_seq_complete);
> +	DPU_CRTC_REQUEST_IRQ(dec_shdld);
> +	DPU_CRTC_REQUEST_IRQ(ed_cont_shdld);
> +	DPU_CRTC_REQUEST_IRQ(ed_safe_shdld);
> +
> +	ret = pm_runtime_put(dpu_crtc->dev->parent);
> +	if (ret < 0) {
> +		drm_err(drm, "failed to put parent device RPM: %d\n", ret);
> +		dpu_crtc_put_resources(dpu_crtc);
> +	}
> +
> +	return ret;
> +
> +err_put_pm_runtime:
> +	pm_runtime_put(dpu_crtc->dev->parent);
> +err_put_resources:
> +	dpu_crtc_put_resources(dpu_crtc);
> +
> +	return ret;
> +}
> +
> +static int dpu_crtc_bind(struct device *dev, struct device *master, void *data)
> +{
> +	struct dpu_client_platformdata *pdata = dev->platform_data;
> +	struct dpu_drm_device *dpu_drm = data;
> +	struct dpu_crtc *dpu_crtc;
> +	bool found = false;
> +	int ret;
> +
> +	list_for_each_entry(dpu_crtc, &dpu_drm->crtc_list, node) {
> +		if (dpu_crtc->np == dev->of_node) {
> +			found = true;
> +			break;
> +		}
> +	}
> +
> +	if (!found) {
> +		drm_err(&dpu_drm->base, "failed to find CRTC OF node\n");
> +		return -ENODEV;
> +	}
> +
> +	dpu_crtc->dev = dev;
> +
> +	ret = dpu_crtc_init(dpu_crtc, pdata, dpu_drm);
> +	if (ret)
> +		return ret;
> +
> +	dev_set_drvdata(dev, dpu_crtc);
> +
> +	return ret;
> +}
> +
> +static void dpu_crtc_unbind(struct device *dev, struct device *master,
> +				void *data)
> +{
> +	struct dpu_crtc *dpu_crtc = dev_get_drvdata(dev);
> +
> +	dpu_crtc_put_resources(dpu_crtc);
> +}
> +
> +static const struct component_ops dpu_crtc_ops = {
> +	.bind = dpu_crtc_bind,
> +	.unbind = dpu_crtc_unbind,
> +};
> +
> +static int dpu_crtc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +
> +	if (!dev->platform_data)
> +		return -EINVAL;
> +
> +	return component_add(dev, &dpu_crtc_ops);
> +}
> +
> +static int dpu_crtc_remove(struct platform_device *pdev)
> +{
> +	component_del(&pdev->dev, &dpu_crtc_ops);
> +	return 0;
> +}
> +
> +struct platform_driver dpu_crtc_driver = {
> +	.driver = {
> +		.name = "imx-dpu-crtc",
> +	},
> +	.probe = dpu_crtc_probe,
> +	.remove = dpu_crtc_remove,
> +};

[...]

> diff --git a/drivers/gpu/drm/imx/dpu/dpu-dprc.c b/drivers/gpu/drm/imx/dpu/dpu-dprc.c
> new file mode 100644
> index 00000000..a543d0f
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dpu/dpu-dprc.c

[...]

> +
> +bool dpu_dprc_rtram_width_supported(struct dpu_dprc *dprc, unsigned int width)
> +{
> +	if (width > DPU_DPRC_MAX_RTRAM_WIDTH)
> +		return false;
> +
> +	return true;

You can just 'return width < DPU_DPRC_MAX_RTRAM_WIDTH' here.

[...]

> diff --git a/drivers/gpu/drm/imx/dpu/dpu-drv.c b/drivers/gpu/drm/imx/dpu/dpu-drv.c
> new file mode 100644
> index 00000000..e85c4ec
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dpu/dpu-drv.c
> @@ -0,0 +1,297 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +/*
> + * Copyright 2019,2020 NXP
> + */
> +
> +#include <linux/component.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_modeset_helper.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_vblank.h>

I didn't see any vblank related function called in dpu-drv.c. You could
remove drm_vblank.h.

> +
> +#include "dpu-drv.h"
> +#include "dpu-kms.h"
> +
> +#define DRIVER_NAME	"imx-dpu-drm"

[...]

> diff --git a/drivers/gpu/drm/imx/dpu/dpu-kms.c b/drivers/gpu/drm/imx/dpu/dpu-kms.c
> new file mode 100644
> index 00000000..876a7bb
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dpu/dpu-kms.c

[...]

> +
> +static int dpu_kms_init_encoder_per_crtc(struct drm_device *drm,
> +					 struct dpu_crtc *dpu_crtc)
> +{
> +	struct drm_encoder *encoder = dpu_crtc->encoder;
> +	struct drm_bridge *bridge;
> +	struct drm_connector *connector;
> +	struct device_node *ep, *remote;
> +	int ret = 0;
> +
> +	ep = of_get_next_child(dpu_crtc->np, NULL);
> +	if (!ep) {
> +		drm_err(drm, "failed to find CRTC port's endpoint\n");
> +		return -ENODEV;
> +	}
> +
> +	remote = of_graph_get_remote_port_parent(ep);
> +	if (!remote || !of_device_is_available(remote))
> +		goto out;
> +	else if (!of_device_is_available(remote->parent))
> +		goto out;
> +
> +	bridge = of_drm_find_bridge(remote);
> +	if (!bridge) {
> +		ret = -EPROBE_DEFER;
> +		drm_dbg_kms(drm, "CRTC(%pOF) failed to find bridge: %d\n",
> +							dpu_crtc->np, ret);
> +		goto out;
> +	}
> +
> +	ret = drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_NONE);
> +	if (ret) {
> +		drm_err(drm, "failed to initialize encoder: %d\n", ret);
> +		goto out;
> +	}
> +
> +	ret = drm_bridge_attach(encoder, bridge, NULL,
> +				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +	if (ret) {
> +		drm_err(drm, "failed to attach bridge to encoder: %d\n", ret);
> +		goto out;
> +	}
> +
> +	connector = drm_bridge_connector_init(drm, encoder);
> +	if (IS_ERR(connector)) {
> +		ret = PTR_ERR(connector);
> +		drm_err(drm,
> +			"failed to initialize bridge connector: %d\n", ret);
> +		goto out;
> +	}
> +
> +	ret = drm_connector_attach_encoder(connector, encoder);
> +	if (ret) {
> +		drm_err(drm,
> +			"failed to attach encoder to connector: %d\n", ret);
> +		goto out;

You can remove this goto line.

> +	}
> +out:
> +	of_node_put(remote);
> +	of_node_put(ep);
> +	return ret;
> +}
> +
> +int dpu_kms_prepare(struct dpu_drm_device *dpu_drm,
> +		    struct list_head *crtc_np_list)
> +{
> +	struct drm_device *drm = &dpu_drm->base;
> +	struct dpu_crtc_of_node *crtc_of_node;
> +	struct dpu_crtc *crtc;
> +	int ret, n_crtc = 0;
> +
> +	INIT_LIST_HEAD(&dpu_drm->crtc_list);
> +
> +	list_for_each_entry(crtc_of_node, crtc_np_list, list) {
> +		crtc = drmm_kzalloc(drm, sizeof(*crtc), GFP_KERNEL);
> +		if (!crtc)
> +			return -ENOMEM;
> +
> +		crtc->np = crtc_of_node->np;
> +
> +		crtc->encoder = drmm_kzalloc(drm, sizeof(*crtc->encoder),
> +								GFP_KERNEL);
> +		if (!crtc->encoder)
> +			return -ENOMEM;
> +
> +		list_add(&crtc->node, &dpu_drm->crtc_list);
> +
> +		n_crtc++;
> +	}
> +
> +	ret = drmm_mode_config_init(drm);
> +	if (ret)
> +		return ret;
> +
> +	drm->mode_config.min_width = 60;
> +	drm->mode_config.min_height = 60;
> +	drm->mode_config.max_width = 8192;
> +	drm->mode_config.max_height = 8192;
> +	drm->mode_config.funcs = &dpu_drm_mode_config_funcs;
> +	drm->mode_config.normalize_zpos = true;
> +	drm->max_vblank_count = DPU_FRAMEGEN_MAX_FRAME_INDEX;
> +
> +	list_for_each_entry(crtc, &dpu_drm->crtc_list, node) {
> +		ret = dpu_kms_init_encoder_per_crtc(drm, crtc);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = drm_vblank_init(drm, n_crtc);
> +	if (ret) {
> +		drm_err(drm, "failed to initialize vblank support: %d\n", ret);
> +		return ret;

You can remove this return.

> +	}
> +
> +	return ret;
> +}

[...]

> diff --git a/drivers/gpu/drm/imx/dpu/dpu-plane.c b/drivers/gpu/drm/imx/dpu/dpu-plane.c
> new file mode 100644
> index 00000000..ce85b9d
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dpu/dpu-plane.c

[...]

> +
> +static int dpu_plane_atomic_check(struct drm_plane *plane,
> +				  struct drm_plane_state *state)
> +{
> +	struct dpu_plane_state *dpstate = to_dpu_plane_state(state);
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_framebuffer *fb = state->fb;
> +	struct dpu_dprc *dprc;
> +	const struct dpu_fetchunit_ops *fu_ops;
> +	dma_addr_t baseaddr, uv_baseaddr;
> +	u32 src_w, src_h, src_x, src_y, dst_w, dst_h;
> +	int min_scale, bpp, ret;
> +	bool fb_is_interlaced;
> +
> +	/* ok to disable */
> +	if (!fb) {
> +		dpstate->source = NULL;
> +		dpstate->stage.ptr = NULL;
> +		dpstate->blend = NULL;
> +		return 0;
> +	}
> +
> +	if (!state->crtc) {
> +		dpu_plane_dbg(plane, "no CRTC in plane state\n");
> +		return -EINVAL;
> +	}
> +
> +	crtc_state =
> +		drm_atomic_get_existing_crtc_state(state->state, state->crtc);
> +	if (WARN_ON(!crtc_state))
> +		return -EINVAL;
> +
> +	min_scale = FRAC_16_16(1, DPU_PLANE_MAX_PIX_CNT_WITH_SCALER);
> +	ret = drm_atomic_helper_check_plane_state(state, crtc_state,
> +						  min_scale,
> +						  DRM_PLANE_HELPER_NO_SCALING,
> +						  true, false);
> +	if (ret) {
> +		dpu_plane_dbg(plane, "failed to check plane state: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* no off screen */
> +	if (state->dst.x1 < 0 || state->dst.y1 < 0 ||
> +	    (state->dst.x2 > crtc_state->adjusted_mode.hdisplay) ||
> +	    (state->dst.y2 > crtc_state->adjusted_mode.vdisplay)) {
> +		dpu_plane_dbg(plane, "no off screen\n");
> +		return -EINVAL;
> +	}
> +
> +	fb_is_interlaced = !!(fb->flags & DRM_MODE_FB_INTERLACED);
> +
> +	src_w = drm_rect_width(&state->src) >> 16;
> +	src_h = drm_rect_height(&state->src) >> 16;
> +	src_x = state->src.x1 >> 16;
> +	src_y = state->src.y1 >> 16;
> +	dst_w = drm_rect_width(&state->dst);
> +	dst_h = drm_rect_height(&state->dst);
> +
> +	/* max source resolution check */
> +	if (src_w == dst_w || src_h == dst_h) {
> +		/* without scaling */
> +		if (src_w > DPU_PLANE_MAX_PIX_CNT ||
> +		    src_h > DPU_PLANE_MAX_PIX_CNT) {
> +			dpu_plane_dbg(plane, "invalid source resolution\n");
> +			return -EINVAL;
> +		}
> +	} else {
> +		/* with scaling */
> +		if (src_w > DPU_PLANE_MAX_PIX_CNT_WITH_SCALER ||
> +		    src_h > DPU_PLANE_MAX_PIX_CNT_WITH_SCALER) {
> +			dpu_plane_dbg(plane,
> +				      "invalid source resolution with scale\n");
> +			return -EINVAL;
> +		}
> +	}
> +
> +	/* pixel/line count and position parameters check */
> +	if (fb->format->hsub == 2) {
> +		if (src_w % 2) {
> +			dpu_plane_dbg(plane, "bad uv width\n");
> +			return -EINVAL;
> +		}
> +		if (src_x % 2) {
> +			dpu_plane_dbg(plane, "bad uv xoffset\n");
> +			return -EINVAL;
> +		}
> +	}
> +	if (fb->format->vsub == 2) {
> +		if (src_h % (fb_is_interlaced ? 4 : 2)) {
> +			dpu_plane_dbg(plane, "bad uv height\n");
> +			return -EINVAL;
> +		}
> +		if (src_y % (fb_is_interlaced ? 4 : 2)) {
> +			dpu_plane_dbg(plane, "bad uv yoffset\n");
> +			return -EINVAL;
> +		}
> +	}
> +
> +	if ((fb->flags & DRM_MODE_FB_MODIFIERS) &&
> +	    !plane->funcs->format_mod_supported(plane, fb->format->format,
> +						fb->modifier)) {
> +		dpu_plane_dbg(plane, "invalid modifier 0x%016llx",
> +								fb->modifier);
> +		return -EINVAL;
> +	}
> +
> +	/* for tile formats, framebuffer has to be tile aligned */
> +	switch (fb->modifier) {
> +	case DRM_FORMAT_MOD_VIVANTE_TILED:
> +		if (fb->width % 4) {
> +			dpu_plane_dbg(plane, "bad fb width for VIVANTE tile\n");
> +			return -EINVAL;
> +		}
> +		if (fb->height % 4) {
> +			dpu_plane_dbg(plane, "bad fb height for VIVANTE tile\n");
> +			return -EINVAL;
> +		}
> +		break;
> +	case DRM_FORMAT_MOD_VIVANTE_SUPER_TILED:
> +		if (fb->width % 64) {
> +			dpu_plane_dbg(plane,
> +				      "bad fb width for VIVANTE super tile\n");
> +			return -EINVAL;
> +		}
> +		if (fb->height % 64) {
> +			dpu_plane_dbg(plane,
> +				      "bad fb height for VIVANTE super tile\n");
> +			return -EINVAL;
> +		}
> +		break;
> +	}
> +
> +	/* do not support BT709 full range */
> +	if (fb->format->is_yuv &&
> +	    state->color_encoding == DRM_COLOR_YCBCR_BT709 &&
> +	    state->color_range == DRM_COLOR_YCBCR_FULL_RANGE) {
> +		dpu_plane_dbg(plane, "no BT709 full range support\n");
> +		return -EINVAL;
> +	}
> +
> +	/* base address alignment check */
> +	baseaddr = drm_plane_state_to_baseaddr(state);
> +	switch (fb->format->format) {
> +	case DRM_FORMAT_YUYV:
> +	case DRM_FORMAT_UYVY:
> +		bpp = 16;
> +		break;
> +	case DRM_FORMAT_NV12:
> +	case DRM_FORMAT_NV21:
> +		bpp = 8;
> +		break;
> +	default:
> +		bpp = fb->format->cpp[0] * 8;
> +		break;
> +	}
> +	if (((bpp == 32) && (baseaddr & 0x3)) ||
> +	    ((bpp == 16) && (baseaddr & 0x1))) {
> +		dpu_plane_dbg(plane, "%dbpp fb bad baddr alignment\n", bpp);
> +		return -EINVAL;
> +	}
> +	switch (bpp) {
> +	case 32:
> +		if (baseaddr & 0x3) {
> +			dpu_plane_dbg(plane, "32bpp fb bad baddr alignment\n");
> +			return -EINVAL;
> +		}
> +		break;
> +	case 16:
> +		if (fb->modifier) {
> +			if (baseaddr & 0x1) {
> +				dpu_plane_dbg(plane,
> +					"16bpp tile fb bad baddr alignment\n");
> +				return -EINVAL;
> +			}
> +		} else {
> +			if (baseaddr & 0x7) {
> +				dpu_plane_dbg(plane,
> +					"16bpp fb bad baddr alignment\n");
> +				return -EINVAL;
> +			}
> +		}
> +		break;
> +	}
> +
> +	/* pitches[0] check */
> +	if (fb->pitches[0] > DPU_PLANE_MAX_PITCH) {
> +		dpu_plane_dbg(plane, "fb pitches[0] is out of range\n");
> +		return -EINVAL;
> +	}
> +
> +	if (((bpp == 32) && (fb->pitches[0] & 0x3)) ||
> +	    ((bpp == 16) && (fb->pitches[0] & 0x1))) {
> +		dpu_plane_dbg(plane,
> +			      "%dbpp fb bad pitches[0] alignment\n", bpp);
> +		return -EINVAL;
> +	}
> +
> +	/* UV planar check, assuming 16bpp */
> +	if (fb->format->num_planes > 1) {
> +		/* base address alignment check */
> +		uv_baseaddr = drm_plane_state_to_uvbaseaddr(state);
> +		if (uv_baseaddr & 0x7) {
> +			dpu_plane_dbg(plane, "bad uv baddr alignment\n");
> +			return -EINVAL;
> +		}
> +
> +		/* pitches[1] check */
> +		if (fb->pitches[1] > DPU_PLANE_MAX_PITCH) {
> +			dpu_plane_dbg(plane, "fb pitches[1] is out of range\n");
> +			return -EINVAL;
> +		}
> +
> +		if (fb->pitches[1] & 0x1) {
> +			dpu_plane_dbg(plane, "fb bad pitches[1] alignment\n");
> +			return -EINVAL;
> +		}
> +	}
> +
> +	/* DPRC check */
> +	fu_ops = dpu_fu_get_ops(dpstate->source);
> +	dprc = fu_ops->get_dprc(dpstate->source);
> +
> +	if (!dpu_dprc_rtram_width_supported(dprc, src_w)) {
> +		dpu_plane_dbg(plane, "bad RTRAM width for DPRC\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!dpu_dprc_stride_supported(dprc, fb->pitches[0], fb->pitches[1],
> +				       src_w, src_x, fb->format, fb->modifier,
> +				       baseaddr, uv_baseaddr)) {
> +		dpu_plane_dbg(plane, "bad fb pitches for DPRC\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}

This function is huge but it's well structured into logical sections. Why not
split it into smaller functions?

[...]

> diff --git a/drivers/gpu/drm/imx/dpu/dpu-prv.h b/drivers/gpu/drm/imx/dpu/dpu-prv.h
> new file mode 100644
> index 00000000..9151155
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dpu/dpu-prv.h
> @@ -0,0 +1,203 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +
> +/*
> + * Copyright (C) 2016 Freescale Semiconductor, Inc.
> + * Copyright 2017-2020 NXP
> + */
> +
> +#ifndef __DPU_PRV_H__
> +#define __DPU_PRV_H__
> +
> +#include <linux/clk.h>
> +#include <linux/device.h>
> +#include <linux/irqdomain.h>
> +
> +#include "dpu.h"
> +
> +/* DPU common control registers */
> +#define DPU_COMCTRL_REG(offset)		(offset)
> +
> +#define IPIDENTIFIER			DPU_COMCTRL_REG(0x0)
> +#define LOCKUNLOCK			DPU_COMCTRL_REG(0x40)
> +#define LOCKSTATUS			DPU_COMCTRL_REG(0x44)
> +#define USERINTERRUPTMASK(n)		DPU_COMCTRL_REG(0x48 + 4 * (n))
> +#define INTERRUPTENABLE(n)		DPU_COMCTRL_REG(0x50 + 4 * (n))
> +#define INTERRUPTPRESET(n)		DPU_COMCTRL_REG(0x58 + 4 * (n))
> +#define INTERRUPTCLEAR(n)		DPU_COMCTRL_REG(0x60 + 4 * (n))
> +#define INTERRUPTSTATUS(n)		DPU_COMCTRL_REG(0x68 + 4 * (n))
> +#define USERINTERRUPTENABLE(n)		DPU_COMCTRL_REG(0x80 + 4 * (n))
> +#define USERINTERRUPTPRESET(n)		DPU_COMCTRL_REG(0x88 + 4 * (n))
> +#define USERINTERRUPTCLEAR(n)		DPU_COMCTRL_REG(0x90 + 4 * (n))
> +#define USERINTERRUPTSTATUS(n)		DPU_COMCTRL_REG(0x98 + 4 * (n))
> +#define GENERALPURPOSE			DPU_COMCTRL_REG(0x100)
> +
> +#define DPU_SAFETY_STREAM_OFFSET	4
> +
> +/* shadow enable bit for several DPU units */
> +#define SHDEN				BIT(0)
> +
> +/* Pixel Engine Configuration register fields */
> +#define CLKEN_MASK_SHIFT		24
> +#define CLKEN_MASK			(0x3 << CLKEN_MASK_SHIFT)
> +#define CLKEN(n)			((n) << CLKEN_MASK_SHIFT)
> +
> +/* H/Vscaler register fields */
> +#define SCALE_FACTOR_MASK		0xfffff
> +#define SCALE_FACTOR(n)			((n) & 0xfffff)
> +#define PHASE_OFFSET_MASK		0x1fffff
> +#define PHASE_OFFSET(n)			((n) & 0x1fffff)
> +#define OUTPUT_SIZE_MASK		0x3fff0000
> +#define OUTPUT_SIZE(n)			((((n) - 1) << 16) & OUTPUT_SIZE_MASK)
> +#define FILTER_MODE_MASK		0x100
> +#define FILTER_MODE(n)			((n) << 8)
> +#define SCALE_MODE_MASK			0x10
> +#define SCALE_MODE(n)			((n) << 4)
> +
> +enum dpu_irq {
> +	DPU_IRQ_STORE9_SHDLOAD		 = 0,
> +	DPU_IRQ_STORE9_FRAMECOMPLETE	 = 1,
> +	DPU_IRQ_STORE9_SEQCOMPLETE	 = 2,
> +	DPU_IRQ_EXTDST0_SHDLOAD		 = 3,
> +	DPU_IRQ_EXTDST0_FRAMECOMPLETE	 = 4,
> +	DPU_IRQ_EXTDST0_SEQCOMPLETE	 = 5,
> +	DPU_IRQ_EXTDST4_SHDLOAD		 = 6,
> +	DPU_IRQ_EXTDST4_FRAMECOMPLETE	 = 7,
> +	DPU_IRQ_EXTDST4_SEQCOMPLETE	 = 8,
> +	DPU_IRQ_EXTDST1_SHDLOAD		 = 9,
> +	DPU_IRQ_EXTDST1_FRAMECOMPLETE	 = 10,
> +	DPU_IRQ_EXTDST1_SEQCOMPLETE	 = 11,
> +	DPU_IRQ_EXTDST5_SHDLOAD		 = 12,
> +	DPU_IRQ_EXTDST5_FRAMECOMPLETE	 = 13,
> +	DPU_IRQ_EXTDST5_SEQCOMPLETE	 = 14,
> +	DPU_IRQ_DISENGCFG_SHDLOAD0	 = 15,
> +	DPU_IRQ_DISENGCFG_FRAMECOMPLETE0 = 16,
> +	DPU_IRQ_DISENGCFG_SEQCOMPLETE0	 = 17,
> +	DPU_IRQ_FRAMEGEN0_INT0		 = 18,
> +	DPU_IRQ_FRAMEGEN0_INT1		 = 19,
> +	DPU_IRQ_FRAMEGEN0_INT2		 = 20,
> +	DPU_IRQ_FRAMEGEN0_INT3		 = 21,
> +	DPU_IRQ_SIG0_SHDLOAD		 = 22,
> +	DPU_IRQ_SIG0_VALID		 = 23,
> +	DPU_IRQ_SIG0_ERROR		 = 24,
> +	DPU_IRQ_DISENGCFG_SHDLOAD1	 = 25,
> +	DPU_IRQ_DISENGCFG_FRAMECOMPLETE1 = 26,
> +	DPU_IRQ_DISENGCFG_SEQCOMPLETE1	 = 27,
> +	DPU_IRQ_FRAMEGEN1_INT0		 = 28,
> +	DPU_IRQ_FRAMEGEN1_INT1		 = 29,
> +	DPU_IRQ_FRAMEGEN1_INT2		 = 30,
> +	DPU_IRQ_FRAMEGEN1_INT3		 = 31,
> +	DPU_IRQ_SIG1_SHDLOAD		 = 32,
> +	DPU_IRQ_SIG1_VALID		 = 33,
> +	DPU_IRQ_SIG1_ERROR		 = 34,
> +	DPU_IRQ_RESERVED		 = 35,
> +	DPU_IRQ_CMDSEQ_ERROR		 = 36,
> +	DPU_IRQ_COMCTRL_SW0		 = 37,
> +	DPU_IRQ_COMCTRL_SW1		 = 38,
> +	DPU_IRQ_COMCTRL_SW2		 = 39,
> +	DPU_IRQ_COMCTRL_SW3		 = 40,
> +	DPU_IRQ_FRAMEGEN0_PRIMSYNC_ON	 = 41,
> +	DPU_IRQ_FRAMEGEN0_PRIMSYNC_OFF	 = 42,
> +	DPU_IRQ_FRAMEGEN0_SECSYNC_ON	 = 43,
> +	DPU_IRQ_FRAMEGEN0_SECSYNC_OFF	 = 44,
> +	DPU_IRQ_FRAMEGEN1_PRIMSYNC_ON	 = 45,
> +	DPU_IRQ_FRAMEGEN1_PRIMSYNC_OFF	 = 46,
> +	DPU_IRQ_FRAMEGEN1_SECSYNC_ON	 = 47,
> +	DPU_IRQ_FRAMEGEN1_SECSYNC_OFF	 = 48,
> +	DPU_IRQ_COUNT			 = 49,
> +};
> +
> +enum dpu_unit_type {
> +	DPU_DISP,
> +	DPU_BLIT,
> +};
> +
> +struct dpu_units {
> +	const unsigned int *ids;
> +	const enum dpu_unit_type *types;
> +	const unsigned long *ofss;
> +	const unsigned long *pec_ofss;	/* Pixel Engine Configuration */
> +	const unsigned int cnt;
> +};
> +
> +struct dpu_soc {
> +	struct device		*dev;
> +
> +	struct device		*pd_dc_dev;
> +	struct device		*pd_pll0_dev;
> +	struct device		*pd_pll1_dev;
> +	struct device_link	*pd_dc_link;
> +	struct device_link	*pd_pll0_link;
> +	struct device_link	*pd_pll1_link;
> +
> +	void __iomem		*comctrl_reg;
> +
> +	struct clk		*clk_cfg;
> +	struct clk		*clk_axi;
> +
> +	int			id;
> +
> +	int			irq_disengcfg_framecomplete0;
> +	int			irq_disengcfg_seqcomplete0;
> +	int			irq_disengcfg_shdload0;
> +	int			irq_disengcfg_framecomplete1;
> +	int			irq_disengcfg_seqcomplete1;
> +	int			irq_disengcfg_shdload1;
> +	int			irq_extdst0_shdload;
> +	int			irq_extdst1_shdload;
> +	int			irq_extdst4_shdload;
> +	int			irq_extdst5_shdload;
> +
> +	struct irq_domain	*domain;
> +
> +	struct dpu_constframe	*cf_priv[4];
> +	struct dpu_disengcfg	*dec_priv[2];
> +	struct dpu_extdst	*ed_priv[4];
> +	struct dpu_fetchunit	*fd_priv[3];
> +	struct dpu_fetchunit	*fe_priv[4];
> +	struct dpu_framegen	*fg_priv[2];
> +	struct dpu_fetchunit	*fl_priv[1];
> +	struct dpu_fetchunit	*fw_priv[2];
> +	struct dpu_gammacor	*gc_priv[2];
> +	struct dpu_hscaler	*hs_priv[3];
> +	struct dpu_layerblend	*lb_priv[4];
> +	struct dpu_tcon		*tcon_priv[2];
> +	struct dpu_vscaler	*vs_priv[3];
> +};
> +
> +#define DECLARE_DPU_UNIT_HW_INIT_FUNC(unit)			\
> +void dpu_##unit##_hw_init(struct dpu_soc *dpu, unsigned int id)	\
> +
> +DECLARE_DPU_UNIT_HW_INIT_FUNC(cf);
> +DECLARE_DPU_UNIT_HW_INIT_FUNC(dec);
> +DECLARE_DPU_UNIT_HW_INIT_FUNC(ed);
> +DECLARE_DPU_UNIT_HW_INIT_FUNC(fd);
> +DECLARE_DPU_UNIT_HW_INIT_FUNC(fe);
> +DECLARE_DPU_UNIT_HW_INIT_FUNC(fg);
> +DECLARE_DPU_UNIT_HW_INIT_FUNC(fl);
> +DECLARE_DPU_UNIT_HW_INIT_FUNC(fw);
> +DECLARE_DPU_UNIT_HW_INIT_FUNC(gc);
> +DECLARE_DPU_UNIT_HW_INIT_FUNC(hs);
> +DECLARE_DPU_UNIT_HW_INIT_FUNC(lb);
> +DECLARE_DPU_UNIT_HW_INIT_FUNC(tcon);
> +DECLARE_DPU_UNIT_HW_INIT_FUNC(vs);

Why use macros to declare these functions? It wouldn't make such a big
difference declaring them explicitly.

> +
> +#define DECLARE_DPU_UNIT_INIT_FUNC(unit)			\
> +int dpu_##unit##_init(struct dpu_soc *dpu, unsigned int index,	\
> +		      unsigned int id, enum dpu_unit_type type,	\
> +		      unsigned long pec_base, unsigned long base)
> +
> +DECLARE_DPU_UNIT_INIT_FUNC(cf);
> +DECLARE_DPU_UNIT_INIT_FUNC(dec);
> +DECLARE_DPU_UNIT_INIT_FUNC(ed);
> +DECLARE_DPU_UNIT_INIT_FUNC(fd);
> +DECLARE_DPU_UNIT_INIT_FUNC(fe);
> +DECLARE_DPU_UNIT_INIT_FUNC(fg);
> +DECLARE_DPU_UNIT_INIT_FUNC(fl);
> +DECLARE_DPU_UNIT_INIT_FUNC(fw);
> +DECLARE_DPU_UNIT_INIT_FUNC(gc);
> +DECLARE_DPU_UNIT_INIT_FUNC(hs);
> +DECLARE_DPU_UNIT_INIT_FUNC(lb);
> +DECLARE_DPU_UNIT_INIT_FUNC(tcon);
> +DECLARE_DPU_UNIT_INIT_FUNC(vs);

Same question goes here.

> +
> +#endif /* __DPU_PRV_H__ */
> diff --git a/drivers/gpu/drm/imx/dpu/dpu-tcon.c b/drivers/gpu/drm/imx/dpu/dpu-tcon.c
> new file mode 100644
> index 00000000..e58dac8
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dpu/dpu-tcon.c

[...]

> +
> +void dpu_tcon_hw_init(struct dpu_soc *dpu, unsigned int index)
> +{
> +	struct dpu_tcon *tcon = dpu->tcon_priv[index];

You can safely get rid of this extra variable.

Thanks,
laurentiu

> +
> +	/* reset TCON_CTRL to POR default so that TCON works in bypass mode */
> +	dpu_tcon_write(tcon, TCON_CTRL, CTRL_RST_VAL);
> +}
> +
 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
