Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A10671C3940
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 14:22:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1EDB897B4;
	Mon,  4 May 2020 12:22:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C0E897B4
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 12:22:43 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id 188so9515351lfa.10
 for <dri-devel@lists.freedesktop.org>; Mon, 04 May 2020 05:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=HxlubSyIWATPiyQXokEJL8k7DdCjjPQGzX9S/Eh4ShU=;
 b=Oq3rcYMpfDb+1ixp9mYlhlK+R4/Y7+0v22snTOptEAMJ/HXDj1ka4tm6C34EX/xBzE
 1KqlDybmSrahLHE/+H8n/fmGo62yClS8ha5GUUB5MBtM2HR7B5Eht+38Dzzdcv/SEXPf
 auKkOwetBCpLVVWOkRMC/6aXSoqJSngmh9Uhz/SLIJa9bUfYrf9knahJsATJmVkmrZJb
 id9z1g5rLG6yjqKMvc3uo3eHJ/TorYVxDjAPtz7xN9zK2qfKEgranmpdbHG6EYEnkExL
 pJUUyC+niPDa6UgsApwmEG6gQhXFZSDJIul2uuLh/CpzgyLQJdJbkir7zbImE8ofkwxP
 QVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=HxlubSyIWATPiyQXokEJL8k7DdCjjPQGzX9S/Eh4ShU=;
 b=Ej1iXsH6rw4lv5fX2051Jv9fSw3NI7sRcNlqTum8yr3Dsl+zV6a6WhIyOEEXBH0Iuv
 Xg5gsapiR9TJaM4cQM8+cPEw0ueXOEI3DFWdUt9dzWh44oTeMgqlX6EdwUMzGKWdHB1d
 RwkmR9SG9pzzF+ljGyBVsmH4Q9TIZ0wXJarh23xNcA09YSF12IzP5QlRZP6EGKgGCTZm
 HrpggxCDsTD2YchJUBxdkfvZejv1/hiV2b6VY5Pm6Y7kCFc9fsar+htXaPjDPJ5ssGxJ
 3x5qstoajIY62tPx+tQH1ypxmCrSpqDpAsfTx84kWE9MJ2RmA9JgcFKwni7GAYtBrUHv
 go7w==
X-Gm-Message-State: AGi0PuYDRxguOVWWQFUeQc6khWmer8D0jElX4bl+2lAUGRcETXsye1aV
 0Vzl9I1aGdiXfdaXsz/Lg2c=
X-Google-Smtp-Source: APiQypJpGLK9FpZitMX7KnRDIQ3bLXUgKHxhua64fuxCL5AB1jMbu63W7VNH0ZPiHWDrKuCxQUj/2g==
X-Received: by 2002:ac2:55b1:: with SMTP id y17mr7291033lfg.168.1588594961642; 
 Mon, 04 May 2020 05:22:41 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id j23sm9522494lfh.65.2020.05.04.05.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 05:22:41 -0700 (PDT)
Date: Mon, 4 May 2020 15:22:28 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: Operating KMS UAPI (Re: RFC: Drm-connector properties managed
 by another driver / privacy screen support)
Message-ID: <20200504152228.4885e26f@eldfell.localdomain>
In-Reply-To: <CAKMK7uGEi6=SK8=943Eu2AVW9yhj=scTvjdguTYQKhXzyL4D4w@mail.gmail.com>
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
 <20200504124913.65f6087f@eldfell.localdomain>
 <CAKMK7uGEi6=SK8=943Eu2AVW9yhj=scTvjdguTYQKhXzyL4D4w@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0615347482=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0615347482==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Sgz000b/N4B.uZrtN_NSPp5"; protocol="application/pgp-signature"

--Sig_/Sgz000b/N4B.uZrtN_NSPp5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 4 May 2020 13:00:02 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Mon, May 4, 2020 at 11:49 AM Pekka Paalanen <ppaalanen@gmail.com> wrot=
e:
> >
> > On Thu, 30 Apr 2020 15:53:23 +0200
> > Daniel Vetter <daniel@ffwll.ch> wrote:
> > =20
> > > On Wed, Apr 29, 2020 at 01:07:54PM +0300, Pekka Paalanen wrote: =20
> > > > On Tue, 28 Apr 2020 16:51:57 +0200
> > > > Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > =20
> > > > > On Fri, Apr 24, 2020 at 11:32:16AM +0300, Pekka Paalanen wrote: =
=20
> > > > > > On Thu, 23 Apr 2020 17:01:49 +0200
> > > > > > Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > > =20
> > > > > > > On Tue, Apr 21, 2020 at 4:33 PM Pekka Paalanen <ppaalanen@gma=
il.com> wrote: =20
> > > > > > > >
> > > > > > > > On Tue, 21 Apr 2020 14:15:52 +0200
> > > > > > > > Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > > > > =20
> > > > > >

> > > Include a connector =3D you have a property for a connector included =
in your
> > > atomic update. Sounds like you do that, so if you have a real world
> > > link-status failure, then things go a bit boom already. =20
> >
> > Are you talking about setting a connector's property, like "CRTC_ID",
> > "Content Protection", "HDCP Content Type"? Weston sets all of those on
> > every update if they exist. Or is it about any property on any
> > connector, not just a specific property on the specific connector, or
> > any property on the specific connector? =20
>=20
> Any property on the specific connector where link-status has gone "bad".

Ok, now I got it clearly. Thanks.

> > Also CRTC properties "MODE_ID" and "ACTIVE" are set on every update,
> > modeset or not. Weston just trusts that no-op changes in state do not
> > require a modeset =20
>=20
> Yup that's generally valid assumption, but also that's enough to hit
> the link-status =3D=3D "bad" forced modeset I think.
>=20
> > Is it not the opposite? If a link fails, then Weston will produce a
> > glitch when the kernel automatically re-trains the link, and then
> > everything continues happily? =20
>=20
> That's the soft link failure, where the kernel can recover on its own.
> There's the harder one where the new link status is degraded, and the
> old mode doesn't fit. Or the kernel just threw a fit and can't make
> stuff work anymore, and waits for the next userspace commit. Iirc for
> MST links we can't easily do this because locking, so gets pushed to a
> full modeset commit. Or something like that.
>=20
> > > I guess we need a kernel patch to make sure link-status only gets fix=
ed
> > > when userspace is ok with a modeset. =20
> >
> > That would be nice, but would it not also mean the above Weston case
> > ends up with a permanent black screen instead of a temporary glitch?
> >
> > Or is there a hotplug uevent at play here too? =20
>=20
> Yeah you get a hotplug uevent, so as long as you eventually process
> that and do a full modeset should be ok.

I suppose Weston falls short there. Getting a hotplug event does not
force a modeset on all active CRTCs. Weston does re-read resources and
properties, but it does not trigger anything like re-picking the video
mode if the connection status and EDID remains the same.

I hope we can say Weston never worked with link failures to begin with,
and fix things properly through the link status property in Weston.

> > > > Weston does this, because it is the easy thing to do and debug. You
> > > > don't have to track back thousands of frames to figure out what the
> > > > mode or the connectors are, when something doesn't work like it sho=
uld.
> > > > Or to figure out why some state wasn't emitted when it was supposed=
 to.
> > > > =20
> >
> > ...
> > =20
> > > One idea I proposed on irc is that logind would capture the boot-up s=
tate,
> > > and you'd do a loginctl reset-screen cmd to reset it if something bro=
ke
> > > somewhere. logind already has the code for forced vt switching, that =
feels
> > > like a reasonable extension of that. =20
> >
> > Needing to run a command manually to restore the screen instead of
> > "simply" switching to the graphical login manager to re-gain user
> > control seems a bit difficult. =20
>=20
> But that requires mind reading skills. Computer can't tell the "pls
> don't wreak stuff, I want smooth switching" from "pls wreak stuff,
> because it's glitching" wish the user has when vt-switching.

No, it doesn't. The graphical login manager already saved its default
state and it will always reinstate its default state. The session
compositor hopefully inherits the same or at least compatible default
state from the login manager, so the session compositor has it too. So
smooth hand-over is always possible unless the session compositor goes
out of its way to set otherwise. If the session compositor screws
something up like a gamma table, the login manager's default state will
just overwrite the bad data anyway. Whether that becomes a smooth
transition or not depends on whether the reset needs a modeset and if
the old FB is understandable.

The session will be permanently broken, as it will re-break when
switching back to it, but at least the login manager remains always
accessible.

> > > Then you could pick between "smooth transitions" (probably best for u=
sers
> > > only using 1 compositor) and "whack it back to boot-up state when
> > > switching to a new compositor" (maybe best default if you run multiple
> > > different compositors, logind could even do that automatically). =20
> >
> > I think even better would be for logind to serialize and hand out the
> > default state it saved, instead of applying it. Then the compositor who
> > takes over can integrate the default state into its own state and
> > inherited state to apply it all in one commit. =20
>=20
> Yeah that'd be a flavour of this userspace protocol that we need first
> - I have no idea about compositor interactions in userspace and what
> protocols they'd want, my input isn't going to be much use here I
> think.
>=20
> > Doing so, the compositor could even do a TEST_ONLY commit without
> > ALLOW_MODESET to see if a smooth transition is possible. If not, it can
> > skip some smooth transition animation for instance. =20
>=20
> Generally that's not enough, most people want some blending. And for
> blending, you need to be able to read&understand what's already there.
> Hence getfb2 so you can get at modifiers.

I assumed a smooth transition does not make sense if a modeset is
required. TEST_ONLY is useful for checking that.

...

> Maybe to clarify: I'm not against adding something to solve this to
> the kernel, period. If logind (or whatever) implements a proper
> compositor switching protocol for kms state (instead of the current
> "whatever, maybe glitches" approach), and it turns out the kernels
> needs something to make that work, we can add it. But adding default
> state to the kernel just so compositors can continue to not coordinate
> how vt switching and all that is supposed to work without glitches and
> leftover planes/cursors or whatever, then no, I don't like that idea.
> Because I don't think it'll really work. If that means vt switching is
> only glitch-free and can be reset to a working state if a compositor
> crashed if you have logind working, *shrug*.

We don't actually need new kernel UAPI for doing the non-cooperative
ignorant design. We can just do a blind save & restore to get that. (By
"blind", I have always meant "including properties you do not
understand"; not that you would use the state set as a whole without
merging it with other inherited or wanted state which you do
understand.)

What I was after with the kernel-hardcoded defaults is keeping the same
state across restarts and reboots, even when the kernel gains new KMS
properties. After all, the kernel drivers are the only thing that could
know what the value in the hardware was before a new property to
control it is introduced. A side-effect of such defaults being
available is that they could be used instead of the blind save, to do a
blind restore of the properties a KMS program does not understand.

> > > > TL;DR:
> > > >
> > > > If blind save & restore (but restricted only to cases where KMS sta=
te
> > > > may have been lost!) works, it will ensure that a running userspace
> > > > program has what it was started with, but it does not guarantee that
> > > > the state is the same between restarts of the program.

This was about switching.

> > > >
> > > > It seems that the default state is always undefined, and cannot be
> > > > defined because whatever one defines might not always result in a
> > > > picture on screen. Bugs in defined default state cannot be fixed, by
> > > > definition as the default state is immutable once defined.
> > > >
> > > > Ensuring consistent state between restarts is the responsibility of

Here I started talking about "restarts".

> > > > userspace and each KMS program individually. They might attempt to
> > > > blindly save KMS state in a file to be re-used on the next start. =
=20
> > >
> > > I disagree with "each KMS program individually". We already have defi=
ned
> > > protocols for drm master switching: Either the cooperative vt-switch
> > > dance, or the unpriviledge switch logind allows. We also have ad-hoc
> > > definitions of smooth transitions, it's "one primary plane, untiled".=
 Some
> > > people broke that, and now we have getfb2 so you can smoothly transit=
ion
> > > even with tiled buffers. Except not everyone supports that. =20
> >
> > Switching is not the point with saving unrecognized KMS state into a
> > compositor-specific file. The point of the file is to re-create the
> > exact same KMS state after the compositor has been restarted,
> > regardless of what KMS program might have ran first. =20
>=20
> This example isn't about when you can capture the "default state",
> saving on every vt switch doesn't work. This was another example to
> illustrate that smooth, glitch-free vt switching without coordination
> between compositors (and enforced by logind) doesn't work. Some
> compositors leave a tiled buffer behind, if the new compositor doesn't
> implement getfb2 then you get ugly artifacts when trying to blend to
> the new screen.

Right, about switching. The blind save & restore solves switching
for the the unrecognized KMS properties. I was not seeking to ensure
that switching results in smooth transitions, only that smooth
transitions are not deliberately made impossible by e.g. logind always
resetting KMS state on switch.

So I consider switching solved, the only open question is about
restarts.

> > Use case: when you have completed monitor color profiling, the profile
> > may become invalid as soon as anything affecting colors changes, e.g.
> > link bit depth. With all the new properties for color spaces, HDR etc.
> > the likelihood of an unrecognized property affecting colors is quite
> > high. Either the property must be reset to the value it had during
> > profiling, or the profile needs to be rejected. This is more about
> > rebooting the machine than it is about switching between display
> > servers.
> >
> > If the compositor has such a file saved, it might as well use it also
> > for sanitation when switching from another display server.
> >
> > This still does not handle the case where a kernel upgrade introduces a
> > new property, the graphical login manager sets the property altering
> > colors, and the session compositor you profiled does not recognize the
> > new property and also does not have it saved in the file because it
> > didn't exist last time. But maybe that's a corner-case enough, and
> > people who care will notice the profile is invalid when physically
> > measuring its validity before starting to work. But this could be seen
> > as a kernel regression too: you only had to upgrade the kernel. Logind
> > saving state before fbcon takes over could remedy this, if the session
> > compositor integrated the logind saved state on every start.
> >
> > But again we would rely on kernel not changing the hardware state
> > between kernel versions before fbcon takes over. =20
>=20
> I guess my point is, this is a lot bigger problem than just the
> default state. This =3D vt switching that doesn't look horrible and
> doesn't result in artifacts and issues on the new compositor.

I am interested in getting reliably to the same hardware state as you
used to have before, either after reboots or after vt-switches. The
transition does not have to be guaranteed to be smooth, but at the same
time the restore policy should not exclude the possibility of a
smooth transition.


Thanks,
pq

--Sig_/Sgz000b/N4B.uZrtN_NSPp5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl6wCQQACgkQI1/ltBGq
qqdamw//cfHBWLKbF+v36z8TDJj+uv0ovJWPkpTwsx7Ns3E51LMr4KOEkWj0FFE9
cmbk9OtWtmKBehvbowONSPguzKgGbothvtGpRrrEXRAtDicmOwINPpyBhX0FiTV6
PfCdnFEWfGfEWjdZqsiuBr4seHGCV1pXDHb3dfWeDJyguQrY0uBGYvBa1k3SVSt8
8p8wj5nnzMGRe8necDRNS6ogEXAROyKqlnev7dcSw/xyuLYWVIe9Srs3nHhbwBhg
vfyCxa++XqsS4xsW8cYS+PX0KBXBtbg9ALG3gU8vIOkRaPPaN1uBC+To/KOd7CYv
ulOQ8D2WCglpvyaOi/TxetICgqw2fq7+fMUM8nyGRB6zu5ceQ9dLVtgFyfLNz2pS
3VVSdbiKmERpR6UGRUsZ6u8hUtMQ2uWxtQp4ke0No2LUi3KM7eTTGiUVGILfQ04w
gvx76m1bDTgO4iwfwQT0oZch7yC9194GOXAi5/2foQ7ftbjeNgBI4YhklC1ne0wq
W4q3tkag+FZgz5kw3vJsxeTBWvQKiv8z7bWuI+bQlHdfNAVa0Rxtm1kYSHSSDrrr
pU6G50Rhyqhl8WJ/75BnEUbZ0MFvZs+HZzTxpcAI/RS5QxZSCZ2mlbPV76ZxssjC
clWxRy2T2+9RC6faHQdKsNC7Y3PiWK+UJm7OhdlGBRudgV4mx1E=
=m3pX
-----END PGP SIGNATURE-----

--Sig_/Sgz000b/N4B.uZrtN_NSPp5--

--===============0615347482==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0615347482==--
