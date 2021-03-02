Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AA332A27D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 15:36:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D0B6E160;
	Tue,  2 Mar 2021 14:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30041.outbound.protection.outlook.com [40.107.3.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 885D06E160
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 14:36:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SBYJChfC1SgbO59DtASSZPJNuSi/Z+Rd/eMCm5/vT1VCdOE5IW9X70EBNh7fma4DAS7pjt5Y0kOe7qfGissv8tgTlFVVixQ6YHCDgfPRfgUZf4188FD3MHKNs3Uci3keTijLmJyFGHwMOZke0MmsiLPqN5r5BV8o04SqqZGRyCYB2pz3Jkxm+En1mCqx4ZXo5yErCpNL2T1IHKFz+hqDC8J7HqY4D51xvGnRFkbfaKQHtjBVwTKvYHukjff1hAabQSRo7MNrHOXHd7utF37lw3nCcJO74A3ndjMs2Mg19giw74WzrIhY23WP8Sp53UABga0GbbnYmH///D7KHJS1MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKZvIkWnAbkv1BVa0sgaf0KvrBWA55tg6TNqDZKUQt8=;
 b=PKsM+JM+Wx2wKb5LF8GAI3lZoNZb9fzW07Vm5QlyoT+rPhTwFMkqJL1MlXaP7D9eEqQRffculbbVPTczujsCvK9JGAAxqfOHYuKKdPCsUZFqMWxI7O68rDESE5zj0TnMlszlXxwLxmDS8PmaWqc6KqozWQ/q/X7do0M7/AbY7qUNeE5Y8YRfSh5Z2PN0BXEBDbn7PoGnz8KjMOUDhuJE+tpqixyJZ/mhRQ9/tg4ontKxCGMUiRxm72LuHghxnSrSXkIn8gi8CDh2ufrJ7JghHtPfBppYpPFvwmF/F8SeoW69Xd5ckWlj6rTD1oa9rV9jdd2zJioz9tOROq4xuQEhSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKZvIkWnAbkv1BVa0sgaf0KvrBWA55tg6TNqDZKUQt8=;
 b=Wd4ssMHrN1qu9RxVSBrbmTE+Vd8Y0Q/RdXL9SPg7PBe8JziMK0miE7bRBv6PbscXXsV9NtxiL0jFsCff9S9tnhQKC36A++T5OSu3SVI/TVVbAO3VSH+CiSSZcryiBaYMOwwNsXo6XWCbRn1RJDDHiaK9ALLXOUu6QOkBbHbpR0w=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR04MB4992.eurprd04.prod.outlook.com
 (2603:10a6:803:51::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Tue, 2 Mar
 2021 14:36:10 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::d1de:8585:df7a:fe2f]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::d1de:8585:df7a:fe2f%3]) with mapi id 15.20.3868.032; Tue, 2 Mar 2021
 14:36:10 +0000
Date: Tue, 2 Mar 2021 16:36:05 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v8 5/6] drm/imx: Introduce i.MX8qm/qxp DPU DRM
Message-ID: <20210302143605.d65vodn4o3e4zxdj@fsr-ub1864-141>
References: <1614666796-19374-1-git-send-email-victor.liu@nxp.com>
 <1614666796-19374-6-git-send-email-victor.liu@nxp.com>
Content-Disposition: inline
In-Reply-To: <1614666796-19374-6-git-send-email-victor.liu@nxp.com>
User-Agent: NeoMutt/20171215
X-Originating-IP: [83.217.231.2]
X-ClientProxiedBy: AM8P189CA0005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::10) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141 (83.217.231.2) by
 AM8P189CA0005.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Tue, 2 Mar 2021 14:36:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d6a0a663-8a45-4c87-844d-08d8dd888575
X-MS-TrafficTypeDiagnostic: VI1PR04MB4992:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-MinimumUrlDomainAge: nxp.com#8764
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB499224170ACB2843BC07C5C2BE999@VI1PR04MB4992.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +D9EFbp5cJ6dbMU5mOi8W8JC/OfxJ3K9/mmaYpvNeYjW8RgSAdreuBBnMz1CsyDbuYjxWDuld/Zxo9MPNTK6kdsV0ezwYIOVAqVxf9bWQBfuNeRKHLOcFHSWs1KB6OiERK+uxbzLrebwOgMY0Qe+EOEYFCliXkhlHzdEWYj63g5rvi18coCIkJKRmdrA5HOWfKClTvL5C+e1C8LEEw/87oMcnYSYAaAPCtyDAX+w0/njhk9FcjO8NnETc303nbTGzUoKDAhTZEO5j0azEgX2tsY+17AV4dIQtIjBY30BjptVDqB7DfbQel8YYbqEB1Mp09zj9LpjzozwwiDp1zvHjkPrgMFzy+hg9EghMTaIeWUVf9w3MMDzEz+mIZVVe0cKwOYw3m/TKxJKNmN6Ke2RkMaHtH359zc5oTt+C5TG8TD540AnESZsamazhfpCLDt5WtNlC110F1hVAOmrPg4CLq5MxaDMmnpRMviXl0bwt5YafHLHPOlbqlCUzstlWPsq5mf7JkpOlGI36ycqDRfu1WGs1XXmgohfvWMWOfSPcCtgCzquQ9mHcl8VY+ZaW+WtxASuafgcn5AODv1ohWMS+NpTqZxsquSAluQN69lceI0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(39860400002)(346002)(396003)(52116002)(186003)(6666004)(6496006)(7416002)(9686003)(2906002)(316002)(26005)(956004)(8936002)(66476007)(44832011)(8676002)(55016002)(966005)(30864003)(66946007)(4326008)(6862004)(16526019)(478600001)(1076003)(5660300002)(83380400001)(86362001)(66556008)(33716001)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ccbz+xfNSgYuBFykXS3fGxTF1PXd+C+kX95jL3Hy7DD64GEF9KRG/nhEGsm+?=
 =?us-ascii?Q?LQxWSM+yzcQOvmBRsJVBHUYO4iCs7Puw60QfnYoXoUYU+PTpPAte4344rQLf?=
 =?us-ascii?Q?QNrpMsIIYMnCiEzyCcGIYIzbu87vn9sh0RG/BcHALt2k6+lLEsbe6qio1uXp?=
 =?us-ascii?Q?6bz6X1jEU7OGu1ZR4tZOLFvQdo+iR7l8JmRs/eFeKS+Y9m+U6sl59ap5G5Og?=
 =?us-ascii?Q?r0A8nB0aQBZukaJW3ea8qEDjsVUFhmQlyaNllOMYD6Aasp/eLI3wMvAR9S6M?=
 =?us-ascii?Q?EZ83WB1IzaOIot++AeuDdVWo8BNwNzMjUKEH54ANBzSOKYL5cDJ8ZyRr9XPm?=
 =?us-ascii?Q?DOKR112Sx7JIfuEb8NyEHYTp6SbO4gaIlCfwSZqGvqQcLRxfWRivsJYCly/o?=
 =?us-ascii?Q?xObpKSaHzqG8NGcWUQo26WA8k+VaYMqS+X02fE3Kk8ix5qusPpQHpC4Crsnk?=
 =?us-ascii?Q?EAU5OVJsbJc0UdvJgXkRKQrxkF2raPkan0CcKq3E+uSlCZxKInB20/Dnj4S4?=
 =?us-ascii?Q?bZG8as6NBbZN1j8ZYsYyu7BhNwHxJ4rji05NO7gNN5uFmxI1ksZSFWqMI5Q0?=
 =?us-ascii?Q?Cs6kGrm05bGzADNk7Xs6BopfL45L6EeUMpuUjbDIx9tKaeH+z2lGvsUadOcH?=
 =?us-ascii?Q?rJLlAibmGpzLbEw78Rjc1Wfb9ZsnK2++c1Ypa01ytAFjGwvWVkddYrU9QTg0?=
 =?us-ascii?Q?ThNLb0PrcXZFahQxSRLmE40C9Mk5HFeKRpps7mUuOPZUD9ohSgRINXCizU7F?=
 =?us-ascii?Q?jBNzD8HOGFiOmjzSGMYml+dEF8w+lTdB1DJVnqm5JH/xc3PGVRGitNtMCyoi?=
 =?us-ascii?Q?IH+muXMrUslbInA+Uq2ZxQH02RBZ9Xp0O6GGTgKcw57OjNQeEof+/zIJ/GOl?=
 =?us-ascii?Q?ePUwxHiH8h+GSnSaUNONqnzWIQjKhAcWIAL1K74S0vj0hNNvD5bGMUxrq2oq?=
 =?us-ascii?Q?h03DTRCB4q59MnkuygdtA3NOavjYVbtVRkGO+zgIxWpIhtNIUtLgMiz3Y5GM?=
 =?us-ascii?Q?x00JYA2iaoD4wi28la3G8xZg1tJILCybYp+R4uLj8mF4EblFm6YqBaS1NL33?=
 =?us-ascii?Q?udJPiq2euJQ1/K52aCmoF+auXFkwB+ram0HJecgUVhAWO4kJGYiLZYVhXU2E?=
 =?us-ascii?Q?DP4xKUdpCSwbDupbjlg+jamltya/g/saGwwXyoS/Qm/knvdoG18d6wokDsz6?=
 =?us-ascii?Q?SrOhVccYMQMpFY4Q7AEbQfNeBs/e/A8yefCJRepZv4CsQJTdopaKpZCv9FMl?=
 =?us-ascii?Q?MHZLLrPqMrVHWhaFX4w47WZgGtUwm/tWhF7BKaqra8O09b0oH0EiTFYdAi2u?=
 =?us-ascii?Q?gNdnireaVMNzUnrwXiQiTdAV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6a0a663-8a45-4c87-844d-08d8dd888575
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2021 14:36:10.7881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DDH2NibYXqzRLV0BVzaPefwpiyhA7pFUhiCQXlNCsy+59npGbp15yUC8o0SXaQx1j3seus5LOh72HFBTF9yoAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4992
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

One comment below.

On Tue, Mar 02, 2021 at 02:33:15PM +0800, Liu Ying wrote:
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
> Laurentiu, I see your R-b tag on this patch of v7.
> As this patch is changed in v8, can you please help review and maybe add your
> R-b tag again?
> 
> v7->v8:
> * Update dpu_plane_atomic_check() and dpu_plane_atomic_update(), due to DRM
>   plane helper functions API change(atomic_check and atomic_update) from DRM
>   atomic core.  Also, rename plane->state variables and relevant DPU plane
>   state variables in those two functions to reflect they are new states, like
>   the patch 'drm: Rename plane->state variables in atomic update and disable'
>   recently landed in drm-misc-next.
> * Replace drm_gem_fb_prepare_fb() with drm_gem_plane_helper_prepare_fb(),
>   due to DRM core API change.
> * Use 256byte DPR burst length for GPU standard tile and 128byte DPR burst
>   length for 32bpp GPU super tile to align with the latest version of internal
>   HW documention.
> 
> v6->v7:
> * Fix return value of dpu_get_irqs() if platform_get_irq() fails. (Laurentiu)
> * Use the function array dpu_irq_handler[] to store individual DPU irq handlers.
>   (Laurentiu)
> * Call get/put() hooks directly to get/put DPU fetchunits for DPU plane groups.
>   (Laurentiu)
> * Shorten the names of individual DPU irq handlers by using DPU unit abbrev
>   names to make writing dpu_irq_handler[] easier.
> 
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
>  drivers/gpu/drm/imx/dpu/dpu-core.c        | 1054 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/imx/dpu/dpu-crtc.c        |  967 ++++++++++++++++++++++++++
>  drivers/gpu/drm/imx/dpu/dpu-crtc.h        |   66 ++
>  drivers/gpu/drm/imx/dpu/dpu-disengcfg.c   |  117 ++++
>  drivers/gpu/drm/imx/dpu/dpu-dprc.c        |  722 ++++++++++++++++++++
>  drivers/gpu/drm/imx/dpu/dpu-dprc.h        |   40 ++
>  drivers/gpu/drm/imx/dpu/dpu-drv.c         |  292 ++++++++
>  drivers/gpu/drm/imx/dpu/dpu-drv.h         |   28 +
>  drivers/gpu/drm/imx/dpu/dpu-extdst.c      |  299 ++++++++
>  drivers/gpu/drm/imx/dpu/dpu-fetchdecode.c |  294 ++++++++
>  drivers/gpu/drm/imx/dpu/dpu-fetcheco.c    |  224 ++++++
>  drivers/gpu/drm/imx/dpu/dpu-fetchlayer.c  |  154 +++++
>  drivers/gpu/drm/imx/dpu/dpu-fetchunit.c   |  609 +++++++++++++++++
>  drivers/gpu/drm/imx/dpu/dpu-fetchunit.h   |  191 ++++++
>  drivers/gpu/drm/imx/dpu/dpu-fetchwarp.c   |  250 +++++++
>  drivers/gpu/drm/imx/dpu/dpu-framegen.c    |  395 +++++++++++
>  drivers/gpu/drm/imx/dpu/dpu-gammacor.c    |  223 ++++++
>  drivers/gpu/drm/imx/dpu/dpu-hscaler.c     |  275 ++++++++
>  drivers/gpu/drm/imx/dpu/dpu-kms.c         |  540 +++++++++++++++
>  drivers/gpu/drm/imx/dpu/dpu-kms.h         |   23 +
>  drivers/gpu/drm/imx/dpu/dpu-layerblend.c  |  348 ++++++++++
>  drivers/gpu/drm/imx/dpu/dpu-plane.c       |  802 ++++++++++++++++++++++
>  drivers/gpu/drm/imx/dpu/dpu-plane.h       |   56 ++
>  drivers/gpu/drm/imx/dpu/dpu-prg.c         |  433 ++++++++++++
>  drivers/gpu/drm/imx/dpu/dpu-prg.h         |   45 ++
>  drivers/gpu/drm/imx/dpu/dpu-prv.h         |  233 +++++++
>  drivers/gpu/drm/imx/dpu/dpu-tcon.c        |  250 +++++++
>  drivers/gpu/drm/imx/dpu/dpu-vscaler.c     |  308 +++++++++
>  drivers/gpu/drm/imx/dpu/dpu.h             |  385 +++++++++++
>  34 files changed, 9816 insertions(+)
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

> diff --git a/drivers/gpu/drm/imx/dpu/dpu-plane.c b/drivers/gpu/drm/imx/dpu/dpu-plane.c
> new file mode 100644
> index 00000000..aaf0fe0
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dpu/dpu-plane.c
> @@ -0,0 +1,802 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +/*
> + * Copyright 2017-2020 NXP
> + */
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_color_mgmt.h>
> +#include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_plane_helper.h>
> +
> +#include "dpu.h"
> +#include "dpu-crtc.h"
> +#include "dpu-dprc.h"
> +#include "dpu-plane.h"
> +
> +#define FRAC_16_16(mult, div)			(((mult) << 16) / (div))
> +
> +#define DPU_PLANE_MAX_PITCH			0x10000
> +#define DPU_PLANE_MAX_PIX_CNT			8192
> +#define DPU_PLANE_MAX_PIX_CNT_WITH_SCALER	2048
> +
> +static const uint32_t dpu_plane_formats[] = {
> +	DRM_FORMAT_ARGB8888,
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_ABGR8888,
> +	DRM_FORMAT_XBGR8888,
> +	DRM_FORMAT_RGBA8888,
> +	DRM_FORMAT_RGBX8888,
> +	DRM_FORMAT_BGRA8888,
> +	DRM_FORMAT_BGRX8888,
> +	DRM_FORMAT_RGB565,
> +
> +	DRM_FORMAT_YUYV,
> +	DRM_FORMAT_UYVY,
> +	DRM_FORMAT_NV12,
> +	DRM_FORMAT_NV21,
> +};
> +
> +static const uint64_t dpu_plane_format_modifiers[] = {
> +	DRM_FORMAT_MOD_VIVANTE_TILED,
> +	DRM_FORMAT_MOD_VIVANTE_SUPER_TILED,
> +	DRM_FORMAT_MOD_LINEAR,
> +	DRM_FORMAT_MOD_INVALID,
> +};
> +
> +static unsigned int dpu_plane_get_default_zpos(enum drm_plane_type type)
> +{
> +	if (type == DRM_PLANE_TYPE_PRIMARY)
> +		return 0;
> +	else if (type == DRM_PLANE_TYPE_OVERLAY)
> +		return 1;
> +
> +	return 0;
> +}
> +
> +static void dpu_plane_destroy(struct drm_plane *plane)
> +{
> +	struct dpu_plane *dpu_plane = to_dpu_plane(plane);
> +
> +	drm_plane_cleanup(plane);
> +	kfree(dpu_plane);
> +}
> +
> +static void dpu_plane_reset(struct drm_plane *plane)
> +{
> +	struct dpu_plane_state *state;
> +
> +	if (plane->state) {
> +		__drm_atomic_helper_plane_destroy_state(plane->state);
> +		kfree(to_dpu_plane_state(plane->state));
> +		plane->state = NULL;
> +	}
> +
> +	state = kzalloc(sizeof(*state), GFP_KERNEL);
> +	if (!state)
> +		return;
> +
> +	__drm_atomic_helper_plane_reset(plane, &state->base);
> +
> +	plane->state->zpos = dpu_plane_get_default_zpos(plane->type);
> +	plane->state->color_encoding = DRM_COLOR_YCBCR_BT709;
> +	plane->state->color_range = DRM_COLOR_YCBCR_LIMITED_RANGE;
> +}
> +
> +static struct drm_plane_state *
> +dpu_drm_atomic_plane_duplicate_state(struct drm_plane *plane)
> +{
> +	struct dpu_plane_state *state, *copy;
> +
> +	if (WARN_ON(!plane->state))
> +		return NULL;
> +
> +	copy = kmalloc(sizeof(*state), GFP_KERNEL);
> +	if (!copy)
> +		return NULL;
> +
> +	__drm_atomic_helper_plane_duplicate_state(plane, &copy->base);
> +	state = to_dpu_plane_state(plane->state);
> +	copy->stage = state->stage;
> +	copy->source = state->source;
> +	copy->blend = state->blend;
> +	copy->is_top = state->is_top;
> +
> +	return &copy->base;
> +}
> +
> +static void dpu_drm_atomic_plane_destroy_state(struct drm_plane *plane,
> +					       struct drm_plane_state *state)
> +{
> +	__drm_atomic_helper_plane_destroy_state(state);
> +	kfree(to_dpu_plane_state(state));
> +}
> +
> +static bool dpu_drm_plane_format_mod_supported(struct drm_plane *plane,
> +					       uint32_t format,
> +					       uint64_t modifier)
> +{
> +	switch (format) {
> +	case DRM_FORMAT_YUYV:
> +	case DRM_FORMAT_UYVY:
> +	case DRM_FORMAT_NV12:
> +	case DRM_FORMAT_NV21:
> +		return modifier == DRM_FORMAT_MOD_LINEAR;
> +	case DRM_FORMAT_ARGB8888:
> +	case DRM_FORMAT_XRGB8888:
> +	case DRM_FORMAT_ABGR8888:
> +	case DRM_FORMAT_XBGR8888:
> +	case DRM_FORMAT_RGBA8888:
> +	case DRM_FORMAT_RGBX8888:
> +	case DRM_FORMAT_BGRA8888:
> +	case DRM_FORMAT_BGRX8888:
> +	case DRM_FORMAT_RGB565:
> +		return modifier == DRM_FORMAT_MOD_LINEAR ||
> +		       modifier == DRM_FORMAT_MOD_VIVANTE_TILED ||
> +		       modifier == DRM_FORMAT_MOD_VIVANTE_SUPER_TILED;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static const struct drm_plane_funcs dpu_plane_funcs = {
> +	.update_plane		= drm_atomic_helper_update_plane,
> +	.disable_plane		= drm_atomic_helper_disable_plane,
> +	.destroy		= dpu_plane_destroy,
> +	.reset			= dpu_plane_reset,
> +	.atomic_duplicate_state	= dpu_drm_atomic_plane_duplicate_state,
> +	.atomic_destroy_state	= dpu_drm_atomic_plane_destroy_state,
> +	.format_mod_supported	= dpu_drm_plane_format_mod_supported,
> +};
> +
> +static inline dma_addr_t
> +drm_plane_state_to_baseaddr(struct drm_plane_state *state)
> +{
> +	struct drm_framebuffer *fb = state->fb;
> +	struct drm_gem_cma_object *cma_obj;
> +	unsigned int x = state->src.x1 >> 16;
> +	unsigned int y = state->src.y1 >> 16;
> +
> +	cma_obj = drm_fb_cma_get_gem_obj(fb, 0);
> +
> +	if (fb->flags & DRM_MODE_FB_INTERLACED)
> +		y /= 2;
> +
> +	return cma_obj->paddr + fb->offsets[0] + fb->pitches[0] * y +
> +	       fb->format->cpp[0] * x;
> +}
> +
> +static inline dma_addr_t
> +drm_plane_state_to_uvbaseaddr(struct drm_plane_state *state)
> +{
> +	struct drm_framebuffer *fb = state->fb;
> +	struct drm_gem_cma_object *cma_obj;
> +	int x = state->src.x1 >> 16;
> +	int y = state->src.y1 >> 16;
> +
> +	cma_obj = drm_fb_cma_get_gem_obj(fb, 1);
> +
> +	x /= fb->format->hsub;
> +	y /= fb->format->vsub;
> +
> +	if (fb->flags & DRM_MODE_FB_INTERLACED)
> +		y /= 2;
> +
> +	return cma_obj->paddr + fb->offsets[1] + fb->pitches[1] * y +
> +	       fb->format->cpp[1] * x;
> +}
> +
> +static int dpu_plane_check_no_off_screen(struct drm_plane_state *state,
> +					 struct drm_crtc_state *crtc_state)
> +{
> +	if (state->dst.x1 < 0 || state->dst.y1 < 0 ||
> +	    (state->dst.x2 > crtc_state->adjusted_mode.hdisplay) ||
> +	    (state->dst.y2 > crtc_state->adjusted_mode.vdisplay)) {
> +		dpu_plane_dbg(state->plane, "no off screen\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int dpu_plane_check_max_source_resolution(struct drm_plane_state *state)
> +{
> +	u32 src_w = drm_rect_width(&state->src) >> 16;
> +	u32 src_h = drm_rect_height(&state->src) >> 16;
> +	u32 dst_w = drm_rect_width(&state->dst);
> +	u32 dst_h = drm_rect_height(&state->dst);
> +
> +	if (src_w == dst_w || src_h == dst_h) {
> +		/* without scaling */
> +		if (src_w > DPU_PLANE_MAX_PIX_CNT ||
> +		    src_h > DPU_PLANE_MAX_PIX_CNT) {
> +			dpu_plane_dbg(state->plane,
> +				      "invalid source resolution\n");
> +			return -EINVAL;
> +		}
> +	} else {
> +		/* with scaling */
> +		if (src_w > DPU_PLANE_MAX_PIX_CNT_WITH_SCALER ||
> +		    src_h > DPU_PLANE_MAX_PIX_CNT_WITH_SCALER) {
> +			dpu_plane_dbg(state->plane,
> +				      "invalid source resolution with scale\n");
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int dpu_plane_check_source_alignment(struct drm_plane_state *state)
> +{
> +	struct drm_framebuffer *fb = state->fb;
> +	bool fb_is_interlaced = !!(fb->flags & DRM_MODE_FB_INTERLACED);
> +	u32 src_w = drm_rect_width(&state->src) >> 16;
> +	u32 src_h = drm_rect_height(&state->src) >> 16;
> +	u32 src_x = state->src.x1 >> 16;
> +	u32 src_y = state->src.y1 >> 16;
> +
> +	if (fb->format->hsub == 2) {
> +		if (src_w % 2) {
> +			dpu_plane_dbg(state->plane, "bad uv width\n");
> +			return -EINVAL;
> +		}
> +		if (src_x % 2) {
> +			dpu_plane_dbg(state->plane, "bad uv xoffset\n");
> +			return -EINVAL;
> +		}
> +	}
> +	if (fb->format->vsub == 2) {
> +		if (src_h % (fb_is_interlaced ? 4 : 2)) {
> +			dpu_plane_dbg(state->plane, "bad uv height\n");
> +			return -EINVAL;
> +		}
> +		if (src_y % (fb_is_interlaced ? 4 : 2)) {
> +			dpu_plane_dbg(state->plane, "bad uv yoffset\n");
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int dpu_plane_check_fb_modifier(struct drm_plane_state *state)
> +{
> +	struct drm_plane *plane = state->plane;
> +	struct drm_framebuffer *fb = state->fb;
> +
> +	if ((fb->flags & DRM_MODE_FB_MODIFIERS) &&
> +	    !plane->funcs->format_mod_supported(plane, fb->format->format,
> +						fb->modifier)) {
> +		dpu_plane_dbg(plane, "invalid modifier 0x%016llx",
> +								fb->modifier);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +/* for tile formats, framebuffer has to be tile aligned */
> +static int dpu_plane_check_tiled_fb_alignment(struct drm_plane_state *state)
> +{
> +	struct drm_plane *plane = state->plane;
> +	struct drm_framebuffer *fb = state->fb;
> +
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
> +	return 0;
> +}
> +
> +static int dpu_plane_check_no_bt709_full_range(struct drm_plane_state *state)
> +{
> +	if (state->fb->format->is_yuv &&
> +	    state->color_encoding == DRM_COLOR_YCBCR_BT709 &&
> +	    state->color_range == DRM_COLOR_YCBCR_FULL_RANGE) {
> +		dpu_plane_dbg(state->plane, "no BT709 full range support\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int dpu_plane_check_fb_plane_1(struct drm_plane_state *state)
> +{
> +	struct drm_plane *plane = state->plane;
> +	struct drm_framebuffer *fb = state->fb;
> +	dma_addr_t baseaddr = drm_plane_state_to_baseaddr(state);
> +	int bpp;
> +
> +	/* base address alignment */
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
> +	/* pitches[0] range */
> +	if (fb->pitches[0] > DPU_PLANE_MAX_PITCH) {
> +		dpu_plane_dbg(plane, "fb pitches[0] is out of range\n");
> +		return -EINVAL;
> +	}
> +
> +	/* pitches[0] alignment */
> +	if (((bpp == 32) && (fb->pitches[0] & 0x3)) ||
> +	    ((bpp == 16) && (fb->pitches[0] & 0x1))) {
> +		dpu_plane_dbg(plane, "%dbpp fb bad pitches[0] alignment\n", bpp);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +/* UV planar check, assuming 16bpp */
> +static int dpu_plane_check_fb_plane_2(struct drm_plane_state *state)
> +{
> +	struct drm_plane *plane = state->plane;
> +	struct drm_framebuffer *fb = state->fb;
> +	dma_addr_t uv_baseaddr = drm_plane_state_to_uvbaseaddr(state);
> +
> +	/* base address alignment */
> +	if (uv_baseaddr & 0x7) {
> +		dpu_plane_dbg(plane, "bad uv baddr alignment\n");
> +		return -EINVAL;
> +	}
> +
> +	/* pitches[1] range */
> +	if (fb->pitches[1] > DPU_PLANE_MAX_PITCH) {
> +		dpu_plane_dbg(plane, "fb pitches[1] is out of range\n");
> +		return -EINVAL;
> +	}
> +
> +	/* pitches[1] alignment */
> +	if (fb->pitches[1] & 0x1) {
> +		dpu_plane_dbg(plane, "fb bad pitches[1] alignment\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int dpu_plane_check_dprc(struct drm_plane_state *state)
> +{
> +	struct dpu_plane_state *dpstate = to_dpu_plane_state(state);
> +	struct drm_framebuffer *fb = state->fb;
> +	const struct dpu_fetchunit_ops *fu_ops;
> +	struct dpu_dprc *dprc;
> +	dma_addr_t baseaddr, uv_baseaddr = 0;
> +	u32 src_w = drm_rect_width(&state->src) >> 16;
> +	u32 src_x = state->src.x1 >> 16;
> +
> +	fu_ops = dpu_fu_get_ops(dpstate->source);
> +	dprc = fu_ops->get_dprc(dpstate->source);
> +
> +	if (!dpu_dprc_rtram_width_supported(dprc, src_w)) {
> +		dpu_plane_dbg(state->plane, "bad RTRAM width for DPRC\n");
> +		return -EINVAL;
> +	}
> +
> +	baseaddr = drm_plane_state_to_baseaddr(state);
> +	if (fb->format->num_planes > 1)
> +		uv_baseaddr = drm_plane_state_to_uvbaseaddr(state);
> +
> +	if (!dpu_dprc_stride_supported(dprc, fb->pitches[0], fb->pitches[1],
> +				       src_w, src_x, fb->format, fb->modifier,
> +				       baseaddr, uv_baseaddr)) {
> +		dpu_plane_dbg(state->plane, "bad fb pitches for DPRC\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int dpu_plane_atomic_check(struct drm_plane *plane,
> +				  struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *new_plane_state =
> +				drm_atomic_get_new_plane_state(state, plane);
> +	struct dpu_plane_state *new_dpstate =
> +				to_dpu_plane_state(new_plane_state);
> +	struct drm_framebuffer *fb = new_plane_state->fb;
> +	struct drm_crtc_state *crtc_state;
> +	int min_scale, ret;
> +
> +	/* ok to disable */
> +	if (!fb) {
> +		new_dpstate->source = NULL;
> +		new_dpstate->stage.ptr = NULL;
> +		new_dpstate->blend = NULL;
> +		return 0;
> +	}
> +
> +	if (!new_plane_state->crtc) {
> +		dpu_plane_dbg(plane, "no CRTC in plane state\n");
> +		return -EINVAL;
> +	}
> +
> +	crtc_state =
> +		drm_atomic_get_existing_crtc_state(state, new_plane_state->crtc);
> +	if (WARN_ON(!crtc_state))
> +		return -EINVAL;
> +
> +	min_scale = FRAC_16_16(1, DPU_PLANE_MAX_PIX_CNT_WITH_SCALER);
> +	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
> +						  min_scale,
> +						  DRM_PLANE_HELPER_NO_SCALING,
> +						  true, false);
> +	if (ret) {
> +		dpu_plane_dbg(plane, "failed to check plane state: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = dpu_plane_check_no_off_screen(new_plane_state, crtc_state);
> +	if (ret)
> +		return ret;
> +
> +	ret = dpu_plane_check_max_source_resolution(new_plane_state);
> +	if (ret)
> +		return ret;
> +
> +	ret = dpu_plane_check_source_alignment(new_plane_state);
> +	if (ret)
> +		return ret;
> +
> +	ret = dpu_plane_check_fb_modifier(new_plane_state);
> +	if (ret)
> +		return ret;
> +
> +	ret = dpu_plane_check_tiled_fb_alignment(new_plane_state);
> +	if (ret)
> +		return ret;
> +
> +	ret = dpu_plane_check_no_bt709_full_range(new_plane_state);
> +	if (ret)
> +		return ret;
> +
> +	ret = dpu_plane_check_fb_plane_1(new_plane_state);
> +	if (ret)
> +		return ret;
> +
> +	if (fb->format->num_planes > 1) {
> +		ret = dpu_plane_check_fb_plane_2(new_plane_state);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return dpu_plane_check_dprc(new_plane_state);
> +}
> +
> +static void dpu_plane_atomic_update(struct drm_plane *plane,
> +				    struct drm_atomic_state *state)
> +{
> +	struct dpu_plane *dplane = to_dpu_plane(plane);
> +	struct drm_plane_state *new_state = plane->state;

I think you want to use the drm_atomic_get_new_plane_state() helper here as
well. See:

37418bf14c13 ("drm: Use state helper instead of the plane state pointer")

Thanks,
laurentiu

> +	struct dpu_plane_state *new_dpstate = to_dpu_plane_state(new_state);
> +	struct dpu_plane_grp *grp = dplane->grp;
> +	struct dpu_crtc *dpu_crtc;
> +	struct drm_framebuffer *fb = new_state->fb;
> +	struct dpu_fetchunit *fu = new_dpstate->source;
> +	struct dpu_layerblend *lb = new_dpstate->blend;
> +	struct dpu_dprc *dprc;
> +	const struct dpu_fetchunit_ops *fu_ops;
> +	dma_addr_t baseaddr, uv_baseaddr;
> +	enum dpu_link_id fu_link;
> +	enum dpu_link_id lb_src_link, stage_link;
> +	enum dpu_link_id vs_link;
> +	unsigned int src_w, src_h, src_x, src_y, dst_w, dst_h;
> +	unsigned int mt_w = 0, mt_h = 0;	/* micro-tile width/height */
> +	int bpp;
> +	bool prefetch_start = false;
> +	bool need_fetcheco = false, need_hscaler = false, need_vscaler = false;
> +	bool need_modeset;
> +	bool fb_is_interlaced;
> +
> +	/*
> +	 * Do nothing since the plane is disabled by
> +	 * crtc_func->atomic_begin/flush.
> +	 */
> +	if (!fb)
> +		return;
> +
> +	/* Do nothing if CRTC is inactive. */
> +	if (!new_state->crtc->state->active)
> +		return;
> +
> +	need_modeset = drm_atomic_crtc_needs_modeset(new_state->crtc->state);
> +
> +	fb_is_interlaced = !!(fb->flags & DRM_MODE_FB_INTERLACED);
> +
> +	src_w = drm_rect_width(&new_state->src) >> 16;
> +	src_h = drm_rect_height(&new_state->src) >> 16;
> +	src_x = new_state->src.x1 >> 16;
> +	src_y = new_state->src.y1 >> 16;
> +	dst_w = drm_rect_width(&new_state->dst);
> +	dst_h = drm_rect_height(&new_state->dst);
> +
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
> +
> +	switch (fb->modifier) {
> +	case DRM_FORMAT_MOD_VIVANTE_TILED:
> +	case DRM_FORMAT_MOD_VIVANTE_SUPER_TILED:
> +		mt_w = (bpp == 16) ? 8 : 4;
> +		mt_h = 4;
> +		break;
> +	}
> +
> +	if (fb->format->num_planes > 1)
> +		need_fetcheco = true;
> +
> +	if (src_w != dst_w)
> +		need_hscaler = true;
> +
> +	if ((src_h != dst_h) || fb_is_interlaced)
> +		need_vscaler = true;
> +
> +	baseaddr = drm_plane_state_to_baseaddr(new_state);
> +	if (need_fetcheco)
> +		uv_baseaddr = drm_plane_state_to_uvbaseaddr(new_state);
> +
> +	dpu_crtc = to_dpu_crtc(new_state->crtc);
> +
> +	fu_ops = dpu_fu_get_ops(fu);
> +
> +	if (!fu_ops->has_stream_id(fu) || need_modeset)
> +		prefetch_start = true;
> +
> +	fu_ops->set_layerblend(fu, lb);
> +
> +	fu_ops->set_burstlength(fu, src_x, mt_w, bpp, baseaddr);
> +	fu_ops->set_src_stride(fu, src_w, src_w, mt_w, bpp, fb->pitches[0],
> +			       baseaddr);
> +	fu_ops->set_src_buf_dimensions(fu, src_w, src_h, fb->format,
> +				       fb_is_interlaced);
> +	fu_ops->set_fmt(fu, fb->format, new_state->color_encoding,
> +			new_state->color_range, fb_is_interlaced);
> +	fu_ops->set_pixel_blend_mode(fu, new_state->pixel_blend_mode,
> +				     new_state->alpha, fb->format->has_alpha);
> +	fu_ops->enable_src_buf(fu);
> +	fu_ops->set_framedimensions(fu, src_w, src_h, fb_is_interlaced);
> +	fu_ops->set_baseaddress(fu, src_w, src_x, src_y, mt_w, mt_h, bpp,
> +				baseaddr);
> +	fu_ops->set_stream_id(fu, dpu_crtc->stream_id);
> +
> +	fu_link = fu_ops->get_link_id(fu);
> +	lb_src_link = fu_link;
> +
> +	dpu_plane_dbg(plane, "uses %s\n", fu_ops->get_name(fu));
> +
> +	if (need_fetcheco) {
> +		struct dpu_fetchunit *fe = fu_ops->get_fetcheco(fu);
> +		const struct dpu_fetchunit_ops *fe_ops;
> +
> +		fe_ops = dpu_fu_get_ops(fe);
> +
> +		fu_ops->set_pec_dynamic_src_sel(fu, fe_ops->get_link_id(fe));
> +
> +		fe_ops->set_burstlength(fe, src_x, mt_w, bpp, uv_baseaddr);
> +		fe_ops->set_src_stride(fe, src_w, src_x, mt_w, bpp,
> +				       fb->pitches[1], uv_baseaddr);
> +		fe_ops->set_fmt(fe, fb->format, new_state->color_encoding,
> +				new_state->color_range, fb_is_interlaced);
> +		fe_ops->set_src_buf_dimensions(fe, src_w, src_h,
> +					       fb->format, fb_is_interlaced);
> +		fe_ops->set_framedimensions(fe, src_w, src_h, fb_is_interlaced);
> +		fe_ops->set_baseaddress(fe, src_w, src_x, src_y / 2,
> +					mt_w, mt_h, bpp, uv_baseaddr);
> +		fe_ops->enable_src_buf(fe);
> +
> +		dpu_plane_dbg(plane, "uses %s\n", fe_ops->get_name(fe));
> +	} else {
> +		if (fu_ops->set_pec_dynamic_src_sel)
> +			fu_ops->set_pec_dynamic_src_sel(fu, LINK_ID_NONE);
> +	}
> +
> +	/* VScaler comes first */
> +	if (need_vscaler) {
> +		struct dpu_vscaler *vs = fu_ops->get_vscaler(fu);
> +
> +		dpu_vs_pec_dynamic_src_sel(vs, fu_link);
> +		dpu_vs_pec_clken(vs, CLKEN_AUTOMATIC);
> +		dpu_vs_setup1(vs, src_h, new_state->crtc_h, fb_is_interlaced);
> +		dpu_vs_setup2(vs, fb_is_interlaced);
> +		dpu_vs_setup3(vs, fb_is_interlaced);
> +		dpu_vs_output_size(vs, dst_h);
> +		dpu_vs_field_mode(vs, fb_is_interlaced ?
> +						SCALER_ALWAYS0 : SCALER_INPUT);
> +		dpu_vs_filter_mode(vs, SCALER_LINEAR);
> +		dpu_vs_scale_mode(vs, SCALER_UPSCALE);
> +		dpu_vs_mode(vs, SCALER_ACTIVE);
> +
> +		vs_link = dpu_vs_get_link_id(vs);
> +		lb_src_link = vs_link;
> +
> +		dpu_plane_dbg(plane, "uses VScaler%u\n", dpu_vs_get_id(vs));
> +	}
> +
> +	/* and then, HScaler */
> +	if (need_hscaler) {
> +		struct dpu_hscaler *hs = fu_ops->get_hscaler(fu);
> +
> +		dpu_hs_pec_dynamic_src_sel(hs, need_vscaler ? vs_link : fu_link);
> +		dpu_hs_pec_clken(hs, CLKEN_AUTOMATIC);
> +		dpu_hs_setup1(hs, src_w, dst_w);
> +		dpu_hs_output_size(hs, dst_w);
> +		dpu_hs_filter_mode(hs, SCALER_LINEAR);
> +		dpu_hs_scale_mode(hs, SCALER_UPSCALE);
> +		dpu_hs_mode(hs, SCALER_ACTIVE);
> +
> +		lb_src_link = dpu_hs_get_link_id(hs);
> +
> +		dpu_plane_dbg(plane, "uses HScaler%u\n", dpu_hs_get_id(hs));
> +	}
> +
> +	dprc = fu_ops->get_dprc(fu);
> +
> +	dpu_dprc_configure(dprc, dpu_crtc->stream_id,
> +			   src_w, src_h, src_x, src_y,
> +			   fb->pitches[0], fb->format, fb->modifier,
> +			   baseaddr, uv_baseaddr,
> +			   prefetch_start, fb_is_interlaced);
> +
> +	if (new_state->normalized_zpos == 0)
> +		stage_link = dpu_cf_get_link_id(new_dpstate->stage.cf);
> +	else
> +		stage_link = dpu_lb_get_link_id(new_dpstate->stage.lb);
> +
> +	dpu_lb_pec_dynamic_prim_sel(lb, stage_link);
> +	dpu_lb_pec_dynamic_sec_sel(lb, lb_src_link);
> +	dpu_lb_mode(lb, LB_BLEND);
> +	dpu_lb_blendcontrol(lb, new_state->normalized_zpos,
> +			    new_state->pixel_blend_mode, new_state->alpha);
> +	dpu_lb_pec_clken(lb, CLKEN_AUTOMATIC);
> +	dpu_lb_position(lb, new_state->dst.x1, new_state->dst.y1);
> +
> +	dpu_plane_dbg(plane, "uses LayerBlend%u\n", dpu_lb_get_id(lb));
> +
> +	if (new_dpstate->is_top)
> +		dpu_ed_pec_src_sel(grp->ed[dpu_crtc->stream_id],
> +				   dpu_lb_get_link_id(lb));
> +}
> +
> +static const struct drm_plane_helper_funcs dpu_plane_helper_funcs = {
> +	.prepare_fb	= drm_gem_plane_helper_prepare_fb,
> +	.atomic_check	= dpu_plane_atomic_check,
> +	.atomic_update	= dpu_plane_atomic_update,
> +};
> +
> +struct dpu_plane *dpu_plane_initialize(struct drm_device *drm,
> +				       unsigned int possible_crtcs,
> +				       struct dpu_plane_grp *grp,
> +				       enum drm_plane_type type)
> +{
> +	struct dpu_plane *dpu_plane;
> +	struct drm_plane *plane;
> +	unsigned int zpos = dpu_plane_get_default_zpos(type);
> +	int ret;
> +
> +	dpu_plane = kzalloc(sizeof(*dpu_plane), GFP_KERNEL);
> +	if (!dpu_plane)
> +		return ERR_PTR(-ENOMEM);
> +
> +	dpu_plane->grp = grp;
> +
> +	plane = &dpu_plane->base;
> +
> +	ret = drm_universal_plane_init(drm, plane, possible_crtcs,
> +				       &dpu_plane_funcs,
> +				       dpu_plane_formats,
> +				       ARRAY_SIZE(dpu_plane_formats),
> +				       dpu_plane_format_modifiers, type, NULL);
> +	if (ret) {
> +		/*
> +		 * The plane is not added to the global plane list, so
> +		 * free it manually.
> +		 */
> +		kfree(dpu_plane);
> +		return ERR_PTR(ret);
> +	}
> +
> +	drm_plane_helper_add(plane, &dpu_plane_helper_funcs);
> +
> +	ret = drm_plane_create_zpos_property(plane,
> +					     zpos, 0, grp->hw_plane_cnt - 1);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	ret = drm_plane_create_alpha_property(plane);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	ret = drm_plane_create_blend_mode_property(plane,
> +					BIT(DRM_MODE_BLEND_PIXEL_NONE) |
> +					BIT(DRM_MODE_BLEND_PREMULTI) |
> +					BIT(DRM_MODE_BLEND_COVERAGE));
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	ret = drm_plane_create_color_properties(plane,
> +					BIT(DRM_COLOR_YCBCR_BT601) |
> +					BIT(DRM_COLOR_YCBCR_BT709),
> +					BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
> +					BIT(DRM_COLOR_YCBCR_FULL_RANGE),
> +					DRM_COLOR_YCBCR_BT709,
> +					DRM_COLOR_YCBCR_LIMITED_RANGE);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return dpu_plane;
> +}
> diff --git a/drivers/gpu/drm/imx/dpu/dpu-plane.h b/drivers/gpu/drm/imx/dpu/dpu-plane.h
> new file mode 100644
> index 00000000..7bdd867
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dpu/dpu-plane.h
> @@ -0,0 +1,56 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +
> +/*
> + * Copyright 2017-2020 NXP
> + */
> +
> +#ifndef __DPU_PLANE_H__
> +#define __DPU_PLANE_H__
> +
> +#include <linux/kernel.h>
> +
> +#include <drm/drm_device.h>
> +#include <drm/drm_plane.h>
> +#include <drm/drm_print.h>
> +
> +#include "dpu.h"
> +
> +#define dpu_plane_dbg(plane, fmt, ...)					\
> +	drm_dbg_kms((plane)->dev, "[PLANE:%d:%s] " fmt,			\
> +		    (plane)->base.id, (plane)->name, ##__VA_ARGS__)
> +
> +struct dpu_plane {
> +	struct drm_plane	base;
> +	struct dpu_plane_grp	*grp;
> +};
> +
> +union dpu_plane_stage {
> +	struct dpu_constframe	*cf;
> +	struct dpu_layerblend	*lb;
> +	void			*ptr;
> +};
> +
> +struct dpu_plane_state {
> +	struct drm_plane_state	base;
> +	union dpu_plane_stage	stage;
> +	struct dpu_fetchunit	*source;
> +	struct dpu_layerblend	*blend;
> +	bool			is_top;
> +};
> +
> +static inline struct dpu_plane *to_dpu_plane(struct drm_plane *plane)
> +{
> +	return container_of(plane, struct dpu_plane, base);
> +}
> +
> +static inline struct dpu_plane_state *
> +to_dpu_plane_state(struct drm_plane_state *plane_state)
> +{
> +	return container_of(plane_state, struct dpu_plane_state, base);
> +}
> +
> +struct dpu_plane *dpu_plane_initialize(struct drm_device *drm,
> +				       unsigned int possible_crtcs,
> +				       struct dpu_plane_grp *grp,
> +				       enum drm_plane_type type);
> +#endif /* __DPU_PLANE_H__ */
> diff --git a/drivers/gpu/drm/imx/dpu/dpu-prg.c b/drivers/gpu/drm/imx/dpu/dpu-prg.c
> new file mode 100644
> index 00000000..33a1a3e
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dpu/dpu-prg.c
> @@ -0,0 +1,433 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +/*
> + * Copyright 2017-2020 NXP
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +
> +#include "dpu-prg.h"
> +
> +#define SET			0x4
> +#define CLR			0x8
> +#define TOG			0xc
> +
> +#define PRG_CTRL		0x00
> +#define  BYPASS			BIT(0)
> +#define  SC_DATA_TYPE_8BIT	0
> +#define  SC_DATA_TYPE_10BIT	BIT(2)
> +#define  UV_EN			BIT(3)
> +#define  HANDSHAKE_MODE_4LINES	0
> +#define  HANDSHAKE_MODE_8LINES	BIT(4)
> +#define  SHADOW_LOAD_MODE	BIT(5)
> +#define  DES_DATA_TYPE_32BPP	(0 << 16)
> +#define  DES_DATA_TYPE_24BPP	(1 << 16)
> +#define  DES_DATA_TYPE_16BPP	(2 << 16)
> +#define  DES_DATA_TYPE_8BPP	(3 << 16)
> +#define  SOFTRST		BIT(30)
> +#define  SHADOW_EN		BIT(31)
> +
> +#define PRG_STATUS		0x10
> +#define  BUFFER_VALID_B		BIT(1)
> +#define  BUFFER_VALID_A		BIT(0)
> +
> +#define PRG_REG_UPDATE		0x20
> +#define  REG_UPDATE		BIT(0)
> +
> +#define PRG_STRIDE		0x30
> +#define  STRIDE(n)		(((n) - 1) & 0xffff)
> +
> +#define PRG_HEIGHT		0x40
> +#define  HEIGHT(n)		(((n) - 1) & 0xffff)
> +
> +#define PRG_BADDR		0x50
> +
> +#define PRG_OFFSET		0x60
> +#define  Y(n)			(((n) & 0x7) << 16)
> +#define  X(n)			((n) & 0xffff)
> +
> +#define PRG_WIDTH		0x70
> +#define  WIDTH(n)		(((n) - 1) & 0xffff)
> +
> +#define DPU_PRG_MAX_STRIDE	0x10000
> +
> +struct dpu_prg {
> +	struct device *dev;
> +	void __iomem *base;
> +	struct list_head list;
> +	struct clk *clk_apb;
> +	struct clk *clk_rtram;
> +	bool is_auxiliary;
> +};
> +
> +static DEFINE_MUTEX(dpu_prg_list_mutex);
> +static LIST_HEAD(dpu_prg_list);
> +
> +static inline u32 dpu_prg_read(struct dpu_prg *prg, unsigned int offset)
> +{
> +	return readl(prg->base + offset);
> +}
> +
> +static inline void
> +dpu_prg_write(struct dpu_prg *prg, unsigned int offset, u32 value)
> +{
> +	writel(value, prg->base + offset);
> +}
> +
> +static void dpu_prg_reset(struct dpu_prg *prg)
> +{
> +	usleep_range(10, 20);
> +	dpu_prg_write(prg, PRG_CTRL + SET, SOFTRST);
> +	usleep_range(10, 20);
> +	dpu_prg_write(prg, PRG_CTRL + CLR, SOFTRST);
> +}
> +
> +void dpu_prg_enable(struct dpu_prg *prg)
> +{
> +	dpu_prg_write(prg, PRG_CTRL + CLR, BYPASS);
> +}
> +
> +void dpu_prg_disable(struct dpu_prg *prg)
> +{
> +	dpu_prg_write(prg, PRG_CTRL, BYPASS);
> +}
> +
> +static int dpu_prg_mod_to_mt_w(struct dpu_prg *prg, u64 modifier,
> +			       unsigned int bits_per_pixel, unsigned int *mt_w)
> +{
> +	switch (modifier) {
> +	case DRM_FORMAT_MOD_NONE:
> +		*mt_w = 0;
> +		break;
> +	case DRM_FORMAT_MOD_VIVANTE_TILED:
> +	case DRM_FORMAT_MOD_VIVANTE_SUPER_TILED:
> +		*mt_w = (bits_per_pixel == 16) ? 8 : 4;
> +		break;
> +	default:
> +		dev_err(prg->dev, "unsupported modifier 0x%016llx\n", modifier);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int dpu_prg_mod_to_mt_h(struct dpu_prg *prg, u64 modifier,
> +			       unsigned int *mt_h)
> +{
> +	switch (modifier) {
> +	case DRM_FORMAT_MOD_NONE:
> +		*mt_h = 0;
> +		break;
> +	case DRM_FORMAT_MOD_VIVANTE_TILED:
> +	case DRM_FORMAT_MOD_VIVANTE_SUPER_TILED:
> +		*mt_h = 4;
> +		break;
> +	default:
> +		dev_err(prg->dev, "unsupported modifier 0x%016llx\n", modifier);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +/* address TKT343664: base address has to align to burst size */
> +static unsigned int dpu_prg_burst_size_fixup(dma_addr_t baddr)
> +{
> +	unsigned int burst_size;
> +
> +	burst_size = 1 << __ffs(baddr);
> +	burst_size = round_up(burst_size, 8);
> +	burst_size = min(burst_size, 128U);
> +
> +	return burst_size;
> +}
> +
> +/* address TKT339017: mismatch between burst size and stride */
> +static unsigned int dpu_prg_stride_fixup(unsigned int stride,
> +					 unsigned int burst_size,
> +					 dma_addr_t baddr, u64 modifier)
> +{
> +	if (modifier)
> +		stride = round_up(stride + round_up(baddr % 8, 8), burst_size);
> +	else
> +		stride = round_up(stride, burst_size);
> +
> +	return stride;
> +}
> +
> +void dpu_prg_configure(struct dpu_prg *prg,
> +		       unsigned int width, unsigned int height,
> +		       unsigned int x_offset, unsigned int y_offset,
> +		       unsigned int stride, unsigned int bits_per_pixel,
> +		       dma_addr_t baddr,
> +		       const struct drm_format_info *format, u64 modifier,
> +		       bool start)
> +{
> +	unsigned int mt_w, mt_h;	/* micro-tile width/height */
> +	unsigned int burst_size;
> +	dma_addr_t _baddr;
> +	u32 val;
> +	int ret;
> +
> +	ret = dpu_prg_mod_to_mt_w(prg, modifier, bits_per_pixel, &mt_w);
> +	ret |= dpu_prg_mod_to_mt_h(prg, modifier, &mt_h);
> +	if (ret)
> +		return;
> +
> +	if (modifier) {
> +		x_offset %= mt_w;
> +		y_offset %= mt_h;
> +
> +		/* consider x offset to calculate stride */
> +		_baddr = baddr + (x_offset * (bits_per_pixel / 8));
> +	} else {
> +		x_offset = 0;
> +		y_offset = 0;
> +		_baddr = baddr;
> +	}
> +
> +	burst_size = dpu_prg_burst_size_fixup(_baddr);
> +
> +	stride = dpu_prg_stride_fixup(stride, burst_size, _baddr, modifier);
> +
> +	/*
> +	 * address TKT342628(part 1):
> +	 * when prg stride is less or equals to burst size,
> +	 * the auxiliary prg height needs to be a half
> +	 */
> +	if (prg->is_auxiliary && stride <= burst_size) {
> +		height /= 2;
> +		if (modifier)
> +			y_offset /= 2;
> +	}
> +
> +	dpu_prg_write(prg, PRG_STRIDE, STRIDE(stride));
> +	dpu_prg_write(prg, PRG_WIDTH, WIDTH(width));
> +	dpu_prg_write(prg, PRG_HEIGHT, HEIGHT(height));
> +	dpu_prg_write(prg, PRG_OFFSET, X(x_offset) | Y(y_offset));
> +	dpu_prg_write(prg, PRG_BADDR, baddr);
> +
> +	val = SHADOW_LOAD_MODE | SC_DATA_TYPE_8BIT | BYPASS;
> +	if (format->format == DRM_FORMAT_NV21 ||
> +	    format->format == DRM_FORMAT_NV12) {
> +		val |= HANDSHAKE_MODE_8LINES;
> +		/*
> +		 * address TKT342628(part 2):
> +		 * when prg stride is less or equals to burst size,
> +		 * we disable UV_EN bit for the auxiliary prg
> +		 */
> +		if (prg->is_auxiliary && stride > burst_size)
> +			val |= UV_EN;
> +	} else {
> +		val |= HANDSHAKE_MODE_4LINES;
> +	}
> +	switch (bits_per_pixel) {
> +	case 32:
> +		val |= DES_DATA_TYPE_32BPP;
> +		break;
> +	case 24:
> +		val |= DES_DATA_TYPE_24BPP;
> +		break;
> +	case 16:
> +		val |= DES_DATA_TYPE_16BPP;
> +		break;
> +	case 8:
> +		val |= DES_DATA_TYPE_8BPP;
> +		break;
> +	}
> +	/* no shadow for the first frame */
> +	if (!start)
> +		val |= SHADOW_EN;
> +	dpu_prg_write(prg, PRG_CTRL, val);
> +}
> +
> +void dpu_prg_reg_update(struct dpu_prg *prg)
> +{
> +	dpu_prg_write(prg, PRG_REG_UPDATE, REG_UPDATE);
> +}
> +
> +void dpu_prg_shadow_enable(struct dpu_prg *prg)
> +{
> +	dpu_prg_write(prg, PRG_CTRL + SET, SHADOW_EN);
> +}
> +
> +bool dpu_prg_stride_supported(struct dpu_prg *prg,
> +			      unsigned int x_offset,
> +			      unsigned int bits_per_pixel, u64 modifier,
> +			      unsigned int stride, dma_addr_t baddr)
> +{
> +	unsigned int mt_w;	/* micro-tile width */
> +	unsigned int burst_size;
> +	int ret;
> +
> +	ret = dpu_prg_mod_to_mt_w(prg, modifier, bits_per_pixel, &mt_w);
> +	if (ret)
> +		return false;
> +
> +	if (modifier) {
> +		x_offset %= mt_w;
> +
> +		/* consider x offset to calculate stride */
> +		baddr += (x_offset * (bits_per_pixel / 8));
> +	}
> +
> +	burst_size = dpu_prg_burst_size_fixup(baddr);
> +
> +	stride = dpu_prg_stride_fixup(stride, burst_size, baddr, modifier);
> +
> +	if (stride > DPU_PRG_MAX_STRIDE)
> +		return false;
> +
> +	return true;
> +}
> +
> +void dpu_prg_set_auxiliary(struct dpu_prg *prg)
> +{
> +	prg->is_auxiliary = true;
> +}
> +
> +void dpu_prg_set_primary(struct dpu_prg *prg)
> +{
> +	prg->is_auxiliary = false;
> +}
> +
> +struct dpu_prg *
> +dpu_prg_lookup_by_phandle(struct device *dev, const char *name, int index)
> +{
> +	struct device_node *prg_node = of_parse_phandle(dev->of_node,
> +							name, index);
> +	struct dpu_prg *prg;
> +
> +	mutex_lock(&dpu_prg_list_mutex);
> +	list_for_each_entry(prg, &dpu_prg_list, list) {
> +		if (prg_node == prg->dev->of_node) {
> +			mutex_unlock(&dpu_prg_list_mutex);
> +			device_link_add(dev, prg->dev,
> +					DL_FLAG_PM_RUNTIME |
> +					DL_FLAG_AUTOREMOVE_CONSUMER);
> +			return prg;
> +		}
> +	}
> +	mutex_unlock(&dpu_prg_list_mutex);
> +
> +	return NULL;
> +}
> +
> +static const struct of_device_id dpu_prg_dt_ids[] = {
> +	{ .compatible = "fsl,imx8qm-prg", },
> +	{ .compatible = "fsl,imx8qxp-prg", },
> +	{ /* sentinel */ },
> +};
> +
> +static int dpu_prg_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	struct dpu_prg *prg;
> +	int ret;
> +
> +	prg = devm_kzalloc(dev, sizeof(*prg), GFP_KERNEL);
> +	if (!prg)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	prg->base = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(prg->base))
> +		return PTR_ERR(prg->base);
> +
> +	prg->clk_apb = devm_clk_get(dev, "apb");
> +	if (IS_ERR(prg->clk_apb)) {
> +		ret = PTR_ERR(prg->clk_apb);
> +		dev_err_probe(dev, ret, "failed to get apb clock\n");
> +		return ret;
> +	}
> +
> +	prg->clk_rtram = devm_clk_get(dev, "rtram");
> +	if (IS_ERR(prg->clk_rtram)) {
> +		ret = PTR_ERR(prg->clk_rtram);
> +		dev_err_probe(dev, ret, "failed to get rtram clock\n");
> +		return ret;
> +	}
> +
> +	prg->dev = dev;
> +	platform_set_drvdata(pdev, prg);
> +
> +	pm_runtime_enable(dev);
> +
> +	mutex_lock(&dpu_prg_list_mutex);
> +	list_add(&prg->list, &dpu_prg_list);
> +	mutex_unlock(&dpu_prg_list_mutex);
> +
> +	return 0;
> +}
> +
> +static int dpu_prg_remove(struct platform_device *pdev)
> +{
> +	struct dpu_prg *prg = platform_get_drvdata(pdev);
> +
> +	mutex_lock(&dpu_prg_list_mutex);
> +	list_del(&prg->list);
> +	mutex_unlock(&dpu_prg_list_mutex);
> +
> +	pm_runtime_disable(&pdev->dev);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused dpu_prg_runtime_suspend(struct device *dev)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct dpu_prg *prg = platform_get_drvdata(pdev);
> +
> +	clk_disable_unprepare(prg->clk_rtram);
> +	clk_disable_unprepare(prg->clk_apb);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused dpu_prg_runtime_resume(struct device *dev)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct dpu_prg *prg = platform_get_drvdata(pdev);
> +	int ret;
> +
> +	ret = clk_prepare_enable(prg->clk_apb);
> +	if (ret) {
> +		dev_err(dev, "failed to enable apb clock: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(prg->clk_rtram);
> +	if (ret) {
> +		dev_err(dev, "failed to enable rtramclock: %d\n", ret);
> +		return ret;
> +	}
> +
> +	dpu_prg_reset(prg);
> +
> +	return ret;
> +}
> +
> +static const struct dev_pm_ops dpu_prg_pm_ops = {
> +	SET_RUNTIME_PM_OPS(dpu_prg_runtime_suspend,
> +			   dpu_prg_runtime_resume, NULL)
> +};
> +
> +struct platform_driver dpu_prg_driver = {
> +	.probe = dpu_prg_probe,
> +	.remove = dpu_prg_remove,
> +	.driver = {
> +		.pm = &dpu_prg_pm_ops,
> +		.name = "dpu-prg",
> +		.of_match_table = dpu_prg_dt_ids,
> +	},
> +};
> diff --git a/drivers/gpu/drm/imx/dpu/dpu-prg.h b/drivers/gpu/drm/imx/dpu/dpu-prg.h
> new file mode 100644
> index 00000000..550e350
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dpu/dpu-prg.h
> @@ -0,0 +1,45 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +
> +/*
> + * Copyright 2017-2020 NXP
> + */
> +
> +#ifndef _DPU_PRG_H_
> +#define _DPU_PRG_H_
> +
> +#include <linux/device.h>
> +#include <linux/types.h>
> +
> +#include <drm/drm_fourcc.h>
> +
> +struct dpu_prg;
> +
> +void dpu_prg_enable(struct dpu_prg *prg);
> +
> +void dpu_prg_disable(struct dpu_prg *prg);
> +
> +void dpu_prg_configure(struct dpu_prg *prg,
> +		       unsigned int width, unsigned int height,
> +		       unsigned int x_offset, unsigned int y_offset,
> +		       unsigned int stride, unsigned int bits_per_pixel,
> +		       dma_addr_t baddr,
> +		       const struct drm_format_info *format, u64 modifier,
> +		       bool start);
> +
> +void dpu_prg_reg_update(struct dpu_prg *prg);
> +
> +void dpu_prg_shadow_enable(struct dpu_prg *prg);
> +
> +bool dpu_prg_stride_supported(struct dpu_prg *prg,
> +			      unsigned int x_offset,
> +			      unsigned int bits_per_pixel, u64 modifier,
> +			      unsigned int stride, dma_addr_t baddr);
> +
> +void dpu_prg_set_auxiliary(struct dpu_prg *prg);
> +
> +void dpu_prg_set_primary(struct dpu_prg *prg);
> +
> +struct dpu_prg *
> +dpu_prg_lookup_by_phandle(struct device *dev, const char *name, int index);
> +
> +#endif
> diff --git a/drivers/gpu/drm/imx/dpu/dpu-prv.h b/drivers/gpu/drm/imx/dpu/dpu-prv.h
> new file mode 100644
> index 00000000..8931af7
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dpu/dpu-prv.h
> @@ -0,0 +1,233 @@
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
> +	int			irq[DPU_IRQ_COUNT];
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
> +struct dpu_units {
> +	const unsigned int *ids;
> +	const enum dpu_unit_type *types;
> +	const unsigned long *ofss;
> +	const unsigned long *pec_ofss;	/* Pixel Engine Configuration */
> +	const unsigned int cnt;
> +	const char *name;
> +
> +	/* software initialization */
> +	int (*init)(struct dpu_soc *dpu, unsigned int index,
> +		    unsigned int id, enum dpu_unit_type type,
> +		    unsigned long pec_base, unsigned long base);
> +
> +	/* hardware initialization */
> +	void (*hw_init)(struct dpu_soc *dpu, unsigned int index);
> +};
> +
> +void dpu_cf_hw_init(struct dpu_soc *dpu, unsigned int index);
> +void dpu_dec_hw_init(struct dpu_soc *dpu, unsigned int index);
> +void dpu_ed_hw_init(struct dpu_soc *dpu, unsigned int index);
> +void dpu_fd_hw_init(struct dpu_soc *dpu, unsigned int index);
> +void dpu_fe_hw_init(struct dpu_soc *dpu, unsigned int index);
> +void dpu_fg_hw_init(struct dpu_soc *dpu, unsigned int index);
> +void dpu_fl_hw_init(struct dpu_soc *dpu, unsigned int index);
> +void dpu_fw_hw_init(struct dpu_soc *dpu, unsigned int index);
> +void dpu_gc_hw_init(struct dpu_soc *dpu, unsigned int index);
> +void dpu_hs_hw_init(struct dpu_soc *dpu, unsigned int index);
> +void dpu_lb_hw_init(struct dpu_soc *dpu, unsigned int index);
> +void dpu_tcon_hw_init(struct dpu_soc *dpu, unsigned int index);
> +void dpu_vs_hw_init(struct dpu_soc *dpu, unsigned int index);
> +
> +int dpu_cf_init(struct dpu_soc *dpu, unsigned int index,
> +		unsigned int id, enum dpu_unit_type type,
> +		unsigned long pec_base, unsigned long base);
> +
> +int dpu_dec_init(struct dpu_soc *dpu, unsigned int index,
> +		 unsigned int id, enum dpu_unit_type type,
> +		 unsigned long unused, unsigned long base);
> +
> +int dpu_ed_init(struct dpu_soc *dpu, unsigned int index,
> +		unsigned int id, enum dpu_unit_type type,
> +		unsigned long pec_base, unsigned long base);
> +
> +int dpu_fd_init(struct dpu_soc *dpu, unsigned int index,
> +		unsigned int id, enum dpu_unit_type type,
> +		unsigned long pec_base, unsigned long base);
> +
> +int dpu_fe_init(struct dpu_soc *dpu, unsigned int index,
> +		unsigned int id, enum dpu_unit_type type,
> +		unsigned long pec_base, unsigned long base);
> +
> +int dpu_fg_init(struct dpu_soc *dpu, unsigned int index,
> +		unsigned int id, enum dpu_unit_type type,
> +		unsigned long unused, unsigned long base);
> +
> +int dpu_fl_init(struct dpu_soc *dpu, unsigned int index,
> +		unsigned int id, enum dpu_unit_type type,
> +		unsigned long pec_base, unsigned long base);
> +
> +int dpu_fw_init(struct dpu_soc *dpu, unsigned int index,
> +		unsigned int id, enum dpu_unit_type type,
> +		unsigned long pec_base, unsigned long base);
> +
> +int dpu_gc_init(struct dpu_soc *dpu, unsigned int index,
> +		unsigned int id, enum dpu_unit_type type,
> +		unsigned long unused, unsigned long base);
> +
> +int dpu_hs_init(struct dpu_soc *dpu, unsigned int index,
> +		unsigned int id, enum dpu_unit_type type,
> +		unsigned long pec_base, unsigned long base);
> +
> +int dpu_lb_init(struct dpu_soc *dpu, unsigned int index,
> +		unsigned int id, enum dpu_unit_type type,
> +		unsigned long pec_base, unsigned long base);
> +
> +int dpu_tcon_init(struct dpu_soc *dpu, unsigned int index,
> +		  unsigned int id, enum dpu_unit_type type,
> +		  unsigned long unused, unsigned long base);
> +
> +int dpu_vs_init(struct dpu_soc *dpu, unsigned int index,
> +		unsigned int id, enum dpu_unit_type type,
> +		unsigned long pec_base, unsigned long base);
> +
> +#endif /* __DPU_PRV_H__ */
> diff --git a/drivers/gpu/drm/imx/dpu/dpu-tcon.c b/drivers/gpu/drm/imx/dpu/dpu-tcon.c
> new file mode 100644
> index 00000000..143f51f
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dpu/dpu-tcon.c
> @@ -0,0 +1,250 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +/*
> + * Copyright (C) 2016 Freescale Semiconductor, Inc.
> + * Copyright 2017-2020 NXP
> + */
> +
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/mutex.h>
> +#include <linux/sizes.h>
> +
> +#include "dpu.h"
> +#include "dpu-prv.h"
> +
> +#define SSQCNTS			0x0
> +#define SSQCYCLE		0x408
> +#define SWRESET			0x40c
> +
> +#define TCON_CTRL		0x410
> +#define  CTRL_RST_VAL		0x01401408
> +#define  BYPASS			BIT(3)
> +
> +#define RSDSINVCTRL		0x414
> +
> +/* red: MAPBIT 29-20, green: MAPBIT 19-10, blue: MAPBIT 9-0 */
> +#define MAPBIT3_0		0x418
> +#define MAPBIT7_4		0x41c
> +#define MAPBIT11_8		0x420
> +#define MAPBIT15_12		0x424
> +#define MAPBIT19_16		0x428
> +#define MAPBIT23_20		0x42c
> +#define MAPBIT27_24		0x430
> +#define MAPBIT31_28		0x434
> +#define MAPBIT34_32		0x438
> +#define MAPBIT3_0_DUAL		0x43c
> +#define MAPBIT7_4_DUAL		0x440
> +#define MAPBIT11_8_DUAL		0x444
> +#define MAPBIT15_12_DUAL	0x448
> +#define MAPBIT19_16_DUAL	0x44c
> +#define MAPBIT23_20_DUAL	0x450
> +#define MAPBIT27_24_DUAL	0x454
> +#define MAPBIT31_28_DUAL	0x458
> +#define MAPBIT34_32_DUAL	0x45c
> +
> +#define SPGPOSON(n)		(0x460 + (n) * 16)
> +#define SPGMASKON(n)		(0x464 + (n) * 16)
> +#define SPGPOSOFF(n)		(0x468 + (n) * 16)
> +#define SPGMASKOFF(n)		(0x46c + (n) * 16)
> +#define  X(n)			(((n) & 0x7fff) << 16)
> +#define  Y(n)			((n) & 0x7fff)
> +
> +#define SMXSIGS(n)		(0x520 + (n) * 8)
> +#define SMXFCTTABLE(n)		(0x524 + (n) * 8)
> +#define RESET_OVER_UNFERFLOW	0x580
> +#define DUAL_DEBUG		0x584
> +
> +struct dpu_tcon {
> +	void __iomem *base;
> +	struct mutex mutex;
> +	unsigned int id;
> +	unsigned int index;
> +	bool inuse;
> +	struct dpu_soc *dpu;
> +};
> +
> +static inline u32 dpu_tcon_read(struct dpu_tcon *tcon, unsigned int offset)
> +{
> +	return readl(tcon->base + offset);
> +}
> +
> +static inline void dpu_tcon_write(struct dpu_tcon *tcon,
> +				  unsigned int offset, u32 value)
> +{
> +	writel(value, tcon->base + offset);
> +}
> +
> +static inline void dpu_tcon_write_mask(struct dpu_tcon *tcon,
> +				       unsigned int offset, u32 mask, u32 value)
> +{
> +	u32 tmp;
> +
> +	tmp = dpu_tcon_read(tcon, offset);
> +	tmp &= ~mask;
> +	dpu_tcon_write(tcon, offset, tmp | value);
> +}
> +
> +void dpu_tcon_set_fmt(struct dpu_tcon *tcon)
> +{
> +	/*
> +	 * The pixels reach TCON are always in 30-bit BGR format.
> +	 * The first bridge always receives pixels in 30-bit RGB format.
> +	 * So, map the format to MEDIA_BUS_FMT_RGB101010_1X30.
> +	 */
> +	dpu_tcon_write(tcon, MAPBIT3_0,   0x17161514);
> +	dpu_tcon_write(tcon, MAPBIT7_4,   0x1b1a1918);
> +	dpu_tcon_write(tcon, MAPBIT11_8,  0x0b0a1d1c);
> +	dpu_tcon_write(tcon, MAPBIT15_12, 0x0f0e0d0c);
> +	dpu_tcon_write(tcon, MAPBIT19_16, 0x13121110);
> +	dpu_tcon_write(tcon, MAPBIT23_20, 0x03020100);
> +	dpu_tcon_write(tcon, MAPBIT27_24, 0x07060504);
> +	dpu_tcon_write(tcon, MAPBIT31_28, 0x00000908);
> +}
> +
> +void dpu_tcon_set_operation_mode(struct dpu_tcon *tcon)
> +{
> +	dpu_tcon_write_mask(tcon, TCON_CTRL, BYPASS, 0);
> +}
> +
> +void dpu_tcon_cfg_videomode(struct dpu_tcon *tcon, struct drm_display_mode *m)
> +{
> +	int hdisplay, hsync_start, hsync_end;
> +	int vdisplay, vsync_start, vsync_end;
> +	int y;
> +
> +	hdisplay = m->hdisplay;
> +	vdisplay = m->vdisplay;
> +	hsync_start = m->hsync_start;
> +	vsync_start = m->vsync_start;
> +	hsync_end = m->hsync_end;
> +	vsync_end = m->vsync_end;
> +
> +	/*
> +	 * TKT320590:
> +	 * Turn TCON into operation mode later after the first dumb frame is
> +	 * generated by DPU.  This makes DPR/PRG be able to evade the frame.
> +	 */
> +	dpu_tcon_write_mask(tcon, TCON_CTRL, BYPASS, BYPASS);
> +
> +	/* dsp_control[0]: hsync */
> +	dpu_tcon_write(tcon, SPGPOSON(0), X(hsync_start));
> +	dpu_tcon_write(tcon, SPGMASKON(0), 0xffff);
> +
> +	dpu_tcon_write(tcon, SPGPOSOFF(0), X(hsync_end));
> +	dpu_tcon_write(tcon, SPGMASKOFF(0), 0xffff);
> +
> +	dpu_tcon_write(tcon, SMXSIGS(0), 0x2);
> +	dpu_tcon_write(tcon, SMXFCTTABLE(0), 0x1);
> +
> +	/* dsp_control[1]: vsync */
> +	dpu_tcon_write(tcon, SPGPOSON(1), X(hsync_start) | Y(vsync_start - 1));
> +	dpu_tcon_write(tcon, SPGMASKON(1), 0x0);
> +
> +	dpu_tcon_write(tcon, SPGPOSOFF(1), X(hsync_start) | Y(vsync_end - 1));
> +	dpu_tcon_write(tcon, SPGMASKOFF(1), 0x0);
> +
> +	dpu_tcon_write(tcon, SMXSIGS(1), 0x3);
> +	dpu_tcon_write(tcon, SMXFCTTABLE(1), 0x1);
> +
> +	/* dsp_control[2]: data enable */
> +	/* horizontal */
> +	dpu_tcon_write(tcon, SPGPOSON(2), 0x0);
> +	dpu_tcon_write(tcon, SPGMASKON(2), 0xffff);
> +
> +	dpu_tcon_write(tcon, SPGPOSOFF(2), X(hdisplay));
> +	dpu_tcon_write(tcon, SPGMASKOFF(2), 0xffff);
> +
> +	/* vertical */
> +	dpu_tcon_write(tcon, SPGPOSON(3), 0x0);
> +	dpu_tcon_write(tcon, SPGMASKON(3), 0x7fff0000);
> +
> +	dpu_tcon_write(tcon, SPGPOSOFF(3), Y(vdisplay));
> +	dpu_tcon_write(tcon, SPGMASKOFF(3), 0x7fff0000);
> +
> +	dpu_tcon_write(tcon, SMXSIGS(2), 0x2c);
> +	dpu_tcon_write(tcon, SMXFCTTABLE(2), 0x8);
> +
> +	/* dsp_control[3]: kachuck */
> +	y = vdisplay + 1;
> +
> +	dpu_tcon_write(tcon, SPGPOSON(4), X(0x0) | Y(y));
> +	dpu_tcon_write(tcon, SPGMASKON(4), 0x0);
> +
> +	dpu_tcon_write(tcon, SPGPOSOFF(4), X(0x20) | Y(y));
> +	dpu_tcon_write(tcon, SPGMASKOFF(4), 0x0);
> +
> +	dpu_tcon_write(tcon, SMXSIGS(3), 0x6);
> +	dpu_tcon_write(tcon, SMXFCTTABLE(3), 0x2);
> +}
> +
> +struct dpu_tcon *dpu_tcon_get(struct dpu_soc *dpu, unsigned int id)
> +{
> +	struct dpu_tcon *tcon;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(dpu->tcon_priv); i++) {
> +		tcon = dpu->tcon_priv[i];
> +		if (tcon->id == id)
> +			break;
> +	}
> +
> +	if (i == ARRAY_SIZE(dpu->tcon_priv))
> +		return ERR_PTR(-EINVAL);
> +
> +	mutex_lock(&tcon->mutex);
> +
> +	if (tcon->inuse) {
> +		mutex_unlock(&tcon->mutex);
> +		return ERR_PTR(-EBUSY);
> +	}
> +
> +	tcon->inuse = true;
> +
> +	mutex_unlock(&tcon->mutex);
> +
> +	return tcon;
> +}
> +
> +void dpu_tcon_put(struct dpu_tcon *tcon)
> +{
> +	if (IS_ERR_OR_NULL(tcon))
> +		return;
> +
> +	mutex_lock(&tcon->mutex);
> +
> +	tcon->inuse = false;
> +
> +	mutex_unlock(&tcon->mutex);
> +}
> +
> +void dpu_tcon_hw_init(struct dpu_soc *dpu, unsigned int index)
> +{
> +	/* reset TCON_CTRL to POR default so that TCON works in bypass mode */
> +	dpu_tcon_write(dpu->tcon_priv[index], TCON_CTRL, CTRL_RST_VAL);
> +}
> +
> +int dpu_tcon_init(struct dpu_soc *dpu, unsigned int index,
> +		  unsigned int id, enum dpu_unit_type type,
> +		  unsigned long unused, unsigned long base)
> +{
> +	struct dpu_tcon *tcon;
> +
> +	tcon = devm_kzalloc(dpu->dev, sizeof(*tcon), GFP_KERNEL);
> +	if (!tcon)
> +		return -ENOMEM;
> +
> +	dpu->tcon_priv[index] = tcon;
> +
> +	tcon->base = devm_ioremap(dpu->dev, base, SZ_2K);
> +	if (!tcon->base)
> +		return -ENOMEM;
> +
> +	tcon->dpu = dpu;
> +	tcon->id = id;
> +	tcon->index = index;
> +
> +	mutex_init(&tcon->mutex);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/imx/dpu/dpu-vscaler.c b/drivers/gpu/drm/imx/dpu/dpu-vscaler.c
> new file mode 100644
> index 00000000..bdef0cd
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dpu/dpu-vscaler.c
> @@ -0,0 +1,308 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +/*
> + * Copyright 2017-2020 NXP
> + */
> +
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/mutex.h>
> +#include <linux/sizes.h>
> +
> +#include "dpu.h"
> +#include "dpu-prv.h"
> +
> +#define PIXENGCFG_DYNAMIC		0x8
> +#define  PIXENGCFG_DYNAMIC_SRC_SEL_MASK	0x3f
> +
> +#define STATICCONTROL			0x8
> +
> +#define SETUP(n)			(0xc + ((n) - 1) * 0x4)
> +
> +#define CONTROL				0x20
> +#define  FIELD_MODE_MASK		0x3000
> +#define  FIELD_MODE(n)			((n) << 12)
> +#define  CTRL_MODE_MASK			BIT(0)
> +
> +struct dpu_vscaler {
> +	void __iomem *pec_base;
> +	void __iomem *base;
> +	struct mutex mutex;
> +	unsigned int id;
> +	unsigned int index;
> +	enum dpu_link_id link_id;
> +	bool inuse;
> +	struct dpu_soc *dpu;
> +};
> +
> +static const enum dpu_link_id dpu_vs_link_id[] = {
> +	LINK_ID_VSCALER4, LINK_ID_VSCALER5, LINK_ID_VSCALER9
> +};
> +
> +static const enum dpu_link_id src_sels[3][4] = {
> +	{
> +		LINK_ID_NONE,
> +		LINK_ID_FETCHDECODE0,
> +		LINK_ID_MATRIX4,
> +		LINK_ID_HSCALER4,
> +	}, {
> +		LINK_ID_NONE,
> +		LINK_ID_FETCHDECODE1,
> +		LINK_ID_MATRIX5,
> +		LINK_ID_HSCALER5,
> +	}, {
> +		LINK_ID_NONE,
> +		LINK_ID_MATRIX9,
> +		LINK_ID_HSCALER9,
> +	},
> +};
> +
> +static inline u32 dpu_pec_vs_read(struct dpu_vscaler *vs,
> +				  unsigned int offset)
> +{
> +	return readl(vs->pec_base + offset);
> +}
> +
> +static inline void dpu_pec_vs_write(struct dpu_vscaler *vs,
> +				    unsigned int offset, u32 value)
> +{
> +	writel(value, vs->pec_base + offset);
> +}
> +
> +static inline void dpu_pec_vs_write_mask(struct dpu_vscaler *vs,
> +					 unsigned int offset,
> +					 u32 mask, u32 value)
> +{
> +	u32 tmp;
> +
> +	tmp = dpu_pec_vs_read(vs, offset);
> +	tmp &= ~mask;
> +	dpu_pec_vs_write(vs, offset, tmp | value);
> +}
> +
> +static inline u32 dpu_vs_read(struct dpu_vscaler *vs, unsigned int offset)
> +{
> +	return readl(vs->base + offset);
> +}
> +
> +static inline void dpu_vs_write(struct dpu_vscaler *vs,
> +				unsigned int offset, u32 value)
> +{
> +	writel(value, vs->base + offset);
> +}
> +
> +static inline void dpu_vs_write_mask(struct dpu_vscaler *vs,
> +				     unsigned int offset, u32 mask, u32 value)
> +{
> +	u32 tmp;
> +
> +	tmp = dpu_vs_read(vs, offset);
> +	tmp &= ~mask;
> +	dpu_vs_write(vs, offset, tmp | value);
> +}
> +
> +enum dpu_link_id dpu_vs_get_link_id(struct dpu_vscaler *vs)
> +{
> +	return vs->link_id;
> +}
> +
> +void dpu_vs_pec_dynamic_src_sel(struct dpu_vscaler *vs, enum dpu_link_id src)
> +{
> +	struct dpu_soc *dpu = vs->dpu;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(src_sels[vs->index]); i++) {
> +		if (src_sels[vs->index][i] == src) {
> +			dpu_pec_vs_write_mask(vs, PIXENGCFG_DYNAMIC,
> +					      PIXENGCFG_DYNAMIC_SRC_SEL_MASK,
> +					      src);
> +			return;
> +		}
> +	}
> +
> +	dev_err(dpu->dev, "VScaler%u - invalid source 0x%02x\n", vs->id, src);
> +}
> +
> +void dpu_vs_pec_clken(struct dpu_vscaler *vs, enum dpu_pec_clken clken)
> +{
> +	dpu_pec_vs_write_mask(vs, PIXENGCFG_DYNAMIC, CLKEN_MASK, CLKEN(clken));
> +}
> +
> +static void dpu_vs_enable_shden(struct dpu_vscaler *vs)
> +{
> +	dpu_vs_write_mask(vs, STATICCONTROL, SHDEN, SHDEN);
> +}
> +
> +void dpu_vs_setup1(struct dpu_vscaler *vs,
> +		   unsigned int src_w, unsigned int dst_w, bool deinterlace)
> +{
> +	struct dpu_soc *dpu = vs->dpu;
> +	u32 scale_factor;
> +	u64 tmp64;
> +
> +	if (deinterlace)
> +		dst_w *= 2;
> +
> +	if (src_w == dst_w) {
> +		scale_factor = 0x80000;
> +	} else {
> +		if (src_w > dst_w) {
> +			tmp64 = (u64)((u64)dst_w * 0x80000);
> +			do_div(tmp64, src_w);
> +
> +		} else {
> +			tmp64 = (u64)((u64)src_w * 0x80000);
> +			do_div(tmp64, dst_w);
> +		}
> +		scale_factor = (u32)tmp64;
> +	}
> +
> +	if (scale_factor > 0x80000) {
> +		dev_err(dpu->dev, "VScaler%u - invalid scale factor 0x%08x\n",
> +							vs->id, scale_factor);
> +		return;
> +	}
> +
> +	dpu_vs_write(vs, SETUP(1), SCALE_FACTOR(scale_factor));
> +
> +	dev_dbg(dpu->dev, "VScaler%u - scale factor 0x%08x\n",
> +							vs->id, scale_factor);
> +}
> +
> +void dpu_vs_setup2(struct dpu_vscaler *vs, bool deinterlace)
> +{
> +	/* 0x20000: +0.25 phase offset for deinterlace */
> +	u32 phase_offset = deinterlace ? 0x20000 : 0;
> +
> +	dpu_vs_write(vs, SETUP(2), PHASE_OFFSET(phase_offset));
> +}
> +
> +void dpu_vs_setup3(struct dpu_vscaler *vs, bool deinterlace)
> +{
> +	/* 0x1e0000: -0.25 phase offset for deinterlace */
> +	u32 phase_offset = deinterlace ? 0x1e0000 : 0;
> +
> +	dpu_vs_write(vs, SETUP(3), PHASE_OFFSET(phase_offset));
> +}
> +
> +void dpu_vs_setup4(struct dpu_vscaler *vs, u32 phase_offset)
> +{
> +	dpu_vs_write(vs, SETUP(4), PHASE_OFFSET(phase_offset));
> +}
> +
> +void dpu_vs_setup5(struct dpu_vscaler *vs, u32 phase_offset)
> +{
> +	dpu_vs_write(vs, SETUP(5), PHASE_OFFSET(phase_offset));
> +}
> +
> +void dpu_vs_output_size(struct dpu_vscaler *vs, u32 line_num)
> +{
> +	dpu_vs_write_mask(vs, CONTROL, OUTPUT_SIZE_MASK, OUTPUT_SIZE(line_num));
> +}
> +
> +void dpu_vs_field_mode(struct dpu_vscaler *vs, enum dpu_scaler_field_mode m)
> +{
> +	dpu_vs_write_mask(vs, CONTROL, FIELD_MODE_MASK, FIELD_MODE(m));
> +}
> +
> +void dpu_vs_filter_mode(struct dpu_vscaler *vs, enum dpu_scaler_filter_mode m)
> +{
> +	dpu_vs_write_mask(vs, CONTROL, FILTER_MODE_MASK, FILTER_MODE(m));
> +}
> +
> +void dpu_vs_scale_mode(struct dpu_vscaler *vs, enum dpu_scaler_scale_mode m)
> +{
> +	dpu_vs_write_mask(vs, CONTROL, SCALE_MODE_MASK, SCALE_MODE(m));
> +}
> +
> +void dpu_vs_mode(struct dpu_vscaler *vs, enum dpu_scaler_mode m)
> +{
> +	dpu_vs_write_mask(vs, CONTROL, CTRL_MODE_MASK, m);
> +}
> +
> +unsigned int dpu_vs_get_id(struct dpu_vscaler *vs)
> +{
> +	return vs->id;
> +}
> +
> +struct dpu_vscaler *dpu_vs_get(struct dpu_soc *dpu, unsigned int id)
> +{
> +	struct dpu_vscaler *vs;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(dpu->vs_priv); i++) {
> +		vs = dpu->vs_priv[i];
> +		if (vs->id == id)
> +			break;
> +	}
> +
> +	if (i == ARRAY_SIZE(dpu->vs_priv))
> +		return ERR_PTR(-EINVAL);
> +
> +	mutex_lock(&vs->mutex);
> +
> +	if (vs->inuse) {
> +		mutex_unlock(&vs->mutex);
> +		return ERR_PTR(-EBUSY);
> +	}
> +
> +	vs->inuse = true;
> +
> +	mutex_unlock(&vs->mutex);
> +
> +	return vs;
> +}
> +
> +void dpu_vs_put(struct dpu_vscaler *vs)
> +{
> +	if (IS_ERR_OR_NULL(vs))
> +		return;
> +
> +	mutex_lock(&vs->mutex);
> +
> +	vs->inuse = false;
> +
> +	mutex_unlock(&vs->mutex);
> +}
> +
> +void dpu_vs_hw_init(struct dpu_soc *dpu, unsigned int index)
> +{
> +	struct dpu_vscaler *vs = dpu->vs_priv[index];
> +
> +	dpu_vs_enable_shden(vs);
> +	dpu_vs_setup2(vs, false);
> +	dpu_vs_setup3(vs, false);
> +	dpu_vs_setup4(vs, 0);
> +	dpu_vs_setup5(vs, 0);
> +	dpu_vs_pec_dynamic_src_sel(vs, LINK_ID_NONE);
> +}
> +
> +int dpu_vs_init(struct dpu_soc *dpu, unsigned int index,
> +		unsigned int id, enum dpu_unit_type type,
> +		unsigned long pec_base, unsigned long base)
> +{
> +	struct dpu_vscaler *vs;
> +
> +	vs = devm_kzalloc(dpu->dev, sizeof(*vs), GFP_KERNEL);
> +	if (!vs)
> +		return -ENOMEM;
> +
> +	dpu->vs_priv[index] = vs;
> +
> +	vs->pec_base = devm_ioremap(dpu->dev, pec_base, SZ_16);
> +	if (!vs->pec_base)
> +		return -ENOMEM;
> +
> +	vs->base = devm_ioremap(dpu->dev, base, SZ_32);
> +	if (!vs->base)
> +		return -ENOMEM;
> +
> +	vs->dpu = dpu;
> +	vs->id = id;
> +	vs->index = index;
> +	vs->link_id = dpu_vs_link_id[index];
> +
> +	mutex_init(&vs->mutex);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/imx/dpu/dpu.h b/drivers/gpu/drm/imx/dpu/dpu.h
> new file mode 100644
> index 00000000..ef012e2
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dpu/dpu.h
> @@ -0,0 +1,385 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +
> +/*
> + * Copyright (C) 2016 Freescale Semiconductor, Inc.
> + * Copyright 2017-2020 NXP
> + */
> +
> +#ifndef __DPU_H__
> +#define __DPU_H__
> +
> +#include <linux/of.h>
> +#include <linux/types.h>
> +
> +#include <drm/drm_color_mgmt.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_modes.h>
> +
> +#define DPU_FRAMEGEN_MAX_FRAME_INDEX	0x3ffff
> +#define DPU_FRAMEGEN_MAX_CLOCK		300000	/* in KHz */
> +
> +#define DPU_FETCHUNIT_CAP_USE_FETCHECO	BIT(0)
> +#define DPU_FETCHUNIT_CAP_USE_SCALER	BIT(1)
> +#define DPU_FETCHUNIT_CAP_PACKED_YUV422	BIT(2)
> +
> +struct dpu_dprc;
> +struct dpu_fetchunit;
> +struct dpu_soc;
> +
> +enum dpu_link_id {
> +	LINK_ID_NONE		= 0x00,
> +	LINK_ID_FETCHDECODE9	= 0x01,
> +	LINK_ID_FETCHWARP9	= 0x02,
> +	LINK_ID_FETCHECO9	= 0x03,
> +	LINK_ID_ROP9		= 0x04,
> +	LINK_ID_CLUT9		= 0x05,
> +	LINK_ID_MATRIX9		= 0x06,
> +	LINK_ID_HSCALER9	= 0x07,
> +	LINK_ID_VSCALER9	= 0x08,
> +	LINK_ID_FILTER9		= 0x09,
> +	LINK_ID_BLITBLEND9	= 0x0a,
> +	LINK_ID_CONSTFRAME0	= 0x0c,
> +	LINK_ID_CONSTFRAME4	= 0x0e,
> +	LINK_ID_CONSTFRAME1	= 0x10,
> +	LINK_ID_CONSTFRAME5	= 0x12,
> +	LINK_ID_FETCHWARP2	= 0x14,
> +	LINK_ID_FETCHECO2	= 0x15,
> +	LINK_ID_FETCHDECODE0	= 0x16,
> +	LINK_ID_FETCHECO0	= 0x17,
> +	LINK_ID_FETCHDECODE1	= 0x18,
> +	LINK_ID_FETCHECO1	= 0x19,
> +	LINK_ID_FETCHLAYER0	= 0x1a,
> +	LINK_ID_MATRIX4		= 0x1b,
> +	LINK_ID_HSCALER4	= 0x1c,
> +	LINK_ID_VSCALER4	= 0x1d,
> +	LINK_ID_MATRIX5		= 0x1e,
> +	LINK_ID_HSCALER5	= 0x1f,
> +	LINK_ID_VSCALER5	= 0x20,
> +	LINK_ID_LAYERBLEND0	= 0x21,
> +	LINK_ID_LAYERBLEND1	= 0x22,
> +	LINK_ID_LAYERBLEND2	= 0x23,
> +	LINK_ID_LAYERBLEND3	= 0x24,
> +};
> +
> +enum dpu_fg_syncmode {
> +	FG_SYNCMODE_OFF,	/* No side-by-side synchronization. */
> +	FG_SYNCMODE_MASTER,	/* Framegen is master. */
> +	FG_SYNCMODE_SLAVE_CYC,	/* Runs in cyclic synchronization mode. */
> +	FG_SYNCMODE_SLAVE_ONCE,	/* Runs in one time synchronization mode. */
> +};
> +
> +enum dpu_fg_dm {
> +	FG_DM_BLACK,
> +	FG_DM_CONSTCOL,	/* Constant Color Background is shown. */
> +	FG_DM_PRIM,
> +	FG_DM_SEC,
> +	FG_DM_PRIM_ON_TOP,
> +	FG_DM_SEC_ON_TOP,
> +	FG_DM_TEST,	/* White color background with test pattern is shown. */
> +};
> +
> +enum dpu_gc_mode {
> +	GC_NEUTRAL,	/* Input data is bypassed to the output. */
> +	GC_GAMMACOR,
> +};
> +
> +enum dpu_lb_mode {
> +	LB_NEUTRAL,	/* Output is same as primary input. */
> +	LB_BLEND,
> +};
> +
> +enum dpu_scaler_field_mode {
> +	/* Constant 0 indicates frame or top field. */
> +	SCALER_ALWAYS0,
> +	/* Constant 1 indicates bottom field. */
> +	SCALER_ALWAYS1,
> +	/* Output field polarity is taken from input field polarity. */
> +	SCALER_INPUT,
> +	/* Output field polarity toggles, starting with 0 after reset. */
> +	SCALER_TOGGLE,
> +};
> +
> +enum dpu_scaler_filter_mode {
> +	SCALER_NEAREST,	/* pointer-sampling */
> +	SCALER_LINEAR,	/* box filter */
> +};
> +
> +enum dpu_scaler_scale_mode {
> +	SCALER_DOWNSCALE,
> +	SCALER_UPSCALE,
> +};
> +
> +enum dpu_scaler_mode {
> +	/* Pixel by-pass the scaler, all other settings are ignored. */
> +	SCALER_NEUTRAL,
> +	/* Scaler is active. */
> +	SCALER_ACTIVE,
> +};
> +
> +enum dpu_pec_clken {
> +	CLKEN_DISABLE = 0x0,
> +	CLKEN_AUTOMATIC = 0x1,
> +	CLKEN_FULL = 0x3,
> +};
> +
> +int dpu_map_irq(struct dpu_soc *dpu, int irq);
> +
> +/* Constant Frame Unit */
> +struct dpu_constframe;
> +enum dpu_link_id dpu_cf_get_link_id(struct dpu_constframe *cf);
> +void dpu_cf_framedimensions(struct dpu_constframe *cf, unsigned int w,
> +			    unsigned int h);
> +void dpu_cf_constantcolor_black(struct dpu_constframe *cf);
> +void dpu_cf_constantcolor_blue(struct dpu_constframe *cf);
> +struct dpu_constframe *dpu_cf_safe_get(struct dpu_soc *dpu,
> +				       unsigned int stream_id);
> +void dpu_cf_safe_put(struct dpu_constframe *cf);
> +struct dpu_constframe *dpu_cf_cont_get(struct dpu_soc *dpu,
> +				       unsigned int stream_id);
> +void dpu_cf_cont_put(struct dpu_constframe *cf);
> +
> +/* Display Engine Configuration Unit */
> +struct dpu_disengcfg;
> +struct dpu_disengcfg *dpu_dec_get(struct dpu_soc *dpu, unsigned int id);
> +void dpu_dec_put(struct dpu_disengcfg *dec);
> +
> +/* External Destination Unit */
> +struct dpu_extdst;
> +void dpu_ed_pec_poweron(struct dpu_extdst *ed);
> +void dpu_ed_pec_src_sel(struct dpu_extdst *ed, enum dpu_link_id src);
> +void dpu_ed_pec_sync_trigger(struct dpu_extdst *ed);
> +struct dpu_extdst *dpu_ed_safe_get(struct dpu_soc *dpu,
> +				   unsigned int stream_id);
> +void dpu_ed_safe_put(struct dpu_extdst *ed);
> +struct dpu_extdst *dpu_ed_cont_get(struct dpu_soc *dpu,
> +				   unsigned int stream_id);
> +void dpu_ed_cont_put(struct dpu_extdst *ed);
> +
> +/* Fetch Decode Unit */
> +struct dpu_fetchunit *dpu_fd_get(struct dpu_soc *dpu, unsigned int id);
> +void dpu_fd_put(struct dpu_fetchunit *fu);
> +
> +/* Fetch ECO Unit */
> +struct dpu_fetchunit *dpu_fe_get(struct dpu_soc *dpu, unsigned int id);
> +void dpu_fe_put(struct dpu_fetchunit *fu);
> +
> +/* Fetch Layer Unit */
> +struct dpu_fetchunit *dpu_fl_get(struct dpu_soc *dpu, unsigned int id);
> +void dpu_fl_put(struct dpu_fetchunit *fu);
> +
> +/* Fetch Warp Unit */
> +struct dpu_fetchunit *dpu_fw_get(struct dpu_soc *dpu, unsigned int id);
> +void dpu_fw_put(struct dpu_fetchunit *fu);
> +
> +/* Frame Generator Unit */
> +struct dpu_framegen;
> +void dpu_fg_syncmode(struct dpu_framegen *fg, enum dpu_fg_syncmode mode);
> +void dpu_fg_cfg_videomode(struct dpu_framegen *fg, struct drm_display_mode *m);
> +void dpu_fg_displaymode(struct dpu_framegen *fg, enum dpu_fg_dm mode);
> +void dpu_fg_panic_displaymode(struct dpu_framegen *fg, enum dpu_fg_dm mode);
> +void dpu_fg_enable(struct dpu_framegen *fg);
> +void dpu_fg_disable(struct dpu_framegen *fg);
> +void dpu_fg_shdtokgen(struct dpu_framegen *fg);
> +u32 dpu_fg_get_frame_index(struct dpu_framegen *fg);
> +int dpu_fg_get_line_index(struct dpu_framegen *fg);
> +int dpu_fg_wait_for_frame_counter_moving(struct dpu_framegen *fg);
> +bool dpu_fg_secondary_requests_to_read_empty_fifo(struct dpu_framegen *fg);
> +void dpu_fg_secondary_clear_channel_status(struct dpu_framegen *fg);
> +int dpu_fg_wait_for_secondary_syncup(struct dpu_framegen *fg);
> +void dpu_fg_enable_clock(struct dpu_framegen *fg);
> +void dpu_fg_disable_clock(struct dpu_framegen *fg);
> +struct dpu_framegen *dpu_fg_get(struct dpu_soc *dpu, unsigned int id);
> +void dpu_fg_put(struct dpu_framegen *fg);
> +
> +/* Gamma Correction Unit */
> +struct dpu_gammacor;
> +void dpu_gc_enable_rgb_write(struct dpu_gammacor *gc);
> +void dpu_gc_disable_rgb_write(struct dpu_gammacor *gc);
> +void dpu_gc_start_rgb(struct dpu_gammacor *gc, const struct drm_color_lut *lut);
> +void dpu_gc_delta_rgb(struct dpu_gammacor *gc, const struct drm_color_lut *lut);
> +void dpu_gc_mode(struct dpu_gammacor *gc, enum dpu_gc_mode mode);
> +struct dpu_gammacor *dpu_gc_get(struct dpu_soc *dpu, unsigned int id);
> +void dpu_gc_put(struct dpu_gammacor *gc);
> +
> +/* Horizontal Scaler Unit */
> +struct dpu_hscaler;
> +enum dpu_link_id dpu_hs_get_link_id(struct dpu_hscaler *hs);
> +void dpu_hs_pec_dynamic_src_sel(struct dpu_hscaler *hs, enum dpu_link_id src);
> +void dpu_hs_pec_clken(struct dpu_hscaler *hs, enum dpu_pec_clken clken);
> +void dpu_hs_setup1(struct dpu_hscaler *hs,
> +		   unsigned int src_w, unsigned int dst_w);
> +void dpu_hs_setup2(struct dpu_hscaler *hs, u32 phase_offset);
> +void dpu_hs_output_size(struct dpu_hscaler *hs, u32 line_num);
> +void dpu_hs_filter_mode(struct dpu_hscaler *hs, enum dpu_scaler_filter_mode m);
> +void dpu_hs_scale_mode(struct dpu_hscaler *hs, enum dpu_scaler_scale_mode m);
> +void dpu_hs_mode(struct dpu_hscaler *hs, enum dpu_scaler_mode m);
> +unsigned int dpu_hs_get_id(struct dpu_hscaler *hs);
> +struct dpu_hscaler *dpu_hs_get(struct dpu_soc *dpu, unsigned int id);
> +void dpu_hs_put(struct dpu_hscaler *hs);
> +
> +/* Layer Blend Unit */
> +struct dpu_layerblend;
> +enum dpu_link_id dpu_lb_get_link_id(struct dpu_layerblend *lb);
> +void dpu_lb_pec_dynamic_prim_sel(struct dpu_layerblend *lb,
> +				 enum dpu_link_id prim);
> +void dpu_lb_pec_dynamic_sec_sel(struct dpu_layerblend *lb,
> +				enum dpu_link_id sec);
> +void dpu_lb_pec_clken(struct dpu_layerblend *lb, enum dpu_pec_clken clken);
> +void dpu_lb_mode(struct dpu_layerblend *lb, enum dpu_lb_mode mode);
> +void dpu_lb_blendcontrol(struct dpu_layerblend *lb, unsigned int zpos,
> +			 unsigned int pixel_blend_mode, u16 alpha);
> +void dpu_lb_position(struct dpu_layerblend *lb, int x, int y);
> +unsigned int dpu_lb_get_id(struct dpu_layerblend *lb);
> +struct dpu_layerblend *dpu_lb_get(struct dpu_soc *dpu, unsigned int id);
> +void dpu_lb_put(struct dpu_layerblend *lb);
> +
> +/* Timing Controller Unit */
> +struct dpu_tcon;
> +void dpu_tcon_set_fmt(struct dpu_tcon *tcon);
> +void dpu_tcon_set_operation_mode(struct dpu_tcon *tcon);
> +void dpu_tcon_cfg_videomode(struct dpu_tcon *tcon, struct drm_display_mode *m);
> +struct dpu_tcon *dpu_tcon_get(struct dpu_soc *dpu, unsigned int id);
> +void dpu_tcon_put(struct dpu_tcon *tcon);
> +
> +/* Vertical Scaler Unit */
> +struct dpu_vscaler;
> +enum dpu_link_id dpu_vs_get_link_id(struct dpu_vscaler *vs);
> +void dpu_vs_pec_dynamic_src_sel(struct dpu_vscaler *vs, enum dpu_link_id src);
> +void dpu_vs_pec_clken(struct dpu_vscaler *vs, enum dpu_pec_clken clken);
> +void dpu_vs_setup1(struct dpu_vscaler *vs,
> +		   unsigned int src_w, unsigned int dst_w, bool deinterlace);
> +void dpu_vs_setup2(struct dpu_vscaler *vs, bool deinterlace);
> +void dpu_vs_setup3(struct dpu_vscaler *vs, bool deinterlace);
> +void dpu_vs_setup4(struct dpu_vscaler *vs, u32 phase_offset);
> +void dpu_vs_setup5(struct dpu_vscaler *vs, u32 phase_offset);
> +void dpu_vs_output_size(struct dpu_vscaler *vs, u32 line_num);
> +void dpu_vs_field_mode(struct dpu_vscaler *vs, enum dpu_scaler_field_mode m);
> +void dpu_vs_filter_mode(struct dpu_vscaler *vs, enum dpu_scaler_filter_mode m);
> +void dpu_vs_scale_mode(struct dpu_vscaler *vs, enum dpu_scaler_scale_mode m);
> +void dpu_vs_mode(struct dpu_vscaler *vs, enum dpu_scaler_mode m);
> +unsigned int dpu_vs_get_id(struct dpu_vscaler *vs);
> +struct dpu_vscaler *dpu_vs_get(struct dpu_soc *dpu, unsigned int id);
> +void dpu_vs_put(struct dpu_vscaler *vs);
> +
> +/* Fetch Units */
> +struct dpu_fetchunit_ops {
> +	void (*set_pec_dynamic_src_sel)(struct dpu_fetchunit *fu,
> +					enum dpu_link_id src);
> +
> +	bool (*is_enabled)(struct dpu_fetchunit *fu);
> +
> +	void (*set_stream_id)(struct dpu_fetchunit *fu, unsigned int stream_id);
> +
> +	unsigned int (*get_stream_id)(struct dpu_fetchunit *fu);
> +
> +	void (*set_no_stream_id)(struct dpu_fetchunit *fu);
> +
> +	bool (*has_stream_id)(struct dpu_fetchunit *fu);
> +
> +	void (*set_numbuffers)(struct dpu_fetchunit *fu, unsigned int num);
> +
> +	void (*set_burstlength)(struct dpu_fetchunit *fu,
> +				unsigned int x_offset, unsigned int mt_w,
> +				int bpp, dma_addr_t baddr);
> +
> +	void (*set_baseaddress)(struct dpu_fetchunit *fu, unsigned int width,
> +				unsigned int x_offset, unsigned int y_offset,
> +				unsigned int mt_w, unsigned int mt_h,
> +				int bpp, dma_addr_t baddr);
> +
> +	void (*set_src_stride)(struct dpu_fetchunit *fu,
> +			       unsigned int width, unsigned int x_offset,
> +			       unsigned int mt_w, int bpp, unsigned int stride,
> +			       dma_addr_t baddr);
> +
> +	void (*set_src_buf_dimensions)(struct dpu_fetchunit *fu,
> +				       unsigned int w, unsigned int h,
> +				       const struct drm_format_info *format,
> +				       bool deinterlace);
> +
> +	void (*set_fmt)(struct dpu_fetchunit *fu,
> +			const struct drm_format_info *format,
> +			enum drm_color_encoding color_encoding,
> +			enum drm_color_range color_range,
> +			bool deinterlace);
> +
> +	void (*set_pixel_blend_mode)(struct dpu_fetchunit *fu,
> +				     unsigned int pixel_blend_mode, u16 alpha,
> +				     bool fb_format_has_alpha);
> +
> +	void (*enable_src_buf)(struct dpu_fetchunit *fu);
> +	void (*disable_src_buf)(struct dpu_fetchunit *fu);
> +
> +	void (*set_framedimensions)(struct dpu_fetchunit *fu,
> +				    unsigned int w, unsigned int h,
> +				    bool deinterlace);
> +
> +	struct dpu_dprc *(*get_dprc)(struct dpu_fetchunit *fu);
> +	struct dpu_fetchunit *(*get_fetcheco)(struct dpu_fetchunit *fu);
> +	struct dpu_hscaler *(*get_hscaler)(struct dpu_fetchunit *fu);
> +	struct dpu_vscaler *(*get_vscaler)(struct dpu_fetchunit *fu);
> +
> +	void (*set_layerblend)(struct dpu_fetchunit *fu,
> +			       struct dpu_layerblend *lb);
> +
> +	bool (*is_available)(struct dpu_fetchunit *fu);
> +	void (*set_available)(struct dpu_fetchunit *fu);
> +	void (*set_inavailable)(struct dpu_fetchunit *fu);
> +
> +	enum dpu_link_id (*get_link_id)(struct dpu_fetchunit *fu);
> +
> +	u32 (*get_cap_mask)(struct dpu_fetchunit *fu);
> +
> +	const char *(*get_name)(struct dpu_fetchunit *fu);
> +};
> +
> +const struct dpu_fetchunit_ops *dpu_fu_get_ops(struct dpu_fetchunit *fu);
> +struct dpu_fetchunit *dpu_fu_get_from_list(struct list_head *l);
> +void dpu_fu_add_to_list(struct dpu_fetchunit *fu, struct list_head *l);
> +
> +/* HW resources for a plane group */
> +struct dpu_plane_res {
> +	struct dpu_fetchunit	**fd;
> +	struct dpu_fetchunit	**fe;
> +	struct dpu_fetchunit	**fl;
> +	struct dpu_fetchunit	**fw;
> +	struct dpu_layerblend	**lb;
> +	unsigned int		fd_cnt;
> +	unsigned int		fe_cnt;
> +	unsigned int		fl_cnt;
> +	unsigned int		fw_cnt;
> +	unsigned int		lb_cnt;
> +};
> +
> +/*
> + * fetchunit/scaler/layerblend resources of a plane group are
> + * shared by the two CRTCs in a CRTC group
> + */
> +struct dpu_plane_grp {
> +	struct dpu_plane_res	res;
> +	struct list_head	node;
> +	struct list_head	fu_list;
> +	unsigned int		hw_plane_cnt;
> +	struct dpu_constframe	*cf[2];
> +	struct dpu_extdst	*ed[2];
> +};
> +
> +/* the two CRTCs of one DPU are in a CRTC group */
> +struct dpu_crtc_grp {
> +	u32			crtc_mask;
> +	struct dpu_plane_grp	*plane_grp;
> +};
> +
> +struct dpu_client_platformdata {
> +	const unsigned int	stream_id;
> +	const unsigned int	dec_frame_complete_irq;
> +	const unsigned int	dec_seq_complete_irq;
> +	const unsigned int	dec_shdld_irq;
> +	const unsigned int	ed_cont_shdld_irq;
> +	const unsigned int	ed_safe_shdld_irq;
> +	struct dpu_crtc_grp	*crtc_grp;
> +
> +	struct device_node	*of_node;
> +};
> +
> +#endif /* __DPU_H__ */
> -- 
> 2.7.4
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
