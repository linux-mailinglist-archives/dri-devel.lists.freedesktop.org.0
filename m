Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E0653CB67
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 16:14:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE1C10E374;
	Fri,  3 Jun 2022 14:14:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1249810E268;
 Fri,  3 Jun 2022 14:14:15 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id E5659320090E;
 Fri,  3 Jun 2022 10:14:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 03 Jun 2022 10:14:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1654265650; x=
 1654352050; bh=SUEjLwclojF3h4q4JNOjl27iBteEa2wqAi2mc0xoM04=; b=m
 9xqqHlmTpZU6gtfdc8O1atMLX8zDzT+WurnmYtbGtbM8e0Nrw9py/LQ68mtDUTRy
 BCHkNgrN7PM8bTB2w2yH+sIQre1uLzej+qnbJVVeC2/dH8JZTHtlFzyzvy0o1ODR
 CsQPuNmPgGIjgXfkoJQYaYnY/AIeeCKKyOGF/e1zML1kOl6kXyNpuOlAqDBl1haS
 1tcIfbfBW4S8e1kOzNERuSdyzOQTWsh3xxa+euUYkhVQ72uTy9XzyigtZ8YMz8a9
 qI/cmZsKpeOmgNBfeNrZB8S6/TbiNQiE6mt79AROUJGimnwccP6TemS2iHEnokMW
 uYpeoZIauIkDXRrR3v/WA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1654265650; x=
 1654352050; bh=SUEjLwclojF3h4q4JNOjl27iBteEa2wqAi2mc0xoM04=; b=F
 BVMNDbwa6QDDvFWWlkmo3Nzj1sBpgvrq8mhFwdJSXxfn1D4zMActSDNmlmnKs/Jb
 gNKg9L0BLGFAAHB7AM4kFgu2U27qDj7Mm6o3L/RRcLbt2084HO2mjSt532F7ByZC
 JHDjREjkxGXsmp1OhNNyQCRKzdassPz6jlAW5zjamubqSEKfC7TEWvDfPgEgxKgm
 cTTrO86d1FZu0aEPSnY+33Rkw5p7o2+uJxe2otd3BEnTLV/H23KMV/Es2eQS2eDt
 iQAa1dmRCD7AiNuXCbXIDqmSlqq5NUm9JYtZwqhQl/NINSoNAEaUG0wxlARCSmki
 dZHk+PU0/9Kjua7qvypjQ==
X-ME-Sender: <xms:MReaYu06VyeZ8kOPo4kOl56aCsXJvW-KBqzYAOytxPf997sqzkZy6g>
 <xme:MReaYhEhhz9QzSLzZ555mhfko8ZUNFwNoona3RTBbsGLzh4K1-Itl7IoVec5CxQp5
 IYDYtXOmo3gTFHZjtk>
X-ME-Received: <xmr:MReaYm6ySqVVNFWUUye8mB5D9bQCWHhtckTMuzlfkj5c3KgUOhlzuC0fWetB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrleeigdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetgfelgefggeekkefggfeludeiudffjeffgeevveekjedukedtudeuteef
 teefgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:MReaYv04aKNlfeFXGLyWWsTe5G_EVvQ8-QTpZQqUrZfqCuz2r2K16g>
 <xmx:MReaYhFWE2INU6AI1YGNZaO3T-HnzUR_cpI2iAwu3_A2BhlXZaYQNg>
 <xmx:MReaYo-HIbjEhT3g5wxcy9KddeOV-9rw7HH19MjJjp-QxFYV21fJzQ>
 <xmx:MheaYuccHEWQCIo7-ZGc2CvoZshD9-8IRnUTc9_R9z-QY1AwQuqMkw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Jun 2022 10:14:08 -0400 (EDT)
Date: Fri, 3 Jun 2022 16:14:05 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 3/4] drm/bridge: Add devm_drm_bridge_add()
Message-ID: <20220603141405.dybjn3blifau6662@penduick>
References: <20220510192944.2408515-1-dianders@chromium.org>
 <20220510122726.v3.3.Iba4b9bf6c7a1ee5ea2835ad7bd5eaf84d7688520@changeid>
 <20220521091751.opeiqbmc5c2okdq6@houat>
 <CAD=FV=Wea0LT5umK4Xg87cDikim+dSuyLndfydO3_DnTujZr9Q@mail.gmail.com>
 <CAD=FV=XqJuPHxm7HYMvyHBL_zC-BBA_f0MBsZX-jHt7Pk9ngsQ@mail.gmail.com>
 <20220603082139.sfdxb5ndwpvlhklh@penduick>
 <CAA8EJpqrw63K_xxJjawLjEqP-05eUD-k6dy21162hcq7q07jgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAA8EJpqrw63K_xxJjawLjEqP-05eUD-k6dy21162hcq7q07jgQ@mail.gmail.com>
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
 Doug Anderson <dianders@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 03, 2022 at 01:19:16PM +0300, Dmitry Baryshkov wrote:
> On Fri, 3 Jun 2022 at 11:21, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > On Tue, May 31, 2022 at 02:06:34PM -0700, Doug Anderson wrote:
> > > On Mon, May 23, 2022 at 10:00 AM Doug Anderson <dianders@chromium.org=
> wrote:
> > > > On Sat, May 21, 2022 at 2:17 AM Maxime Ripard <maxime@cerno.tech> w=
rote:
> > > > > On Tue, May 10, 2022 at 12:29:43PM -0700, Douglas Anderson wrote:
> > > > > > This adds a devm managed version of drm_bridge_add(). Like other
> > > > > > "devm" function listed in drm_bridge.h, this function takes an
> > > > > > explicit "dev" to use for the lifetime management. A few notes:
> > > > > > * In general we have a "struct device" for bridges that makes a=
 good
> > > > > >   candidate for where the lifetime matches exactly what we want.
> > > > > > * The "bridge->dev->dev" device appears to be the encoder
> > > > > >   device. That's not the right device to use for lifetime manag=
ement.
> > > > > >
> > > > > > Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > >
> > > > > If we are to introduce more managed helpers, I think it'd be wise=
r to
> > > > > introduce them as DRM-managed, and not device managed.
> > > > >
> > > > > Otherwise, you'll end up in a weird state when a device has been =
removed
> > > > > but the DRM device is still around.
> > > >
> > > > I'm kinda confused. In this case there is no DRM device for the bri=
dge
> > > > and, as per my CL description, "bridge-dev->dev" appears to be the
> > > > encoder device. I wasn't personally involved in discussions about i=
t,
> > > > but I was under the impression that this was expected / normal. Thus
> > > > we can't make this DRM-managed.
> > >
> > > Since I didn't hear a reply,
> >
> > Gah, I replied but it looks like somehow it never reached the ML...
> >
> > Here was my original reply:
> >
> > > > > This adds a devm managed version of drm_bridge_add(). Like other
> > > > > "devm" function listed in drm_bridge.h, this function takes an
> > > > > explicit "dev" to use for the lifetime management. A few notes:
> > > > > * In general we have a "struct device" for bridges that makes a g=
ood
> > > > >   candidate for where the lifetime matches exactly what we want.
> > > > > * The "bridge->dev->dev" device appears to be the encoder
> > > > >   device. That's not the right device to use for lifetime managem=
ent.
> > > > >
> > > > > Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > >
> > > > If we are to introduce more managed helpers, I think it'd be wiser =
to
> > > > introduce them as DRM-managed, and not device managed.
> > > >
> > > > Otherwise, you'll end up in a weird state when a device has been re=
moved
> > > > but the DRM device is still around.
> > >=3D20
> > > I'm kinda confused. In this case there is no DRM device for the bridge
> > > and, as per my CL description, "bridge-dev->dev" appears to be the
> > > encoder device.
> >
> > bridge->dev seems right though?
> >
> > > I wasn't personally involved in discussions about it, but I was under
> > > the impression that this was expected / normal. Thus we can't make
> > > this DRM-managed.
> >
> > Still, I don't think devm is the right solution to this either.
> >
> > The underlying issue is two-fold:
> >
> >   - Encoders can have a pointer to a bridge through of_drm_find_bridge
> >     or similar. However, bridges are traditionally tied to their device
> >     lifetime (by calling drm_bridge_add in probe, and drm_bridge_remove
> >     in remove). Encoders will typically be tied to the DRM device
> >     however, and that one sticks around until the last application
> >     closes it. We can thus very easily end up with a dangling pointer,
> >     and a use-after-free.
> >
> >   - It's not the case yet, but it doesn't seem far fetch to expose
> >     properties of bridges to the userspace. In that case, the userspace
> >     would be likely to still hold references to objects that aren't
> >     there anymore when the bridge is gone.
> >
> > The first is obviously a larger concern, but if we can find a solution
> > that would accomodate the second it would be great.
> >
> > As far as I can see, we should fix in two steps:
> >
> >   - in drm_bridge_attach, we should add a device-managed call that will
> >     unregister the main DRM device. We don't allow to probe the main DRM
> >     device when the bridge isn't there yet in most case, so it makes
> >     sense to remove it once the bridge is no longer there as well.
>=20
> The problem is that I do not see a good way to unregister the main DRM
> device outside of it's driver code.

That's what drmm helpers are doing though: they'll defer the cleanup
until the last user has closed its fd.

> >   - When the DRM device is removed, have the core cleanup any bridge
> >     registered. That will remove the need to have drm_bridge_remove in
> >     the first place.
> >
> > > I'll assume that my response addressed your concerns. Assuming I get
> > > reviews for the other two patches in this series I'll plan to land
> > > this with Dmitry's review.
> >
> > I still don't think it's a good idea to merge it. It gives an illusion
> > of being safe, but it's really far from it.
>=20
> It is more of removing the boilerplate code spread over all the
> drivers rather than about particular safety.
>=20
> I'd propose to land devm_drm_bridge_add (and deprecate calling
> drm_bridge_remove from the bridge driver at some point) and work on
> the whole drm_device <-> drm_bridge problem in the meantime.

Do you really expect that to happen? :)

Anyway, it's been merged, it's too late now anyway. I don't really feel
like it's a good thing, but it doesn't really make the situation worse
either.

Maxime
