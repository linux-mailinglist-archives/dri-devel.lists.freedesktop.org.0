Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA62F830673
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 14:00:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C6110E0FE;
	Wed, 17 Jan 2024 13:00:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2A310E0FE
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 12:59:52 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-dc202317415so2617744276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 04:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yngvason.is; s=google; t=1705496332; x=1706101132; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XriBTYniGk9gYChkPK4rAFLbx+9FKjxjuGOHKZN5d5Q=;
 b=fiBbfYk4wwmjtLZ40390nITMMsIv9Ck2vBZMNG3C0YQ+HPGyvIMEkSvlP4WmdsVYeS
 RVRL9lye2Zvi5mslxwZ5HAQaVSC0xSthCuCuAXPKJsqxE3XROTII6DWnmP9VhofTrQfw
 Dcb6vv8XNsG84elv6dQCX74lV5G+VERjrrHxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705496332; x=1706101132;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XriBTYniGk9gYChkPK4rAFLbx+9FKjxjuGOHKZN5d5Q=;
 b=kEQfGwGROPnKOTCKJWrnrEIzFYE/BnFYfrm9z1PQq/THTbUNbvfJFgjEDPlqH5E0yw
 Hj8B67AhOXHCHPqlJ4+VLZs+Cq/gD3JBvVuRW/g7o2b4DslS2DMr4/e19pCaCOSTD4Uy
 IEfGkfvjMSDsjxrOknIqGMVYjEB/Z8mtSbFcJhW1JlYEp5WR5X/vb3RQum6eAbqXPUZF
 DXN4RxnxwETAwzOVKNokdacqOHIDjr8Qh8TQkkmg0OwlEjOPIVnpEFBZy9f16BwaTKoq
 b7mOxZjZpXNr4Nva5N/NFFKqnA2ZEY+/brakZwZM0kMnlgiUTHF3lt6dkenJ8mYG2AgE
 JDdg==
X-Gm-Message-State: AOJu0YyD+CgL/q6pu8VIe2LRxRNVlHWcg2Xcjq0dKmLBiA5tF6OFgU3/
 RQFkspR6U4GeOryCWbd14COwKyctbgXBF4r0bokJiWbekChazg==
X-Google-Smtp-Source: AGHT+IGJIW7uSGphtKFOvMwfljCQ/8rZhpwJOWe7mVWX8TVan9ezOmBt2LWw5SFFQ9yDj8Zksn+cwqmk3E0OCdyRY5E=
X-Received: by 2002:a25:ae42:0:b0:dbd:7f9e:8190 with SMTP id
 g2-20020a25ae42000000b00dbd7f9e8190mr4998501ybe.67.1705496331697; Wed, 17 Jan
 2024 04:58:51 -0800 (PST)
MIME-Version: 1.0
References: <20240115160554.720247-1-andri@yngvason.is>
 <20240115160554.720247-3-andri@yngvason.is>
 <20240116114235.GA311990@toolbox>
 <CAFNQBQz3TNj_7BSmFw4CFMNuR4B+1d+y3f058s+rzTuzdYogqA@mail.gmail.com>
 <20240116132918.GB311990@toolbox>
 <CAFNQBQyfWmfu5T7bgZDZFGfyhsxQi7YXmY_wPc9Y+mm5iSspXQ@mail.gmail.com>
 <20240117112150.4399d0bb@eldfell>
In-Reply-To: <20240117112150.4399d0bb@eldfell>
From: Andri Yngvason <andri@yngvason.is>
Date: Wed, 17 Jan 2024 12:58:15 +0000
Message-ID: <CAFNQBQwoGvSF1ryOPUUnedYUG64HqFQNXjMf6R7piufN64Vc=g@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm/uAPI: Add "force color format" drm property as
 setting for userspace
To: Pekka Paalanen <ppaalanen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Sebastian Wick <sebastian.wick@redhat.com>, amd-gfx@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Leo Li <sunpeng.li@amd.com>,
 intel-gfx@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 Werner Sembach <wse@tuxedocomputers.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

mi=C3=B0., 17. jan. 2024 kl. 09:21 skrifa=C3=B0i Pekka Paalanen <ppaalanen@=
gmail.com>:
>
> On Tue, 16 Jan 2024 14:11:43 +0000
> Andri Yngvason <andri@yngvason.is> wrote:
>
> > =C3=BEri., 16. jan. 2024 kl. 13:29 skrifa=C3=B0i Sebastian Wick
> > <sebastian.wick@redhat.com>:
> > >
> > > On Tue, Jan 16, 2024 at 01:13:13PM +0000, Andri Yngvason wrote:
> > [...]
> > > > =C5=9Fri., 16. jan. 2024 kl. 11:42 skrifa=C4=9Fi Sebastian Wick
> > > > <sebastian.wick@redhat.com>:
> > > > >
> > > > > On Mon, Jan 15, 2024 at 04:05:52PM +0000, Andri Yngvason wrote:
> > > > > > From: Werner Sembach <wse@tuxedocomputers.com>
> > > > > >
> > > > > > Add a new general drm property "force color format" which can b=
e used
> > > > > > by userspace to tell the graphics driver which color format to =
use.
> > > > >
> > > > > I don't like the "force" in the name. This just selects the color
> > > > > format, let's just call it "color format" then.
> > > > >
> > > >
> > > > In previous revisions, this was "preferred color format" and "actua=
l
> > > > color format", of which the latter has been dropped. I recommend
> > > > reading the discussion for previous revisions.
> > >
> > > Please don't imply that I didn't read the thread I'm answering to.
>
> FYI, I have not read this thread.
>

pq, You did not read this summary?
https://lore.kernel.org/dri-devel/CAFNQBQwjeJaX6B4oewpgASMUd5_nxZYMxUfdOG29=
4CTVGBTd1w@mail.gmail.com/

You partook in the discussion on IRC. Please read it and tell me if I
misunderstood anything.

Sebastian, I apologise. You clearly read it as you even replied to it!

> > >
> > > > There are arguments for adding "actual color format" later and if i=
t
> > > > is added later, we'd end up with "color format" and "actual color
> > > > format", which might be confusing, and it is why I chose to call it
> > > > "force color format" because it clearly communicates intent and
> > > > disambiguates it from "actual color format".
> > >
> > > There is no such thing as "actual color format" in upstream though.
> > > Basing your naming on discarded ideas is not useful. The thing that s=
ets
> > > the color space for example is called "Colorspace", not "force
> > > colorspace".
> > >
> >
> > Sure, I'm happy with calling it whatever people want. Maybe we can
> > have a vote on it?
>
> It would sound strange to say "force color format" =3D "auto". Just drop
> the "force" of it.
>
> If and when we need the feedback counterpart, it could be an immutable
> prop called "active color format" where "auto" is not a valid value, or
> something in the new "output properties" design Sima has been thinking
> of.

There seems to be consensus for calling it "color format"

>
> > > > [...]
> > > > > > @@ -1396,6 +1404,15 @@ static const u32 dp_colorspaces =3D
> > > > > >   *   drm_connector_attach_max_bpc_property() to create and att=
ach the
> > > > > >   *   property to the connector during initialization.
> > > > > >   *
> > > > > > + * force color format:
> > > > > > + *   This property is used by userspace to change the used col=
or format. When
> > > > > > + *   used the driver will use the selected format if valid for=
 the hardware,
> > > > >
> > > > > All properties are always "used", they just can have different va=
lues.
> > > > > You probably want to talk about the auto mode here.
> > > >
> > > > Maybe we can say something like: If userspace does not set the
> > > > property or if it is explicitly set to zero, the driver will select
> > > > the appropriate color format based on other constraints.
> > >
> > > The property can be in any state without involvement from user space.
> > > Don't talk about setting it, talk about the state it is in:
> > >
> > >   When the color format is auto, the driver will select a format.
> > >
> >
> > Ok.
> >
> > > > >
> > > > > > + *   sink, and current resolution and refresh rate combination=
. Drivers to
> > > > >
> > > > > If valid? So when a value is not actually supported user space ca=
n still
> > > > > set it? What happens then? How should user space figure out if th=
e
> > > > > driver and the sink support the format?
> > > >
> > > > The kernel does not expose this property unless it's implemented in=
 the driver.
> > >
> > > If the driver simply doesn't support *one format*, the enum value for
> > > that format should not be exposed, period. This isn't about the prope=
rty
> > > on its own.
> >
> > Right, understood. You mean that enum should only contain values that
> > are supported by the driver.
>
> Yes. When a driver installs a property, it can choose which of the enum
> entries are exposed. That cannot be changed later though, so the list
> cannot live by the currently connected sink, only by what the driver
> and display controlled could ever do.

Yes, and I think that basing it also on the connected sink's
capabilities would just add complexity for very little gain. In fact,
I think that limiting it based on the driver's capabilities is also
over-engineering, but I don't mind adding it if that's what people
really want.

>
> > > > This was originally "preferred color format". Perhaps the
> > > > documentation should better reflect that it is now a mandatory
> > > > constraint which fails the modeset if not satisfied.
> > >
> > > That would definitely help.
> > >
> > > > >
> > > > > For the Colorspace prop, the kernel just exposes all formats it s=
upports
> > > > > (independent of the sink) and then makes it the job of user space=
 to
> > > > > figure out if the sink supports it.
> > > > >
> > > > > The same could be done here. Property value is exposed if the dri=
ver
> > > > > supports it in general, commits can fail if the driver can't supp=
ort it
> > > > > for a specific commit because e.g. the resolution or refresh rate=
. User
> > > > > space must look at the EDID/DisplayID/mode to figure out the supp=
orted
> > > > > format for the sink.
> > > >
> > > > Yes, we can make it possible for userspace to discover which modes =
are
> > > > supported by the monitor, but there are other constraints that need=
 to
> > > > be satisfied. This was discussed in the previous revision.
> > >
> > > I mean, yes, that's what I said. User space would then only be
> > > responsible for checking the sink capabilities and the atomic check
> > > would take into account other (non-sink) constraints.
> >
> > Since we need to probe using TEST_ONLY anyway, we'll end up with two
> > mechanisms to do the same thing where one of them depends on the other
> > for completeness.
>
> What do you mean by "same thing"?

I thought that it would be clear that I did not mean that they were
literally equal. This was discussed on IRC and summarised in the email
message that I linked to above. Excerpt:
"I asked if it made sense to add color format capabilities to the mode info
struct, but the conclusion was that it wouldn't really be useful because we
need TEST_ONLY anyway to see if the color format setting is compatible with
other settings."

>
> Neither HDMI nor DisplayPort have a feedback message saying your
> infoframe contents are unacceptable, that I know of. Even if there was,
> it would come too late for failing the atomic commit ioctl in
> non-blocking mode.
>
> In general, display signalling is that you send whatever to the sink,
> and hope for the best.
>
> EDID is used to describe what the sink can accept, so in theory the
> kernel could parse EDID for all of these details and reject atomic
> commits that attempt unsupported configurations. However, EDID are also
> notoriously buggy. They are good for a best guess, but I believe it is
> useful to be able to try "unsupported" things. IIRC, PS VR2
> intentionally lies for instance.
>
> Even if the kernel did reject everything based on EDID, the only way
> today for userspace to know what should work is to parse the EDID
> itself. TEST_ONLY trials lead to a combinatorial explosion too easily.
> So userspace is already expected to parse EDID, with the major
> exception being video mode lists that are explicitly provided by the
> kernel in UAPI.

I thought that everyone agreed that display settings GUIs don't suffer
from combinatorial explosion because settings are selected in a
predefined order so they don't need to test all permutations.

>
> EDID and DisplayID standards also evolve. The kernel could be behind
> userspace in chasing them, which was the reason why the kernel does not
> validate HDR_OUTPUT_METADATA against EDID.
>
> The design of today with HDR_OUTPUT_METADATA and whatnot is
> that userspace is responsible for checking sink capabilities, and
> atomic check is responsible for driver and display controller
> capabilities.

I'm not really sure where you're going with this. Are you for or
against userspace parsing EDID instead of getting the information from
the kernel?

>
> > > > In any case, these things can be added later and need not be a part=
 of
> > > > this change set.
> > >
> > > No, this is the contract between the kernel and user space and has to=
 be
> > > figured out before we can merge new uAPI.
>
> Indeed.

I don't see how adding something later to cut down on the
combinatorial explosion can possibly break any kind of contract in the
way things are currently implemented. Can anyone provide examples of
how things can go wrong in this particular instance?

Thanks,
Andri
