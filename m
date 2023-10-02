Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7637B5DB7
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 01:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6797910E0C5;
	Mon,  2 Oct 2023 23:27:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04olkn2102.outbound.protection.outlook.com [40.92.46.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB20E10E0C5
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 23:27:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P6LPwDCI1VNvg8RONYn2qRnvxiB87qRbgpm6t4tnooKWbTbNM2NBehGGi5aYdegeIHScRLWlHo9lGasDhaa4OsdPo4pmzvygGVOjpk8jqbqhjF3ZBroOAZpdHnoxydu8z11v/Oc5ZsoY1gvUPprEpWCNSA+LelKpKnYTmVS13X25HuyZlotvIx7G06DV+tHd7diTi7faTxYQACphIiAYUPP1GW2P0enjbFDKPnshAGKBM96zGucd/V+5zJfJZfQZ8dN5atWQmfEyicCVVkKxC2y8MRgVQ/raByXWnyCmwbdgk9pkNevRZes/mUbReoMq7xCQXCtBCp//zWpTmpDEXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBRg8LgMHw5pnExKQkb8R1iNuzrJQQoHjOxQyQafWGs=;
 b=GLv4uvYQ7nJkgKvvSar8WHlwaCc/IXF2mfY7niqtegFDueUfisCtaCS1Rz9rN6Q/0jk37PSGE7ywbkAknFqExMfCp87QSDVJjnffGsPMhEPsI8Ub3SZAmIRgjulgHKkjEYiGBlKapdZrwzW2Yl2BwQomgVIShr94c7E44fCmrNTbzrTOZp8BcG574lF1sBVvAdEHPjstZWfAS2Ev40WPQ8DH6CNhYEFJQsBM7u6V8pRIVpguwT526GkMX3r755o5Ep8pJFtrdMbY52wva97eX0XAHng0lmSc9exR2aK++P7YoaDqDvdvdjIIbJjBlFnSTQ4/hRdfp4OL2JTjRYA79A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBRg8LgMHw5pnExKQkb8R1iNuzrJQQoHjOxQyQafWGs=;
 b=tnfo4kUlvJALWklq6/OV9EjG9V10KlyHXBvzAFoVwUg8JIhcFYAhaVfDeuh3MWRp/GMKCZDoZgohCzO8rRudA0deFyqq8/c4VHd05byhIqVBJnvExEtfq/AHldum7pF48Ft7ukZijkKfV44md1OiPrOkGEkyzhzlANBgOdU63NVOfa3I1m0O9V2eCUacB5ynB5lxyW/+RzjkVcoRHiEiQ4LhisF3R4fsPEHFcaMJrgT34B/NSxYA1HDSkRSbREPAICZKW2DqMnsHLh+afb9O7N/Z7sdxl5EowHxSzTpExfwXvmYt9Yqs/Ns/4QvpL10FVpSQAbzTiV6RcTpX1kUkWw==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by CO6PR06MB7426.namprd06.prod.outlook.com (2603:10b6:303:ae::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Mon, 2 Oct
 2023 23:27:48 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::c40c:bbc8:b103:459c]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::c40c:bbc8:b103:459c%2]) with mapi id 15.20.6813.027; Mon, 2 Oct 2023
 23:27:48 +0000
Date: Mon, 2 Oct 2023 18:27:45 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH V3 2/2] drm/panel: nv3051d: Add Support for Anbernic 351V
Message-ID: <SN6PR06MB5342D22FB6DC47A509976293A5C5A@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20231002193016.139452-1-macroalpha82@gmail.com>
 <20231002193016.139452-3-macroalpha82@gmail.com>
 <c0b56123-7ce3-4975-aa68-ff50a616a578@quicinc.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0b56123-7ce3-4975-aa68-ff50a616a578@quicinc.com>
X-TMN: [r22YtD9pj5CD1RpFK8CYYw7lESwOhbTp]
X-ClientProxiedBy: SN7PR04CA0034.namprd04.prod.outlook.com
 (2603:10b6:806:120::9) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <ZRtR8aO7YtGXpwMX@wintermute.localhost.fail>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|CO6PR06MB7426:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d9e1317-18a3-4be1-14c7-08dbc39f305c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hKpVw0QiHiy37IoJf7tRT9JhGo5gM4N82bcrrZ2V3FIz6N5FJjDKBBHcAmXYnhNFy/xH3VjZmNDS1lxy7tPgKFJAH47B1J5hgjbzRjh9vbgeFyq/X6eOSPQHjYCwPokFNycO33q/JqxUFo4YfLiiE8vzku2fIjiEmf7Dhh/M9Mzyzc7oyHYRbyWLxZ5kDZDIq+pfhpEttJxCDP3pGhQbD7QAhHO56AcpHFB4n27Azx9TlOAnWCOMrlOORU7uqXICs+2CpzPThnigCoQ280kFygeTnbDk1rfuPNBQ1TKATGx76icpNdIVf62ARYMiLcGmYV7R5GligW71+/yomcWuiP5SRXIHhvzsZhU7/mWRPgSZKlmR9oeUm0hEntJaMA6xEdlJJZ4goPohH39AMy6oxy767vY8VAbDCOFlNe45LjHqW8YEZ3lE+nUYL1R+Jt7dHrE/Z++Ls+/hqg78JnXszCD3tq/2rdBDHrr1FDNS784CdGqCpKPran0IqcCAWt0zJ5BL/11WpNu/BvusyzRyc0JBHEencbIYDmEYqZinkK2mZpr7YZAzGOCkPC4OyOjh
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ar3rIdOStjHn2lopvD3fJcTgmJXwCL8ISguywLnaUB5eeXkmPn/n2vcq/NJw?=
 =?us-ascii?Q?0MM2HzpDW8JAFR6KYhHRMa+bEX3+Yj4FxrZSJb/cvWXy4zRtdgEmxjwL1oKg?=
 =?us-ascii?Q?D0stFbSOnKrOvliztNh7kg15Sbs8h5Rx2OBdAPQBUwbFl0gshn3hQFVwwabO?=
 =?us-ascii?Q?nb1wHcEy2myFbY2MvEyOfbu6ygwBPZ/H9WyQHhLAkIwYJlkiDi2DWnH62D4J?=
 =?us-ascii?Q?LabhMViyBcd1v5Tc3h0xnITBqBNZIRJKq0Z0GpfuJFls2wWyLpPVK3xfjGsW?=
 =?us-ascii?Q?uHqpToG7597J4IH/rPq0RfBAhop5UpOLJPNNp3Ca/V7VV2y5+TmpMgu0WKnN?=
 =?us-ascii?Q?0i7Mn6CiPLyjJE+G96F96SbiRBy4CS0lzmhI3jqHEaGjsIkWaxsDeSa+eqhE?=
 =?us-ascii?Q?AwCXpgIIbSgtAxb7OVtt1m0nTnMjr9PkST9w/jYKkPieCzMfJwpWzNThPU61?=
 =?us-ascii?Q?VDwtgAHHPLXFSTPU+9hpsTzA9KqQYPWe8+R2TdbhjNO8D0khAcg8Bv/1oyKR?=
 =?us-ascii?Q?tkUcb5tyYNyJNCkCbsDBraTPBjoR24kg2UulPisbizGtM45cld7FwiE/x7pO?=
 =?us-ascii?Q?vOhdI6wR5V7xnGT2wPWX1YBiwISHZO97dYgIgyVOO2wZnuBM0pMAKWcFfgtL?=
 =?us-ascii?Q?YSBemGcxluQE7X16vqsCPld0snYENKGznhvAwMiEhm1i6G1+X7Gt0rvRC8i0?=
 =?us-ascii?Q?gSRoJKxcfvfOYyE2zARmpoL9hNf18UnbFVq+ocEgAdhObBh1Jk8t0j1xFHyd?=
 =?us-ascii?Q?FqAp41on8bsAmxu6Lodcj9SbwcAL2jhYdbaxBqx3TOdQLKwQ1q+NSwVZXUcw?=
 =?us-ascii?Q?8JoRLQr9iFV8lnXr3oZTiV99M2Q6lByaqN78F5ga0yjja6UjxbSDkU0RXVOg?=
 =?us-ascii?Q?xkB7Hq0Nj3yO2TelaqBfrJAM7fT6b/zLDCsMjj9xBX9W26RXliwJv4IwH/cf?=
 =?us-ascii?Q?IPZGMtr4GUcdNqs7V69Of7NyMXqKeZjsp37nWactuEjudg3hr0+fOMX3tXlL?=
 =?us-ascii?Q?PhChqWRPCPhufyqVvKkgnb67NvX77vaVS3zgY71CsmKcns6pyDihhgs23sOu?=
 =?us-ascii?Q?kXxWgtx+D1nIiTJrjcR/VwpSHAsjEroQDoOJXuO3UzjGHxAGdJ+Bq9PKoTGR?=
 =?us-ascii?Q?GtwcVU+VuZbXC2HzXh80Jhn4r4i0Gp8Xf/+vtURrw4wn7Ng7nvH2ZKcmP4Dw?=
 =?us-ascii?Q?Lvc9vGDof5ZMobKviWRxZQdkLd4hyYQlBtQuzQG63+v/FA1n6IkxBBoDEaY?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d9e1317-18a3-4be1-14c7-08dbc39f305c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 23:27:48.7695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR06MB7426
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 02, 2023 at 01:33:03PM -0700, Jessica Zhang wrote:
> 
> 
> On 10/2/2023 12:30 PM, Chris Morgan wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > Add support for the Anbernic 351V. Just like the 353 series the
> > underlying vendor is unknown/unmarked (at least not visible in a
> > non-destructive manner). The panel had slightly different init
> > sequences and timings in the BSP kernel, but works fine with the
> > same ones used in the existing driver. The panel will not work without
> > the inclusion of the MIPI_DSI_CLOCK_NON_CONTINUOUS flag, and this flag
> > prevents the 353 series from working correctly, so a new compatible
> > string is added.
> > 
> > Tested colors and timings using modetest and all seem to work identical
> > to the 353 otherwise.
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >   drivers/gpu/drm/panel/panel-newvision-nv3051d.c | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
> > index ad98dd9322b4..f644dbc8ee8a 100644
> > --- a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
> > +++ b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
> > @@ -354,6 +354,7 @@ static const struct drm_panel_funcs panel_nv3051d_funcs = {
> >   static int panel_nv3051d_probe(struct mipi_dsi_device *dsi)
> >   {
> >   	struct device *dev = &dsi->dev;
> > +	struct device_node *np = dev->of_node;
> 
> Hi Chris,
> 
> Thanks for the patch.
> 
> It mostly looks good to me, but just one question here -- why not pass in
> `dev->of_node` directly into `of_device_is_compatible()`?

It was an oversight on my part. I'll modify and resend, sorry about that.

Thank you.

> 
> Thanks,
> 
> Jessica Zhang
> 
> >   	struct panel_nv3051d *ctx;
> >   	int ret;
> > @@ -388,6 +389,13 @@ static int panel_nv3051d_probe(struct mipi_dsi_device *dsi)
> >   	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> >   			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
> > +	/*
> > +	 * The panel in the RG351V is identical to the 353P, except it
> > +	 * requires MIPI_DSI_CLOCK_NON_CONTINUOUS to operate correctly.
> > +	 */
> > +	if (of_device_is_compatible(np, "anbernic,rg351v-panel"))
> > +		dsi->mode_flags |= MIPI_DSI_CLOCK_NON_CONTINUOUS; > +
> >   	drm_panel_init(&ctx->panel, &dsi->dev, &panel_nv3051d_funcs,
> >   		       DRM_MODE_CONNECTOR_DSI);
> > -- 
> > 2.34.1
> > 
