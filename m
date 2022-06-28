Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A4755BDA5
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 04:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9F6910F012;
	Tue, 28 Jun 2022 02:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150072.outbound.protection.outlook.com [40.107.15.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D40B10F012
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 02:32:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JsvK6KgrcfjtxK9w1ZmIMksznGXkHn/RttSC8T0dMpwXSNqshRPmOxyi9eN4UjGZvSVIfQzUH7iHJno9yhgtG9MtcjRkUTpCIoG7UwepHBXcTp7I5kzaIIr7l2ucIuKJrV5Z16O6QhvxYQ4tL1zvkzYUND/Hz2jfNZKWNvbeSkeZ1rCeKcjdXGpePEe9pZAhW/K97efASyjLUwTKR6lJ11YkCSWFWWxMLfTQlrVP2b3yBOUHjraDuKnD1bVcVEF92nmBEbjXzYx+YhRaas7dCShjqRroZWeRuGYiddYd1lDaUZKe4EuncUqQLwZUi6QsZi17ffhd2SN3ysrRjjlJOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFQQfM2YarTDw0kUSoPq/7Paj3yWvHcbZimI3ejFrgc=;
 b=VPBjpcYOrgiHMjibHSvOuaSMwUrk94QrUzzbwTRE1fqHDJCaARR5WSlfa4cL5lIVBIOKpiywybEfjXxi8dpseL5uaTE5GdYXY6NuO8+zJUtCYIUcHm1/pHR/TfqW4Y/3me3A5FE/Ml240YSC7kgwV5BqejDWJA87oV9b8jGSxf0qp5EC3KBzWv+b0+OrfGy7OQfQzdBgk74L41SmpZjkMWAuXgSPOUhx6KAYhhHQpEH8T7ncUHhfXhS7joWFb+F/d3y2xXwqw1GtLwg9TXotEjtAfA6tu7gnoAL69ntetlTEwgx+Ss1jIhcnHXIFiqAfTDezGb2Fj5nmTOvCSvM6EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFQQfM2YarTDw0kUSoPq/7Paj3yWvHcbZimI3ejFrgc=;
 b=IlAaM2DHeC/jEg4eN8pIuMsC5Bci5Lr0nA08iMzbO5JBArxUz0etKJPOTuG2Hh7/ToKJIKkt2Fx4+Gl5HYQtlCfS0EgEKrQjHrXyXCElnuWx8bxTy3GVqMeg6Ui7SO78/sObWIUDIxnw9zs/p3AmpQ0dfiYJMs8yeTlMxpWlKrU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB6PR0401MB2279.eurprd04.prod.outlook.com (2603:10a6:4:49::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Tue, 28 Jun
 2022 02:32:13 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::416e:6e99:bac6:d3a9]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::416e:6e99:bac6:d3a9%5]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 02:32:13 +0000
Message-ID: <9f5b511708ca9b30ef101a46a5d1b76f03b2c4fc.camel@nxp.com>
Subject: Re: [PATCH v2] drm/bridge: imx: i.MX8 bridge drivers should depend
 on ARCH_MXC
From: Liu Ying <victor.liu@nxp.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Andrzej Hajda <andrzej.hajda@intel.com>, Robert
 Foss <robert.foss@linaro.org>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team
 <linux-imx@nxp.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Marek
 Vasut <marex@denx.de>
Date: Tue, 28 Jun 2022 10:31:32 +0800
In-Reply-To: <b625ba83-fee9-b668-09db-976cb3bef3ca@baylibre.com>
References: <42c542b53a1c8027b23a045045fbb7b34479913d.1656072500.git.geert+renesas@glider.be>
 <b625ba83-fee9-b668-09db-976cb3bef3ca@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGXP274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::21)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fcb03a7f-5b2c-45f9-d578-08da58ae6901
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2279:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TCMfARWTWaUthI6312yJD9iTW+fcB58lthvIQ9ZzFwVXbejpVRikx1kNwBMrC/xcCQJ3IACV8zecN9mYv16Y0++U2eikfb5SF/ZmoAiB5V9Fk/S/IVj9yxfR9cqhfin9ZjnRH5DkZvP7NbhbHnIZIt4HU/lgCit2JYOn3rOvcTSD9FWrI9c9f6qDLleBNE6qGhghxyFm18J5TUnF3t4cEjT5QN2C/suZwZa/a7U+7Nn+3w+5UTDDmMLo3jstXzkbyjru8uN+wwTE87LM6Bb9dbDzI3gemdneWwRur3KUeTABOq9BD2a7xp1djxuZf7CllbujbedcxVhrRofRgo1bQkLJ5+qrXJUF8840JpzuexSoAFLm+PzCKIhJNv5wQBBoSYvkv/dkU2BFSS3MbniHea0kJI8qlRyaTMso8VAXSi7d/2Z0maQG3t1StLxJCFh7treWgON1hCth9ccqc4sifZY1piHQs5QyNVKUXIdMsSygE/6t7FkaGIF614ybuY7ptu8UCi0RTTnWRHVxWVe6X6zWGyvqmePIfyN1G5V446UNdodjhE9D3mnK04eogFIHdXl5vI8E6Q+kqSxdsdSdwHLnDxTfmk2t7Ab76bPIKX3fHwTyDkung7qIs+DfpZjgqFm8G8tvaPKrz1rx83hBJMG1Q5wcO69GPThd0mdoHKac5X8mhX8JJAyJKLr4CwKtpA5bfFXA1XamahjHf4IgijlR7uTEuv2Ml34DfDYgJlixDGdCjhBc7IXCOoc89F0M2VzMO70AUcTA97hKqbnEdKbQxdeLrJmICUc2UuCJ7XF2caGIq6OCiYqWocrXIqqDkh6HHBkifzglNInb0gk7XdTflEGN255amDFYprdlmXZPES7ajcLboVUFxZXqu5N7ueHOnaEwddJi+c2iYyBoxw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(136003)(396003)(346002)(366004)(376002)(478600001)(2906002)(2616005)(5660300002)(6512007)(7416002)(41300700001)(86362001)(6486002)(26005)(52116002)(921005)(6506007)(53546011)(8936002)(66556008)(38100700002)(6666004)(966005)(110136005)(38350700002)(4326008)(66946007)(186003)(66476007)(36756003)(316002)(8676002)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWlySGxFN2M4SVFUTFRlMEhVWWt0OGNyVTVUN1dqR0FuOXo4eGpld2pINlBT?=
 =?utf-8?B?V1dackFCTUdscHAwaEg0RUJ0TXFGdU9pMXRqeFNMcUhqVFZ6eWlnWERUUWtI?=
 =?utf-8?B?OUpQRUNrRDNBaUxkQVhlc3NjUEluZlFMdkJFSnJwOWhSZEF3dmUwTnVXK3Jn?=
 =?utf-8?B?SkhZclZ3aDF6bFA1bWRFNnlHK0NEMmwrazBqSGJJMS81VkxLdlhleGVJSys2?=
 =?utf-8?B?aVRHUFU5RUNxV3lPM3V6Z1QvbWNzcmNIRVJoN05sQzBucGRYa0ZiMVBDajBC?=
 =?utf-8?B?dmZISG1uTEtCVHlmMXdlanVnL3Y2V3VzU1YrRVBUQUF3OEh0b1NRREM4TUlC?=
 =?utf-8?B?NWh3cFhjM1liWDhrSFkyM0JuNms3dGN1Um44cmpUZzJvOTdia3kzR0J3VlNE?=
 =?utf-8?B?QjhPallNeXY1YUZNUGMzeWxxOXhnSUpoL2xJQ3BFUFB6d0pEdzVyZUNidkVw?=
 =?utf-8?B?ZEljeFY4R010WlNRcDdnN3MrYjlHeVg3UWVFREtBeFpGRWNNdGVzY09PY2JP?=
 =?utf-8?B?TUpNbXpqd1NDY0xpTGd0TVJoMExyUDZTV0piTXJFR25vQU54eDZIdzNVejNO?=
 =?utf-8?B?RUNQaXpNTkZkMk5pY3o3VE9aR0Fib1QxWW9xc2NYN1VUOWJpTExnTzI4dzZu?=
 =?utf-8?B?SzFrM3UzZjlFVW5GUFltTThCbUc1YmNpaWNpQnJDQ0pXOGhuZHBnNGtpajl3?=
 =?utf-8?B?bGw2bFozUXFOQWtEN1NSaEF2allXYTBpTWJBUUJZV1A0Nk13dHNYTmw2L0hu?=
 =?utf-8?B?aUcwZGhCdkJVSHBTT1RwOWhWc1hDYmZRaExGREZaSUQ0aytLcUR1bE5FQVFO?=
 =?utf-8?B?NDc5dUwwdUtKMzBCTmV4V2ppNmo5KzJNcUpEQU1SYUxzbVplUW40K0lmTVRj?=
 =?utf-8?B?cWI1S2Nhck5mR3F5dFV2TXlLQWlySngvWG1EdVJSQWpQRFh4SmgwT25uazF2?=
 =?utf-8?B?ZEc3S1VGUEhNRVNSMUlqM2dRWkJoelpNYkM0QW5qaTMvVFdwMFdZa3lpbWNX?=
 =?utf-8?B?bndCcVlkVVJ1OEMza3BmYVFyTzRNdWtVdFNFVjJLWklMV25nbGJ2QUtrS1ll?=
 =?utf-8?B?dWxHejhqNnJBVEJWcFF1YW8xYm1FQnR6Q0lhbEVySUlTUTBlQ05adGxuRWVO?=
 =?utf-8?B?ZkNHUTBXU2FZb01iNGtZcHAvYmsvYk1SWXlrS2Y1a3lzdE91L0wwZnVOM09a?=
 =?utf-8?B?emRxZkNJVDhza09lLzZ4UFNieHdqZHl3Vjdqc0M3RnRXM2FjR0pVdjhtb0tm?=
 =?utf-8?B?aWlMdnBzVFo1S1lndUh6VjEwRURKdTB6SGpIaGNyVlFST05HY1JlK1NwdzYr?=
 =?utf-8?B?WmQ0Q2trQ0JZTmt3WWtuTHc1RUlqRUVkRnpTbnp6KytrY2xIU2s4OE9ubEIz?=
 =?utf-8?B?ak1McVdrRnpPRW9SQlViUzVnRERTS3FTRVllZlRNMW5HUTN5bjBLVEQ0L3Q0?=
 =?utf-8?B?NzB4d2hlL2h3enJsRXhtWDBtNmVYQ1o1Sm1jenF4SkZaeGtRUU1teUw5a2dM?=
 =?utf-8?B?SHlwTVJFNnN2d29hQ3hZREIrNWFZeVJyR01hZURZQktNQXh4Tk1aYzkvQnBr?=
 =?utf-8?B?cmhQZzRTczluK1puYnFTekNiMkhDa21LTkdNQ3RYNG9jNEJIQ21QVm1QT2Fq?=
 =?utf-8?B?bUtYS3dkUnc5ZklPditlVkFqU2dYeGxxUDhwZTJCQU9GdXBxelExZENlTEIv?=
 =?utf-8?B?cUFPUis5WkNSS1YyL0ZaVVFpbWszdXU3RFJtdzhHS2NMU2x5UCticmFtN0VQ?=
 =?utf-8?B?K3l1bnJYWmFNbjdkaFRZaGdNWlRJQlRSdFhzUkt6V1JEYVJiS3h4bk5HbXYw?=
 =?utf-8?B?MDdLV3VPYngxK3RhU3BKdExsNUdJQk5hVXRDM3lHWUVwdURlQlFTNWtHTXpS?=
 =?utf-8?B?bWpaTzdmODdDNlI2TnZKWjJmakxsazZVNDRWenNkZjJFaGxqK1A1NkRVYXgx?=
 =?utf-8?B?Y0FsTnRzL1FEeE9GOWRMLzlmSnJvZ29qbFdRYUpQKzdiSUYySGUxSW5qWHdx?=
 =?utf-8?B?TTNZRlNHM05hRXlyMkpSRWNwQjQ0RjNVa0RVK1B4T0o2VXNpREk4VG43Vks1?=
 =?utf-8?B?eDlRM2g1Y3FrOENlMXNWQldOMXlFSDR0YXM1RXBxaXZtaGhYRTQxQXdnZ2Ru?=
 =?utf-8?Q?D9bbUHEgpcMBQbeN1rRzjzUaD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcb03a7f-5b2c-45f9-d578-08da58ae6901
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 02:32:13.7502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9izDWx0J/P8wY5pQkl7Hs97qtDQrAknhZeqZ/QQzHtB15cJDVXa2BdFlxMwZkFmFNk5ii2j9UPCwsvQrdnkQEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2279
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2022-06-27 at 14:22 +0200, Neil Armstrong wrote:
> Hi,

Hi,

> 
> On 24/06/2022 14:10, Geert Uytterhoeven wrote:
> > The various Freescale i.MX8 display bridges are only present on
> > Freescale i.MX8 SoCs.  Hence add a dependency on ARCH_MXC, to
> > prevent
> > asking the user about these drivers when configuring a kernel
> > without
> > i.MX SoC support.
> > 
> > Fixes: e60c4354840b2fe8 ("drm/bridge: imx: Add LDB support for
> > i.MX8qm")
> > Fixes: 3818715f62b42b5c ("drm/bridge: imx: Add LDB support for
> > i.MX8qxp")
> > Fixes: 96988a526c97cfbe ("drm/bridge: imx: Add i.MX8qxp pixel link
> > to DPI support")
> > Fixes: 1ec17c26bc06289d ("drm/bridge: imx: Add i.MX8qm/qxp display
> > pixel link support")
> > Fixes: 93e163a9e0392aca ("drm/bridge: imx: Add i.MX8qm/qxp pixel
> > combiner support")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > v2:
> >    - s/i.MX8MP/i.MX8/,
> >    - Add Reviewed-by.
> > ---
> >   drivers/gpu/drm/bridge/imx/Kconfig | 4 ++++
> >   1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/bridge/imx/Kconfig
> > b/drivers/gpu/drm/bridge/imx/Kconfig
> > index 212a7b0e64fd8b5a..608f47f41bcd1c81 100644
> > --- a/drivers/gpu/drm/bridge/imx/Kconfig
> > +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> > @@ -1,3 +1,5 @@
> > +if ARCH_MXC || COMPILE_TEST
> > +
> >   config DRM_IMX8QM_LDB
> >   	tristate "Freescale i.MX8QM LVDS display bridge"
> >   	depends on OF
> > @@ -41,3 +43,5 @@ config DRM_IMX8QXP_PIXEL_LINK_TO_DPI
> >   	help
> >   	  Choose this to enable pixel link to display pixel
> > interface(PXL2DPI)
> >   	  found in Freescale i.MX8qxp processor.
> > +
> > +endif # ARCH_MXC || COMPILE_TEST
> 
> I was wondering why those were added in drivers/gpu/drm/bridge/imx
> since they are specific to NXP SoCs,
> I think they should be moved in the right drm imx subsystem instead
> of this change.

There are 2 directories which contain display controller drivers for
i.MX SoCs:
a. drivers/gpu/drm/imx - i.MX51/53/6qdl IPUv3, i.MX8mq DCSS and
   i.MX8qm/qxp DPU([1], not landed yet)
b. drivers/gpu/drm/mxsfb - i.MX23/28/6sx/8mq LCDIF and i.MX8mp
   LCDIFv3([2], not landed yet)

Bridges added in drivers/gpu/drm/bridge/imx make it possible to share
bridge drivers across display controllers.  I see chance to use the
LVDS Display Bridge(LDB) helper(imx-ldb-helper.c) for i.MX6sx LDB.

[1] 
https://patchwork.kernel.org/project/dri-devel/patch/20220407091156.1211923-6-victor.liu@nxp.com/
[2] 
https://patchwork.kernel.org/project/dri-devel/patch/20220624180201.150417-2-marex@denx.de/

Regards,
Liu Ying

