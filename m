Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F92849775C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 03:32:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC5610E15B;
	Mon, 24 Jan 2022 02:32:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2075.outbound.protection.outlook.com [40.107.21.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 118D110E15B
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 02:32:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dDxaZ6c9hd1y0M8kQo+odBkl1pAqhbv4pN4ir8wy95fq9PDhShzwksJfApCgFK01jvDuC2SeobEByjm9GqLgix4+B0a0745ObriODOQNFnFeF9HgHyRLjY7pdmnzB3iqC+mPqieRGwdquznjOVi2ARl9bd/IezwnVi6M7b5JiJbHojyYhNZUlZMovAQfoRnAIJBIIYuvBcKs2bGflTKo900+Al0DFivKGbSCf7XmuwvcmQjZZevPVlUt5UEdcdXUF0cjw4e2BRDIjwL1Mp46hQP881O3CtSZxkQBYCBjkX5X7WTYHPQCCQ4Ti1Ls3xEkD0DsCmz1gibvSArNrmx99A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdjxUozbbY4+ZRR8J1Pyy8fGsQ1PJcYKWJuoyff7OKU=;
 b=ZXHjSKQ81bA38pV5g52EKE8EhKBXMJzEDHzIMvO04OyzccA1DKmTiKO1DrlJUMKpHL6nSRxMhFs+aV/w9rlfUqHRGk8d2U+UD2eQhAMoVyW7xwobFFodFchQ4e9ZR+LSF818/VsDuNGu4drOmLj5PFnWRmG+SKqd5n4AFwxlyJ3su+FnPtO8wBo0nGDn8HIruKhBxKOlWfxTUgOSR4PSnOkDH0VknNLos1oyiApRUk/gi4gZZWE30b+DBrmd2AMFphSzoII52/4OJ4zx1QHGGoCzJIoEe6IPqF67MwIgVeWMRcjgnuoXoQE5y/R8/lukjJ98CtwRaWI9/vyt2Sphgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bdjxUozbbY4+ZRR8J1Pyy8fGsQ1PJcYKWJuoyff7OKU=;
 b=YXs0wVR1pCkzlN+++uzHiRwsKNCEKz1OJ2IRCDsmubgeKdAuvFPayUwKg1BnbMg2Ozgus32oSjr0o7NQj/76yGuOfrTpZfCZchiOmv+YOnk/v2QW6KQ7h/osar9cdXnz/uDqaOFJbHCdvzi41jPg9sd+OqSYKR7VUjY6tBJV9/k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR04MB4925.eurprd04.prod.outlook.com (2603:10a6:803:60::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Mon, 24 Jan
 2022 02:32:01 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::a5b3:9e5:366:a3fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::a5b3:9e5:366:a3fc%3]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 02:32:01 +0000
Message-ID: <bd5a0d5ac47c4b139ef5eaaaa9dd8a4e5429516f.camel@nxp.com>
Subject: Re: [PATCH v2] phy: dphy: Correct clk_pre parameter
From: Liu Ying <victor.liu@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Mon, 24 Jan 2022 10:31:48 +0800
In-Reply-To: <Ye3TbIj5LMvGVRIg@pendragon.ideasonboard.com>
References: <20220119023714.1498508-1-victor.liu@nxp.com>
 <Ye3TbIj5LMvGVRIg@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0027.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::22) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f41d4da6-84b4-4fcc-eb3d-08d9dee1b390
X-MS-TrafficTypeDiagnostic: VI1PR04MB4925:EE_
X-Microsoft-Antispam-PRVS: <VI1PR04MB4925A41F1973C74F8D52E2DF985E9@VI1PR04MB4925.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hk9j3v7K2MdH8kNhwl3xUVwzHfdGfiN0IGKmqDlpovw+k1uGUfokjG9dzp8PhS/22E9WZ4IOfyf8nYUXmx4vOcuig6gmKb4ZKB+ex2IoPy+pwW42lWGyNCVWDj0A48M350a51lPwk/WPLYqBiAgqOyugBthFFlvIqTnT08ATwG0S1HgaR3p6Xs5ZxXodte6zRV2wFwuLwurcv7Gd7Bvgn7mJ3N14VjQKFoSpCkdq8ZOuSnkxA4zfmLYUz6/u/lfF2uxveRzmvtLkULy+4DCWKDXf/r+Fjqzg2aFQrpqLl/J8NlXYe3dNzLBMM7QJwTSByxVi3Piuz3CR0KNE97nbbu+qmqM5TAX+R8rnJFGYTrPiYtkLQVMcQNkNOhUA/hdWj2ueSvkWm2BrZjpzjVZqHgTpq/jR5RSvlzc7rhqwkgyCr0M8DNVud0X2c8nmv2yFTeKT+QePFoeKuFoCyy0NqU1h/Ln9+XoetN8PU/9wikEwNLzKgajsiulMbCIS5C6Vlfn4e8jKnfyai7Llm7rkVYzcl2R8GB1lXGyjTykZ5wXUXmJJSdGqxkSj7WwLuWiK3Oaz6MSlCzO0FaGpHor1R+gbTM0bG4MCcC//CUCB4KOcR/Nt/+1G2ToWUnfOiA/hE3VFxQ9CnHPUfMKRntFmhyd0eqstqzJqp7hBeyBsnLQRxY4m8m3XjMx+Ltw/nkk6byvYD6hFz1nO5nIYGWbQ4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(7416002)(52116002)(86362001)(8936002)(6512007)(316002)(6486002)(54906003)(66556008)(66476007)(66946007)(6506007)(6666004)(6916009)(2616005)(8676002)(26005)(36756003)(4326008)(38350700002)(38100700002)(5660300002)(508600001)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUxSaDFvVlBOYk1nTlpJcWRyZWZVV2RqbkVLYWFlR3JPMFI3Wi8rbHVHRnp5?=
 =?utf-8?B?UCs3WUp0OUtvVDlZajFJVDY5dWI0ZGxpdDVRMit5RGc2T2YwZlBoUndPanJy?=
 =?utf-8?B?aTUzK2VzMnBnVHdmZURocHlWaG0wS3lsT2lvQjNuUHVnTHlOVTJjUUhHMkN2?=
 =?utf-8?B?N3REMjVmcGFRZnlNRXhueWV5MEVRMUxYR2tMdUFzZmVMSjNYYkFjQlhqbC9D?=
 =?utf-8?B?TDhSNWFOTE5CSVJhOEdDUXB4a2xhbXVZbkZBa0JSZ0d0NnhKT2NkZWxrS0F6?=
 =?utf-8?B?WEtnSjEwR1VOYUFDRGcvSkNQSjRuNXV0L05rUTVISFFWeXVQMVJkaWhsR0hE?=
 =?utf-8?B?amJnYWFrZUZ5WUFtb2xhaGdjR1VjU3RERDg0VXpnN3p3WXdEb3h2VVBqVWRR?=
 =?utf-8?B?N25TdWJQb3kwdk9LUXB2WjFkM1ZOeG90ZEZLbThNdEtCeFFwczZyOWFOK1JX?=
 =?utf-8?B?cmFBbE84bEpBREEvT29wZ0ZnRmJCbXBxcEVzWGRrUDczRkxpVnBxRXpnYlhr?=
 =?utf-8?B?T256Qmdmb2RJcjhKMFR2TWVpbnNDbktodDFQN09KbGloRCt1dTh3Z2hzd3hw?=
 =?utf-8?B?LzVia3VXRkhMMlAwdElSUTdCVnR6c2JYbUJ0Q2JMZXUyNExYY2JUOGxEaUFP?=
 =?utf-8?B?U2dxUCsyd3hiemk5SXprZ3R4b0FubTFKK0pnYy8xWjkrQVQzUXFsdmx2WG9C?=
 =?utf-8?B?eFpHaFRnYW0vVHlkaWQ1Qi9TVXl5Y1dVOVF5Um5icUhFNDJrWTNocGZmS1dH?=
 =?utf-8?B?QWpCVHNOYlZxcitmYVlGKzJGdHZUTVRVSWJWUm81NHBHQWwyRTB0TlRaMW53?=
 =?utf-8?B?RUs5czk1emJ0WVo5dENVU3hjVUdNeHR5ZEFpVklMd3IwdmM1NnR2OFZUcHlk?=
 =?utf-8?B?QWRzeDQ1Q3l6OEJ4Ly8rVGRZN09NWTYwSUhrS2RyNDU5S0s1TzA1QmoyZ2Nl?=
 =?utf-8?B?T0lTV0lnYWFYZU9iRHQ0ZjJYcHpUcTdMOWU1ZlB2aDVwY1dGTERBMUluTEtp?=
 =?utf-8?B?WHdJeHN6SzE4YVZCamtmVEdHUVh2aDNBcU5Jcy9oT01ydmJRWm9hbXRhdzJy?=
 =?utf-8?B?MG4vTzVQbmJYbmxNV1Y5RVJvK3BBT1R3VTQxTWwwbytLOS9iR1F5SUVnWVJT?=
 =?utf-8?B?RUh6blVMRTkyeWIvcFdPcTVOTXIyekxFNnYrK2pWdkdJV2QxeEEreFlvaWRX?=
 =?utf-8?B?YVpMTGc2TVNCcXJ6TGZxVkYyaEpoMkpLeDRwYWx3TlI5ZndxbWNQTEdLSk5B?=
 =?utf-8?B?Z29VNlI0RnlESDAwZDF2TTU4ZlZLbGxodkhaOWUyaU5aN1NOYkNVT1J5c1gr?=
 =?utf-8?B?Q0JVYkViamZWV0x2M3RvVDZxaDQzb2sxUG50R2krR2FlY0ZDNmRpV0ZwWTQy?=
 =?utf-8?B?czhCdzBodE1BUUdPWGdMUDFkMlp5UThTV2JiVjNEYVVMNzdqNW8wWjVySVU4?=
 =?utf-8?B?M2trVEVCM2RqcU9WQjd1N3hCejByZktLUEloanY0QzNTSXlyRk41U2FiVCtX?=
 =?utf-8?B?RTdXeEE1WEh3b3F2VlNiOVFNS3ErcWx6YUNCS29kUVF1OHF0YnlZZWZTNGN6?=
 =?utf-8?B?dDZIM083VWtoN1VqMmltcFFFUmt5eHRZelZESnY4anJmcXlFTlBqRnFXMjVX?=
 =?utf-8?B?bjE0aTJiRjhPd2NPcmFhUFNaTVNoWUoxQ01PdGU5TGFpTmwwU0RFV0ljVG9p?=
 =?utf-8?B?WHVxeTQxZmM3MStKU2dLRGNpOVF3Q2prVlo0eDVqUVJFeDJKenNsQWtkTEpx?=
 =?utf-8?B?R0RqMDVyM0ovUHFXWHRHaUlYaTZTcHJFbzk3UzRaamxjUWRDUVdwdXEzSVh5?=
 =?utf-8?B?WHlFMFdubE9sVGU5OXlreG9QbVZVRXFINGRKU0M2Q2ZieVArRGdzcGRhWE9l?=
 =?utf-8?B?M3RTZEZYNWlLcXVwZ3h2Z2grb0k4eSt2ZkRUV1JlZGJkekt6SWk0b2pTbjVn?=
 =?utf-8?B?Rzg3YzZIZlVHWDVWWFB2TkQyRlEwNE4xdk9EMWxxVlhiS3lCejlDNmhCV3pp?=
 =?utf-8?B?ZEVSa09PajVMOGZ5cVZzcWtMZE1MNG8yK1F2NWRGeVdvZUlXMDY0aFh5Smt5?=
 =?utf-8?B?bk01QVA2MmlwbkZOaEV5TFN2Y0ZTVDdDdlZHUzFrM0o1RUo1eWVFV0h0MWtn?=
 =?utf-8?B?OWpDZG0zT2dXQmlMMDMzN0FseTAzbG1iU203RjFpNEs1QWtrL09iUmJxVTh3?=
 =?utf-8?Q?j4qPRy9s4x0bjuewAyKrV14=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f41d4da6-84b4-4fcc-eb3d-08d9dee1b390
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 02:32:01.3136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XdzrtOtzOKrY1IZtC6UFe1MNxwE3muhqW2Hasmzp2nsLyAjhvgMBDxHfka1s95OvRgv4U/9dbCtB+yeQmqX+2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4925
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 linux-phy@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-rockchip@lists.infradead.org,
 linux-imx@nxp.com, Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Vinod Koul <vkoul@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Mon, 2022-01-24 at 00:15 +0200, Laurent Pinchart wrote:
> Hi Liu,
> 
> Thank you for the patch.

Thank you for your review.

> 
> On Wed, Jan 19, 2022 at 10:37:14AM +0800, Liu Ying wrote:
> > The D-PHY specification (v1.2) explicitly mentions that the T-CLK-PRE
> > parameter's unit is Unit Interval(UI) and the minimum value is 8.  Also,
> > kernel doc of the 'clk_pre' member of struct phy_configure_opts_mipi_dphy
> > mentions that it should be in UI.  However, the dphy core driver wrongly
> > sets 'clk_pre' to 8000, which seems to hint that it's in picoseconds.
> > And, the kernel doc of the 'clk_pre' member wrongly says the minimum value
> > is '8 UI', instead of 8.
> 
> I'm not sure I'd change the kernel doc. Other fields that are documented
> as "Time, in picoseconds" have min/max values expressed in ps, so
> clk_pre, documented as "Time, in UI" doesn't appear wrong if the minimum
> value is "8 UI".
> 
> Otherwise, this patch looks fine to me. With or without dropping that
> documentation change,

I'll drop the documentation change in v3.

Regards,
Liu Ying

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 

