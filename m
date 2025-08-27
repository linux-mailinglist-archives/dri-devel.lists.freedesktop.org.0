Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7927CB37A73
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 08:34:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4BC610E701;
	Wed, 27 Aug 2025 06:34:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="a9JgtiBX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F93410E700;
 Wed, 27 Aug 2025 06:34:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9251360254;
 Wed, 27 Aug 2025 06:34:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C05A1C4CEEB;
 Wed, 27 Aug 2025 06:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756276470;
 bh=dOTckYvVImYjZpxv/z1LSXxh9jwhCh1JDe2QIDn/QlQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a9JgtiBXRDvkjujnxJ63j3G2BMBZVXUoeQbzJbonwjIZLHPiuoODiOQnpyZfvAFSv
 2eeWEu4bPG9d3tqUKmy94/CaSdPvNzDmYgid7EqE5KZMs8ZhF1mOl+uQ0Rg8kv34rR
 +JF2p+orkisruTV7t1/t8vri6wXXMA8EaCEU+rhWWND/ItO2jnsfY8MnkxdPMwJQXm
 GoDw5Cz3c6E55kksuBZc4BsvgleH9LUm39UmPVpP8ixE8stafVx2ht4sV+IpXsQ1+M
 efTdYxGKDj72P0jGMA/6sMEql96ydxNBxpBhJUBM8ifaJPEAJaVh8DH1uYqWuH90Wc
 DN7o74Mp3X6Jg==
Date: Wed, 27 Aug 2025 08:34:27 +0200
From: "mripard@kernel.org" <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Kandpal, Suraj" <suraj.kandpal@intel.com>, 
 "liviu.dudau@arm.com" <liviu.dudau@arm.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 "kernel-list@raspberrypi.com" <kernel-list@raspberrypi.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, 
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Nautiyal,
 Ankit K" <ankit.k.nautiyal@intel.com>, 
 "Murthy, Arun R" <arun.r.murthy@intel.com>, "Shankar,
 Uma" <uma.shankar@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>, 
 "siqueira@igalia.com" <siqueira@igalia.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>, 
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>, 
 "simona@ffwll.ch" <simona@ffwll.ch>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "robin.clark@oss.qualcomm.com" <robin.clark@oss.qualcomm.com>, 
 "abhinav.kumar@linux.dev" <abhinav.kumar@linux.dev>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, 
 "jessica.zhang@oss.qualcomm.com" <jessica.zhang@oss.qualcomm.com>,
 "sean@poorly.run" <sean@poorly.run>, 
 "marijn.suijten@somainline.org" <marijn.suijten@somainline.org>,
 "mcanal@igalia.com" <mcanal@igalia.com>, 
 "dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>, 
 "tomi.valkeinen+renesas@ideasonboard.com"
 <tomi.valkeinen+renesas@ideasonboard.com>, 
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>
Subject: Re: [RFC PATCH 1/8] drm: writeback: Refactor drm_writeback_connector
 structure
Message-ID: <20250827-helpful-outgoing-capuchin-d2acc8@houat>
References: <awtqznhquyn7etojonmjn7karznefsb7fdudawcjsj5g2bok3u@2iqcdviuiz2s>
 <20250811111546.GA30760@pendragon.ideasonboard.com>
 <2ah3pau7p7brgw7huoxznvej3djct76vgfwtc72n6uub7sjojd@zzaebjdcpdwf>
 <DM3PPF208195D8D0E55A761A3C16B87BAEEE32AA@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <aJ4LQvqli36TlETu@e110455-lin.cambridge.arm.com>
 <hc6f6wgsnauh72cowocpm55tikejhiha5z4mgufeq7v6gb2qml@kmgfd26bigos>
 <wr76vyag2osox2xf7ducnkiaanzk2k5ehd2ahnoyqdm5qiywlk@penf4v5bvg5z>
 <DM3PPF208195D8D87AECE8397914A67D9A1E33EA@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <20250826-skinny-dancing-otter-de9be4@houat>
 <76cmo6pqa534cdnckfgsnspczenzt7kiwkpgg4olxysjn2can7@g5dxteqi5jjs>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="2bcu3ttzioot2gyg"
Content-Disposition: inline
In-Reply-To: <76cmo6pqa534cdnckfgsnspczenzt7kiwkpgg4olxysjn2can7@g5dxteqi5jjs>
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


--2bcu3ttzioot2gyg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC PATCH 1/8] drm: writeback: Refactor drm_writeback_connector
 structure
MIME-Version: 1.0

On Tue, Aug 26, 2025 at 07:08:17PM +0300, Dmitry Baryshkov wrote:
> On Tue, Aug 26, 2025 at 05:48:18PM +0200, mripard@kernel.org wrote:
> > On Mon, Aug 25, 2025 at 06:26:48AM +0000, Kandpal, Suraj wrote:
> > > > Subject: Re: [RFC PATCH 1/8] drm: writeback: Refactor
> > > > drm_writeback_connector structure
> > > >=20
> > > > Hi,
> > > >=20
> > > > On Sat, Aug 16, 2025 at 01:20:53AM +0300, Dmitry Baryshkov wrote:
> > > > > On Thu, Aug 14, 2025 at 05:13:54PM +0100, liviu.dudau@arm.com wro=
te:
> > > > > > Hi,
> > > > > >
> > > > > > On Wed, Aug 13, 2025 at 10:04:22AM +0000, Kandpal, Suraj wrote:
> > > > > > > > > > };
> > > > > > > > >
> > > > > > > > > I still don't like that. This really doesn't belong here.=
 If
> > > > > > > > > anything, the drm_connector for writeback belongs to drm_=
crtc.
> > > > > > > >
> > > > > > > > Why? We already have generic HDMI field inside drm_connecto=
r. I
> > > > > > > > am really hoping to be able to land DP parts next to it. In
> > > > > > > > theory we can have a DVI- specific entry there (e.g. with t=
he
> > > > subconnector type).
> > > > > > > > The idea is not to limit how the drivers subclass those str=
uctures.
> > > > > > > >
> > > > > > > > I don't see a good case why WB should deviate from that des=
ign.
> > > > > > > >
> > > > > > > > > If the issue is that some drivers need a custom drm_conne=
ctor
> > > > > > > > > subclass, then I'd rather turn the connector field of
> > > > > > > > > drm_writeback_connector into a pointer.
> > > > > > > >
> > > > > > > > Having a pointer requires additional ops in order to get
> > > > > > > > drm_connector from WB code and vice versa. Having
> > > > > > > > drm_connector_wb inside drm_connector saves us from those o=
ps
> > > > (which don't manifest for any other kind of structure).
> > > > > > > > Nor will it take any more space since union will reuse space
> > > > > > > > already taken up by HDMI part.
> > > > > > > >
> > > > > > > > >
> > > > > > >
> > > > > > > Seems like this thread has died. We need to get a conclusion =
on the
> > > > design.
> > > > > > > Laurent do you have any issue with the design given Dmitry's
> > > > > > > explanation as to why this Design is good for drm_writeback_c=
onnector.
> > > > > >
> > > > > > I'm with Laurent here. The idea for drm_connector (and a lot of=
 drm
> > > > > > structures) are to be used as base "classes" for extended
> > > > > > structures. I don't know why HDMI connector ended up inside
> > > > > > drm_connector as not all connectors have HDMI functionality, bu=
t that's a
> > > > cleanup for another day.
> > > > >
> > > > > Maybe Maxime can better comment on it, but I think it was made ex=
actly
> > > > > for the purpose of not limiting the driver's design. For example,=
 a
> > > > > lot of drivers subclass drm_connector via drm_bridge_connector. If
> > > > > struct drm_connector_hdmi was a wrapper around struct drm_connect=
or,
> > > > > then it would have been impossible to use HDMI helpers for bridge
> > > > > drivers, while current design freely allows any driver to utilize
> > > > > corresponding library code.
> > > >=20
> > > > That's exactly why we ended up like this. With that design, we woul=
dn't have
> > > > been able to "inherit" two connector "classes": bridge_connector is=
 one,
> > > > intel_connector another one.
> > > >=20
> > > > See here for the rationale:
> > > > https://lore.kernel.org/dri-devel/ZOTDKHxn2bOg+Xmg@phenom.ffwll.loc=
al/
> > > >=20
> > > > I don't think the "but we'll bloat drm_connector" makes sense eithe=
r.
> > > > There's already a *lot* of things that aren't useful to every conne=
ctor (fwnode,
> > > > display_info, edid in general, scaling, vrr, etc.)
> > > >=20
> > > > And it's not like we allocate more than a handful of them during a =
system's life.
> > >=20
> > > So Are we okay with the approach mentioned here with the changes that=
 have been proposed here like
> > > Having drm_writeback_connector in union with drm_hdmi_connector
> >=20
> > I don't think we need a union here. It artificially creates the same
> > issue: we can't have two types for a connector if we do so.
>=20
> Well... What kind of connector would be both HDMI and WriteBack? I think
> they are mutually exclusive already.
>=20
> > > Also one more thing I would like to clarify here is how everyone would
> > > like the patches patches where each patch changes both the drm core
> > > and all related drivers (ensures buildability but then review is tough
> > > for each driver). Or patches where we have initial drm core changes
> > > and then each patch does the all changes in a driver in its own
> > > respective patch.
> >=20
> > The latter should be preferred, but if you can't maintain bisectability
> > that way, then it's the most important and you should fall back to the
> > former.
>=20
> I'd say, we should be trying our best in providing bisectability. It
> really a PITA if one can not use `git bisect run`.

Yeah, I believe we are saying the same thing :)

Maxime

--2bcu3ttzioot2gyg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaK6m7wAKCRAnX84Zoj2+
doq7AYCGPkzQsh6eK7sNZpx+oS1S0ulIy7SlWpjGFlx+gKw8CWeZ49ePtAl290cq
u833Oa0BgLNM0z3GhbAuoZEIMj3lrg5ki7r3yNe4zG/aPbKJZ1ocfGrd2wTgY+q3
3zMMttn/aw==
=kBfE
-----END PGP SIGNATURE-----

--2bcu3ttzioot2gyg--
