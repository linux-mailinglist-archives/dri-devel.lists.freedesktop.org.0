Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 711E5114412
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 16:51:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 786666E145;
	Thu,  5 Dec 2019 15:51:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 549A36E145
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 15:51:17 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c9so4200357wrw.8
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2019 07:51:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Hqk732DASvKhf2WML2uIRMYkZ0MH2kXngVlW9J9XbT0=;
 b=Hd63SBcN+fRESGDXNTdbQKivARvmH8NsvHMRcGmM5xoDzLa9nx0bhEwcl2lWNpOCvq
 yQ0SF0NTn02oS9H+3z5weyflzexYJPzvfvuG0kFF6wZveI5qfFQHoExh806HiRmV3IFm
 OqEYX4Aj3YXJImKTtzIEcmZZ0YsiF7BRl+vXdD3N/xtDLUtsOf3w9ZtvP2t24j0GhVYI
 26Mn0G4D7K9fg0pusWrqVC7QTb5xkKgnfQROiwVX0jzWgHEHqFbtJJNbKpzqqPv4m2A/
 u2Hi0R+uvBXHriU04G9pg3aEYsfkRpNH1riMKM8aaYyaKb8uk/M4BIk4e2SyjfH2t3te
 ygUQ==
X-Gm-Message-State: APjAAAXNSXTNBGhXDY4WWR/OJl3TkJKE/zLnY0BOG11envrUun4N2NOu
 cH+GnB1NtCZFZkRKXUxUWhM=
X-Google-Smtp-Source: APXvYqyYNI/Iqvef/isLiabMHdyM4U4tRTb7QCIYp8t0Z+YThXI2bYmaodgFVZDFXv/v95Ow4HY7pg==
X-Received: by 2002:adf:a141:: with SMTP id r1mr11163450wrr.285.1575561075675; 
 Thu, 05 Dec 2019 07:51:15 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id g69sm264905wmg.13.2019.12.05.07.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2019 07:51:14 -0800 (PST)
Date: Thu, 5 Dec 2019 16:51:11 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] MAINTAINERS: Match on dma_buf|fence|resv anywhere
Message-ID: <20191205155111.GA1914185@ulmo>
References: <20191204215105.874074-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
In-Reply-To: <20191204215105.874074-1-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Hqk732DASvKhf2WML2uIRMYkZ0MH2kXngVlW9J9XbT0=;
 b=keeTt6l9p4RiViea21o3Ym+sVClyOVlIXERoaiM764Nw8ERrP10Nmwqk4vdoQlVKB7
 Jw4F6JoagBbIhllF5rL/ijCTWd4ysIjbvzYLdmPEDYBE+1pkmNIxM38cyuKJSsZEKKkC
 crDqNovqSUksWCbMShsQUuzOkL6zKGlxuRQf749DkrImBU6EJUfxp6uQtr+iQPIFj9dF
 THbMHKMRyaQ7NYBk0GUOyFikJW28bq0Eb8I+wpMTLelRSJz6QnNDdWkRZDI6lY32vaZI
 iubOvM6y1SJ3bUeQj0/C4rI9kkjkOBM1fPEgtIjHZhGxmfiISWiHw9QENWiIxx2My7iQ
 iAOg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0762971684=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0762971684==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline


--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 04, 2019 at 10:51:05PM +0100, Daniel Vetter wrote:
> I've spent a bit too much time reviewing all kinds of users all over
> the kernel for this buffer sharing infrastructure. And some of it is
> at least questionable.
>=20
> Make sure we at least see when this stuff flies by.
>=20
> Acked-by: Dave Airlie <airlied@gmail.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3pJ20ACgkQ3SOs138+
s6FuIw/+MiBzMpaE+4A0DS+8Maw2eXygpbNzHbXbT/CqB0Q7kcibeSIUV+xnhWPY
cnxtNxlZWtErROiGrXS2Roj5PYGftBPJVbCpxr4kMjsbVjtKq+iNbuPhfkChvihU
CEP5jHrHzmAQ4vRcVycHHZinm5ABoo+TuBeV7ZXJf1p6ZDDJXRFIBTpA/BxiBwOZ
ONIiq23FNnob0Zk/0r9XvQLyslRpK6FjYRdNO1V8l8OWrI0hQQqmx0kBpIppnxGE
swt90Ak5Vf3pSq2zrNfoVS7QAcuw0/2munEnOiA936SeiKLtEb8CX/j7GmDrXsOl
A2A0Jjhi3WWbxqq6UO1WYxyCSwmWY3WEtLzPd5F7+Henuztpygivh2d3xYCEO+jn
X0jE7Vnp4s2Tgv71Ack2aC/7HzX3WH7BtG//HCs6BF5TCKD9liA3nz+qMBI/ZPaP
6bQJWSJeQsJkEg6md3e2ZC14IOe6Y6UlKKkpwU8yDpY4xyY0IAjAepGh8gdmofVX
JT+O9UbdOmC4Sn5aIw/TdSz2U7mmwaY/+NcgbYlQSsZGtIqS8ASEIcXflC7M/lbG
lkog8ih1RRQ6Xcwhi6s+Tiyn4J6fUVnOaqwwvMxJYhXs7Z+s0KtgzlwGHwpq4ugL
MkKmiO6Ur5Xv5LfotkD39OY6HGy+Nw1XSbtrsPXPXLH70GvEjig=
=Spok
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--

--===============0762971684==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0762971684==--
