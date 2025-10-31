Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B95C6C24F31
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 13:15:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C4710EB44;
	Fri, 31 Oct 2025 12:15:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UsSBwXkj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011022.outbound.protection.outlook.com [52.101.65.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A2A10EB32
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 12:15:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I7FxcFksLvOqCYF9Xu3pSCTsmw5Ncqkockba9zE5u428VNi4JhuJRmWMlkGodnWKAK/McQZaLpBlj3IR6P0Gn3pq2jT208nM2cUBeDcoiKxVGjNt+/sbQbhGDDSlA/FSpd6LAHjYHlRDmYGNXS+xNuka8jW8vzV74q9udPv1bmzMUEH0GpCyPvzjakThK16EIpaUVxTNDK5jW2emjU7y/ItWkVw6CXxBFi8hRCipZQb8gsUkPkiLjvWmHNrGVQVxl1JtGZL1NoLuxGs/4QRSjDpvDO+5Ipg45Q/53Ro4tEjlBJKu0PS8Q+G0HfBvRmicroPcNMIIGYKWwj77wON9uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QFtWnMg7Uhet9d3YnVeZ4EL10kP2OkEq2Wh0jKXZQ8I=;
 b=orX8ws3c2sPY2DgL1bF+iVwvQdSVFwVTWFoD4kyf11E5RP5FRtpxm4A1Gcyhe36Uf1mLoi6nzMOi/Ft8IkzINRgrfczWTzvxJDHM9UHZKhv4+biiZI8lfjMoPw/Uh12MFw/AoXVRZ9+d0NWrlL394eAt4EXyYDp/1Cz6dil0d6FtMJQSZf5m85q5UUF8pMG7DRrUruJRuzmyZlnPGq3jgE9x2dvjmRCyGos2NzX5rY0widthPCZTkmyWlnHZeWaIlL7FClyp9VXeLdnpI8byH+ixXUPlDLDggImbE//c20fVp/tjVscnCTo0Q6fZoanhODE0DLuE0+ACCGb4uv4yXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFtWnMg7Uhet9d3YnVeZ4EL10kP2OkEq2Wh0jKXZQ8I=;
 b=UsSBwXkjK2ttLRLxY+zIlMIzu+Nj0PPsn6y3tsQm52k4gWcbBu3LNVtYwLmE8u45s0JExTGavFvIsJKFvTK+p1wGQDXRm5cJrIJzkIzIM4uRmVI+dkT10b7pWJa0AiVZJ3M/4ydN3PFLf27R6iR0BJHcjyFQfvoCpJEBRyKGYpxuCR4iHimLcyvC8VZHo9/eOUDsWN1kGBTRjzTXI53jnx2phsVwfZK6rY4/pMLzAU0dEqsFIhQdwtFzK3ETJF9aRL/KNq4TFUUERXhxqSNhbPqWWxqSmw2uwE7yoruMbmt/Bd+VJeEN7hH5ObIakBclwbbB23z0cBFNG3D1ik0AvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by PAXPR04MB8750.eurprd04.prod.outlook.com (2603:10a6:102:20c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 31 Oct
 2025 12:15:12 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442%7]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 12:15:12 +0000
Date: Fri, 31 Oct 2025 14:15:08 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: imx@lists.linux.dev, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 Sandor Yu <sandor.yu@nxp.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 5/9] drm/imx: Add support for i.MX94 DCIF
Message-ID: <m6dh52cih2xzzxb45hsfohrkrqdr3hqnewbeupqk43wzlcyznm@j5sfwnhealvx>
References: <20250911-dcif-upstreaming-v5-0-a1e8dab8ae40@oss.nxp.com>
 <20250911-dcif-upstreaming-v5-5-a1e8dab8ae40@oss.nxp.com>
 <DDWCVYBQSV10.2MFZFEEHPYJY4@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DDWCVYBQSV10.2MFZFEEHPYJY4@bootlin.com>
X-ClientProxiedBy: AS4P195CA0020.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::7) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|PAXPR04MB8750:EE_
X-MS-Office365-Filtering-Correlation-Id: 5170dcc7-7aee-47d8-7c5a-08de1877241b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|7416014|1800799024|376014|366016; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?r2BqaRQbgbI4QEbbH5y8ZiG+5ptcGQ2PUcp7E8F+zN1ixdEyHXNTvtwmOcPj?=
 =?us-ascii?Q?gR7oeGuREKQufhq7wwQEqGOCM0TWL+DF5QOTwblGXqSedlzCR7LWwZmmirkQ?=
 =?us-ascii?Q?jwQKll3E4RJmt2TxdhaXA73qF7xVEWtlfyJ/lck6D3bsciGiUCNlAG/Y3Ooz?=
 =?us-ascii?Q?jpDgoPI72vwcPO5/56b+HPhlHDziPPfZC99zf86zsnUdq5QcEDQ2xgMOIBcO?=
 =?us-ascii?Q?t1QIDKZu60dx0KSDTWfYWLBB8EJFgjTOtvWIXHKl8+NLZzSuQj09prSfhmok?=
 =?us-ascii?Q?gzqC72QNwvk9aqisuXGoMPL2XmRI6d06axan90+dpBaw41/xfI00Y3Qnl3Zm?=
 =?us-ascii?Q?+w9ImXW4ax6T7ZTvlCEGay4HlBUDix5s9n58m79/KM8IFi6eQhz0AHu2rUlJ?=
 =?us-ascii?Q?TwIBN/jYaV8QIkK8s4lnOE1vdNNwj1BMJ7ABp6QCs9SOSbra9gcf4umdaVTq?=
 =?us-ascii?Q?xuq4u7u1eQeVv5knoBAHQ9QZIjcqUsjcMfyURBkL419Y3WvPqNGbvEqCuEOq?=
 =?us-ascii?Q?4ba/9MruvbBaxVNEFO32DJIuLj4X45NBaEFNT5CvMED6dA0YJnYGvvi3s09+?=
 =?us-ascii?Q?NzOxH4WWqb1Y6DE6wInqt1CHFYyz6GDbT6ISQlzd1R5OSIjxwQT9Oo3O26vo?=
 =?us-ascii?Q?GWh2QUJRI1rJ457S3hhWivWV6FwWS2J2EDvEyN3Vf9YN1yNyXwqcIUqsLF9z?=
 =?us-ascii?Q?tUvTiA8Jw9iBT7WwSRGOQpzc/CYid8Qimg6X88oBMPc1+ofAcsxPtGeRcn8S?=
 =?us-ascii?Q?9SfycK0HsRN5ZmWB7GgK/X6gizc221JwEC37cyQ2om/wzPEHZW0rwuEvLCkF?=
 =?us-ascii?Q?h42PTGRiNnV3Dyc/d0SBpZc5DBakrg2rzVW6uhmLM9K6Nyy/UxyblAbajrdu?=
 =?us-ascii?Q?THGYDmzAFazLsoHDL7ygCqOQsKYiQZR9JJWTpFQpgnSwunqewZpANs5/PFjq?=
 =?us-ascii?Q?buDLCD4l/MAHMs1N686bm4CpiNPsqgyxHkZflJB6u/ukYUbBkhH9QtCehjay?=
 =?us-ascii?Q?C1i0vnGmW3eDWJ0luWeCBDfAeUlyMUoRyw4DiBKOID0tyVCkdGIX5+vMlu6C?=
 =?us-ascii?Q?pZRZ/74EXElT+JcsVe47pG1ity2UJyfSNHDpfPcWZCG+aP+Nq6WRKiHzhp14?=
 =?us-ascii?Q?jTtl68WEiwKl7V9JZDjCEh1/3T+fP9/fsFAsSBviPu5iBJIP6Qxnsp/AXeu3?=
 =?us-ascii?Q?BNl/zpNkFhsxLuk3+gKU78+qK1BfyTxloc3/SR5v/sJCXZcU71fLQ3RTl7AT?=
 =?us-ascii?Q?gFB2ANhrssD2JFzt7G/G7uC3BZ3lalYn1uhFgSiHT9nrryc4VDBnlOhFYSR4?=
 =?us-ascii?Q?Xo3DXr9f1mxU058uQnFr+rI/jEN903UhLAkWO2XQJSjggwysS3jo1y3Az9t1?=
 =?us-ascii?Q?aoTK71ZikYTkLhEDEbny587FcpOm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(7416014)(1800799024)(376014)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Nh4Hi/esARfSQcJg6bzxkvct3TpzSUXB1QW82xcyu3keuKBKbzUnhAGm4TXZ?=
 =?us-ascii?Q?qeEQlcDOk9NB9usYmW9efliVsUcHMKDKT8YY6xsY+y7nODXquerropthtI6f?=
 =?us-ascii?Q?nhdAktkgs22pdxyhLryggm14jJPrWcIdicF90+u1UgSNyyBu9lHOPRKWvQQV?=
 =?us-ascii?Q?vsSzG3vIbwv4MLSshqeaFMVbtduGnGtHBkclNkLrr0Ale1UBehtcL6uQ7Kwl?=
 =?us-ascii?Q?bg5+dAd/SYIwa4V7f+uI7K3WTvBkK23e+v4+cCxOlNQl2TmO4oZYKku2KmB8?=
 =?us-ascii?Q?OXXk4qlK7V7Fxfkd08vAnO4YVKZGX5KKFMYAdnnmi5QvtNO0YdiaqLLOj/Wp?=
 =?us-ascii?Q?eNNXce6+Iy0kfoTNiMsRN3owUpgNR4E+Eeniwo6rIw7RHMEgfyMORhOYibwC?=
 =?us-ascii?Q?lm1+KmRO4CdHRI1lqqWpr+I1zAg68skb4kWiGHUU1G4q7p9R1/njWEX3TC4r?=
 =?us-ascii?Q?TIkj24pnX5OvGiYO0iDV+8PKVeF4hjXrvil6RwGEFatINE4eKnKa0Vp/Pf3y?=
 =?us-ascii?Q?3Co7c9I5aW08nxmDYK3dMfpUynWb5qAdp+uqg+KnJR8hUKa1Eo81kObpHS5O?=
 =?us-ascii?Q?7JN3vMtIO45sN3I5YHV5pTGYkT8TMnGZy+WX7llzWNkFInRfrFvnbNxcIrGi?=
 =?us-ascii?Q?KetZs/ts6qRatx8Pb5Au2itQSVvfd8ybj0UAOuJ2hZgiJH3vAKETlhOinTsr?=
 =?us-ascii?Q?MuRn2mBx3kZTjUHzjAnOTbh27HYI58LJ8oxN0Qt9zosOXsnwPtBrpcjxcOnP?=
 =?us-ascii?Q?bXN+StKiY5n6xc4CUBIObb8RK7QmWMyI9Z2E32WsNVZ/apM9bRvv/KjLTQ/d?=
 =?us-ascii?Q?rDwLy/J3xmeFuKk8lhv0y/+AVvOyKMR7uMNEQM6vbSI6dwmXqS1lwb26ECE5?=
 =?us-ascii?Q?tReVD4EEDbhiqbiIg1xuDc6jXW+Y4cMs0y7gEd7YbGUQYU7dFMCMjpxsh8Ft?=
 =?us-ascii?Q?NLutGfssqv7mG+ldMK/EC8nC/VFhtl/UtGK26waOP6m1kLjDP4iHR2pV8fab?=
 =?us-ascii?Q?M15US0xpd/Cee9XVgxuR0FVV7Ibf2DJRP/5tNC8T0iNT6rrbs/Ty83ylpzcN?=
 =?us-ascii?Q?+l7JnFtO6EcmU1pimHMT42G40nr7mFcH5NnzNfDZvsCm5Kx8lWuwzXVlnQQr?=
 =?us-ascii?Q?WExlQ9cHkJOlVfRi5kufd8y2hHme+zsi6TI5cAtJv7RVmMwe3xP2abgqME9G?=
 =?us-ascii?Q?kWo/FvC/PE+j/UmJpw0DeAP1XYNQ9UbymTN2uKJ67DFLYJmm9jyclJ9nAyXG?=
 =?us-ascii?Q?RBAx0TpXJV6huZzqCCiusxNpNiUMb/QQHQ3NNtxs08o/zM6EYNFRAsPq4489?=
 =?us-ascii?Q?IhpOGtJFKnWSoqZtjFUN2+0aUobDHA/xMEf227Frkkay9OJb6BU02j7zOnNo?=
 =?us-ascii?Q?rHb7gKZOk85++jpNbRqTvK29NikuO344d3RkioGfssaiItok8kBP1Q/VE3Wu?=
 =?us-ascii?Q?iKEuJ7oXjms+3zOAz3FYjIQ0xBnhbC28RrGpAjsabrOhULJP+g89wlQexFMZ?=
 =?us-ascii?Q?2075jIiuISxXtR5RMkl5ly+FFmuAApd1omyDshwkJ/ScrQcqJWIjY+94sVDn?=
 =?us-ascii?Q?OMgpYRAcS8AfLI7WemZKgyV5/Ppm112Fuv8f9Htyq01RpnQmUqHJ5SEvatKr?=
 =?us-ascii?Q?Sw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5170dcc7-7aee-47d8-7c5a-08de1877241b
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 12:15:12.3365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g8IcxW1OhAg1XEtoHCey4REVl4eZKXvU6gHLwThK3jXQ2PN3kfgSkdu742sBDoiUS3nfvTfePRAvlO82JB8sfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8750
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Luca,

On Fri, Oct 31, 2025 at 09:14:45AM +0100, Luca Ceresoli wrote:
> Hello Laurentiu,
> 
> On Thu Sep 11, 2025 at 1:37 PM CEST, Laurentiu Palcu wrote:
> 
> ...
> 
> > +static struct drm_bridge *dcif_crtc_get_bridge(struct drm_crtc *crtc,
> > +					       struct drm_crtc_state *crtc_state)
> > +{
> > +	struct drm_connector_state *conn_state;
> > +	struct drm_encoder *encoder;
> > +	struct drm_connector *conn;
> > +	struct drm_bridge *bridge;
> > +	int i;
> > +
> > +	for_each_new_connector_in_state(crtc_state->state, conn, conn_state, i) {
> > +		if (crtc != conn_state->crtc)
> > +			continue;
> > +
> > +		encoder = conn_state->best_encoder;
> > +
> > +		bridge = drm_bridge_chain_get_first_bridge(encoder);
> 
> The bridge returned by drm_bridge_chain_get_first_bridge() is refcounted
> since v6.18-rc1 [0], so you have to put that reference...
> 
> > +		if (bridge)
> > +			return bridge;
> > +	}
> > +
> > +	return NULL;
> > +}
> > +
> > +static void dcif_crtc_query_output_bus_format(struct drm_crtc *crtc,
> > +					      struct drm_crtc_state *crtc_state)
> > +{
> > +	struct dcif_crtc_state *dcif_state = to_dcif_crtc_state(crtc_state);
> > +	struct drm_bridge_state *bridge_state;
> > +	struct drm_bridge *bridge;
> > +
> > +	dcif_state->bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> > +	dcif_state->bus_flags = 0;
> > +
> > +	bridge = dcif_crtc_get_bridge(crtc, crtc_state);
> > +	if (!bridge)
> > +		return;
> > +
> > +	bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state, bridge);
> > +	if (!bridge_state)
> > +		return;
> > +
> > +	dcif_state->bus_format = bridge_state->input_bus_cfg.format;
> > +	dcif_state->bus_flags = bridge_state->input_bus_cfg.flags;
> 
> ...perhaps here, when both the bridge pointer and the bridge_state pointer
> referencing it go out of scope.
> 
> > +}
> 
> You can just call drm_bridge_put(bridge) there, or (at your option) use a
> cleanup action:
> 
>  static void dcif_crtc_query_output_bus_format(struct drm_crtc *crtc,
>                                                struct drm_crtc_state *crtc_state)
>  {
>          struct dcif_crtc_state *dcif_state = to_dcif_crtc_state(crtc_state);
>          struct drm_bridge_state *bridge_state;
> -        struct drm_bridge *bridge;
> 
>          dcif_state->bus_format = MEDIA_BUS_FMT_RGB888_1X24;
>          dcif_state->bus_flags = 0;
> 
> -        bridge = dcif_crtc_get_bridge(crtc, crtc_state);
> +        struct drm_bridge *bridge __free(drm_bridge_put) = dcif_crtc_get_bridge(crtc, crtc_state);
>          if (!bridge)
>                  return;
> 
>          bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state, bridge);
>          if (!bridge_state)
>                  return;
> 
>          dcif_state->bus_format = bridge_state->input_bus_cfg.format;
>          dcif_state->bus_flags = bridge_state->input_bus_cfg.flags;
>  }
> 
> This would call drm_bridge_put() at end of scope, i.e. end of function.
> 
> You can also have a look at recent commits involving drm_bridge_put (git
> log -p -Gdrm_bridge_put v6.16..origin/master) to see how other parts of the
> kernel have added drm_bridge_put().

Thanks for reviewing and the heads-up on using drm_bridge_put(). I'll
send a v6 next week with the fix.

Thanks,
Laurentiu

> 
> [0] https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/8fa5909400f377351836419223c33f1131f0f7d3
> 
> Best regards,
> Luca
> 
> ---
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
