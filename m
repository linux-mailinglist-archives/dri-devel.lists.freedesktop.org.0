Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D26AA5F2ED3
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 12:32:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7797A10E2E4;
	Mon,  3 Oct 2022 10:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CEF210E24A;
 Mon,  3 Oct 2022 10:32:27 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id k10so15922610lfm.4;
 Mon, 03 Oct 2022 03:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date;
 bh=GDaIoGT7JIsoOWeW0LenQTO0aul26961IrOBNUNTmEE=;
 b=hiacyR2cfOlAQqt8WmjjJYbU9MsLy++EJ1pjpIZeGhehD4EMZUJ4ZoJtuW1NHLcWLC
 +RENyWxyN2ePpAlbzrKyI+VCmbcWbzlRVa7IiRNazh+CvpUS5a46c1JC5vVzISVRUFXb
 mKm9jWTDkavKvKlgbD/ItdxHiBZVRvungmkK4GmAahBKvzHQTwcIaNCwb8cg87WObg70
 PcyzwO+Gn1jlEGEXPgn5YmgjIl5+VuXMktGkb/W4yj/fIeiUQKhpF25PmvLjxmfUrQP5
 73WHEobKao7w6fe9dPnnrDC1GqCJT5dAsmrSqliLuSHMq/Ttn7hIT3X8OIELbG7Y1h5T
 SN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date;
 bh=GDaIoGT7JIsoOWeW0LenQTO0aul26961IrOBNUNTmEE=;
 b=if4bhts3tBbE8YTEnAWdp5k1uaKY1CGOGPdb15H2uYH19jLaUk0TT83i3l/yUWIeUw
 KfVsCFZ3IrXxyGDbDUz+JZIOPgW7YDZTiCsxFtm1MVynbTEjpgQkA72cvqzh4Uairf/q
 twCIWnAupcdCItY3bG60eFuC3FSVnKbaL532sEUM9HxlGOEsN6Jlx6vd1To+B/TbSs0Y
 qWjBgItJ1LmJYkZjX+VwGXPOxL1BB/naq3g2n4IXRkYtHJyfohZsGBJha+gaaUNyz14x
 wevxdHZvVijCm8xShvPcQAT5wzus2LNEqlAk1CKx9hmq5leJ0YllugWbD+j3IkmONyxT
 EUNw==
X-Gm-Message-State: ACrzQf2m2ZnKNnXgMwup5T0SFEKWoy0B7CayLj7XWbrkBi7LDjx7a7g8
 s9LZtFSSDHFbUOCRlBpE/X8=
X-Google-Smtp-Source: AMsMyM52BRFIuhBqhoICF1XSuRe8FtxZvtb7rPqWWuFpQm3UIgLxcyv10uv8EkfAhuNHRQKp2fPDag==
X-Received: by 2002:a05:6512:31d5:b0:498:f3dc:dd2 with SMTP id
 j21-20020a05651231d500b00498f3dc0dd2mr6633185lfe.101.1664793145146; 
 Mon, 03 Oct 2022 03:32:25 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 c18-20020a056512105200b00497ad8e6d07sm1401745lfb.222.2022.10.03.03.32.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 03:32:24 -0700 (PDT)
Date: Mon, 3 Oct 2022 13:32:22 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [RFC v2] drm/kms: control display brightness through
 drm_connector properties
Message-ID: <20221003133222.7f34862f@eldfell>
In-Reply-To: <44df4468-955b-0226-67e7-89467291d38f@redhat.com>
References: <b61d3eeb-6213-afac-2e70-7b9791c86d2e@redhat.com>
 <878rm3zuge.fsf@intel.com> <YzQojrDOGNhm4D8l@intel.com>
 <YzQseBFa5EvDUDSw@intel.com>
 <CA+hFU4xRV74r3Wbs-TTWmtAkEwdJaEb+1QXUZSh52LVRwfddeA@mail.gmail.com>
 <20220930103956.1c3df79e@eldfell>
 <CA+hFU4yR542C3Qo_8ggkXKF+OZs=Pt9awsQ7Q4bXGoiv+7-VyQ@mail.gmail.com>
 <YzcAwVC8tm1imNOL@intel.com> <20220930182652.4ea10013@eldfell>
 <CA+hFU4zat+-0eW_6BaY0pbHzKxBjPtnyV5M=X=9Y0Rn8JJe8Wg@mail.gmail.com>
 <44df4468-955b-0226-67e7-89467291d38f@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Y_N=Mebig8zOE0MefvI6YCr";
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Christoph Grenz <christophg+lkml@grenz-bonn.de>,
 Martin Roukala <martin.roukala@mupuf.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 Yusuf Khan <yusisamerican@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Y_N=Mebig8zOE0MefvI6YCr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 3 Oct 2022 11:44:56 +0200
Hans de Goede <hdegoede@redhat.com> wrote:

> One example mentioned here is that laptops with Intel integrated
> graphics may have some "perceived brightness" mapping table
> in their Video BIOS Tables (VBT) it would be interesting to use
> this and to export the curve coming from that to userspace as
> extra information (including allow userspace to write it).
> Since in this case (unlike many other cases) at least this
> curve is done in the kernel I guess we can then also add a boolean
> property to disable the curve (making it linear) in case that
> is helpful for HDR scenarios.

Hi Hans,

what if you would export that curve to userspace and not apply it in
the kernel, aside from the min-luminance=3D0 offset?

I'm not sure if that was your intention, I didn't see it clearly said.
Of course this can be only about curves that are supposed to be applied
by the OS and not applied in firmware or hardware. Call it "software
curve"?

Let userspace apply that curve if it happens to exist. Then, if we get
some other definition replacing that curve on some hardware, the kernel
could just expose the other thing as a new thing, and the old curve API
would not be interfering. Userspace that does not understand the new
thing (and the old curve property is not populated) would still be able
to control the brightness, just not in as pleasant way.

It would also make using a custom curve a completely userspace thing with
no need for the kernel to support overwriting it.


Thanks,
pq

--Sig_/Y_N=Mebig8zOE0MefvI6YCr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmM6ujYACgkQI1/ltBGq
qqeY5Q/9ELYd/Jr7PMSxivgZlgFDIRRSMfEuDbO7Q64hjorSDQ+dTgXCLFmiGuHR
ChABp2ulCoUEG48nuHWXEpG1qsR0bcp7HqwzaSzeZAQc8j/M7RBF6O8YnF1yLWU7
/b3Otpq7v0Yut8xy4J/wVQHJ2eDwARh/5l4leaxw4+D8NlObTing8oF+X4Byt9tq
Qz2wBiLtSQ5U7d5FhZaF+ukCLv/IFKTu0uQAnDYvTGaywOa7A4KW7GFmZSU5I36V
WA9nB+2ob2m4lmofhs+dJ6SwSsDCLwwRm10HCpwaTytuBHL3BzPqtJFmf/HlDOHX
CfPeu0ff1mcez9lN+MTAh6cyEYZvkWVtPl/Pxd2Z2pYYC09PyUDeniLBh0v1O9pA
RwQY05UqU9X04xxsl0wOKLsT9K1WtFF2s2R0GsweL5Em85fGTF+ctC45IklxT/xc
5PW2dnSeji0vlYfZOx4VPQatd9DSUb+ufPz4RBV0Xc9EPVUivrBOMIdbxESYqF/P
eOxsmQ9LD5EclRM3vmBsBF55z/Jtfa8Pb9DNTUrFU7GZwxX1mg43OVCDIfT536jI
V9Reik8HHF7BI9WQfTx3k+TiSfCiYPCWQq6JP0f6Krv521yHqtoK5/Tp+X0mXB7p
ieuuzkbi2Q2iXCCSB6Bfn0pbDKATfMEa8pLTFOqjMo/vhe1t/kE=
=3lTR
-----END PGP SIGNATURE-----

--Sig_/Y_N=Mebig8zOE0MefvI6YCr--
