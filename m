Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E395459EF
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 04:09:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0F901131F0;
	Fri, 10 Jun 2022 02:09:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2040.outbound.protection.outlook.com [40.107.104.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4265F1131F0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 02:09:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=krggCZ8CB7075jbh1jvyEqDKBT3RK+BbkK8FqCJEh1r74x13pm+PGHofa9Tv84oYzZxR9uY4INN0eQcVSbckbV9400Ywdg2NHp9VfdyYGy0IJw52z9pWpmXBwciQTiS04yDJXvlVMNhPOkjBJu+1bIMz7UWZ2WXBYnh6F1+VRqxVHwPZO1wuZwJs02scxTsq5p2ps1KSzKsr0hBiqo3XAyVwQjy09Si40BoxSwbksKHZpBpRIsICwxZbvFnrgjv3cftcMVPlrrAr4GDu6ZHvH/2aHg4JJkAV/wiRxo7Rru238N3UeO2jPBpI3NXs3ecDDFbIH8lG7gt6vXzORTfb3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c0q3QdV0JxkpPtS0srRmsv5rrjay5TQlsHrBjonE+js=;
 b=WQICGq0HTJhax6kjE6/ucIZvwq5MeGMxri+od57g6d2eO7iq8lSc/ZCSL5AF4QcvF/J/wPBTn23ok7ahyTaqzTllBRyv/2fmr/0sWw5QgTk8U9J5STpGLbyjk5pvz0p/479k41vsFJ/lNz/RUBFC5zpSHRUYLj+DAktU9NOY88wpsSdwXl5PhjWZ+fHl9CFBVNhGDF7CKZu5tVtblzJuPhDrt/ww9HPTKXczLrJB2LyeDJloIY3CIolHrYMGPFicJPX2OnGhQepPqMLp9wJe7TiMNx5mzEKKLnrBX+i9uKgt9V2Ml60yVJppN2JasWw6p4BlqNBtZ+aBTbVDNqsmAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c0q3QdV0JxkpPtS0srRmsv5rrjay5TQlsHrBjonE+js=;
 b=PZWYRczqgNkh6pBBqB0Y1j133srMRwKOKF4VYdu8Obn7bz0hsEcD0oLQLXUfkYlynXcQJTacCHOZ3xgc5YfLN2MGsfMu9fJC02C1Sa4mTU4Y/jvtUhhx9WLxG2eyZngUfG/xUCvoLZvrvKgFNTcuky8j3JMeM3+7uqRMc2B2ZKg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB7PR04MB5017.eurprd04.prod.outlook.com (2603:10a6:10:1b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.18; Fri, 10 Jun
 2022 02:09:34 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502%7]) with mapi id 15.20.5332.013; Fri, 10 Jun 2022
 02:09:34 +0000
Message-ID: <0309ccad2b37c185a83d17e1a8fa3811ac98a49f.camel@nxp.com>
Subject: Re: [PATCH v8 06/14] drm/bridge: imx: Add i.MX8qm/qxp display pixel
 link support
From: Liu Ying <victor.liu@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Fri, 10 Jun 2022 10:09:19 +0800
In-Reply-To: <YqG9uaGOOp8gEYZh@pendragon.ideasonboard.com>
References: <20220609064931.3068601-1-victor.liu@nxp.com>
 <20220609064931.3068601-7-victor.liu@nxp.com>
 <YqG9uaGOOp8gEYZh@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0181.apcprd06.prod.outlook.com (2603:1096:4:1::13)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc24d65d-0593-49be-a7f9-08da4a864306
X-MS-TrafficTypeDiagnostic: DB7PR04MB5017:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <DB7PR04MB501775D650A1EE78519E8CDF98A69@DB7PR04MB5017.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PoER1MSzfbiQ9MeCHuk7diY/Ng5htaSqBCgyuOvB/xhFd6M5FOo3mLCC9GqWTqgTBEXdiUzhvE1fCv7pezfzjq958UpSlOF64MsDzbEAqn5DE4QHQ7PhhWyRbh+pfgI8INQlSu41h9YsvSZwOoYs1AQ/LqcJDotEwfp1AiXK1DUqQbpQa0p6djMTYn0CT2E93CpFYqx+DjDCvHeqzqWf+H25XDTPggVTBJTgUmLgf9Kz3wQ24LOAdxs0CsI2PjWYEtZiIAXGgUm8pLHYvrmPDQ9DcnajC1hNqMPNB1wj3cd3+lmwQ5M6Wqay6Ak6/gPeni/51MIf5Tc07st24ZgP53KsDzZd8eyKlaP0g4UZl//T4ZVGslWMnwyLnprDZKj3liz8ZWUT3s3loAuBNGOT/aAELD2qUMuZET8EzljSIfepETAN5J65ADYF6iccXfigzfk8qlb003yKNfs9p4c+D3Dss4bbKVrsMLUTXJDODwIPMf0AO/DRxhy3v1K09SYU3uRBiGISFXsz82Lzl10h7Rg8ZNuhgZeHs+LriTIc1btAYt1euyJe4uDsFt3eOJ/z4j3XDYMPz0knA7Lb51j3Xq/Raaw8IwbJT4Ez1giJyhiGUyxjJMlR41JBh8W8LpBgCxggYKEEFfnoIPOby2L/LXUpLLtp/qmnWAyB6nviHXWfSAG/50CVKbyAjdJPHZ2uBPOuJY1wYJFP4hFPxJLOL6YWu1O3EesAXTZAsNqGkSw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(38100700002)(38350700002)(66556008)(66476007)(2906002)(66946007)(8676002)(6506007)(5660300002)(6512007)(6666004)(26005)(30864003)(8936002)(7416002)(6486002)(4326008)(508600001)(6916009)(316002)(36756003)(186003)(2616005)(52116002)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXA2RHlKNkNJSWpFQW9ZeDN4NHVRbkw4VlpnUEpuRnJoUVh2bitNSUQrL2sr?=
 =?utf-8?B?Y3pvN3lXQWRlcVkrTlN3eUREdU1rT0N2ZXVzZkhZQmx1K2xFSUx3SzkzWks2?=
 =?utf-8?B?U3hHYnlLbnVMb29oK0xJOE8vMUFiYXNTYkplQnE4M05ZYXZKb3ZtTUlQdHpZ?=
 =?utf-8?B?QkVrV2Yxc0dLY0NKZzg0U0J4dThuVmFWdnZxSUJ6NGRJYkNOalVsTmVPYnlJ?=
 =?utf-8?B?K2wyanIzMVppYlJQeEYrUzU0VlRjajQyaWtnRExMWGhtZWcwcmN4cU1GbWhn?=
 =?utf-8?B?Vis5MExscUxkMmEwV1pBSjBoU2tTbittMDgzS2tNb1c2SHlXUitZUmQrMFUz?=
 =?utf-8?B?aHlPRXZHL0ZXcENKbGZNbm5IOEV6U1RYNUx6MGJqUHVmU2VoKzV1ZXVFUktx?=
 =?utf-8?B?dWZxcGJxdUwyM0tnTDZLMjVBV0g0YmNmdkhjMEZ2ZWpPa0JUd3FKV2lzUG9Q?=
 =?utf-8?B?REdESEhldVpzL0VTWnlubm5aeWVaYSt4eERVQlorTjF2YVkrTFgrRHVWTTJD?=
 =?utf-8?B?a1ZvVmhnQnI5Uk5BL2c2cXprRTMzemVkQWkwTVh6bHN0Q1R5VHBKaFB2ZTZE?=
 =?utf-8?B?Q1pHTTVFTS9iKzV0cWwrMStKU0daaWJOM2hCQ0txeTlDNlY3eUZqc1dIMVo3?=
 =?utf-8?B?ZzlrdDhGaVJTZTBIMFdEb0lXZ1NXUWxhcTRVMWxqeGlqUHZMbU5WbitXMWFy?=
 =?utf-8?B?UkFLN2JXUnpXTnNwU0RWTUZXRGdaekF1VUZoYnU4V01WeUxmTFV1MWIzbm1x?=
 =?utf-8?B?MGVxWTh2YjBCMU5vQXRoTVIvRUpFallLOXhLbFJnQU5rZnhZVWVCZlI5eFpn?=
 =?utf-8?B?aUVNN3dWcWFwdWxKMWgzcUx5WDc0bXNuSnkxNlpXL1o3TjhGNzYyVjVoRW1x?=
 =?utf-8?B?Z0VMSjdUdnQ4MlYvdU54cms5Wkd0U0UrUG5jQTdJemgyY2hncTg4S203elRL?=
 =?utf-8?B?czBhVk92MUEvby9CTVFTSWVkL1ltYWN1SytlMHpkeWk5dXBwRDR0TU5aWUg3?=
 =?utf-8?B?Y1VlTHZ2ZlV2MDNrWkwvSXYweHlDRnhlZHMwaDdUZlVWRndqSkxmVnNLRWdV?=
 =?utf-8?B?NitmWkFUS0dEUDZLcXB1WUFhdU1MdFowMWxtWFdFdHduNWxtQzJzdkFYV0ht?=
 =?utf-8?B?MjIvN0RJTDA4WTBuZS8vVkZIdktKaEdrdlBZd01LN2V5VFhURHQ1WmxST1Ns?=
 =?utf-8?B?MVZxNk1NbE5zNGo1S2UzS3YwalNvcjVvM2Z4TGl6dkhVZ1lEWDdwRVdTMWQw?=
 =?utf-8?B?SDVLai9uMnJVY0E2MEJwZlJqcnMxNWduY0g3VFoxV29NamNWL0gyWHA3cVlu?=
 =?utf-8?B?cmpDblU2RVhVWGU0clNSbGN6S1hRajFUOGNUaDE2SDlET3dGRzY5VnB1bTlT?=
 =?utf-8?B?R3dzZ0pnem9KY1hBMFJ2eFlnS2xWWmNyL2JhZ3BTZDhucjNXcVVXcnBiQmx0?=
 =?utf-8?B?azk5V1cybXpNY2dZS1o0eVJCWVU2dW0xdFRVV3h6ejZyZWVpZDBpeXNLYUtW?=
 =?utf-8?B?Rk42ZGR3U2doQTFoa3EyTkRPeHZJVC8yR0VUbDlXdDJtZG5xVXh2NytmUDlk?=
 =?utf-8?B?V1B5U1lScFNwNnJwR1JOalcwNFFRU2h2aXRwQnV5Z2xQOHJ5UWtrc3IrUi9C?=
 =?utf-8?B?bTZNb3c1WlBESVIzY25pYWVtVkl0b2VVVVVGV29HWkUxUFJJWXRMcDR1QXRM?=
 =?utf-8?B?akxqMy9iSW41TXVxVEpGTnZQZWV3K2Fmenp0ZTZCZnpscXNocGxQL0dSUHI1?=
 =?utf-8?B?VVY1aS85MHZ0VElRaldHV0s0VFB5ajBzUWNBQkZoS2FXem9abjRIS3phTWVO?=
 =?utf-8?B?cXFiTm5XWWhXV2FDZ282WE41RkMyYXRBWDNEUVdHSGhLeS83MHZzZXY4N0lR?=
 =?utf-8?B?UXVlOTlqL2ZNV0ZHK2JXdEhkZ240c1AwTlUrRHd0R1BZRGlVRU1HOWxnemxC?=
 =?utf-8?B?eHM1bzhJS2tKaFhmYXFRQXFXNDZOWlJKT0xvODlpeStxbDA5MmZIbmwyODNp?=
 =?utf-8?B?c0NhMFlWaHFLdTlSM2pVTE82b2dhOUx3R0tCQTB2N3BoeVluUlBVSExSVG4x?=
 =?utf-8?B?L3NwN0tKM281SVY1YkJOcXJ3b3hvSGREN2tYOTlTaDQ5YjlSVmpQbE13MnBH?=
 =?utf-8?B?elliYUxIcUY3bEdFTVRZSWtJbDlDWGhWeGFabDBVSkRBTy9pN1BKNC82V2dq?=
 =?utf-8?B?Q01OaGR5MElqZTBoRExjU2hHUW40Uk9MckNhKy9Zc3M3OVgzSE9Id24vcU1J?=
 =?utf-8?B?akxtTDh0bXVxczFsMWcyeS9GOUcramhkbnZxaWNFNk9ra25obDM5b1BpWWIy?=
 =?utf-8?B?QjRYbXhWOFpqdlNqVjlkeHRVUTVCNEc3ejFZVkl1V3p5UDZzVHhqUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc24d65d-0593-49be-a7f9-08da4a864306
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 02:09:33.9293 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ZnxY/W7yTX3f2ry6pynz9ANC85FPoGg5UYB8wAx5evua3R+pf8CQN9WJZQncl1Z6F8d1hvIs2p4pqdq4Ghwmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5017
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
Cc: andrzej.hajda@intel.com, narmstrong@baylibre.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 lee.jones@linaro.org, jernej.skrabec@gmail.com, marcel.ziswiler@toradex.com,
 linux-imx@nxp.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 kernel@pengutronix.de, jonas@kwiboo.se, s.hauer@pengutronix.de,
 robh+dt@kernel.org, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, robert.foss@linaro.org, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Thu, 2022-06-09 at 12:30 +0300, Laurent Pinchart wrote:
> Hi Liu,
> 
> Thank you for the patch.

Thank you for the review.

> 
> On Thu, Jun 09, 2022 at 02:49:23PM +0800, Liu Ying wrote:
> > This patch adds a drm bridge driver for i.MX8qm/qxp display pixel
> > link.
> > The pixel link forms a standard asynchronous linkage between
> > pixel sources(display controller or camera module) and pixel
> > consumers(imaging or displays).  It consists of two distinct
> > functions, a pixel transfer function and a control interface.
> > 
> > Reviewed-by: Robert Foss <robert.foss@linaro.org>
> > Tested-by: Marcel Ziswiler <marcel.ziswiler@toradex.com> # Colibri
> > iMX8X, LT170410-2WHC, LP156WF1
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > Robert, I keep your R-b tag from v5. Let me know if you want me to
> > drop it, as
> > v7 contains a fix for checkpatch complaints.
> > Marcel, as the fix is trivial, I add your T-b tag. Let me know if
> > you want me
> > to drop it.
> > 
> > v7->v8:
> > * No change.
> > 
> > v6->v7:
> > * Fix 'Alignment should match open parenthesis' complaints from
> >   'checkpatch.pl --strict'.
> > * Add Marcel's T-b tag.
> > 
> > v5->v6:
> > * No change.
> > 
> > v4->v5:
> > * Make a comment occupy a line. (Robert)
> > * Add Robert's R-b tag.
> > 
> > v3->v4:
> > * No change.
> > 
> > v2->v3:
> > * Drop two macros which help define functions and define them
> > directly.
> > * Properly disable all pixel link controls to POR value by calling
> >   imx8qxp_pixel_link_disable_all_controls() from
> >   imx8qxp_pixel_link_bridge_probe().
> > 
> > v1->v2:
> > * Rewrite the function to find the next bridge by properly using OF
> > APIs
> >   and dropping unnecessary DT validation. (Rob)
> > 
> >  drivers/gpu/drm/bridge/imx/Kconfig            |   8 +
> >  drivers/gpu/drm/bridge/imx/Makefile           |   1 +
> >  .../gpu/drm/bridge/imx/imx8qxp-pixel-link.c   | 429
> > ++++++++++++++++++
> >  3 files changed, 438 insertions(+)
> >  create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
> > 
> > diff --git a/drivers/gpu/drm/bridge/imx/Kconfig
> > b/drivers/gpu/drm/bridge/imx/Kconfig
> > index f1c91b6814a5..4d1f027d07f8 100644
> > --- a/drivers/gpu/drm/bridge/imx/Kconfig
> > +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> > @@ -6,3 +6,11 @@ config DRM_IMX8QXP_PIXEL_COMBINER
> >  	help
> >  	  Choose this to enable pixel combiner found in
> >  	  Freescale i.MX8qm/qxp processors.
> > +
> > +config DRM_IMX8QXP_PIXEL_LINK
> > +	tristate "Freescale i.MX8QM/QXP display pixel link"
> > +	depends on OF
> > +	select DRM_KMS_HELPER
> 
> Should this depend on (or select) IMX_SCU ?

Will add 'depends on IMX_SCU'.

> 
> > +	help
> > +	  Choose this to enable display pixel link found in
> > +	  Freescale i.MX8qm/qxp processors.
> > diff --git a/drivers/gpu/drm/bridge/imx/Makefile
> > b/drivers/gpu/drm/bridge/imx/Makefile
> > index 7d7c8d674bf0..c15469fb5789 100644
> > --- a/drivers/gpu/drm/bridge/imx/Makefile
> > +++ b/drivers/gpu/drm/bridge/imx/Makefile
> > @@ -1 +1,2 @@
> >  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-
> > combiner.o
> > +obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) += imx8qxp-pixel-link.o
> > diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
> > b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
> > new file mode 100644
> > index 000000000000..52b9b96549e1
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
> > @@ -0,0 +1,429 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +
> > +/*
> > + * Copyright 2020 NXP
> > + */
> > +
> > +#include <linux/firmware/imx/svc/misc.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_graph.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include <drm/drm_atomic_state_helper.h>
> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_print.h>
> > +
> > +#include <dt-bindings/firmware/imx/rsrc.h>
> > +
> > +#define DRIVER_NAME		"imx8qxp-display-pixel-link"
> > +#define PL_MAX_MST_ADDR		3
> > +#define PL_MAX_NEXT_BRIDGES	2
> > +
> > +struct imx8qxp_pixel_link {
> > +	struct drm_bridge bridge;
> > +	struct drm_bridge *next_bridge;
> > +	struct device *dev;
> > +	struct imx_sc_ipc *ipc_handle;
> > +	int id;
> > +	int stream_id;
> > +	int dc_id;
> > +	u32 sink_rsc;
> > +	u32 mst_addr;
> > +	u8 mst_addr_ctrl;
> > +	u8 mst_en_ctrl;
> > +	u8 mst_vld_ctrl;
> > +	u8 sync_ctrl;
> > +};
> > +
> > +static void imx8qxp_pixel_link_enable_mst_en(struct
> > imx8qxp_pixel_link *pl)
> > +{
> > +	int ret;
> > +
> > +	ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,
> > +				      pl->mst_en_ctrl, true);
> > +	if (ret)
> > +		DRM_DEV_ERROR(pl->dev,
> > +			      "failed to enable DC%d stream%d pixel
> > link mst_en: %d\n",
> > +			      pl->dc_id, pl->stream_id, ret);
> > +}
> > +
> > +static void imx8qxp_pixel_link_enable_mst_vld(struct
> > imx8qxp_pixel_link *pl)
> > +{
> > +	int ret;
> > +
> > +	ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,
> > +				      pl->mst_vld_ctrl, true);
> > +	if (ret)
> > +		DRM_DEV_ERROR(pl->dev,
> > +			      "failed to enable DC%d stream%d pixel
> > link mst_vld: %d\n",
> > +			      pl->dc_id, pl->stream_id, ret);
> > +}
> > +
> > +static void imx8qxp_pixel_link_enable_sync(struct
> > imx8qxp_pixel_link *pl)
> > +{
> > +	int ret;
> > +
> > +	ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,
> > +				      pl->sync_ctrl, true);
> > +	if (ret)
> > +		DRM_DEV_ERROR(pl->dev,
> > +			      "failed to enable DC%d stream%d pixel
> > link sync: %d\n",
> > +			      pl->dc_id, pl->stream_id, ret);
> > +}
> > +
> > +static int imx8qxp_pixel_link_disable_mst_en(struct
> > imx8qxp_pixel_link *pl)
> > +{
> > +	int ret;
> > +
> > +	ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,
> > +				      pl->mst_en_ctrl, false);
> > +	if (ret)
> > +		DRM_DEV_ERROR(pl->dev,
> > +			      "failed to disable DC%d stream%d pixel
> > link mst_en: %d\n",
> > +			      pl->dc_id, pl->stream_id, ret);
> > +
> > +	return ret;
> > +}
> > +
> > +static int imx8qxp_pixel_link_disable_mst_vld(struct
> > imx8qxp_pixel_link *pl)
> > +{
> > +	int ret;
> > +
> > +	ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,
> > +				      pl->mst_vld_ctrl, false);
> > +	if (ret)
> > +		DRM_DEV_ERROR(pl->dev,
> > +			      "failed to disable DC%d stream%d pixel
> > link mst_vld: %d\n",
> > +			      pl->dc_id, pl->stream_id, ret);
> > +
> > +	return ret;
> > +}
> > +
> > +static int imx8qxp_pixel_link_disable_sync(struct
> > imx8qxp_pixel_link *pl)
> > +{
> > +	int ret;
> > +
> > +	ret = imx_sc_misc_set_control(pl->ipc_handle, pl->sink_rsc,
> > +				      pl->sync_ctrl, false);
> > +	if (ret)
> > +		DRM_DEV_ERROR(pl->dev,
> > +			      "failed to disable DC%d stream%d pixel
> > link sync: %d\n",
> > +			      pl->dc_id, pl->stream_id, ret);
> > +
> > +	return ret;
> > +}
> > +
> > +static void imx8qxp_pixel_link_set_mst_addr(struct
> > imx8qxp_pixel_link *pl)
> > +{
> > +	int ret;
> > +
> > +	ret = imx_sc_misc_set_control(pl->ipc_handle,
> > +				      pl->sink_rsc, pl->mst_addr_ctrl,
> > +				      pl->mst_addr);
> > +	if (ret)
> > +		DRM_DEV_ERROR(pl->dev,
> > +			      "failed to set DC%d stream%d pixel link
> > mst addr(%u): %d\n",
> > +			      pl->dc_id, pl->stream_id, pl->mst_addr,
> > ret);
> > +}
> > +
> > +static int imx8qxp_pixel_link_bridge_attach(struct drm_bridge
> > *bridge,
> > +					    enum
> > drm_bridge_attach_flags flags)
> > +{
> > +	struct imx8qxp_pixel_link *pl = bridge->driver_private;
> > +
> > +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> > +		DRM_DEV_ERROR(pl->dev,
> > +			      "do not support creating a
> > drm_connector\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (!bridge->encoder) {
> > +		DRM_DEV_ERROR(pl->dev, "missing encoder\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	return drm_bridge_attach(bridge->encoder,
> > +				 pl->next_bridge, bridge,
> > +				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> > +}
> > +
> > +static void
> > +imx8qxp_pixel_link_bridge_mode_set(struct drm_bridge *bridge,
> > +				   const struct drm_display_mode *mode,
> > +				   const struct drm_display_mode
> > *adjusted_mode)
> > +{
> > +	struct imx8qxp_pixel_link *pl = bridge->driver_private;
> > +
> > +	imx8qxp_pixel_link_set_mst_addr(pl);
> > +}
> > +
> > +static void
> > +imx8qxp_pixel_link_bridge_atomic_enable(struct drm_bridge *bridge,
> > +					struct drm_bridge_state
> > *old_bridge_state)
> > +{
> > +	struct imx8qxp_pixel_link *pl = bridge->driver_private;
> > +
> > +	imx8qxp_pixel_link_enable_mst_en(pl);
> > +	imx8qxp_pixel_link_enable_mst_vld(pl);
> > +	imx8qxp_pixel_link_enable_sync(pl);
> > +}
> > +
> > +static void
> > +imx8qxp_pixel_link_bridge_atomic_disable(struct drm_bridge
> > *bridge,
> > +					 struct drm_bridge_state
> > *old_bridge_state)
> > +{
> > +	struct imx8qxp_pixel_link *pl = bridge->driver_private;
> > +
> > +	imx8qxp_pixel_link_disable_mst_en(pl);
> > +	imx8qxp_pixel_link_disable_mst_vld(pl);
> > +	imx8qxp_pixel_link_disable_sync(pl);
> > +}
> > +
> > +static const u32 imx8qxp_pixel_link_bus_output_fmts[] = {
> > +	MEDIA_BUS_FMT_RGB888_1X36_CPADLO,
> > +	MEDIA_BUS_FMT_RGB666_1X36_CPADLO,
> > +};
> > +
> > +static bool imx8qxp_pixel_link_bus_output_fmt_supported(u32 fmt)
> > +{
> > +	int i;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(imx8qxp_pixel_link_bus_output_fmts);
> > i++) {
> > +		if (imx8qxp_pixel_link_bus_output_fmts[i] == fmt)
> > +			return true;
> > +	}
> > +
> > +	return false;
> > +}
> > +
> > +static u32 *
> > +imx8qxp_pixel_link_bridge_atomic_get_input_bus_fmts(struct
> > drm_bridge *bridge,
> > +						    struct
> > drm_bridge_state *bridge_state,
> > +						    struct
> > drm_crtc_state *crtc_state,
> > +						    struct
> > drm_connector_state *conn_state,
> > +						    u32 output_fmt,
> > +						    unsigned int
> > *num_input_fmts)
> > +{
> > +	u32 *input_fmts;
> > +
> > +	if (!imx8qxp_pixel_link_bus_output_fmt_supported(output_fmt))
> > +		return NULL;
> > +
> > +	*num_input_fmts = 1;
> > +
> > +	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
> > +	if (!input_fmts)
> > +		return NULL;
> > +
> > +	input_fmts[0] = output_fmt;
> > +
> > +	return input_fmts;
> > +}
> > +
> > +static u32 *
> > +imx8qxp_pixel_link_bridge_atomic_get_output_bus_fmts(struct
> > drm_bridge *bridge,
> > +						     struct
> > drm_bridge_state *bridge_state,
> > +						     struct
> > drm_crtc_state *crtc_state,
> > +						     struct
> > drm_connector_state *conn_state,
> > +						     unsigned int
> > *num_output_fmts)
> > +{
> > +	*num_output_fmts =
> > ARRAY_SIZE(imx8qxp_pixel_link_bus_output_fmts);
> > +	return kmemdup(imx8qxp_pixel_link_bus_output_fmts,
> > +			sizeof(imx8qxp_pixel_link_bus_output_fmts),
> > GFP_KERNEL);
> > +}
> > +
> > +static const struct drm_bridge_funcs
> > imx8qxp_pixel_link_bridge_funcs = {
> > +	.atomic_duplicate_state	=
> > drm_atomic_helper_bridge_duplicate_state,
> > +	.atomic_destroy_state	=
> > drm_atomic_helper_bridge_destroy_state,
> > +	.atomic_reset		= drm_atomic_helper_bridge_reset,
> > +	.attach			= imx8qxp_pixel_link_bridge_attach,
> > +	.mode_set		= imx8qxp_pixel_link_bridge_mode_set,
> > +	.atomic_enable		=
> > imx8qxp_pixel_link_bridge_atomic_enable,
> > +	.atomic_disable		=
> > imx8qxp_pixel_link_bridge_atomic_disable,
> > +	.atomic_get_input_bus_fmts =
> > +			imx8qxp_pixel_link_bridge_atomic_get_input_bus_
> > fmts,
> > +	.atomic_get_output_bus_fmts =
> > +			imx8qxp_pixel_link_bridge_atomic_get_output_bus
> > _fmts,
> > +};
> > +
> > +static int imx8qxp_pixel_link_disable_all_controls(struct
> > imx8qxp_pixel_link *pl)
> > +{
> > +	int ret;
> > +
> > +	ret = imx8qxp_pixel_link_disable_mst_en(pl);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = imx8qxp_pixel_link_disable_mst_vld(pl);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return imx8qxp_pixel_link_disable_sync(pl);
> > +}
> > +
> > +static struct drm_bridge *
> > +imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
> > +{
> > +	struct device_node *np = pl->dev->of_node;
> > +	struct device_node *port, *remote;
> > +	struct drm_bridge *next_bridge[PL_MAX_NEXT_BRIDGES];
> > +	u32 port_id;
> > +	bool found_port = false;
> > +	int reg, ep_cnt = 0;
> > +	/* select the first next bridge by default */
> > +	int bridge_sel = 0;
> > +
> > +	for (port_id = 1; port_id <= PL_MAX_MST_ADDR + 1; port_id++) {
> > +		port = of_graph_get_port_by_id(np, port_id);
> > +		if (!port)
> > +			continue;
> > +
> > +		if (of_device_is_available(port)) {
> > +			found_port = true;
> > +			of_node_put(port);
> > +			break;
> > +		}
> > +
> > +		of_node_put(port);
> > +	}
> > +
> > +	if (!found_port) {
> > +		DRM_DEV_ERROR(pl->dev, "no available output port\n");
> > +		return ERR_PTR(-ENODEV);
> > +	}
> > +
> > +	for (reg = 0; reg < PL_MAX_NEXT_BRIDGES; reg++) {
> > +		remote = of_graph_get_remote_node(np, port_id, reg);
> > +		if (!remote)
> > +			continue;
> > +
> > +		if (!of_device_is_available(remote->parent)) {
> > +			DRM_DEV_DEBUG(pl->dev,
> > +				      "port%u endpoint%u remote parent
> > is not available\n",
> > +				      port_id, reg);
> > +			of_node_put(remote);
> > +			continue;
> > +		}
> > +
> > +		next_bridge[ep_cnt] = of_drm_find_bridge(remote);
> > +		if (!next_bridge[ep_cnt]) {
> > +			of_node_put(remote);
> > +			return ERR_PTR(-EPROBE_DEFER);
> > +		}
> > +
> > +		/* specially select the next bridge with companion
> > PXL2DPI */
> > +		if (of_find_property(remote, "fsl,companion-pxl2dpi",
> > NULL))
> > +			bridge_sel = ep_cnt;
> > +
> > +		ep_cnt++;
> > +
> > +		of_node_put(remote);
> > +	}
> > +
> > +	pl->mst_addr = port_id - 1;
> > +
> > +	return next_bridge[bridge_sel];
> > +}
> > +
> > +static int imx8qxp_pixel_link_bridge_probe(struct platform_device
> > *pdev)
> > +{
> > +	struct imx8qxp_pixel_link *pl;
> > +	struct device *dev = &pdev->dev;
> > +	struct device_node *np = dev->of_node;
> > +	int ret;
> > +
> > +	pl = devm_kzalloc(dev, sizeof(*pl), GFP_KERNEL);
> > +	if (!pl)
> > +		return -ENOMEM;
> > +
> > +	ret = imx_scu_get_handle(&pl->ipc_handle);
> > +	if (ret) {
> > +		if (ret != -EPROBE_DEFER)
> > +			DRM_DEV_ERROR(dev, "failed to get SCU ipc
> > handle: %d\n",
> > +				      ret);
> > +		return ret;
> > +	}
> > +
> > +	pl->id = of_alias_get_id(np, "dc_pl");
> 
> Could we avoid relying on aliases ? I'd add an id property to the DT
> node instead, or possibly even better a dc id and a stream id.

Will add two properties for dc id and stream id.
Do 'fsl,dc-id' and 'fsl,dc-stream-id' look ok?

Regards,
Liu Ying

