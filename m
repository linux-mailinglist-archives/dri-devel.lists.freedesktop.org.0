Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA14240561
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 13:33:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6599F6E296;
	Mon, 10 Aug 2020 11:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5269D6E0E7
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 11:33:11 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id t6so9144790ljk.9
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 04:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=v8jVtqeHGyiAOx12Mo2ykYAM5nPi0bibgg5Gy19hikQ=;
 b=ks/uFa34n/JT86s7hgBzf1WlmGfdaVlIyi09A2+POb11sDswTE/ZIKm3eVXftITVBm
 F09YdMKPDbUfLzPB+C5MIApGtUh4GS3QfWr80FsYOx07m45k6/prk+I1Kt8prQpEAe4d
 7ybdMGkpbw4hSXjeM605ChrvyEzS/SsuqMgGjjE2SqlUx8HvstgfSTaQRvFIijJHx+2H
 DUj9OGOA+cmt2ondQVneU2IhpLuZ9zn8rnA5XYVNQTj9BUoMyi8QpY9mcAHhxKdK0bG5
 ewBv0nib8ig1pYxEFc/3427HxAEOA5h292t54HxL2I1gIjArSAqVx3beo/6I9EevTN2Z
 h77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=v8jVtqeHGyiAOx12Mo2ykYAM5nPi0bibgg5Gy19hikQ=;
 b=OH+2XR9brGPi3B7YI6L+4gGu1Wzm2IOZtoPVZaI+Z1qll6W7QdxRy1Gr6K3aevkl1Y
 yI+05zwfAeg/3EhUonrfGGZJiawz60Qc3gML/2Q+z+kqnvP2EHfmkr4TdFwkZv5gPM85
 mdaXCGUBVIIl4A8X0sBiXGp/Po1h/NA2elAOU8c/J5CAaf92TCKK5HMc7g3/JAZxQXeB
 Lew1WsvUldepPOuOmlwscyB7xdydQUaMsnLmHBNT3SlgvGtIAJgO2W9ATFDh2EKnZaHB
 t2c7TeMb3op3bqVpbOlE/J5iwRfa84S/uiRaL6OqFyz//VDwp/dv41qOHVZhGOIigFpx
 X6qg==
X-Gm-Message-State: AOAM5332b0NMm5tbiVQpdclwo8OOeGsEvnv+ykPNV4SYYjQdlP3Urvic
 0bm/xhGCXjRMOwMghr3j0LY=
X-Google-Smtp-Source: ABdhPJw2fz+zoyQ1FFCty0i7Gk21nvfnYOvT+Vf5JQeqe/NyxvIB4s5BtJl9wK2ibWQQvRptKRuN0w==
X-Received: by 2002:a2e:545:: with SMTP id 66mr324927ljf.285.1597059189550;
 Mon, 10 Aug 2020 04:33:09 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id j4sm9114242ljc.20.2020.08.10.04.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 04:33:09 -0700 (PDT)
Date: Mon, 10 Aug 2020 14:33:04 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Merlijn Wajer <merlijn@wizzup.org>
Subject: Re: How to prevent input devices from unblanking the X screen when
 DPMS is on?
Message-ID: <20200810143304.4f2c88bc@eldfell>
In-Reply-To: <8b51a5b0-f8ed-9567-d836-1f8016f5a3ba@wizzup.org>
References: <12302ae3-901f-7a13-975e-273fbda4e7b4@wizzup.org>
 <20200810104358.1d28e355@eldfell>
 <8b51a5b0-f8ed-9567-d836-1f8016f5a3ba@wizzup.org>
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
Cc: Carl Philipp Klemm <philipp@uvos.xyz>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, xorg-devel@lists.x.org,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1065067895=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1065067895==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/OgR6Kmr1G2kG3kAi+E3kE.L"; protocol="application/pgp-signature"

--Sig_/OgR6Kmr1G2kG3kAi+E3kE.L
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 10 Aug 2020 10:43:42 +0200
Merlijn Wajer <merlijn@wizzup.org> wrote:

> Hi Pekka,
>=20
> Thanks for the reply -
>=20
> On 10/08/2020 09:43, Pekka Paalanen wrote:
> > On Fri, 7 Aug 2020 16:07:35 +0200
> > Merlijn Wajer <merlijn@wizzup.org> wrote:
> >  =20
> >> Hi,
> >>
> >> Is it possible to have X handle input events, but not actually unblank
> >> the screen upon input events when dpms is enabled? =20
> >=20
> > Hi,
> >=20
> > by "blanking", do you mean that the CRTC turns off (as opposed to the
> > display turning off) so that it no longer produces a video stream
> > regardless of whether the display is actually receiving it or not? =20
>=20
> Right - the idea is that the LCD display of the phone turns off so that
> it no longer draws any power. So I believe that would be to have the
> CRTC turn off. We are using libX11 for this purpose [1], but I think the
> same can be achieved with "xset dpms force off".

Yeah, I suppose nowadays turning the CRTC off does imply DPMS-off and
everything else as well (including backlight?).

> >> Our use case (in Maemo Leste, GNU/Linux+Debian smartphone OS) is
> >> reporting physical volume buttons to X clients when the device is
> >> locked. When the device is locked, the screen is blanked / turned off
> >> (via DPMS), but pressing a volume button causes the screen to unblank,
> >> leading to significant power drain.
> >>
> >> I am aware that one can tell X to close certain/all input devices, but
> >> then the volume buttons (and others: like 'next') would not be sent to=
 X
> >> applications.
> >>
> >> I have not tested this, but I assume the same would apply for "headpho=
ne
> >> buttons": play, stop, pause, etc. Or if someone has a phone in their
> >> pocket: pressing a button by accident shouldn't cause the screen to
> >> unblank and cause significant battery drain. By design, the DPMS timeo=
ut
> >> is set to 0, and an external program will dim the screen brightness, a=
nd
> >> tell X when to blank and unblank.
> >>
> >> Turning off the screen with DPMS, and then disabling DPMS in an attempt
> >> to keep the screen blanked (and have input not affect it) also does not
> >> work - then the screen doesn't stay blanked - this is with the
> >> modesetting driver. =20
> >=20
> > What does "disabling DPMS" mean? =20
>=20
> I should have written "disabling the DPMS extension". It is possible to
> disable the DPMS extension at runtime, if I understand correctly. This
> is what the xset manpage says about it:
>=20
> > -dpms   The -dpms option disables DPMS (Energy Star) features.
> > +dpms   The +dpms option enables DPMS (Energy Star) features. =20
>=20
> The idea was to use the DPMS extension to turn the screen off (say with
> 'xset dpms force off'), and then disable the DPMS extension (while the
> screen is in the off mode) to workaround the DPMS always waking up the
> screen upon any input.
>=20
> But it seems like disabling the DPMS extension at runtime after the
> screen is off turns the screen back on (at least looking at the power
> consumption of the device).

Hmm, I always thought that those commands only enable or disable the
timers measuring idle time that then causes Xorg to change the monitor
from "on" to one of the power save modes.

I'm actually surprised if 'xset -dpms' didn't force monitors on.

> >> Due to the way DRM works, X is the master of the screen, so it is my
> >> understanding that there also cannot be another helper tool that blanks
> >> the display via DRM, because X is still the master, even when DPMS is
> >> disabled. =20
> >=20
> > There can be only one DRM master having access to KMS functionality at a
> > time, yes. This is deliberately designed to prevent any "rogue"
> > applications from touching the display state without going through the
> > display server in charge.
> >=20
> > DRM is the wrong layer to look at. DRM only does what a display server
> > tells it to, and has no connection to any input side at all. Your
> > problem has to be solved in co-operation with the display server. =20
>=20
> I understand - and I think the DRM design makes sense. I was wondering
> if this (not being able to forcibly keep the display blanked with a DRM
> backend while still processing input) is an oversight in X11 (since DRM
> was introduced way later, and support for it was added to X11). I am
> hoping to avoid having to ship/maintain a custom/patched X11 server, so
> if there's potential workaround, I'd be very interested.
>=20
> Perhaps it's also possible to extend the DPMS API in the X11 server to
> disable waking up on input. That might be a relatively small change to
> carry, and could be entirely backwards compatible. But I don't know what
> it takes to get (any) new features into X11.

Me neither. Also, Xorg itself seems to be more or less in
maintenance-only mode if even that.

> >> On older versions of Maemo, where DRM was not used (10+ years ago),
> >> external tools can just blank the fb and everything works as expected.
> >> Then DPMS is simply disabled, and external tools control the blanking
> >> behaviour, but it looks like with DRM, this is no longer possible. =20
> >=20
> > Have you tried using X11 RandR protocol to turn the output off? I'm
> > not sure it fits your use case, but maybe worth a try. =20
>=20
> I think this is a way to force the display off, but I also believe it
> usually confuses a lot of window managers and clients - if this is the
> only display, then what is the size of the desktop after the display is
> turned off - etc.

Sure. I assumed you'd have your own special window manager at least, so
that behaviour is under your control already. What I don't know is how
Xorg deals with turning all outputs off.

> > The ultimate solution in my opinion though is to ditch X11 and go for a
> > Wayland architecture. There you provide the display server yourself
> > (with the help from any Wayland compositor libraries you may want)
> > which means you are fully in control of the behaviour. Obviously that
> > would be a huge change. =20
>=20
> That would indeed be quite nice -- although I am afraid we are stuck
> with X11 for a while until we get all the other bits working well. Only
> then does it make sense to think about replacing X11.

All the best with that. :-)


Thanks,
pq

> Cheers,
> Merlijn
>=20
> [1]
> https://github.com/maemo-leste/mce/commit/57786e7d26cb32fefc149d8d07ceee2=
39e0bdd08
>=20


--Sig_/OgR6Kmr1G2kG3kAi+E3kE.L
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl8xMHAACgkQI1/ltBGq
qqdebRAAhHYafDjJdy07d44VQvAhV1dJhr4JnZHOkdFM/KVSFg/8bzNUaGNcihCa
JnavK5Cewfh6CV+5WvuImx7KW9mVtuujc8yqG339fKiYXblheLqvkDQ6WIYAIS/v
5ul9ftZOk5nDuKje1mDHwMU46bukMZnQ8b5VYzGBT3zv8NEvt3+opwsjykXpdecQ
/N4xN5SsEbLRh9vGaZ3PlEKdwrbFYR1qWDQ0ICcFRlTduJPi/liCwYEM5Wyv6VYa
rI2cQ0OmdoMxUsfyfDIvlNbw2e8UGqq9OoHOhMCKinTRPotzIyuc4Y1DhelErsHi
4kbDUFbmUqkrO0SEw/XAcmKQEp8QLCGKyTWq4fdbUV0YTNO556yvlMXVi4mzv2fF
Rw4noF8LF3rexG+lIkb2DAeDDp5q9NuaxcwR2YuNB4oDbBljhnfFUyTNyCHT6fb5
hdCZ8fOy2zc6Z++8vG5BFr0GOHJArCOGosGrjQHQYPQfs9ZKQJ5aa/9WBbp6e5GP
/gl8KnC31KKvFbvlw8+PvFWflbfSSW63r3q/AkplKikPj/Nzn8etBpD8CKLpeiwX
lpHgvh/ctMMfBYROnYW8XR6Mgg3a9axvKmmCGBFwr+7lyGtUXxxEaToIt447dQhs
W/yhMfm4rxjfTNF32s32ECOKQUq7sTFaeFT+FQzqgXIn65vS6es=
=qLaG
-----END PGP SIGNATURE-----

--Sig_/OgR6Kmr1G2kG3kAi+E3kE.L--

--===============1065067895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1065067895==--
