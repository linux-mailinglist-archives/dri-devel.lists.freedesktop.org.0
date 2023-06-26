Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E11373D97B
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 10:18:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E47810E091;
	Mon, 26 Jun 2023 08:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F58510E091
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 08:18:01 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f8689fbf59so4990491e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 01:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687767478; x=1690359478;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=fwUolKbtwRxdhWapBxuBd5VI3PQINyUuKcXlQZkguQc=;
 b=fcLezbTs8/ZlxXChSEN5OXtOAOu1mkyMM1IPoWVbUwUDTlD51j6fVrxnEnJK2gxV55
 bJm9Y1TuZJ8dUpvqu+89pjOMU8jQ8BfP32M9/1Wc9Cm8SVzskbqK1AESWdRRYV3LZuWb
 U6tnbbMRW0xlBJNfzUEfM05Zloav875QGXGEsxjucb3DKqZNY2Zpd0VBSfkCvr6k0erL
 VESSlsr21XXtSzkJfzITmeqIjYHwS5BvjL9r3n1boEKCo63bRWa2YjNgg+sCuhURYjIW
 l38lZ5GTCEFMFr6J/3EHGBPAdLnNVs6+CMucO0pYaO0y/05T7yS65p0h5S7VFW0J2poU
 HODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687767478; x=1690359478;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fwUolKbtwRxdhWapBxuBd5VI3PQINyUuKcXlQZkguQc=;
 b=BNMPaGfELdv67yxBvDgIGG0VObQ2fiNPE/+EYezV3qiFhwez85EnpCVFGoJN67tQ76
 Bw+Ph12yrUDrCcEt55+Ji3Uu9UHvfcGrxx9jiZR6pA4ol2a9vpMiQiUqck30Wq3C9WGu
 3OJryiC1sL0N8sSHVtLxS5X+envsRp9ou0FQzoEmXv7qfeV3aVAng2+bajm8/fql9hA2
 0GquSkWH8DIH3KSyROOYeKarYhqugqlj0hvGjGG08xQXRodrdt/Yi24H2AGbUusCovYr
 P/5ewi/GWoMDHdOG/ZnvpxxFIQRRXzomPd/zfhaR4dGDlrhUIK+Wh5+CWdhZIEKSJZiq
 /czQ==
X-Gm-Message-State: AC+VfDycRVGa4qxHTIHWW2WI5aMNFRaQ+RsnG1J+65cdRswgzZ82lxhC
 kfQp9CAGb8TiRyxWnE4ogZg=
X-Google-Smtp-Source: ACHHUZ4evgfUhyJcfvwDtkjf3BAvRrHx9BTncB9thzXfDUVW9PtuaLuq6oNHP80BGKlVzNRrK0r1fA==
X-Received: by 2002:a05:6512:31c9:b0:4f8:5e4e:52ad with SMTP id
 j9-20020a05651231c900b004f85e4e52admr8638577lfe.23.1687767477453; 
 Mon, 26 Jun 2023 01:17:57 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 l27-20020ac2555b000000b004fb75943ab3sm311293lfk.258.2023.06.26.01.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 01:17:57 -0700 (PDT)
Date: Mon, 26 Jun 2023 11:17:45 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Maira Canal <mairacanal@riseup.net>
Subject: Re: [PATCH v4] drm/vkms: Add support to 1D gamma LUT
Message-ID: <20230626111745.49dbbf08@eldfell>
In-Reply-To: <e880d5cd-a958-164e-4ba9-dd2d0e3ad903@riseup.net>
References: <20230621194121.184552-1-arthurgrillo@riseup.net>
 <e880d5cd-a958-164e-4ba9-dd2d0e3ad903@riseup.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ma/hM16i8ckbZQspRpbgvyO";
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

--Sig_/ma/hM16i8ckbZQspRpbgvyO
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 24 Jun 2023 18:48:08 -0300
Maira Canal <mairacanal@riseup.net> wrote:

> Hi Arthur,
>=20
> Thanks for working on this feature for the VKMS!
>=20
> On 6/21/23 16:41, Arthur Grillo wrote:
> > Support a 1D gamma LUT with interpolation for each color channel on the
> > VKMS driver. Add a check for the LUT length by creating
> > vkms_atomic_check().
> >=20
> > Tested with:
> > igt@kms_color@gamma
> > igt@kms_color@legacy-gamma
> > igt@kms_color@invalid-gamma-lut-sizes =20
>=20
> Could you also mention that this will make it possible to run the test=20
> igt@kms_plane@pixel-format?
>=20
> Also, you mentioned to me that the performance degraded with this new=20
> feature, but I wasn't able to see it while running the VKMS CI. I=20
> performed a couple of tests and I didn't see any significant performance=
=20
> issue.
>=20
> Could you please run a benchmark and share the results with us? This way=
=20
> we can atest that this new feature will not affect significantly the=20
> VKMS performance. It would be nice to have a small brief of this=20
> benchmark on the commit message as well.
>=20
> Attesting that there isn't a performance issue and adding those nits to=20
> the commit message, you can add my
>=20
> Reviewed-by: Ma=C3=ADra Canal <mairacanal@riseup.net>
>=20
> on the next version.

Hi,

perfomance testing is good indeed. As future work, could there be a
document describing how to test VKMS performance?

"I ran IGT@blah 100 times and it took xx seconds before and yy seconds
after" does not really give someone like me an idea of what was
actually measured. For example blending overhead increase could be
completely lost in opaque pixel copying noise if the test case has only
few pixels to blend, e.g. a cursor plane, not to mention the overhead
of launching an IGT test in the first place.

Something that would guide new developers in running meaningful
benchmarks would be nice.

Should e.g. IGT have explicit (VKMS) performance tests that need to be
run manually, since evaluation of the result is not feasible
automatically? Or a benchmark mode in correctness tests that would run
the identical operation N times and measure the time before checking
for correctness?

The correctness verification in IGT tests, if done by image comparison
which they undoubtedly will need to be in the future, may dominate the
CPU run time measurements if included.


Thanks,
pq

--Sig_/ma/hM16i8ckbZQspRpbgvyO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmSZSakACgkQI1/ltBGq
qqeYAA//c+YbiXoa70P9NMZsNi8EBevl5NEk9/MjLMj/eItsQMkUBAZ3jP1fLl0/
rp3tFpydASVPzIfvfOES7kMXrNB5QTaWwuY4tT9gb4qixONI5uqikBrcLokvdoNp
m8iNZYFuHt8CWAcFdhijDYwkFIM3agdAvc2vMfoFVSyrPF/8nMPu8WuNtCBTvctb
AjMYljlZ4T+j8WLXRxATbnJBA+FyJ7QZm6rroFipKS2NHUY955VK0+clAHGJ00QH
klLBAggL6xWXCs0PHtvE6GsfX+5YpTXl4Rk/o8Ds9l84dCEqjnWIugzp5xSLaPkh
enocpkHIxKoO4p0YI6ix3tvv9pI7ygRHd7Uud4gP8svdcVZ2pq9feFE+gt/nT8Nk
GIQXnQ1tSspDlITo7h3Qr1eqYx6usk2v576e522sNIB91cOka7NFzg47v0HXaU9Z
VcAYNYqUCpHsi2qdT0GUDOiX7VrmX7xVwW+IoFVcfBqFnp+qTplDNxSjSj8174p0
HRHphSpC86NPCLWpGiTMaVut6q6iM8NZeGg0RchSxWfu2F9PSbhYNtrw/toro7gC
M5quAAfCblF0q4JHK8OAorX4Yfiq0Dkcz3uQtkaZDjGZSllUSCsLTHFpxq+XhAwi
NwNhL2e5BWpBGfEFGv/2DGxTWRDuYk19m2fghl1kAorGRvjokUE=
=dUiv
-----END PGP SIGNATURE-----

--Sig_/ma/hM16i8ckbZQspRpbgvyO--
