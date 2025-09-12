Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C10E9B556B2
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 20:58:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FA4110E064;
	Fri, 12 Sep 2025 18:57:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ZEZ2C9x1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A03A10E064
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 18:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757703468;
 bh=oLOFD/8R6yKULnqDwOvLmA0At2jPEVoSEZBSYTb+VLk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZEZ2C9x1JHwRH91qe0ZUeA5RyNj6VlC0DVRvKe75k1MQaalarLVLONr54ux97cY3R
 uHR45CfIjZ0S/cYBTqDopCY9skIIUjdpg8sf4tP09zvqV8kK0gzGJI3NNxKruGXB8W
 jIQoHpDgDET7HMCWYXMgmYLNmeaRJcwiOrxasccAtEAA6XqQH7cBTEvf/3H0B/i78E
 1jDelI6R9MjKekDHRIIDp7wIiIglT8CGH4RGwhCHdlyQM5YxCOVY8QcgeKq9cWM8A1
 bsCbRKxZqfVq2dcH3oHJzqRlMjJCefE87ZVWYw1zNsQ0p+FzIJc1TDJjLkIiPx5Orv
 fYCTXLlpG8KxQ==
Received: from xpredator (unknown
 [IPv6:2a02:2f05:840b:7800:e88e:21ff:fe65:be18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: mvlad)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 49E3917E0147;
 Fri, 12 Sep 2025 20:57:48 +0200 (CEST)
Date: Fri, 12 Sep 2025 21:57:47 +0300
From: Marius Vlad <marius.vlad@collabora.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, wse@tuxedocomputers.com,
 andri@yngvason.is, sebastian.wick@redhat.com,
 daniel.stone@collabora.com, jani.nikula@linux.intel.com,
 tzimmermann@suse.de, simona.vetter@ffwll.ch, harry.wentland@amd.com,
 christian.koenig@amd.com, derek.foreman@collabora.com
Subject: Re: [PATCH 5/8] drm: Pass supported color formats straight onto
 drm_bridge
Message-ID: <aMRtK6yLsQHzk26y@xpredator>
References: <20250911130739.4936-1-marius.vlad@collabora.com>
 <20250911130739.4936-6-marius.vlad@collabora.com>
 <fekbw2ngxyg4mvkhlvkvegylcm4vm74y5rhhxeygiqxve7oqaj@sxvkyqjssdru>
 <aMMIOBfuQ7oJFH6i@xpredator>
 <20250912-amiable-dandelion-bullfrog-abc930@penduick>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="iQWW/I3blUKz1lUO"
Content-Disposition: inline
In-Reply-To: <20250912-amiable-dandelion-bullfrog-abc930@penduick>
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


--iQWW/I3blUKz1lUO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 05:31:17PM +0200, Maxime Ripard wrote:
> Hi,
>=20
> On Thu, Sep 11, 2025 at 08:34:48PM +0300, Marius Vlad wrote:
> > > > diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/dr=
m/msm/dsi/dsi_manager.c
> > > > index ca400924d4ee..4b87f4f78d38 100644
> > > > --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > > > +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > > > @@ -479,7 +479,7 @@ int msm_dsi_manager_connector_init(struct msm_d=
si *msm_dsi,
> > > >  	if (ret)
> > > >  		return ret;
> > > > =20
> > > > -	connector =3D drm_bridge_connector_init(dev, encoder);
> > > > +	connector =3D drm_bridge_connector_init(dev, encoder, BIT(HDMI_CO=
LORSPACE_RGB));
> > >=20
> > > And this totally depends on the bridge chain. If we have a DSI-to-HDMI
> > > bridge somewhere in the middle, we are able to output YUV data to the
> > > HDMI connector.
> > That's actually the usecase for this patch: to allow passing other color
> > formats, but this patch is a transitory patch to further expose the fact
> > drm_bridge_connector_init was embedding BIT(HDMI_COLORSPACE_RGB) for the
> > format. See rockchip implementation for this bit, the last patch in this
> > series.
>=20
> I think Dmitry's point is that it needs to be integrated with the
> atomic_get_input_bus_fmt / atomic_get_output_bus_fmt, because not only
> we need to make sure the monitor supports it, and the userspace demands
> it, we also need to make sure every bridge in the chain (and possibly
> the encoder) can implement it.
Oookay. Will be looking at those bits then. Thanks for pointing where
I need to look at.

tbh it isn't super clear to me why is it now that an issue. If you don't
mind replying back, it this patch actually exposing that, or that was a
thing that had to addressed at one point?=20
>=20
> Maxime



--iQWW/I3blUKz1lUO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcDKHej6x6uPk3J379jQS5glH1u8FAmjEbScACgkQ9jQS5glH
1u+vuQ//aDHA+giYsDz8n1SIpaluB4U16IHdTdrhIwhrTbIxCFU3xilgwgxfwh9T
8+m3wlEFEmdvbitWqT6rxk2IgPBAIlbeF6Sooe5J3bpi67Qn7Aj6GobYHdNNtR1u
Ls2AtDdwbI07s8BTyUgyValCtWLnksUofHJG/d+gykRnB0ednARE7JRSgA0tnUM7
gpT40BcTMB9hQhNTrNEJWGOd+5CBeqGYlknxSrA9Ek7AQx+u7rCurWg23C0ArLi8
sZ+nuIPs9wUAiGHgD6GnMqwlwYKEdfEwojytWKyjaPtEakKDFHepX9ICWSBm/jJR
1Y3udYSkjfc+wLu6LCPs4/9OuOQIWAISYZDSphpNRP9Z6fvkks0GK0G6i0M7MEz2
hilsJM5p3IzNSkVtu2s5BBkQ8c04DbrAlMxvVP4Gxes8fDuRwUHJu0auYhcwCoK2
N2RtHgX6ncaHxdNFLh6GsV5EhH4CYOT6mBA8LPpDabwJFxZeNOh9bZ+Lsv8Ik2xn
wCi7eLYHgWkDQ99/sElZ2Gsypu0pz4qoxf++5p4eq59RWBrWl8RDJ+JjEakXwBSl
HHQN9+v+Mg0w/8Ey9PPxjvaTR8GzoWZYqgnQDjD/ir/oLyKGYCWEIAFut8txztlw
eA73HVU7sVkkAIlXEtbt0lTrrr3D6E1SjrrPVB1xMaXJ+QNomgA=
=v75z
-----END PGP SIGNATURE-----

--iQWW/I3blUKz1lUO--
