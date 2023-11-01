Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D057DDADB
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 03:11:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC0310E0B5;
	Wed,  1 Nov 2023 02:11:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D872110E0B5
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 02:11:31 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-5bcec7a304bso721689a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 19:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698804691; x=1699409491; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PkwyaILwsX+VKZTDFEUltkIi2zr5qDA6qHFMO6lWAZw=;
 b=WVnMDQwGn7rfWrWy7IPQSxazVVooHChF7LlRi+Q2JV+yfAJTIUYQsC1iWsn/Rd4p5S
 Mv8odOuLeE8TGBE9VkEwgpGu3YQ0Iu9i3n/BCVUOT2k7xZo/uf5x17SvhotmMsEuVC8B
 iEDYD9g/XZ82A4u90H8QNEHPszi9JrOnLSohsc25xsXZ/vT+mdKP2L0YWyJSSoU9nD4W
 4PfJd2xw2W9mPD38XxoN0osQRIsX434Vvx8a0I5OzUHjmRkjOw3f4QyWRrEe2ZEj39J6
 CMLlACuwQfwkibzLaoyY7+eIHUc32sbVIPGk7p3FUPLJ/ljGLUagwkTYA1obW92feryl
 IdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698804691; x=1699409491;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PkwyaILwsX+VKZTDFEUltkIi2zr5qDA6qHFMO6lWAZw=;
 b=I0xFkbczGZxazv4g1DRaBwTrVmK0qWza/Vb3olt6SYezP6FnntMnm825lKb9OAdFXP
 b9dGfiRp/+UqDSZ6tGE3QtfIDqsJ09qvI4NLZmyw1J1ZgR/xyHZL0ToEIewn3tzARmJh
 xTxAUQA0vzY0hyXv7I4CE3cFcpK0PJwmd+tj/KyFKRV9zPV+yeCOcAUOxGNypmKJ2SJf
 iTZugDgZvN8MfG1amE9gqLM989Tyr6nsn1RPc9i1SbOyBfJX+hiA5x8278X963Heam82
 H9A1qRx78QWqk+B+ysyV4HqH565REZ5Blwdg+xnJMvpjLvK42m+g0M2SbMikoZtB4Vzs
 drSw==
X-Gm-Message-State: AOJu0YwMuIpGLvb8cyFdnfp5jZVEderJlHAfig9gGJeznfPYSsxXyK8S
 du5kgMBieCnqAv0Ic5D4O7s=
X-Google-Smtp-Source: AGHT+IED9CeFPa2E+EjUNPDryeGPow3qOhz0APJeFNDxLSOX0Ztnwop3hA9Qhu4rcOE+I85CHm8FpQ==
X-Received: by 2002:a05:6a20:2d2c:b0:17a:f37e:ddc2 with SMTP id
 g44-20020a056a202d2c00b0017af37eddc2mr16632463pzl.47.1698804691275; 
 Tue, 31 Oct 2023 19:11:31 -0700 (PDT)
Received: from debian.me ([103.131.18.64]) by smtp.gmail.com with ESMTPSA id
 e9-20020a170902d38900b001a80ad9c599sm204872pld.294.2023.10.31.19.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 19:11:30 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id 589A5819CFCE; Wed,  1 Nov 2023 09:10:56 +0700 (WIB)
Date: Wed, 1 Nov 2023 09:10:39 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Helen Koike <helen.koike@collabora.com>,
 Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH Resend] Fix line Length
Message-ID: <ZUGzn-xcoymIfoQA@debian.me>
References: <20231029144312.5895-1-dorine.a.tipo@gmail.com>
 <alpine.DEB.2.22.394.2310291610030.3136@hadrien>
 <ZT7v39jG4WTxPYjm@debian.me>
 <alpine.DEB.2.22.394.2310300712310.3533@hadrien>
 <3f1fdfa2-e30b-42c6-b290-bb02283b3589@gmail.com>
 <318c568f-c813-4d16-b577-28f37cde92c7@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dooGvATdJTR1HNc3"
Content-Disposition: inline
In-Reply-To: <318c568f-c813-4d16-b577-28f37cde92c7@collabora.com>
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
Cc: Daniel Stone <daniels@collabora.com>,
 Linux Outreachy <outreachy@lists.linux.dev>,
 Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Nick Terrell <terrelln@fb.com>, Dorine Tipo <dorine.a.tipo@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--dooGvATdJTR1HNc3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 31, 2023 at 03:36:30PM -0300, Helen Koike wrote:
>=20
>=20
> On 30/10/2023 08:36, Bagas Sanjaya wrote:
> > On 30/10/2023 13:12, Julia Lawall wrote:
> > >=20
> > >=20
> > > On Mon, 30 Oct 2023, Bagas Sanjaya wrote:
> > >=20
> > > > Hi Julia,
> > > >=20
> > > > The submitter touched one of CI scripts for the DRM subsystem. To t=
est
> > > > this patch, there must be a way to run these scripts locally (which
> > > > may requires non-trivial setup).
>=20
> Instructions to test it is on the docs:
>=20
> https://docs.kernel.org/gpu/automated_testing.html?highlight=3Ddrm+ci#how=
-to-enable-automated-testing-on-your-tree

Thanks for the pointer!

--=20
An old man doll... just what I always wanted! - Clara

--dooGvATdJTR1HNc3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZUGzYQAKCRD2uYlJVVFO
o3Z4AQDaWdOvXjwiZ0Oc4b0iaHgCHKe7XwNerDY/r1vhieslYAEAquSuTvqW3nD4
fc8XKmmvpMJ4l+G56RFFk2paFOoc6QA=
=+axy
-----END PGP SIGNATURE-----

--dooGvATdJTR1HNc3--
