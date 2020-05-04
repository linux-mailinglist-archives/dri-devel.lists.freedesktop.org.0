Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEA01C360F
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 11:49:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E6EA89F4F;
	Mon,  4 May 2020 09:49:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66BFF89F4F
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 09:49:20 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id s9so3968094lfp.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 May 2020 02:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=zwkcyhvVr/EXQ9Vusw16asZLr0QDONcgoxUDhSFTOUI=;
 b=VUEJBsOg1pXiSu17H+Kt7VQWI79kVyT2E3zwH5W81Vk098qsvSt14V5bG5cO2gEx1Q
 oyjHOsWvi3RpgMZM4a/Hm5JbQvM1NToTCdQmUfB77/TCRgTJiyTr+OuPCaQdbNejDfI+
 0QYyHVwWtj0pfAAmCnbQATMoj4KdWeUhbmX0ZY3OPJlJ6VYFI30bi6wNvh5V/cpQ/cSH
 fD6zzalDG6sXOTTLVH+1VUAcPT0E6r2lQenHoin3uzSm8tDq/qSFXwV3JkuyHsTBXsxG
 MAaDlRJMCY9U87IxygQke0j31VeNF432cBOdrINIX0nrEVTk+/X80XHb3d778ZrIknEK
 ibgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=zwkcyhvVr/EXQ9Vusw16asZLr0QDONcgoxUDhSFTOUI=;
 b=mbhJU21rHGEjqfmuRONaThMBQwEOh8s2V7pbHxzDbe6qdfSfzebRlx2GoVyv7liVD+
 5h/qt3H0OGCFU+YNL3kW0M+xVslwg+58t5+w4eTvDtBBwkt/VaREaLihWdQeR+17SP93
 0fqearxH4VUNA5eefFJTKcmvd4tYHgj3nx7vn4ddh1+kRtuavEEdmZe5VrZ9xUiAzCHU
 9mPSypbtPaoaDNTC8bzdxKFsufBozdOujb2LeYdQHp9jnHRz/p+bKne4x5eeYUEMe9j6
 R+OKyRfK2TzPN9ssAPWbAW3NhpEi4sRiyKJx6/4WQLpINQzRrbvoQeCPoLZdzJNBlPig
 APLw==
X-Gm-Message-State: AGi0PuaFziZhVNMQwqo+YEJz4wzywwKuq/K0P2XxDRMxt16dZt0Gih88
 xbfMlOPPAV/bzNfC9Jztomw=
X-Google-Smtp-Source: APiQypKFwTom9hnUHnVpMXok98wj/sW5gVrzm4uvTf0XjnZl+tQnA45Qz+aWcipx8uZJ19JoZGqkxg==
X-Received: by 2002:a19:d97:: with SMTP id 145mr9939473lfn.193.1588585758618; 
 Mon, 04 May 2020 02:49:18 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id t16sm11806952lff.72.2020.05.04.02.49.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 02:49:18 -0700 (PDT)
Date: Mon, 4 May 2020 12:49:13 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: Operating KMS UAPI (Re: RFC: Drm-connector properties managed
 by another driver / privacy screen support)
Message-ID: <20200504124913.65f6087f@eldfell.localdomain>
In-Reply-To: <20200430135323.GC10381@phenom.ffwll.local>
References: <20200417120226.0cd6bc21@eldfell.localdomain>
 <CAKMK7uEv_khNFC=JUyuQgDZp1p5eudDCrH0we+UdEdTV3H=Tsg@mail.gmail.com>
 <20200420112704.68d02472@eldfell.localdomain>
 <20200420130420.1a24197e@eldfell.localdomain>
 <20200421121552.GT3456981@phenom.ffwll.local>
 <20200421173300.3cd078f4@eldfell.localdomain>
 <CAKMK7uEr6eHfEuGfLU_JTk=fbo=FBcU_aasGwUTRACny7WeojQ@mail.gmail.com>
 <20200424113216.3b5d4e90@eldfell.localdomain>
 <20200428145157.GP3456981@phenom.ffwll.local>
 <20200429130754.311d7178@eldfell.localdomain>
 <20200430135323.GC10381@phenom.ffwll.local>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: Benjamin Berg <bberg@redhat.com>, David Airlie <airlied@linux.ie>,
 Christian Kellner <ckellner@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Hans de Goede <hdegoede@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Nitin Joshi1 <njoshi1@lenovo.com>, Rajat Jain <rajatja@google.com>,
 Mark Pearson <mpearson@lenovo.com>
Content-Type: multipart/mixed; boundary="===============0822997559=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0822997559==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ItQDunt1M/YoIdrz=A/Bt28"; protocol="application/pgp-signature"

--Sig_/ItQDunt1M/YoIdrz=A/Bt28
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 30 Apr 2020 15:53:23 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Wed, Apr 29, 2020 at 01:07:54PM +0300, Pekka Paalanen wrote:
> > On Tue, 28 Apr 2020 16:51:57 +0200
> > Daniel Vetter <daniel@ffwll.ch> wrote:
> >  =20
> > > On Fri, Apr 24, 2020 at 11:32:16AM +0300, Pekka Paalanen wrote: =20
> > > > On Thu, 23 Apr 2020 17:01:49 +0200
> > > > Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >    =20
> > > > > On Tue, Apr 21, 2020 at 4:33 PM Pekka Paalanen <ppaalanen@gmail.c=
om> wrote:   =20
> > > > > >
> > > > > > On Tue, 21 Apr 2020 14:15:52 +0200
> > > > > > Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > >     =20
> > > >=20
> > > > ... =20
> >=20
> > Hi,
> >=20
> > please skip to the TL;DR at the bottom, the rest is just how I ended up
> > there.
> >  =20
> > > >    =20
> > > > > > > Note that the kernel isn't entire consistent on this. I've lo=
oked a bit
> > > > > > > more closely at stuff. Ignoring content protection I've found=
 following
> > > > > > > approaches things:
> > > > > > >
> > > > > > > - self refresh helpers, which are entirely transparent. There=
fore we do a
> > > > > > >   hack to set allow_modeset when the self-refresh helpers nee=
d to do a
> > > > > > >   modeset, to avoid total surprise for userspace. I think thi=
s is only ok
> > > > > > >   for these kind of behind-the-scenes helpers like self-refre=
sh.
> > > > > > >
> > > > > > > - link-status is always reset to "good" when you include any =
connector,
> > > > > > >   which might force a modeset. Even when allow_modeset isn't =
set by
> > > > > > >   userspace. Maybe we should fix that, but we've discussed fo=
rever how to
> > > > > > >   make sure a bad link isn't ever stuck at "bad" for old user=
space, so
> > > > > > >   we've gone with this. But maybe limiting to only allow_mode=
set cases
> > > > > > >   would also work.     =20
> > > > > >
> > > > > > Wait, what do you mean "include any connector"?
> > > > > >
> > > > > > What exactly could cause a modeset instead of failure when
> > > > > > ALLOW_MODESET is not set?     =20
> > > > >=20
> > > > > If you do an atomic commit with the connector included that has t=
he
> > > > > bad link status, then it'll reset it to Good to try to get a full
> > > > > modeset to restore stuff. If you don't also have ALLOW_MODESET se=
t,
> > > > > it'll fail and userspace might be sad and not understand what's g=
oing
> > > > > on. We can easily fix this by only forcing the link training to be
> > > > > fixed if userspace has set ALLOW_MODESET.   =20
> > > >=20
> > > > Hi,
> > > >=20
> > > > oh, that's ok, the fail case is there like it should.
> > > >=20
> > > > It sounded like even if userspace does not set ALLOW_MODESET, the
> > > > kernel would still do a modeset in come cases. I'm happy to have
> > > > misunderstood.   =20
> > >=20
> > > Well currently that can go wrong, if you include a connector and a
> > > link-status is bad. But could be fixed fairly easily. =20
> >=20
> > What do you mean by "include a connector"? Which property on which
> > object?
> >=20
> > Weston always submits more or less full KMS state (known properties on
> > intended-active outputs) on all updates, on simple pageflips too, so I
> > am worried that the connector is "included", leading to automatic
> > papering over link-status failures, and Weston doesn't handle
> > link-status yet. =20
>=20
> Include a connector =3D you have a property for a connector included in y=
our
> atomic update. Sounds like you do that, so if you have a real world
> link-status failure, then things go a bit boom already.

Are you talking about setting a connector's property, like "CRTC_ID",
"Content Protection", "HDCP Content Type"? Weston sets all of those on
every update if they exist. Or is it about any property on any
connector, not just a specific property on the specific connector, or
any property on the specific connector?

Also CRTC properties "MODE_ID" and "ACTIVE" are set on every update,
modeset or not. Weston just trusts that no-op changes in state do not
require a modeset.

Is it not the opposite? If a link fails, then Weston will produce a
glitch when the kernel automatically re-trains the link, and then
everything continues happily?

> I guess we need a kernel patch to make sure link-status only gets fixed
> when userspace is ok with a modeset.

That would be nice, but would it not also mean the above Weston case
ends up with a permanent black screen instead of a temporary glitch?

Or is there a hotplug uevent at play here too?

> > Weston does this, because it is the easy thing to do and debug. You
> > don't have to track back thousands of frames to figure out what the
> > mode or the connectors are, when something doesn't work like it should.
> > Or to figure out why some state wasn't emitted when it was supposed to.
> >=20

...

> One idea I proposed on irc is that logind would capture the boot-up state,
> and you'd do a loginctl reset-screen cmd to reset it if something broke
> somewhere. logind already has the code for forced vt switching, that feels
> like a reasonable extension of that.

Needing to run a command manually to restore the screen instead of
"simply" switching to the graphical login manager to re-gain user
control seems a bit difficult.

> Then you could pick between "smooth transitions" (probably best for users
> only using 1 compositor) and "whack it back to boot-up state when
> switching to a new compositor" (maybe best default if you run multiple
> different compositors, logind could even do that automatically).

I think even better would be for logind to serialize and hand out the
default state it saved, instead of applying it. Then the compositor who
takes over can integrate the default state into its own state and
inherited state to apply it all in one commit.

Doing so, the compositor could even do a TEST_ONLY commit without
ALLOW_MODESET to see if a smooth transition is possible. If not, it can
skip some smooth transition animation for instance.

> > > The upshot of doing the exact same as a logind request along the line=
s of
> > > "pls reset display to sane state, thx" is that logind can be changed =
much
> > > easier than kernel uapi in case we get this wrong. Which we will. =20
> >=20
> > Sorry, I don't see the difference if the goal is to have fixed
> > defaults. The only difference with logind is that there is no angry
> > Linus. =20
>=20
> Oh it's the exact same problem, but more focused. E.g. we don't have to
> worry about embedded stuff, because that's going to run one compositor
> only. So entire class of regression reports goes away.
>=20
> If we put the defaults into the kernel, then more people will use it (it's
> there), so the wiggle room is substantially reduced once we do have
> conflict demands.
>=20
> logind with multiple different compositors is going to be used on
> desktops/latops only, so some chances that the definition of what default
> should be all match up.
>=20
> Also no regression pretty much applies across the board, e.g. we don't
> have modifiers enabled in many compositors by default yet because it
> breaks stuff.

I'm not sure I understand, but ok, I'll stop pushing for it.


> > TL;DR:
> >=20
> > If blind save & restore (but restricted only to cases where KMS state
> > may have been lost!) works, it will ensure that a running userspace
> > program has what it was started with, but it does not guarantee that
> > the state is the same between restarts of the program.
> >=20
> > It seems that the default state is always undefined, and cannot be
> > defined because whatever one defines might not always result in a
> > picture on screen. Bugs in defined default state cannot be fixed, by
> > definition as the default state is immutable once defined.
> >=20
> > Ensuring consistent state between restarts is the responsibility of
> > userspace and each KMS program individually. They might attempt to
> > blindly save KMS state in a file to be re-used on the next start. =20
>=20
> I disagree with "each KMS program individually". We already have defined
> protocols for drm master switching: Either the cooperative vt-switch
> dance, or the unpriviledge switch logind allows. We also have ad-hoc
> definitions of smooth transitions, it's "one primary plane, untiled". Some
> people broke that, and now we have getfb2 so you can smoothly transition
> even with tiled buffers. Except not everyone supports that.

Switching is not the point with saving unrecognized KMS state into a
compositor-specific file. The point of the file is to re-create the
exact same KMS state after the compositor has been restarted,
regardless of what KMS program might have ran first.

Use case: when you have completed monitor color profiling, the profile
may become invalid as soon as anything affecting colors changes, e.g.
link bit depth. With all the new properties for color spaces, HDR etc.
the likelihood of an unrecognized property affecting colors is quite
high. Either the property must be reset to the value it had during
profiling, or the profile needs to be rejected. This is more about
rebooting the machine than it is about switching between display
servers.

If the compositor has such a file saved, it might as well use it also
for sanitation when switching from another display server.

This still does not handle the case where a kernel upgrade introduces a
new property, the graphical login manager sets the property altering
colors, and the session compositor you profiled does not recognize the
new property and also does not have it saved in the file because it
didn't exist last time. But maybe that's a corner-case enough, and
people who care will notice the profile is invalid when physically
measuring its validity before starting to work. But this could be seen
as a kernel regression too: you only had to upgrade the kernel. Logind
saving state before fbcon takes over could remedy this, if the session
compositor integrated the logind saved state on every start.

But again we would rely on kernel not changing the hardware state
between kernel versions before fbcon takes over.


Thanks,
pq

--Sig_/ItQDunt1M/YoIdrz=A/Bt28
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl6v5RkACgkQI1/ltBGq
qqfRYxAAssMw8jhFVniPyt+CRgyJMofyt49ifhJ7sgrIlXoiAMn+VsigslFoQkBh
wa+hHu7WJsOq1Y2aMqUMFnubB8mrri8bQF9kJCgsW0TitXUfosWJ6mHG4dNtA0CE
4UEwJ18jdBwH4GxjKaErcENr+w/lEEWmk2K9txnSDOEF2BzjxTqexmPss/AUWvTb
tIiYffarqmUsQXXANsWmSIWgB0kh7NiurtKFTScplAMIXA9eOVdh1BnYDy+sThtK
PRjZmGg68RYZ5VcNSUbjHlruKANKRzHa9knOL+pyCBmjBf2znFrxSd/X4KD2274l
gfaZzGCDkNHPIzB7oO26tDxkMUK33zOc/bZ330EUfrfic3LsZbqPAl1k5FSPiaqt
cgQi7HO1lrhm7VS9wC7pFMOhF8qbxAF0gRj1txUA4Oe/g1biK9ziK5wllk80Q/8K
GelIm0L7sXAyntKNnn/5xqh1wgd7TiGb7VCikEqPzHq8OX421OLtqiPH7VbSueAU
mU4WycfE/Y5IFklBrhpzJM/1HOPbcRHBeV8qc6C4pcJMqv5CVx9jQM36cXjSlV9z
MUS8gx0QYxAQcYTOaNxCkm40VTRFfXDY65LGzrGiZyj4YFyI4VQDWkmJMiSbY2V0
eRNSq0M6Lh4YyPrmWf7VBbwni21pPHEiLxlC5kU4cWa4QCekaPY=
=zDX0
-----END PGP SIGNATURE-----

--Sig_/ItQDunt1M/YoIdrz=A/Bt28--

--===============0822997559==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0822997559==--
