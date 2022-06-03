Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4921853CB6E
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 16:16:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC87210E462;
	Fri,  3 Jun 2022 14:16:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 566EF10E3AF;
 Fri,  3 Jun 2022 14:16:12 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 4A8AE3200913;
 Fri,  3 Jun 2022 10:16:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 03 Jun 2022 10:16:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1654265769; x=
 1654352169; bh=fk3KX5eSyLHN90n0U5LITdHGtIoEddiGyI/EAYeYiBU=; b=G
 Y9BwdDOeLIcpH2chXWkgAUEKKo1tZ13DzfKkoJv9KQ+BGpE3U4V1LdKo+bbCRdFy
 ApSud+sXjgDyje8bHqlEy/bO582UkIvySO/g5BkaNlJqvlmspV1EMLnw/KFAXRS7
 v3dlZW8ScytrPJzDHAIx6tjzMA8SxvqWa/HP/V6bGz1i54L58ifSautV/AlkN5C9
 EKhW3Y8jq4jbbNeYHetQuw//PlnRMY1wnSKJ8UcPI2Cjlo74Z0CZ2b2OuT/RoO8X
 nXCxuAPbXq+LFW0LtugExbXDCrv4FV6VlwYdJRuvcCoU1UmWI4x/kycdnroJFBTd
 rIXfQzYdU626Bl5b6RN4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1654265769; x=
 1654352169; bh=fk3KX5eSyLHN90n0U5LITdHGtIoEddiGyI/EAYeYiBU=; b=j
 dH41LTNHJ5KwV22Kwf+k1jUA/bAMwYnctp+JuaJ3VcnAUQIT0G8cYeD+MIk9zEm/
 +raGeo7KA7rpBuG+fU886W1leyQm+xkvYFCcsfwBSzmbBk5dGm6eqar3n3/R7ANC
 GLNpm4IvFK/Bh0z7S3gQiZvG7pTjaR5F+1sIxIZtYsbzyZS3Poe65EWD7OVvy19u
 PGyTbKTpeQ7xvCTya2bRnMiYTLC6BPJL7VR/shJzOqFSlJ6JjgkWOcvl/hPBp0Mv
 PERo+q/bDe/vF70CIOXwpnKyye+WYsFxcXQMqBcAY0UplUDYonmCm5UU4fgC2W3u
 YDceXm35zxpMk4eiTVGbg==
X-ME-Sender: <xms:qBeaYq58L_DeEqQay66g6TW9QIuCXtCxG2cKhIg7X3oqysYKQcqZ1Q>
 <xme:qBeaYj6GmgoZ_yBjDjOC7NI1g_JScgZW2CoPGfvjsT3Z4vuirYHqDIw9z5ivBpAoJ
 6zevkFSn93jAzLbp9A>
X-ME-Received: <xmr:qBeaYpc079RBM1yuOidLe5q0VbVgjGrGFl0XkZPZlg-7onHWXUrFJCj6S4Ct>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrleeigdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetgfelgefggeekkefggfeludeiudffjeffgeevveekjedukedtudeuteef
 teefgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:qBeaYnJ6MEVrz3t6Ho1T1PT0lQ52_zqXEMOzntbikcrMocls6DXBdA>
 <xmx:qBeaYuJSAv3hVBs7qN2s4pzzd5vgbHRRyIldiBnhGWLkiqiHuvnXXw>
 <xmx:qBeaYozysrWZnD2m1ZZKWvSMxVLtoJLMaC32wmhukaZ-XFElPQqTBg>
 <xmx:qReaYghwdN-8LNUgsvnZgSa8g1wdQKEm1aVKd93Dnr7-7FtgPYXjeg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Jun 2022 10:16:08 -0400 (EDT)
Date: Fri, 3 Jun 2022 16:16:06 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 3/4] drm/bridge: Add devm_drm_bridge_add()
Message-ID: <20220603141606.vapkfwfj7ixefmev@penduick>
References: <20220510192944.2408515-1-dianders@chromium.org>
 <20220510122726.v3.3.Iba4b9bf6c7a1ee5ea2835ad7bd5eaf84d7688520@changeid>
 <20220521091751.opeiqbmc5c2okdq6@houat>
 <CAD=FV=Wea0LT5umK4Xg87cDikim+dSuyLndfydO3_DnTujZr9Q@mail.gmail.com>
 <CAD=FV=XqJuPHxm7HYMvyHBL_zC-BBA_f0MBsZX-jHt7Pk9ngsQ@mail.gmail.com>
 <20220603082139.sfdxb5ndwpvlhklh@penduick>
 <CAA8EJpqrw63K_xxJjawLjEqP-05eUD-k6dy21162hcq7q07jgQ@mail.gmail.com>
 <CAD=FV=XbNe+9Cf-jWwFPAR0a1qqjdKaQdtiREKLB8sHYTh_4OQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAD=FV=XbNe+9Cf-jWwFPAR0a1qqjdKaQdtiREKLB8sHYTh_4OQ@mail.gmail.com>
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

On Fri, Jun 03, 2022 at 06:52:05AM -0700, Doug Anderson wrote:
> On Fri, Jun 3, 2022 at 3:19 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> > On Fri, 3 Jun 2022 at 11:21, Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > On Tue, May 31, 2022 at 02:06:34PM -0700, Doug Anderson wrote:
> > > > On Mon, May 23, 2022 at 10:00 AM Doug Anderson <dianders@chromium.o=
rg> wrote:
> > > > > On Sat, May 21, 2022 at 2:17 AM Maxime Ripard <maxime@cerno.tech>=
 wrote:
> > > > > > On Tue, May 10, 2022 at 12:29:43PM -0700, Douglas Anderson wrot=
e:
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
> > > > >
> > > > > I'm kinda confused. In this case there is no DRM device for the b=
ridge
> > > > > and, as per my CL description, "bridge-dev->dev" appears to be the
> > > > > encoder device. I wasn't personally involved in discussions about=
 it,
> > > > > but I was under the impression that this was expected / normal. T=
hus
> > > > > we can't make this DRM-managed.
> > > >
> > > > Since I didn't hear a reply,
> > >
> > > Gah, I replied but it looks like somehow it never reached the ML...
> > >
> > > Here was my original reply:
> > >
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
> > > >=3D20
> > > > I'm kinda confused. In this case there is no DRM device for the bri=
dge
> > > > and, as per my CL description, "bridge-dev->dev" appears to be the
> > > > encoder device.
> > >
> > > bridge->dev seems right though?
> > >
> > > > I wasn't personally involved in discussions about it, but I was und=
er
> > > > the impression that this was expected / normal. Thus we can't make
> > > > this DRM-managed.
> > >
> > > Still, I don't think devm is the right solution to this either.
> > >
> > > The underlying issue is two-fold:
> > >
> > >   - Encoders can have a pointer to a bridge through of_drm_find_bridge
> > >     or similar. However, bridges are traditionally tied to their devi=
ce
> > >     lifetime (by calling drm_bridge_add in probe, and drm_bridge_remo=
ve
> > >     in remove). Encoders will typically be tied to the DRM device
> > >     however, and that one sticks around until the last application
> > >     closes it. We can thus very easily end up with a dangling pointer,
> > >     and a use-after-free.
> > >
> > >   - It's not the case yet, but it doesn't seem far fetch to expose
> > >     properties of bridges to the userspace. In that case, the userspa=
ce
> > >     would be likely to still hold references to objects that aren't
> > >     there anymore when the bridge is gone.
> > >
> > > The first is obviously a larger concern, but if we can find a solution
> > > that would accomodate the second it would be great.
> > >
> > > As far as I can see, we should fix in two steps:
> > >
> > >   - in drm_bridge_attach, we should add a device-managed call that wi=
ll
> > >     unregister the main DRM device. We don't allow to probe the main =
DRM
> > >     device when the bridge isn't there yet in most case, so it makes
> > >     sense to remove it once the bridge is no longer there as well.
> >
> > The problem is that I do not see a good way to unregister the main DRM
> > device outside of it's driver code.
> >
> > >
> > >   - When the DRM device is removed, have the core cleanup any bridge
> > >     registered. That will remove the need to have drm_bridge_remove in
> > >     the first place.
> > >
> > > > I'll assume that my response addressed your concerns. Assuming I get
> > > > reviews for the other two patches in this series I'll plan to land
> > > > this with Dmitry's review.
> > >
> > > I still don't think it's a good idea to merge it. It gives an illusion
> > > of being safe, but it's really far from it.
> >
> > It is more of removing the boilerplate code spread over all the
> > drivers rather than about particular safety.
> >
> > I'd propose to land devm_drm_bridge_add (and deprecate calling
> > drm_bridge_remove from the bridge driver at some point) and work on
> > the whole drm_device <-> drm_bridge problem in the meantime.
>=20
> At this point it has been landed in drm-misc-next as per my response
> to the cover letter. If need be we can revert it and rework the ps8640
> driver to stop using it but it wouldn't change the lifetime of the
> bridge. I'm not going to rework the bridge lifetime rules here. If
> nothing else it seems like having the devm function at least would
> make it obvious which drivers need to be fixed whenever the bridge
> lifetime problem gets solved.

Not really, no. The issue exists whether or not the driver would be
using devm. Anyway, what's done is done.

Could you please ping earlier than a few minutes before applying the
patch next time though? We could have easily prevented that situation.

Maxime
