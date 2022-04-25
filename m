Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB1E50DC27
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 11:14:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B2EE10E00B;
	Mon, 25 Apr 2022 09:14:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2113.outbound.protection.outlook.com [40.107.94.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD4310E00B
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 09:14:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LRRvslAW776ddlYfoW001JUElwalR992gNioYeqXsLB0x/mPmIQ8htZWIdjxncJfeJqKdgc8jFLiWhPnmPf3QsaaD5UfFLJ6PBq+WA1WvnZMlxf4+yuANYndHX6QmQ8+6eNbxY2tJNkPzoIEolRUVqhG/ce4C5bOlFZImXzklSGbQhbbc5/dAG9V/24AJdsoXz+baVYqHtmNovrU1ruj80zpd7TzNbLyTY7Dm4AxqEwkgnW1dSfWFfJzQwB0EioGOTvc9WR2peaj8vsrBhNFuK3IC72fshkl6Wkab6TcQvat7HMITDChdBLXA0/XIi8jyjIvbjohPSQtBJ+0e7jbxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SwOrSybOzWSr5qWMNPDEpPPILVMRXcVS2oipLakb7QA=;
 b=DVLdBKWJwLew9KiuAa1Xlk8pDYykaUg0z6WW5T3urxqVtl82cU5aGpa5c2bMLHR7xSwLeSwu4NmooJpPGyN5ZtG51HRbinfbKEmYF05g9LyItDQ+kVcNKYEDX+AGeQ8HgNhIt7buetride0rTd9uAG2UHiYn6QA91QKZjONHe84zaMlkMnSzzDSGk7i0Sr1fKfTw0GV/eYVe1a9EkIQu4FEe1bA0SDcE2PsIHIB37nZTakiU/w4XAK+CucDL3OiLccccLkir6jdDfGK1T2l9Soe+uvivKTsLo7XAHEHN6QJ0/NHKn7xtP1Y5pQr+fhQCh5mauffTvPhwfgLlCRpdxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SwOrSybOzWSr5qWMNPDEpPPILVMRXcVS2oipLakb7QA=;
 b=BQDO1RieY2E3iJqYz1FBhFW+RaKraWgkbVqErKbm+rFUuYqiPfCOVIFe4ablYF7fl100hEA1uOV56qaHE2E4UbZok1O+ueiMBl8C+4PvYx7AXiQMTIO5eThx8FrvLZG3VBQXBLPbc5FsTHr+R2WhE24e5CXQndzl26qaKsW7y9c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by CO6PR04MB7746.namprd04.prod.outlook.com (2603:10b6:5:356::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Mon, 25 Apr
 2022 09:14:27 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::e9ba:4c90:6e9c:39f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::e9ba:4c90:6e9c:39f%4]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 09:14:27 +0000
Date: Mon, 25 Apr 2022 17:14:19 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v2 4/4] drm/bridge: anx7625: Use DPI bus type
Message-ID: <20220425091419.GA967110@anxtwsw-Precision-3640-Tower>
References: <20220422084720.959271-1-xji@analogixsemi.com>
 <20220422084720.959271-4-xji@analogixsemi.com>
 <CAG3jFytWGSUM9mevHewdmEe-hq3JgB74s7_f0fsEQqkXr9VUHg@mail.gmail.com>
 <CAG3jFyvEYbwkdGtiNR-6vFEXTLjcyT_viqp9qeVxFTu0PrJEVA@mail.gmail.com>
 <CAGXv+5E1cCNWD98fMDjC38y2UztZd=PNQ+=G=wrBYfoXkswvHA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGXv+5E1cCNWD98fMDjC38y2UztZd=PNQ+=G=wrBYfoXkswvHA@mail.gmail.com>
X-ClientProxiedBy: TY2PR06CA0014.apcprd06.prod.outlook.com
 (2603:1096:404:42::26) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ef4eba5-0ddc-422a-376e-08da269bfeee
X-MS-TrafficTypeDiagnostic: CO6PR04MB7746:EE_
X-Microsoft-Antispam-PRVS: <CO6PR04MB7746D0314A3761D3766D4FDAC7F89@CO6PR04MB7746.namprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BI5qR5z1/9MP5U5njOQyDDFmTkj+A0xeNKRDUoCt9OTtaZFuMcHa6B2jAKOGoH50X8bU7U4AhSz7lvZ6Mu0q+9UHsv3ncka0w8zZZV0AmxI92JO0L5FeqteAcqPYAkrRnDa72XZA/5IsWy+5UMgEHgJhAKcxJcBMHViOFOlf6yNzTOWioxpuJR6/2NNHch0ENBx1QFsMtQYS2M3GT8Gj3PzxyBOoDz9XDEXv5APhUMTCyXXvOFJojCuLrzxjon+f0IEmY1hhE/smfUjLUJ1v4U3+HAHSgtfjbwqKKynWYSsmj2Q3Y12nkHBDLFlZqc6/HxJPgcGM2X4zyI1KrZyRrKzctm4K33CX/IdjxYzoAofhB54AxLQlKJuf1411sZzOcp8wK1z1eDXpwoKyXtOVSEvOS2kISkmmG7H9ZP9Q/fRp+jTG6P0evEunFBhek2BHr4vp7j+drESSpMPWa1EhLa8V7D0hefFwxCjVNNsg7qsyAO2y18MViTJqSvO+UPd+NkPwtvpEBevHen+rIxOI9CVHw/d2e+VzQmK0IhJZ2mJBF96bxWTHd7OZGgSM8Zee3hftpIw0aILsDEPIwsGUmnFJmgreqdjXEq6FjqXRG2xOPfTBw1PK2zlmJCuyJJCllPM177/jcwAokUgmoBBmVEpHLOVLkBxUabkeV2iJV4IwXj9soFwlJBNchQ8pg2jdyGiZwaaeNfceqHzZ1l+dXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(8676002)(4326008)(66946007)(66556008)(53546011)(55236004)(86362001)(316002)(38100700002)(6916009)(54906003)(6506007)(6512007)(52116002)(9686003)(7416002)(186003)(8936002)(2906002)(6486002)(5660300002)(1076003)(107886003)(38350700002)(66476007)(33656002)(26005)(83380400001)(508600001)(33716001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XjfmbmGxeuIzjlWvpZQTiU35q9qI11XOrEFSy24Xh2g1NhiUbbi8DbjM1lux?=
 =?us-ascii?Q?nSkDXss+L7qLjEdwQeeOaZ7Thx/gRUkT9EYRtBsw/CgMSw/dShmyFFFHu+tH?=
 =?us-ascii?Q?8iRBBHCqSPXZjaIWMKzgMRUUApTPaB8lXCU68F1mW7STYbOV2TRGB/DcU6Mr?=
 =?us-ascii?Q?KCCzJEoKs6SMw3FM9LEAk26PSAZ3wxvKerMRdGFh1J5bmmk0tBDY/w4FFgH0?=
 =?us-ascii?Q?6aWIpQD2CINpyhv0kap1fiCaKVzpANklTa08MiSt4VdR9B+ZbMr3bmhQFl0b?=
 =?us-ascii?Q?FmDE4qQcfBpY8nGeDRYTEur0awYBTDrki+N/rNBal8V3cTxaUnqiWKHz03X5?=
 =?us-ascii?Q?kCgyag8+pUZ/V+Dfh2L82LJaQLKXpkmiuD5UrVwcOgfRKWihF2nRzSHfM9YG?=
 =?us-ascii?Q?bu89Y/dPBz2NAgL8EJAGMiL1mE/XsIeiKT/Di03cmXyQRf4hmwoyNJst72ll?=
 =?us-ascii?Q?G5s0QbpAgmNC7rF+UaX2Z7+YxeGIcACis46RTJUhcN/1qlN7x32glEjEn/NX?=
 =?us-ascii?Q?CI1ZeFAMfl5HtTVozDKAxcpPjK+jr5gIZV8QZG2aVlsrPjjyZ4QQ1oPqaK2r?=
 =?us-ascii?Q?6VrSrzmAh1cnaIsODS+w0PvCqnsPJCOjbXnUGk/rQbrxeEsOSJANrTIdFD0H?=
 =?us-ascii?Q?mCUc72QCjGwUD49ez6tFngGniWDPrWBgzO+O9RcIBdJTXga9QiCjvzZlQqgE?=
 =?us-ascii?Q?Ufo5zVI6e0dKeZDrj8LcIE8IJz5QX54J9/3rzmITh4qcUhdxPKo2VRDXrO11?=
 =?us-ascii?Q?EXDjEDHnBAWVjhmHNse+8Inng3lmJN3B90Y77IRxD5r8IdEDhIN2owLIqHYJ?=
 =?us-ascii?Q?CCgXlN47C0NCqVOVV96DhSviPrCQvuPkzwrAwWlGmp0aCSjboczXwn/uuZgn?=
 =?us-ascii?Q?ZrWl+YmSHgUCMDUL66RiE/jSjMBFq9QLH/J02xpUmf047MDZGDtaPNF2uGHb?=
 =?us-ascii?Q?wkapdFJbSkKzeWq0KEo58ST97eMc0F6/JBWH4gVaphegc7/r5tjFzMQrQoxn?=
 =?us-ascii?Q?e/LvlN8clye7bSxqhPfWRhpY8Z/4JAgywT8XOzEG8TF2vBJgfrq1vPEuuv5v?=
 =?us-ascii?Q?IOg0OYoz/o7YiCFdDYlYLFsPF4pqVIuRRORGcDHMrGqEVIwdISO8xjheZ8PH?=
 =?us-ascii?Q?IkO83EZRWah2xUu2TI88L0GuSVNbMnVTSo1SMnVImzs58MNiaJ37AaLSiirz?=
 =?us-ascii?Q?VO3tSlUh7ekMYK1FCrvD9TecvMZNIx7FZGbJvEVJvb2tIjh31DTTO9FA+LCD?=
 =?us-ascii?Q?pPk7a/neTPCMNTG8zk+NaBf1lxXcvyYHjwIf930D6twx9UMe+LBs8equH6Ca?=
 =?us-ascii?Q?GBJL+/mGxv1rKarNRrA0L2dQLdGbVBa9HdvV4fCvKmjr7mvurSAUfAy2hm2k?=
 =?us-ascii?Q?NU7io7D73b57B0xuqlrZdrOtxU4+9OUgTV8pzSmGd9EcEhfoG5WR+S32Smxb?=
 =?us-ascii?Q?F44EgZBO1QQ8iqYsGWDFWg/Alj4aJ0D7N1QGp4T5NneV8cM8V7tbFLiYQIvN?=
 =?us-ascii?Q?dnMsxS1YReKBTTuGXtc0O8oG/QZV0AApclklj7cawcJsR4r3WGLmvGhkHamm?=
 =?us-ascii?Q?QBPyL4Kv9DZ/U5B81S56TlSuf0/bdr9poCf1Y28NyftpAa/mePtCzwE0eJeg?=
 =?us-ascii?Q?61ut4XXWYauI62RglsY+mhHlLQOe8zT1IptiDHR6tfjhCvaRYy21OSVTPUmW?=
 =?us-ascii?Q?pdzXjbTN/sHhCgelfAkenMFPkC2E5e4kQIGkvUY8CVA05DoBikYGis0Hd6Q1?=
 =?us-ascii?Q?rYZPhihwuQ=3D=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ef4eba5-0ddc-422a-376e-08da269bfeee
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 09:14:26.8438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2h5y7Dsb29MTh0JSgqbM65WIpEarE2off2yB1SvWdC6sp2VGqIccmUz4N9yOT3gv6vQ1GvnLk0SrkPYcBNeAIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7746
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 qwen@analogixsemi.com, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 bliang@analogixsemi.com, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 25, 2022 at 04:24:50PM +0800, Chen-Yu Tsai wrote:
> On Fri, Apr 22, 2022 at 10:13 PM Robert Foss <robert.foss@linaro.org> wrote:
> >
> > On Fri, 22 Apr 2022 at 16:01, Robert Foss <robert.foss@linaro.org> wrote:
> > >
> > > On Fri, 22 Apr 2022 at 10:49, Xin Ji <xji@analogixsemi.com> wrote:
> > > >
> > > > As V4L2_FWNODE_BUS_TYPE_PARALLEL not properly descript for DPI
> > > > interface, this patch use new defined V4L2_FWNODE_BUS_TYPE_DPI for it.
> > > >
> > > > Fixes: fd0310b6fe7d ("drm/bridge: anx7625: add MIPI DPI input feature")
> > > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > > ---
> > > >  drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++----
> > > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > index 376da01243a3..71df977e8f53 100644
> > > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > @@ -1623,14 +1623,14 @@ static int anx7625_parse_dt(struct device *dev,
> > > >
> > > >         anx7625_get_swing_setting(dev, pdata);
> > > >
> > > > -       pdata->is_dpi = 1; /* default dpi mode */
> > > > +       pdata->is_dpi = 0; /* default dsi mode */
> > > >         pdata->mipi_host_node = of_graph_get_remote_node(np, 0, 0);
> > > >         if (!pdata->mipi_host_node) {
> > > >                 DRM_DEV_ERROR(dev, "fail to get internal panel.\n");
> > > >                 return -ENODEV;
> > > >         }
> > > >
> > > > -       bus_type = V4L2_FWNODE_BUS_TYPE_PARALLEL;
> > > > +       bus_type = 0;
> > > >         mipi_lanes = MAX_LANES_SUPPORT;
> > > >         ep0 = of_graph_get_endpoint_by_regs(np, 0, 0);
> > > >         if (ep0) {
> > > > @@ -1640,8 +1640,8 @@ static int anx7625_parse_dt(struct device *dev,
> > > >                 mipi_lanes = of_property_count_u32_elems(ep0, "data-lanes");
> > > >         }
> > > >
> > > > -       if (bus_type == V4L2_FWNODE_BUS_TYPE_PARALLEL) /* bus type is Parallel(DSI) */
> > > > -               pdata->is_dpi = 0;
> > > > +       if (bus_type == V4L2_FWNODE_BUS_TYPE_DPI) /* bus type is DPI */
> > > > +               pdata->is_dpi = 1;
> > > >
> > > >         pdata->mipi_lanes = mipi_lanes;
> > > >         if (pdata->mipi_lanes > MAX_LANES_SUPPORT || pdata->mipi_lanes <= 0)
> > >
> > > Reviewed-by: Robert Foss <robert.foss@linaro.org>
> >
> > Acked-by: Robert Foss <robert.foss@linaro.org>
> 
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> 
> Confirmed this fixes the display on Juniper (Acer Chromebook Spin 311) on
> mainline (next-20220422).
> 
> Xin, in the future, please send the whole series to all recipients of
> all patches listed by get_maintainers.pl, not just the recipients of
> each patch. In the case of this series, they should have been sent
> to all of the mailing lists (media, devicetree, dri-devel) so that
> everyone has the same, full view of the patches.
Hi ChenYu, OK, I'll send to all media, devicetree, dri-devel next time.
Thanks,
Xin
> 
> ChenYu
