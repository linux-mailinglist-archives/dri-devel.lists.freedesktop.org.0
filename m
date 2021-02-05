Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1B6310C01
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 14:42:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E4B56F3FA;
	Fri,  5 Feb 2021 13:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2128.outbound.protection.outlook.com [40.107.92.128])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14BC86F3FD
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 11:06:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hougANUl44Wh8dPu8cYD8Sj1mlWjkaCWEFeobFaDEjW7xoL5/HxEr2pQrvlSHDz/EY2UQYzP3PY+3l/yRmdArA/OQkXxQqczmiRh1wlMpubT5UN7SsNqoJOkbypb1qHsVysndd/gPzFZ5wd5NY1VewdXTc+EQ16KLH1z+SdUtR7O05EMlIpFqtLN/LMUO3NJVqaWcR/zNF5H8ALmt1RHEWmLend3CNSnjlEz2Gf7dSu6GVuvu6K4BKaXbH/A+UDspB50E/Ti1B8jZ000xQMQtkt5wO1L67ZcoRUnFikRdXcmnh7J+u42J+tuCM6cUx4/J/9zTgjamdPQ236E61eHVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u5Fbd8YNTbclGD47KVUR5u0Rz0FX4bVEnF5HH0YcnNM=;
 b=dv7xfjjSXl/TS6YlnvhFdtMSpJFToOh3v2FQmVRrJimqYBcqqkILm931683xtZWvDfuHBkSNO58FZ6nXnzvlw9IdA/NrRP5mdHe9Xlgahs52A9sVeEoc2QDsxz8NRsoAp1pjbcds05q8KiApDU1qh3717ChyvpjBxwUgmlbgoSk1Z/Sv/S07iKGcdEQksMtCDg+90Hl5fFAuSFh9+CYT+9ilWh0IgXsSXMmwhWpft9TkCGLhkm372uNFhfT7GBj4DZL8kCMUVsA77jtT/ESNlSSGKcGSuSL85Bu134g4yKhwo+hMdCxR//KNYCM6lvbcZoJh+kdBrqpG4VU7G4sGgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u5Fbd8YNTbclGD47KVUR5u0Rz0FX4bVEnF5HH0YcnNM=;
 b=jaLpt4UIkZ7bVAsXi+5OvINE2xd0lCPocfe2RlcJZMASt39yCFTyxRMlnM5fWVaXf0WipjGPZdVSfa4ssRwos7RUMovgvwc+r6DMJdW8smunk/XQ+UwDr4Ehfcvz/P/SCWkfWVKNEwW1tsdZi2ei0k5C6MHo9JDd2JjnpLOgR3E=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6802.namprd04.prod.outlook.com (2603:10b6:a03:22d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Fri, 5 Feb
 2021 11:05:58 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f%2]) with mapi id 15.20.3825.020; Fri, 5 Feb 2021
 11:05:58 +0000
Date: Fri, 5 Feb 2021 19:05:44 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH] drm/bridge: anx7625: enable DSI EOTP
Message-ID: <20210205110544.GA18685@zhaomy-pc>
References: <20210128111549.GA8174@zhaomy-pc>
 <CAG3jFysU4epjS3A85ZojrJn3TAC78O_jx5p_4SWsCdRBrQ5GXQ@mail.gmail.com>
 <CGME20210204123452eucas1p1eb8fd9dc5b62b036ebd9e9208e796cb9@eucas1p1.samsung.com>
 <CANMq1KAuUTqgM2mDR5WN6Ad+cATFXLPE+5rstyhfNE9Lc716+g@mail.gmail.com>
 <b680fef2-7c8a-183b-443a-6b2b9fe595d7@samsung.com>
 <CANMq1KAVMhFAdy_s4R-h1yzNWXRgWgZ4s9kQL11LDze3+Qv5_w@mail.gmail.com>
 <CAG3jFyu4JvH7iDriQWdwgkVaHH=vjGaVwF3P7DWLRbb19pKxsQ@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAG3jFyu4JvH7iDriQWdwgkVaHH=vjGaVwF3P7DWLRbb19pKxsQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: [61.148.116.10]
X-ClientProxiedBy: HK0PR01CA0063.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::27) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from zhaomy-pc (61.148.116.10) by
 HK0PR01CA0063.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::27) with
 Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.20.3825.20 via Frontend
 Transport; Fri, 5 Feb 2021 11:05:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e213b7f5-acd8-425e-c1f5-08d8c9c6040c
X-MS-TrafficTypeDiagnostic: BY5PR04MB6802:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB68022B3EB085493D222941E7C7B29@BY5PR04MB6802.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pUf1mk7IkufMa658HQ/rZN/hZsnPweiqTXpLqIz2A0ETIW5ZPusdfIqxKA8nnUSGBimT5wnKoE19t5OAhKjikjwy4WhWezZXLF8umVOaCmRdWXluuMRmchxsgzoUwGMZWnyjsP+pZYZdZrnlAObrkj6ADkhVCVCnDoLZZj5Ggyr7p7iBKlHHgg6GPXOhm3Ox1cX6PAn5vS2kGJBjwk7apDPD3JSZETCSBO+a7hTFN+7N3uefhmJ+9M44mU8JePQIsyEd11oLganPQXx+tI01GHaZmFks97PcZXrkQlL3rgb0s4rslmwv9awl2/v3/YVFI9/06AY9jduqFd/Y9tW7A8tVXrhJFX52f01Vsks/6sr8ZJKfFkyVKi3NL4LAVhrg1nqmNWrsNC1LHE3EHSJoih5X7Hw9k6x4CQBnZb3Tm/nxbfYTiLOcF5GUEUj+MmLSD3q5RnhoXj3tHuHeGvWtWrFhiSzSKQI2bObO+5haym8dW2I94ImSfKcu++cuNH9YC+e2k+FObSyZ7vhmXKzH5SjzBC3oIPGX+d8WJCEJDxKVWQf5J07znUITUmYv5+TKv1FD76qTd2BzJzO+Y36Z9r570LlwD6ammP1S+sxNllfStgquWkR4GWO3OG8HpLs6k4q354GD2UPadpPgtSvJMA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(39840400004)(366004)(376002)(396003)(66946007)(26005)(478600001)(4326008)(1076003)(7416002)(956004)(6916009)(53546011)(54906003)(8936002)(86362001)(83380400001)(316002)(186003)(9686003)(55016002)(33656002)(52116002)(66476007)(5660300002)(2906002)(66556008)(6666004)(8676002)(6496006)(33716001)(16526019)(16060500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?QNlYucPettkKYFG6LS8m01H6bWG+pVXY3FxzE0a8iEQNimVbMeNkbf8e7WvB?=
 =?us-ascii?Q?1/BbwZzzf6imGr03z4vSuMOwX/pBbIIN6x6g2gl3ULYa5aVenMiOpv7G1SUm?=
 =?us-ascii?Q?UID22sUhDCramXD1wnbplIbrq8lf1fc5oPeBWxtSrEPq39TUBSFFTbHs6A3v?=
 =?us-ascii?Q?P77cR+GK4k6c9W9F8cA/JClxUj4g0yvEzf4J76TMYJTSaMmH75vExM+I7tx7?=
 =?us-ascii?Q?TA6zkLc90UZoi2X52AQTy4iWwQnWPhqeEhHPcdc7AV8BrGlKh2ItPKW0YVhZ?=
 =?us-ascii?Q?JMA+gsTluIhXd0dwhd0DPCZ7U/nSDMbIZ3ENyY5MVmJfSVHSUd1Lce/wn99b?=
 =?us-ascii?Q?zcecXieCnv1PDXtYgJLJX2f068hDV0io3ObURvqUD3cNF2BKpSc29D5sYiSn?=
 =?us-ascii?Q?LIAQf9fiY7tZ4OvWYj/+5BDxSZn9h3qZMMSQxUj2nHCm2dT3HJvlV6w76+r6?=
 =?us-ascii?Q?JNOuu35tfxgBxGjzombCtD6QuyGsrS8RHc9SmkCc0cStGfO46f6Z0m15Wl3O?=
 =?us-ascii?Q?F+46NbCfYgDNQs4LWUzXNCxRfNpq2GnjR3RA1eHDMm0NQT2oXpxKc6qaXLhM?=
 =?us-ascii?Q?4ggbPUW4hEk48SCLZeTxCuVti/Vk3ihDKjAggfnbKkFcKweQDCevGT+SIZ3l?=
 =?us-ascii?Q?8Yd6npD8qT9QHIpoTIIqceCIcodCgkrSXzDV9VWu964riM6f/xuJw/aBTqWs?=
 =?us-ascii?Q?fD2RMzKx0jM0GWnsSCnCsgkx1LupQze9MBVVfSh7YUkwYjMx0eVjpytgNRIx?=
 =?us-ascii?Q?XBzNYHOXbBIteu38qVvGSi16gFiO6k0AyBgKOI3nh2hf3ZoV99z6Kqe7lglq?=
 =?us-ascii?Q?RbKf2zp2t42VNcUsSQ9dmbXVX/tF+baOwOGTQ1woYX0YbCD5DKKWU6brGduq?=
 =?us-ascii?Q?iVD0eHvAd7V5BkOCF/nmd7zEdngOilpwEZgbItTVkFhfWrbUFDLo1v/y4gW0?=
 =?us-ascii?Q?z3KSWGmZYWf1w9Q3yBv/5u6/QNX6g7ARhRLaX4VynnNaR6wPundd57bRWWZr?=
 =?us-ascii?Q?k+VbnzjjsHTZv2MJnjFNusObk9gmxaXQqf3ltm9OqQlQMY/NxHAOqsFlDObg?=
 =?us-ascii?Q?xOJyywpI5zEDHtA4eWy6c0/LPeiVdpwhl6Do4jQia8E1crMGrh67NsslG/8v?=
 =?us-ascii?Q?AJK++Y8qlnfWrlsozc5Sv1VL9tkjdcHO9ugD6dDxIyOZEqy/ZwGWujwtDaof?=
 =?us-ascii?Q?XaEBl+rnp6zKTRGZliOL7TuRoAhv5O/VhLVSqfiVuqe0bTc5IIcEDEHAnRLR?=
 =?us-ascii?Q?BeXcj1Cm3QhzTVRkg7I8Z0jZIbPhux/EE+RRPMZgANuhuDZfIUD3GhLlzYhm?=
 =?us-ascii?Q?BoZHNKKH4XegnuxzEw/4Zt1A?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e213b7f5-acd8-425e-c1f5-08d8c9c6040c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 11:05:58.4395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E9tL1j0nLhlJeUHM0v0w8MciBiY/bR1/qTrycHOCJYh88BAn+JnDZd/zvXAinPFEj2E/UXKn/4ocGv/e6fBwCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6802
X-Mailman-Approved-At: Fri, 05 Feb 2021 13:42:56 +0000
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
Cc: devel@driverdev.osuosl.org, Nicolas Boichat <drinkcat@google.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Sheng Pan <span@analogixsemi.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Bernie Liang <bliang@analogixsemi.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vasily Khoruzhick <anarsoul@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 05, 2021 at 10:43:14AM +0100, Robert Foss wrote:
> On Thu, 4 Feb 2021 at 23:25, Nicolas Boichat <drinkcat@chromium.org> wrote:
> >
> > On Thu, Feb 4, 2021 at 8:59 PM Andrzej Hajda <a.hajda@samsung.com> wrote:
> > >
> > >
> > > W dniu 04.02.2021 o 13:34, Nicolas Boichat pisze:
> > > > On Thu, Feb 4, 2021 at 8:07 PM Robert Foss <robert.foss@linaro.org> wrote:
> > > >> Hi Xin,
> > > >>
> > > >> Thanks for the patch.
> > > >>
> > > >> On Thu, 28 Jan 2021 at 12:17, Xin Ji <xji@analogixsemi.com> wrote:
> > > >>> Enable DSI EOTP feature for fixing some panel screen constance
> > > >>> shift issue.
> > > >>> Removing MIPI flag MIPI_DSI_MODE_EOT_PACKET to enable DSI EOTP.
> 
> Does "constance shift" have a typo? Should it be "constant shift"?
> 
> With that sorted out feel free to add my r-b.
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
Hi Robert Foss, thanks, I'll correct it.
Thanks,
Xin
> 
> > > >> I don't think I quite understand how removing the
> > > >> MIPI_DSI_MODE_EOT_PACKET flag will cause DSI EOTP to be enabled. Could
> > > >> you extrapolate on this in the commit message?
> > > > That confused me as well, but it turns out that's how the flag is defined:
> > > > ```
> > > > /* disable EoT packets in HS mode */
> > > > #define MIPI_DSI_MODE_EOT_PACKET BIT(9)
> > > > ```
> > > > (https://protect2.fireeye.com/v1/url?k=5bd95ebd-044267fb-5bd8d5f2-0cc47a3003e8-ce9db8ea264d6901&q=1&e=900556dc-d199-4c18-9432-5c3465a98eae&u=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Flatest%2Fsource%2Finclude%2Fdrm%2Fdrm_mipi_dsi.h%23L129)
> > > >
> > > > I'm almost tempted to put together a mass patch to rename all of these flags...
> > >
> > >
> > > Yes that would be good, many of these flags were just copy pasted from
> > > some hw datasheet, without good analysis how to adapt them to the framework.
> >
> > I'll look into it (but that shouldn't block this patch).
> 
> Thanks for clearing this up Nicolas & Andrzej!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
