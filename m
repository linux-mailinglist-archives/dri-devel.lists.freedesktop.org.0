Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFE6BC22A6
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 18:50:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62AC610E6F0;
	Tue,  7 Oct 2025 16:50:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Wb1RazDo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D16110E2AA;
 Tue,  7 Oct 2025 16:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1759855837;
 bh=YXJpb89H+N1yKT3H5jb8pIF33Ti3wEFZtXrKqPXuou8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Wb1RazDo/3UsPvQDo13zVJYI903e8Zn8qB5xCI9vQXViEh4Sf6HNw3Z+iw1YhvaxS
 I+L2KYvfTyLO+41i+GqIqKotLfreBELjMBHfbGt5bxei9OHxW3iAeTtqSCHPS+F7zR
 vNgpEu3TQKGKBIYGOQQYFk+c8hgbL7R2oOlQrgyYliHcVZUO5iIfKg/T/3vkwYk8Ri
 yrZQnX+zCv7a34U47OxTR5o4QNsrnIX4WURp1cNiHFNgN5PUPcEI03ez+KDZ7YASPY
 jRvlqO6lF1IbQt/OBEHfFzfr2PX3sCb0OaFPhljqBsqrBSHtABHgEMOzuvbyWDjUhj
 rrJsapsRR8U1A==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C06DA17E0FDB;
 Tue,  7 Oct 2025 18:50:36 +0200 (CEST)
Date: Tue, 7 Oct 2025 18:50:31 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Daniel Stone <daniel@fooishbar.org>, adrinael@adrinael.net,
 arek@hiler.eu, kamil.konieczny@linux.intel.com,
 juhapekka.heikkila@gmail.com, bhanuprakash.modem@gmail.com,
 ashutosh.dixit@intel.com, karthik.b.s@intel.com, liviu.dudau@arm.com,
 steven.price@arm.com, aliceryhl@google.com, jeffv@google.com,
 intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 3/3] tests/panthor: add panthor tests
Message-ID: <20251007185031.46473b7b@fedora>
In-Reply-To: <B53163CD-9D92-47A7-BE69-A9C9D5C25E5D@collabora.com>
References: <20250912181931.3738444-1-daniel.almeida@collabora.com>
 <20250912181931.3738444-4-daniel.almeida@collabora.com>
 <CAPj87rMKex=mBSx9A3JOvwF3DVJRoiwK6oELXr+hoT2GVOq_Rw@mail.gmail.com>
 <F9FAAF77-6E67-4430-ADF2-DF847C6C0F33@collabora.com>
 <B53163CD-9D92-47A7-BE69-A9C9D5C25E5D@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 7 Oct 2025 13:40:11 -0300
Daniel Almeida <daniel.almeida@collabora.com> wrote:

> > On 7 Oct 2025, at 10:39, Daniel Almeida <daniel.almeida@collabora.com> =
wrote:
> >=20
> > Hi Dan, thanks for the review!
> >=20
> > [=E2=80=A6]
> >  =20
> >>  =20
> >>> +static void
> >>> +issue_store_multiple(u8 *command_stream, uint64_t kernel_va, uint32_=
t constant)
> >>> +{
> >>> +               uint64_t opcode, reg_num, mov48, store_multiple, flus=
h;
> >>> +               uint64_t sr, src0, register_bitmap, offset;
> >>> +
> >>> +               // MOV48: Load the source register ([r68; r69]) with =
the kernel address
> >>> +               opcode =3D 0x1;
> >>> +               reg_num =3D 68;
> >>> +               mov48 =3D (opcode << 56) | (reg_num << 48) | kernel_v=
a;
> >>> +               mov48 =3D htole64(mov48);
> >>> +               memcpy(&command_stream[0], &mov48, sizeof(mov48));
> >>> +
> >>> +               // MOV48: Load a known constant into r70
> >>> +               opcode =3D 0x1;
> >>> +               reg_num =3D 70;
> >>> +               mov48 =3D (opcode << 56) | (reg_num << 48) | constant;
> >>> +               mov48 =3D htole64(mov48);
> >>> +               memcpy(&command_stream[8], &mov48, sizeof(mov48));
> >>> +
> >>> +               // STORE_MULTIPLE: Store the first register to the ad=
dress pointed to by [r68; r69]
> >>> +               opcode =3D 0x15; // STORE_MULTIPLE
> >>> +               sr =3D 70; // Starting from register r70
> >>> +               src0 =3D 68; // Address pointed to by [r68; r69]
> >>> +               register_bitmap =3D 1; // Store the first register
> >>> +               offset =3D 0; // Offset
> >>> +               store_multiple =3D (opcode << 56) | (sr << 48) | (src=
0 << 40) |
> >>> +                                                                    =
            (register_bitmap << 16) | offset;
> >>> +               store_multiple =3D htole64(store_multiple);
> >>> +               memcpy(&command_stream[16], &store_multiple, sizeof(s=
tore_multiple)); =20
> >>=20
> >> // MOV48 r68, 0 on the below? =20
> >=20
> > Wdym? / Why?
> >=20
> > I want to clarify what you mean here because it was a bit tricky to get=
 this to
> > work, so I am trying to be really mindful about any changes so that it
> > doesn=E2=80=99t break.
> >  =20
>=20
> Oh, I now see that you probably also want this to be a comment placed bef=
ore the
> opcode like the FLUSH_CACHES below.

BTW, if we start adding more tests using manually forged command
streams, it might make sense to provides some sort of helpers like
those we have in mesa[1], but let's keep that for later.

[1]https://elixir.bootlin.com/mesa/mesa-25.2.4/source/src/panfrost/genxml/c=
s_builder.h
