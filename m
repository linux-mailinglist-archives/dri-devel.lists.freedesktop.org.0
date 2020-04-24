Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 184651B6FC5
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 10:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A8216EA91;
	Fri, 24 Apr 2020 08:32:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 078676EA91
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 08:32:23 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id f8so7000944lfe.12
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 01:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=LI7PfMUdXJZejbp6PYVat4xB7uGqlTGLiN8795cz7MA=;
 b=lyivE80OIN5F4etIxKgDfyguLYtbydk/uh17zstKifFWCE6iSTkLbUo+hXq5Wi3Z3J
 9exXYD1nlCIbrTbo08qPWryRDyAvJHwjpbqF2hcGncU1jBwWVXWNGb8BuZlDpGeCUO67
 /Iz6+XFkj76Wh27/YYgNF5RKKRMjNd9Hr2j7i5wvGY7XzT4sFcgrvhpSXU/x8Y3+dc61
 QNaOM1OS0NftTP+mfyO3Ww7ZosumoPmK4dMjgMAA6mUAzuh5E5hrmWE+btAxkNThp5E9
 LB9dcmT4IbsiL5shuqCERdMEntIxGAuWj6HFHHC+cw7bYfKIT54bwuB7uXnKe9b3wLDh
 64Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=LI7PfMUdXJZejbp6PYVat4xB7uGqlTGLiN8795cz7MA=;
 b=PJutYnbbk+jsjbYBaCrH1nPAdUlhQMN1TC5Kt3u3uO4fF7Q2Lr3+D8uZwGeCUgTqqL
 UK2mynhrRnJ+56Sw152ZlTXgX74+vJWjjoxvh+0+TkdVD0UdBxWCD4IJDFdeOE1dj/U7
 5H1BE+bhes1QrwGuP1T+e+zPgdvdkfTbUk1p2vnJRTi9neXX7/0O1NtbtyvvwKd9JdBF
 HrTtrtklW45wKCbfWXuohlUAvrJfO1QQaxGySySrGlAPSDMuBvVpKwFby8TJIsCLBPHD
 3gy5csCWnqjRrBAQsZXWHKrMHO3NQGbjJmRvc54tul6kJ+aSurA5OJQGMvZk3f+hwDbA
 x7oA==
X-Gm-Message-State: AGi0PubIaNjdlHehpcsgpBKOdBrOBt3foImyLnNPwG6Wzg8Ue0R1oQiS
 A+14zukZwr8gTpkXlLPRYa0=
X-Google-Smtp-Source: APiQypL/bnEFytHz1Vk30905GPnXac5PHtiZH0Dt8ealHUEQ8O60xrukcSNrEFQTniFBJjYLvKnMKQ==
X-Received: by 2002:a05:6512:1046:: with SMTP id
 c6mr5439588lfb.115.1587717141223; 
 Fri, 24 Apr 2020 01:32:21 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id 137sm4079920lfa.48.2020.04.24.01.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 01:32:20 -0700 (PDT)
Date: Fri, 24 Apr 2020 11:32:16 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: Operating KMS UAPI (Re: RFC: Drm-connector properties managed
 by another driver / privacy screen support)
Message-ID: <20200424113216.3b5d4e90@eldfell.localdomain>
In-Reply-To: <CAKMK7uEr6eHfEuGfLU_JTk=fbo=FBcU_aasGwUTRACny7WeojQ@mail.gmail.com>
References: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
 <87tv1k4vl6.fsf@intel.com>
 <d47ba6ef-efd0-9f28-1ae4-b971b95a8f8b@redhat.com>
 <20200417120226.0cd6bc21@eldfell.localdomain>
 <CAKMK7uEv_khNFC=JUyuQgDZp1p5eudDCrH0we+UdEdTV3H=Tsg@mail.gmail.com>
 <20200420112704.68d02472@eldfell.localdomain>
 <20200420130420.1a24197e@eldfell.localdomain>
 <20200421121552.GT3456981@phenom.ffwll.local>
 <20200421173300.3cd078f4@eldfell.localdomain>
 <CAKMK7uEr6eHfEuGfLU_JTk=fbo=FBcU_aasGwUTRACny7WeojQ@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0558767805=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0558767805==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/PFmHNt5YErQgmmUXIZA.qcD"; protocol="application/pgp-signature"

--Sig_/PFmHNt5YErQgmmUXIZA.qcD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 23 Apr 2020 17:01:49 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Tue, Apr 21, 2020 at 4:33 PM Pekka Paalanen <ppaalanen@gmail.com> wrot=
e:
> >
> > On Tue, 21 Apr 2020 14:15:52 +0200
> > Daniel Vetter <daniel@ffwll.ch> wrote:
> > =20

...

> > > Note that the kernel isn't entire consistent on this. I've looked a b=
it
> > > more closely at stuff. Ignoring content protection I've found followi=
ng
> > > approaches things:
> > >
> > > - self refresh helpers, which are entirely transparent. Therefore we =
do a
> > >   hack to set allow_modeset when the self-refresh helpers need to do a
> > >   modeset, to avoid total surprise for userspace. I think this is onl=
y ok
> > >   for these kind of behind-the-scenes helpers like self-refresh.
> > >
> > > - link-status is always reset to "good" when you include any connecto=
r,
> > >   which might force a modeset. Even when allow_modeset isn't set by
> > >   userspace. Maybe we should fix that, but we've discussed forever ho=
w to
> > >   make sure a bad link isn't ever stuck at "bad" for old userspace, so
> > >   we've gone with this. But maybe limiting to only allow_modeset cases
> > >   would also work. =20
> >
> > Wait, what do you mean "include any connector"?
> >
> > What exactly could cause a modeset instead of failure when
> > ALLOW_MODESET is not set? =20
>=20
> If you do an atomic commit with the connector included that has the
> bad link status, then it'll reset it to Good to try to get a full
> modeset to restore stuff. If you don't also have ALLOW_MODESET set,
> it'll fail and userspace might be sad and not understand what's going
> on. We can easily fix this by only forcing the link training to be
> fixed if userspace has set ALLOW_MODESET.

Hi,

oh, that's ok, the fail case is there like it should.

It sounded like even if userspace does not set ALLOW_MODESET, the
kernel would still do a modeset in come cases. I'm happy to have
misunderstood.

> > Does that mean that I'll never need to implement link-status handling
> > in Weston, because the kernel will recover the link anyway? If the
> > kernel does that, then what's the point of having a link-status
> > property to begin with? =20
>=20
> Well generally all your compositor does all day long is flip buffers.
> So you'll never get the kernel into restoring the link. Hence the
> uevent, so that the compositor can a) update the mode list, which
> might have changed b) do the modeset to restore stuff. The
> auto-fallback is so that stuff like users manually
> disabling/re-enabling an output actually helps with fixing stuff.

Ok, that's fine.

If link goes bad while Weston does not implement link-status, I'm
totally happy to degree any fallout from that to be a Weston bug. It
has never worked (right?), so it cannot be a kernel regression. It is
quite important to me to be able to say to that a failure is a Weston
bug, not a kernel regression, to not piss on the kernel devs.

> > > - I guess we could do stuff that only fires off when allow_modeset is=
 set,
> > >   but I haven't found some examples. I thought we've had some outside=
 of
> > >   self-refresh helpers already. The closest I've found is again
> > >   link-status, which never allows userspace to set BAD, and silently
> > >   upgrades to GOOD. So that userspace doing a blind safe/restore can't
> > >   wreak stuff permanently. =20
> >
> > Sounds like link-status was designed with a blind save/restore in mind.=
 =20
>=20
> Yeah that part we didn't screw up.
>=20
> > > It's all a bit nasty :-/
> > >
> > > I think we should at least allow userspace to do a blind restore with
> > > allow_modeset and not expect bad side-effects. That would mean fixing=
 at
> > > least the content protection stuff.
> > >
> > > Plus documenting this in the kernel somewhere. As the official thing =
to
> > > do. But maybe we want some actual userspace doing this before we ensh=
rine
> > > it as official policy. The content protection fix is a one-liner and =
can
> > > be cc'ed stable. =20
> >
> > I'd probably not go there, a blind save does not guarantee a good
> > state. The fix to "Content Protection" is not necessary (as long as
> > userspace does not do a blind save/restore) if we can get the default
> > state from the kernel. If we get the default state from the kernel,
> > then userspace would be doing a blind restore but not save, meaning
> > that the state actually is sane and writable.
> >
> > I'd love to volunteer for writing the Weston code to make use of "get me
> > sane default state" UAPI, but I'm afraid I'm not in that much control
> > of my time. =20
>=20
> The problem is, what is your default state? Driver defaults (generally
> fairly random and mostly everything is off)? After fbcon has done
> it's, which might never happen when you've disabling fbdev/fbcon?
> Boot-up state from the firmware for drivers like i915 that support
> fastboot (and what if that's garbage)? These can all be different too.

I believe what I want is more or less the driver defaults, or DRM core
defaults for common KMS properties. It does not matter if they are
arbitrary, as long as they remain the same across kernel versions. They
need to be constants, so that I can rely on always getting to the same
state on the same piece of hardware when I use the "default state"
regardless of what might be happening software wise.

But of course the defaults must be legal values and they should make
some sense. I'd consider "neutral", "identity", and "off" to be
sensible values, but what that means for each property depends on the
exact property. So there may be work to be done to unify the default
values across drivers for driver-specific properties.

Having stuff off by default is ok. If that makes things not work, then
we'll fix userspace to understand the new properties that are
necessary. At no point it can be said to be a kernel regression - at
least I very much hope and intend so.

There is always the problem of someone using new userspace first on old
kernel that does not expose "default state" so userspace doesn't use
"default state". Then upgrading to new kernel that has "default state"
that is not good for making things work, but userspace starts using it
because it becomes available and fails. Is there any way we can stop
that from being seen as a kernel regression?

Fbcon has exactly the problem that fbcon might not exist, so we cannot
rely on that. Is fbcon even reliable enough to offer constant defaults
that could be relied upon to stay the same across kernel versions and
software configurations?

State from firmware I would not trust at all, who knows when a firmware
upgrade changes things.

What I'm saying is, the "default state" would very much be UABI. Not
just how to access it, but the exact values of it for all existing
properties. The important invariant is: for the same piece of hardware,
I always get the same defaults (if any), regardless of any software or
firmware versions.

This invariant should guarantee that e.g. measured monitor color
profiles stay valid across kernel upgrades. I know, people who actually
care about color do not trust even reboots, but if we can let them get
away with just verifying the profile instead of wasting hours in
re-measuring the profile, that would be good.

When a driver starts supporting a new property, it must set the default
value of the property to the value it has been using implicitly before.
But if that implicit value was not hardcoded and depends on variable
factors, then we probably cannot avoid a change in behaviour when
introducing the property or "default values".

> The hard part isn't the uapi, it's the implementation and defining
> what you mean. Generally everyone wants their own version of default
> value semantics, so this a) encodes policy, which we try to avoid in
> the kernel and b) will be epic amounts of endless bikeshedding and
> fighting between use-cases.

It's a policy, yes. But we need a single source of arbitrary default
values, so that we have a strategy for achieving the same hardware
state even when userspace does not understand all KMS properties:

- after losing and re-gaining DRM master status (e.g. temporary
  VT-switch to another KMS program that modifies state I don't
  understand), and

- across changes in the software stack.

The former is the most important point, the latter would be good to
have.

We already have a policy in the kernel: fbcon KMS state. If everyone
can agree to that state, it's fine by me, but it also needs to be
available when fbcon support is disabled. Maybe this could be a path
forward? Expose what state fbcon would use, regardless of whether fbcon
exists. It would probably miss the latter point, though, but that could
be acceptable.

If we could trust that the KMS state is "sane" when any KMS program
starts, then this problem doesn't exist: just read out the KMS state on
start-up and use that. But since we don't know where the existing KMS
state comes from, it could be anything. And for smooth hand-off between
display servers, we can't have per DRM file description KMS state
either.


Thanks,
pq

--Sig_/PFmHNt5YErQgmmUXIZA.qcD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl6ipBAACgkQI1/ltBGq
qqeqhw/9Fsl2/e9Q36rUVCUw5sdcUw323gQKfGVfX2sd1t6qNmSUkDVTVDmRdx5+
N6ZJG9nGH/axfPpX5ltNq36TIov7NuW0pvagsYDokymsH7H6iRdDYde9fh9HsfqW
bpUaNDHqcwACj7qqRATbbPeiIY2jgfbwapMzykdVayN7D0nTo+alKHQ24JV223vb
HuhJe516cA+BNdHoy3D8t4iHS1Ap/BZmCEqdsDoIvnDWNvgbf2zBwWCdYTPLGyKl
Gvt+cuhwZvtWWyk6m0kkOJ/xp24fHnD37ZEwCUVJLtIxp9yj2CVtBGy8sWkCyj8n
lC15hQfLl2rqdioiVgx/+sdquK3uURaiKHsMhI7Fe+xi6qEff4A0Y8w6gq4RSupe
ENn4QeUPAwaNVRSjWLVpH28Erf4SyqMLRGwfF3tClj3P9SovOO4ihZF+7XMmn6ln
qo3+NWiVFTP701ZTYuFR/z/znY6t/f4bC2lvGfffxOjw1jEZq+2XxDGUTjpJBe5o
Vw+clSmGdX6xRc8ZnQkRcc6OI4d5erUr18jjH/UW6cPMVBLVDihQLt7MA6YcFy1D
7Jwy6OKVZyc0nx6y9aNsybTbAXPoW/pljxIoElw6HELNuCW5JoqD37vv0/S//JHY
7N22dKSAKNx49q1+bKGBzdt/Owb0bK3gZJ48ZlD9J9LZNgyF+xc=
=oClf
-----END PGP SIGNATURE-----

--Sig_/PFmHNt5YErQgmmUXIZA.qcD--

--===============0558767805==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0558767805==--
