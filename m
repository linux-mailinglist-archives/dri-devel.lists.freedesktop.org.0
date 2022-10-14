Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF09C5FE9B7
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 09:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE9910E9C5;
	Fri, 14 Oct 2022 07:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC7410E11D;
 Fri, 14 Oct 2022 07:38:17 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id B63FA58035A;
 Fri, 14 Oct 2022 03:38:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 14 Oct 2022 03:38:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1665733094; x=
 1665740294; bh=O4wijGYkNa2eVXpEmjczg9Kq8zs8dAQ0sjegIV/rrSw=; b=M
 B6P4muAr8m7upKfRH0bzwQSBtvGu/6BhswoTVp8Bsa6bVPpeoIX16Eb+H+r9bF0D
 3lDYEGQS54GzTWVUN9L6dFmlmnOBUyYuDaz24fBcoS+tZGFP8SAbQokp2NpgX5Q3
 Yzbg578TdvwgWTYlxgIC/BHI+4XLBUki4yM/Os1QCz1MpC6YVn/0W4Nyeq2UzGrX
 f78+Pj5mkvqe0hMPZ1kRstZn6pcsr1WcbO1lSOu9ly05nL0NzFFKS9xUw2uE69Ew
 vLzJrbSs3jfhf+Qf7vFM+TtlzWP130ZqeSeUgsgM4nC9K1UPFEep055m21gdmKsK
 mzbZNaWD9p7rI7WvnnXFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665733094; x=
 1665740294; bh=O4wijGYkNa2eVXpEmjczg9Kq8zs8dAQ0sjegIV/rrSw=; b=h
 129WbAqVQuOXhsJp7BE7++/9+ResYVbw7hRwxli+3d8hEzu84hA3fm3sQRmX2PRK
 M85iSaX4OE7ICHvyYbYOv141NQjyweoWpuiyuKtawhOUK4uYoAmuHA8z9ZIMBnHj
 KFn2zZ3ojFwIxCAK5FgEA942uOJHakgkrNdkgffqglUR+Q7MOe05hcdJ/XboMUGJ
 EAa0WAD98+f2FwoCDx1lkDqwFpiYyCF6ByX0MqeQ1l9mwPq2xc0kz6eyy7ec0k8j
 73jp50OsB6QZ2aRtbRfhdulJzbZaIOjpSVC3bFMGsxkXo1UqijH44o9P1gHxu76K
 LPniYumygDmNyzU9s5zRg==
X-ME-Sender: <xms:5RFJYyRbSbbLR31eIk4ygF3IDrfMfTnuEHbuX3I3cdSI10OQebM4Zw>
 <xme:5RFJY3xCRArAijsTN6ij-wkAhZKdVwlPLSHJFOHAzZK_JHBawZ2GT8OWSgP4XTpYH
 5OY695DV9xFOp8Gxeg>
X-ME-Received: <xmr:5RFJY_0OfHykeBmzejCXRzl6cvuPU4p99mUsL6KY-RNnU0Zn-RZgzrOgyyzn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeekuddguddvfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtugfgjgesthhqredttddtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpefftddtueefgfffgedtjeffveduvdduhfdugeejgeekteeugfefhfeh
 keduhfdvhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:5RFJY-AbafJ5iOck2RgaTp5aFNN92AQjTSH7RtpnVr2zFEIqi_oKzA>
 <xmx:5RFJY7jij9QvqqI0Wy0B63LNK8drv30f710X0bOsyBcfwh2hqchdEg>
 <xmx:5RFJY6p0e9lA80anBs9T23g5dtLSTDEFD_QoSp9DYbMGiQCeRmY1Pg>
 <xmx:5hFJYwB1xYd7ubyWBI1jINnxho1OIPOm_ne3TIez6rRUnpH2TxhFEg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Oct 2022 03:38:12 -0400 (EDT)
Date: Fri, 14 Oct 2022 09:38:10 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: Re: [PATCH v5 22/22] drm/sun4i: tv: Convert to the new TV mode
 property
Message-ID: <20221014073810.akfoyfzxerywnt65@houat>
References: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
 <20220728-rpi-analog-tv-properties-v5-22-d841cc64fe4b@cerno.tech>
 <6482539.4vTCxPXJkl@kista>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <6482539.4vTCxPXJkl@kista>
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Noralf =?utf-8?B?VHLDg8K4bm5lcw==?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jernej,

On Thu, Oct 13, 2022 at 08:23:51PM +0200, Jernej =C5=A0krabec wrote:
> Dne =C4=8Detrtek, 13. oktober 2022 ob 15:19:06 CEST je Maxime Ripard napi=
sal(a):
> > Now that the core can deal fine with analog TV modes, let's convert the
> > sun4i TV driver to leverage those new features.
> >=20
> > Acked-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >=20
> > ---
> > Changes in v5:
> > - Removed the count variable in get_modes
> > - Removed spurious vc4 change
> > ---
> >  drivers/gpu/drm/sun4i/sun4i_tv.c | 145
> > +++++++++++++-------------------------- 1 file changed, 48 insertions(+=
),
> > 97 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c
> > b/drivers/gpu/drm/sun4i/sun4i_tv.c index c65f0a89b6b0..4f07aff11551 100=
644
> > --- a/drivers/gpu/drm/sun4i/sun4i_tv.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
> > @@ -141,23 +141,14 @@ struct resync_parameters {
> >  struct tv_mode {
> >  	char		*name;
> >=20
> > +	unsigned int	tv_mode;
> > +
> >  	u32		mode;
> >  	u32		chroma_freq;
> >  	u16		back_porch;
> >  	u16		front_porch;
> > -	u16		line_number;
> >  	u16		vblank_level;
>=20
> isn't there a way to get or calculate back_porch, front_porch and vblank_=
level=20
> from mode? From quick glance over removed values below, I would say that =
at=20
> least back_porch can be removed too?

I tried actually, but I'm not sure what the front porch and back porch
parameters actually are. They are called that way by Allwinner, but it
doesn't match the PAL or NTSC timings at all.

For example, back_porch is 118 for NTSC and 138 for PAL. Actual back
porches would be around 12 and 16, respectively. Actually, the entire
blanking area are 138 and 144. This is close enough for PAL, but pretty
far off for NTSC.

Allwinner has the habit of integrating the sync period into one of the
porches, but still there's no obvious match.

front_porch is pretty much in the same case.

Since it affected the display output quite a lot, I chose to keep it for
now unfortunately.

> Otherwise this patch looks ok.

Can I add your Acked-by/Reviewed-by then?

Thanks!
Maxime
