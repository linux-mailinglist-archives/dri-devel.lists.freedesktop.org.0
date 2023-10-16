Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E69BF7CB27D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 20:27:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 500B810E239;
	Mon, 16 Oct 2023 18:27:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12olkn2027.outbound.protection.outlook.com [40.92.22.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD0710E236
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 18:27:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WVeRnHXFOTeM5PyNS+iGvEiA//K4GBKJgHY9dgA6QvrknZ0/puZGurrsD6ArCi8WSPdKhENVP9yXhbDakaMx7LqgTK2Y8XyTj39g4ugHDE+ecwtmaUtLpUtYmWTFSXdwMK2evTwBn0LCf07s62FC7yTUb5AShUBjxO8DZdaoY5NP9P9vVBDH/Nrzur24gfeqIpCuF6/TVQJkMzVz1KRl8aNdaa8kMnGstVg/59oLzYbZW0oCvad4nkcEvQfeUWGyaB1dCbJ+PoW+k2YLqgMdbGkL6eK3JSN2AHBZPZQFk0fp047+6CQD2QWBeGd93WnxCfJB17ExXkFUi886d5HmlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NvJ4mfik3XzEi/okf1swtRB4K+RlxRRGjhOGzAREJew=;
 b=ELhnGqv7P50pr+H4NA1X+VcZIKx+X1SdpEEjfADfHdO5XYdiZv4y7emPGKAnB4G2y2m/DgwLuSHMtucFRkS2D1pkBE81uRTsIMiasse6LMahifZOvkzZjONvbUcADhGzUIuz21MT4o6mETVXyMY253dL3Zps/Bc8s5fWKdlcAlFl5FqLIB2gRTQdeoF7fQcLOJbgSb6RJVBooskrT8Ufu46d4xot5o1BC0fKPXHfp9kRpgUi1sEKksZuN/oyC7phdonMz0hQA8SeVJ6rGK7yjALl1iv/FsiGETk5km1xUOLjxn9hwZfNegfRU0j648wFnmOSvvKLuS9Cpk7WQmgb+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NvJ4mfik3XzEi/okf1swtRB4K+RlxRRGjhOGzAREJew=;
 b=Fp7TXLtPYn0mUjTvGS7o2N4Zn5Sn804r+fyIbPiZDzNmthBpm8/52Bhjt6xTJPwk2+Pa6VuTHvVpz1G8ohnBY88VQHlG7GALHSVV0k/WV+rT612VMpZz+VLWK2K1SytrwVuWeqBe5lAaNuA+OiPlqvDA6dkZlwhNmcx8ON8jS1Zec+jNoMWT3zu3LpZvIKOtZshQBnqkAMRwXf/g8jfpkzAK1lCv0iHC7xm6dEpfsVqj+UNzrb/KpbwZMIIB85ElUrsyIiXntz51Es9uruUXA4DjWB7tUCholRDFc8dEkK49Ij69qq4/CknRICS2bgJarxpR0ke4cLYjmLltf6ZYhA==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by PH7PR06MB9041.namprd06.prod.outlook.com (2603:10b6:510:12c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 18:27:01 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::c40c:bbc8:b103:459c]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::c40c:bbc8:b103:459c%2]) with mapi id 15.20.6863.032; Mon, 16 Oct 2023
 18:27:01 +0000
Date: Mon, 16 Oct 2023 13:26:58 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 3/5] drm/panel: st7703: Add Powkiddy RGB30 Panel Support
Message-ID: <SN6PR06MB53428A7534F1AB449688AA67A5D7A@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20231013183918.225666-1-macroalpha82@gmail.com>
 <CADcbR4+i_B26g_gLrjTm8dxVzprb-WHRrx=r07wKhcJuei+96w@mail.gmail.com>
 <e52152b6783e3fce9aebb64a553c6922@manjaro.org>
 <2140189.3Lj2Plt8kZ@diego>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2140189.3Lj2Plt8kZ@diego>
X-TMN: [3FMJltSazDMsTNBWqX/5n9uRmOQr5BMP]
X-ClientProxiedBy: SA1PR04CA0017.namprd04.prod.outlook.com
 (2603:10b6:806:2ce::22) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <ZS2AcgCVHNJj/iHZ@wintermute.localhost.fail>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|PH7PR06MB9041:EE_
X-MS-Office365-Filtering-Correlation-Id: 0129c36d-066e-4fba-223e-08dbce757d3d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m5/yBApDdhOKlQPt9E1EK01hFPb3jDhNMjt/xvgaNhbyVaBHnFDHcRdkqQbSQus+q2D99GDM8uCSPhIhB1k1XeGSVoWwcibCKd8tCYQLV172hHRrHxcsMIPDBnIc41ogmEwFuEKIHgmv5yPuUmXLIXi9Liug7KQRNGhXVt4pLN0NkCptzkKaehK58D+oLJ87nSvJIDHYoWdyyYLOTGl3yU4FVc15o31KvCKVy4I++FSBFIlo+9u/Sdx4mKjJWg5LVfGfBNAnIJ2NcCfG/Q+SeMoZ7CmHYbqv+sZks4QEhZ5lOP+KRj7ceLX73yqp8mLz2uFiJmJgMY6JHE2dV8rewdrrD6Ys8UIkrycmcImdmSZOvqlbVSz/nlIcUDAush2THuWk45VpM5UfHF/LNFJYpHwY4CuOsiK2kMKAy5jyNpLrFTMufJlNzWVUH4513ZKc2DGD43ugndGa7VIHZUOFnmK8Az5KxXQYbZcE2nrPaflCHlvFTKAgii2KBGtaOiVI/X6dwtVFZViM9hT1etlgEIumylmGiPwyRJXH6gzfEO4=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEV3RzNudkcyU1VLc2lIbTBiUG5BajJFQlppb0ZVdmJ1WEsra2J5L1lzNVJX?=
 =?utf-8?B?b1FxTEpTRHhIMTFNYkwyMnJXclVaUDBFbHVrbE90VS9xKzR3b2xUbU5CcnVT?=
 =?utf-8?B?VUptNUhhSmxLQmlPN3M2ZExYYlF4TERqZ3poYWJOeGtaaG1lOWtBRzhpRWVL?=
 =?utf-8?B?RkF3bzR0MkZQV0tkM0N1K0NOalZNeVpVVHh6d3NrbXpEcXFvRURKZEQ2RE84?=
 =?utf-8?B?bXpOZEZsWW84bHhCUWxtV09WRTNwVytJSGx6aXhNRTh2aUFSR3lJcmZwSHJ4?=
 =?utf-8?B?S2t0S21UMFdTV2hGR1ZOYmhLajc5TTJHclpCbUJ5cHZiRFBSWDAyT3ltQ0FR?=
 =?utf-8?B?cVJHQmh3UWp3ODA0NGExa2JHOC9kaXlJRGx2amJyQVQvbTM0b0RFaHlFNXpm?=
 =?utf-8?B?VWVaTFkvNDNSTlN4SWpvTXl5b2U3RURkTUUyU3FVVzBNdkU2YnlPdllXU1M3?=
 =?utf-8?B?UzROVU91NWF5SksxNkUwb3djY21mNzhqYnFTRjlmNnpaeiswVkIzT0I0U0tJ?=
 =?utf-8?B?R3pQUlhqQ1lvbXVKVVFqaEV4NC9zRVBHaW1DZnc4OFJRaVJxZjFPT1l3eFBQ?=
 =?utf-8?B?SC9tbWRPNVlFazk3RzVneVRxaW1FMEMyYTQ4QUZtcloyOFB5aGkzK1dPN2ls?=
 =?utf-8?B?MWkxc2dUeHlicTV3ZTQ3SUlBNDZ2RlRUVUN1NEJFNGxSb3JkOWMyREhnaEl1?=
 =?utf-8?B?bGdYbVBWVlN2NW44TDNacWN4K25qaC9DOFF3TWYxa2Z3cko5ZitwOHdxdGpx?=
 =?utf-8?B?NlNWQVEwUElyZ29DLytldVpEQ1Q3K1U0WlFlbTdqNFhpeUpFL0RBM21nWkVq?=
 =?utf-8?B?V2F2bmdPN3dqT3dXaktkTTBNTkFCWUt3ZVFtVG5vNzQvNUR3K0V6ZW81RkZ1?=
 =?utf-8?B?WThsTkRHZ2FvZ1B4ZjJFdWxocllvL01MN1Z5RjBhZWlTVU1zemdiL2k1V1N0?=
 =?utf-8?B?YWNaQ1BPTkMrdEVwY0VMKzlXUFpLSmJCd0Y5NnZVbGZISU9ydUdMNjVPb2Y5?=
 =?utf-8?B?Ym83L0pXMXRDeU5MVmRqZk5uNjcyMitoWmk5amF3ZXF3SXZsQnBheUdML3gx?=
 =?utf-8?B?ZU9LQ1FTNkVYMnNYSExkYXViT202U2R5TmxGaTZTTVQ2WTY1QzRmc2swV3RM?=
 =?utf-8?B?R2ozckF0dVNsVkoyVGc5RzRjWWd3OVJxNWQzenQ0Y2oyVS9KOE4xb2krSFI0?=
 =?utf-8?B?eThBQW9HaDNaaStJMjJpWHVTQ1NtMmpEWXR1TE5qS1ZSbVFXaGxJVDZkYUhv?=
 =?utf-8?B?Y01KaXpiQ2FMaTVZaTcxTTkwMG5vQnRxajFJZHRPZ3BsSTMyZjdNTkdTZXRX?=
 =?utf-8?B?dUVka3ZEVWU1NngvRU1OUS9lVFk4U25NbkVuYzFtTytmdlQzei8xM3lsM1RF?=
 =?utf-8?B?QWNmZFBZVmFQbEJneWNQOXc3d2JGWGRBOUQyT0R1bWl1bFNqZEJhUHNFanVa?=
 =?utf-8?B?OVNYclRDdTdLaTJjazhUenEyOGhWRVllN0JJVzd1M29WTHI4Z2d4YTE1Z3pk?=
 =?utf-8?B?NkpZQm9SL05PVmI5YkRpT1RPVUUraVBWaXpMcVRoR3oxa01vL1VPd2lVdHc4?=
 =?utf-8?B?V0w2Zm4zTEV5UFlBSlBDSTgvNFNvN3lpNWppSGhLaHB4MStXNjIwRVF0cjdB?=
 =?utf-8?Q?zkpU0ZrdHftBN1XEf174yttHNXWMzC38XBhg3tw0WwQo=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 0129c36d-066e-4fba-223e-08dbce757d3d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 18:27:01.7951 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR06MB9041
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
Cc: megous@megous.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, kernel@puri.sm, sam@ravnborg.org,
 neil.armstrong@linaro.org, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 Ondrej Jirman <megi@xff.cz>,
 Guido =?iso-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>, jagan@edgeble.ai,
 Dragan Simic <dsimic@manjaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 16, 2023 at 08:18:25PM +0200, Heiko Stübner wrote:
> Hi,
> 
> Am Montag, 16. Oktober 2023, 18:07:52 CEST schrieb Dragan Simic:
> > On 2023-10-16 17:52, Chris Morgan wrote:
> > > Confirmed that those pending patches DO fix the panel suspend issues. 
> > > Thank you.
> > 
> > Awesome, that's great to hear!  Perhaps a "Tested-by" in the original 
> > LKML thread [1] could help with having the patch pulled sooner.
> > 
> > Links:
> > [1] 
> > https://lore.kernel.org/lkml/33b72957-1062-1b66-85eb-c37dc5ca259b@redhat.com/T/
> > 
> > 
> > > On Mon, Oct 16, 2023 at 3:41 AM Guido Günther <guido.gunther@puri.sm> 
> > > wrote:
> > >> 
> > >> Hi Chris,
> > >> On Fri, Oct 13, 2023 at 01:39:16PM -0500, Chris Morgan wrote:
> > >> > From: Chris Morgan <macromorgan@hotmail.com>
> > >> >
> > >> > The Powkiddy RGB30 4 inch panel is a 4 inch 720x720 DSI panel used in
> > >> > the Powkiddy RGB30 handheld gaming device. Add support for it.
> > >> >
> > >> > TODO: The panel seems to not resume properly from suspend. I've
> > >> > confirmed on the other ST7703 based devices it works correctly.
> 
> so this TODO item could go away, right?
> I can remove it when applying the patch, just want to make sure
> all review comments are addressed - only the suspend thing it seems.

That is correct, but let me send a v2 of this instead. I'll remove this
verbiage among other fixes. End users wanted me to see if I could get
this panel to run at precisely 60hz, which I believe I am able to do
with the addition of a new PLL clock in clk_rk3568. I believe I have
taken every constraint detailed in the datasheet to heart for the new
frequency I'll be requesting. By using the frequency of 292500000 for
the VPLL I can get the panel running at 59.969hz which in my view is
close enough to the ideal 59.98hz.

I also accidentally left the UART2 active even though this device has
no exposed UART port, so I need to fix that too by disabling it.

Lastly I'll add my tested by to the dri-devel patches as well.

Thank you,
Chris

> 
> 
> Thanks
> Heiko
> 
> 
