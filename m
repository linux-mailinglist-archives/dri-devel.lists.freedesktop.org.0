Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 291E44BF4A3
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 10:26:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BDE510E785;
	Tue, 22 Feb 2022 09:26:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4855610E785
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 09:26:37 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id f11so10729440ljq.11
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 01:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=JBF4fIcAnvRusm6p5BMoqr6RpxbvHrmHP+8AW6BUl1o=;
 b=m6q1oTR/aDdP/XLmbe0J0C7PXAxE7dGQgAebYmvzEUFsGJ1nsr2Hmt51/lzKNtoJuj
 OgHwILfA6mEEMX3ynuy77M+/dpZ2RA4Ntwth0mwqfjUz8bOrhOfT6PC+25pDtk8fpkJM
 RI0F8HYb9UcHpFfeyi8YOYlv9zgDIB9QZowF0fUq2vxP8t4/rV+InkAXoCy7qr9v0Y4k
 s7tAtJWoQDhV2ZumvRAuzh3otxSHbBqK20YLtTQ76BgsC2YlO7unxx8GYIK2lWfJ2ioO
 wOKeZw9/0Yp2gRUXLzCRHkr/T2WPYgP2UJMUGPRabiNbW7rXc1H/gWyR1y2MvFIF6SzM
 8y9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=JBF4fIcAnvRusm6p5BMoqr6RpxbvHrmHP+8AW6BUl1o=;
 b=NrmhZTG0v6mPKIcNKQd7g/TrKRszTJurEdsEq43Sk/LSDXaQEReqvq2AYbwjP+Nmqm
 DXInR14XZ3NxQsk2zmOdJXRzUejChDaBIsmr6NJnKQjd8/r19GqBIjL/qLkFIB6bwa3v
 2AdZBbur2bYVfXdfwJgGESLpIbszk+hkD3U/aRUowttEWORdkE+MdZ5Sp/XLY0kbYj8k
 UrO0N1mMWh4/LLjXTcDc9LDELiS4lnAHDy3+t8QOQ6hX1WcYguZE+E95ZzmDqhYHjpAU
 NeUKVztIUOv8lSyeeEzvvW84oseKn7T9OzK2SXvfX3skT7lB7UPn3z7Pp490EJvJA6bO
 tk8w==
X-Gm-Message-State: AOAM530qC015E6eP6TCXYcTHj6zK7TN9zGkd+0Ark488X2IoiDoadBzt
 es/mMvRzb//SJl2q7nW25Aw=
X-Google-Smtp-Source: ABdhPJwCgtHArkTV5ek0qzsh40gxrD+8OAEMiIbH23vPLWLGCUFV7kLWp2MZa5tFLQT2ZYNxUPq4gQ==
X-Received: by 2002:a2e:b0fa:0:b0:246:291a:5232 with SMTP id
 h26-20020a2eb0fa000000b00246291a5232mr13070525ljl.317.1645521995380; 
 Tue, 22 Feb 2022 01:26:35 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id k14sm1641594ljh.82.2022.02.22.01.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 01:26:35 -0800 (PST)
Date: Tue, 22 Feb 2022 11:26:24 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Igor Torrente <igormtorrente@gmail.com>
Subject: Re: [PATCH v4 7/9] drm: vkms: Refactor the plane composer to accept
 new formats
Message-ID: <20220222112624.3068cf9a@eldfell>
In-Reply-To: <f622224f-767e-c85a-3129-8c3b1e4313bc@gmail.com>
References: <20220121213831.47229-1-igormtorrente@gmail.com>
 <20220121213831.47229-8-igormtorrente@gmail.com>
 <20220208104018.cxnxgzgjn3ecf53l@mail.igalia.com>
 <b40b3f1b-1b0d-0b81-a5cf-1496fb479920@gmail.com>
 <20220209214535.wqoe3otgelry2kef@mail.igalia.com>
 <1b26f760-2213-b711-53fb-847560daf963@gmail.com>
 <20220221111823.044ca6ca@eldfell>
 <f622224f-767e-c85a-3129-8c3b1e4313bc@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6bSEMdTNr=7Tv.sG6RXcazC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 tzimmermann@suse.de, ~lkcamp/patches@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/6bSEMdTNr=7Tv.sG6RXcazC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 21 Feb 2022 22:13:21 -0300
Igor Torrente <igormtorrente@gmail.com> wrote:

> Hi Pekka,
>=20
> On 2/21/22 06:18, Pekka Paalanen wrote:
> > On Sun, 20 Feb 2022 22:02:12 -0300
> > Igor Torrente <igormtorrente@gmail.com> wrote:
> >  =20
> >> Hi Melissa,
> >>
> >> On 2/9/22 18:45, Melissa Wen wrote: =20
> >>> On 02/08, Igor Torrente wrote: =20
> >>>> Hi Melissa,
> >>>>
> >>>> On 2/8/22 07:40, Melissa Wen wrote: =20
> >>>>> On 01/21, Igor Torrente wrote: =20
> >>>>>> Currently the blend function only accepts XRGB_8888 and ARGB_8888
> >>>>>> as a color input.
> >>>>>>
> >>>>>> This patch refactors all the functions related to the plane compos=
ition
> >>>>>> to overcome this limitation.
> >>>>>>
> >>>>>> A new internal format(`struct pixel`) is introduced to deal with a=
ll
> >>>>>> possible inputs. It consists of 16 bits fields that represent each=
 of
> >>>>>> the channels.
> >>>>>>
> >>>>>> The pixels blend is done using this internal format. And new handl=
ers
> >>>>>> are being added to convert a specific format to/from this internal=
 format.
> >>>>>>
> >>>>>> So the blend operation depends on these handlers to convert to thi=
s common
> >>>>>> format. The blended result, if necessary, is converted to the writ=
eback
> >>>>>> buffer format.
> >>>>>>
> >>>>>> This patch introduces three major differences to the blend functio=
n.
> >>>>>> 1 - All the planes are blended at once.
> >>>>>> 2 - The blend calculus is done as per line instead of per pixel.
> >>>>>> 3 - It is responsible to calculates the CRC and writing the writeb=
ack
> >>>>>>        buffer(if necessary).
> >>>>>>
> >>>>>> These changes allow us to allocate way less memory in the intermed=
iate
> >>>>>> buffer to compute these operations. Because now we don't need to
> >>>>>> have the entire intermediate image lines at once, just one line is
> >>>>>> enough.
> >>>>>>
> >>>>>> | Memory consumption (output dimensions) |
> >>>>>> |:--------------------------------------:|
> >>>>>> |       Current      |     This patch    |
> >>>>>> |:------------------:|:-----------------:|
> >>>>>> |   Width * Heigth   |     2 * Width     |
> >>>>>>
> >>>>>> Beyond memory, we also have a minor performance benefit from all
> >>>>>> these changes. Results running the IGT tests `*kms_cursor_crc*`:
> >>>>>>    =20
> >>>>> First, thanks for this improvement.
> >>>>>
> >>>>> Some recent changes in kms_cursor_crc caused VKMS to fail in most t=
est
> >>>>> cases (iirc, only size-change and alpha-opaque are passing currentl=
y). =20
> >>>>
> >>>> I updated my igt and kernel(from drm_misc/drm-misc-next) to the late=
st
> >>>> commit[1][2] and I'm getting mixed results. Sometimes most of the te=
st
> >>>> passes, sometimes almost nothing passes. =20
> >>> hmm.. is it happening when running kms_cursor_crc? Is the results
> >>> variation random or is it possible to follow a set of steps to reprod=
uce
> >>> it? When failing, what is the reason displayed by the log? =20
> >>
> >> I investigated it a little bit and discovered that the KMS
> >> cursor(".*kms_cursor_crc*" ) are failing after the execution of
> >> writeback tests(".*kms_writeback.*").
> >>
> >> I don't know what is causing it, but they are failing while trying to
> >> commit the KMS changes.
> >>
> >> out.txt:
> >> IGT-Version: 1.26-NO-GIT (x86_64) (Linux: 5.17.0-rc2 x86_64)
> >> Stack trace:
> >>     #0 ../lib/igt_core.c:1754 __igt_fail_assert()
> >>     #1 ../lib/igt_kms.c:3795 do_display_commit()
> >>     #2 ../lib/igt_kms.c:3901 igt_display_commit2()
> >>     #3 ../tests/kms_cursor_crc.c:820 __igt_unique____real_main814()
> >>     #4 ../tests/kms_cursor_crc.c:814 main()
> >>     #5 ../csu/libc-start.c:308 __libc_start_main()
> >>     #6 [_start+0x2a]
> >> Subtest pipe-A-cursor-size-change: FAIL
> >>
> >> err.txt:
> >> (kms_cursor_crc:1936) igt_kms-CRITICAL: Test assertion failure function
> >> do_display_commit, file ../lib/igt_kms.c:3795:
> >> (kms_cursor_crc:1936) igt_kms-CRITICAL: Failed assertion: ret =3D=3D 0
> >> (kms_cursor_crc:1936) igt_kms-CRITICAL: Last errno: 22, Invalid argume=
nt
> >> (kms_cursor_crc:1936) igt_kms-CRITICAL: error: -22 !=3D 0
> >> =20
> >>>
> >>>   From my side, only the first two subtest of kms_cursor_crc is passi=
ng
> >>> before this patch. And after your changes here, all subtests are
> >>> successful again, except those related to 32x10 cursor size (that nee=
ds
> >>> futher investigation). I didn't check how the recent changes in
> >>> kms_cursor_crc affect VKMS performance on it, but I bet that clearing
> >>> the alpha channel is the reason to have the performance back. =20
> >>
> >> Yeah, I also don't understand why the 32x10 cursor tests are failing.
> >> =20
> >=20
> > Hi,
> >=20
> > are the tests putting the cursor partially outside of the CRTC area?
> > Or partially outside of primary plane area (which IIRC you used when you
> > should have used the CRTC area?)?
> >=20
> > Does the writeback test forget to unlink the writeback connector? Or
> > does VKMS not handle unlinking the writeback connector? =20
>=20
> I don't know the answer to all these questions.

These are just suggestions in the direction of research, just in case
you had no idea. ;-)

After all, the UAPI error code is EINVAL, so something in VKMS rejects
the IGT-produced configuration. Figuring out what that configuration is
and why it gets rejected might be useful to find out.

Maybe the original writeback code did not expect planes to be partially
off-screen? Guarding against that would produce EINVAL. This is just a
wild guess, I've never read that code, but it also seems like the
simplest possible mistake to make in good faith - not a bug in code,
just a wrong initial assumption of use cases.

If you found in your testing that the IGT cursor-size-change test
succeeds if ran before writeback test, but fails if ran after the
writeback test, then obviously something in the writeback test is
leaving stray state behind. It could be the test itself, or it could be
a VKMS bug.


Thanks,
pq

--Sig_/6bSEMdTNr=7Tv.sG6RXcazC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmIUrEAACgkQI1/ltBGq
qqcmnQ/+O+dGo3v/iuGXznEX1swst/nWhwOJ6W6lPHGISvlI0MwaUmIIN6X4//cI
AeVDzvNo74E+U6XN3mnMtF+lwZxui55foDZfdwAFsEpm67UOksjUPGFs7yQw93+c
PRp3410fh8742XccFhVlZkqz8U5DDELn/koM5Zi5R+3h/CkcLhvkqJMs5fkKpWXP
N2abTyECFPLQYtLpItCHtTUZyTRdmkjUCeqiHQEDUgz9MA1cmQltR7eUxe+SkM/G
/aI9rjK5I0iy+p3vC/BDIU9fghtD6jkA6DHIK1Rpunul3wcWHD8tWClgwvIDlnu8
Jy80KPAf+nhqB6ACfmNPtS0QnHBadcDnx3Oth99Olp7H8vOHzkFd8nDuxlf9RG3C
ASIS/KCmsMriaIlSPQ/g9NEKTHBTD7kXNhpCffqNedwTczuK5iIgHU76UaLNMjJ1
biuPkncGqz8iN8XtqQyFnbNQFeWOaK7QApftxGoJ64TlnR0zuY8abxgVvksAel0d
KL6FYPWA5pS5whJp4/I1mYK5KQTSu3YgyOPvvvXGumQja9vyEkqDLp7CHj4xeWI5
CDJn5FvhqqAN6AvewxdL6NlbcYrsx4jg74+fec9B55q+5s9VqfRyhCArZ3MRV/hH
QMo+77Czpe+fnTxzsagECaHgQredl4zHLETHVWznpu2iI3F/Zb0=
=yvDA
-----END PGP SIGNATURE-----

--Sig_/6bSEMdTNr=7Tv.sG6RXcazC--
