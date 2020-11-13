Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E3A2B2270
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 18:30:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC9576E7D0;
	Fri, 13 Nov 2020 17:30:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 874E36E7D0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 17:30:50 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id k2so10817083wrx.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 09:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qAKJ7TwoChqeZBLMQoBMbmM9XX5w5Hp69XXsCD1sl0k=;
 b=m5Hrf+ya8uk/ZDLWjNk/Qb9WFvBqnX5SS2p4ZSdJO3UoeD+a31Lkx0t4NSqJTPDxsh
 vlz06gKzCqU7hhUemytFzmSGBQFpQXoSrgl41XnRMIp+oR/pUjvAhPWjaK+eCe+LHmkf
 iFBtXmn6Mga5H9oNIrX7awc/DzZGJGzxXUzGr1rtrS2ibqIJVAWQxLU7mLlegc3idX81
 IF0M9WqrHPBx4yU37iUtjLx0kkh/yLPANaX8QyFvogLnBGrWiB7AwA+zGas8nMBXT39J
 7FEK2w9mCrgXx6ApT4+SNqdvQUxLUEpdyn/PfKRgwCXhVopss0mWlSYMxxL4NqDMasDJ
 L46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qAKJ7TwoChqeZBLMQoBMbmM9XX5w5Hp69XXsCD1sl0k=;
 b=LReV5nrGBChMYL+5dOogeCKH6+DCgY2zHPBAdtXBa7pYdACbhFMtqvGbZq7Gk9Arba
 RRZ9/Q1D4Chh87CcF8X8ihUMPeG4o1yqNPo1ABw4Kw+jMyhs3RX/f3tLo6nQLzzcAji+
 DgjcZYJIXW7QS8o5ngCVjB8fTdea+snXlFOqJi7E5G10W7/YT4vFIzuLU4G6ci0tACyR
 T2c4xQ07ST0rvWF2rHshqUDHOWK8jzOpNNGSIACEpgA8exuMf44VbgN9KWX/lb+0wLeD
 6cq+585WvKFbLhY6NBtj0AnuDLOV1t0cFcEfjutN52WMbTuRFamxCY5pW+sJtnILZl2i
 jnSA==
X-Gm-Message-State: AOAM530rOtTp2d2ugle/robJtpZA/adSFYDzuWib0AtErwqzNTu7VS/X
 TdlRPwnsgGUuVmQkAVIZcFA=
X-Google-Smtp-Source: ABdhPJyly/fEY0RISPIA2Yzc/s7BqhLGrGcGrdhxk5p24fEi1AwvN6XH6teLHXDuHH4to1aR9BMk0w==
X-Received: by 2002:adf:f2d1:: with SMTP id d17mr4787992wrp.339.1605288645123; 
 Fri, 13 Nov 2020 09:30:45 -0800 (PST)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id g66sm10826225wmg.37.2020.11.13.09.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 09:30:44 -0800 (PST)
Date: Fri, 13 Nov 2020 18:30:42 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 11/30] drm/tegra: dc: Support OPP and SoC core voltage
 scaling
Message-ID: <20201113173042.GA1416567@ulmo>
References: <20201111115534.GA4847@sirena.org.uk>
 <dd26eb18-8ac4-22a6-29b0-dbbe5fa6075b@gmail.com>
 <20201112171600.GD4742@sirena.org.uk>
 <b4b06c1d-c9d4-43b2-c6eb-93f8cb6c677d@gmail.com>
 <20201112200123.GF4742@sirena.org.uk>
 <ce9e2d9f-917e-fb8a-7323-f3bf1a367e9d@gmail.com>
 <20201113142937.GB4828@sirena.org.uk>
 <7f066805-97d9-088f-e89d-a554fe478574@gmail.com>
 <20201113161550.GC4828@sirena.org.uk>
 <3beaa12b-4a50-a3b6-fc43-ebb5ce7a8db7@gmail.com>
MIME-Version: 1.0
In-Reply-To: <3beaa12b-4a50-a3b6-fc43-ebb5ce7a8db7@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
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
Cc: Peter Chen <Peter.Chen@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Adrian Hunter <adrian.hunter@intel.com>, devicetree@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 devel@driverdev.osuosl.org, linux-samsung-soc@vger.kernel.org,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Alan Stern <stern@rowland.harvard.edu>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-media@vger.kernel.org, linux-pwm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: multipart/mixed; boundary="===============0686219700=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0686219700==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Content-Disposition: inline


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2020 at 08:13:49PM +0300, Dmitry Osipenko wrote:
> 13.11.2020 19:15, Mark Brown =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Fri, Nov 13, 2020 at 06:55:27PM +0300, Dmitry Osipenko wrote:
> >> 13.11.2020 17:29, Mark Brown =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >=20
> >>> It's not clear if it matters - it's more a policy decision on the part
> >>> of the driver about what it thinks safe error handling is.  If it's n=
ot
> >=20
> >> If regulator_get() returns a dummy regulator, then this means that
> >> regulator isn't specified in a device-tree. But then the only way for a
> >> consumer driver to check whether regulator is dummy, is to check
> >> presence of the supply property in a device-tree.
> >=20
> > My point here is that the driver shouldn't be checking for a dummy
> > regulator, the driver should be checking the features that are provided
> > to it by the regulator and handling those.
>=20
> I understand yours point, but then we need dummy regulator to provide
> all the features, and currently it does the opposite.

But that's exactly Mark's point. Any regular regulator could be lacking
all of the features just as well. If the regulator supports a fixed
voltage, then it's not going to allow you to set a different one, etc.
The point is that the regulator consumer should then be written in a
way to deal with varying levels of features.

Thierry

--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+uwsAACgkQ3SOs138+
s6FEqg/7BuzFJ1sX7bRgYRZjoDzKXaUKc1UwVAiVGIXMfUo2HYHZuLvsM4WW6T7j
TvFreTHeHVITpR5EDUhi5MfJfqdg80+N4CJrSj/1Qh6iSpggU6hraOo5C4TgFTta
IrumC4rAUId2NhbOWKEeRgMjjaeree5rrZlRT1Taa/3cuuV5NILZHhNg7dR2Sogk
NdDnFVT7PN4CUU5TE35mt4HqImPBWxGJIgM5m4UDjlyBw3HpemIC3snQJm+gF8Wc
hZBfS8zmdXLPcmGvetFkD/wUyssczePaGr6x5ynLefvJpCzMXGUy5bQAjLyIVg7N
d4Qi7ig0eaQn1ghFvABLnsXuSm2Jiu2ZBbu88T3Tse6aor/N+7B1nVEoNFRUs33f
CyMCGN6vIcTjd5/b+8C5icKovj4vtPKQTR75cYLsmVGEAlrAiiccbZ3RiTfbfrK0
Dsidfl/whkep1xvaGM19f0TLzys0XlYgpwoPpbwbrKTVCz8/8pKSKYH0RJw60eC1
NON0z3gpB9ZY/s6ZIhnN6wqKu62BgCy4KB1CkwqWnnbHOP1CoNZvsmf9ad56cV7W
RQ1HJJYhQcK7rIcxfx/DBtONl3baZCLPcj6FjWjJulcfWNBN1+GzQRwvEnjQkR+K
35PZgsbe5o0zbdakiDFpwNUZep//lt5F3d3Sv7XOS5KdYHjnIbo=
=gUXE
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--

--===============0686219700==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0686219700==--
