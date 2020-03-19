Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FA318BAC6
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 16:16:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DFD089A72;
	Thu, 19 Mar 2020 15:16:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 340078997A
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 15:16:39 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id o10so2902484ljc.8
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 08:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=3kPxT3qTm1PdvAPd3zidBimp8j//thCtKX/db/g/Hkw=;
 b=XPUeIC8vuXouCmcyTyPg9JMkziRtssSPlTe0pqdGOY50SyjiknmKxkjUnvbaFMW8gg
 B/xJwZlpSn6GcDxfbGwbNOz++NjrLPtXGm1TmC9eBMFD25XyeOY9LOPzOpValGPpNapZ
 X/BDTyN1oGyrfcmx+xGwwKmVrOAfEvZXHXrx9EW+gvoaT46qjDaemLITiVYHZFNkhpZS
 ow9toJIlaLbJJ/NhLFHdYhdF/Lkf6Va7MPDK2UZKJukSyvu5kDtbyBvrREhzG+nel04/
 xYJqvksTnlhymETqvszTIFKIMawla14p6mVW5Kgk3q5xPubZduSJoVwLSZUa6VTU2Q3A
 o/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=3kPxT3qTm1PdvAPd3zidBimp8j//thCtKX/db/g/Hkw=;
 b=fOeZid7TEUMn+zFkCjjEFyBtR2ESIn6nZdcLTYrQ228mA8uEidMMgcZa2p65ipMx7e
 NTqbrQ/N1aRMXdATMhUMdrb/OChLE7vIiBXNaM6JazR15BIZXvVAM81FIYf4DcDAoPMs
 QDI6lpk9UlRWezcyGNmdMvPhHFthOxsJlvzsgisw7rRNOLXurbsmPDuW4CTtOfTAlSXX
 o/uxWcOifjTbX8UGv23BuTli+3YXy7k1E5Sl+CWAM7Z+2KD4ji9jSdykuPvPU07t7PVQ
 RUuxcC3e/scrIu7+kjNpPRnxm/d1/R1nESUFhxyBsX5nCGIUSl9Jz2tFp8zUkLr4TEUv
 S6nw==
X-Gm-Message-State: ANhLgQ1cyqYdlrGmiCYzkrWhcRzuVNkb1g2jKt3hUIMZ9U3VdU6LM5jE
 4uj7gE1h0o6XuUX3es4G9GI=
X-Google-Smtp-Source: ADFU+vsdqnJp92B8eJsa/cECaGs2/iDSOlDc/Y3I5FaOOYklr3FKCAeGeiiSocGHL7doturdHQppnQ==
X-Received: by 2002:a2e:985a:: with SMTP id e26mr2513946ljj.194.1584630997340; 
 Thu, 19 Mar 2020 08:16:37 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id k1sm1661871lji.43.2020.03.19.08.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 08:16:36 -0700 (PDT)
Date: Thu, 19 Mar 2020 17:16:32 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: Atomic KMS API lacks the ability to set cursor hot-spot
 coordinates
Message-ID: <20200319171633.2ee4afa4@eldfell.localdomain>
In-Reply-To: <c8c75790-9b56-9f7f-98d6-1dd2410d70b2@redhat.com>
References: <9d86bbe4-70cf-273d-4d61-aec06011d441@redhat.com>
 <20200319120028.56d3427a@eldfell.localdomain>
 <8b9c1aac-3398-ab97-a065-014359d40220@redhat.com>
 <20200319145842.4b7db322@eldfell.localdomain>
 <c8c75790-9b56-9f7f-98d6-1dd2410d70b2@redhat.com>
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
Cc: Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1466265911=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1466265911==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/eTR3ngxDGfj=wepxAJ_+X58"; protocol="application/pgp-signature"

--Sig_/eTR3ngxDGfj=wepxAJ_+X58
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 19 Mar 2020 15:30:03 +0100
Hans de Goede <hdegoede@redhat.com> wrote:

> Hi,
>=20
> On 3/19/20 1:58 PM, Pekka Paalanen wrote:
> > On Thu, 19 Mar 2020 12:49:27 +0100
> > Hans de Goede <hdegoede@redhat.com> wrote:
> >  =20
> >> Hi,
> >>
> >> On 3/19/20 11:00 AM, Pekka Paalanen wrote: =20
> >>> On Wed, 18 Mar 2020 15:28:02 +0100
> >>> Hans de Goede <hdegoede@redhat.com> wrote:
> >>>     =20
> >>>> ATM the Atomic KMS API lacks the ability to set cursor hot-spot
> >>>> coordinates. Mutter (and Weston) have tried to emulate this by shift=
ing
> >>>> the coordinates for where to draw the cursor by the hotspot-coordina=
tes
> >>>> and always using 0x0 for the hotspot.
> >>>>
> >>>> But this breaks the so called "seamless mouse mode" for virtual-mach=
ines
> >>>> and there really is no way to fix this but to allow passing the prop=
er
> >>>> hotspot coordinates to the virtual gfx-card.
> >>>>
> >>>> Seamless-mode consists of 2 parts:
> >>>>
> >>>> 1) Letting the VM-viewer window-system draw the cursor as it normally
> >>>> would draw it.
> >>>>
> >>>> 2) Giving absolute coordinates of the mouse to the VM by e.g. emulat=
ing
> >>>> an USB drawing tablet. These coordinates come from translating the
> >>>> coordinates where the VM-viewer window-system is drawing the cursor
> >>>> to an absolute position using the top left corner of the view as 0x0
> >>>> and the bottom right corner as max-abs-x,max-abs-y. =20
> >>>
> >>> Hi,
> >>>
> >>> is the VM-viewer then hiding or autonomously moving what the display
> >>> server inside VM has put on the KMS cursor plane? =20
> >>
> >> Yes and no, it is not the VM-viewer which is hiding what the
> >> display-server inside the VM has put on the KMS cursor plane,
> >> the VM-viewer negotiates seamless mouse mode with the hypervisor
> >> and then the hypervisor just ignores the cursor-plane except for
> >> sending "sprite" changes to the VM-viewer. =20
> >=20
> > Hi,
> >=20
> > I don't think I understand what you're saying, but I assume that I was
> > right in that the VM cursor plane content will not be shown always
> > exactly in the very position the compositor inside the VM puts it. =20
>=20
> Right, when seamless mouse mode is enabled the VM's cursor plane will
> not be shown *at all*, instead the VM-viewer's window-system's
> cursor plane is shown.
>=20
> Sprite changes (normal cursor, caret, window-resize cursor, etc.)
> are forwarded from the VM-s cursor-plane to the VM-viewer
> which then requests that as cursor to the window-system under
> which the VM-viewer is running.
>=20
> > Maybe the example further below explain the issue I envision.
> >  =20
> >>> If so, sounds like hilarity would ensue with Weston.
> >>>
> >>> Weston does not actually know what a cursor is. Weston will happily p=
ut
> >>> any arbitrary non-cursor content onto the KMS cursor plane if it happ=
ens
> >>> to fit. It's just that usually there is a small surface top-most that
> >>> ends up on the cursor plane, and that surface accidentally happens to
> >>> be a cursor by Wayland protocol.
> >>>
> >>> It's not difficult to get e.g. weston-simple-shm window to be shown on
> >>> the KMS cursor plane: just hide the real cursor from the client.
> >>>
> >>> No, it's not an oversight. It is called "making maximal use of the
> >>> available KMS resources" by using KMS planes as much as possible to
> >>> avoid compositing by rendering with Pixman or OpenGL. =20
> >>
> >> Yes it sounds like this will break with Weston, note that it already
> >> is broken in Weston, if you run e.g. Fedora 32 beta + its Weston
> >> package inside a VirtualBox VM then start gnome-terminal (so
> >> that you get a caret cursor instead of the default one) and try to
> >> select text. This will result in the wrong text being displayed
> >> because Weston does not relay cursor hotspot info to the GPU,
> >> also see:
> >> https://gitlab.gnome.org/GNOME/mutter/issues/1094
> >>
> >> Where the symptoms of this are described in more detail
> >> (they are identical for Weston and mutter). =20
> >=20
> > Right, that's the problem with the hotspot. =20
>=20
> Ack.
>=20
> >> Fixing this will require the discussed KMS atomic API changes
> >> and also changes on the Weston and mutter side to pass through
> >> the hotspot info. =20
> >=20
> > The problem I am referring to is that to the user looking at the
> > VM-viewer, suddenly an arbitrary application window (e.g.
> > weston-simple-shm) starts to act as if it was the cursor, when there is
> > no real cursor shown. You have a random window unexpectedly moving
> > around, as if you had started dragging it around with your mouse. =20
>=20
> Correct.
> > The only way to fix that is to stop Weston from putting non-cursor
> > content on the cursor plane. =20
>=20
> Correct.

Is that something that should be done?

If the hotspot property also had a "disabled" value, then Weston could
set the hotspot to disabled when it is using the cursor plane for
non-cursor content and not lose the feature. And of course set hotspot
correctly when it in fact is a cursor (but for what input?).

>=20
> > It sounds like your VM-viewer makes the assumption that the pointer
> > input device it delivers to the VM is the one that will control the KMS
> > cursor plane position inside the VM. Is that right? =20
>=20
> Correct.
>=20
> > What if the desktop inside the VM is controlled by a remote, e.g. VNC?
> > Then the input events to the VM are completely unrelated to the
> > expected motion of the cursor. Do you just tell the users to stop using
> > the seamless mode in that case? =20
>=20
> A VNC viewer (which is not using seamless mode itself) has the same issue
> of a mismatch between the cursor position of the window-system it is a cl=
ient
> of and the cursor position of the window system inside the VM.
>=20
> A VNC viewer typically works around this by changing the window-system
> cursor to transparent and drawing its own cursor, the transparent sprite
> or disabling of the cursor-plane will get forwarded to the window-system
> under which the VM-viewer runs so this will work fine.
>=20
> A real problem though is the absolute input mode, when e.g. the VNC
> viewer is not using something like seamless mouse mode it will want
> to do the usual (nasty) tricks of confining the pointer to the window
> and warping it to the center after each pointer move so that mouse
> can be moved "endlessly' inside the window. This requires relative
> input, so emulating a mouse instead of say a drawing tablet, which
> breaks seamless mode.
>=20
> So although the way the cursor is drawn typically does not require
> disabling seamless mode, the input problems do require disabling
> seamless mode.
>=20
> In my experience (I have worked on VDI (spice) a couple of years),
> running a VM-viewer inside a VM is something which not a lot of
> people do. I guess the fact that this works quite poorly might
> be one of the reasons people do not do this.

Sorry. I meant that you run a desktop in a VM. Then you control that
desktop from some remote via VNC, and you still look at a VM's
VM-viewer.

You can replace VNC with any remote input thing. E.g. USB devices
plumbed directly through to the VM while still looking at the VM-viewer
for output.

Niche? Yes, quite likely.

> But all VMs I'm familiar with allow disabling seamless mode for
> compatibility with corner cases like this. This does lead to a
> seriously degraded user-experience though. For just using an
> office suit or browser inside a VM seamless mode really is a
> lot more pleasant for the user.  I still remember when seamless
> mode first got introduced, in the beginning it used to not
> always work and fixing the fallback to the confine + warp tricks
> then always was a serious itch which I tried to scratch quickly.
> Breaking seamless mode also is a good way to quickly accumulate
> a lot of bug reports from end users in my experience.

Btw. the warp trick is purely a legacy X11 thing, we have relative
motion interfaces nowadays at least in Wayland and I think also with
XI2?

But if you need to grab the pointer to allow endless relative motion,
then you grab, that hasn't changed from end user perspective.

I think one of the major reasons why Wayland pointer relative motion
and confinement extensions were designed was VM- etc. viewers, and of
course games.

> > What if display servers stop using the cursor plane completely, because
> > people may hit a case where a VM-viewer makes the wrong assumption about
> > which input device is associated to which cursor plane inside the VM? =
=20
>=20
> The confine + warp trick is typically the default mode and only
> if the guest indicates through e.g. a guest-agent process that
> seamless mode is supported then seamless mode is enabled.
>=20
> IOW the VM is careful to not enable it when it might not work.

How would the guest-agent know? Does it check that there is literally
only one pointer input device and that comes from the VM-viewer?
Or does it limit seamless to white-listed display servers perhaps?

> OTOH most distros now ship with the necessary agents installed
> by default, so e.g. a F32 beta install will automatically use
> seamless mode under QEMU/KVM (spice display protocol) or
> VirtualBox.  If a user uses say F32 + a vnc-viewer inside it
> which needs to do confine + warp tricks then the user will have
> to disable seamless mode manually. In my prior experience
> working on VDI this is usually something which users are
> understanding of and not a problem.

Yeah, making the association between the input and the cursor plane
is unsolved.


Thanks,
pq

--Sig_/eTR3ngxDGfj=wepxAJ_+X58
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl5zjNEACgkQI1/ltBGq
qqcbHA//a/WszgtOxQSOwY9ePLKoaSWwjn4K5X44Y1UOkS8hijdJJAiiRD/otBtO
SubVRVHnagR9jEuTbeaSAamfSncU4roKJ0LxG/qtuuzU212aWbxgAVntMLZqahcu
5fQC3FD0QPQZhfADA62vK5QofEX1+dtcQfB7ksrikl3zEz2bRQeE2y/VPlWHpff8
bX0YZezgEZ1sZeGKEA23UoJeThov951HpMwnkMIbCqRbj0ydU61rObsEQIjLAWy8
1di77nrfxzuNHBUWsJFQN0THN0gAvjiloDxkNsWI4K0UtPLCTufHljM58G6goE1C
AZsqVJCvJZ+LndRt2uENrenNQLNjMQ6VArIwqoEKxcrxwFjyHwZ1oCjo2IRjsD1H
uCsJQl7Tg1qIgzCw/JzBIPLZL1iP6mf0LfFWUAML7bPb+CRgXfdy0t572PMSwaPl
QS7tM9ueKsYyyNm/+S6jC9kHrKRLYNgjhGq94cGHjtU4HkxMuc6ZOBX7WCjwPoRF
Lz+kGCJ+SKZFWa0YEFrT7RUFdZyNKAWH8hgtBgEzIC3Ylt8anh2yvhDPGLbyMnCc
GZ/zdMuDo/PKxOqw4zO4b32uzagGDGxC2z6qP0UjIR+6ij9HveC+9apT6Q2SglfV
B9CVya8sz05ROekkSvzSKVbtob2tvawPcrSJq5zTC+wGVDATJxo=
=txOz
-----END PGP SIGNATURE-----

--Sig_/eTR3ngxDGfj=wepxAJ_+X58--

--===============1466265911==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1466265911==--
