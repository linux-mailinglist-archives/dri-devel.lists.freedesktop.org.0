Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CF91BD914
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 12:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9B246E180;
	Wed, 29 Apr 2020 10:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 685576E180
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 10:08:09 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id h6so1174745lfc.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 03:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=jDwW43sCFinv1sir0fZo0uxS6kBRjy7RtEDIzDWbFKw=;
 b=ti1JPfBjwppfqnVsLQJt+C4+bP6ZtBgX0z0RxgI4z+DqDo8xBVQw6EaQXAJXBfHI3f
 YZ2JH/1ft9t8kOBdAdvuJwjQb42fU2JunEEeAiqpnRGN9o1ZWGyp/jCIyqXKMbYFV52I
 XTIDXTbWhd52SSC8dvcIoU18gZ/oy5CEFBeiCpQF6KC9xZ5ygXCklwyqpTNAUzY64ll5
 STqi7hPCM/sSz3qYZFWJA0+sVmKTljV1JJUuU8LNuEwrjUrGEe4BHN+JLeuO2ntM/2CP
 AmtPQKqd/OdaXpCb3PkurWIbvLwp/KS9hoMrjJCf4ALGyHorqQ3lX4RpYxLKn/ocMflU
 hmWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=jDwW43sCFinv1sir0fZo0uxS6kBRjy7RtEDIzDWbFKw=;
 b=KuKB8tXBaYqgHMKi8KC9IshN4iMmHKXBt7uVgqJMNP62vHcYriH/uBZU923OZM76AH
 qh7wj2CzDeZGChRmqNslgLTSm+/uv1qcTjnXxUnf3Uj7IwKdML9sxM+Dce7MkVOpXrpO
 OUMtSmppbDD3W3uGm8GrzAEVZhxiFXOXKxJ2jodozPo+dJXztS23d52gD3oiu9Wt2Bxi
 GiDiORNHESVr9NOAkKIgcZtdpcXmb5TUq+0he+zyzTHKFgQCyQ71jfxLeBeDCWokld3j
 KESb4DcFEZOKYSujjUtwFDOOToaGussw5zs01p5l4Q5ql9lueKAvuHwve3BRQ4sesFJd
 Wrvg==
X-Gm-Message-State: AGi0PubTGk2ZdhQE3myxOymTsv/6EEkkTZvYTbe1FLB2/Wbo03jeEWUL
 CCkhbMPgpChGg3y3vWIXD6E=
X-Google-Smtp-Source: APiQypJCtmiEaWI2Ps/nWSNWlPA8Jn0G6+EmXxKNo3y7gCXZhXnp4DtYWxCT2ritGdwUSje/n6ldRw==
X-Received: by 2002:ac2:5ccf:: with SMTP id f15mr5428574lfq.216.1588154887480; 
 Wed, 29 Apr 2020 03:08:07 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id d22sm2310270lfe.75.2020.04.29.03.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 03:08:06 -0700 (PDT)
Date: Wed, 29 Apr 2020 13:07:54 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: Operating KMS UAPI (Re: RFC: Drm-connector properties managed
 by another driver / privacy screen support)
Message-ID: <20200429130754.311d7178@eldfell.localdomain>
In-Reply-To: <20200428145157.GP3456981@phenom.ffwll.local>
References: <87tv1k4vl6.fsf@intel.com>
 <d47ba6ef-efd0-9f28-1ae4-b971b95a8f8b@redhat.com>
 <20200417120226.0cd6bc21@eldfell.localdomain>
 <CAKMK7uEv_khNFC=JUyuQgDZp1p5eudDCrH0we+UdEdTV3H=Tsg@mail.gmail.com>
 <20200420112704.68d02472@eldfell.localdomain>
 <20200420130420.1a24197e@eldfell.localdomain>
 <20200421121552.GT3456981@phenom.ffwll.local>
 <20200421173300.3cd078f4@eldfell.localdomain>
 <CAKMK7uEr6eHfEuGfLU_JTk=fbo=FBcU_aasGwUTRACny7WeojQ@mail.gmail.com>
 <20200424113216.3b5d4e90@eldfell.localdomain>
 <20200428145157.GP3456981@phenom.ffwll.local>
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
Content-Type: multipart/mixed; boundary="===============0523573747=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0523573747==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/06Mkxp+neyeDv0NS_W8QLnQ"; protocol="application/pgp-signature"

--Sig_/06Mkxp+neyeDv0NS_W8QLnQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 28 Apr 2020 16:51:57 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Fri, Apr 24, 2020 at 11:32:16AM +0300, Pekka Paalanen wrote:
> > On Thu, 23 Apr 2020 17:01:49 +0200
> > Daniel Vetter <daniel@ffwll.ch> wrote:
> >  =20
> > > On Tue, Apr 21, 2020 at 4:33 PM Pekka Paalanen <ppaalanen@gmail.com> =
wrote: =20
> > > >
> > > > On Tue, 21 Apr 2020 14:15:52 +0200
> > > > Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >   =20
> >=20
> > ...

Hi,

please skip to the TL;DR at the bottom, the rest is just how I ended up
there.

> >  =20
> > > > > Note that the kernel isn't entire consistent on this. I've looked=
 a bit
> > > > > more closely at stuff. Ignoring content protection I've found fol=
lowing
> > > > > approaches things:
> > > > >
> > > > > - self refresh helpers, which are entirely transparent. Therefore=
 we do a
> > > > >   hack to set allow_modeset when the self-refresh helpers need to=
 do a
> > > > >   modeset, to avoid total surprise for userspace. I think this is=
 only ok
> > > > >   for these kind of behind-the-scenes helpers like self-refresh.
> > > > >
> > > > > - link-status is always reset to "good" when you include any conn=
ector,
> > > > >   which might force a modeset. Even when allow_modeset isn't set =
by
> > > > >   userspace. Maybe we should fix that, but we've discussed foreve=
r how to
> > > > >   make sure a bad link isn't ever stuck at "bad" for old userspac=
e, so
> > > > >   we've gone with this. But maybe limiting to only allow_modeset =
cases
> > > > >   would also work.   =20
> > > >
> > > > Wait, what do you mean "include any connector"?
> > > >
> > > > What exactly could cause a modeset instead of failure when
> > > > ALLOW_MODESET is not set?   =20
> > >=20
> > > If you do an atomic commit with the connector included that has the
> > > bad link status, then it'll reset it to Good to try to get a full
> > > modeset to restore stuff. If you don't also have ALLOW_MODESET set,
> > > it'll fail and userspace might be sad and not understand what's going
> > > on. We can easily fix this by only forcing the link training to be
> > > fixed if userspace has set ALLOW_MODESET. =20
> >=20
> > Hi,
> >=20
> > oh, that's ok, the fail case is there like it should.
> >=20
> > It sounded like even if userspace does not set ALLOW_MODESET, the
> > kernel would still do a modeset in come cases. I'm happy to have
> > misunderstood. =20
>=20
> Well currently that can go wrong, if you include a connector and a
> link-status is bad. But could be fixed fairly easily.

What do you mean by "include a connector"? Which property on which
object?

Weston always submits more or less full KMS state (known properties on
intended-active outputs) on all updates, on simple pageflips too, so I
am worried that the connector is "included", leading to automatic
papering over link-status failures, and Weston doesn't handle
link-status yet.

Weston does this, because it is the easy thing to do and debug. You
don't have to track back thousands of frames to figure out what the
mode or the connectors are, when something doesn't work like it should.
Or to figure out why some state wasn't emitted when it was supposed to.


> > > > I'd probably not go there, a blind save does not guarantee a good
> > > > state. The fix to "Content Protection" is not necessary (as long as
> > > > userspace does not do a blind save/restore) if we can get the defau=
lt
> > > > state from the kernel. If we get the default state from the kernel,
> > > > then userspace would be doing a blind restore but not save, meaning
> > > > that the state actually is sane and writable.
> > > >
> > > > I'd love to volunteer for writing the Weston code to make use of "g=
et me
> > > > sane default state" UAPI, but I'm afraid I'm not in that much contr=
ol
> > > > of my time.   =20
> > >=20
> > > The problem is, what is your default state? Driver defaults (generally
> > > fairly random and mostly everything is off)? After fbcon has done
> > > it's, which might never happen when you've disabling fbdev/fbcon?
> > > Boot-up state from the firmware for drivers like i915 that support
> > > fastboot (and what if that's garbage)? These can all be different too=
. =20
> >=20
> > I believe what I want is more or less the driver defaults, or DRM core
> > defaults for common KMS properties. It does not matter if they are
> > arbitrary, as long as they remain the same across kernel versions. They
> > need to be constants, so that I can rely on always getting to the same
> > state on the same piece of hardware when I use the "default state"
> > regardless of what might be happening software wise.
> >=20
> > But of course the defaults must be legal values and they should make
> > some sense. I'd consider "neutral", "identity", and "off" to be
> > sensible values, but what that means for each property depends on the
> > exact property. So there may be work to be done to unify the default
> > values across drivers for driver-specific properties.
> >=20
> > Having stuff off by default is ok. If that makes things not work, then
> > we'll fix userspace to understand the new properties that are
> > necessary. At no point it can be said to be a kernel regression - at
> > least I very much hope and intend so.
> >=20
> > There is always the problem of someone using new userspace first on old
> > kernel that does not expose "default state" so userspace doesn't use
> > "default state". Then upgrading to new kernel that has "default state"
> > that is not good for making things work, but userspace starts using it
> > because it becomes available and fails. Is there any way we can stop
> > that from being seen as a kernel regression? =20
>=20
> If you upgrade the kernel and existing userspace breaks, it's a
> regression.
>=20
> There's no wiggle room in this, the only wiggle room is that sometimes
> people don't report issues, and eventually all affected hw is dead.

Then the only possibility is that the transition from not using default
state to using default state does not change anything. Which means that
the default state must be the state the KMS program would normally
inherit, so, fbcon state?

> > Fbcon has exactly the problem that fbcon might not exist, so we cannot
> > rely on that. Is fbcon even reliable enough to offer constant defaults
> > that could be relied upon to stay the same across kernel versions and
> > software configurations? =20
>=20
> It's getting hacked on quite a bit, in a fairly ad-hoc fashion. So
> "defaults as fbcon sets them" is something that's under fair bit of
> change.

Yet, it seems to be the only "sane state" defined so far. Maybe we have
to live with it changing from boot to boot.

We also cannot ever have anything better, because of the above issue
"new userspace, old kernel, then upgrade kernel", can we? It doesn't
"break" userspace but it could be a regression for the end user,
because upgrading the kernel changes something that is visible and no
longer the same as before, e.g. breaking monitor calibration or profile
because suddenly some color related property is set differently.

When new KMS properties are introduced, how do people pick their
default values in the kernel when no userspace sets them yet? Are those
defaults immutable for eternity afterwards?

> > State from firmware I would not trust at all, who knows when a firmware
> > upgrade changes things.
> >=20
> > What I'm saying is, the "default state" would very much be UABI. Not
> > just how to access it, but the exact values of it for all existing
> > properties. The important invariant is: for the same piece of hardware,
> > I always get the same defaults (if any), regardless of any software or
> > firmware versions. =20
>=20
> Yup, that's why default state exposed by the kernel is such a pain: It's
> uapi. If we change it, we can break something somewhere. And the problem
> is complex enough that there's going to be lots of opinions about what
> the default should be.

I think the current situation is just *hoping* that kernel doesn't
change its defaults when they are not even defined in any one place.
The defaults userspace currently gets in most cases is whatever it
inherits from fbcon. And you said fbcon changes ad-hoc.

> fbcon is a lot easier here, since there there's at least some agreement
> that a working console should be visible and preferrably right side up and
> all that.

Yeah, but what about gamma, color and other details that the console
usually doesn't care about as long as e.g. red is somewhat reddish?

I remember someone telling me, that fbcon does not reset gamma tables,
which means any gamma using KMS app can mess up the console and all
other KMS apps that don't use gamma.

> > This invariant should guarantee that e.g. measured monitor color
> > profiles stay valid across kernel upgrades. I know, people who actually
> > care about color do not trust even reboots, but if we can let them get
> > away with just verifying the profile instead of wasting hours in
> > re-measuring the profile, that would be good.
> >=20
> > When a driver starts supporting a new property, it must set the default
> > value of the property to the value it has been using implicitly before.
> > But if that implicit value was not hardcoded and depends on variable
> > factors, then we probably cannot avoid a change in behaviour when
> > introducing the property or "default values". =20
>=20
> The problem is in figuring out that implicit value. In some cases I think
> it's even "whatever the hw booted with", but I've tried to handle these
> kinds of issues with atomic at least.
>=20
> > > The hard part isn't the uapi, it's the implementation and defining
> > > what you mean. Generally everyone wants their own version of default
> > > value semantics, so this a) encodes policy, which we try to avoid in
> > > the kernel and b) will be epic amounts of endless bikeshedding and
> > > fighting between use-cases. =20
> >=20
> > It's a policy, yes. But we need a single source of arbitrary default
> > values, so that we have a strategy for achieving the same hardware
> > state even when userspace does not understand all KMS properties:
> >=20
> > - after losing and re-gaining DRM master status (e.g. temporary
> >   VT-switch to another KMS program that modifies state I don't
> >   understand), and
> >=20
> > - across changes in the software stack.
> >=20
> > The former is the most important point, the latter would be good to
> > have. =20
>=20
> But you can fix the above use-case also with save&restore. Which we're
> trying to support (but even that has bugs).

Ok, so we're back to blind save & restore with undefined default state,
that depends not only on the hardware, the firmware, the kernel and
drivers, but also what was the previous KMS client doing before you
took over.

The only way to avoid undefined state is for all KMS programs to learn
to know all existing properties, and maybe warn the user if any
unrecognised properties appear. If KMS programs refuse to work when
unrecognised properties appear, that means you will never be able to
add anything to the properties again. Then you probably add caps for
new properties and we are back to square one except the UAPI is a lot
more complicated and userspace can longer warn the end user about
potentially bad KMS state.

Since the kernel refuses to provide a constant default state, maybe we
need a userspace library for that - one that *must* be updated for
every new property added to the kernel. Then we could circumvent the
kernel stable UAPI rules to provide predictable behaviour for userspace
that wants it.

Except, that too, would hit the "new userspace, old kernel, then
upgrade kernel" scenario where a kernel upgrade breaks userspace
because it allows userspace to start using new properties with legal
and working but different values from what it had before.

Are we really in a dead end with this?

> > We already have a policy in the kernel: fbcon KMS state. If everyone
> > can agree to that state, it's fine by me, but it also needs to be
> > available when fbcon support is disabled. Maybe this could be a path
> > forward? Expose what state fbcon would use, regardless of whether fbcon
> > exists. It would probably miss the latter point, though, but that could
> > be acceptable.
> >=20
> > If we could trust that the KMS state is "sane" when any KMS program
> > starts, then this problem doesn't exist: just read out the KMS state on
> > start-up and use that. But since we don't know where the existing KMS
> > state comes from, it could be anything. And for smooth hand-off between
> > display servers, we can't have per DRM file description KMS state
> > either. =20
>=20
> You can assume that boot-up state is about as "sane" as it gets. So a
> system compositor (in logind or whatever, it already deals with this
> stuff) can reset the screen.

System compositors largely do not exist, the whole concept has been
dismissed. If logind would reset the screen, we would no longer have
seamless hand-off between any display servers and anything. Logind
could hand off the state for others to use as default state though.

How would one get the boot-up state?

Why do we need a userspace daemon to record KMS boot-up state instead
of the kernel giving it to userspace? How would that daemon itself get
the boot-up state if it has already been modified by fbcon?

> For everything else I'm not sure kernel defaults actually fixes anything.
> It just gives everyont the illusion that now the problem is fixed, except
> the fix is now kernel uapi, which means we can never change it.

If we want constant defaults, then by definition they cannot ever be
changed. It doesn't matter where it comes from.

I suppose the conclusion is that we cannot have constant defaults at
all. The only defaults we can have are undefined. If someone does not
like it, he needs to implement unrecognised properties in whatever
userspace he cares about.

> The upshot of doing the exact same as a logind request along the lines of
> "pls reset display to sane state, thx" is that logind can be changed much
> easier than kernel uapi in case we get this wrong. Which we will.

Sorry, I don't see the difference if the goal is to have fixed
defaults. The only difference with logind is that there is no angry
Linus.


TL;DR:

If blind save & restore (but restricted only to cases where KMS state
may have been lost!) works, it will ensure that a running userspace
program has what it was started with, but it does not guarantee that
the state is the same between restarts of the program.

It seems that the default state is always undefined, and cannot be
defined because whatever one defines might not always result in a
picture on screen. Bugs in defined default state cannot be fixed, by
definition as the default state is immutable once defined.

Ensuring consistent state between restarts is the responsibility of
userspace and each KMS program individually. They might attempt to
blindly save KMS state in a file to be re-used on the next start.


Thanks,
pq

--Sig_/06Mkxp+neyeDv0NS_W8QLnQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl6pUfoACgkQI1/ltBGq
qqfcbw/8CwFT7cgv4xe1Ic/X+qQEPmeykYyfeXYzB5YxW246ak2QZkYWjSRf20Lv
yyGviIxqlA+7Q/oNLjS9wm/ajiQac5v82A7duvtQ1gthqhEjMX3NSqhEdgEJDBAi
nobAfBlDzAkAG0VTxwPpf/mWfbheaK3mslv32fryYmXd2m1/EeFMrzDfSvpM3D9k
nXZVgaA8hOM2JmHDIWeLsRZuvnmpz5Dhl7bwch/zdA5fG2KpNturR5yobrRevbUE
Sq2LOe599V/M2cWUvR5d9xH40M+p0YLO3H+2LpqA7rL8e6mnAI9NqGjET+T8NSNu
mYk7KjRsROzLibHI0mZh/NzImw5722qSqLlC3G3emDsesrCe0uK3HZO70L709EKM
lOa+yeQZl1ri05j85AZmaosumEm93HmPs5NyUaRYbwMRpoV3vKZkwKlfq3fripXE
U1xiDRzmKFNyRgp+n1CO6qpVEhYjK+kwXV5o2tcvIA/sWU9caeUOWRnzmThbf0g7
2Pw7DPAR7y49UhJ6J8eo6DuRGen7cycaFZODfOayB+A7tmqbO3pyRImj8dIrUoI/
q6iAxFY7fVZxw1UgeU3I62wN6/i5JFDlHCDDpFKZJEWekhCUNv6CgsGH2gQLRcWs
d1a387zAJrySDUEwVEpx/QxHviLybpUxV4kCdIc/+HJo4dFcjJs=
=wLoj
-----END PGP SIGNATURE-----

--Sig_/06Mkxp+neyeDv0NS_W8QLnQ--

--===============0523573747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0523573747==--
