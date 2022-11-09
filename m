Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0B7622F34
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 16:41:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17DF610E5F2;
	Wed,  9 Nov 2022 15:41:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9128E10E5F1;
 Wed,  9 Nov 2022 15:41:44 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id D93F02B05EA7;
 Wed,  9 Nov 2022 10:41:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 09 Nov 2022 10:41:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668008497; x=
 1668015697; bh=RCyshHC41nd39fvXLSqmZArQb870AHZw66GwFRxnroM=; b=m
 6M99+0EF+2lM4FWiKahRXCTJ/2TRlz60OSCpfjLh0dwLmJt8UZlGysvW6zVlL2pp
 Lr+WltoyoR+IUFtxULmpx9V4PwWXUoTK4lT0XrTSj5OvW/EuKUSq5OP7fCPSv/hS
 wMLhIZFZK8xtnKAD9HRpKE6bFT9+wsAEN69ffr7dSfS1rpaxm7Hu+1woa3Z/o8NN
 3pMECxBqnO7uCjXhTY1CIEOjl5zs2PPTo+UtduJ3Rp8RuU/G2ycnUdEQw76dETW2
 RAZTS2OHN2xECUNb6NdkAEGXy0l0HrmS51YjeCqALxmBWtJmoeNmXqsRuIUWSADN
 tB1lVQ/av/uRi0fIEh3kw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668008497; x=
 1668015697; bh=RCyshHC41nd39fvXLSqmZArQb870AHZw66GwFRxnroM=; b=Q
 1/HqsQB3psOc+96b6isRXoX5C5ybTom2C7vyqoPLqp6JQbF0UAVFZTxbWo+gL3Z7
 y51qQFpEdFsWqcGqsfn/LvJJEjy0xXvTlIm+jkDjJL7W2PUy0KZtNHaHgAbKSzIo
 EXABW/A3a68xWi6D9zvPbEuQNITYea4uEAs14se9B4WgqQk7704vEkRSEj1hITqn
 SuwL1/x4lWuzJktnqdj0yaghQoItbO/N1nJd5FeM4RK1VJ6E2U1ERYVRZjBPJq/o
 oZgqdBUCMtxCDJJqCd3vUbP8Pj6gYNwNSIoi5BMIwLk53Qg+nZqzgdElZRJPx9/p
 hSuGxkmOWcv95FeDiejzA==
X-ME-Sender: <xms:MMprY44s5uzkOROU2zHEfWl9aJUVwCgeTFwkoIaoC8uvSdgvD-Thag>
 <xme:MMprY56o5iiiBf61_8abJX__s-HAqE4YCR2hlccU8ReACbG0thX7mIhfHRBpDIZSh
 RKfSUNIqO9Y0bI2vBM>
X-ME-Received: <xmr:MMprY3cXvBJulNae7ipti96x_ZJvMRoIGjmME7i6lUuPDYyopQlU92K8WrUb829ARuUXjBRc5ketZAEhaS_3g2VgVlsgQnHfFiBzPvuwyPr6bQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfedvgdejlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtugfgjgesthhqredttddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelleefieelleetteefvdeikeeffeffvefhtdevgfehveduveehjedvvdei
 ledtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:MMprY9JTwg_wzFj8EWHTdbjBtWZJHYPCN4V_xLC-bRoRQgnaKQCqIw>
 <xmx:MMprY8Ig6OqyUH6VsywLi3cQuOIsSc94EBfT82yvHaUlhJfnpliaBA>
 <xmx:MMprY-zaAoIdjYBBMBRxQowmsI7JmMk3IojZrK3a217hu4nC8Pxobg>
 <xmx:McprY2rAchrF3eCgdTb_46WNWdcdn_DFIex5hkcfFEYhCf4ui436F9V3VWs>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Nov 2022 10:41:35 -0500 (EST)
Date: Wed, 9 Nov 2022 16:41:33 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v7 16/23] drm/probe-helper: Provide a TV get_modes helper
Message-ID: <20221109154133.koqhn6upwz6jd2oe@houat>
References: <20220728-rpi-analog-tv-properties-v7-0-7072a478c6b3@cerno.tech>
 <20220728-rpi-analog-tv-properties-v7-16-7072a478c6b3@cerno.tech>
 <a9c0380a-f538-1a19-fd27-983eea42b1b2@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <a9c0380a-f538-1a19-fd27-983eea42b1b2@tronnes.org>
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Noralf,

On Mon, Nov 07, 2022 at 07:11:27PM +0100, Noralf Tr=F8nnes wrote:
>=20
>=20
> Den 07.11.2022 15.16, skrev Maxime Ripard:
> > From: Noralf Tr=F8nnes <noralf@tronnes.org>
> >=20
> > Most of the TV connectors will need a similar get_modes implementation
> > that will, depending on the drivers' capabilities, register the 480i and
> > 576i modes.
> >=20
> > That implementation will also need to set the preferred flag and order
> > the modes based on the driver and users preferrence.
> >=20
> > This is especially important to guarantee that a userspace stack such as
> > Xorg can start and pick up the preferred mode while maintaining a
> > working output.
> >=20
> > Signed-off-by: Noralf Tr=F8nnes <noralf@tronnes.org>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >=20
> > ---
> > Changes in v7:
> > - Used Noralf's implementation
> >=20
> > Changes in v6:
> > - New patch
> > ---
> >  drivers/gpu/drm/drm_probe_helper.c | 97 ++++++++++++++++++++++++++++++=
++++++++
> >  include/drm/drm_probe_helper.h     |  1 +
> >  2 files changed, 98 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_p=
robe_helper.c
> > index 2fc21df709bc..edb2e4c4530a 100644
> > --- a/drivers/gpu/drm/drm_probe_helper.c
> > +++ b/drivers/gpu/drm/drm_probe_helper.c
> > @@ -1147,3 +1147,100 @@ int drm_connector_helper_get_modes(struct drm_c=
onnector *connector)
> >  	return count;
> >  }
> >  EXPORT_SYMBOL(drm_connector_helper_get_modes);
> > +
> > +static bool tv_mode_supported(struct drm_connector *connector,
> > +			      enum drm_connector_tv_mode mode)
> > +{
> > +	struct drm_device *dev =3D connector->dev;
> > +	struct drm_property *property =3D dev->mode_config.tv_mode_property;
> > +
> > +	unsigned int i;
> > +
> > +	for (i =3D 0; i < property->num_values; i++)
> > +		if (property->values[i] =3D=3D mode)
> > +			return true;
> > +
> > +	return false;
> > +}
>=20
> This function is not used in the new implementation.
>
> I hope you have tested this patch since I didn't even compile test my
> implementation (probably should have said so...)

You nailed it ;)

I had tested it (but missed the warning), and added unit tests to make
sure it was behaving properly, and it did. I'll send the unit tests in
my next version.

Thanks
Maxime
