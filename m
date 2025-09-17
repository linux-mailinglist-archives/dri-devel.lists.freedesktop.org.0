Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3122CB80230
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 16:42:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83E6E10E857;
	Wed, 17 Sep 2025 14:42:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dPsNrp1m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 698A610E858
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 14:42:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 78537601ED;
 Wed, 17 Sep 2025 14:42:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB8EAC4CEE7;
 Wed, 17 Sep 2025 14:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758120159;
 bh=5SfmUZAA1ODFCoeAcL9BZ0mLk9gg2PdS2FxRfVlfLA0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dPsNrp1mk0vSHUodTkIA0wP5yI+n89RsNxQ4Q9KLdY2aCBMfqjaIi4k8TMg2FD6f8
 rIbwXNngg08gvS7lzT5LWOFHaTeCGSupqPbj7Zv22hcSFqvcFzTL1kpwBmvc+DiTAe
 uAKZFuDpGawc8hDA0jxDcRPSyC+0+io0CUdO3BUKtrUOR8yTWo38GXtbu8syMvLzdt
 LZt/GzQ/Z9PDcHmNriDoRi0gpuYtB9wmndb9ZNGfbDpvH2xW47+awfYkUebSIC64ur
 Q4wj+n0HC1co7W+9+zlh1ygyBoOIBfMXhTCfwh/8Ae4WX59RkyxWNA6PmSJFJl993p
 wE+b8c6ydwAoA==
Date: Wed, 17 Sep 2025 16:42:36 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Marius Vlad <marius.vlad@collabora.com>
Cc: dri-devel@lists.freedesktop.org, wse@tuxedocomputers.com, 
 andri@yngvason.is, sebastian.wick@redhat.com, daniel.stone@collabora.com, 
 jani.nikula@linux.intel.com, tzimmermann@suse.de, simona.vetter@ffwll.ch, 
 harry.wentland@amd.com, christian.koenig@amd.com, derek.foreman@collabora.com
Subject: Re: [PATCH 2/8] hdmi: Add HDMI_COLORSPACE_AUTO enum option
Message-ID: <20250917-rational-honest-ara-3fb4cd@houat>
References: <20250911130739.4936-1-marius.vlad@collabora.com>
 <20250911130739.4936-3-marius.vlad@collabora.com>
 <20250912-meaty-caracara-of-potency-ab81e7@penduick>
 <aMRoza-hOf29I4OH@xpredator>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="wpkgedp3ecsjmj7g"
Content-Disposition: inline
In-Reply-To: <aMRoza-hOf29I4OH@xpredator>
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


--wpkgedp3ecsjmj7g
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/8] hdmi: Add HDMI_COLORSPACE_AUTO enum option
MIME-Version: 1.0

On Fri, Sep 12, 2025 at 09:39:09PM +0300, Marius Vlad wrote:
> On Fri, Sep 12, 2025 at 05:17:56PM +0200, Maxime Ripard wrote:
> > Hi,
> Hi Maxime,
> >=20
> > On Thu, Sep 11, 2025 at 04:07:33PM +0300, Marius Vlad wrote:
> > > diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
> > > index 45b42f14a750..74fe925c69a2 100644
> > > --- a/drivers/video/hdmi.c
> > > +++ b/drivers/video/hdmi.c
> > > @@ -1031,8 +1031,8 @@ static const char *hdmi_colorspace_get_name(enu=
m hdmi_colorspace colorspace)
> > >  		return "YCbCr 4:4:4";
> > >  	case HDMI_COLORSPACE_YUV420:
> > >  		return "YCbCr 4:2:0";
> > > -	case HDMI_COLORSPACE_RESERVED4:
> > > -		return "Reserved (4)";
> > > +	case HDMI_COLORSPACE_AUTO:
> > > +		return "Auto";
> > >  	case HDMI_COLORSPACE_RESERVED5:
> > >  		return "Reserved (5)";
> > >  	case HDMI_COLORSPACE_RESERVED6:
> > > diff --git a/include/linux/hdmi.h b/include/linux/hdmi.h
> > > index 96bda41d9148..045402033763 100644
> > > --- a/include/linux/hdmi.h
> > > +++ b/include/linux/hdmi.h
> > > @@ -82,7 +82,7 @@ enum hdmi_colorspace {
> > >  	HDMI_COLORSPACE_YUV422,
> > >  	HDMI_COLORSPACE_YUV444,
> > >  	HDMI_COLORSPACE_YUV420,
> > > -	HDMI_COLORSPACE_RESERVED4,
> > > +	HDMI_COLORSPACE_AUTO,
> > >  	HDMI_COLORSPACE_RESERVED5,
> > >  	HDMI_COLORSPACE_RESERVED6,
> > >  	HDMI_COLORSPACE_IDO_DEFINED,
> >=20
> > I'm not sure we can use hdmi_colorspace as is. This is the enum that
> > represents the colorspace encoded in the AVI infoframe, so we can't
> > change it, really.
>
> I see. Was hoping I can re-use these as is when defining the color
> format enum.

You probably shouldn't, but it's not a big deal either. The values of
the property don't have to match anything.

> Should I just de-couple the color format entirely from the enum hdmi
> colorspace? With the enum color format in it feels they sort of overlap,
> with some drivers explicitly using the hdmi colorspace enum others the
> color format enum. Feels a bit inconsistent but maybe that's just me
> and folks do not see this as an issue.
>=20
> Perhaps just handle 'Auto' distinctly but still re-use the hdmi
> colorspace enum?=20
>=20
> Any (strong) preference?

I think you can just create an enum for that property. We will use it to
fill drm_connector_hdmi_state.output_format anyway, and it will always
be something !auto in there so it would work just fine.

Maxime

--wpkgedp3ecsjmj7g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaMrI3AAKCRAnX84Zoj2+
ds24AX9RWtKgtOKYEx+h07JcXm3AmkQTCxqVUJ7aowrfIajeDHKw7FuWA0R55aE2
6qSj9JgBgLg9l6oX5n9TtsS7A1Q06cDmToxj0gqe24ZaZEL3x0ysIbCBRMfBfOxr
gE4llxso9A==
=AUX6
-----END PGP SIGNATURE-----

--wpkgedp3ecsjmj7g--
