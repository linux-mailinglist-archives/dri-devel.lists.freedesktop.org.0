Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0D985F3E1
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 10:05:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B2210E8C9;
	Thu, 22 Feb 2024 09:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="VkeLeqdS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10DC310E8C9
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 09:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jy4iJLCblvKkUzR0o5i8Eb7l5HB6H8VhmrwS78eie1Q=; b=VkeLeqdSQSUTs5SQ0vhDaAaUy7
 pjf59Ta5KMN/UG9i/MCyHTX0Zr2sr09yupfv7FGrpg4xV9ny6TR8S6+idtFSsNUpSfwAiKLLrON1U
 0gT5oLQKw25Wf68wVdAYjtNA6eBPzmQqbiJ+rS8xGjixf04mAgsKQ+4B7ViMh56jRCeQtUoJisUel
 2oZ/wiP1Kx0SAslQhLb64DNPXIw2vTtXh8r8xaBEXfb1yVMES0BOHI4Q+CqwYiuu6Shmc/YcJHUxf
 sz3IaQojbZYKaYnl+domwwbMWjkEs/FW6cBwtDldtkXlys+78eCZD7Rw23Da4jVOy2XM8Q+RPgxe7
 zJXgFY6A==;
Received: from [194.136.85.206] (port=46638 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1rd50q-0003aY-2X;
 Thu, 22 Feb 2024 11:05:06 +0200
Date: Thu, 22 Feb 2024 11:04:57 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: Pavel Machek <pavel@ucw.cz>
Cc: Werner Sembach <wse@tuxedocomputers.com>, Hans de Goede
 <hdegoede@redhat.com>, Lee Jones <lee@kernel.org>, jikos@kernel.org,
 linux-kernel@vger.kernel.org, Jelle van der Waa <jelle@vdwaa.nl>, Miguel
 Ojeda <miguel.ojeda.sandonis@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, linux-input@vger.kernel.org,
 ojeda@kernel.org, linux-leds@vger.kernel.org
Subject: Re: Future handling of complex RGB devices on Linux v2
Message-ID: <20240222110457.71618f27@eldfell>
In-Reply-To: <ZdZ2kMASawJ9wdZj@duo.ucw.cz>
References: <0cdb78b1-7763-4bb6-9582-d70577781e61@tuxedocomputers.com>
 <7228f2c6-fbdd-4e19-b703-103b8535d77d@redhat.com>
 <730bead8-6e1d-4d21-90d2-4ee73155887a@tuxedocomputers.com>
 <952409e1-2f0e-4d7a-a7a9-3b78f2eafec7@redhat.com>
 <9851a06d-956e-4b57-be63-e10ff1fce8b4@tuxedocomputers.com>
 <1bc6d6f0-a13d-4148-80cb-9c13dec7ed32@redhat.com>
 <b70b2ea8-abfd-4d41-b336-3e34e5bdb8c6@tuxedocomputers.com>
 <477d30ee-247e-47e6-bc74-515fd87fdc13@redhat.com>
 <e21a7d87-3059-4a51-af04-1062dac977d2@tuxedocomputers.com>
 <247b5dcd-fda8-45a7-9896-eabc46568281@tuxedocomputers.com>
 <ZdZ2kMASawJ9wdZj@duo.ucw.cz>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_GjnoK4T7HWLn/wL/.Ih.Jd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - whm50.louhi.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - haloniitty.fi
X-Get-Message-Sender-Via: whm50.louhi.net: authenticated_id:
 pekka.paalanen@haloniitty.fi
X-Authenticated-Sender: whm50.louhi.net: pekka.paalanen@haloniitty.fi
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/_GjnoK4T7HWLn/wL/.Ih.Jd
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 21 Feb 2024 23:17:52 +0100
Pavel Machek <pavel@ucw.cz> wrote:

> Hi!
>=20
> > so after more feedback from the OpenRGB maintainers I came up with an e=
ven
> > more generic proposal:
> > https://gitlab.com/CalcProgrammer1/OpenRGB/-/issues/3916#note_175307286=
9 =20
>=20
> > >evaluate-set-command ioctl taking:
> > >{
> > >=C2=A0=C2=A0=C2=A0 enum command=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* one of supported_commands */
> > >=C2=A0=C2=A0=C2=A0 union data
> > >=C2=A0=C2=A0=C2=A0 {
> > >=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 char raw[3072],
> > >=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 {
> > >=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 <input struct=
 for command 0>
> > >=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 }, =20
>=20
> Yeah, so ... this is not a interface. This is a backdoor to pass
> arbitrary data. That's not going to fly.
>=20
> For keyboards, we don't need complete new interface; we reasonable
> extensions over existing display APIs -- keyboards are clearly 2D.

I suppose they could be seen as *a* display, but if you are referring
to DRM KMS UAPI, then no, I don't see that fitting at all:

- the "pixel grid" is not orthogonal, it's not a rectangle, and it
  might not be a grid at all

- Timings and video modes? DRM KMS has always been somewhat awkward for
  display devices that do not have an inherent scanout cycle and timings
  totally depend on the amount of pixels updated at a time
  (FB_DAMAGE_CLIPS), e.g. USB displays (not USB-C DP alt mode).
  They do work, but they are very different from the usual hardware
  involved with KMS, require special consideration in userspace, and
  they still are actual displays while what we're talking about here
  are not.

- KMS has no concept of programmed autonomous animations, and likely
  never will. They are not useful with actual displays.

- Userspace will try to light up KMS outputs automatically and extend
  the traditional desktop there. This was already a problem for
  head-mounted displays (HMD) where it made no sense. That was worked
  around with an in-kernel list of HMDs and some KMS property quirking.

Modern KMS UAPI very much aims to be a generic UAPI that abstracts
display devices. It already breaks down a little for things like USB
displays and virtual machines (e.g. qemu, vmware, especially with
remote viewers), which I find unfortunate. With HMDs the genericity
breaks down in other ways, but I'd claim HMDs are a better fit still
than full-featured VM virtual displays (cursor plane hijacking). With
non-displays like keyboards the genericity would be completely lost, as
they won't work at all the same way as displays. You cannot even show
proper images there, only coarse light patterns *IF* you actually know
the pixel layout. But the pixel layout is(?) hardware-specific which is
the opposite of generic.

While you could dress keyboard lights etc. up with DRM KMS UAPI, the
userspace would have to be written from scratch for them, and you
somehow need to make existing KMS userspace to never touch those
devices. What's the point of using DRM KMS UAPI in the first place,
then?


Thanks,
pq

--Sig_/_GjnoK4T7HWLn/wL/.Ih.Jd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXXDjkACgkQI1/ltBGq
qqcWSg/+LfVHYtYAxb2OgFmYI0f3aKnMdoFZx4JA7AB95VfEyv+ok/lFhIWz8aIn
B2zqfOxV1lPNFKOeBzh8oZRnQAzB4+oXSIEk61OI506esijcY0zpbzyg8qkUgpfr
tVBeI7Ck0ypAHHGHb/3nnZfR556ZWs0CsMvDmHyBQvbBkPUykfB37+U6BmAVC2ry
DL6jrMl0q09v9nLdNjQC9AkrO9lIMA8TME+XDUl1sLYpw+4DrAM+lnWUAyXFY5zk
jMwv2G6BGNWpQTi1R3ImL5O8mdl+KXPcY36VHQwLUzXVmZOzYsfJJAjqvySIHNpG
e4jC7EoJDCJdulHE/GcyXv+kt9AOGw6D2bSqmmosgk/g7F1gKJibN0hdy48HHV4+
ipZuoM7djS/SBPc7A8KLvPIHfoJKfVfsjD6i4aSotEUHu8xyXsradMka9ouxNm5Z
u0b5wE+Q7Csbmd8yLMHTqyE2e+ptdjScb85ra3sP8ZBXEQl/ZNurfQQIxjBrmgtc
Zl/labXGRS8kdNQeba2rt3qzi/W81yebHR+yO/gwAgRJoFtzJj1rxHjPntF8pKQh
cGrDLfc87GN9fvB9PL3KdGqKfvKzAmVmprxAdulqdZYvDblzy4fRekHn12xA7/vO
Bc/LFP/jo+fZ02aeTZYSVHxQglUb/HkmPe+MldrSp7xA3ustudM=
=rxLn
-----END PGP SIGNATURE-----

--Sig_/_GjnoK4T7HWLn/wL/.Ih.Jd--
