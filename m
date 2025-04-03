Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E12A7A5B7
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 16:54:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A0C610EA00;
	Thu,  3 Apr 2025 14:54:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aMqQnAqG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7FF310EA00
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 14:53:59 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-30bd21f887aso7163691fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Apr 2025 07:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743692038; x=1744296838; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Oh8FUFZnWO912SrVNU0z7oV+vIAYgIiMRfGsFdHpPvo=;
 b=aMqQnAqG74L/gMqg/pWgOcD7Wi7WfH0oL7ygL8JUqp6o6SOvbAhHcZjL/jvXOXANYZ
 D2LSkSpgdXygXZm+Fb80hi1CIxPnOy+oEw4sSibh5ixVlTKSuIQyhWEuhqwA/8VKfLJ4
 wBouBqmbL/sy2GF5wwzD1S4U/w9yz/IHqYzkOyHoRoICQD3Xo5ZKAK8abcsdxlE1KxkH
 gvYvT1Qjuv9aC/3hN0TFuwEGECQujjOcNXd+nVne1sisiRbLlH1s6gGfcdxsDEj3+Wq8
 tattwkjejNFOdH3OER/zF4sdkbj5FxdAWT9SYpu0ZqqNTD1VG1eE+6Gbk1I2m3yn0RAj
 Wt4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743692038; x=1744296838;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oh8FUFZnWO912SrVNU0z7oV+vIAYgIiMRfGsFdHpPvo=;
 b=YeIPxQ2yNhU5MwnhViJxZVVoCPIUvI1HEcTMuv7gAX9zvy3A6FxowyvmjpxYCj6lfs
 nSAjt0zl+4PSRPF02PZ0KQy6JguLWap+mUCxsOdgGTUgWuX6ra6Rr49a1A9tRFIZel5q
 lOzKGz1PGEyC+bk+LjN3mDFYsE+LQbU+iUFOZyE/c91HndA5z8laSUu+Uz80Epwx3YjX
 rpVaTXd+lqxIsR6GsQhv/xLODwXRh1AVXRx4RJiIqCHcTqa0Uo01mlICL7YbirFLMFW4
 ZwSWI0pnH2Xf/9I8ArJcdg6wavqwszKeVmuhWDBEUCFfZ7FJHYb9ztGjh+m8Za/jEE/b
 ZCMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfdm9MH5Ngi6cCZ6VvgDCXRe3ejgEFSNVkEaWnEQSNBdjYYC41GEjB0hr6aQqviVBgHUQwv5uoeKg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWPrHaCtrddvjF6ZqVlwljJwLwa3gWht5cursuQewuWEAyCPjc
 VrRPKqucl3gdygy1dkPShnxu/nfbrCnHKIisns1n8qGeUL4OPK4f
X-Gm-Gg: ASbGncvZjRxlksE+j2hiqYfjm+NuxQQFfzs1bW8OOzulS+DNWgiUPNLkihENOA6oBAW
 cuYjmrx++EGzsuKfDyxGGT0nhrnHZJQorjV2Ut/YYfu9E9YcpIxR64uYJVGW6EZTj2M/fDTU+dH
 MJ1lUmDR/ztAZYTIOgoa7jkt8g+toqE7N3bWbjcnGebo03SpLoraI8mUP7nIpONdFajqUc8upWG
 S8Feo2cB1ctXfIMk/+2UIf4+08gwuW+/Q8gicN9G99UjvmD3w7UO2mXeVmi7MD4GYcERhWHzS4W
 BEGRhF1W3phn1DhU8a+589xzTlptItHrW5GNkxbz0bL685fwSykGYL40YHYwYSpZgC2pHpY7+P2
 MLI267fJdjaMxFdo1
X-Google-Smtp-Source: AGHT+IFr/ZQ8fQxwv6L85p0npeEqoBszB5XUE5CN/N6qEJuyXQpYUL11SZCknXJaO6nELi+XVOR9hQ==
X-Received: by 2002:a05:651c:2122:b0:30c:12b8:fb76 with SMTP id
 38308e7fff4ca-30de024ada2mr62681471fa.15.1743692037619; 
 Thu, 03 Apr 2025 07:53:57 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f0314b58esm2398931fa.52.2025.04.03.07.53.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Apr 2025 07:53:56 -0700 (PDT)
Date: Thu, 3 Apr 2025 16:53:55 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: st7571-i2c: Add Sitronix ST7571 panel
 bindings
Message-ID: <Z-6hAzDHm8zOOrrw@gmail.com>
References: <20250402-st7571-v1-0-351d6b9eeb4a@gmail.com>
 <20250402-st7571-v1-1-351d6b9eeb4a@gmail.com>
 <20250402-rare-slick-carp-dbcab9@krzk-bin>
 <Z-5jhrwTfu4WMk5n@gmail.com>
 <4dbdea1f-dc22-4c66-b253-c3fd625edc67@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BsHP1+c7dvF4bVP1"
Content-Disposition: inline
In-Reply-To: <4dbdea1f-dc22-4c66-b253-c3fd625edc67@kernel.org>
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


--BsHP1+c7dvF4bVP1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 03, 2025 at 04:28:22PM +0200, Krzysztof Kozlowski wrote:
> On 03/04/2025 12:31, Marcus Folkesson wrote:
> >>> +    i2c {
> >>> +        #address-cells =3D <1>;
> >>> +        #size-cells =3D <0>;
> >>> +
> >>> +        display@3f {
> >>
> >> Look how this is called in other bindings... The binding and example a=
re
> >> not following existing code. Why? Why doing something entirely
> >> different?
> >=20
> > Sorry, I'm not sure what you mean here.
> You added code entirely different than existing code. Why doing
> something entirely different? Open any other panel and look how it is
> called.

This is still unclear to me.

I assume you are referring to the display@3f?
I can see many other panels use display@<address>, e.g.
elgin,jg10309-01.yaml
and=20
sitronix,st7735r.yaml

Those are using address 0, but that is because they are SPI devices,
this is a I2C device and address 0 is not valid.=20
There are plenty of examples of I2C devices using the real addresses in the
node name.

Or do you want me to call it panel@3f ?
I can go with that if it is preferred.

>=20
> Best regards,
> Krzysztof

Best regards,
Marcus Folkesson

--BsHP1+c7dvF4bVP1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmfuoP4ACgkQiIBOb1ld
UjL+dBAA0pHFn/eRrynPDT9PQ/BqIumgyZwTUV/jSUAJJoZjfDmo28iG47/Xg6LM
D/eriitszDo6l9HvvTyESEqb3vPmi4xdVxN7RBErYdwFByyv4vQtquv9sNJNhiBP
41mDv0m2H2yksn4iV3XY68i+mGrnf2V/cUhe+VaGWmnOQtxUXHjUi0goSt6PDxYX
J3rMsJX1+U7E6Xh8U3JfAmeevOfzh1RjxdbksNN9gX2twMRPSyTMBPHJVUiPsEbr
lb4V0OGI5XqzIcVkg3TFkKZz2gmkZf6XvxY9gFpYm7OUFEOehJZZyD7ZAsvDL2Kq
DcxnJjmnsf9D8n5DlQGzVLTL8EcJpQPb5v578DrNXRKKyoV4m8oyW3ZSaOnhko65
7HokSAtp2QoXlHfpEkmDcAZruD4/r5aZvb3Hkcxm83nv5UP/PxKV2xBnXMSLqtMY
/9kI7YvrtifhhIoiWXXcy2SbY4+EazLnaVxgSN8NpCh7XI7MvLoHsq72wxndEz04
pyw3rD4crtw0hlHrhgexb2hhPkeLofuccNMad0httVt5mLVNFseRABE2sQ++j6Zo
R1IE0GB2GHx3bHwj9r9d15kzz5huQe09TLL4TVOPdYe3h77VsoXxqAmTvR0JpKuc
LAbzjJzXNVlxuyyS61j3c1JrOVK7auCp/qT7tzkHWT14BJEMNgA=
=rqvK
-----END PGP SIGNATURE-----

--BsHP1+c7dvF4bVP1--
