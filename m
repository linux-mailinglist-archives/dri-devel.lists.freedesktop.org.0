Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC6E1B29E9
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 16:33:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B39D6E994;
	Tue, 21 Apr 2020 14:33:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4DC66E994
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 14:33:13 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id u15so14235508ljd.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 07:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=n2Enz+qkiWfSIjuQiWp5VZaOPu5Co+Ge7Wyk9JqMlOA=;
 b=KY4skzPgsXZxF6fC/TnollEnsqwNds4X+kg17WrGTZ+SKwmVOJZ6nuV/6o9joZfa7P
 CHmfjCHLv8U7EZS775mSvrQ/lV4M2XK6HpogXchi9Wpjd70gD8raDgUYH1M40yMc68k9
 vD+YN/HBUX4w2fp0kGsW7oHKXyVd8DN2uf4tzsd8FMS2xc+Uhu0Opc2IcWBss6MvMi2D
 4W/0IkJwby8mSuzEHgkJ4xmcR+y12H3s6yD6JsYw80Q8k8fjJGDl29q9EpIDPigi7jH3
 tBZae6hSL5obvIEXWywtI7RBFHLjaxVl7bA/GtATIZNiEMnFWQTa3qDXCd6WUVVIGSaH
 K5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=n2Enz+qkiWfSIjuQiWp5VZaOPu5Co+Ge7Wyk9JqMlOA=;
 b=e6s4vlRdH/R4p1A7EkVRSGOsynErR0b26f0oWK61AZ0cmT4oPHvFsqnwkuXFE7aW//
 FTp+uBpzfLZ5X0d4tF8JDY4Qmksm65zAh0g0kRqDb57LVAELhqNYKXkhK9Nb0Q7wsbZk
 Rf39L9R29z22KzCN0K29/KZGuFaAh9pbEjBDZ8O+Yf0hfJeqSby+NqnE5LXFCqhCRfoD
 YcGvF7SsfGX0qy/BSxTl1k4GoXCw9nFSiDwfK1KICg8GhpptmqXR95gik+t0vdxmgC6W
 3AcER7cPuMh8dDRTve4Tar48xUeWmjdrjnGAlX2qlNvI1abU9TncRILdZgFo1u+BS7NQ
 lniw==
X-Gm-Message-State: AGi0PuZmpRL5BXbWJZh/oeHukiFUgVMtfTSnPj7nqJZOJZ0Txi7t3xB8
 bJJhMWiyiN6ayaV9M+WLkg4=
X-Google-Smtp-Source: APiQypKiIgB7waLOabr+u9W6gTw7chyNE+Wlv8KeRCE96at1VDZamwp3rGB7ruOARhzuiYUpPB9DWA==
X-Received: by 2002:a05:651c:8a:: with SMTP id 10mr13597892ljq.6.1587479592041; 
 Tue, 21 Apr 2020 07:33:12 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id x11sm2067684ljj.15.2020.04.21.07.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 07:33:11 -0700 (PDT)
Date: Tue, 21 Apr 2020 17:33:00 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: Operating KMS UAPI (Re: RFC: Drm-connector properties managed
 by another driver / privacy screen support)
Message-ID: <20200421173300.3cd078f4@eldfell.localdomain>
In-Reply-To: <20200421121552.GT3456981@phenom.ffwll.local>
References: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
 <87tv1k4vl6.fsf@intel.com>
 <d47ba6ef-efd0-9f28-1ae4-b971b95a8f8b@redhat.com>
 <20200417120226.0cd6bc21@eldfell.localdomain>
 <CAKMK7uEv_khNFC=JUyuQgDZp1p5eudDCrH0we+UdEdTV3H=Tsg@mail.gmail.com>
 <20200420112704.68d02472@eldfell.localdomain>
 <20200420130420.1a24197e@eldfell.localdomain>
 <20200421121552.GT3456981@phenom.ffwll.local>
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
Content-Type: multipart/mixed; boundary="===============0382221639=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0382221639==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/aCZHHtoUqUcA6lNSfp/dkhV"; protocol="application/pgp-signature"

--Sig_/aCZHHtoUqUcA6lNSfp/dkhV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 21 Apr 2020 14:15:52 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Mon, Apr 20, 2020 at 01:04:20PM +0300, Pekka Paalanen wrote:
> > On Mon, 20 Apr 2020 11:27:04 +0300
> > Pekka Paalanen <ppaalanen@gmail.com> wrote:
> >  =20
> > > On Fri, 17 Apr 2020 16:17:18 +0200
> > > Daniel Vetter <daniel@ffwll.ch> wrote:
> > >  =20
> > > > On Fri, Apr 17, 2020 at 11:02 AM Pekka Paalanen <ppaalanen@gmail.co=
m> wrote:   =20
> > > > >
> > > > > Hi,
> > > > >
> > > > > let's think about how userspace uses atomic KMS UAPI. The simples=
t way
> > > > > to use atomic correctly is that userspace will for every update s=
end the
> > > > > full, complete set of all properties that exist, both known and u=
nknown
> > > > > to userspace (to recover from temporarily VT-switching to another=
 KMS
> > > > > program that changes unknown properties). Attempting to track whi=
ch
> > > > > properties already have their correct values in the kernel is ext=
ra
> > > > > work for just extra bugs.     =20
> > > >=20
> > > > Uh if you do that you'll get random surprising failures if you don't
> > > > also set ALLOW_MODESET, because that way you'll automatically repair
> > > > link failures and stuff like that. I'm assuming your userspace only
> > > > supplies all the properties for crtc and planes, and leaves connect=
ors
> > > > as-is? Otherwise you already have some fun bugs.
> > > >=20
> > > > In general I'd say userspace shouldn't write stuff it doesn't
> > > > understand. If you limit yourself to just the properties you do want
> > > > to (re)set, that's safe. But if you just blindly write everything a=
ll
> > > > the time, random modesets, and hence random failures if you don't s=
et
> > > > ALLOW_MODESET.   =20
> > >=20
> > > Hi,
> > >=20
> > > how should userspace KMS program A recover from the situation when
> > > switching the VT back from KMS program B who changed properties that
> > > program A does not recognise? (I believe Weston does not recover at
> > > the moment.) This is very important for getting e.g. reliable color
> > > reproduction, since not all KMS programs are always up-to-date with
> > > everything the kernel exposes and people may switch between them. Not
> > > resetting everything may even encourage people to write hacks where y=
ou
> > > temporarily VT-switch away, run a KMS program to set one property, and
> > > then switch back assuming the property remains set. I have already se=
en
> > > someone mention they can enable VRR behind the display server's back
> > > like this.
> > >=20
> > > I don't think Weston records and re-sets unknown properties yet, but I
> > > assumed it is what it needs to do to be able to reliably recover from
> > > VT-switches. In that case ALLOW_MODESET is of course set since all
> > > state is unknown and assumed bad.
> > >=20
> > > I do believe Weston re-submits *everything* it knows about every
> > > update, except for CRTCs and connectors it has already disabled and
> > > knows are in disabled state (this could change though).
> > >=20
> > > However, during steady-state operation when ALLOW_MODESET should not =
be
> > > necessary, is it still harmful to re-program *all* properties on every
> > > update?
> > >=20
> > > After all, the kernel will just no-op all property setting where the
> > > value is already the right one, does it not?
> > >=20
> > > The only "random" KMS state is the properties the userspace KMS
> > > program does not know that are set on start-up. I have been assuming
> > > that as long as you had fbdev active before the KMS program started,
> > > the unknown properties have "harmless" default values. And maybe even=
 at
> > > driver device init if fbdev does not exist?
> > >=20
> > > Is there something more up-to-date than
> > > https://blog.ffwll.ch/2016/01/vt-switching-with-atomic-modeset.html ?=
 =20
>=20
> Sadly, nothing changed since then.
>=20
> > Thinking more, would the below work? =20
>=20
> Yup, this would somewhat work. Except not always, I've found one case
> where even this goes wrong:
>=20
> - Content-protection property, if enabled, has the kernel automatically
>   switch to enabled if hdcp is actually on and authenticated and all that.
>   Writing back that enabled value will fail. But there's good chances that
>   at boot-up content protection isn't enabled, so should work out nicely.
>=20
> - We could fix this by silently downcasting enabled to requested, but
>   might still lead to surprises since it makes hdcp rather more sticky
>   than some users might like.

The fix doesn't make HDCP any more or less sticky, it just makes it
possible to not fail a resetting atomic commit. Without a resetting
commit, it will remain DESIRED/ENABLED.

If "Content Protection" reads back as DESIRED, userspace that relies on
read-back for reset will reset it to DESIRED. Could as well be ENABLED
that the kernel just takes as DESIRED when written.

> > Actor: a KMS userspace program, e.g. a display server
> >=20
> > - On start-up, read all KMS properties and their values. The properties
> >   that are not recognised are saved in a set called "reset unknowns"
> >   with their current values.
> >=20
> >   Optional: The program commits the "reset unknown" state to KMS with
> >   ALLOW_MODESET to ensure it all is writable as is; if that fails,
> >   there is no guarantee that the program could recover later, so it's
> >   best to abort in that case. This could be part of the initial
> >   modeset, too.
> >=20
> > - When the program has lost and regained DRM master status, meaning
> >   that (unrecognised) KMS state is potentially incorrect, prepare an
> >   atomic commit with "reset unknowns" set and add all the recognised
> >   state the program knows of on top. This resets everything to like it
> >   was, with ALLOW_MODESET.
> >=20
> > - At any other time, do not use the "reset unknowns" set.
> >=20
> > The final point is the important one. I have assumed it would be safe
> > to use always, but apparently not? Good thing I haven't yet written
> > code to do that.
> >=20
> > You have to recognise the property to know if it is safe to set
> > needlessly (for convenience in both code simplicity and ease of
> > debugging)?
> >=20
> > Also, when using "reset unknowns" set, it actually has to be
> > partitioned by KMS objects (CRTC, connector, plane...) so if e.g. a
> > connector no longer exist, you don't attempt to set it.
> >=20
> > However, this still leaves writable properties whose value read is not
> > legal to write as broken. Let's pray that fbcon or a system compositor
> > will never succeed in enabling HDCP... =20
>=20
> Note that the kernel isn't entire consistent on this. I've looked a bit
> more closely at stuff. Ignoring content protection I've found following
> approaches things:
>=20
> - self refresh helpers, which are entirely transparent. Therefore we do a
>   hack to set allow_modeset when the self-refresh helpers need to do a
>   modeset, to avoid total surprise for userspace. I think this is only ok
>   for these kind of behind-the-scenes helpers like self-refresh.
>=20
> - link-status is always reset to "good" when you include any connector,
>   which might force a modeset. Even when allow_modeset isn't set by
>   userspace. Maybe we should fix that, but we've discussed forever how to
>   make sure a bad link isn't ever stuck at "bad" for old userspace, so
>   we've gone with this. But maybe limiting to only allow_modeset cases
>   would also work.

Wait, what do you mean "include any connector"?

What exactly could cause a modeset instead of failure when
ALLOW_MODESET is not set?

Does that mean that I'll never need to implement link-status handling
in Weston, because the kernel will recover the link anyway? If the
kernel does that, then what's the point of having a link-status
property to begin with?

> - I guess we could do stuff that only fires off when allow_modeset is set,
>   but I haven't found some examples. I thought we've had some outside of
>   self-refresh helpers already. The closest I've found is again
>   link-status, which never allows userspace to set BAD, and silently
>   upgrades to GOOD. So that userspace doing a blind safe/restore can't
>   wreak stuff permanently.

Sounds like link-status was designed with a blind save/restore in mind.

> It's all a bit nasty :-/
>=20
> I think we should at least allow userspace to do a blind restore with
> allow_modeset and not expect bad side-effects. That would mean fixing at
> least the content protection stuff.
>=20
> Plus documenting this in the kernel somewhere. As the official thing to
> do. But maybe we want some actual userspace doing this before we enshrine
> it as official policy. The content protection fix is a one-liner and can
> be cc'ed stable.

I'd probably not go there, a blind save does not guarantee a good
state. The fix to "Content Protection" is not necessary (as long as
userspace does not do a blind save/restore) if we can get the default
state from the kernel. If we get the default state from the kernel,
then userspace would be doing a blind restore but not save, meaning
that the state actually is sane and writable.

I'd love to volunteer for writing the Weston code to make use of "get me
sane default state" UAPI, but I'm afraid I'm not in that much control
of my time.


Thanks,
pq

--Sig_/aCZHHtoUqUcA6lNSfp/dkhV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl6fBBwACgkQI1/ltBGq
qqdBDxAAoLTGTFT/FpcsMttX7fy1/kmaoX1gEckSy5hxBQz+ilnyL3pWdjKf8Xez
mi5dZrhq5dcBe3cy0sQ8JKVneU0r6fPRtHZIqprhdzT/fs0D80OHm4aDQY5V7VR7
nkob2yV6DK8UXP+hI/rXmKYL9PkExCMRlW/5RyPWlzqkXXyOU8+KhzXsKyK9HVAs
oc1JIVatuWPzBSkCZABoTujZv5W7ue57IFOkTd7SiR+7f4TgDHjHyTpzk0GRvJHf
4E4kj6B5bKy5rCby/rPfNrhQwuYH+7vcMKpB5ZwEqMXCABH8b03HW/TL0jFFHw6Q
mpKyoNrK6G/mwGklfDOqBYwoPK/QylDGr4PZs48cwDleV/o9aPXZU4Hpb62uzfOV
GYAIEzqKY1+HzKpZS0w2tg7bmFu5pSZLIXkq+cJkmISQLVbtdvdVIawEdtC74iwg
IRGc1V7RcTt6mwsVRZMpZ4xtx0zZt66XQ4QoT2COnpMEatYLbxFdJj5+NOVBoKck
oP0jCz6safP6tXPiS/h3jG5RELTY2TU2FXwRUVTpeaOaALWDvezOBuEXv5p2A94h
Ea3tSGhg1i7/lVLByk9IJUY6y8XGJGtZSwjDhlJLmrwjUMG3XCp1e4dbGmqgRxg2
TWuRTOK5XtZFnBvQmDzbTX2oRl6hsA1sQYBJeAry17x4Uy21my0=
=8ZgB
-----END PGP SIGNATURE-----

--Sig_/aCZHHtoUqUcA6lNSfp/dkhV--

--===============0382221639==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0382221639==--
