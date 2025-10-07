Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A33BBC2225
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 18:40:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E2510E37C;
	Tue,  7 Oct 2025 16:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="heRDpyJJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6882210E242;
 Tue,  7 Oct 2025 16:40:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1759855243; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Sxf+/92+Ml32tVJMUsV9v8fhvWUJ6QuEXHQKryx0LH3M19ChvfrAaA0tFFLfpF+7Jd8cowemnrIyuW/jtIJAF9u9y09S+2fi8FKPuvWTerBf6aQgx2KnjhgMfcGaWnhUZiJUxdJIE5IjQTxAPDa6Mt/M88RE/lq1gKCqHkIUCfA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1759855243;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=hRyUryZDANXc894TkAmfOs2duy9oMya4qDPMl7ZBx7c=; 
 b=gjrgQQ23PJV+fpFPSucjf4dr/ObFcDMgr2Me3JFPyRq62zmAcEskNd481IpSQNMHI6+z8cYuh3QHxQZLEzl+Kv55ciWMNBvWzTK137P/eoVEbCN/N3uNsH5YfYwVPm+AYeORyVd8GjYgA5JIfoTQMaBkEbAsP9aHYWQKkpke5zY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759855243; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=hRyUryZDANXc894TkAmfOs2duy9oMya4qDPMl7ZBx7c=;
 b=heRDpyJJlDLWQxuezDQq1jXk9gnjlrn7EELEWVQQZI/SP+QYyb9W+Ce8HeYvzGM9
 JCEMj7gyBbMJbA1lXBiMo+I+dMXObkcvF/kYB+ucdroxpyh2dPWLEMnqI2f0cZ/0tL1
 3q8slPmL8dO0NrnjgP97hOUbmGN4V8ehNovyRVXY=
Received: by mx.zohomail.com with SMTPS id 1759855239159538.4052873060034;
 Tue, 7 Oct 2025 09:40:39 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH i-g-t v2 3/3] tests/panthor: add panthor tests
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <F9FAAF77-6E67-4430-ADF2-DF847C6C0F33@collabora.com>
Date: Tue, 7 Oct 2025 13:40:11 -0300
Cc: adrinael@adrinael.net, arek@hiler.eu, kamil.konieczny@linux.intel.com,
 juhapekka.heikkila@gmail.com, bhanuprakash.modem@gmail.com,
 ashutosh.dixit@intel.com, karthik.b.s@intel.com,
 boris.brezillon@collabora.com, liviu.dudau@arm.com, steven.price@arm.com,
 aliceryhl@google.com, jeffv@google.com, intel-gfx@lists.freedesktop.org,
 igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <B53163CD-9D92-47A7-BE69-A9C9D5C25E5D@collabora.com>
References: <20250912181931.3738444-1-daniel.almeida@collabora.com>
 <20250912181931.3738444-4-daniel.almeida@collabora.com>
 <CAPj87rMKex=mBSx9A3JOvwF3DVJRoiwK6oELXr+hoT2GVOq_Rw@mail.gmail.com>
 <F9FAAF77-6E67-4430-ADF2-DF847C6C0F33@collabora.com>
To: Daniel Stone <daniel@fooishbar.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
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



> On 7 Oct 2025, at 10:39, Daniel Almeida <daniel.almeida@collabora.com> =
wrote:
>=20
> Hi Dan, thanks for the review!
>=20
> [=E2=80=A6]
>=20
>>=20
>>> +static void
>>> +issue_store_multiple(u8 *command_stream, uint64_t kernel_va, =
uint32_t constant)
>>> +{
>>> +               uint64_t opcode, reg_num, mov48, store_multiple, =
flush;
>>> +               uint64_t sr, src0, register_bitmap, offset;
>>> +
>>> +               // MOV48: Load the source register ([r68; r69]) with =
the kernel address
>>> +               opcode =3D 0x1;
>>> +               reg_num =3D 68;
>>> +               mov48 =3D (opcode << 56) | (reg_num << 48) | =
kernel_va;
>>> +               mov48 =3D htole64(mov48);
>>> +               memcpy(&command_stream[0], &mov48, sizeof(mov48));
>>> +
>>> +               // MOV48: Load a known constant into r70
>>> +               opcode =3D 0x1;
>>> +               reg_num =3D 70;
>>> +               mov48 =3D (opcode << 56) | (reg_num << 48) | =
constant;
>>> +               mov48 =3D htole64(mov48);
>>> +               memcpy(&command_stream[8], &mov48, sizeof(mov48));
>>> +
>>> +               // STORE_MULTIPLE: Store the first register to the =
address pointed to by [r68; r69]
>>> +               opcode =3D 0x15; // STORE_MULTIPLE
>>> +               sr =3D 70; // Starting from register r70
>>> +               src0 =3D 68; // Address pointed to by [r68; r69]
>>> +               register_bitmap =3D 1; // Store the first register
>>> +               offset =3D 0; // Offset
>>> +               store_multiple =3D (opcode << 56) | (sr << 48) | =
(src0 << 40) |
>>> +                                                                    =
            (register_bitmap << 16) | offset;
>>> +               store_multiple =3D htole64(store_multiple);
>>> +               memcpy(&command_stream[16], &store_multiple, =
sizeof(store_multiple));
>>=20
>> // MOV48 r68, 0 on the below?
>=20
> Wdym? / Why?
>=20
> I want to clarify what you mean here because it was a bit tricky to =
get this to
> work, so I am trying to be really mindful about any changes so that it
> doesn=E2=80=99t break.
>=20

Oh, I now see that you probably also want this to be a comment placed =
before the
opcode like the FLUSH_CACHES below.

=E2=80=94 Daniel=
