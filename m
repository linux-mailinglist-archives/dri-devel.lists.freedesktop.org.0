Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C28F64E9304
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 13:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC1610E176;
	Mon, 28 Mar 2022 11:10:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2132.outbound.protection.outlook.com [40.107.223.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A23C410E176
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 11:10:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a3g6dAOEB/t2ME19LTMLsbz1/f3M+YgH4cD6N+Q0ine1ce2io88Oho9PiyfXfCWNnE/T82aq88yxefTCcCCy7nJ/6JMnz7Y9MDpkheDrVb0X3V7QZex9FBNHGtRD155YmtpNkcfIXlkoVBIvWXZiV58E6/dzXJBnv6SzJwm9GMVhXdLPfINq94WHtP2YLK3oFB698LG4tWSUtFwSxLuh3+t7QaB6HwxzbblkvMbrzQVb9yBV+g70a///TGVtxCcPwJIfb5Phs2vL37eiT3higVLkglNvxQ5mcvybql/+Io6UTvDfBafB1113+MBVw3CGtL1W9bMMKyUHDSTiZ/y7og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6sbpNeXmNpSr5vPMTrAC3T7SpZF1OiyvCZUrjDUgRFw=;
 b=LMeOOFSwwAXIJllQmUzP0orFbqHTGYo5l00XYt4KAvaGANwSk6yzXhbPDBTZKg8jUK+BaCe9cFMjFbNtZ8Ww7Y0QN9IoU/+SYgGg4UCTWVS7I3J9CaT+wqP1hBgLz9Z4u/95hUzMSukeHAXEFfyGScq6as+bB6J7soG/ZQTHg2ie5XMs3QXr1q0V0tZlIBsFlxcBL6arVZp8PLGZlbXD8JwMaIzUPi1FbcZSq0Y4PtOB4UbkY9yZncV7gVsr43W8tblihvSaOl32IKSrQr4LudIndk06e1drA2rF3Cr5m9qOi/h8sT3/QTac44iQAEQ07Uccjc+xwZ3z3ZJauryYqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6sbpNeXmNpSr5vPMTrAC3T7SpZF1OiyvCZUrjDUgRFw=;
 b=qSDSocQ9lfTuaiBJSLHBsoaPBW7NaLQSGEE2hLwWqWd+M+1PLFRKWrTG1hmsHx0gp8jQE+giS5cJRU5Ym65baQ+kkuXVsCuBCQZswvzqfBddMv3pfbyZuahPJSlW1bhV8/3KKOJK20NbSL2ndS5s7B1IOpShsIrhbHAEH8oJ178=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by DM6PR04MB5371.namprd04.prod.outlook.com (2603:10b6:5:103::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Mon, 28 Mar
 2022 11:10:12 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::a865:6d10:c4a9:1142]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::a865:6d10:c4a9:1142%9]) with mapi id 15.20.5102.023; Mon, 28 Mar 2022
 11:10:11 +0000
Date: Mon, 28 Mar 2022 19:10:04 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH v12 3/4] drm/bridge: anx7625: add MIPI DPI input feature
Message-ID: <20220328111004.GA1536268@anxtwsw-Precision-3640-Tower>
References: <20211105031904.2641088-1-xji@analogixsemi.com>
 <20211105031904.2641088-3-xji@analogixsemi.com>
 <YiTruiCIkyxs3jTC@pendragon.ideasonboard.com>
 <YiWiYpEfTOOqgyAN@google.com>
 <CAG3jFys-BYsBp07AAFQ2O_TFsXOwhcVDnsOh8WVNNSag3HZw+Q@mail.gmail.com>
 <CAG3jFyu47cv8oSecONM95KVoP=NOvgwafAp4TQ33CZ0Y4zWmnQ@mail.gmail.com>
 <20220321115226.GA1484106@anxtwsw-Precision-3640-Tower>
 <CAG3jFysvDa2FS3NS6f2sXAid_TmrXyb9vCADN87v=mJ-txGp0A@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG3jFysvDa2FS3NS6f2sXAid_TmrXyb9vCADN87v=mJ-txGp0A@mail.gmail.com>
X-ClientProxiedBy: HK2PR06CA0014.apcprd06.prod.outlook.com
 (2603:1096:202:2e::26) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2660b9fa-ed0c-471d-9f1f-08da10ab86c2
X-MS-TrafficTypeDiagnostic: DM6PR04MB5371:EE_
X-Microsoft-Antispam-PRVS: <DM6PR04MB5371B14AE61B7BCBBFFDB93FC71D9@DM6PR04MB5371.namprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CzM/HsqOMbhRIXjgDt58pdavNSogl1KZcTkRThleGuFg5+ddC4oLTgNaX+jIRm3D4GsKq0FCIpXLytZTpXLvwIuoA2ObV4+2vRlBCwCnFaYlFDYjaAkXN+XRdd+K3Fib9pKL+iW0GWfkPxEnKZ2PmZsi67EmtnSN48Z/0v13Jj1M4omj5B5z3jELb/L50fO0YgG+d+oAosBzDTVGoL/psX3mEphNWYqAJ8aNsBscw353U695wsASONak2CkSQ0P8XLcpcnnokdo8Q+DzDOXotG2HpE7N256NBqGCnGYoRwjeiudBynj7ix08YUciHHc8obi7ziDpkjnTSGomDmxJaTHIohDcOtv5Bo4SBQ6S4AJw/WO2oZmfZT/hfuxV8NVdEpLnxgdgeyKsXd9hzwBdzzBMiMnu5VuGyFLPctsJEdX85N/xy3xrBZQj7fxMGHsNPB43pDm62nPamIaNMUgmIQBOhjAnZBDPm9moqmGCcCrJQ1W2lubuaEVvluC3TcxVlPL2v6zhsCNxqaBUOT4Q3THLUzF6VSoMgm7AoLBIKfeU/LaYtCo46LjoFhDUeaTowogHU/Uadr7C9WawSD1LprTUhfrTtgZ7fxulYJOEfZ1WWEr9FLsTl5noxCiQ70PYftYzLK4iL+m1VrCqOZ/G+Tl55y5Zjj3kTvAg3DEltKc00c4Ziim1uyVwPhuGxosGmOzC+2BVFl654cY8l8A5F0HJRDWz8PCMr/+b+BLqCLVMpTQZ3xb0x5yVURyFc/R7s4B9aDtXM8/+gM0pjwXKm7ulGPG/EGuAduYZQj0F59c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(6512007)(6506007)(508600001)(6666004)(7416002)(66476007)(66556008)(4326008)(52116002)(8936002)(55236004)(66946007)(5660300002)(9686003)(316002)(86362001)(45080400002)(966005)(6486002)(8676002)(33716001)(6916009)(54906003)(33656002)(83380400001)(38350700002)(38100700002)(2906002)(26005)(1076003)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d7dG3m2kltuI4hyam+uIKuF7Bgc5rIA1YWWkWVEQfZ27XwjtdL9asShH56wA?=
 =?us-ascii?Q?pG0f2eFtt3oPxqKTeLi7PErxKuP18RJiZ43F3rjsggdHlYf9m5HevSFlgnof?=
 =?us-ascii?Q?ftniNFOQWoohTeuYiVBHb0RYQZMtZr6ZxGBw8ChsRPU/7I3GzuMXzmskFQIJ?=
 =?us-ascii?Q?oMfmDGdZaVl+fFrPC/3ThqZoxRmyPgtAy1kRHFy4mD96l5qMadLr0RlejBbo?=
 =?us-ascii?Q?25CbNgQcbmLSjvYGRziEGx90XxabdDOZyR8FLhDBGiyRj1isVpaahX51ih6w?=
 =?us-ascii?Q?QZb6fBAhlC2D+KOkytpiVK3CB1ZFEzOAO/JVhjLJgurJxkPoOdj3y2OqDRSZ?=
 =?us-ascii?Q?kVQgufNbPHqvyB2MWwOCgxOvNtIv6gl3wQC1l0PcOo4EXyM8CvV7aD8Dlf/m?=
 =?us-ascii?Q?cXPT+N2SUWLTp6PRJqJfvH2v66XPb4le/TcpPdy4VdjXdyEr24QaJzCxhrrD?=
 =?us-ascii?Q?A6/QLzGjZttsYvmw/tLorxlwOX3DnDtOlvE0vKP/IKbj0wSzQ8awl6ujKUit?=
 =?us-ascii?Q?TBKefhNb0wzXjOiItWuUYot2CpKBxr5P7Y53kjP+SOu4D3FV/+ImdXx6Nlhw?=
 =?us-ascii?Q?yf7JbRUp8orfDFnxkLrp+9rHmPHjuOxC8whN1Fklye5ITGbnbYhu+jZlrXfO?=
 =?us-ascii?Q?C/Eb5yK/DBQLCjBopyDjtelwj2XVDH4cu/CuA+yblr4d01sJBBPsLKl9Vfbo?=
 =?us-ascii?Q?KvZzTCH0nBhzi8b8QFKjCF65dNsjf1SCooBwexqI5va4gRi8PCIXQeFNGyaz?=
 =?us-ascii?Q?RCFeGAFFXoopzTKHBXVKj2XL2cUpkha3R3cojcRCAnan4/9lNshlPZNrsnkO?=
 =?us-ascii?Q?KyL6FDF7/tWfp432HCrBGxb3nYYYZscee86u/yRgqq5VIS823hgJeJYdi5BM?=
 =?us-ascii?Q?h9E+dXTrX0cIpphHNo5ayOLp7RA4k8dD2cpa/nJn0jeQSiPlM8I5JXCOab5v?=
 =?us-ascii?Q?/bd2aBCPgObJRGjvDv1D/99nfJfybehKJ686SU5OWIasf52sQnDmCmnPo/yc?=
 =?us-ascii?Q?WdFjXXpJTxVnTZX8L4USMvDaxp+Gg5BaiCJFd4JfZAmf2CySqSNZQepEcvhH?=
 =?us-ascii?Q?WJKTNQPx8s+KOlNquiIcyucxAwo1cr2PJyllkQON3Nt9JAX4YqqwU3R6DA6r?=
 =?us-ascii?Q?gTHbXFJmgLK4oV9hzwIyj7T9sh8fFgjwqhIkYf/9BuWhMAhHHDXSQEzrA76A?=
 =?us-ascii?Q?kbaWDkenXGJqg29qRve4gJPE0DdvCqtxb/PQGUI9W2pWXWXH4vbAVTjA7bxt?=
 =?us-ascii?Q?yUYh/3sj916vfLn8jk2G/CfxdLG9uA6SZCVjxUZ/P6GFvVaN/bZy1TRjZ3FW?=
 =?us-ascii?Q?HAfPnb6Lu6IirjYCoG7+HU4ntuxjyCEsZ6ZvDdLzwna+6TvSJvEzC7BM6rp0?=
 =?us-ascii?Q?kkfkB2ob82N9ZSVLHaIs7C3Pfz58LpkqE4/lhr48S/e+R3ySS9DUrJMuAOrY?=
 =?us-ascii?Q?By2WJUHN8F3rOCFm6JAImgsZTA6rlyDN9C95FRi2J4HN6qWiRgc4sdAq6fAT?=
 =?us-ascii?Q?AhSKsQp+TW7ApveX7I2fOoj1Oy53lfihQbXZI96GJlj/QN5INgXRcRHQLK5O?=
 =?us-ascii?Q?m1xmVv8prRxB6VkpKkBsKUrdLvBYeB77RPVTgAMTneWiUO9/j/mDrcleOrY5?=
 =?us-ascii?Q?7N/aSGzG3HG3w+0Qp+o948PSHXZU0e8VQRbGt7h+t83NRAX//2KDVNWz0Bov?=
 =?us-ascii?Q?nbklUurKGnAEs1YBUjntIHFXohca4GIDy5CNifRPCVG5fnKemWpoFWQN24j1?=
 =?us-ascii?Q?AWP/R3rhbA=3D=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2660b9fa-ed0c-471d-9f1f-08da10ab86c2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 11:10:11.5512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eqb9rfruL653M0A0ErAF1UNsYfnsvOgUIOVkhogghfYhCIuOoWMAhjpg7OLRxyzmVtij/NefBrwPngE9DIDe9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB5371
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
Cc: narmstrong@baylibre.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 bliang@analogixsemi.com, drinkcat@google.com, sam@ravnborg.org,
 jernej.skrabec@gmail.com, tzungbi@google.com,
 Chen-Yu Tsai <wenst@chromium.org>, dan.carpenter@oracle.com,
 devicetree@vger.kernel.org,
 =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
 jonas@kwiboo.se, qwen@analogixsemi.com, robh+dt@kernel.org, maxime@cerno.tech,
 pihsun@chromium.org, hsinyi@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 28, 2022 at 11:54:12AM +0200, Robert Foss wrote:
> > > > > > > -   DRM_DEV_DEBUG_DRIVER(dev, "found dsi host node.\n");
> > > > > > > +   bus_type = V4L2_FWNODE_BUS_TYPE_PARALLEL;
> > > > > > > +   mipi_lanes = MAX_LANES_SUPPORT;
> > > > > > > +   ep0 = of_graph_get_endpoint_by_regs(np, 0, 0);
> > > > > > > +   if (ep0) {
> > > > > > > +           if (of_property_read_u32(ep0, "bus-type", &bus_type))
> > > > > > > +                   bus_type = 0;
> > > > > > > +
> > > > > > > +           mipi_lanes = of_property_count_u32_elems(ep0, "data-lanes");
> > > > > > > +   }
> > > > > > > +
> > > > > > > +   if (bus_type == V4L2_FWNODE_BUS_TYPE_PARALLEL) /* bus type is Parallel(DSI) */
> > > > > >
> > > > > > This is not correct *at all*. V4L2_FWNODE_BUS_TYPE_PARALLEL has nothing
> > > > > > to do with DSI. DSI stands for Digital *Serial* Interface. If anything,
> > > > > > the V4L2_FWNODE_BUS_TYPE_PARALLEL type would map better to DPI, even if
> > > > > > it's not an exact match.
> > > > > >
> > > > > > This patch has landed in v5.17-rc1, along with the corresponding
> > > > > > bindings. As DT bindings are an ABI, we should really fix this before
> > > > > > v5.17 is released. There is no DSI bus types defined in DT, and adding
> > > > > > one as a fix so late in the v5.17-rc cycle seems a bit of a stretch to
> > > > > > me (unless Rob disagrees).
> > > > > >
> > > > > > It would seem best to revert this series and the corresponding bindings,
> > > > > > and retry in v5.18.
> > > > >
> > > > > There is a DT patch using this property that is already queued up for 5.17
> > > > > in the soc tree:
> > > > >
> > > > > https://nam10.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F20220214200507.2500693-1-nfraprado%40collabora.com%2F&amp;data=04%7C01%7Cxji%40analogixsemi.com%7C450c5609d8c24e9a34fa08da10a0f126%7Cb099b0b4f26c4cf59a0fd5be9acab205%7C0%7C0%7C637840580680816692%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=bARYbwXq6IJGxn3UBp%2F75lZhoTpzmZkTQsN0yvs7Cgg%3D&amp;reserved=0
> > > > >
> > > > > merged here:
> > > > >
> > > > > https://nam10.safelinks.protection.outlook.com/?url=http%3A%2F%2Fgit.kernel.org%2Fsoc%2Fsoc%2Fc%2F32568ae37596b529628ac09b875f4874e614f63f&amp;data=04%7C01%7Cxji%40analogixsemi.com%7C450c5609d8c24e9a34fa08da10a0f126%7Cb099b0b4f26c4cf59a0fd5be9acab205%7C0%7C0%7C637840580680816692%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=lt3Tp8DveE1RJ%2F1MqDzYdKtHDxIyqhBbur%2Fm4N432AI%3D&amp;reserved=0
> > > > >
> > > > > We will need to revert that one as well.
> > > >
> > > > I just submitted a series reverting the dt-binding change + the
> > > > related commit to "mt8183: jacuzzi".
> > > > Can I get a quick r-b/a-b in order to get this into v5.17.
> > > >
> > > > https://nam10.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F20220307154558.2505734-3-robert.foss%40linaro.org%2F&amp;data=04%7C01%7Cxji%40analogixsemi.com%7C450c5609d8c24e9a34fa08da10a0f126%7Cb099b0b4f26c4cf59a0fd5be9acab205%7C0%7C0%7C637840580680816692%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=dgA%2BrQ3KBMPLoR5bwL5Wt2Vs6EuNy%2Fh9yfOftxeUXjM%3D&amp;reserved=0
> > > >
> > >
> > > v2 of revert submitted.
> > >
> > > https://nam10.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F20220308094911.2680291-1-robert.foss%40linaro.org%2F&amp;data=04%7C01%7Cxji%40analogixsemi.com%7C450c5609d8c24e9a34fa08da10a0f126%7Cb099b0b4f26c4cf59a0fd5be9acab205%7C0%7C0%7C637840580680816692%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=vIcCvXrwZs8XhXuoQ8On7vB9%2Bwrsov1DD5UBX%2B1G93Q%3D&amp;reserved=0
> > >
> > > Xin: Will you spin a series that adds DPI support and re-enables DPI
> > > for anx7625? Additionally, "mt8183: jacuzzi" will have to have DPI
> > > re-enabled.
> > Hi Robert Foss, I'm little confused, do I need resend this serial or
> > send a patch based on currently define(V4L2_FWNODE_BUS_TYPE_PARALLEL)?
> >
> > And use V4L2_FWNODE_BUS_TYPE_PARALLEL for DPI, other value for DSI
> > setup?
> 
> V4L2_FWNODE_BUS_TYPE_PARALLEL is not meant to be used for DPI, but
> rather is used to represtent CPI. So another enum (something along the
> lines of V4L2_FWNODE_BUS_TYPE_DPI) needs to be defined, and then this
> series needs to use this new enum.
> 
> I'd like to see the following:
>  - Introduction of V4L2_FWNODE_BUS_TYPE_DPI
>  - Reworking this series to use V4L2_FWNODE_BUS_TYPE_DPI
>  - Reworking "mt8183: jacuzzi" to use V4L2_FWNODE_BUS_TYPE_DPI
> 
> Does that make sense?
Hi Rob, OK, I'll prepare the patch for review.
Thanks,
Xin
> 
> 
> Rob.
