Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62435303822
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 09:38:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E42766E453;
	Tue, 26 Jan 2021 08:38:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2072.outbound.protection.outlook.com [40.107.20.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B286E3CE
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 05:22:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gr7r32zE7vudvy6nnvT3/x4zuEns4MXyASx44/SqNthJmvFqY8CGou/672HaqWyBnIX49MSJtMY13z15+D+GSwKr4A1ndEDxYKwbONdaFE6TIWlJNR1lq3nMlj0xxsAJ8VBTEBzruuxjUnesdzfYhbfQF1q0ScTFLICuBqmievvZKjlNzg8VtmNxh07IirqVP9yapNZGs9QKOi9vyGzS2XA+g1bvXburruQmu71hnTPVJ3r6ES0KkRdD2Y6XQJcCJaEcFCC1sqDauptXnlW9ZH/LWOUKfhEug+6INAwlPMubtJygXmCNln0stRID9IJOccPMzW2B4OI2LZyT/udAyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U/Vh3lWp5AtBt98yhtXCON8fB7T7LlsT7vwen9eQO2M=;
 b=fFNlwGJiUnjlvDJSa3aV0cThCUa8822W50yrBbNfW3zyLN2FuB56w4hM/wn0U1gmjjebHnbJxo6Gq2HNuVHOHT1bFyoJLMTgeo3CQdLVJOgou2crfuwrTWxhdLfRtiWC0LAK2dRKP8t4hyaT014pK0PKuveU84Gm5JcvpuvH003plWGsgk19gg7qPrUdY5ETj3VNxCrNsh/MqDWMOCI1F78wTOpQpoql3xhnbJu/QGYhtuyt4t90mIPhPW6zMydPknvhzzj7YxbwZNLPBK/Lb7Yr5PuM1nQyeIRuZYVYoXUq3d6SDksK3r7SLQEKm9wXPXsfppfDRGvOQX3bNStvrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U/Vh3lWp5AtBt98yhtXCON8fB7T7LlsT7vwen9eQO2M=;
 b=B8N5Kc3vrruDK9LNEIh00jVc7EkLsNVDCUedT0BMjv7rb3imvgJ7x/v/f7AYIrZnX+A9nIjx2xWfXmW0J0splDE8KyV0qgMlk6Efc2MOTzwb393VjgcSzWyvsm7cOrVFprdwdikwNINt9CL4NoJxUA3Pi347mX9Qv/KoOA07h7A=
Authentication-Results: oss.nxp.com; dkim=none (message not signed)
 header.d=none;oss.nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB6990.eurprd04.prod.outlook.com (2603:10a6:803:138::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Tue, 26 Jan
 2021 05:22:13 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3784.017; Tue, 26 Jan 2021
 05:22:13 +0000
Message-ID: <9233b33c789a2b207a437df9abcff1dd7fd89b16.camel@nxp.com>
Subject: Re: [PATCH v6 5/6] drm/imx: Introduce i.MX8qm/qxp DPU DRM
From: Liu Ying <victor.liu@nxp.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Date: Tue, 26 Jan 2021 13:20:32 +0800
In-Reply-To: <20210125134806.w77bdrx2wbb4kirz@fsr-ub1864-141>
References: <1611213263-7245-1-git-send-email-victor.liu@nxp.com>
 <1611213263-7245-6-git-send-email-victor.liu@nxp.com>
 <20210125134806.w77bdrx2wbb4kirz@fsr-ub1864-141>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR03CA0122.apcprd03.prod.outlook.com
 (2603:1096:4:91::26) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry.ap.freescale.net (119.31.174.66) by
 SG2PR03CA0122.apcprd03.prod.outlook.com (2603:1096:4:91::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.7 via Frontend Transport; Tue, 26 Jan 2021 05:22:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b9ca8570-6b5b-443e-827a-08d8c1ba5609
X-MS-TrafficTypeDiagnostic: VI1PR04MB6990:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB699014674158B9C467F1B4E298BC0@VI1PR04MB6990.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lFFs2EDhqikDwZCjVzz8GFBO1APSiQCh0poSSqy37Ao2FlQ6xPg4+wnE3JNZT6k4ZTIf4bz5ss+DvLVwWe0zKkrKnwcMAE2yI0wvVkco8O9OdcKBniAk4eaJBdEC3zjV6yGPMROjmXSw9NVx3qrRcMtzheGzGgyMIALJyUSo82v6ifE5lusqVhEjSGKgi7YsKtLpLccB5L3yA2w/fX5oDCPO50C0ZmcgaXV0Lr5eVDC+xrpDiyiv2kqI9HfmZkvUmkok/bvD8YagdzzHCt+W65aAUCrR6hjZ24bM9M5wIK9AyHLgE+zGjNtsIpoFyXq5OALI5YYxweVaNUlMrEHHdTu2BymEaigZH7Gh7pJ09749c3kq37nRwywLQFcVdKeyU0UWu12/x1dN/463pvFtYLNiD9SmVFT7ByX7dUCc12oCCAO4yjcibzDoyA7niyKIn+x5CmFWFk5usSzyaDaRVB/faDs+lUQBHF7sX8lEpPlFx8FvfWpBhiFp6Zja5PnjfuCN7TCO26bqW5gGpfKxLlT+5eDMv8hjIirqF5xmGz7zuyW45RffoGySUjIoVeWxdYrKYrpxClK3TljXO81yHTQlUFICD0U4qg25yX+tr8A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(376002)(396003)(136003)(346002)(5660300002)(26005)(6486002)(66556008)(66946007)(36756003)(52116002)(66476007)(7416002)(83380400001)(2906002)(6506007)(30864003)(2616005)(186003)(8676002)(86362001)(8936002)(6666004)(956004)(478600001)(4326008)(316002)(6862004)(16526019)(6512007)(966005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WUFRcjc4anZlT1NHams3dXJHMGE4aXJmTmlrR1oyL3d6U3RYT1BGdG5qdnZy?=
 =?utf-8?B?eFgyTkZnOEdIdFdCL3VLK2c3Q25HMlZwdXNxcUg1T3g5a0NiOS9nV1RtZVpn?=
 =?utf-8?B?NVY3VkEyVmsyWnZ6YU16cHVidGIxdWlPUXFLUVI2WlpzbWtFanlabTRyUnM2?=
 =?utf-8?B?cUc3Z0djdkpZVytPN2dMR2tJaFY4aTBFSzI1U3NxVWEyNU94d1pmcXJJUkNo?=
 =?utf-8?B?dW80ZExBQStDK0dzdjBwVzh1OGFSS1pHMjdmd3AvRGs0TlRWT3FRM0NOeUZ4?=
 =?utf-8?B?WnE2dEJmKzRsS1ZCWnJGOWFlckJnS2w3RHBPL0Y1a0dDbU1neUFpemlQT1ZV?=
 =?utf-8?B?RXZ3QkdqeVBDQVdyZkw1cG54MnRCWVR5QXR0NTBBTkdqUzl3ek9XaDZ1TmFI?=
 =?utf-8?B?dzgvS3h1TWpxNm5ZakluQVBwQTRCY0ZubDQvZkNvUWtSQzFCTFNwajVzR2Fk?=
 =?utf-8?B?SVI0eTRocUJxSVBBMWQzTkR0UGltL0IvdmI1UDE2MjBPbCtDcElKemZHR2hU?=
 =?utf-8?B?cEcyL29QRTArYlhYbzhLUlBkdk8yNWFnU2IzRTNaZ3VvRU5TRnlBNi9EaTVX?=
 =?utf-8?B?Vytjd2swTmk4UkEzeXZnNXF4Y1VGU2k4cUQ2T2NYdUhybnBudTloTmFuazFz?=
 =?utf-8?B?RDMyMEtDd0hGaW1ZYUpYNUNVTTE3cUJhM3Eza1d1b0JEckl0YmZKOWhrdktv?=
 =?utf-8?B?MnRuZ1ZhM0gzWVJ0MVlrQ0NxYlpTbzJMRVB2dmY1Y3lsZG8valNxNWJJYzNC?=
 =?utf-8?B?Ynhkalp0ZlZYV3dwRDI3dTlIbXhSU0lqTThyMFN5QjdBL3ZMT3NzcTMxWUJx?=
 =?utf-8?B?SC9ndjRIdzRYMjU4MW5LYjV3cE9DR2t2aVl2enVYVE5JY0E1Z2hoM1l2YUJZ?=
 =?utf-8?B?WUJMYlRSbjhKR2w0TDJMZExlNDNkdldnRkMxcjRwMUpVUno1SHlWeTVTQ3dU?=
 =?utf-8?B?REhlcEF0VjhUNmpIdzBPd3UwL1pWUGVlSDJkSUZwTXJVbDBSYzYrc2ZqaEkv?=
 =?utf-8?B?OGtqYWp5SzhXemNRa3kraXZUdUNWcHlHRWQ2MHNoeXlPZWFtbU9tSi94dFV0?=
 =?utf-8?B?MU1tcmtlNkptUFRnNENpRFRxcUpKRllyYnE4d0ZhWWN2dkI3S21tWTZMemZ1?=
 =?utf-8?B?TUg5cG9WRFUvYU1zSFUzbEZ0K3ZXZitYaHJXQUw4emZCRFlDNzM0OE5rY09L?=
 =?utf-8?B?RWFuN2IzZkc1OUtJYzFLQml0RHQwbEtjYitnT1RhS2Y5dTByNW1KTlZjRC95?=
 =?utf-8?B?Ry8xcXBmTXErWjZ4YU9vdjUxcmh2akdsbk55T0gwa3d5d3BVTS81ZHBDaDFV?=
 =?utf-8?B?cXFtLzJsWDdEMm0rYS9KbWRBUS8rNVREUU1JK2FvU2ZVVkxZdEZOWi82bG1R?=
 =?utf-8?B?UERRdlMxNU5qZE55SGJIOHdqSzV3R0o1QVUyRFpxSlRmTjk5Rk1ZVTVTZlBW?=
 =?utf-8?Q?9uxK8cG7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9ca8570-6b5b-443e-827a-08d8c1ba5609
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 05:22:13.1222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iefcsRAjy9acTL7JY9a+WNNiP4kHViyoAmM1GjTS6Wca8yFDOVetOUKhsaps2JExURJzW3Q7ByLgF5guXu28ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6990
X-Mailman-Approved-At: Tue, 26 Jan 2021 08:37:37 +0000
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

On Mon, 2021-01-25 at 15:48 +0200, Laurentiu Palcu wrote:
> Hi Liu Ying,
> 
> Just some minor comments below.
> 
> On Thu, Jan 21, 2021 at 03:14:22PM +0800, Liu Ying wrote:
> > This patch introduces i.MX8qm/qxp Display Processing Unit(DPU) DRM support.
> > 
> > DPU is comprised of two main components that include a blit engine for
> > 2D graphics accelerations(with composition support) and a display controller
> > for display output processing, as well as a command sequencer.  Outside of
> > DPU, optional prefetch engines, a.k.a, Prefetch Resolve Gasket(PRG) and
> > Display Prefetch Resolve(DPR), can fetch data from memory prior to some DPU
> > fetchunits of blit engine and display controller.  The prefetch engines
> > support reading linear formats and resolving Vivante GPU tile formats.
> > 
> > This patch adds kernel modesetting support for the display controller part.
> > The driver supports two CRTCs per display controller, planes backed by
> > four fetchunits(decode0/1, fetchlayer, fetchwarp), fetchunit allocation
> > logic for the two CRTCs, prefetch engines(with tile resolving supported),
> > plane upscaling/deinterlacing/yuv2rgb CSC/alpha blending and CRTC gamma
> > correction.  The registers of the controller is accessed without command
> > sequencer involved, instead just by using CPU.
> > 
> > Reference manual can be found at:
> > https://www.nxp.com/webapp/Download?colCode=IMX8DQXPRM
> > 
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > v5->v6:
> > * Do not use macros where possible. (Laurentiu)
> > * Break dpu_plane_atomic_check() into some smaller functions. (Laurentiu)
> > * Address some minor comments from Laurentiu.
> > * Add dpu_crtc_err() helper marco to tell dmesg which CRTC generates error.
> > * Drop calling dev_set_drvdata() from dpu_drm_bind/unbind() as it is done
> >   in dpu_drm_probe().
> > * Some trivial tweaks.
> > 
> > v4->v5:
> > * Rebase up onto the latest drm-misc-next branch and remove the hook to
> >   drm_atomic_helper_legacy_gamma_set(), because it was dropped by the newly
> >   landed commit 'drm: automatic legacy gamma support'.
> > * Remove a redundant blank line from dpu_plane_atomic_update().
> > 
> > v3->v4:
> > * No change.
> > 
> > v2->v3:
> > * Fix build warnings Reported-by: kernel test robot <lkp@intel.com>.
> > * Drop build dependency on IMX_SCU, as dummy SCU functions have been added in
> >   header files by the patch 'firmware: imx: add dummy functions' which has
> >   landed in linux-next/master branch.
> > 
> > v1->v2:
> > * Add compatible for i.MX8qm DPU, as this is tested with i.MX8qm LVDS displays.
> >   (Laurentiu)
> > * Fix PRG burst size and stride. (Laurentiu)
> > * Put 'ports' OF node to fix the bail-out logic in dpu_drm_probe(). (Laurentiu)
> > 
> >  drivers/gpu/drm/imx/Kconfig               |    1 +
> >  drivers/gpu/drm/imx/Makefile              |    1 +
> >  drivers/gpu/drm/imx/dpu/Kconfig           |   10 +
> >  drivers/gpu/drm/imx/dpu/Makefile          |   10 +
> >  drivers/gpu/drm/imx/dpu/dpu-constframe.c  |  171 +++++
> >  drivers/gpu/drm/imx/dpu/dpu-core.c        | 1094 +++++++++++++++++++++++++++++
> >  drivers/gpu/drm/imx/dpu/dpu-crtc.c        |  967 +++++++++++++++++++++++++
> >  drivers/gpu/drm/imx/dpu/dpu-crtc.h        |   66 ++
> >  drivers/gpu/drm/imx/dpu/dpu-disengcfg.c   |  117 +++
> >  drivers/gpu/drm/imx/dpu/dpu-dprc.c        |  718 +++++++++++++++++++
> >  drivers/gpu/drm/imx/dpu/dpu-dprc.h        |   40 ++
> >  drivers/gpu/drm/imx/dpu/dpu-drv.c         |  292 ++++++++
> >  drivers/gpu/drm/imx/dpu/dpu-drv.h         |   28 +
> >  drivers/gpu/drm/imx/dpu/dpu-extdst.c      |  299 ++++++++
> >  drivers/gpu/drm/imx/dpu/dpu-fetchdecode.c |  294 ++++++++
> >  drivers/gpu/drm/imx/dpu/dpu-fetcheco.c    |  224 ++++++
> >  drivers/gpu/drm/imx/dpu/dpu-fetchlayer.c  |  154 ++++
> >  drivers/gpu/drm/imx/dpu/dpu-fetchunit.c   |  609 ++++++++++++++++
> >  drivers/gpu/drm/imx/dpu/dpu-fetchunit.h   |  191 +++++
> >  drivers/gpu/drm/imx/dpu/dpu-fetchwarp.c   |  250 +++++++
> >  drivers/gpu/drm/imx/dpu/dpu-framegen.c    |  395 +++++++++++
> >  drivers/gpu/drm/imx/dpu/dpu-gammacor.c    |  223 ++++++
> >  drivers/gpu/drm/imx/dpu/dpu-hscaler.c     |  275 ++++++++
> >  drivers/gpu/drm/imx/dpu/dpu-kms.c         |  540 ++++++++++++++
> >  drivers/gpu/drm/imx/dpu/dpu-kms.h         |   23 +
> >  drivers/gpu/drm/imx/dpu/dpu-layerblend.c  |  348 +++++++++
> >  drivers/gpu/drm/imx/dpu/dpu-plane.c       |  799 +++++++++++++++++++++
> >  drivers/gpu/drm/imx/dpu/dpu-plane.h       |   56 ++
> >  drivers/gpu/drm/imx/dpu/dpu-prg.c         |  433 ++++++++++++
> >  drivers/gpu/drm/imx/dpu/dpu-prg.h         |   45 ++
> >  drivers/gpu/drm/imx/dpu/dpu-prv.h         |  233 ++++++
> >  drivers/gpu/drm/imx/dpu/dpu-tcon.c        |  250 +++++++
> >  drivers/gpu/drm/imx/dpu/dpu-vscaler.c     |  308 ++++++++
> >  drivers/gpu/drm/imx/dpu/dpu.h             |  385 ++++++++++
> >  34 files changed, 9849 insertions(+)
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
> 
> [...]
> 
> > diff --git a/drivers/gpu/drm/imx/dpu/dpu-core.c b/drivers/gpu/drm/imx/dpu/dpu-core.c
> > new file mode 100644
> > index 00000000..7dab6cc
> > --- /dev/null
> > +++ b/drivers/gpu/drm/imx/dpu/dpu-core.c
> 
> [...]
> 
> > +static int dpu_get_irqs(struct platform_device *pdev, struct dpu_soc *dpu)
> > +{
> > +	unsigned int i, j;
> > +
> > +	/* do not get the reserved irq */
> > +	for (i = 0, j = 0; i < DPU_IRQ_COUNT - 1; i++, j++) {
> > +		if (i == DPU_IRQ_RESERVED)
> > +			j++;
> > +
> > +		dpu->irq[j] = platform_get_irq(pdev, i);
> > +		if (dpu->irq[j] < 0) {
> > +			dev_err_probe(dpu->dev, dpu->irq[j],
> > +				      "failed to get irq\n");
> > +			return dpu->irq[i];
> 
> I think you want 'return dpu->irq[j]'.

Good catch.

> 
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> 
> [...]
> 
> > +static const struct dpu_irq_handler_map {
> > +	void (*handler)(struct irq_desc *desc);
> > +} dpu_irq_handler_maps[DPU_IRQ_COUNT] = {
> > +	{},						/* 0 */
> > +	{},						/* 1 */
> > +	{},						/* 2 */
> > +	{dpu_extdst0_shdload_irq_handler},		/* 3 */
> > +	{},						/* 4 */
> > +	{},						/* 5 */
> > +	{dpu_extdst4_shdload_irq_handler},		/* 6 */
> > +	{},						/* 7 */
> > +	{},						/* 8 */
> > +	{dpu_extdst1_shdload_irq_handler},		/* 9 */
> > +	{},						/* 10 */
> > +	{},						/* 11 */
> > +	{dpu_extdst5_shdload_irq_handler},		/* 12 */
> > +	{},						/* 13 */
> > +	{},						/* 14 */
> > +	{dpu_disengcfg_shdload0_irq_handler},		/* 15 */
> > +	{dpu_disengcfg_framecomplete0_irq_handler},	/* 16 */
> > +	{dpu_disengcfg_seqcomplete0_irq_handler},	/* 17 */
> > +	{},						/* 18 */
> > +	{},						/* 19 */
> > +	{},						/* 20 */
> > +	{},						/* 21 */
> > +	{},						/* 22 */
> > +	{},						/* 23 */
> > +	{},						/* 24 */
> > +	{dpu_disengcfg_shdload1_irq_handler},		/* 25 */
> > +	{dpu_disengcfg_framecomplete1_irq_handler},	/* 26 */
> > +	{dpu_disengcfg_seqcomplete1_irq_handler},	/* 27 */
> > +	{},						/* 28 */
> > +	{},						/* 29 */
> > +	{},						/* 30 */
> > +	{},						/* 31 */
> > +	{},						/* 32 */
> > +	{},						/* 33 */
> > +	{},						/* 34 */
> > +	{/* reserved */},				/* 35 */
> > +	{},						/* 36 */
> > +	{},						/* 37 */
> > +	{},						/* 38 */
> > +	{},						/* 39 */
> > +	{},						/* 40 */
> > +	{},						/* 41 */
> > +	{},						/* 42 */
> > +	{},						/* 43 */
> > +	{},						/* 44 */
> > +	{},						/* 45 */
> > +	{},						/* 46 */
> > +	{},						/* 47 */
> > +	{},						/* 48 */
> > +};
> 
> Why not make this an array of pointers to functions. Do we need a struct?
> Something like:
> 
> static void (* const dpu_irq_handler[DPU_IRQ_COUNT])(struct irq_desc *) = {
> 	[3] = dpu_extdst0_shdload_irq_handler,
> 	[6] = dpu_extdst4_shdload_irq_handler,
> 	...
> };

Alright, will use the function array.

> 
> [...]
> 
> > +static int
> > +dpu_get_fetchunits_for_plane_grp(struct dpu_soc *dpu,
> > +				 const struct dpu_units *us,
> > +				 struct dpu_fetchunit ***fu,
> > +				 unsigned int *cnt,
> > +				 struct dpu_fetchunit *
> > +						(*get)(struct dpu_soc *dpu,
> > +						       unsigned int id))
> > +{
> > +	unsigned int fu_cnt = 0;
> > +	int i, j, ret;
> > +
> > +	for (i = 0; i < us->cnt; i++) {
> > +		if (us->types[i] == DPU_DISP)
> > +			fu_cnt++;
> > +	}
> > +
> > +	*cnt = fu_cnt;
> > +
> > +	*fu = devm_kcalloc(dpu->dev, fu_cnt, sizeof(**fu), GFP_KERNEL);
> > +	if (!(*fu))
> > +		return -ENOMEM;
> > +
> > +	for (i = 0, j = 0; i < us->cnt; i++) {
> > +		if (us->types[i] != DPU_DISP)
> > +			continue;
> > +
> > +		(*fu)[j] = (*get)(dpu, us->ids[i]);
> 
> You can also call get() directly. No need to dereference function
> pointers.

Will do.

> 
> > +		if (IS_ERR((*fu)[j])) {
> > +			ret = PTR_ERR((*fu)[j]);
> > +			dev_err(dpu->dev, "failed to get %s%d: %d\n",
> > +						us->name, us->ids[i], ret);
> > +			return ret;
> > +		}
> > +		j++;
> > +	}
> > +
> > +	return 0;
> > +}
> 
> [...]
> 
> > +static void
> > +dpu_put_fetchunits_for_plane_grp(struct dpu_fetchunit ***fu,
> > +				 unsigned int *cnt,
> > +				 void (*put)(struct dpu_fetchunit *fu))
> > +{
> > +	int i;
> > +
> > +	for (i = 0; i < *cnt; i++)
> > +		(*put)((*fu)[i]);
> 
> Same here, you can call put() directly.

Will do.

Thanks,
Liu Ying

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
