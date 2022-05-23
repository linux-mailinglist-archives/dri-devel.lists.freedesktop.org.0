Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 417485307FA
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 05:13:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B84B310E3C1;
	Mon, 23 May 2022 03:13:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2096.outbound.protection.outlook.com [40.107.243.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39D310E3C1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 03:13:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i00uL/mGpqrdXLDsOdJdihvnKvklHjahQkcTsk1UWx5clsnsxsf9ilxWzeDj4wOjyofdvJjUpXCjPUb+N/SPxyOJBUrUk0hOZbTvDMmHct/NLS1sWw20UmmJa1AbsOMkYCRmCAr83yKnK5eXxJazlGfLkOgIzrQ8aUAw0dQTFeTDIhttXH+Qp9eQnX00TTFN0qzQvYz+TYI5aLj0pXoz1InF/C0TuY3Qx2UPG22lg4RXomujau8qnLntcW+ABw3Z2WBwtORxw5BmA7sRzB1ivLnE/QrPmhyPUJ2iYFFX4EG42yD44X1jmdYses66H+inV5e/YHVvBXr1HyhxJWofQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IVgVqV+8V7u/IE3PKYXbRhUyczjUR7wIKYXe/v5q6ao=;
 b=lYVr1UeOPjOOsmgUypoDQPZh2Xv9EhoidvGKBaan/Cp2M1+S1/ooM6GYYXt1kyA0LP5NZgHn30Pqp5/QnufNYrFjkBgu14cXIokWfhLwxxhu35sAk5kPiw5Ks814Rp/mOsmYp5VgXPFPqynp+Egyaa/mr9bmk7n6PS8yLFsiNC6B3P0tmhQlKd8tKAtYHSkQrCz9GSyzlxBJZs4Nh1nK708EOC2tQhRXTure8jpHTLeYH1Q+S9rc/XA6IubH0Bqr+xFMeSGZ62L1M0l0VIqnfYscWEHQzySerdhW2f27H16cau2eOVSrw6i+wTPndqlk/cU2eWFD91k3WNQeXsknMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IVgVqV+8V7u/IE3PKYXbRhUyczjUR7wIKYXe/v5q6ao=;
 b=c6Tjm+FGFGoeiqNzz86uuy7phnUorclID+V8wyoFQQYzz6p0gWWp8yQ+jTYoeAe4zQqXobkT2sdXWYuMJKZsyJIEJSbhURCSjCxRiodvN9ud1rHBm78bUpckvPCA5SvxA6DvAjjYTErpDvTVSWW8T1jnl2DdTxjXylDjkRtHzgM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by DM5PR0401MB3509.namprd04.prod.outlook.com (2603:10b6:4:78::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.22; Mon, 23 May
 2022 03:13:33 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::ec96:5112:c2d5:9377]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::ec96:5112:c2d5:9377%6]) with mapi id 15.20.5273.022; Mon, 23 May 2022
 03:13:33 +0000
Date: Mon, 23 May 2022 11:13:24 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 4/4] drm/bridge: anx7625: Use DPI bus type
Message-ID: <20220523031324.GA3738288@anxtwsw-Precision-3640-Tower>
References: <20220422084720.959271-1-xji@analogixsemi.com>
 <20220422084720.959271-4-xji@analogixsemi.com>
 <CAG3jFytWGSUM9mevHewdmEe-hq3JgB74s7_f0fsEQqkXr9VUHg@mail.gmail.com>
 <CAG3jFyvEYbwkdGtiNR-6vFEXTLjcyT_viqp9qeVxFTu0PrJEVA@mail.gmail.com>
 <CAGXv+5E1cCNWD98fMDjC38y2UztZd=PNQ+=G=wrBYfoXkswvHA@mail.gmail.com>
 <20220425091419.GA967110@anxtwsw-Precision-3640-Tower>
 <CAG3jFyvTim7P_y2G1Br5j3Pwz4KzvRjWgci_qQ3m_YW=3Bog8A@mail.gmail.com>
 <CAKMK7uFHyYTnGtP+vCzo2Uan90DW-QZpPFPn5S9bQ5aPiY=qzA@mail.gmail.com>
 <CAKMK7uHFGsPMZf2SUF4HDXo3XuOLjP3-DLfyp=gB2qpKR964Eg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uHFGsPMZf2SUF4HDXo3XuOLjP3-DLfyp=gB2qpKR964Eg@mail.gmail.com>
X-ClientProxiedBy: HK2PR02CA0157.apcprd02.prod.outlook.com
 (2603:1096:201:1f::17) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 803b5aed-5a6e-49de-00fb-08da3c6a3824
X-MS-TrafficTypeDiagnostic: DM5PR0401MB3509:EE_
X-Microsoft-Antispam-PRVS: <DM5PR0401MB35099280EC06708F923C34EBC7D49@DM5PR0401MB3509.namprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1/ChsbRHF5ImFL/t+mjmqGWZiJuW33CZFjCMBOH9iS00H9elrXmP3u/wHcfpVvK0p1LfI2ODsuzUwzVZBVxwXcZH0VYonVLtg7VKICkO+Rxxv4MVk070XBRozjtcaEqq72vt8kGZUfC+sB9CS4acCc/ZnAAzVohGeSRkYgI38iqw4ntRFKrBlPYLB4ANTAbd+H0/fC31O/X1yg1AxxXQQysFOUNELFYxMFSkpOLvMsTQ8JgcNad3mWBb/PeZTpP/JZ8dsAHrqJxQJygW5Gt5aQotSWU4d8U4v9B1vxMPqcd+Ycbxo6R59Bv8I9+eRZkqcRniObcLTt1LNiWBDEvEsxr0Jgwlj66PMiUg3UpJjqHMITqW1o/Et7K66dbJU8IgfNZ80Nh2NeuZgRZNAlYrd3UXFRv2aR7ApbR0i1a8JW0THth6uT3RQEo2f+0QXgntTFA/CX3ykLsMr7cHBRgsu1q5jHqy4mZaQqw50XrrNIu1ROomqvfRALkxVe1UUAcd1ornhQ5aBrdOt+/BSxm8stk6mnxVJA5qHVvjW1zJX75KpEAKUYjZeOa2WByazDCWf5nyMVfrfC9q2kgc8IO2jag+DuyZTDWJVNEdoRX8D4tzLDAZEGzARyTl1BjojVV525e3kAGRq296UTgIgLlEoiAwz2rPJXWZQ1m4xHIsCY4JYEX+soOsGul9FCMoHhAd9k9Jqpwyr7O48ejNztjVzJGqYmMpdxDQ/HcCZsQfY0wwEQF22UulaL0IOKQ37/qxyf54mfevo3mE2PiePqrZLYhjdRypskV1TwrJMZ42maQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(7416002)(8936002)(33656002)(66946007)(4326008)(5660300002)(83380400001)(86362001)(316002)(33716001)(8676002)(66556008)(66476007)(6916009)(2906002)(54906003)(38350700002)(9686003)(6506007)(26005)(966005)(6512007)(6666004)(6486002)(45080400002)(55236004)(53546011)(52116002)(186003)(1076003)(38100700002)(508600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PIVf0o0XhooShCnitK4RpeZHwr9AgDe831lWB+dVyuLWGgBJbAMvqNNArIuW?=
 =?us-ascii?Q?0cKPHurJpAgpGe8k3cjxg+C6R56gqdqMTwnwHg+pu1LISLWD0w0JLv99s0td?=
 =?us-ascii?Q?UvtDQAy7PeFLG2vCGdIPr0m19dnRpALvsdEQ0a+dtmjEAbgX8zakJPt4q4Gt?=
 =?us-ascii?Q?T/2GMGiSntHLCDI6HfvFix8GMd3UUujwN+IuQMKy5PXedDogW0GGRNnpZ8Ca?=
 =?us-ascii?Q?PotSYPggSw7fTCmfqolRIw4q/VCsb3YdQw+h+uhuSBHeLxBQ+0CncL+Gs1zt?=
 =?us-ascii?Q?3oOczqRqs3zt0vKnNcVm15DyAcgCgVfj4EskskSpgn9o6UK60qg5GZ1ReqVD?=
 =?us-ascii?Q?PSdvj0q0utCmrJPzLp1byXpCqjJPYC8pBqA+KQZtJ3WLpO6IQd29igjTvskA?=
 =?us-ascii?Q?/9f5JcbHopopGqQWtIItqagrCpY0Nnk5bm/EkvGrhyCOO2JPDCWDS5rUrjRo?=
 =?us-ascii?Q?g0SEdw7XVZwoi/XlaOsZUc+N3ujoj47xOKs4zfk0ZQjhSggno5L8p3scNwR1?=
 =?us-ascii?Q?aM936Cls9WGy6bSPp2JSBKhiuBwH0JXdXAeoO3mv8qA4uB9Yt1TZX7vRm6+u?=
 =?us-ascii?Q?ZeEdYLH60KrBAf66RDUGgBfXZP/geuxahleeE1j3jPVA345AoBpt9O/XLaW1?=
 =?us-ascii?Q?sScr511JJ1s3JR8+6WBb34y/KnQ7ZiyklQvvReEjamGR9Ku5hb+at0sGafXo?=
 =?us-ascii?Q?dFjk8KOh3FW4YgeY4EtxlfW98sI1UTyujBhACH5wZ358oKTClpGLNX4lcuPy?=
 =?us-ascii?Q?bk66yrKK+6W/RESiGTBVzgMnxZSQqPiryh3WBDfUtVC8dortOfpPbXYLdzBb?=
 =?us-ascii?Q?0njD+4P0wd8JuC5hORU1WPSfTwEQozbB/q351NEQ36vNou4gvbVJQyqj5eoV?=
 =?us-ascii?Q?6zEfy/yvbFiuPiKV2a6Z1I7TDXEpceKNgtEbhMz/pd4f4WVus8prqSlAcKWR?=
 =?us-ascii?Q?xMIY09q6LwbWiZFMqtyaiq54NTdnmA8CVgFSLi4JHDmW0+uwGVKro3knk4aR?=
 =?us-ascii?Q?xU+tAP+FcEbhvy+3N4icaAk/OpPbj08sHOD4yv7CAIHUBP1TBac5UYMalZj4?=
 =?us-ascii?Q?ToaTHorOtN65DIo2BizzCotNsD77+6ZUstpXd3TUFAp4fWvVtiLbG1XwFhkv?=
 =?us-ascii?Q?50B8nj8kM7DJL+ddK1HOJlVM2bHUJbs+gk9vaxGlsGD2s9q4JOVIssXpj+UG?=
 =?us-ascii?Q?ixfD17cgwzjDgvVwVE+6uU2Ztb0fbZoSjxKmrgwG8uhNiSBzeIhKb3h6tkl6?=
 =?us-ascii?Q?oU7OJXt4Rlb0dDZdBdc8d+JsLYDK5P1798PP6S7SyV3VaDUDwzRbtdaBWc2l?=
 =?us-ascii?Q?m8hao8TA4L+iZ1uoqLtE9lQaZ/Fv4OWRAnwF8GYmNIQbAKFDoc6k3cmhLxMI?=
 =?us-ascii?Q?BUg5bVs7x1EYzx24r3UYUC1/VkD0MlSMzqjvXq/9MGR7G6wWwokyG/9PydhU?=
 =?us-ascii?Q?wE/8hvg22GMdw0WMfn6F0dpRzm/HPBipTeoVUc4l8MPcniEtjVRBlFwddbbJ?=
 =?us-ascii?Q?isyk0KJAdE5jxxB9tRwysiOESVVa9BtYdwCFMgL3m0vSQ0Yr8bVsvCq9pBL+?=
 =?us-ascii?Q?3+QLRKcZiCwz7VBkXj2zYVyDt7sIFjinNmm9MrxqflKCYo/P71E8AVRRXlnD?=
 =?us-ascii?Q?6gDNtCZzmu24g4TOLNPD8ynFWkKkt9AoAlbYZjOBGsYS8bdWN1KnGM1D2a7g?=
 =?us-ascii?Q?/Ct1Wg+GTgVXhbqoTiDvrbNAqR8l0gdiRHxhpl7lz4hpYj0L1J3AOPBhzMCv?=
 =?us-ascii?Q?xNG6KoHjJw=3D=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 803b5aed-5a6e-49de-00fb-08da3c6a3824
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 03:13:33.6960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 47C/ln+CwoClgbEtS+F7lsSAlPDjjrRKjHrqJqY3B1wD5h/J2xvdkXH/eGRZUYHYsSCtujSSUv2wysi3DIx08g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0401MB3509
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, qwen@analogixsemi.com,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 bliang@analogixsemi.com, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, May 21, 2022 at 06:28:42PM +0200, Daniel Vetter wrote:
> On Sat, 21 May 2022 at 18:07, Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Tue, 17 May 2022 at 18:09, Robert Foss <robert.foss@linaro.org> wrote:
> > >
> > > On Mon, 25 Apr 2022 at 11:14, Xin Ji <xji@analogixsemi.com> wrote:
> > > >
> > > > On Mon, Apr 25, 2022 at 04:24:50PM +0800, Chen-Yu Tsai wrote:
> > > > > On Fri, Apr 22, 2022 at 10:13 PM Robert Foss <robert.foss@linaro.org> wrote:
> > > > > >
> > > > > > On Fri, 22 Apr 2022 at 16:01, Robert Foss <robert.foss@linaro.org> wrote:
> > > > > > >
> > > > > > > On Fri, 22 Apr 2022 at 10:49, Xin Ji <xji@analogixsemi.com> wrote:
> > > > > > > >
> > > > > > > > As V4L2_FWNODE_BUS_TYPE_PARALLEL not properly descript for DPI
> > > > > > > > interface, this patch use new defined V4L2_FWNODE_BUS_TYPE_DPI for it.
> > > > > > > >
> > > > > > > > Fixes: fd0310b6fe7d ("drm/bridge: anx7625: add MIPI DPI input feature")
> > > > > > > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > > > > > > ---
> > > > > > > >  drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++----
> > > > > > > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > > > > > index 376da01243a3..71df977e8f53 100644
> > > > > > > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > > > > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > > > > > @@ -1623,14 +1623,14 @@ static int anx7625_parse_dt(struct device *dev,
> > > > > > > >
> > > > > > > >         anx7625_get_swing_setting(dev, pdata);
> > > > > > > >
> > > > > > > > -       pdata->is_dpi = 1; /* default dpi mode */
> > > > > > > > +       pdata->is_dpi = 0; /* default dsi mode */
> > > > > > > >         pdata->mipi_host_node = of_graph_get_remote_node(np, 0, 0);
> > > > > > > >         if (!pdata->mipi_host_node) {
> > > > > > > >                 DRM_DEV_ERROR(dev, "fail to get internal panel.\n");
> > > > > > > >                 return -ENODEV;
> > > > > > > >         }
> > > > > > > >
> > > > > > > > -       bus_type = V4L2_FWNODE_BUS_TYPE_PARALLEL;
> > > > > > > > +       bus_type = 0;
> > > > > > > >         mipi_lanes = MAX_LANES_SUPPORT;
> > > > > > > >         ep0 = of_graph_get_endpoint_by_regs(np, 0, 0);
> > > > > > > >         if (ep0) {
> > > > > > > > @@ -1640,8 +1640,8 @@ static int anx7625_parse_dt(struct device *dev,
> > > > > > > >                 mipi_lanes = of_property_count_u32_elems(ep0, "data-lanes");
> > > > > > > >         }
> > > > > > > >
> > > > > > > > -       if (bus_type == V4L2_FWNODE_BUS_TYPE_PARALLEL) /* bus type is Parallel(DSI) */
> > > > > > > > -               pdata->is_dpi = 0;
> > > > > > > > +       if (bus_type == V4L2_FWNODE_BUS_TYPE_DPI) /* bus type is DPI */
> > > > > > > > +               pdata->is_dpi = 1;
> > > > > > > >
> > > > > > > >         pdata->mipi_lanes = mipi_lanes;
> > > > > > > >         if (pdata->mipi_lanes > MAX_LANES_SUPPORT || pdata->mipi_lanes <= 0)
> > > > > > >
> > > > > > > Reviewed-by: Robert Foss <robert.foss@linaro.org>
> > > > > >
> > > > > > Acked-by: Robert Foss <robert.foss@linaro.org>
> > > > >
> > > > > Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> > > > >
> > > > > Confirmed this fixes the display on Juniper (Acer Chromebook Spin 311) on
> > > > > mainline (next-20220422).
> > > > >
> > > > > Xin, in the future, please send the whole series to all recipients of
> > > > > all patches listed by get_maintainers.pl, not just the recipients of
> > > > > each patch. In the case of this series, they should have been sent
> > > > > to all of the mailing lists (media, devicetree, dri-devel) so that
> > > > > everyone has the same, full view of the patches.
> > > > Hi ChenYu, OK, I'll send to all media, devicetree, dri-devel next time.
> > > > Thanks,
> > > > Xin
> > > > >
> > > > > ChenYu
> > >
> > > Applied 3/4 + 4/4 to drm-misc-next.
> >
> > This patch doesn't even compile. Can you pls fix this up asap? Also
> > pls compile-test before pushing ...
> 
> Marek says the prerequisite landed through linux-media, and that's why
> it compilers on linux-next but not in drm-misc-next.
> 
> Don't do that.
> 
> Instead:
> - merge all patches through one branch, with the foreign patches acked
> for that merge patch
> - wait until you can backmerge all the dependencies
> - do a topic branch
> 
> This probably needs to be reverted here and instead merged through
> linux-media. Or you wait until -rc1 and then apply it to
> drm-misc-next.
> -Daniel
Hi Daniel, I use git send-email to upstream patch and automatically
generated reviewer list, so patch 1/4 and 2/4 send to linux-media, and
these 2 patches already merged in linux-media.

Thanks,
Xin
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> https://nam10.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=05%7C01%7Cxji%40analogixsemi.com%7C80ac2fb262a5407ded4208da3b46ff62%7Cb099b0b4f26c4cf59a0fd5be9acab205%7C0%7C0%7C637887473373535347%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=lYWBVSLPiHKN%2BYnyWqgeM5cgH17OjxpXGVQ1kt2bZrU%3D&amp;reserved=0
