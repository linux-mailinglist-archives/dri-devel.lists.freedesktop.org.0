Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9181B062D
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 12:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 504BB88A9C;
	Mon, 20 Apr 2020 10:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE2388A9C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 10:04:35 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id m2so7385354lfo.6
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 03:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=f23GWV6Y/pULqGfPeCDuCRy1l/1cJd3ty/xP6s68X88=;
 b=d/qKz6DAtt3gxQwhOm9PWg7uzg8+t0pJIezBkNgIYuPLC9R+xgz9zn+o21tcJAjPxg
 g+c18N8smxM9QkNvpPXW90bQKgWQx+Ax1ZnBUDcCJIQy4+U4YuzhsQuE0xp2ptEyJEyO
 IxdENLCzUl+5plVUa6GYJlDVB6z8aTelVeLCJNTmHrSX6DQlbxQqtaPwnnWeb5WAb7+W
 MGZhBmMqHuEQZqKoWf33MM8H5CpBRXsO6WxGSfaRoCTmBBntgdYQETUnbh/zTTtyI2EI
 NK7RjT1qx1//pE0IXgh0lQJN1xGKCUngeVcTUVB/nXX8fuubLVdelK6yjhNxFc7E6+BB
 1v2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=f23GWV6Y/pULqGfPeCDuCRy1l/1cJd3ty/xP6s68X88=;
 b=qkU0DLtiP4hh73defC7vSk9R/aJokkqHCq5rR/EOyVZOG3n2gyfYTYGy+5Q5XXFri7
 VvCjuj9Q34m5dZtDFNnxB5iJLnNUYUu9bhBAj1V1JND3rK/erYd2J+fRG/3G7NLYCN33
 4m0f/VOj4I5hzCPdUCLzhu75I1EqXvUEQzf2MA1oGni7S8dSm0trPm0maca3UXVnyf80
 7imkQ7E4/Dj23WZS5alumrdduxcydCLYy+5TcfSaT8OZjJ87d/Q7Z8IwkX80FpohUIjI
 YTu0eIWGtUp4nw2oUoXRaSvjdO33w/lzLJreKoEl7slzmDNXyMouDIqdpNb+vnBqtD6J
 ku+g==
X-Gm-Message-State: AGi0PuZEdAkn44kk/hxyYE7cTA0tdpwnnzKqAC/7IXmhCbuzQ9uLBqwF
 s8qK/L2OVpAmB/DF6jfn+iw=
X-Google-Smtp-Source: APiQypIrcqd53qLZUelV3uQVGe9WTz0oOGPB8RGLC+6Q8uFFWgir3Y02C17eIP0GL3I7ecIAay/Rcw==
X-Received: by 2002:ac2:528f:: with SMTP id q15mr10493527lfm.132.1587377073642; 
 Mon, 20 Apr 2020 03:04:33 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id q6sm593437ljg.67.2020.04.20.03.04.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 03:04:32 -0700 (PDT)
Date: Mon, 20 Apr 2020 13:04:20 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: Operating KMS UAPI (Re: RFC: Drm-connector properties managed
 by another driver / privacy screen support)
Message-ID: <20200420130420.1a24197e@eldfell.localdomain>
In-Reply-To: <20200420112704.68d02472@eldfell.localdomain>
References: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
 <87tv1k4vl6.fsf@intel.com>
 <d47ba6ef-efd0-9f28-1ae4-b971b95a8f8b@redhat.com>
 <20200417120226.0cd6bc21@eldfell.localdomain>
 <CAKMK7uEv_khNFC=JUyuQgDZp1p5eudDCrH0we+UdEdTV3H=Tsg@mail.gmail.com>
 <20200420112704.68d02472@eldfell.localdomain>
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
Content-Type: multipart/mixed; boundary="===============1730827098=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1730827098==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/9FU1UzUF=duqBt/oT4OASie"; protocol="application/pgp-signature"

--Sig_/9FU1UzUF=duqBt/oT4OASie
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 20 Apr 2020 11:27:04 +0300
Pekka Paalanen <ppaalanen@gmail.com> wrote:

> On Fri, 17 Apr 2020 16:17:18 +0200
> Daniel Vetter <daniel@ffwll.ch> wrote:
>=20
> > On Fri, Apr 17, 2020 at 11:02 AM Pekka Paalanen <ppaalanen@gmail.com> w=
rote: =20
> > >
> > > Hi,
> > >
> > > let's think about how userspace uses atomic KMS UAPI. The simplest way
> > > to use atomic correctly is that userspace will for every update send =
the
> > > full, complete set of all properties that exist, both known and unkno=
wn
> > > to userspace (to recover from temporarily VT-switching to another KMS
> > > program that changes unknown properties). Attempting to track which
> > > properties already have their correct values in the kernel is extra
> > > work for just extra bugs.   =20
> >=20
> > Uh if you do that you'll get random surprising failures if you don't
> > also set ALLOW_MODESET, because that way you'll automatically repair
> > link failures and stuff like that. I'm assuming your userspace only
> > supplies all the properties for crtc and planes, and leaves connectors
> > as-is? Otherwise you already have some fun bugs.
> >=20
> > In general I'd say userspace shouldn't write stuff it doesn't
> > understand. If you limit yourself to just the properties you do want
> > to (re)set, that's safe. But if you just blindly write everything all
> > the time, random modesets, and hence random failures if you don't set
> > ALLOW_MODESET. =20
>=20
> Hi,
>=20
> how should userspace KMS program A recover from the situation when
> switching the VT back from KMS program B who changed properties that
> program A does not recognise? (I believe Weston does not recover at
> the moment.) This is very important for getting e.g. reliable color
> reproduction, since not all KMS programs are always up-to-date with
> everything the kernel exposes and people may switch between them. Not
> resetting everything may even encourage people to write hacks where you
> temporarily VT-switch away, run a KMS program to set one property, and
> then switch back assuming the property remains set. I have already seen
> someone mention they can enable VRR behind the display server's back
> like this.
>=20
> I don't think Weston records and re-sets unknown properties yet, but I
> assumed it is what it needs to do to be able to reliably recover from
> VT-switches. In that case ALLOW_MODESET is of course set since all
> state is unknown and assumed bad.
>=20
> I do believe Weston re-submits *everything* it knows about every
> update, except for CRTCs and connectors it has already disabled and
> knows are in disabled state (this could change though).
>=20
> However, during steady-state operation when ALLOW_MODESET should not be
> necessary, is it still harmful to re-program *all* properties on every
> update?
>=20
> After all, the kernel will just no-op all property setting where the
> value is already the right one, does it not?
>=20
> The only "random" KMS state is the properties the userspace KMS
> program does not know that are set on start-up. I have been assuming
> that as long as you had fbdev active before the KMS program started,
> the unknown properties have "harmless" default values. And maybe even at
> driver device init if fbdev does not exist?
>=20
> Is there something more up-to-date than
> https://blog.ffwll.ch/2016/01/vt-switching-with-atomic-modeset.html ?

Thinking more, would the below work?

Actor: a KMS userspace program, e.g. a display server

- On start-up, read all KMS properties and their values. The properties
  that are not recognised are saved in a set called "reset unknowns"
  with their current values.

  Optional: The program commits the "reset unknown" state to KMS with
  ALLOW_MODESET to ensure it all is writable as is; if that fails,
  there is no guarantee that the program could recover later, so it's
  best to abort in that case. This could be part of the initial
  modeset, too.

- When the program has lost and regained DRM master status, meaning
  that (unrecognised) KMS state is potentially incorrect, prepare an
  atomic commit with "reset unknowns" set and add all the recognised
  state the program knows of on top. This resets everything to like it
  was, with ALLOW_MODESET.

- At any other time, do not use the "reset unknowns" set.

The final point is the important one. I have assumed it would be safe
to use always, but apparently not? Good thing I haven't yet written
code to do that.

You have to recognise the property to know if it is safe to set
needlessly (for convenience in both code simplicity and ease of
debugging)?

Also, when using "reset unknowns" set, it actually has to be
partitioned by KMS objects (CRTC, connector, plane...) so if e.g. a
connector no longer exist, you don't attempt to set it.

However, this still leaves writable properties whose value read is not
legal to write as broken. Let's pray that fbcon or a system compositor
will never succeed in enabling HDCP...


Thanks,
pq

--Sig_/9FU1UzUF=duqBt/oT4OASie
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl6dc6QACgkQI1/ltBGq
qqevuQ/8CSGfnqHy2ieZNOn44FEAiBULpLoQeccQgi3eFN/h/9w4tAUEdneleMdY
Xkys6m5xWrTiUqqBko7P8uOJVxQ2DgOMbb6+lFBb0nkE/UZ95LTrPdkm4VNiYf1b
wT8aAddNHuE2niYufWpfvIQSpgcYpC/bf+62VnZy58YdP5fJCzcBDG9M2lGnNWLj
VJKKXrqNQ+/vHIZfEYc50qskev9fcasGYCAHjU/JTFu7wwLEpemcf/VIoKUSiQL0
R1+sY+ddEepFrpcy5oLVIo3jrigCS13OV/jiW4aVcBVHQnN6tAfTpB8g8/K0Y8T3
0MJ5hzeewVlZkOoInEb3QZoA1KAG9f9kkKoD9ynjn7Eqohat6An2loHsOLVUnIxI
lmw1hObfreCUneNJ7cMrubZrzI12lv48FcXvKKb08KeIVp485WFMKnTsL7pe5UKF
INCcpziGzYT36P/YFBasxZMX3KCCBokYktrMw6CJcaTrEVSrQQITZ4s8HxQjd2YL
ddEAWk5CJrHXWFZ1KewT40lChVJh0zCa7E4d0sez0chc+PRuVD1c7TGGLNqYIvaN
85qDc05AaKJZIBguuqLKkvar1YVt8543VWQVzOmCihUUb78iiRsG9ClK39yEDNiX
6EVD4fEJpsW3w5Wp4mfRydzccpfZQu1GJqtn4C7uDUSII0my2/8=
=AfaY
-----END PGP SIGNATURE-----

--Sig_/9FU1UzUF=duqBt/oT4OASie--

--===============1730827098==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1730827098==--
