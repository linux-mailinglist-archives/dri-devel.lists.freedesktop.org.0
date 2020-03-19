Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B404618B0B9
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 11:00:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE9F6E9CE;
	Thu, 19 Mar 2020 10:00:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56D066E9CE
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 10:00:34 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id 19so1721203ljj.7
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 03:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=4JHllBoh/A03NemwJ+8AXp/M0W4nJCUeWeAN1kb7+pE=;
 b=q7C+DFu/VeTwj7Crln1Tb15z4gHLK5NiGP3wNqugDVRW12LlpqyfFH5ardHHTnvCZU
 sdU1rdoJjKzzhF/G1aF1EWsVBJ7UgEcfZzcGhjG3oEMtX9vkfJB33qnTxnlhb8sJYOSZ
 wIB/1udNVpuJnQ8EyZcyWCAKBQIcBbPtRRVhN6Knyqan2ThoWA49eP1kuSoj1ixICty6
 MMY2CThitMusICBBYEf4CEjh0Yo/ULtRyYaXms7KGBnKOMFcBuT4rXY7Ie7MCHhtVaKR
 3T65npUOBjN+QRVa/9sl1luUuSC8Gr+QxxMgZ9O6SJ/JmDWNnGHPkekY4R+2K7PgT9Gv
 fRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=4JHllBoh/A03NemwJ+8AXp/M0W4nJCUeWeAN1kb7+pE=;
 b=Fu0HvIDTJTsdYkNZLNrdZQB8uCSRHGNtN5USXgJQpCV3a4dDM2fw6WSXGvs/7kSKj2
 RvJX6Yq/7Qtkpp5MxYgrngbSn6AlmQO+qEVbWRzEsU78AP4J+tRDrccP93Bx34rSah4o
 ZQn5hQAEIw8yijUEalTtx3KizyQ5rxhv1kBwjyr03BUBMqAwSZtsMrCFfbjSd6h/sCfE
 mT8jk3f09i/+gEK4M0bbwjpRQ8RkTMOPYhP/ux8whZhal8YurGv3nJNmd/MTqhT7gMaZ
 MduIG3D2mywZw/+jolX+hox0XmOdPyagqedoRs7X8cOyLxSfifY7dNzTzJvL3YWCa9JU
 NuyQ==
X-Gm-Message-State: ANhLgQ1URCE2dAnHcgatbK1lzqaUqDjhiPhImXOUsXHHQUJY09ZuF7Oe
 8xgvYwKJBVnn0KgdIUhZRT0=
X-Google-Smtp-Source: ADFU+vtnqI1PBEl7jglli6xlSlAETfgb+BHCcydsjScUF0MQAZ5pLLzR/2T2BxfU3pnA2PCySc5dgA==
X-Received: by 2002:a2e:90c4:: with SMTP id o4mr1540179ljg.287.1584612032597; 
 Thu, 19 Mar 2020 03:00:32 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id f4sm1123035ljo.79.2020.03.19.03.00.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 03:00:32 -0700 (PDT)
Date: Thu, 19 Mar 2020 12:00:28 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: Atomic KMS API lacks the ability to set cursor hot-spot
 coordinates
Message-ID: <20200319120028.56d3427a@eldfell.localdomain>
In-Reply-To: <9d86bbe4-70cf-273d-4d61-aec06011d441@redhat.com>
References: <9d86bbe4-70cf-273d-4d61-aec06011d441@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============1009704194=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1009704194==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/__i8V2uHeC.P/fEIYqHm=7J"; protocol="application/pgp-signature"

--Sig_/__i8V2uHeC.P/fEIYqHm=7J
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 18 Mar 2020 15:28:02 +0100
Hans de Goede <hdegoede@redhat.com> wrote:

> ATM the Atomic KMS API lacks the ability to set cursor hot-spot
> coordinates. Mutter (and Weston) have tried to emulate this by shifting
> the coordinates for where to draw the cursor by the hotspot-coordinates
> and always using 0x0 for the hotspot.
>=20
> But this breaks the so called "seamless mouse mode" for virtual-machines
> and there really is no way to fix this but to allow passing the proper
> hotspot coordinates to the virtual gfx-card.
>=20
> Seamless-mode consists of 2 parts:
>=20
> 1) Letting the VM-viewer window-system draw the cursor as it normally
> would draw it.
>=20
> 2) Giving absolute coordinates of the mouse to the VM by e.g. emulating
> an USB drawing tablet. These coordinates come from translating the
> coordinates where the VM-viewer window-system is drawing the cursor
> to an absolute position using the top left corner of the view as 0x0
> and the bottom right corner as max-abs-x,max-abs-y.

Hi,

is the VM-viewer then hiding or autonomously moving what the display
server inside VM has put on the KMS cursor plane?

If so, sounds like hilarity would ensue with Weston.

Weston does not actually know what a cursor is. Weston will happily put
any arbitrary non-cursor content onto the KMS cursor plane if it happens
to fit. It's just that usually there is a small surface top-most that
ends up on the cursor plane, and that surface accidentally happens to
be a cursor by Wayland protocol.

It's not difficult to get e.g. weston-simple-shm window to be shown on
the KMS cursor plane: just hide the real cursor from the client.

No, it's not an oversight. It is called "making maximal use of the
available KMS resources" by using KMS planes as much as possible to
avoid compositing by rendering with Pixman or OpenGL.


Thanks,
pq


> 1) Means that any coordinates the window-system inside the VM passes to
> the VM's gfx-card for where to draw the cursor are basically totally
> ignored to avoid lag / flicker (and to not have to grab the cursor /
> confine it to the VM-viewer window and to not have to warp the
> pointer).
>=20
> This means that the offset added to the coordinates by e.g. mutter to
> emulate the hotspot are ignored. For Seamless mouse mode to keep working
> properly the window-system inside the VM need to pass the VM's gfx-card
> the correct hotspot when setting the cursor. Which currently is not
> possible when restricting oneself to the atomic APIs.
>=20
> Also see: https://gitlab.gnome.org/GNOME/mutter/issues/1094
> Where this is currently being tracked from the mutter side. Mutter
> internally has both atomic and legacy paths. The plan for now is to
> push the hotspot-emulation by shifting coordinates thing into the
> atomic path, fixing seamless mouse mode when running in legacy mode,
> combined with blacklisting vboxvideo, vmwgfx, qxl and cirrus from
> using atomic mode.
>=20
> This is of course a workaround, eventually we would like to see
> the atomic API extended to allow passing the cursor hot spot.
>=20
> I'm not really familiar enough with the atomic API to come up with
> an API design for this, but if there are suggestions on how this
> should look like from the uAPI side then I can take a shot at
> implementing this (and hooking it up in mutter's atomic code
> paths to test it).
>=20
> Regards,
>=20
> Hans
>=20
>=20
>=20
> p.s.
>=20
> Before people start discussing how the VM / VM-viewer is broken here and
> the VM needs to be fixed. Seamless mouse mode exists for at least a
> decade and has worked fine during this entire decade. It also works
> fine when using the legacy (non atomic) DRM_IOCTL_MODE_CURSOR2 ioctl;
>=20
> Also this problem reproduces with 2 completely independent VM code-bases,
> it has been seen on both qemu-kvm VMs and on VirtualBox VMs and I would
> not be surprised if other hypervisors are also affected.
>=20
> And on the API consumer side this problem has been triggered by both
> mutter and Weston.
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel


--Sig_/__i8V2uHeC.P/fEIYqHm=7J
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl5zQrwACgkQI1/ltBGq
qqe6ExAAjRf0KbzD+SyvlioyLlAMV58gqpbTPuk4BDnTNc+2yyaTay/Cmu/lSygn
xKvItqk1NXSpGlfx3eE4qqGHxFyjEPqrwlZMd6dvo19B0wwDzPCHvyqWet20XJCB
LaorGCVIpbAENdsB6DX0y4Q0Y583timlpjGIozKgvpZ1e5z8v4bv1DbvhaEJriBV
nrbTVzJgTEFN0ftZGTitCfceCdp6rq9f6FwV4bvPTd8uY6VcPNV/N7PHj6610nai
FFruunkB1lFrb/ckYVJw1Z44yW/o3+u2i8Ngx3C261Hz1y7VRb0H1mCOuphAYmdV
Ca/VmY6Or1I8OXOOXQX+YwjhrZq/uE5I9Bt8LP8B4hshmaNnK5Pv8r/xRKBvDF7s
WUVsYh6AKQIKp3TY1l/SeNoQT7tn7tzmvlwqTOBjHaFLrUqFtI9uYb4L0U5yF/Cd
kkZ6pT/TPs8bl8XlR0IBkow5H9hNSEjX6Olpi19UAXyZ05bOjJSfxWosew+9m/yM
/fAQzrw6TnjX6DO6lF49/Ffb59rCJKFlY21LoLCIO4JRY5Vc3pCv03dj/ENXL/VS
fON0ULJYgnuoIrf9WKZFszbvwdhbYsl8uIBC05FUUl42UniSYXZXA4kzlr7ONP/P
OGfa+IE1XeNyJTbQSXD5t+MrRQNe/BPgg+Js67pGd65boeF7S40=
=l8O1
-----END PGP SIGNATURE-----

--Sig_/__i8V2uHeC.P/fEIYqHm=7J--

--===============1009704194==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1009704194==--
