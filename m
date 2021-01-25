Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 397863025AB
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 14:48:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B70C6E054;
	Mon, 25 Jan 2021 13:48:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60056.outbound.protection.outlook.com [40.107.6.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1696E054
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 13:48:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D8dDha8Jnp0tHNQGe5aaBnYPdF630TqUohmnqHgGMOk9e3DIW+hgDXTMLTgWCFPAiYiAVHwcoYF8tOPmSgGVPL56rayNer7OVB2aC+B6JrGBGeN5f28/cxvUvOI4YkrMns2EfMTi86JIvyJagDLpIy/jnmGCIESNh6Qq4Dp1RtKUe31ncmz5487LQAcp49Z5wdxsJGp/klCzd4zq/0ZrR1HXwKSlTt6PPqyL7ONyiNCgLGsg3s1MIryOAUq+1d1VV/qy/QNuXl79AKhzpCR0MOOwfD6YLKtJImEF3DDlw09eBv9DAXunJuiQQcWen3fgVHbshE8A7zDPINh5zsfI2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6+k7LlBtyXruE11FrJ6y1XmUOuoyVnqSwAM2HhVOow=;
 b=Fjmkw9XWB9Qgx9HK9t0E1coctgagd543wUtOqpKG2GPSEplZA/s+f//UjxRer+MJ1VFmfIxDb4XO5FUQipKJKkF5x1RjPm7RtU43LYhcUZWj90uztNhASIPkuxQqHo+1wijP8hOXpzr226BoQcI0Bymcnu8kiQ4SH+x1Wok4TR2t6lHNDUni479MHgS1/AQcQ0SFcu9xzeL/fyZUWERmIUGIgGtYghw8qNpAPxNMw5fwjur93LVQq4u2p1JlboRLPb4o1E8PGCdgcay4dQ33u/70WSwzTBRZnn5cZdp99eSFs3oxusNS5yH136c2520YXBYOLHywI2Cv867yUx3nOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6+k7LlBtyXruE11FrJ6y1XmUOuoyVnqSwAM2HhVOow=;
 b=KtvaS8siEFcu0VVdJC+/Vn8MaAHjuFoQtxUs8HHweWD2dXrsLg/TLUKbOI63DyDG/NLlAIWy5aYZzfARbfHiLf20DsghR5Tjg66gX7a7YNVodu4/bfyi4MMewhhC2NLLZdzY9aehEniBXxhRGesAfdurRjgVC9ibPEoThX3ZAwg=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR04MB5631.eurprd04.prod.outlook.com
 (2603:10a6:803:dd::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Mon, 25 Jan
 2021 13:48:11 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::41ff:37e2:c7f5:56a1]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::41ff:37e2:c7f5:56a1%5]) with mapi id 15.20.3763.017; Mon, 25 Jan 2021
 13:48:11 +0000
Date: Mon, 25 Jan 2021 15:48:06 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v6 5/6] drm/imx: Introduce i.MX8qm/qxp DPU DRM
Message-ID: <20210125134806.w77bdrx2wbb4kirz@fsr-ub1864-141>
References: <1611213263-7245-1-git-send-email-victor.liu@nxp.com>
 <1611213263-7245-6-git-send-email-victor.liu@nxp.com>
Content-Disposition: inline
In-Reply-To: <1611213263-7245-6-git-send-email-victor.liu@nxp.com>
User-Agent: NeoMutt/20171215
X-Originating-IP: [83.217.231.2]
X-ClientProxiedBy: AM0PR03CA0069.eurprd03.prod.outlook.com (2603:10a6:208::46)
 To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141 (83.217.231.2) by
 AM0PR03CA0069.eurprd03.prod.outlook.com (2603:10a6:208::46) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.12 via Frontend Transport; Mon, 25 Jan 2021 13:48:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2f1b4694-d3ef-43c8-4bdc-08d8c137da78
X-MS-TrafficTypeDiagnostic: VI1PR04MB5631:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB563179E48256F2942D89B2DABEBD0@VI1PR04MB5631.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DsOdg+L/tkk7NYPEYW85pnOY7IJNT20jm9ozbuZS1S+3Unot76JF/mGJlmff+gfyWY9jambQ43lu1SJolwiPZ2ie4ZEs7xD4yqgkfve14/gNZGH1Tu4ip9omWsQ2dkKHZPFkiP1O40KEvEpIMNzP8xSoUs0BbEE2l4M4ZQewOAM4hGzb76BeV5BwsX5d4BzWQKw6Htw6jjOEyzap+2uTusLI1u+TkdATKTtFCCnx3Ofvo/WJyRURw34l9W56XcDY0QuL5+ZWLzi8r8eCZawEVdRUeHY8/fCz40Lkbp7cJvP0W7J6s6HgKg6ssbtv+jLr1vkBLzwSrMFJCNA5v0mpgQbQkl/NScU4U8PWvfA7s8uok/5O4W52os4FIOPCzGaqhg6BlL9QoA0aOJ4TWgJ8GEvhG3Tx/ZN040A+wVbmN3Vb0i4Hi15853hyrtRJB7WN2hABHTkJ4oTI1ovCsFSDo2vgvMh6NCMU4qbsByWZj6zjFvSr/p9sG/tI/rO0KXC8qetZi/rLVN1cltGFFrcacJZBdD3vEpRSkod/ODjhjJ10qW/CsDFdx9BRnISFR4ggUxH7xRx1G/h9sPDNLE0/t2tIdOGTJiXaJ7IMhnA+Vgs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(8676002)(86362001)(4326008)(966005)(16526019)(9686003)(6862004)(55016002)(52116002)(44832011)(83380400001)(6666004)(6496006)(26005)(956004)(33716001)(7416002)(5660300002)(66556008)(66476007)(2906002)(8936002)(66946007)(1076003)(316002)(186003)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?r5/hSlKXYuuDZW/y/GR+saHxnVU2nQkkDvbelXwSVJMghX4qwoWZxd3ZU3GD?=
 =?us-ascii?Q?DSx1MvRspSddcOFEFLodRiLeM0OrSVJ+JHuxTG9DTnsvn1Cp5l/on6vcvEgL?=
 =?us-ascii?Q?Iiz4a+9Eel/fhX1dv1TLwhXbE1c3RuHILpdE9hJo7opjfgQLZdMOnqsZQsEN?=
 =?us-ascii?Q?4mtpj2B79yKcUkwDolAI4wE+qNj62DIGEirexFuv4dBvIjMAg12rtdOqm1nk?=
 =?us-ascii?Q?TxtYJdep9r9nVOqmchF5wpV2JAuOYCl5x5dyE1jHcriFzAE4XJ5jBOijkucq?=
 =?us-ascii?Q?EJHNZcTJgHglCS/wqmcjPXG3+QoOmFd2nLYrtiEAu02ZaNPIisraMQCfBUPz?=
 =?us-ascii?Q?Scn9F29Qi8QrJtGX5CWo0u5Ojg5wvfVyihJeldMBEFgIGUJgH3zJWZtmzlHp?=
 =?us-ascii?Q?EeMTtkaj9zMmmHVUMng1Gv/0ldXR0TnvrdbKKSI5nkinvci0rKL7fXfgITLw?=
 =?us-ascii?Q?bDpBdFZKFMrVauQJ9z7tT6tumjXybV1BMP3sZfZAvC3p9ydjIXPiUdZJaYS3?=
 =?us-ascii?Q?PrrcsnInIhUePOYfb+T70ArOzSvF5ZkA/KR6sC9FcBW/iPjR2XNe7Q+yShN2?=
 =?us-ascii?Q?fB4yUnqrVpB7HMGNn2SI8s/GNVEm08Lw0tNCw6l4fXhogePO1Cbk1xj+fqS2?=
 =?us-ascii?Q?wc2SOk6GYQMsIiykDlodGiGAYA7Hla+fDXuXEngGXadhbK0EBDiBXp1ByZYU?=
 =?us-ascii?Q?2sFF55S46JNO5cuGeEkpcOaqa2Mm1pALVqKShtBU5Stu87wwO6LVA/4NpJOh?=
 =?us-ascii?Q?v1h+QW4LpQF3V1n9Rtp4XmHEFePyyrsKUwoXN4p5zKHT4rpvBRIVfxzVwh5+?=
 =?us-ascii?Q?5IujL//XIh5DeGuumzXr/ugD4bCTxIA8NdVfASCw79AFXRc4J/jrvpRW2sz8?=
 =?us-ascii?Q?X0ciZ6Szs/KucSEoJniFhAbYbW7zTE8moO67nd87dI01eUDFULN+lJJptMf1?=
 =?us-ascii?Q?1vKizhvKABbInOCoClZQBxP8np7m5frBTYTW5+gT0G4c/wt/l5c+8z87ATPf?=
 =?us-ascii?Q?hKMy0L5YwXRYDuVknwI3mrioFBVf7LdtsP3SetGzPqZUIeHmA7w9wmZ0Sdz9?=
 =?us-ascii?Q?MwmrVquw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f1b4694-d3ef-43c8-4bdc-08d8c137da78
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 13:48:11.0701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b+vtg7/rRW7GL+JWqsDlr6WL3lE472k96Wk21sVzrnwgXutT+NKy9+6IrCbQmwfrcQOSdxzD66jfvG4NSWG17Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5631
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

Just some minor comments below.

On Thu, Jan 21, 2021 at 03:14:22PM +0800, Liu Ying wrote:
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
> v5->v6:
> * Do not use macros where possible. (Laurentiu)
> * Break dpu_plane_atomic_check() into some smaller functions. (Laurentiu)
> * Address some minor comments from Laurentiu.
> * Add dpu_crtc_err() helper marco to tell dmesg which CRTC generates error.
> * Drop calling dev_set_drvdata() from dpu_drm_bind/unbind() as it is done
>   in dpu_drm_probe().
> * Some trivial tweaks.
> 
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
>  drivers/gpu/drm/imx/Kconfig               |    1 +
>  drivers/gpu/drm/imx/Makefile              |    1 +
>  drivers/gpu/drm/imx/dpu/Kconfig           |   10 +
>  drivers/gpu/drm/imx/dpu/Makefile          |   10 +
>  drivers/gpu/drm/imx/dpu/dpu-constframe.c  |  171 +++++
>  drivers/gpu/drm/imx/dpu/dpu-core.c        | 1094 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/imx/dpu/dpu-crtc.c        |  967 +++++++++++++++++++++++++
>  drivers/gpu/drm/imx/dpu/dpu-crtc.h        |   66 ++
>  drivers/gpu/drm/imx/dpu/dpu-disengcfg.c   |  117 +++
>  drivers/gpu/drm/imx/dpu/dpu-dprc.c        |  718 +++++++++++++++++++
>  drivers/gpu/drm/imx/dpu/dpu-dprc.h        |   40 ++
>  drivers/gpu/drm/imx/dpu/dpu-drv.c         |  292 ++++++++
>  drivers/gpu/drm/imx/dpu/dpu-drv.h         |   28 +
>  drivers/gpu/drm/imx/dpu/dpu-extdst.c      |  299 ++++++++
>  drivers/gpu/drm/imx/dpu/dpu-fetchdecode.c |  294 ++++++++
>  drivers/gpu/drm/imx/dpu/dpu-fetcheco.c    |  224 ++++++
>  drivers/gpu/drm/imx/dpu/dpu-fetchlayer.c  |  154 ++++
>  drivers/gpu/drm/imx/dpu/dpu-fetchunit.c   |  609 ++++++++++++++++
>  drivers/gpu/drm/imx/dpu/dpu-fetchunit.h   |  191 +++++
>  drivers/gpu/drm/imx/dpu/dpu-fetchwarp.c   |  250 +++++++
>  drivers/gpu/drm/imx/dpu/dpu-framegen.c    |  395 +++++++++++
>  drivers/gpu/drm/imx/dpu/dpu-gammacor.c    |  223 ++++++
>  drivers/gpu/drm/imx/dpu/dpu-hscaler.c     |  275 ++++++++
>  drivers/gpu/drm/imx/dpu/dpu-kms.c         |  540 ++++++++++++++
>  drivers/gpu/drm/imx/dpu/dpu-kms.h         |   23 +
>  drivers/gpu/drm/imx/dpu/dpu-layerblend.c  |  348 +++++++++
>  drivers/gpu/drm/imx/dpu/dpu-plane.c       |  799 +++++++++++++++++++++
>  drivers/gpu/drm/imx/dpu/dpu-plane.h       |   56 ++
>  drivers/gpu/drm/imx/dpu/dpu-prg.c         |  433 ++++++++++++
>  drivers/gpu/drm/imx/dpu/dpu-prg.h         |   45 ++
>  drivers/gpu/drm/imx/dpu/dpu-prv.h         |  233 ++++++
>  drivers/gpu/drm/imx/dpu/dpu-tcon.c        |  250 +++++++
>  drivers/gpu/drm/imx/dpu/dpu-vscaler.c     |  308 ++++++++
>  drivers/gpu/drm/imx/dpu/dpu.h             |  385 ++++++++++
>  34 files changed, 9849 insertions(+)
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
> index 00000000..7dab6cc
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dpu/dpu-core.c

[...]

> +static int dpu_get_irqs(struct platform_device *pdev, struct dpu_soc *dpu)
> +{
> +	unsigned int i, j;
> +
> +	/* do not get the reserved irq */
> +	for (i = 0, j = 0; i < DPU_IRQ_COUNT - 1; i++, j++) {
> +		if (i == DPU_IRQ_RESERVED)
> +			j++;
> +
> +		dpu->irq[j] = platform_get_irq(pdev, i);
> +		if (dpu->irq[j] < 0) {
> +			dev_err_probe(dpu->dev, dpu->irq[j],
> +				      "failed to get irq\n");
> +			return dpu->irq[i];

I think you want 'return dpu->irq[j]'.

> +		}
> +	}
> +
> +	return 0;
> +}

[...]

> +static const struct dpu_irq_handler_map {
> +	void (*handler)(struct irq_desc *desc);
> +} dpu_irq_handler_maps[DPU_IRQ_COUNT] = {
> +	{},						/* 0 */
> +	{},						/* 1 */
> +	{},						/* 2 */
> +	{dpu_extdst0_shdload_irq_handler},		/* 3 */
> +	{},						/* 4 */
> +	{},						/* 5 */
> +	{dpu_extdst4_shdload_irq_handler},		/* 6 */
> +	{},						/* 7 */
> +	{},						/* 8 */
> +	{dpu_extdst1_shdload_irq_handler},		/* 9 */
> +	{},						/* 10 */
> +	{},						/* 11 */
> +	{dpu_extdst5_shdload_irq_handler},		/* 12 */
> +	{},						/* 13 */
> +	{},						/* 14 */
> +	{dpu_disengcfg_shdload0_irq_handler},		/* 15 */
> +	{dpu_disengcfg_framecomplete0_irq_handler},	/* 16 */
> +	{dpu_disengcfg_seqcomplete0_irq_handler},	/* 17 */
> +	{},						/* 18 */
> +	{},						/* 19 */
> +	{},						/* 20 */
> +	{},						/* 21 */
> +	{},						/* 22 */
> +	{},						/* 23 */
> +	{},						/* 24 */
> +	{dpu_disengcfg_shdload1_irq_handler},		/* 25 */
> +	{dpu_disengcfg_framecomplete1_irq_handler},	/* 26 */
> +	{dpu_disengcfg_seqcomplete1_irq_handler},	/* 27 */
> +	{},						/* 28 */
> +	{},						/* 29 */
> +	{},						/* 30 */
> +	{},						/* 31 */
> +	{},						/* 32 */
> +	{},						/* 33 */
> +	{},						/* 34 */
> +	{/* reserved */},				/* 35 */
> +	{},						/* 36 */
> +	{},						/* 37 */
> +	{},						/* 38 */
> +	{},						/* 39 */
> +	{},						/* 40 */
> +	{},						/* 41 */
> +	{},						/* 42 */
> +	{},						/* 43 */
> +	{},						/* 44 */
> +	{},						/* 45 */
> +	{},						/* 46 */
> +	{},						/* 47 */
> +	{},						/* 48 */
> +};

Why not make this an array of pointers to functions. Do we need a struct?
Something like:

static void (* const dpu_irq_handler[DPU_IRQ_COUNT])(struct irq_desc *) = {
	[3] = dpu_extdst0_shdload_irq_handler,
	[6] = dpu_extdst4_shdload_irq_handler,
	...
};

[...]

> +static int
> +dpu_get_fetchunits_for_plane_grp(struct dpu_soc *dpu,
> +				 const struct dpu_units *us,
> +				 struct dpu_fetchunit ***fu,
> +				 unsigned int *cnt,
> +				 struct dpu_fetchunit *
> +						(*get)(struct dpu_soc *dpu,
> +						       unsigned int id))
> +{
> +	unsigned int fu_cnt = 0;
> +	int i, j, ret;
> +
> +	for (i = 0; i < us->cnt; i++) {
> +		if (us->types[i] == DPU_DISP)
> +			fu_cnt++;
> +	}
> +
> +	*cnt = fu_cnt;
> +
> +	*fu = devm_kcalloc(dpu->dev, fu_cnt, sizeof(**fu), GFP_KERNEL);
> +	if (!(*fu))
> +		return -ENOMEM;
> +
> +	for (i = 0, j = 0; i < us->cnt; i++) {
> +		if (us->types[i] != DPU_DISP)
> +			continue;
> +
> +		(*fu)[j] = (*get)(dpu, us->ids[i]);

You can also call get() directly. No need to dereference function
pointers.

> +		if (IS_ERR((*fu)[j])) {
> +			ret = PTR_ERR((*fu)[j]);
> +			dev_err(dpu->dev, "failed to get %s%d: %d\n",
> +						us->name, us->ids[i], ret);
> +			return ret;
> +		}
> +		j++;
> +	}
> +
> +	return 0;
> +}

[...]

> +static void
> +dpu_put_fetchunits_for_plane_grp(struct dpu_fetchunit ***fu,
> +				 unsigned int *cnt,
> +				 void (*put)(struct dpu_fetchunit *fu))
> +{
> +	int i;
> +
> +	for (i = 0; i < *cnt; i++)
> +		(*put)((*fu)[i]);

Same here, you can call put() directly.

> +
> +	*cnt = 0;
> +}

Thanks,
laurentiu
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
