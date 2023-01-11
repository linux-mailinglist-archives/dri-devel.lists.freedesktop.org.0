Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1501666204
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 18:34:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D0910E021;
	Wed, 11 Jan 2023 17:34:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10olkn2039.outbound.protection.outlook.com [40.92.42.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A3B10E021
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 17:34:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hgTmJRzHeJ7OxCVfQzHCwdjkAcgqQlCI29TAZTQw8pjd1JicrkSubXoaK5el6k9FDAI27yagYaKss3Y5QHsNiomX7L8X6QLD5LQISHLyjZWZ4EEr9BvEFZdZQ69nNwid8hyTIPZocfcpEMdtzG4qTaOdaVxhHf9wh0xmNCRb/ZrYr2vBuexMWec4oQDSZ45naTxFQHwduDnYb4AWD9B9DfkDCZagKXXkF4I6mkARHf7+3aE9UMJFwjDCOCfE5NRICQoF9CFJm0yRu0IdMSzLTdnDAnIKT+Ux/UvuglTa8ReURcLyduSXZ6BiJCFQpcMtLQtA8gSdmtTQXCgmfgF7vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XReERc6bF+gXR/4HrtzeEgYVd5CVf/PR5+YpUZDCH1M=;
 b=hGMaG4TKx+dhJTnbKhvX1lVhM8SJRwCMkla9atALhMYvUwqKt3HBLh9cfWqKmRBAkLgggGRE3v/54IZQ9craAP3MaGskVSTrBfAXclW277zoKtaaFlxC6ZsGEF75WKxo4yg/3P1xtBxAV1xXdKdRXj/FNmbEWMj7x+vKAYXpqEVctuT4KeMl7dXaeZXP+FrZzm6VVTWQQRlFtysvLjk/MNi4ErKbo1XrVXdQfeSKRosmM1m/NUx6zLXr+ZkOnf6TEpPjDV5apverMX0HsGTGl3kZ5aKiBbixZby3kWtjtjyfEIXDvvdQ0uavl8XuwhZ8Kb8uheHrMZMNVNPUDNvRZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XReERc6bF+gXR/4HrtzeEgYVd5CVf/PR5+YpUZDCH1M=;
 b=iTBx+eIdqwTil7AZL/GSOJde5iK1eiZl8j1Ndacv67c0DFCtXFoPgm7qkWlWhmL4y7bHYnJUfz4q3V1CSojnZ2bRanOXO2Ksgu4R6VDXw4DO34AD0krRzuz3LKKCkVJ5M8BpC4paiHwYR9n4MD5hllHruvSzOChU2aZrb572ta31etDiZtGOuAsAjUlsKZCwmaFU1soOPnmHPrH6/LsOUXAF/c5z/B9yPHxo7m66bzd4CpkVVXfKP00mkGvMl8CMn5y2lLSLN1prXCs2sQBwaxCg85l1JmTE+hugbNrfMIc4zzflRFwu5uyjc/bDkzinrY1GUOX2kajjhnfFFmi6AQ==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by SN6PR06MB5245.namprd06.prod.outlook.com (2603:10b6:805:fa::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 17:34:40 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::ff4f:2e64:cf70:cc68]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::ff4f:2e64:cf70:cc68%5]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 17:34:40 +0000
Date: Wed, 11 Jan 2023 11:34:36 -0600
From: Chris Morgan <macromorgan@hotmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v9 1/4] drm: of: Add drm_of_get_dsi_bus helper function
Message-ID: <SN6PR06MB5342934ECB5D0271D5BC0C1BA5FC9@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20230111163012.310945-1-macroalpha82@gmail.com>
 <20230111163012.310945-2-macroalpha82@gmail.com>
 <20230111163926.k3v32pdvq7o7wxwl@houat>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230111163926.k3v32pdvq7o7wxwl@houat>
X-TMN: [jD48r6WPBuLAd2sdsJiyo7LZOmWRtv21]
X-ClientProxiedBy: SA9PR13CA0169.namprd13.prod.outlook.com
 (2603:10b6:806:28::24) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <Y77zLJcrhr2OlcmZ@wintermute.localhost.fail>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|SN6PR06MB5245:EE_
X-MS-Office365-Filtering-Correlation-Id: e7482fc0-f156-43e1-ef9d-08daf3fa1e39
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DGN3KdmKSjhlo01mRQcwGcr1Sau66EsgYICpn1jeU2+x90KaV2ztB3FE7TWZB0ahVqBkM8b34iejELknIZp06FA7fKAMOvaY+El/h5eyn2+1celaf+CHX6KsMdYdqt7GR1vGgSui0Nj4d31WEqCMBCOXMpHDGpDioU4rAweW4WONHk23KDHkw0tRJIFf8r92n1QtvJrjTOYJIzseV2HW4Adg06cnn9f/CsWU89Zz022Vau4RkL8fFn23xxQpjrV7u1owb5W8W/VDnDZ9kx6n+2J3ynf+oOy+1mtbHXWIuq6M+lVmKfPYT4bFOIBm5mbUs5AQPOhHXMrlnbIYmf8IXGmcVwLKHFGn77xjjSahzwIdbEHT4yfnkNegWZmS3S51cwjkPlXNRyqGM6f0mtdrAnEctNaa8ITYQgD35TkBe8BANKhsKWVgPNeo1xaMnO2Rt5NAp0/drgvHW5Zlf6xcNayIJJU9+nFDXQ4izttrmveTJtcGvkWg/aDpSZ0B5+XfJU9xCg1LpiiuO3KY6mo3kRT25WOQXiE28gRyYtgugo8yBINxrKRp1jPsvXLbQouBRUZuWTznVAvWyp6wMHpj/nKvRFDTknl5IeWUOiZTJ56S1VFBTvC3ui4ME4hrhCRP2yQOIcQJcJYInLxSHW+3Pg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CpaFZydukLzncVSc6u0yffeKbvTKk5LGILl4d4KsI4iWMGfJYLqD5Qwx1/Yk?=
 =?us-ascii?Q?23XBuQI+e2EmHWagm9EaA15Z9hiTCGYjmxPCStXfM6eF55CsrzAhsiH+pa9h?=
 =?us-ascii?Q?Nd7IpHUTts+JQwznWkGOUZerCUxiehFloU6xIwT+5Ab1G0P28ouxv1KXqVMO?=
 =?us-ascii?Q?ZldsIme+mcJDJBl9iitB8/L3Oq3QAJpzHY06Hbuj6qQfwvDduLgI/0uhsEVh?=
 =?us-ascii?Q?ihQXB6QFO5yFMLO6mpFsYs9sRr7pbkTsi5bjRvmKhJyngS287m0vh6qIzpta?=
 =?us-ascii?Q?bRjGd0KQkfwG6ezMVvxkGBZ2TafKOMdpZE6EZqMmfJ3TVK8bUQ7VH9LIHeBp?=
 =?us-ascii?Q?kK3tMMXKlL2+NClsQsNdkvUrRpYaeLcUrbNbKQzSkt9QXLTUoOc4ZBW2YYEJ?=
 =?us-ascii?Q?GvVugNQuORg8IUU+yf0AgmdysXt9V+HaqvCfDEVZGPXZjtAQQ9muoBPFHHI0?=
 =?us-ascii?Q?jy4SJEnd8RBIlCdZw+/hvyj30kJzYPonQNp37ibetararzseR+TwCDoWfqX3?=
 =?us-ascii?Q?zN28oSbFx9pu9kT0K7oQKTTbdGLLugxFywVNMgvryE9XyMZYVxkz5CURMYhk?=
 =?us-ascii?Q?28nFDgSWE9POnOO/Hyofx6nYydX9AWMBDFKpwk07oI7nOBfFacQG8CwwQrXc?=
 =?us-ascii?Q?6o6JNcFB6ujpnuDzFR6R4macPJCHeBAG7/zT/YtGGCTR/58JCw9eS3S97+SU?=
 =?us-ascii?Q?47WMsBCfdXGHNvD0mKqJJ/wcO1T9IYM+2HHmik1uEl21evNBWKZrtlQznT6a?=
 =?us-ascii?Q?s79I3ZYCgCgv/ApG2Ke8dQGJNGMd5zRfXiAtcsns24NDPs8nQbc73CXMK64C?=
 =?us-ascii?Q?fewo6bM3j9+uMvExji9QBC6gjLIPpfhP8G2wBNzZ3gL6M3j3gmr/UFTCQg/e?=
 =?us-ascii?Q?jvckAUySvouq5rTGnu7oSWolVFNkRFS2fz/WEPsCeEWjKpt9qgyjfvj2C9ci?=
 =?us-ascii?Q?+WXiw8452NdlhmlwadbPdzONgEJsgP+Inmjx8UtvRsgGcGJ5w9JEJOxa/sAI?=
 =?us-ascii?Q?T24pUs+ZomkSOqTuQOnwg4UOwSrwfMjvKS23eg94PpqgkVRkRgGhc8vmDcTt?=
 =?us-ascii?Q?XtkkqJgo0RuB6aciQffI5J1rXSWFI1uBQSbrYkMKtFXWumzj0wPKlQNm68sD?=
 =?us-ascii?Q?WVpDNr1EZ8nf8EabGhemqj2gLUurtb+jn+fEgFoGbzBJyVv0N6uy5j4rtbu/?=
 =?us-ascii?Q?LzJayBjcNJN2Q1OBFWsc3kgbvCb/lzipV2Ry1kNz/LcLdg3dQiCOsfGL5r3y?=
 =?us-ascii?Q?MFCG9bT+UM+mHXdejwjBHkZO2fUvLARBnmdpalZXsA=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: e7482fc0-f156-43e1-ef9d-08daf3fa1e39
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 17:34:40.7082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR06MB5245
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 Chris Morgan <macroalpha82@gmail.com>, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, tzimmermann@suse.de,
 maccraft123mc@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 11, 2023 at 05:39:26PM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Wed, Jan 11, 2023 at 10:30:09AM -0600, Chris Morgan wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > Add helper function to find DSI host for devices where DSI panel is not
> > a minor of a DSI bus (such as the Samsung AMS495QA01 panel or the
> > official Raspberry Pi touchscreen display).
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> > ---
> >  drivers/gpu/drm/drm_of.c | 70 ++++++++++++++++++++++++++++++++++++++++
> >  include/drm/drm_of.h     | 10 ++++++
> >  2 files changed, 80 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> > index 7bbcb999bb75..4ebb5bc4b595 100644
> > --- a/drivers/gpu/drm/drm_of.c
> > +++ b/drivers/gpu/drm/drm_of.c
> > @@ -10,6 +10,7 @@
> >  #include <drm/drm_crtc.h>
> >  #include <drm/drm_device.h>
> >  #include <drm/drm_encoder.h>
> > +#include <drm/drm_mipi_dsi.h>
> >  #include <drm/drm_of.h>
> >  #include <drm/drm_panel.h>
> >  
> > @@ -493,3 +494,72 @@ int drm_of_get_data_lanes_count_ep(const struct device_node *port,
> >  	return ret;
> >  }
> >  EXPORT_SYMBOL_GPL(drm_of_get_data_lanes_count_ep);
> > +
> > +/**
> > + * drm_of_get_dsi_bus - find the DSI bus for a given device
> > + * @dev: parent device of display (SPI, I2C)
> > + * @info: DSI device info to be updated with correct DSI node
> > + *
> > + * Gets parent DSI bus for a DSI device controlled through a bus other
> > + * than MIPI-DCS (SPI, I2C, etc.) using the Device Tree.
> > + *
> > + * Returns pointer to mipi_dsi_host if successful, -EINVAL if the
> > + * request is unsupported, -EPROBE_DEFER if the DSI host is found but
> > + * not available, or -ENODEV otherwise.
> > + */
> > +struct mipi_dsi_host *drm_of_get_dsi_bus(struct device *dev,
> > +					 struct mipi_dsi_device_info *info)
> > +{
> > +	struct mipi_dsi_host *dsi_host;
> > +	struct device_node *endpoint, *dsi_host_node;
> > +
> > +	/*
> > +	 * Exit immediately if we attempt to call this function when
> > +	 * DRM_MIPI_DSI is not enabled, in the event CONFIG_OF is
> > +	 * enabled.
> > +	 */
> > +	if (!IS_ENABLED(CONFIG_DRM_MIPI_DSI))
> > +		return ERR_PTR(-EINVAL);
> 
> The commit log isn't super clear on why this is needed, but it would be
> more consistent to add an ifdef and only compile the entire function if
> DRM_MIPI_DSI is there, just like you did for OF already.

Thank you. I can do that, I just wasn't sure if "#ifdefs" were frowned
upon or not. That would probably be the easiest way to do this though.

> 
> > +	/*
> > +	 * Get first endpoint child from device.
> > +	 */
> > +	endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
> > +	if (!endpoint)
> > +		return ERR_PTR(-ENODEV);
> > +
> > +	/*
> > +	 * Follow the first endpoint to get the DSI host node.
> > +	 */
> > +	dsi_host_node = of_graph_get_remote_port_parent(endpoint);
> 
> There's no need to hold the reference to endpoint after that call. call
> of_node_put(endpoint) here, and it will simplify the error path.
> 
> > +	if (!dsi_host_node)
> > +		goto error;
> > +
> > +	/*
> > +	 * Get the DSI host from the DSI host node. If we get an error
> > +	 * or the return is null assume we're not ready to probe just
> > +	 * yet. Release the DSI host node since we're done with it.
> > +	 */
> > +	dsi_host = of_find_mipi_dsi_host_by_node(dsi_host_node);
> > +	of_node_put(dsi_host_node);
> > +	if (IS_ERR_OR_NULL(dsi_host)) {
> > +		of_node_put(endpoint);
> > +		return ERR_PTR(-EPROBE_DEFER);
> > +	}
> > +
> > +	/*
> > +	 * Set the node of the mipi_dsi_device_info to the correct node
> > +	 * and then release the endpoint node since we're done with it.
> > +	 */
> > +	info->node = of_graph_get_remote_port(endpoint);
> 
> Ah, you're using it there.
> 
> I think I'd rework the function to:
> 
> - retrieve the endpoint
> - retrieve the remote port, give up the endpoint
> - retrieve the remote port parent
> 
> Also, I'm not entirely sure what you had in mind, but info might not be
> there at all and it would be fine imho.
> 

What if I make it optional and if a NULL is passed skip this step, but
otherwise populate the info node?

> Maxime

Thank you for your input. I'll wait for the bots to see if the previous
errors are really finally fixed, then I'll make these changes and
resubmit.
