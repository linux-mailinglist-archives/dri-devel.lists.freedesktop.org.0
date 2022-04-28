Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18921512DD4
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 10:08:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B412D10E668;
	Thu, 28 Apr 2022 08:08:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F02810E4D0;
 Thu, 28 Apr 2022 08:08:51 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 4F91B5C012A;
 Thu, 28 Apr 2022 04:08:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 28 Apr 2022 04:08:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1651133330; x=1651219730; bh=12y1ZiwzXH
 JOrb+0U5NzsoZwioPLEHepZNnMnDZ5UQM=; b=FP09ZSZlhr2syPaJ25DyOHehT1
 Rkma0j0g77+5EcimsHB4N7UcmCuufyAAeQeU4BROIotk0YK/VnwcTXBwMMJJK4FD
 RjPx7jjOqOVEBKbU4IDMYtePCVW8zAT8WF6why8Y463s68/7501xSHeI2E3Jbb5M
 RdH1YPpuEN1uYvV8lqCoZ9/FF9/IOX9UTH9W64oZQWXdZiUh33PtiCF9LSHafPA9
 CfFo2vq/hwZylbQFmYQAd7KRB7x0JehBQMsf1xY9dE3JrG9hZyVhojPmvXX6Ww6E
 DsWyvtOLZBKhDoTrDyLjiF1C7bKkH7qmbeANhCYrVmxu0ihHkPlo0ZncKYPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651133330; x=
 1651219730; bh=12y1ZiwzXHJOrb+0U5NzsoZwioPLEHepZNnMnDZ5UQM=; b=S
 h+4MHvTwabRv9n05oitRo3TVku/aVzNeW5pNE8WH6CCvT9uEo5WEjKfNGzJ4+M8b
 pQIIUvzVkLffuxn+GEfSB6aAaAmbcW9+GvEN5+UDkJiukcPYOMSX7hXZ7kYADsz9
 u1JR32OmL1PquszsrEAmwGfeF//jvzz+KpFhCbJi3ApF8W7XekqTuW7ECxdBkhrP
 ezHFs/lgecY5HXNcdHUC61LMqNR51nRbuwG+8j3b6Z53UoYMOC6inuvKI2HED5+Z
 +GQnW7Hif58y5g9OxXrbIk7Y5wes7KVM8lFAkOcFATg+3TJiR5m/ahemEL2hA9la
 cyOFmBV5yxgU4eO0W9FEg==
X-ME-Sender: <xms:kUtqYkDQZWeupc9t4K3YSL_u_DL_3OAMoVkfVz9inqlOIpj6st0FfA>
 <xme:kUtqYmhHaULerSu_ABs6hv6rgmsFWmebWntCtKGj68-Fru5HuEc8ThK_yY2rwGRl4
 P0rsVgtX0NOh0nDLZU>
X-ME-Received: <xmr:kUtqYnkvO9igKaLjzrFt5NrV_KDwVT5Mk57vuRPXooG_ZIHZ56Z5zGnKsyBMwBkVeCY--NLO8UVpOLsuOlfuZA_3H1AmOnlIm_Mq71o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 epfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpeegteeiueehleeigfetkeffleejkeeihfevjedufeetffeuveffueffgeegieeggeen
 ucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhfrhgvvgguvghskhhtohhprdhorhhgpd
 hgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
 ihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:kUtqYqxYSTQyltHkae-Bk1BylHqem5HLOy6mjinOPqu8YolBzwHNYQ>
 <xmx:kUtqYpQNuUvKVjAsxe1Q_lnFuk-IRWjBnPG4S5d3F4pFJm1cd5-aaA>
 <xmx:kUtqYlZcVN31EuynrUicAPtcz1qphKfjnGs8zfs-O4zljfQUzRsVMg>
 <xmx:kktqYpYwsjDyE1K0ic9Hs_FLVJA3ixsBHpPkVBlx0TzexFhWf3pnfw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Apr 2022 04:08:49 -0400 (EDT)
Date: Thu, 28 Apr 2022 10:08:47 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/atomic-helpers: remove legacy_cursor_update hacks
Message-ID: <20220428080847.nbolnkxemblz5qer@houat>
References: <20220331152021.2671937-1-daniel.vetter@ffwll.ch>
 <823b3f2c-b624-f7a3-8bdc-4c069571c810@quicinc.com>
 <CAF6AEGvLY-+v0ZCvtoZDsW-0z5a8UH8suN9cp22m_ec=Ggb9Mw@mail.gmail.com>
 <ec74f2f6-488f-bc34-3d9a-3e1cec68aedc@quicinc.com>
 <CAF6AEGsoXYRB_sTMAp92ph_DetGfSaHwv+2xMS-CT3rgixN4fg@mail.gmail.com>
 <0e957a37-87ad-4981-01c5-287c4b06afa3@quicinc.com>
 <03186a69-0ade-7f8d-4b8b-46f525bc0cb4@quicinc.com>
 <CAKMK7uE2APz6ow+qSZ4xfLTmZdHZJe06X1_4SqWXdMOWByckyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gvwt2h727fs7mddo"
Content-Disposition: inline
In-Reply-To: <CAKMK7uE2APz6ow+qSZ4xfLTmZdHZJe06X1_4SqWXdMOWByckyA@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Kalyan Thota <quic_kalyant@quicinc.com>,
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel@daenzer.net>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Mikita Lipski <mikita.lipski@amd.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--gvwt2h727fs7mddo
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Wed, Apr 13, 2022 at 01:20:11PM +0200, Daniel Vetter wrote:
> On Wed, 13 Apr 2022 at 01:36, Abhinav Kumar <quic_abhinavk@quicinc.com> w=
rote:
> > On 4/8/2022 9:04 PM, Abhinav Kumar wrote:
> > >
> > >
> > > On 4/7/2022 4:12 PM, Rob Clark wrote:
> > >> On Thu, Apr 7, 2022 at 3:59 PM Abhinav Kumar
> > >> <quic_abhinavk@quicinc.com> wrote:
> > >>>
> > >>> Hi Rob and Daniel
> > >>>
> > >>> On 4/7/2022 3:51 PM, Rob Clark wrote:
> > >>>> On Wed, Apr 6, 2022 at 6:27 PM Jessica Zhang
> > >>>> <quic_jesszhan@quicinc.com> wrote:
> > >>>>>
> > >>>>>
> > >>>>>
> > >>>>> On 3/31/2022 8:20 AM, Daniel Vetter wrote:
> > >>>>>> The stuff never really worked, and leads to lots of fun because =
it
> > >>>>>> out-of-order frees atomic states. Which upsets KASAN, among other
> > >>>>>> things.
> > >>>>>>
> > >>>>>> For async updates we now have a more solid solution with the
> > >>>>>> ->atomic_async_check and ->atomic_async_commit hooks. Support for
> > >>>>>> that
> > >>>>>> for msm and vc4 landed. nouveau and i915 have their own commit
> > >>>>>> routines, doing something similar.
> > >>>>>>
> > >>>>>> For everyone else it's probably better to remove the use-after-f=
ree
> > >>>>>> bug, and encourage folks to use the async support instead. The
> > >>>>>> affected drivers which register a legacy cursor plane and don't
> > >>>>>> either
> > >>>>>> use the new async stuff or their own commit routine are: amdgpu,
> > >>>>>> atmel, mediatek, qxl, rockchip, sti, sun4i, tegra, virtio, and
> > >>>>>> vmwgfx.
> > >>>>>>
> > >>>>>> Inspired by an amdgpu bug report.
> > >>>>>>
> > >>>>>> v2: Drop RFC, I think with amdgpu converted over to use
> > >>>>>> atomic_async_check/commit done in
> > >>>>>>
> > >>>>>> commit 674e78acae0dfb4beb56132e41cbae5b60f7d662
> > >>>>>> Author: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> > >>>>>> Date:   Wed Dec 5 14:59:07 2018 -0500
> > >>>>>>
> > >>>>>>        drm/amd/display: Add fast path for cursor plane updates
> > >>>>>>
> > >>>>>> we don't have any driver anymore where we have userspace expecti=
ng
> > >>>>>> solid legacy cursor support _and_ they are using the atomic
> > >>>>>> helpers in
> > >>>>>> their fully glory. So we can retire this.
> > >>>>>>
> > >>>>>> v3: Paper over msm and i915 regression. The complete_all is the =
only
> > >>>>>> thing missing afaict.
> > >>>>>>
> > >>>>>> v4: Fixup i915 fixup ...
> > >>>>>>
> > >>>>>> References: https://bugzilla.kernel.org/show_bug.cgi?id=3D199425
> > >>>>>> References:
> > >>>>>> https://lore.kernel.org/all/20220221134155.125447-9-maxime@cerno=
=2Etech/
> > >>>>>>
> > >>>>>> References: https://bugzilla.kernel.org/show_bug.cgi?id=3D199425
> > >>>>>> Cc: Maxime Ripard <maxime@cerno.tech>
> > >>>>>> Tested-by: Maxime Ripard <maxime@cerno.tech>
> > >>>>>> Cc: mikita.lipski@amd.com
> > >>>>>> Cc: Michel D=E4nzer <michel@daenzer.net>
> > >>>>>> Cc: harry.wentland@amd.com
> > >>>>>> Cc: Rob Clark <robdclark@gmail.com>
> > >>>>>
> > >>>>> Hey Rob,
> > >>>>>
> > >>>>> I saw your tested-by and reviewed-by tags on Patchwork. Just curi=
ous,
> > >>>>> what device did you test on?
> > >>>>
> > >>>> I was testing on strongbad.. v5.18-rc1 + patches (notably, revert
> > >>>> 80253168dbfd ("drm: of: Lookup if child node has panel or bridge")
> > >>>>
> > >>>> I think the display setup shouldn't be significantly different than
> > >>>> limozeen (ie. it's an eDP panel).  But I didn't do much start/stop
> > >>>> ui.. I was mostly looking to make sure cursor movements weren't
> > >>>> causing fps drops ;-)
> > >>>>
> > >>>> BR,
> > >>>> -R
> > >>>
> > >>> start ui/ stop ui is a basic operation for us to use IGT on msm-nex=
t.
> > >>> So we cannot let that break.
> > >>>
> > >>> I think we need to check whats causing this splat.
> > >>>
> > >>> Can we hold back this change till then?
> > >>
> > >> Can you reproduce on v5.18-rc1 (plus 80253168dbfd)?  I'm running a
> > >> loop of stop ui / start ui and hasn't triggered a splat yet.
> > >>
> > >>   Otherwise maybe you can addr2line to figure out where it crashed?
> > >>
> > >> BR,
> > >> -R
> > >
> > > So this is not a crash. Its a warning splat coming from
> > >
> > > https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_crtc.c#L785
> > >
> > >
> > > Looks like the complete_commit() which should signal the event has not
> > > happened before the next cursor commit.
> > >
> > > Somehow this change is affecting the flow to miss the event signaling
> > > that the event is done.
> > >
> > > We tried a couple of approaches but couldnt still fix the warning.
> > >
> > > Will continue to check further next week.
> > >
> > >>
> > >>> Thanks
> > >>>
> > >>> Abhinav
> >
> > After checking this more this week, I think the current patch needs to
> > be changed a bit.
> >
> > So, here you are removing the complete_all part and leaving that to the
> > individual drivers, which is fine.
> >
> > But, you are also removing the continue part which I think seems
> > incorrect and causing these warnings for MSM driver.
> >
> > @@ -2135,12 +2128,6 @@  int drm_atomic_helper_setup_commit(struct
> > drm_atomic_state *state,
> >                         continue;
> >                 }
> >
> > -               /* Legacy cursor updates are fully unsynced. */
> > -               if (state->legacy_cursor_update) {
> > -                       complete_all(&commit->flip_done);
> > -                       continue;
> > -               }
> > -
> >
> > Thats because MSM driver thinks that if the previous crtc_state->event
> > was not consumed, then something went wrong and throws a warning.
> >
> >         if (!new_crtc_state->event) {
> >              commit->event =3D kzalloc(sizeof(*commit->event),
> >                          GFP_KERNEL);
> >              if (!commit->event)
> >                  return -ENOMEM;
> >
> >              new_crtc_state->event =3D commit->event;
> >          }
> >
> > But for a cursor update, we should not or need not populate the event at
> > all because it is async.
> >
> > So i think we should still keep the continue, rest of the patch is fine.
> >
> > @@ -2128,6 +2128,9 @@ int drm_atomic_helper_setup_commit(struct
> > drm_atomic_state *state,
> > continue;
> > }
> >
> > + if (state->legacy_cursor_update)
> > +      continue;
> > +
> >
> > Let me know your comments.
>=20
> Thanks a lot for your excellent analysis. I need to think this through
> some more and figure out what exactly we should be doing.

We integrated this in the (downstream) RaspberryPi kernel, and it seems
to trigger some weird regressions:

  - If we move the cursor under X, the primary plane update is stuck:
    https://github.com/raspberrypi/linux/issues/4988

  - Switching back and forth between VT gets the kernel stuck (with a
    locking issue in fb_release?)
    https://github.com/raspberrypi/linux/issues/5011

I haven't been able to look into it at this point, I'll let you know if
I find anything relevant

Maxime

--gvwt2h727fs7mddo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYmpLjwAKCRDj7w1vZxhR
xeCPAQCTjFlb+/dB+0EkgO3Z9Op8Cy2hyXhv1mdJRwdZj7cpQAEA/7GE33p1RZeC
xFOdp4U+BPuumqqG0Q4HHZytoViU5Qg=
=jWJ7
-----END PGP SIGNATURE-----

--gvwt2h727fs7mddo--
