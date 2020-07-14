Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD9221E8FD
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:04:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 373E16E920;
	Tue, 14 Jul 2020 07:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492396E8CD
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 06:40:37 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id a24so1546100pfc.10
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 23:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3NcepYXJwFF3WgKgaGPyijwPZJiB3MMeaKr78lJ+A4I=;
 b=EI7r9ukbfTkCsk1sAtJ/9Iyf9J6ci86JDSYqWkVPoKBRyy4ynw3xQVbliSjQq6PSIZ
 Z+nodyMo4csU0EJ5ev4qjCaSb+QU8h0rOAoIiyO7RgufqmGbArf95eoEb3hxXA/tTRBJ
 oJOBsFZ/A+DMgHoHe8PmRRBRE7i11Ne6/qyzojdxs0xRNJxlGMSZJIfpXVVc/8ErDwCM
 Asa1BSOSTrGjaBPgyvPyxPcafjAm+84W5rScQzc4LtCV6fLUe4hEW8nuvxRwWqlCddC2
 uebANy49HDIZL2JpZGuaS4dDKJwbl4oSYa3zXH94i9NDkb/mcdeSt1WbtB0S49e99v+4
 fVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3NcepYXJwFF3WgKgaGPyijwPZJiB3MMeaKr78lJ+A4I=;
 b=hh1nBW5aRnURJ5o2z1dQYLn/NQIHZzRyhncDOzUkM4sforIzap8x656jnh5K8tOhRD
 zr1R3ZNAY2mjz50ikw8j1C6fii0dlDmzjQUv87/OfUxiVpJ9O8arjsAwRuyT5jGvPmQG
 3I5YlVQjHOs5K/d56GM2S+5c3j3IbNxxW4EqCxWLkc59XHtHrLPIUFp5UBL4L8fCgaKj
 ExGfWE7HOz2/i7zuuFF70RcS2ykrgZqJuE5Mcw4CfbT5ffJE0QeA9evBt6YF0GI9SZuA
 TCfcczKJxHvjkaKGCKAgNUxhvr76mZFdLeh5IOjZ4Pl334u6xEGTliuYM2kwLADW+tj5
 XNLw==
X-Gm-Message-State: AOAM53182qa/yXcrb5QO29x+CTDTMgf37/dxty6crARY4iLdSlctEi/U
 84NSULReMS5OpEMw5FqtLek=
X-Google-Smtp-Source: ABdhPJxM2m1GnRxucU0Lu/dwd6Np5WlUWjEua0RFKCYWsEy/diEB5ZqBER66PsnJLmPmOY/4C7rFqg==
X-Received: by 2002:a63:6c49:: with SMTP id h70mr2272535pgc.150.1594708836823; 
 Mon, 13 Jul 2020 23:40:36 -0700 (PDT)
Received: from blackclown ([103.88.82.220])
 by smtp.gmail.com with ESMTPSA id d12sm624036pfh.196.2020.07.13.23.40.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 Jul 2020 23:40:35 -0700 (PDT)
Date: Tue, 14 Jul 2020 12:10:22 +0530
From: Suraj Upadhyay <usuraj35@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, manishc@marvell.com,
 GR-Linux-NIC-Dev@marvell.com, gregkh@linuxfoundation.org
Subject: Re: [PATCH 4/6] staging: qlge: qlge_main: Simplify while statements.
Message-ID: <20200714064022.GA12651@blackclown>
References: <cover.1594642213.git.usuraj35@gmail.com>
 <1bb472c5595d832221fd142dddb68907feeeecbe.1594642213.git.usuraj35@gmail.com>
 <20200713141235.GT2549@kadam>
MIME-Version: 1.0
In-Reply-To: <20200713141235.GT2549@kadam>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Tue, 14 Jul 2020 07:02:44 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1396078589=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1396078589==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Content-Disposition: inline


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2020 at 05:12:35PM +0300, Dan Carpenter wrote:
> On Mon, Jul 13, 2020 at 05:50:14PM +0530, Suraj Upadhyay wrote:
> > Simplify while loops into more readable and simple for loops.
> >=20
>=20
> I don't think either is more clear that the other.  Walter Harms hates
> count down loops and he's not entirely wrong...
>=20
> regards,
> dan carpenter

Hi Dan,
	Thanks for your response.
Should I send a v2 of this patch or not ??
Also do you have any problems with the other two patches doing the same
thing in different files ??
I am all ears.

Thanks,

Suraj Upadhyay.


--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE7AbCa0kOsMJ4cx0j+gRsbIfe744FAl8NU0wACgkQ+gRsbIfe
746kFxAAtdVK+rUtDy2uROVKhtZQrW+MVwW43Z4Mi4n3pqVUkx5TwspN32mxphWg
B5AeptVoAP8AJdq7NdvcEXBoUNBhpD1g/u0hpXAJvpn835Ia0jFul8lIfBZp+3O3
SEQMOEI/Sn8QolbCwRiDLhoNWVbcZ9uwHUMZmtNKNq3n7ki6o5tIj7HnbMmLtOSV
4jD/Mk077tHDTmV3k1IXMm1PoJKP91HEkfGZFjLjGIN3TLik3x7ekzbWu0RWbzqO
2c3EMwwXhNIxuFTZis/aPFV6iuPFf3Gyn2+4eqr9m9ifvgw9SC7xCbhbF5aWk+bf
BYh6zgDVhHtQ2K7G/hawGujQZAoJsL04mZ7Uz25goRVLzJYMs7l5Qd+yR4/cfZlX
xsG5jPCIDcPLOQ3DlsFF/tyeR2MsVFvLaNNes0a1IIcZ+CGVlsoAFZGUskrdJIU3
bQZjumYRkhy8ML3wBocHT+sYuVV/RRdligxUROVbTWJwAFCnYDBUcTkCuk/tXk/C
hJdUBx3Xw3eyPI4PLnasPZeK4Eb6KwixKJennGDj/aRTrn/XCqXYq2OlYNx76V74
gNahmgCTf8wDoLlo0wQAuoMX1bs9dPgvvwTs3sfzmHpOshkvfZtiFJrdxITV9U7p
/ZtJiI573At8nmEuUarUsOjY0QAS0xtUejTke5whhjPUgyYemlw=
=YJV2
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--

--===============1396078589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1396078589==--
