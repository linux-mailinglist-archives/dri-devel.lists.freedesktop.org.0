Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B0645043D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 13:15:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F60C6EA86;
	Mon, 15 Nov 2021 12:15:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F22C36EA86
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 12:15:24 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 24778580611;
 Mon, 15 Nov 2021 07:15:24 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 15 Nov 2021 07:15:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=m6yz7sxqjDJzXf8qCotKj2WGdr2
 rE7Yq5ktWnUKZSu4=; b=LEpuTkJn9a66vdVu3wiDRxyN1G0pqM6GZ+80RDGHoEJ
 ZKqPp3kem1CwCkLnNdhffXWG8rYxIYAI67TvwTVMlaoYwt3kOmCflUVLnGzbrGBM
 XYwnpO7MMXPmQZJyPMFJ8wSi87fH3f7oCwC6Gt8/oqhxgVxf+aVI3yCmnOhrHrua
 HV+1lIT0J5wd2qdj9YuuXllfwYnqVAy93mfu+XNcisOjsHlU+2Gu/xgf6PWbjdaL
 ETa96G8jTksY0IneVNOXT8ZB5ehwNTpMhTOcUFNpumDlnTVVGL05CkJOmdaM2Sif
 2FRHYqurGwukXBR/XMvqYMs0IFdoUsmgE+PA2/8irKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=m6yz7s
 xqjDJzXf8qCotKj2WGdr2rE7Yq5ktWnUKZSu4=; b=IP7BhNuiUo9ogfojk5mQAe
 G3ztFjmwlEtZbF6SuJV+ro7OORXhh5ZQpUCx96mgDAMY3U82ybDSrFPNKGMhAnUt
 GlCqOOB8QFHBVT6+ivVElu8865hIV07L9cVnNeTKeKMryKNU6ajUUFW2Yi6ymhrj
 gpV8doqeEVTuOuXA9wnsq9yjn+kwnsu8PaVy6jtHzkLb4qyTDdShrxunbWzx3+cg
 MY0f/uMUKwVdRV8KtjsyDEcGcJz5xXWUKOJUs6i8znje4TPWiCJEnhPgoeRK7RWJ
 ijGMW+nLhapSfOIFlTxMZdQ4yERUhP2gwTDBbmsrwK1/tkJhZu3lNZTEahF79blg
 ==
X-ME-Sender: <xms:Wk-SYUCi0HpplGa6lN5k8O-7KcTt_t2fCzX2C_Vs7m-VpRMEa_GGrw>
 <xme:Wk-SYWixkBcfjtGmNNEIuhRPtwD-fBRxrvpkQPgrM0ZK5HFelyjHANpxyacurQ4eN
 aK5sBBGy6OvmPNIMbE>
X-ME-Received: <xmr:Wk-SYXlRP7vxg8JX-Iv18ZqQHNYFRsQUbbop_RrJV-ybce4hUUoEZtnzCk-TZrPC5mwAf0AJxPzOwWl-EIKkuZgnvhb8zRTzK93nTIsb>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfedtgdduudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeejkeekffdtfffhhfevvddutefgtdeljeevffevvddvteegledtgfeghfehvdei
 ffenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Wk-SYazSl-uBGVEYq-y_I0D7uT9YP8l7hSCeOR_KqM0lDaSkPRm-rQ>
 <xmx:Wk-SYZT_vlE6jIUnHAMz5jBtMfM1-BREngj_xsfmfEpaWII5hSekzQ>
 <xmx:Wk-SYVZmSN07G30nVN7MgCxoWvGRDuQ_yH72eS3PIaOA2CDGLgegkw>
 <xmx:XE-SYYK5ELigws3bd5Cxco85BjasnEcjxPKFNpTgtrqfPKw_c-Q-bQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Nov 2021 07:15:22 -0500 (EST)
Date: Mon, 15 Nov 2021 13:15:20 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 02/13] drm/connector: Add helper to check if a mode
 requires scrambling
Message-ID: <20211115121520.jceyxc4y2kjia6fy@gilmour>
References: <20211102145944.259181-1-maxime@cerno.tech>
 <20211102145944.259181-3-maxime@cerno.tech>
 <YYP+MX9gxZVafhKk@intel.com> <YYVxtp9PZiR3ZOjp@phenom.ffwll.local>
 <YYV0bArjRbvYJ2K2@intel.com>
 <20211108155834.6zz236ll75bxwcrk@gilmour>
 <YYlkdHzW4ir07Gtk@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yydf2lm4f4qpeqrp"
Content-Disposition: inline
In-Reply-To: <YYlkdHzW4ir07Gtk@intel.com>
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
Cc: Emma Anholt <emma@anholt.net>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--yydf2lm4f4qpeqrp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 08, 2021 at 07:55:00PM +0200, Ville Syrj=E4l=E4 wrote:
> On Mon, Nov 08, 2021 at 04:58:34PM +0100, Maxime Ripard wrote:
> > On Fri, Nov 05, 2021 at 08:14:04PM +0200, Ville Syrj=E4l=E4 wrote:
> > > On Fri, Nov 05, 2021 at 07:02:30PM +0100, Daniel Vetter wrote:
> > > > On Thu, Nov 04, 2021 at 05:37:21PM +0200, Ville Syrj=E4l=E4 wrote:
> > > > > On Tue, Nov 02, 2021 at 03:59:33PM +0100, Maxime Ripard wrote:
> > > > > > --- a/include/drm/drm_modes.h
> > > > > > +++ b/include/drm/drm_modes.h
> > > > > > @@ -424,6 +424,21 @@ static inline bool drm_mode_is_stereo(cons=
t struct drm_display_mode *mode)
> > > > > >  	return mode->flags & DRM_MODE_FLAG_3D_MASK;
> > > > > >  }
> > > > > > =20
> > > > > > +/**
> > > > > > + * drm_mode_hdmi_requires_scrambling - Checks if a mode requir=
es HDMI Scrambling
> > > > > > + * @mode: DRM display mode
> > > > > > + *
> > > > > > + * Checks if a given display mode requires the scrambling to b=
e enabled.
> > > > > > + *
> > > > > > + * Returns:
> > > > > > + * A boolean stating whether it's required or not.
> > > > > > + */
> > > > > > +static inline bool
> > > > > > +drm_mode_hdmi_requires_scrambling(const struct drm_display_mod=
e *mode)
> > > > > > +{
> > > > > > +	return mode->clock > DRM_HDMI_14_MAX_TMDS_CLK_KHZ;
> > > > > > +}
> > > > >=20
> > > > > That's only correct for 8bpc. The actual limit is on the TMDS clo=
ck (or
> > > > > rather TMDS character rate as HDMI 2.0 calls it due to the 1/1 vs=
=2E 1/4
> > > > > magic for the actually transmitted TMDS clock).
> > > >=20
> > > > Yeah we might need to add the bus format for the cable here too, to=
 make
> > > > this complete.
> > >=20
> > > I don't think we have a usable thing for that on the drm level, so
> > > would need to invent something. Oh, and the mode->clock vs.=20
> > > mode->crtc_clock funny business also limits the usability of this
> > > approach. So probably just easiest to pass in the the driver calculat=
ed
> > > TMDS clock instead.
> >=20
> > If we look at all (I think?) the existing users of scrambling in KMS as
> > of 5.15, only i915 seems to use crtc_clock (which, in retrospect, seems
> > to be the right thing to do), and only i915 and dw-hdmi use an output
> > format, i915 rolling its own, and dw-hdmi using the mbus formats.
> >=20
> > I think using the mbus format here makes the most sense: i915 already is
> > rolling a whole bunch of other code, and we use the mbus defines for the
> > bridge format enumeration as well which is probably going to have some
> > interaction.
> >=20
> > I'm not quite sure what to do next though. The whole point of that
> > series is to streamline as much as possible the scrambling and TMDS
> > ratio setup to avoid the duplication we already have in the drivers that
> > support it, every one using the mostly-the-same-but-slightly-different
> > logic to configure it.
> >=20
> > The mode is fortunately stored in generic structures so it's easy to
> > make that decision. Having to take into account the output format
> > however makes it mandatory to move the bus format in the
> > drm_connector_state(?) structure too.
>=20
> I think involving state objects and the like is just going to make
> it harder to share code between all drivers, if that is the goal.
> Just a few tiny helpers I think is what would allow the broadest=20
> reuse. I guess you could build additional midlayer on top of those
> for some drivers if you wish.
>=20
> As for the bus_format stuff, that looks at the same time overkill,
> and insufficiently documented. I guess its main purpose is to exactly
> defines how some digtal bus works, which makes sense when you're
> chaining a bunch of random chips together. But looks overly complicated
> to me for defining what to output from a HDMI encoder. Looking at the
> defines I wouldn't even know what to use for HDMI actually. All we
> really want is RGB 4:4:4 vs. YCbCr 4:4:4 vs. YCbCr 4:2:2 vs. YCbCr 4:2:0.
> Beyond that level of detail we don't care how each bit gets transferred
> etc. Hence enum intel_output_format in i915.

I have the same feeling about the mbus formats.

I tried to start a discussion about this some time back, without much
success:
https://lore.kernel.org/all/20210317154352.732095-1-maxime@cerno.tech/

The main issue for our current series is that it's tied to the bridges,
while it should work for any HDMI connector, backed by a bridge or not.

However, the main point of this series is to streamline as much as
possible the scrambling setup, including dealing with hotplug properly
just like i915 is doing.

A flag in the connector state to enable the scrambling and high tmds
ratio allows for the helper to perform the disable/enable cycle when we
detected the hotplug. If we wouldn't have it, it wouldn't know what to
do in the first place, and we would end up disabling/enabling the
display every time (which isn't great).

This also allows for less duplication since everyone is using a variant
of the same algorithm to do so, without proper consideration for corner
cases (like enabling scrambling for displays that supports it for rates
< 340MHz)

So we really need something generic there. Or maybe an intermediate
hdmi_connector_state?

Maxime

--yydf2lm4f4qpeqrp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYZJPWAAKCRDj7w1vZxhR
xRLqAP9YKKwLqHFcVCCBpuA1NCMF0JyQoO5uXfRPMtwLszaReAEA6FIqRx/oR9Cb
EoolMn31u6EId3Shg1J+ZqI6Wge4uwg=
=ptZU
-----END PGP SIGNATURE-----

--yydf2lm4f4qpeqrp--
