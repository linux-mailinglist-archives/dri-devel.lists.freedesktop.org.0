Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 012875995F3
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 09:26:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B85ED10F15C;
	Fri, 19 Aug 2022 07:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00FB110ED23
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 07:26:20 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 75AA15C01A5;
 Fri, 19 Aug 2022 03:26:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 19 Aug 2022 03:26:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1660893978; x=1660980378; bh=PQvXEf0pFG
 7expZxKH9DggF+3kgGD1xFEyOXSYF6w9A=; b=VfJqVXNp+l3F9PSdNy39DzmKcM
 q80vDt8WC4xeZgZgxyOFJjo1+Ao9hP0DZjCnApKGjwesoi9dkgJI4EQodKftmHc/
 yOcdOgLcPsePShy0bD4hyWlzyiIbRxfS53icBhPpa2kRVky1eZcvdEZEZSXKWnPY
 XBiDA8uPpqr9gYw+03HzGWt5dooKsuMaZ+ppUiHulFM24W+30q8LtyZlCvuM7UFY
 SL7zJz/Wj7dRgOb7fVYMwfmuG4FhE75HWWBPjyH/+L65+XtN6zwmiZU6qpfYFA5u
 eFP0rwd/hIVEnioG6W1CfG6ADXfV85riM4UzRdGOebY/d9iyJzDL/kYXbI+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1660893978; x=1660980378; bh=PQvXEf0pFG7expZxKH9DggF+3kgG
 D1xFEyOXSYF6w9A=; b=llwIaWhlKIho6AS0koZdRDSv9Cywh1zX+rX6dNfYHP/p
 8g0C0+zRGw0eq+cpKgUVaVfiekXhKR7ooN0AuVLWrjruC/VAy11gtobKrZRJF+uH
 NwMU2VQUZCfW0yQgv9MWSesWxnc0Ydao4jGuxBOWnq977TNr8ep8ZVua5zxpOJjc
 4rOi68pslC72QDYlS6F8XGgh+ncBO6dkyh/dMO6o+gqFMcuEzMdwFC3L8ccHg1YQ
 nxe40e9cMRA5TJPULKRvOvLQLJAggxrM9xGcAGqE7UlTiW4ijuzrNVWnI7oNFi65
 J+03OWO+oDMirlypNMOEFTRJw/xFfcG1+e54mqsdxQ==
X-ME-Sender: <xms:GTv_YvfW-3fl32jZWcLICq7aDQy58HipZeaA2wHYbz27yj4IrR9A_g>
 <xme:GTv_YlONBv9GkB2vrifKkco_Wb0OJytB5GJdW0TSXX0qg7mxxYeXo_2NL8kevSp3F
 _PT0sq3nXQSGofP3wQ>
X-ME-Received: <xmr:GTv_YogWp7Ifley52tKgJDfmq53-fo4TZiBJINQDcqUazTBTwt4qnBR7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeitddguddvudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheeh
 fffhvedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:GTv_Yg80pinc-NWvJigDkQznzT4RGAc3WbnJR4xyPFsbkfmOhN2zpQ>
 <xmx:GTv_YrtooUqG89sZoJi56xMqTnr2v2plFPyf07hpmoNbroxSxgDWFg>
 <xmx:GTv_YvE1HALChCx2uvvLFPU-i0utmxmuG1awV-ak_veqiDQcxEeu_w>
 <xmx:Gjv_YlI_DHpTH5bHZOrDYQMqNC1eF7IWXWM3pwuyd-jg2RQTflMTgA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 Aug 2022 03:26:17 -0400 (EDT)
Date: Fri, 19 Aug 2022 09:26:14 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-misc-next 2/3] drm/vc4: plane: protect device
 resources after removal
Message-ID: <20220819072614.dthfuugbkk65o3ps@houat>
References: <20220819002905.82095-1-dakr@redhat.com>
 <20220819002905.82095-3-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dcp2mqorp5d7a6ps"
Content-Disposition: inline
In-Reply-To: <20220819002905.82095-3-dakr@redhat.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--dcp2mqorp5d7a6ps
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Aug 19, 2022 at 02:29:04AM +0200, Danilo Krummrich wrote:
> (Hardware) resources which are bound to the driver and device lifecycle
> must not be accessed after the device and driver are unbound.
>=20
> However, the DRM device isn't freed as long as the last user closed it,
> hence userspace can still call into the driver.
>=20
> Therefore protect the critical sections which are accessing those
> resources with drm_dev_enter() and drm_dev_exit().

Ah good catch, thanks

> Fixes: 9872c7a31921 ("drm/vc4: plane: Switch to drmm_universal_plane_allo=
c()")
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  drivers/gpu/drm/vc4/vc4_drv.h   |  1 +
>  drivers/gpu/drm/vc4/vc4_plane.c | 25 +++++++++++++++++++++++++
>  2 files changed, 26 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> index 418a8242691f..80da9a9337cc 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -341,6 +341,7 @@ struct vc4_hvs {
> =20
>  struct vc4_plane {
>  	struct drm_plane base;
> +	struct drm_device *dev;

That pointer already exists in struct drm_plane

Looks good otherwise

Maxime

--dcp2mqorp5d7a6ps
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYv87EAAKCRDj7w1vZxhR
xcKJAPoCGmGROyZVzyfQc6jLZJ6oE3b0TFvxgA60VBJRAcmBDgEAiPirDdNpKGTp
AQey4Kx35gTUWmZmTGdYwv+h75x5KQU=
=gwzs
-----END PGP SIGNATURE-----

--dcp2mqorp5d7a6ps--
