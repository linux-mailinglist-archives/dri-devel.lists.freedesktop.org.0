Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFF553C6DE
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 10:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B509410E346;
	Fri,  3 Jun 2022 08:21:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E94E10E1BC;
 Fri,  3 Jun 2022 08:21:46 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 791335C012F;
 Fri,  3 Jun 2022 04:21:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 03 Jun 2022 04:21:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1654244503; x=1654330903; bh=1ccPbvvPc2
 QJsF6EYg6aGAQTpq423l5bpHT3Jr0RAzE=; b=ufgwP5wykpzQaFVt5QI+f4srwp
 CDN5XhLL1lgIkELkWDuGu0MVGlKY2xDOdDHtyOtgyp06tpczWh+jSYjaijvftF94
 VOHO3pemB7wIPmECwfxv0W6YMBYFHFuzvN5BQVI872/kr4Noy93fMJ0p8IgsucLG
 Cu+5+DesHvyhsL5tvGADwk+iUZXDxe4w9dqo3tfp+cWvE5EqQHth6xeQlctNNwiK
 krtMHJlDrKey2G/pvksyNMQSz/aUHL/GXga1eQQv/V+F/oauYs5Y8URtN0ZGjZb9
 Yeb9kUFJ763rFFg9MqyXWs+egN3S0EnG585JBwcTs6+o64dGYZB144eCUrvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1654244503; x=1654330903; bh=1ccPbvvPc2QJsF6EYg6aGAQTpq42
 3l5bpHT3Jr0RAzE=; b=JGNuH2RRj8GNk/GdW0Yz8QCithFazuLg7ZmgIXCfKMJ7
 CXUBXaYIFvQ95sVI/WKJQnrtwPow0jtxlyrJYMeqgScTQX2iMZVEN9HZl/aG7QDA
 gc9CVHc/g18ezC4jBvX5ziOBchoJXViIX38J4f7AzPF/EDmbTRZBVg2EosHL6wRv
 GlzsdfgHMX5QJ4Ftwd2Z72qdm8hy7jGTHSXOt7bCfLQT9BfqzrwPRDjIPs+ACU3a
 buSA+Oj7XeCjbgPfGvxRIkxDrIKYn4kWRXkKEZLqzy9tcmMlsD+C7pZAIzsGLzWw
 X4u63OdlW10xy73/6PZk+JRRVrnY+CR9FnplmiWsRw==
X-ME-Sender: <xms:lsSZYhEe1bgESXbJAkQIeQUcKZfufA4TUKR4Lj1T0elJLzr_IwdJDA>
 <xme:lsSZYmUvY-lam4ev421x8-yY_Ijq2jSCzB1edB5z25QED_FcbEYUf0zGJBW3gqc2w
 ENs1XpkZP9FroFW1SU>
X-ME-Received: <xmr:lsSZYjJETLpiMwc9tmKt0lT5Hve7ygX70mzz-SR1dVSDhxERs9A0msW235wi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrleeigddtudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepfedtueevteeggfeivdffjeejledvveduudetteekvdeiueehvdegkedvleet
 ffeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:lsSZYnFhuVbHa2a3HIHFNtndJSGMwBUAKUX96abHese1LKfLBO534w>
 <xmx:lsSZYnXH6Yh1hNoBEJ8yINX_zEyrmvYNxU7iDGNx_GNRBNcvkXJ3zA>
 <xmx:lsSZYiOnfys3V5irrRFjCr2A2qF-_ob_AnrigaEJqbQG4pG6ACjWtQ>
 <xmx:l8SZYovxnXDLVbsF-05lta2lwtxO7wGvZ6XbVyMk-phWTNfphZhMQQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Jun 2022 04:21:42 -0400 (EDT)
Date: Fri, 3 Jun 2022 10:21:39 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 3/4] drm/bridge: Add devm_drm_bridge_add()
Message-ID: <20220603082139.sfdxb5ndwpvlhklh@penduick>
References: <20220510192944.2408515-1-dianders@chromium.org>
 <20220510122726.v3.3.Iba4b9bf6c7a1ee5ea2835ad7bd5eaf84d7688520@changeid>
 <20220521091751.opeiqbmc5c2okdq6@houat>
 <CAD=FV=Wea0LT5umK4Xg87cDikim+dSuyLndfydO3_DnTujZr9Q@mail.gmail.com>
 <CAD=FV=XqJuPHxm7HYMvyHBL_zC-BBA_f0MBsZX-jHt7Pk9ngsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=XqJuPHxm7HYMvyHBL_zC-BBA_f0MBsZX-jHt7Pk9ngsQ@mail.gmail.com>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 31, 2022 at 02:06:34PM -0700, Doug Anderson wrote:
> On Mon, May 23, 2022 at 10:00 AM Doug Anderson <dianders@chromium.org> wrote:
> > On Sat, May 21, 2022 at 2:17 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > > On Tue, May 10, 2022 at 12:29:43PM -0700, Douglas Anderson wrote:
> > > > This adds a devm managed version of drm_bridge_add(). Like other
> > > > "devm" function listed in drm_bridge.h, this function takes an
> > > > explicit "dev" to use for the lifetime management. A few notes:
> > > > * In general we have a "struct device" for bridges that makes a good
> > > >   candidate for where the lifetime matches exactly what we want.
> > > > * The "bridge->dev->dev" device appears to be the encoder
> > > >   device. That's not the right device to use for lifetime management.
> > > >
> > > > Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > >
> > > If we are to introduce more managed helpers, I think it'd be wiser to
> > > introduce them as DRM-managed, and not device managed.
> > >
> > > Otherwise, you'll end up in a weird state when a device has been removed
> > > but the DRM device is still around.
> >
> > I'm kinda confused. In this case there is no DRM device for the bridge
> > and, as per my CL description, "bridge-dev->dev" appears to be the
> > encoder device. I wasn't personally involved in discussions about it,
> > but I was under the impression that this was expected / normal. Thus
> > we can't make this DRM-managed.
> 
> Since I didn't hear a reply,

Gah, I replied but it looks like somehow it never reached the ML...

Here was my original reply:

> > > This adds a devm managed version of drm_bridge_add(). Like other
> > > "devm" function listed in drm_bridge.h, this function takes an
> > > explicit "dev" to use for the lifetime management. A few notes:
> > > * In general we have a "struct device" for bridges that makes a good
> > >   candidate for where the lifetime matches exactly what we want.
> > > * The "bridge->dev->dev" device appears to be the encoder
> > >   device. That's not the right device to use for lifetime management.
> > >
> > > Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >
> > If we are to introduce more managed helpers, I think it'd be wiser to
> > introduce them as DRM-managed, and not device managed.
> >
> > Otherwise, you'll end up in a weird state when a device has been removed
> > but the DRM device is still around.
>=20
> I'm kinda confused. In this case there is no DRM device for the bridge
> and, as per my CL description, "bridge-dev->dev" appears to be the
> encoder device.

bridge->dev seems right though?

> I wasn't personally involved in discussions about it, but I was under
> the impression that this was expected / normal. Thus we can't make
> this DRM-managed.

Still, I don't think devm is the right solution to this either.

The underlying issue is two-fold:

  - Encoders can have a pointer to a bridge through of_drm_find_bridge
    or similar. However, bridges are traditionally tied to their device
    lifetime (by calling drm_bridge_add in probe, and drm_bridge_remove
    in remove). Encoders will typically be tied to the DRM device
    however, and that one sticks around until the last application
    closes it. We can thus very easily end up with a dangling pointer,
    and a use-after-free.

  - It's not the case yet, but it doesn't seem far fetch to expose
    properties of bridges to the userspace. In that case, the userspace
    would be likely to still hold references to objects that aren't
    there anymore when the bridge is gone.

The first is obviously a larger concern, but if we can find a solution
that would accomodate the second it would be great.

As far as I can see, we should fix in two steps:

  - in drm_bridge_attach, we should add a device-managed call that will
    unregister the main DRM device. We don't allow to probe the main DRM
    device when the bridge isn't there yet in most case, so it makes
    sense to remove it once the bridge is no longer there as well.

  - When the DRM device is removed, have the core cleanup any bridge
    registered. That will remove the need to have drm_bridge_remove in
    the first place.

> I'll assume that my response addressed your concerns. Assuming I get
> reviews for the other two patches in this series I'll plan to land
> this with Dmitry's review.

I still don't think it's a good idea to merge it. It gives an illusion
of being safe, but it's really far from it.

Maxime
