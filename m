Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C8818B3CD
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 13:58:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F060B6E2BE;
	Thu, 19 Mar 2020 12:58:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719DD6E2BE
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 12:58:48 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id n20so1523403lfl.10
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 05:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=FpB+dRoD5MzdrPQbf/AIXcjRMhYYenZoJaQqiCKWObA=;
 b=UhAe/j8FqqmGIrbfBgHki5J9Cjy/d1gKXzXoD5TLEIZr26h7TJRl2FwrVKdYgO1NE6
 4nHbk4dCy/ffp5OzkpEydTZqbvjZ1IkvTU7iM9/uDl8Esgezbhdk+MD1WnV4XnZjnvRx
 z7A5FIN3nNlsw0TlwNmPsc+Qotzc0ARztT1XPLY+dg4s1WIyxEvVsJmETkD2ahDiQlE6
 54KtKrqdsjL5+HSMFVVwHYLMaeeSqaahPZ4J3W37ozejInXvlSseenOfCoeB7UbefPgH
 vCoFkn6SUnYm0jOl0j/SEgZ2xaIjotualBhULP5mXnGZ22umqZqzsxrFO10lJHl/VK80
 xGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=FpB+dRoD5MzdrPQbf/AIXcjRMhYYenZoJaQqiCKWObA=;
 b=ZUlwt8Bng4c0KuVf+ZVif3DoZEtWaVU7ZO0OvpKlWRjE/TVC+IpmTBK36PhoFzLP2E
 NAAMi0rqtCl6LqxtkCmG7ngB6WczZHOsDSpfREsxoyxfoHfvBi+UaWrRCBrrUN8EZBB/
 2BG0ifzungD8ROMormeVu4J+NCYdfCeu6Tdg0bmdy16GrQWeOMImL2MG7nLZ+CLQaSZg
 UFAvL/jYcpLd66GSCJY1DJ8jO9PxP0HQIBMRBwWhDiuJLdbTFXsBNLPDOCvnK3MsXsfr
 +1BTAvvGA3BwwwRj2yeHCQr2jB8daeSD9WSn227aL76AdIrEsmBrYskOZ7lFYIqQkmbF
 jmWA==
X-Gm-Message-State: ANhLgQ0U4PAuQxmCcBnrBM4ovDbuxxlLRcgMAMdlyXtYR9dExpFLsUQ3
 mrUhzBUgKYJuhbeEObs7vu4=
X-Google-Smtp-Source: ADFU+vthCog3t4YpvyJ0V7964EzS5Iz5d6oUf9DjnTwyc7r+E7AbHMNpLYuXwjS95ZR+L0ljogbvRA==
X-Received: by 2002:a19:5504:: with SMTP id n4mr2096851lfe.149.1584622726678; 
 Thu, 19 Mar 2020 05:58:46 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id w198sm1491202lff.25.2020.03.19.05.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 05:58:46 -0700 (PDT)
Date: Thu, 19 Mar 2020 14:58:42 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: Atomic KMS API lacks the ability to set cursor hot-spot
 coordinates
Message-ID: <20200319145842.4b7db322@eldfell.localdomain>
In-Reply-To: <8b9c1aac-3398-ab97-a065-014359d40220@redhat.com>
References: <9d86bbe4-70cf-273d-4d61-aec06011d441@redhat.com>
 <20200319120028.56d3427a@eldfell.localdomain>
 <8b9c1aac-3398-ab97-a065-014359d40220@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============0470324806=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0470324806==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/EBKY0eYCgs785axdpYRElbY"; protocol="application/pgp-signature"

--Sig_/EBKY0eYCgs785axdpYRElbY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 19 Mar 2020 12:49:27 +0100
Hans de Goede <hdegoede@redhat.com> wrote:

> Hi,
>=20
> On 3/19/20 11:00 AM, Pekka Paalanen wrote:
> > On Wed, 18 Mar 2020 15:28:02 +0100
> > Hans de Goede <hdegoede@redhat.com> wrote:
> >  =20
> >> ATM the Atomic KMS API lacks the ability to set cursor hot-spot
> >> coordinates. Mutter (and Weston) have tried to emulate this by shifting
> >> the coordinates for where to draw the cursor by the hotspot-coordinates
> >> and always using 0x0 for the hotspot.
> >>
> >> But this breaks the so called "seamless mouse mode" for virtual-machin=
es
> >> and there really is no way to fix this but to allow passing the proper
> >> hotspot coordinates to the virtual gfx-card.
> >>
> >> Seamless-mode consists of 2 parts:
> >>
> >> 1) Letting the VM-viewer window-system draw the cursor as it normally
> >> would draw it.
> >>
> >> 2) Giving absolute coordinates of the mouse to the VM by e.g. emulating
> >> an USB drawing tablet. These coordinates come from translating the
> >> coordinates where the VM-viewer window-system is drawing the cursor
> >> to an absolute position using the top left corner of the view as 0x0
> >> and the bottom right corner as max-abs-x,max-abs-y. =20
> >=20
> > Hi,
> >=20
> > is the VM-viewer then hiding or autonomously moving what the display
> > server inside VM has put on the KMS cursor plane? =20
>=20
> Yes and no, it is not the VM-viewer which is hiding what the
> display-server inside the VM has put on the KMS cursor plane,
> the VM-viewer negotiates seamless mouse mode with the hypervisor
> and then the hypervisor just ignores the cursor-plane except for
> sending "sprite" changes to the VM-viewer.

Hi,

I don't think I understand what you're saying, but I assume that I was
right in that the VM cursor plane content will not be shown always
exactly in the very position the compositor inside the VM puts it.
Maybe the example further below explain the issue I envision.

> > If so, sounds like hilarity would ensue with Weston.
> >=20
> > Weston does not actually know what a cursor is. Weston will happily put
> > any arbitrary non-cursor content onto the KMS cursor plane if it happens
> > to fit. It's just that usually there is a small surface top-most that
> > ends up on the cursor plane, and that surface accidentally happens to
> > be a cursor by Wayland protocol.
> >=20
> > It's not difficult to get e.g. weston-simple-shm window to be shown on
> > the KMS cursor plane: just hide the real cursor from the client.
> >=20
> > No, it's not an oversight. It is called "making maximal use of the
> > available KMS resources" by using KMS planes as much as possible to
> > avoid compositing by rendering with Pixman or OpenGL. =20
>=20
> Yes it sounds like this will break with Weston, note that it already
> is broken in Weston, if you run e.g. Fedora 32 beta + its Weston
> package inside a VirtualBox VM then start gnome-terminal (so
> that you get a caret cursor instead of the default one) and try to
> select text. This will result in the wrong text being displayed
> because Weston does not relay cursor hotspot info to the GPU,
> also see:
> https://gitlab.gnome.org/GNOME/mutter/issues/1094
>=20
> Where the symptoms of this are described in more detail
> (they are identical for Weston and mutter).

Right, that's the problem with the hotspot.

> Fixing this will require the discussed KMS atomic API changes
> and also changes on the Weston and mutter side to pass through
> the hotspot info.

The problem I am referring to is that to the user looking at the
VM-viewer, suddenly an arbitrary application window (e.g.
weston-simple-shm) starts to act as if it was the cursor, when there is
no real cursor shown. You have a random window unexpectedly moving
around, as if you had started dragging it around with your mouse.

The only way to fix that is to stop Weston from putting non-cursor
content on the cursor plane.

It sounds like your VM-viewer makes the assumption that the pointer
input device it delivers to the VM is the one that will control the KMS
cursor plane position inside the VM. Is that right?

What if the desktop inside the VM is controlled by a remote, e.g. VNC?
Then the input events to the VM are completely unrelated to the
expected motion of the cursor. Do you just tell the users to stop using
the seamless mode in that case?

What if display servers stop using the cursor plane completely, because
people may hit a case where a VM-viewer makes the wrong assumption about
which input device is associated to which cursor plane inside the VM?


Thanks,
pq

> Mutter used to do this, but mutter's internal API-s have been
> reworked to closer match the atomic KMS API and as part of this
> passing the hotspot coords was dropped, this is being fixed
> for the legacy KMS API code-paths now (which atm are the only
> code paths, atomic support has no landed yet):
> https://gitlab.gnome.org/GNOME/mutter/merge_requests/1136
>=20
> Regards,
>=20
> Hans

--Sig_/EBKY0eYCgs785axdpYRElbY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl5zbIIACgkQI1/ltBGq
qqfWwg//VON/K49pSMgUCrqVT/rsZwgZ4hjiuVfXIVJHe2H3dufdFzZcHJkaVDMX
IjM0Au6gjOGBNAowx3UCjiZm4yCejAipzIc30DJb4AjpdCRjnpd8uGQ5V0aPg9pa
KJunECoggP69iE8gERqT/0ALufJPKTYosowvEf7AtASRLyugeSfOwbueSgknGOFr
6xpltXyjWt+58gnH/K7Znjrb1jeE1k4RfvRTSYoo1olAF68MkyEcCJR7RH5hUK5e
zZMV6agQqylfHlpdWo2B1NBehPthy4Cqp7Xy+BHfeXZW6bxawSutD0ONlLcd5plb
q4US9OI6Enb6oVNye8AW31lCX1aZkPtAxAWIMqMV5CwtgRuSOsZd9z8GndDFTVOy
3pMHAUd6e6Qei690Y7qQqxxyGibI267/7QpEJOPB/D0k3eha366gDabKQi6fxGp9
zIZdPve1p9/7HkSltxIRq8tcHW2DFy3gPSqsWR6Mo60wuUqAZYT668dX4YCC8D3R
wJS4XMXNSfGlUQ5fskvu2jUbaXeqV8L+xWgqnNlV32rsj45JXc1KjyESNEUui0j7
auTgV194cpIQfUtisOYThscyr/EZErsCCQGO7MDrlu7qX92pOyiqdyHHCeudc79U
2UoaMYm6smGrm62PX5kREkxTLDY9o1RXxIRwS2ELxY4rqrox8KI=
=PukK
-----END PGP SIGNATURE-----

--Sig_/EBKY0eYCgs785axdpYRElbY--

--===============0470324806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0470324806==--
