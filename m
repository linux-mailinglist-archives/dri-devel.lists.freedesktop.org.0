Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E4F1C8550
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 11:03:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF3C66E95B;
	Thu,  7 May 2020 09:03:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D3696E959
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 09:03:21 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id s9so3819649lfp.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 02:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=fFyQ0TgB1Baj1LV5fPUOdudRDxqFY3scstKda3YOp28=;
 b=KvXQdoQ3XeHUbKZYhKsEq4r/PfoZNwSw7hyZa/dc6Msd/PHyIsarYk1Ge9pDyiLgRj
 fYG4gF1z1y0Nd16gAnthuVuweGXOhwaHpPI2LZrt35JmtkHnlYm+tbjgdapqzdyvGghC
 WGBYirbWE1E+erzURMBviolL4jFWjKHhHo+dEvU2XqFooAKaMrZokBjZ0aCO+t6UG1N5
 QKcFVMgyyNzf6FqLDsrpe6fGn9ucOwlTs6pYur4IX8bm9gwy3CcoCyuC21zfH8EP4Woz
 xsnT64Y0mJr8gtR5ztYn5ZIT4XS5afpN7+gaBtBGw7hQx3AttnEgXyjXZheRwEqANj7F
 N8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=fFyQ0TgB1Baj1LV5fPUOdudRDxqFY3scstKda3YOp28=;
 b=tPvfn4MdGQSL+vfD97cnXaWmHIqpNreZpBpBf6MdgsMeMIUNqNPovTWdwUlLtabnIS
 8T6l4l6kqtick5+tcQAYuBOspV/BjF392fl1a0rpC9GIPYfv8zzLlFBsbytCsE9EY9YU
 i+XVLADGEJdgDbOwyW5oPPZw95se41Rdxy5QrVI8BMv4Ilc0omGFrDxLkbheHmmIhSa0
 nxHTCv5lSaweyTeMO4tV6D2eJ+yYaz8Vl29yHewAIU9R9Bpt01O7X2+2jRGCmwkpw4MI
 QK0C7mzXORAKvDSlpqOxv0ghTEcDtflh0kOFXlZx4de4YH546AASNq0J518e5UZteNvT
 TuZg==
X-Gm-Message-State: AGi0PuZcF+0sdEb86C86nX3SQI5OwQBGWsQsLAGpJBXIWja3TFSOMbrn
 nRThpOGppGovYYLpZJlQPpw=
X-Google-Smtp-Source: APiQypJgbUNdZY+fGyTYDIHfMXZDoAS9v+ntv75H3qpaeVFrg/68xKV9ddTjH8/wCjpDlZaS5n1D2w==
X-Received: by 2002:ac2:50d8:: with SMTP id h24mr8437544lfm.63.1588842199079; 
 Thu, 07 May 2020 02:03:19 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id c20sm3016372ljk.59.2020.05.07.02.03.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 02:03:18 -0700 (PDT)
Date: Thu, 7 May 2020 12:03:13 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: Operating KMS UAPI (Re: RFC: Drm-connector properties managed
 by another driver / privacy screen support)
Message-ID: <20200507120313.28b40a57@eldfell.localdomain>
In-Reply-To: <20200505084852.GN10381@phenom.ffwll.local>
References: <20200421121552.GT3456981@phenom.ffwll.local>
 <20200421173300.3cd078f4@eldfell.localdomain>
 <CAKMK7uEr6eHfEuGfLU_JTk=fbo=FBcU_aasGwUTRACny7WeojQ@mail.gmail.com>
 <20200424113216.3b5d4e90@eldfell.localdomain>
 <20200428145157.GP3456981@phenom.ffwll.local>
 <20200429130754.311d7178@eldfell.localdomain>
 <20200430135323.GC10381@phenom.ffwll.local>
 <20200504124913.65f6087f@eldfell.localdomain>
 <CAKMK7uGEi6=SK8=943Eu2AVW9yhj=scTvjdguTYQKhXzyL4D4w@mail.gmail.com>
 <20200504152228.4885e26f@eldfell.localdomain>
 <20200505084852.GN10381@phenom.ffwll.local>
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
Content-Type: multipart/mixed; boundary="===============0703687995=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0703687995==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/5KQLbKpDy6_6cG=f1L/3kvG"; protocol="application/pgp-signature"

--Sig_/5KQLbKpDy6_6cG=f1L/3kvG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 5 May 2020 10:48:52 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> Refocusing on where I think we still have a bit a disconnnect.
>=20
> On Mon, May 04, 2020 at 03:22:28PM +0300, Pekka Paalanen wrote:
> > On Mon, 4 May 2020 13:00:02 +0200
> > Daniel Vetter <daniel@ffwll.ch> wrote: =20
> > > On Mon, May 4, 2020 at 11:49 AM Pekka Paalanen <ppaalanen@gmail.com> =
wrote: =20
> > > > On Thu, 30 Apr 2020 15:53:23 +0200
> > > > Daniel Vetter <daniel@ffwll.ch> wrote: =20
> > > I guess my point is, this is a lot bigger problem than just the
> > > default state. This =3D vt switching that doesn't look horrible and
> > > doesn't result in artifacts and issues on the new compositor. =20
> >=20
> > I am interested in getting reliably to the same hardware state as you
> > used to have before, either after reboots or after vt-switches. The
> > transition does not have to be guaranteed to be smooth, but at the same
> > time the restore policy should not exclude the possibility of a
> > smooth transition. =20
>=20
> So my point is kinda that if you want both, then the only way to get there
> to have a very clear set of what's allowed to be left behind be the
> outgoing compositor. For example:
> - only primary plane
> - only untiled
> - no color transform magic
> - ...

Hi,

agreed, and to this I was implicitly adding "for everything else the
old compositor must leave behind the so called default state".

That means the new compositor restoring defaults to the properties it
does not understand is a no-op, unless the old compositor violated the
smooth transition rules, in which case it might not be a smooth
transition.

If on some system, the default state does not result in a "usable"
picture on screen, then a compositor that does not understand the
property will always be broken and has always been broken.

If such compositor ever worked ok on such system, it was because it
inherited a property value that made things work. So if using defaults
breaks things, it means the defaults were not actually the defaults.

This definition probably means that defaults cannot be universal
constants, but I think it would be enough if they were constants given
the hardware and firmware at hand. IOW, not changed by simply rebooting
or upgrading the kernel.

>=20
> Imo this is a related problem to the save/restore topic, since if one
> compositor does something the new one doesn't understand (e.g. tiled
> buffers with modifiers, and new compositor doesn't use getfb2), then it's
> going to break.
>=20
> Similar, if the old compositor sets a new color transform property that
> the new compositor doesn't understand, then you get a mess.
>=20
> Blind restore handles the permanent mess issue, but it doesn't handle the
> smooth transition issue. But both problems are of the "old compositor did
> something the new compositor doesn't understand", hence why I chuck them
> into the same bin. And the issue with a blind save/restore, or kernel
> defaults, or any of the solutions proposed here is that they pretty much
> guarantee non-smooth transitions, they only solve the permanent damange
> part of the problem.

Right, except I disagree on the "guarantee non-smooth transition", as I
explained above.

> I think to solve both, we need some kind of proper compositor switching
> protocol, e.g. using logind:
> - old compositor transitions to the minimal config as specified somewhere
> - logind forces all other properties to "defaults", whether that's
>   restoring boot-up defaults or defaults obtained from the kernel or
>   something else is tbd

In my mind, the new compositor would do this step. If the old
compositor did its job, it's a no-op.

> - logind maybe even does a transition if there's multiple version of the
>   protocol, e.g. v2 allows modifiers, v1 only untiled, so it'd need to do
>   a blit to untiled if the new compositor only supports v1 switching
>   protocol

That would be fancy, but I'm not sure it's necessary. Maybe it becomes
useful one day, and then that day we can look into involving actual
protocol or logind. I just don't see a problem implementing the de
facto protocol v1 that already exists without logind or such.

> - new compositor takes over, and can continue the smooth transition since
>   it's a well-defined starting state with limited feature usage, _and_
>   everything else is reset to "defaults"
> =20
> I fear that if we only solve the "resets to defaults" issue then we can
> draw ourselves into a corner for the smooth transition stuff, if e.g. the
> wrong entity in the above dance forces the reset to defaults.

I guess we fundamentally agree. It just doesn't matter who does the
reset to defaults if the old compositor does not, the transition cannot
be smooth.

To me it seems the key here is that the old compositor *must* use "a
simple KMS setup" and reset everything else to defaults.

Actually, that's what we require in practise already. If the old
compositor leaves something funny in KMS state, the new compositor will
either glitch or be permanently broken when taking over.

The only thing that needs more work to fix is to prevent the permanent
breakage.

I guess this line on thinking also shows the answer to what KMS programs
are supposed to do on switching out: clean up after yourself, but don't
shut CRTCs down or change video modes.


Thanks,
pq

--Sig_/5KQLbKpDy6_6cG=f1L/3kvG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl6zztEACgkQI1/ltBGq
qqeybxAAiYFN5kBW9a9Bec8A6iapCKcO/UtfJc5qCBhQw3sJDs96/maYPZwbZJ7s
CqdG3sbNvxD3+rnCv0oQ3ia2vpcWivO9boeaKylm3B+/lWDG4Es5ab59jBPtVSNv
WQJohk6+7Jwy8UGo43zH1qwMGy/BXu8NFwBj/8jf5V4WgBPLIymZrY1a3XYZXsAs
ZrIcsdiuAYkPQIXTQWfaOSeWkSHvVsIkiIKlmKNQYnyB3gydqGV0TtA6gpt93WUH
gDqSZXPV5q0yBkcMVG49BYuLDdHdrfCvU2y7fuBA/N3CBcf3SAa/DpV0OGpQN2KI
4ftep6sFKN7lEZrNbzP4yVkICYJKp0ayPd8ZXxwvBSigryHviajFdUZS+Ojn9NgV
6HaS9WUPn1DECS0EkpjkKV82wG20vq/nKxnc/eUQfaDr9NREMzv3LscSMhYlKcFD
Z9BfAbtO9qmBPFbxYnHBr5pacXb3p/8JwHLAINYMzUvwZFpTzospjmRmzRUUSALB
bJGSezUM+rj4CD7Qs2FmH8hZGrl5BdiO4vxWK3i7l+w31aLaVaMxey+2z12R24JJ
DnHDi2UcfiQ4hhY2pM4vBnNiRdlY1ls3XQiPo/ReCjwNkl1/MrtgZPw4c0mNsGfe
I+lmM/cXmkVab6uOp6iLoy1s7/SHQ1tojOIXqPafn/dINReaHdk=
=EczB
-----END PGP SIGNATURE-----

--Sig_/5KQLbKpDy6_6cG=f1L/3kvG--

--===============0703687995==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0703687995==--
