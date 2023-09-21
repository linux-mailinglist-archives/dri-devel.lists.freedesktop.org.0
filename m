Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EED7A91D3
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 08:55:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF35110E030;
	Thu, 21 Sep 2023 06:55:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2079.outbound.protection.outlook.com [40.107.7.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCEA010E030
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 06:55:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q9IHAZBAeC5ovt22d7ZtsJMgKSq9IMPjq37Iday+acIv4DmGvIcBmBMRfnpr5AtR1ZwkJe2bV8dL1EuptiIS08dEVFU21k3OLyhOkr9Ssav09hp52fxFgVkts+Vm41KAYiCp6mznOE7GA9FVyzJEtkEOCZsActb/aTS/JBLWYobcmRrzJfe+FbYe2iavLyl8O+Yzb5hHYwnrD4P2WFN2oYIh2kWKNc8GV0A37FVJcD0OhPPFh3u/nGdWN/YeRJo5l4p8CBPxhxl+GWZSFMqzmb6NilMkxPxeec4lq5UmUEHo78DiMXDVpJ9TqPKyOM6X0vyHNSviFUh2uekbamEN/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FEh2hUWFNPZga85IFCxBXpArZMiPRINhWuDAXpJAdeU=;
 b=bdsHa2fFyChhe5pTp2kH+H3GD7qqmU1r0ko+OfjZp04Lhdu0GWczTRw2FKr7kxqRsGgIZqTLRmvdZT21heewFLtKIeDMlY4iEUzqkL1nPaenGyTmMrHzNoGQ1d1b6N2Yn+ljjnFuA8iHPM9x6mVkCEgCBuKPDmelkHLmzk3E3loXRcuAmft9edxHusySKRNCX1QDupNsLKJxlp+O9HpqiWIc0N+CJcJevX1Lq63A6tHOgcfjfPe6urAl0CpEpJYKxYWnC9uHZgFuqAt+HCc7c22mcWy2kILa5ooBsyMXANa298e6Q6lyGKsWPWi6lEFiJAssDh36RdkuUXWgSq/F0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FEh2hUWFNPZga85IFCxBXpArZMiPRINhWuDAXpJAdeU=;
 b=BZHcIo0sgCqMJIPSDxMq09XUZnUzvroNUmqe+YpwBok6yg4e0siOC9YW+QNVsmGGZ3rMcdPiaCQnC0InUHCi5uPhKWqDnPqbQq6+wC/wi41/hh/Q14mHQfexvd7LZLRmf+/IG0zOFyR4I35Wcp4JnF3D0iUD/xUEr0F2aiOryWw=
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PR3PR04MB7210.eurprd04.prod.outlook.com (2603:10a6:102:8f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Thu, 21 Sep
 2023 06:55:43 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::1ace:f566:c57a:7d4b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::1ace:f566:c57a:7d4b%3]) with mapi id 15.20.6813.017; Thu, 21 Sep 2023
 06:55:42 +0000
From: Ying Liu <victor.liu@nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>, Marek Vasut <marex@denx.de>
Subject: RE: [PATCH 0/5] imx-lcdif modeset changes
Thread-Topic: [PATCH 0/5] imx-lcdif modeset changes
Thread-Index: AQHZ662fAirllgQIOUWSCbC0x4eaVbAk16UA
Date: Thu, 21 Sep 2023 06:55:42 +0000
Message-ID: <AM7PR04MB704664CB8AB0748AE70B93C098F8A@AM7PR04MB7046.eurprd04.prod.outlook.com>
References: <20230920103126.2759601-1-l.stach@pengutronix.de>
In-Reply-To: <20230920103126.2759601-1-l.stach@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|PR3PR04MB7210:EE_
x-ms-office365-filtering-correlation-id: 597328fb-95b9-46d9-d4a5-08dbba6fc5b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EIieSsza6RTXtzdpr8hacji1HQCmb6KVnAGuZ9+fyzW3E+wPL8HLCuboft3o1ixvnB/7FCW6McqZEW8AhlRK/L70p48WLiA/QxrwPxKkX8fwSTzZ8VCIHH2DvIv+6iNh/SEmIW4UG+CoHjx+gH9zNA1JgjGNL63siPyz5NwQyth61+x0tCa1ZUaAu/LT4foHi23JeVj6IcRCjawtw/WB0e++ehPKHLgFOJhq0rmWNwRa3RMJKGLi3r1yZoCDUycLhNYg6pcbb5zzhTs5/Ywgyndgf4IpVO+W6zoJwbqEt9LjubWgSfcJ2klv+b7pcOer4mj/DFEm/SwfUWXYtXeTkr2ZBG6dvfqM9JUeS8M+tRHFJpgITIMQQ8J9sf4zoxs/pG9T7EXpW2GbsBl0A7s5X8dHtvsnvT5xbm3eTbfPZsm+ju4yRkEkbRxrzO+SYldPKN0JJHSpEnB9lFxh8/hMBSYN6PK1Egxu8J6a9glmRLmDtdPJWUuQbDTsCL8lxgKvpDqcPPsnmFceqs3u3qA1vEi9S++pj0eAwDHme56YBpfZce61Mmxe8i2IwOeqsOYxsA/GejjwPs24Xd+ozlHUJ+8POq+ZWAmSOAXBvLIM73o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(136003)(366004)(346002)(376002)(451199024)(1800799009)(186009)(7696005)(9686003)(53546011)(71200400001)(83380400001)(38070700005)(86362001)(55016003)(122000001)(38100700002)(33656002)(2906002)(8676002)(45080400002)(966005)(6506007)(478600001)(4326008)(5660300002)(52536014)(110136005)(41300700001)(66476007)(316002)(66446008)(64756008)(26005)(66556008)(76116006)(54906003)(8936002)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qOu0hIYeL8V1w/6FhvtUgC1OJO1LRoK4H25cO2Re8qjRqHjfNE1dtHhpuFRs?=
 =?us-ascii?Q?ikzGnRlbCzbdrrxcgkc470z0fz3+cya8mggV+/lCQEmsTTP8hbNnQctaUspu?=
 =?us-ascii?Q?inGA99Bp56mn/76GhrL78TQrBn2FM/zIrfh4z8mNF38+/TDNNBEaTUKmLm6t?=
 =?us-ascii?Q?9rlcRCiSp1dbscAKsZMnxqjoRxMwCswUGuGEc+d89c0cG0beHaqrOIlrMZkJ?=
 =?us-ascii?Q?hIE7AKurxHNn14lXKEBvfW+BTIHxtvLYB3Z4XZAZZ8kl0b6p5SmL3Bze9ZcC?=
 =?us-ascii?Q?+VzGxS1IvEzr3rbIzXAEvvjW3C3N4vu5Wfss1IYzScJAQ+NZTbj9vitdHbfJ?=
 =?us-ascii?Q?h+7MFBNjCyxqLPD9wzewz1sy2KXfMVBMQ9tT74rVGzzxLbtyvIRhT1GUTJH3?=
 =?us-ascii?Q?rs1PKoSWJyc//n4pur2ezFcrmEL3yo1NCF4QVNTR2l7+rMaCmtXVmxs15ag4?=
 =?us-ascii?Q?XzDMTQsKuR+7xTFEMTYHKS/rjOMldBnPliHvqi2k4w5VVckjQPPglp61fsZn?=
 =?us-ascii?Q?rVzpnxk1Le7gIvPoBLr3x0mj1qV1qTrmhd/WUO7KenqTZrvASzrvlQA/zTp6?=
 =?us-ascii?Q?tXZRPsWDvHlIEk30iJ81ZVl664ovQy1JHf4G/oJqU5V2TNcyXlSSeF9xAWyk?=
 =?us-ascii?Q?Zk+xF4CkTontwzSc9jLBK32DY7EyTLxC808fWPrcQOTKWNqgSeC0hB7KfSn6?=
 =?us-ascii?Q?zpQFKHROlOaKAL0sXI4xxZS0hsrL9UkglUCqFSd2sx6TkYn+HcHNLVfQN9R6?=
 =?us-ascii?Q?ilpsCYLd915WWdBgyLv1etXANtSeGc6AhsLUilwBff++Vy8zswclzADShFP/?=
 =?us-ascii?Q?qlN9TX05d7k19/23sSoVM7oiCxLLvEhBup1AWQ2Sza95FVRVTPzE7OCA1roQ?=
 =?us-ascii?Q?k/TXMta0ELrVuxg0CVuKN6EKYUgWHxRxs4t9jrK6ttDlXZe6ROJ8PBmM46ET?=
 =?us-ascii?Q?0WKj99dKnTHlz1iAfzHyRbmWUyOi59U8DJZeoPhc2RizHxy3M1G6RDRyU871?=
 =?us-ascii?Q?fwIBde5XMxb2IS3ctICgWBY3YQ4SbE2kFT+ujSSgrwsZRvHeDrEMfJMMtFsH?=
 =?us-ascii?Q?6OVMdxC2gp5nF0GZmkMm6AqyNmGRrebH1FMBV4d2PG5MeAhJTQTAcMIk6hkh?=
 =?us-ascii?Q?N3SC3hcDp4Cji2GYSOaLggy4fX2eclpjOvXQe7/bXShaLf154hIjsU0lz5cV?=
 =?us-ascii?Q?9x3dFl5HCLO9Du4lUFZk3uZRsRMBePlhP01oc5ZUzro80z89kH70+kzSmC0t?=
 =?us-ascii?Q?kYJmI7HtTE0PKh+VC2C+RUuiNqumGAFIZu7z2wbuG3JRMslqPsizK6xCRicB?=
 =?us-ascii?Q?cFunpUnrnFxznUT0FxCGhs/9Aat+fOfIcJ2+BCcVGDBq5pEAj2S1ItFE5zdd?=
 =?us-ascii?Q?swxJ6AiHYgOOzYjeb+vFoC8oG6retl29uP9CekSbDhrlU9U+bmC7z9NPhB7b?=
 =?us-ascii?Q?LT3T9aN5mIAdjhfrxZj6wKANSJBPcbDny79lAR8cJE3S/rsFFbM1LN5n23Wk?=
 =?us-ascii?Q?awqfQWSLJfW6jj2fzeXZ7+bhViVUhK7sLhpW53jUqLNGi1Sb6IiOnIkgQZ1w?=
 =?us-ascii?Q?69FMthYcTpMANI3uByI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 597328fb-95b9-46d9-d4a5-08dbba6fc5b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2023 06:55:42.3903 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F1LfeABgfMVBajH7cwy7kfE51SjHDhMdkboYRZ+xBiUcosmEtLAosqQkpWcCGZAsYv5iSXW7KTG1APNh5rE5nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7210
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

Thank you for the patch series.

On Wednesday, September 20, 2023 6:31 PM Lucas Stach <l.stach@pengutronix.d=
e> wrote:
> This changes the modeset flow in the imx-lcdif driver to work
> better with runtime PM and get rid of duplicate hardware setup.

I'm assuming the duplicate hardware setup is calling
lcdif_plane_primary_atomic_update() in lcdif_crtc_atomic_enable()
as I mentioned in [1].  If that's the case, it looks like the call is
inevitable due to CRTC/bridge enablement sequence.  See detail
comments for patch 2/5.

Regards,
Liu Ying

>
> This series is a result of looking a bit more into the issue and
> feedback received on some earlier patches [1].
>
> Regards,
> Lucas
>
> [1]
> https://lore.k/
> ernel.org%2Fall%2FCAOcKUNWMU6tjWwtnU%2BCOggrr--G19EvZaHrxAp0-
> 0i5dK394jg%40mail.gmail.com%2F&data=3D05%7C01%7Cvictor.liu%40nxp.com
> %7C3dedd482af2a4a3d9d3f08dbb9c4bfe8%7C686ea1d3bc2b4c6fa92cd99c5c
> 301635%7C0%7C0%7C638308026921385573%7CUnknown%7CTWFpbGZsb3d
> 8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3
> D%7C3000%7C%7C%7C&sdata=3D%2BxMk6cO%2Fxpoip2xChoFcHtkhLWNmi%2
> FngtNm%2BBu2kr6M%3D&reserved=3D0
>
> Lucas Stach (5):
>   drm: lcdif: improve burst size configuration comment
>   drm: lcdif: move controller enable into atomic_flush
>   drm: lcdif: remove superfluous setup of framebuffer DMA address
>   drm: lcdif: move pitch setup to plane atomic update
>   drm: lcdif: force modeset when FB format changes
>
>  drivers/gpu/drm/mxsfb/lcdif_drv.c | 18 +++++++-
>  drivers/gpu/drm/mxsfb/lcdif_kms.c | 68 +++++++++++++++++--------------
>  2 files changed, 55 insertions(+), 31 deletions(-)
>
> --
> 2.39.2

