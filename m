Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF20A544DAE
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 15:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3123311A07B;
	Thu,  9 Jun 2022 13:30:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 310DD11A0F1;
 Thu,  9 Jun 2022 13:30:20 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BD9195C015E;
 Thu,  9 Jun 2022 09:30:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 09 Jun 2022 09:30:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1654781417; x=1654867817; bh=b5Igb65gfn
 ctwI+RmVcDwth67sj2G3dGQC36Mmle1xo=; b=hrNMVTrTRQEGyDhZAL/1QrQN5N
 P0aN116ZSMxkNjztkjs7NS5b8SROBAmQQ2f6/Zj4PknLBtlBogQclvBWWxOINVP0
 +7/n3UUV+CfHpkIV6Zf8StrfdQZDG+DG8DSuzs/k+XfFddv/QH0WTA6wGszWRDFF
 mqc/JOHVtif8H+QO1t0m2VSiZgl0YSobS06XoudyDIdaiX1swxxPQWY6PQw3zGZA
 pebiAH0Nn480Gjmw2RQhCLkwVME+n33/UfCQV525mzNVo+TZ3Qp7tWajbaza49Ve
 5QniqcFlN3hyTTgaq2hoMp8kHu4IS2lY77/5iAe/A8QpofRoh9tcMSp9jSjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1654781417; x=1654867817; bh=b5Igb65gfnctwI+RmVcDwth67sj2
 G3dGQC36Mmle1xo=; b=ot/lx1glgu8FRpUD/xpDMAyOKyxEnimxixAshRv3ShVN
 BQx1BHHX6AE3QMHdGyxjezt1DOMO6qRx2i3r3kN/NM39i5q10X6ljWwl/6aeWvZw
 ceW6PB7/Uh0WOYU2tC3SMujJPRWxLzpybAPG0wFUG4yXQrOFynu5Rs329tSAk44z
 OneftqZUsmO28zU+feEChIJzjInZWgC9XIcBGKlhqO4QybiO/Syvvovny7rz/dok
 HqbLUX6s2BBbzXrJAMSorOSjE9oRNRjxlarpm46SaHo83ygjYwMBmXlW7LUJKpyS
 olMUEKcOGz4oKKv6F71TLyKc/4OQwUNOIqMI8H7K3A==
X-ME-Sender: <xms:6fWhYucywhODPj6i5crRPjl4hFU8H56Fu8isoOVhHmVCUKiZQGRezw>
 <xme:6fWhYoNSVWpOxurkhXGBXwEToKINNrxTNdf9FlNuLxJTUPT2RJMhtshYEfVtTcZZt
 vBCxmgWI-eas9RL7Wo>
X-ME-Received: <xmr:6fWhYvgrmpAVb_J5GJBjOy6HrXYNLWG0SEvKq6Oacu4y5Xr_r_fLiXs_lyD2b82aNiU90d-bd50ayXzANaSLYRBvwknUtkr39m6fa4k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtledgieduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:6fWhYr_0qPI8otBXQiksi79Fkts6kQK-hG8iMobHDaBiK1Wqa6eFwg>
 <xmx:6fWhYquTK5wgI8fPDIOUoSBQfbOjhToyculi8vGvRxbGb_-oN2vpLg>
 <xmx:6fWhYiEexJG-w-aiWLc_jBdbZSUCdJ6m1MV8f4Wq1xBfZgW5Hda5DQ>
 <xmx:6fWhYqEc3mY9dgz5GkH3fofyEnl8ov46_axMc35-axSp5DtL7mButg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Jun 2022 09:30:16 -0400 (EDT)
Date: Thu, 9 Jun 2022 15:30:15 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 3/4] drm/bridge: Add devm_drm_bridge_add()
Message-ID: <20220609133015.e4oj5xur3pzpw7tp@houat>
References: <20220510192944.2408515-1-dianders@chromium.org>
 <20220510122726.v3.3.Iba4b9bf6c7a1ee5ea2835ad7bd5eaf84d7688520@changeid>
 <20220521091751.opeiqbmc5c2okdq6@houat>
 <CAD=FV=Wea0LT5umK4Xg87cDikim+dSuyLndfydO3_DnTujZr9Q@mail.gmail.com>
 <CAD=FV=XqJuPHxm7HYMvyHBL_zC-BBA_f0MBsZX-jHt7Pk9ngsQ@mail.gmail.com>
 <20220603082139.sfdxb5ndwpvlhklh@penduick>
 <CAA8EJpqrw63K_xxJjawLjEqP-05eUD-k6dy21162hcq7q07jgQ@mail.gmail.com>
 <20220603141405.dybjn3blifau6662@penduick>
 <CAD=FV=Wy_HnshYRcLFRddo0-w=v6sfnzhRYJd+eH0S7uMPxqaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wxmfr2nwsxbwozb6"
Content-Disposition: inline
In-Reply-To: <CAD=FV=Wy_HnshYRcLFRddo0-w=v6sfnzhRYJd+eH0S7uMPxqaQ@mail.gmail.com>
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--wxmfr2nwsxbwozb6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 03, 2022 at 07:56:16AM -0700, Doug Anderson wrote:
> Hi,
>=20
> On Fri, Jun 3, 2022 at 7:14 AM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > On Fri, Jun 03, 2022 at 01:19:16PM +0300, Dmitry Baryshkov wrote:
> > > On Fri, 3 Jun 2022 at 11:21, Maxime Ripard <maxime@cerno.tech> wrote:
> > > >
> > > > On Tue, May 31, 2022 at 02:06:34PM -0700, Doug Anderson wrote:
> > > > > On Mon, May 23, 2022 at 10:00 AM Doug Anderson <dianders@chromium=
=2Eorg> wrote:
> > > > > > On Sat, May 21, 2022 at 2:17 AM Maxime Ripard <maxime@cerno.tec=
h> wrote:
> > > > > > > On Tue, May 10, 2022 at 12:29:43PM -0700, Douglas Anderson wr=
ote:
> > > > > > > > This adds a devm managed version of drm_bridge_add(). Like =
other
> > > > > > > > "devm" function listed in drm_bridge.h, this function takes=
 an
> > > > > > > > explicit "dev" to use for the lifetime management. A few no=
tes:
> > > > > > > > * In general we have a "struct device" for bridges that mak=
es a good
> > > > > > > >   candidate for where the lifetime matches exactly what we =
want.
> > > > > > > > * The "bridge->dev->dev" device appears to be the encoder
> > > > > > > >   device. That's not the right device to use for lifetime m=
anagement.
> > > > > > > >
> > > > > > > > Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > > > >
> > > > > > > If we are to introduce more managed helpers, I think it'd be =
wiser to
> > > > > > > introduce them as DRM-managed, and not device managed.
> > > > > > >
> > > > > > > Otherwise, you'll end up in a weird state when a device has b=
een removed
> > > > > > > but the DRM device is still around.
> > > > > >
> > > > > > I'm kinda confused. In this case there is no DRM device for the=
 bridge
> > > > > > and, as per my CL description, "bridge-dev->dev" appears to be =
the
> > > > > > encoder device. I wasn't personally involved in discussions abo=
ut it,
> > > > > > but I was under the impression that this was expected / normal.=
 Thus
> > > > > > we can't make this DRM-managed.
> > > > >
> > > > > Since I didn't hear a reply,
> > > >
> > > > Gah, I replied but it looks like somehow it never reached the ML...
> > > >
> > > > Here was my original reply:
> > > >
> > > > > > > This adds a devm managed version of drm_bridge_add(). Like ot=
her
> > > > > > > "devm" function listed in drm_bridge.h, this function takes an
> > > > > > > explicit "dev" to use for the lifetime management. A few note=
s:
> > > > > > > * In general we have a "struct device" for bridges that makes=
 a good
> > > > > > >   candidate for where the lifetime matches exactly what we wa=
nt.
> > > > > > > * The "bridge->dev->dev" device appears to be the encoder
> > > > > > >   device. That's not the right device to use for lifetime man=
agement.
> > > > > > >
> > > > > > > Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > > >
> > > > > > If we are to introduce more managed helpers, I think it'd be wi=
ser to
> > > > > > introduce them as DRM-managed, and not device managed.
> > > > > >
> > > > > > Otherwise, you'll end up in a weird state when a device has bee=
n removed
> > > > > > but the DRM device is still around.
> > > > >=3D20
> > > > > I'm kinda confused. In this case there is no DRM device for the b=
ridge
> > > > > and, as per my CL description, "bridge-dev->dev" appears to be the
> > > > > encoder device.
> > > >
> > > > bridge->dev seems right though?
> > > >
> > > > > I wasn't personally involved in discussions about it, but I was u=
nder
> > > > > the impression that this was expected / normal. Thus we can't make
> > > > > this DRM-managed.
> > > >
> > > > Still, I don't think devm is the right solution to this either.
> > > >
> > > > The underlying issue is two-fold:
> > > >
> > > >   - Encoders can have a pointer to a bridge through of_drm_find_bri=
dge
> > > >     or similar. However, bridges are traditionally tied to their de=
vice
> > > >     lifetime (by calling drm_bridge_add in probe, and drm_bridge_re=
move
> > > >     in remove). Encoders will typically be tied to the DRM device
> > > >     however, and that one sticks around until the last application
> > > >     closes it. We can thus very easily end up with a dangling point=
er,
> > > >     and a use-after-free.
> > > >
> > > >   - It's not the case yet, but it doesn't seem far fetch to expose
> > > >     properties of bridges to the userspace. In that case, the users=
pace
> > > >     would be likely to still hold references to objects that aren't
> > > >     there anymore when the bridge is gone.
> > > >
> > > > The first is obviously a larger concern, but if we can find a solut=
ion
> > > > that would accomodate the second it would be great.
> > > >
> > > > As far as I can see, we should fix in two steps:
> > > >
> > > >   - in drm_bridge_attach, we should add a device-managed call that =
will
> > > >     unregister the main DRM device. We don't allow to probe the mai=
n DRM
> > > >     device when the bridge isn't there yet in most case, so it makes
> > > >     sense to remove it once the bridge is no longer there as well.
> > >
> > > The problem is that I do not see a good way to unregister the main DRM
> > > device outside of it's driver code.
> >
> > That's what drmm helpers are doing though: they'll defer the cleanup
> > until the last user has closed its fd.
>=20
> I'm a bit confused here. I'll take the concrete example of ps8640
> since that's what I was working on here.
>=20
> ...right now the fact that we're using devm means that
> drm_bridge_remove() will get called when a ps8640 device is unbound,
> right?

Yes

> I guess you're saying that the "drm_bridge" memory needs to
> outlast this, right?

Since drm_bridge isn't exposing anything to userspace, it would mostly
be its connector. But they are usually allocated in the same structure,
so it's pretty much equivalent here.

> That being said, even if the actual memory for drm_bridge outlasts the
> ps8640 driver lifetime, much of the data would need to be marked
> invalid I think.

All the device resources, yes. So things like IO mappings, clocks, reset
lines, regulators, etc.

> If nothing else all function pointers that point into the driver would
> have to be made NULL, right? Once the device has been unbound it's
> possible that the underlying module might be removed. I suspect that
> we'd need to do more than just bogus-up the function pointers, though.

I ... didn't think of the module memory being freed. I don't know the
module handling code, but if it's an option we could get a reference to
the module memory to make sure the memory stays around until everything
has been freed.

If we can't, then we could relocate all the functions inside the kernel
for the teardown, but I'm sure it's going to be a mess.

> ...so it feels like any solution here needs to take into account
> _both_ the lifetime of the "struct device" and the "struct
> drm_device". If the "struct device" goes away but the "struct
> drm_device" is still around then we need to essentially transition the
> "struct drm_device" over to a dummy, right?

So we want to make sure we won't access the device resources if they
aren't there anymore, during the timeframe between the device being
unbound and the DRM device being unregistered (which can be arbitrarily
long). Fortunately, drm_device->registered is being toggled as soon as
we start the unbinding process, and drm_dev_enter()/drm_dev_exit() is
there to make sure the device is registered.

So we would need to make sure that all device resource access is
protected by a call to those functions. It's tedious, but it works
today.

It's a bit more complicated in the case of bridges (as opposed to any
other entity) because you don't have access to the DRM device when you
probe, only when you are attached. So you also need to make sure the
private structure you allocated in probe (using devm_) is properly
converted to be DRM-managed and freed later on.

Maxime

--wxmfr2nwsxbwozb6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYqH15wAKCRDj7w1vZxhR
xbinAP4k1MWu9RhJ9c2UTXZ6KpsdkD+7929wsLPuo/a9FBhuWgEAgL1lu8WRNZU1
1XzudSHHZYEO9pNa2rw+qu5uq7XwkQk=
=02sb
-----END PGP SIGNATURE-----

--wxmfr2nwsxbwozb6--
