Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1711228C8
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 11:32:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F9A76E975;
	Tue, 17 Dec 2019 10:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1410114.outbound.protection.outlook.com [40.107.141.114])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2020C6E855
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 17:52:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SIOTiYluzgfEgaiHDmrSTAjPhHn5oiAKKfGLfJIYD9dv54tAt+LN/47S4AmRCVSIajt4f/R6vjtHfmVgctKWmzoMXnLRIfggidFSmATjd/RH1I0rEny6mZCxzXA1Vk+6rOGeoPLeLpxROIilOAFN/d+tu6eMWiLXjp8Go5NjVPK2KJRSjNJOGsPmgRH+R+nCv1L16wXyQEnt+YK5SiKBvtFp/FKhLOiBSXubRpMJeFb7W1XrVLQHnaUM06KvVz2HkLUqalZCpLZnsrROVlWAgDTUfJaC8iboUNvG+aDD9elLSFNUQ486ezjKwoDTbXD8sXH8Lfn5pPNqVLO9qIjuCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BuhMYDp9+Hn5eQAhVH7ZVA2s916mIDiaQuCsbFOQlXc=;
 b=cD2qVsmwu1VtZyk2sym5xdAl8/ejfZ3jsSMYO/nJQpjk/l+QRwY1HnA0q+BhDGby+EyKgYe6SDv6//BHen80k9A/lBvpEOKNiDI2agy0YfmiXvymO99EXq7xCyD5XA78DL2B1hKw9jEp5K4FzYBCcu9Yv4zXi4r0gPbqs7t8N3pzw1nYeAHKsAazhdfIZGosfCHpjrNzdsdpNjgRDNa08gv//IgW0sec3LLa+4m7oFmw/Qaq+M58BoOOMiRL8wSnlf+O9r59GLSiMuPlk+6EsKll7Ka2jLK/407Xv9fiynzOQHY2hOngiRkn3obvCEx2WlxQrHMC2w2e9b91sbXJvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BuhMYDp9+Hn5eQAhVH7ZVA2s916mIDiaQuCsbFOQlXc=;
 b=UtEN6H8nS/WhNo6zYhnDhVGt+dYw6LTrPdlbSVUiMyNttksCFGUrsExkd5sTFvpdq8ChIyvBh0ZAgnbbQPY5hqCd34Xx4FJ2/NgduWr3DS/W5BOvpxBFVE2Pdy+GljKgpLemHPVn8W/YHluCm9gAqd03ZkiEdm4CPXJlSB4sXoc=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1644.jpnprd01.prod.outlook.com (52.133.162.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.16; Mon, 16 Dec 2019 17:52:36 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1%7]) with mapi id 15.20.2538.019; Mon, 16 Dec 2019
 17:52:36 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v4 1/7] drm: of: Add drm_of_lvds_get_dual_link_pixel_order
Thread-Topic: [PATCH v4 1/7] drm: of: Add drm_of_lvds_get_dual_link_pixel_order
Thread-Index: AQHVrFLZM0DJ8Da1xE6jlbUKYw8Y26e4mZUAgAR/lAA=
Date: Mon, 16 Dec 2019 17:52:36 +0000
Message-ID: <TY1PR01MB1770F58B9BBDB1B4AF1DAB55C0510@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1575649974-31472-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1575649974-31472-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191213210558.GJ4860@pendragon.ideasonboard.com>
In-Reply-To: <20191213210558.GJ4860@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0457af3c-74a8-415f-ce4e-08d78250bc3a
x-ms-traffictypediagnostic: TY1PR01MB1644:|TY1PR01MB1644:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB164488CAFEC66257E21AC737C0510@TY1PR01MB1644.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 02530BD3AA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(189003)(199004)(7416002)(52536014)(81156014)(81166006)(53546011)(6506007)(8676002)(8936002)(5660300002)(186003)(26005)(7696005)(55016002)(86362001)(4326008)(71200400001)(9686003)(66556008)(66446008)(66946007)(66476007)(76116006)(64756008)(44832011)(478600001)(316002)(2906002)(6916009)(54906003)(33656002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1644;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A9xk/BmrrZ1EGlw2MglX862e0++PQJjZ3FRJtuEtFl9u8gSyF0iL9JN32UQF37AnEdT+eGkgzHMLSc9/GwVRfI/rrqePBZA+jIvpVQMMDHaWqAJ/AkQcA90Tprg4fkZVLk/+FUiB7VhE8uusjPQTL2axFFPR0yQRCX9u7Z033JMXXuZZTQdIN9gx2eEBk6Fgido9Hsn0w9NfSdwprj6XGmdcGQDvawJmt7MmqOAiiW2QK1W16ri03bIPUapFSqf2PKhOE9hSTc3OVJdTfZD3VBSTwYVkOTjW8moY6mkeCiYhgw+i9ZchIzlbgzeQUDoLtM1bATA9XbLw3AHAibkLwNo1qhQM/n4/Tz6ZRyHo0IsoD6uv3Gkh6FT1sFgRK13kYkrLW8kVXqEhDuZdIBV/77FHzgnq7rRkwzGEUyP3DaYRRhFzuBwbwGHDQqVP9bqN
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0457af3c-74a8-415f-ce4e-08d78250bc3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2019 17:52:36.0850 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7oGBKGy37UFK0tU32mahB+lPMJ2tJjfgCzCNGYe14yvpps0rdlVGSeA/EYGhq+xezvF0IRRBggcD/odpezqZL5aDc1uS8wNVu0YRMPb3P44=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1644
X-Mailman-Approved-At: Tue, 17 Dec 2019 10:31:56 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Magnus Damm <magnus.damm@gmail.com>,
 "ebiharaml@si-linux.co.jp" <ebiharaml@si-linux.co.jp>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

Thank you for your feedback!

> From: linux-renesas-soc-owner@vger.kernel.org <linux-renesas-soc-owner@vger.kernel.org> On Behalf Of Laurent Pinchart
> Sent: 13 December 2019 21:06
> Subject: Re: [PATCH v4 1/7] drm: of: Add drm_of_lvds_get_dual_link_pixel_order
> 
> Hi Fabrizio,
> 
> Thank you for the patch.
> 
> On Fri, Dec 06, 2019 at 04:32:48PM +0000, Fabrizio Castro wrote:
> > An LVDS dual-link connection is made of two links, with even
> > pixels transitting on one link, and odd pixels on the other
> > link. The device tree can be used to fully describe dual-link
> > LVDS connections between encoders and bridges/panels.
> > The sink of an LVDS dual-link connection is made of two ports,
> > the corresponding OF graph port nodes can be marked
> > with either dual-lvds-even-pixels or dual-lvds-odd-pixels,
> > and that fully describes an LVDS dual-link connection,
> > including pixel order.
> >
> > drm_of_lvds_get_dual_link_pixel_order is a new helper
> > added by this patch, given the source port nodes it
> > returns DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS if the source
> > port nodes belong to an LVDS dual-link connection, with even
> > pixels expected to be generated from the first port, and odd
> > pixels expected to be generated from the second port.
> > If the new helper returns DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS,
> > odd pixels are expected to be generated from the first port,
> > and even pixels from the other port.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> >
> > ---
> > v3->v4:
> > * The patch had title "drm: Add bus timings helper" in v3
> > * The code has now been moved to drm_of, and has been fully
> >   restructured, thanks to Laurent and Daniel for the comments
> >
> > v2->v3:
> > * new patch
> > ---
> >  drivers/gpu/drm/drm_of.c | 104 +++++++++++++++++++++++++++++++++++++++++++++++
> >  include/drm/drm_of.h     |  20 +++++++++
> >  2 files changed, 124 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> > index 0ca5880..c2e9ab7 100644
> > --- a/drivers/gpu/drm/drm_of.c
> > +++ b/drivers/gpu/drm/drm_of.c
> > @@ -274,3 +274,107 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
> >  	return ret;
> >  }
> >  EXPORT_SYMBOL_GPL(drm_of_find_panel_or_bridge);
> > +
> > +enum drm_of_lvds_pixels {
> > +	DRM_OF_LVDS_EVEN = BIT(0),
> > +	DRM_OF_LVDS_ODD = BIT(1),
> > +};
> > +
> > +static int drm_of_lvds_get_port_pixels_type(struct device_node *port_node)
> > +{
> > +	bool even_pixels =
> > +		of_property_read_bool(port_node, "dual-lvds-even-pixels");
> > +	bool odd_pixels =
> > +		of_property_read_bool(port_node, "dual-lvds-odd-pixels");
> > +
> > +	return (even_pixels ? DRM_OF_LVDS_EVEN : 0) |
> > +	       (odd_pixels ? DRM_OF_LVDS_ODD : 0);
> > +}
> > +
> > +static int drm_of_lvds_get_remote_pixels_type(
> > +			const struct device_node *port_node)
> > +{
> > +	struct device_node *endpoint = NULL;
> > +	int pixels_type = -EPIPE;
> > +
> > +	for_each_child_of_node(port_node, endpoint) {
> > +		struct device_node *remote_port;
> > +		int current_pt;
> > +
> > +		if (!of_node_name_eq(endpoint, "endpoint"))
> > +			continue;
> > +
> > +		remote_port = of_graph_get_remote_port(endpoint);
> > +		if (!remote_port)
> 
> You need an of_node_put(endpoint) in the code paths that exit from the
> loop.

Right, thank you for spotting this!

> 
> > +			return -EPIPE;
> > +
> > +		current_pt = drm_of_lvds_get_port_pixels_type(remote_port);
> > +		of_node_put(remote_port);
> > +		if (!pixels_type)
> > +			pixels_type = current_pt;
> 
> This will never happen as pixels_type is initialized to -EPIPE.
> Replacing the condition with if (pixels_type < 0) should fix it.

I agree

> 
> > +		if (!current_pt || pixels_type != current_pt)
> > +			return -EINVAL;
> 
> I would add a comment to explain this. If I understand the code
> correcty, something along the lines of
> 
> 		/*
> 		 * Sanity check, ensure that all remote endpoints have the same
> 		 * pixel type. We may lift this restriction later if we need to
> 		 * support multiple sinks with different dual-link
> 		 * configurations by passing the endpoints explicitly to
> 		 * drm_of_lvds_get_dual_link_pixel_order().
> 		 /

I think this will work. Thank you for the suggestion

> 
> > +	}
> > +
> > +	return pixels_type;
> > +}
> > +
> > +/**
> > + * drm_of_lvds_get_dual_link_pixel_order - Get LVDS dual-link pixel order
> > + * @port1: First DT port node of the Dual-link LVDS source
> > + * @port2: Second DT port node of the Dual-link LVDS source
> > + *
> > + * An LVDS dual-link connection is made of two links, with even pixels
> > + * transitting on one link, and odd pixels on the other link. This function
> > + * returns, for two ports of an LVDS dual-link source, which port shall transmit
> > + * the even and odd pixels, based on the requirements of the connected sink.
> > + *
> > + * The pixel order is determined from the dual-lvds-even-pixels and
> > + * dual-lvds-odd-pixels properties in the sink's DT port nodes. If those
> > + * properties are not present, or if their usage is not valid, this function
> > + * returns -EINVAL.
> > + *
> > + * If either port is not connected, this function returns -EPIPE.
> > + *
> > + * @port1 and @port2 are typically DT sibling nodes, but may have different
> > + * parents when, for instance, two separate LVDS encoders carry the even and odd
> > + * pixels.
> > + *
> > + * Return:
> > + * * DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS - @port1 carries even pixels and @port2
> > + *   carries odd pixels
> > + * * DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS - @port1 carries odd pixels and @port1
> 
> This should be DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS, and the second @port1
> should be @port2.

And I thought I double checked those... :)

> 
> > + *   carries even pixels
> > + * * -EINVAL - @port1 and @port2 are not connected to a dual-link LVDS sink, or
> > + *   the sink configuration is invalid
> > + * * -EPIPE - when @port1 or port2 are not connected
> 
> s/port2/@port2/

Cheers

Will fix the highlighted issues in v5.

Thanks,
Fab

> 
> With those small issues addressed,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > + */
> > +int drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
> > +					  const struct device_node *port2)
> > +{
> > +	int remote_p1_pt, remote_p2_pt;
> > +
> > +	if (!port1 || !port2)
> > +		return -EINVAL;
> > +
> > +	remote_p1_pt = drm_of_lvds_get_remote_pixels_type(port1);
> > +	if (remote_p1_pt < 0)
> > +		return remote_p1_pt;
> > +
> > +	remote_p2_pt = drm_of_lvds_get_remote_pixels_type(port2);
> > +	if (remote_p2_pt < 0)
> > +		return remote_p2_pt;
> > +
> > +	/*
> > +	 * A valid dual-lVDS bus is found when one remote port is marked with
> > +	 * "dual-lvds-even-pixels", and the other remote port is marked with
> > +	 * "dual-lvds-odd-pixels", bail out if the markers are not right.
> > +	 */
> > +	if (remote_p1_pt + remote_p2_pt != DRM_OF_LVDS_EVEN + DRM_OF_LVDS_ODD)
> > +		return -EINVAL;
> > +
> > +	return remote_p1_pt == DRM_OF_LVDS_EVEN ?
> > +		DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS :
> > +		DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS;
> > +}
> > +EXPORT_SYMBOL_GPL(drm_of_lvds_get_dual_link_pixel_order);
> > diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
> > index ead34ab..8ec7ca6 100644
> > --- a/include/drm/drm_of.h
> > +++ b/include/drm/drm_of.h
> > @@ -16,6 +16,18 @@ struct drm_panel;
> >  struct drm_bridge;
> >  struct device_node;
> >
> > +/**
> > + * enum drm_lvds_dual_link_pixels - Pixel order of an LVDS dual-link connection
> > + * @DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS: Even pixels are expected to be generated
> > + *    from the first port, odd pixels from the second port
> > + * @DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS: Odd pixels are expected to be generated
> > + *    from the first port, even pixels from the second port
> > + */
> > +enum drm_lvds_dual_link_pixels {
> > +	DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS = 0,
> > +	DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS = 1,
> > +};
> > +
> >  #ifdef CONFIG_OF
> >  uint32_t drm_of_crtc_port_mask(struct drm_device *dev,
> >  			    struct device_node *port);
> > @@ -35,6 +47,8 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
> >  				int port, int endpoint,
> >  				struct drm_panel **panel,
> >  				struct drm_bridge **bridge);
> > +int drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
> > +					  const struct device_node *port2);
> >  #else
> >  static inline uint32_t drm_of_crtc_port_mask(struct drm_device *dev,
> >  					  struct device_node *port)
> > @@ -77,6 +91,12 @@ static inline int drm_of_find_panel_or_bridge(const struct device_node *np,
> >  {
> >  	return -EINVAL;
> >  }
> > +
> > +int drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
> > +					  const struct device_node *port2)
> > +{
> > +	return -EINVAL;
> > +}
> >  #endif
> >
> >  /*
> 
> --
> Regards,
> 
> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
