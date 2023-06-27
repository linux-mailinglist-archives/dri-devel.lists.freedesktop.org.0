Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CABC073F68D
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 10:12:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD4510E29E;
	Tue, 27 Jun 2023 08:12:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA4B410E29E
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 08:12:37 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b69e6d324aso32468161fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 01:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687853556; x=1690445556;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=XtvD204b/SR+u6xcCBLLYzT70vnoEnK28uSBU5v32j0=;
 b=TWoyRKQVvj7qJ7k6oPrjGST5ln/ysuAy0IsWFBtH4n/b91uSvpXe3yRCj4e1CQTGh5
 ZtlGuBR62Q2bBvAuOUSy+IocrIaZiXIsxPPKPld3M/UrL5HUK3HB4yV0GVqQ4Eay7oxJ
 zRQx1lghm0zg5w8+XBB77ZdHF/tJnLKTS1ijDpWRKCN37XoGTh8C1wvwct0cbtZx/kr3
 aN+zwSQqKogoltCzfKUmVhzfvkmGMRBwz89S5Kh1bBfrc53mgIvvGbwObMfUHKXzhbJ/
 Gj1TMfqD3qr+5coA6K32ILLYFRJfc6HJYw3eWGGXec+X3pWJbr5aDUQUNnMnb6Zs44r5
 A9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687853556; x=1690445556;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XtvD204b/SR+u6xcCBLLYzT70vnoEnK28uSBU5v32j0=;
 b=a2WEEcQUWu3bEZ0sh2UMpDgoo3lWzMRTyKgSjoZ9VvXkoy2IwSYB9TkqFEl4PV/pFP
 XvYg7A+3drhx0MgB7/D3RD7g8eyvIugDQgmQq4H1ZA4lfuLcv8Km6AcaAkb0dywHGpGs
 k4KiMereaNENPkguVCBRY+lfBcM12sI9UUNHFZeZ8v1VicBCH2X6UxXNfcarOStHyU7h
 ifFlqhULkhpviy4yTwWtGgwN/7P9STtXYE5rPjjepe+Npj1Eu7Sb4M6FMA4t6FSp7Zv1
 E431GH7sE8uOsaDM08kkNy/pA7V3DW/vTlqN3ek0JyFdkQ+ebHKEuW8etZMf1uwj8sLA
 n90g==
X-Gm-Message-State: AC+VfDxfmbeDs6+TrRr3Vn3miLWbcSPQfg/68tEYTHXZcYkHJ4aHJuZe
 tAJE0D9GrEJ6FUxpPxSXYgM=
X-Google-Smtp-Source: ACHHUZ7j8ma2JyFezxFTjFyl5ikUbw790zc3h0wrahS5vxtI/fBX8CZrkJRvXWMRQ0B03FQsNSp/8w==
X-Received: by 2002:a2e:80d0:0:b0:2b5:9f54:e290 with SMTP id
 r16-20020a2e80d0000000b002b59f54e290mr5106103ljg.0.1687853555244; 
 Tue, 27 Jun 2023 01:12:35 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 a12-20020a2eb16c000000b002b69f64b08asm1101668ljm.37.2023.06.27.01.12.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 01:12:34 -0700 (PDT)
Date: Tue, 27 Jun 2023 11:12:31 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Maira Canal <mairacanal@riseup.net>
Subject: Re: [PATCH v4] drm/vkms: Add support to 1D gamma LUT
Message-ID: <20230627111231.79ed863c@eldfell>
In-Reply-To: <91aa3ffe-edb9-d85c-c62b-49f7bf73a0ae@riseup.net>
References: <20230621194121.184552-1-arthurgrillo@riseup.net>
 <e880d5cd-a958-164e-4ba9-dd2d0e3ad903@riseup.net>
 <20230626111745.49dbbf08@eldfell>
 <91aa3ffe-edb9-d85c-c62b-49f7bf73a0ae@riseup.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jJ0W.5+=RSh_tpTqjf3=ggJ";
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
Cc: hamohammed.sa@gmail.com, aleixpol@kde.org, andrealmeid@riseup.net,
 rodrigosiqueiramelo@gmail.com, xaver.hugl@gmail.com, mdaenzer@redhat.com,
 dri-devel@lists.freedesktop.org, victoria@system76.com, mwen@igalia.com,
 jadahl@redhat.com, uma.shankar@intel.com, sebastian.wick@redhat.com,
 Arthur Grillo <arthurgrillo@riseup.net>, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/jJ0W.5+=RSh_tpTqjf3=ggJ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Jun 2023 14:35:25 -0300
Maira Canal <mairacanal@riseup.net> wrote:

> Hi Pekka,
>=20
> On 6/26/23 05:17, Pekka Paalanen wrote:
> > On Sat, 24 Jun 2023 18:48:08 -0300
> > Maira Canal <mairacanal@riseup.net> wrote:
> >  =20
> >> Hi Arthur,
> >>
> >> Thanks for working on this feature for the VKMS!
> >>
> >> On 6/21/23 16:41, Arthur Grillo wrote: =20
> >>> Support a 1D gamma LUT with interpolation for each color channel on t=
he
> >>> VKMS driver. Add a check for the LUT length by creating
> >>> vkms_atomic_check().
> >>>
> >>> Tested with:
> >>> igt@kms_color@gamma
> >>> igt@kms_color@legacy-gamma
> >>> igt@kms_color@invalid-gamma-lut-sizes =20
> >>
> >> Could you also mention that this will make it possible to run the test
> >> igt@kms_plane@pixel-format?
> >>
> >> Also, you mentioned to me that the performance degraded with this new
> >> feature, but I wasn't able to see it while running the VKMS CI. I
> >> performed a couple of tests and I didn't see any significant performan=
ce
> >> issue.
> >>
> >> Could you please run a benchmark and share the results with us? This w=
ay
> >> we can atest that this new feature will not affect significantly the
> >> VKMS performance. It would be nice to have a small brief of this
> >> benchmark on the commit message as well.
> >>
> >> Attesting that there isn't a performance issue and adding those nits to
> >> the commit message, you can add my
> >>
> >> Reviewed-by: Ma=C3=ADra Canal <mairacanal@riseup.net>
> >>
> >> on the next version. =20
> >=20
> > Hi,
> >=20
> > perfomance testing is good indeed. As future work, could there be a
> > document describing how to test VKMS performance? =20
>=20
> I'll try to select a couple of more meaningful IGT tests to describe how
> to test the VKMS performance and also add a document to describe how to
> run this tests.
>=20
> Recently, I added a VKMS must-pass testlist to IGT. This testlist
> tries to assure that regressions will not be introduced into VKMS. But,
> I failed to introduce a documentation on the kernel side pointing to
> this new testlist... I'll also work on it.
>=20
> >=20
> > "I ran IGT@blah 100 times and it took xx seconds before and yy seconds
> > after" does not really give someone like me an idea of what was
> > actually measured. For example blending overhead increase could be
> > completely lost in opaque pixel copying noise if the test case has only
> > few pixels to blend, e.g. a cursor plane, not to mention the overhead
> > of launching an IGT test in the first place. =20
>=20
> About the IGT overhead, I don't know exactly how we could escape from
> it. Maybe writing KUnit tests to the VKMS's composition functions, such
> as blend(). Anyway, we would have the overhead of the KUnit framework.
> I mean, for whatever framework we choose, there'll be an overhead...
>=20
> Do you have any other ideas on how to test VKMS with less overhead?

Maybe put the repeat loop and time measurement inside the code of a few
chosen IGT tests?

So that it loops only the KMS programming and somehow ensures VKMS has
finished processing each update before doing the next cycle. I presume
VKMS does not have a timer-based refresh cycle that might add CPU idle
time? Writeback should be included in the measurement too, but inspecting
writeback results should not.

Once all that is in place, then each performance test needs to use
appropriate operations. E.g. if testing blending performance, use
almost full-screen planes.

What's the overhead of KUnit framework? Can you not do the same there,
put the repeat loop and time measurement inside the test to cover only
the interesting code?

Unit-testing the composition function performance might be ideal.

Depending on the type of test, if the CRTC mode and planes are big
enough, maybe there is no need to repeat even. But testing presumably
fast things like moving a cursor plane will likely need repeating in
order to produce stable numbers.


Thanks,
pq

>=20
> Best Regards,
> - Ma=C3=ADra
>=20
> >=20
> > Something that would guide new developers in running meaningful
> > benchmarks would be nice.
> >=20
> > Should e.g. IGT have explicit (VKMS) performance tests that need to be
> > run manually, since evaluation of the result is not feasible
> > automatically? Or a benchmark mode in correctness tests that would run
> > the identical operation N times and measure the time before checking
> > for correctness?
> >=20
> > The correctness verification in IGT tests, if done by image comparison
> > which they undoubtedly will need to be in the future, may dominate the
> > CPU run time measurements if included.
> >=20
> >=20
> > Thanks,
> > pq =20


--Sig_/jJ0W.5+=RSh_tpTqjf3=ggJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmSame8ACgkQI1/ltBGq
qqcU7g/8CUy8mBByAdflxHbAEJGg6pU7pXKP/zpSejdZuURajcda5cjJ9cdCf8Nb
gVv9GapyBP5EcE7wjvm5zEUduHmTG4PyfdnIds6kAVApY907TLIpNxIH/RKPv1Ne
yryZWnjqq5WWZtcRWsCIEHqWz57HGRYJWGIkOqfBAVxwy0haBvRywgFGrwKWxzFV
EMwNLRNe5eYbRXLqbDM7x0FCVJz/uczOvqL57qgUZrM02DnJTwO2iztFbiOFW+F/
r7DpgnpZZozXO5ivz9sV/j6qa2je4N6bi0K8SDKz3pmqs8NeGNEBB15LxtlWZ0hn
suFZc4BHpsW/YlfbKb0Nkb+cVvvvuXtAEgUe3W7HtjeWKtSCsaQB9AlSbThF0OVJ
ZqfH5NIwX/QVt4JGiFmWwjmUoG8053asdGhoZvwN0zLZDgmL+fzzg7xZ6OE2/ytU
zQwlOJU8qDkmJkF5m4VjQGJbW9YbXrKAyLW0KER13dkfgmdDK5GdI1qLuHaR7EYA
AkjhHB5n06piEmysSREpvIZYak/l9LLvFdmp5PS37FxlgKUE3CzxDSIDXOY+H4c0
f0Kt1mvm4GtgcIHYR/oPi6SEMuzp3fIk5hEj55JSr6GcX+SY2Cyj6J49PVwi/fbU
lxN1YDuKxhEhoj9D+Bo8Ezg28+7ab1V2rdYKlsgD7ld+ud6v3UA=
=zmlY
-----END PGP SIGNATURE-----

--Sig_/jJ0W.5+=RSh_tpTqjf3=ggJ--
