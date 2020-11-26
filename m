Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 515972C5B49
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 19:03:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE6CF6E9EF;
	Thu, 26 Nov 2020 18:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 154EA6E9D3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 18:03:00 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id i2so3059051wrs.4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 10:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KCIFTIKdiTLQ7RBGiS17aYYYkXPMsSyAUycnWynj4NU=;
 b=edsYOVIOCEWiXs+uDSXXPTClxHFbJTTe4UmFJ/B3uWEesOzFfGBUu4BvzNzppU8GCR
 T1R9M5o65kPn5GdH7x5t6CWstEtPuq1ZygYIlUU4ZOD7DMrcIX6oiyScXLH+Nm9P4RyY
 atx+Jm2FHT5+WkcuW6q5IPpbayL5sqbyiiOfX1p+F3YKBW+wpUorThBBphaCDAOfPTPM
 vLERAy6UuwPYFR/CeZYdsMgcCwilvw92+IhoanpIKJsHgwO9SuhDMjfAr4p6yFpv6rxq
 IPJpLuI9fIo2t4W6ObEr0gSHl9ofwdYs3nE3Hmuh+jzKFEvxwPt3JQLR+NdKWgK2dJgH
 uqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KCIFTIKdiTLQ7RBGiS17aYYYkXPMsSyAUycnWynj4NU=;
 b=IRr3Rya3BbyTSswKMsEfApTwfU2TJa7DhF8590Y67ZCq8TowaqPtM4GRVFnu7WzOUh
 /2M74YRUmbnZexPoVV65SjHloestPPrOq/Bd0/9qzny2BiIEDCY5oOp/9YRfD35dIb3C
 ssXCitaeTdmTYY0wZYpzP7x3NDVP/qxcCsCDhlfeGL3Cx9/juSJoPX+fR4iD2XFSho4J
 2Bi+nPzB9XXecP7+9VhHdDBgK9icqjDnipkqyUZJ8BtkZeSrIKC19Wmb/SH/qV0s68wU
 9QW2XqTEytZxLi+++Kn4YPlsTETQKWqi8sES6wXyWNrX0ugwlyWJ0NAga4ZVNDl/SOut
 ZVCg==
X-Gm-Message-State: AOAM5335nGYJMLeq11Eop/932N7b4aqV/v6+ICQvRkkXJ1l/285KJkyf
 A8G/uGZZBto0TbavrKSbeCs=
X-Google-Smtp-Source: ABdhPJx3NzSy7dWcWv10tXnuy+HO3uIq/rvc1ScDj1tBBUvgfWkRz4C0ZwV80uNZePoQIb134m4gvQ==
X-Received: by 2002:a5d:6783:: with SMTP id v3mr5332228wru.45.1606413778716;
 Thu, 26 Nov 2020 10:02:58 -0800 (PST)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id c190sm3666653wme.19.2020.11.26.10.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 10:02:57 -0800 (PST)
Date: Thu, 26 Nov 2020 19:02:55 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v7 17/47] dt-bindings: memory: tegra20: Add memory client
 IDs
Message-ID: <X7/tz8KwCBEgA6vi@ulmo>
References: <20201104164923.21238-1-digetx@gmail.com>
 <20201104164923.21238-18-digetx@gmail.com> <X7/lLaZJNp+Vfczk@ulmo>
 <20201126173922.GA7048@kozik-lap>
MIME-Version: 1.0
In-Reply-To: <20201126173922.GA7048@kozik-lap>
User-Agent: Mutt/2.0.2 (d9268908) (2020-11-20)
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
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <cyndis@kapsi.fi>, Nicolas Chauvet <kwizart@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, devicetree@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0083933268=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0083933268==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="abXpfoLbeV2BRxSZ"
Content-Disposition: inline


--abXpfoLbeV2BRxSZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2020 at 06:39:22PM +0100, Krzysztof Kozlowski wrote:
> On Thu, Nov 26, 2020 at 06:26:05PM +0100, Thierry Reding wrote:
> > On Wed, Nov 04, 2020 at 07:48:53PM +0300, Dmitry Osipenko wrote:
> > > Each memory client has unique hardware ID, add these IDs.
> > >=20
> > > Acked-by: Rob Herring <robh@kernel.org>
> > > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > > ---
> > >  include/dt-bindings/memory/tegra20-mc.h | 53 +++++++++++++++++++++++=
++
> > >  1 file changed, 53 insertions(+)
> >=20
> > Is there any chance you could drop these dt-bindings include patches
> > (17, 18 and 19) so that I can pick them up into the Tegra tree? The
> > device tree changes that I was going to pick up depend on this and
> > fail to build if applied as-is.
> >=20
> > I was looking at your linux-mem-ctrl tree and had initially thought I
> > could just pull in one of the branches to get these dependencies, but it
> > looks like the dt-bindings patches are on the for-v5.11/tegra-mc branch,
> > which the ARM SoC maintainers wouldn't like to see me pull in for a
> > dependency on device tree changes.
>=20
> Partially you answered here. :) Since you should not pull my branch into
> a DT branch, you also should not put these include/dt-bindings patches
> there.  SoC guys will complain about this as well.
>=20
> These patches are also needed for the driver, so if you take them, I
> would need them back in a pull request. SoC folks could spot it as well
> and point that such merge should not happen.
>=20
> > If this is all fixed at this point, I'll just have to push back the
> > device tree changes to v5.12, or perhaps see if the ARM SoC maintainers
> > are willing to take a late pull request that's based on v5.11-rc1.
>=20
> Yeah, that's a known problem. I asked about this Arnd and Olof in the
> past and got reply with two solutions:
> 1. Apply current version of patch without defines, just hard-coded
>    numbers. After merging to Linus, replace the numbers with defines.
>=20
> 2. Wait with DTS till dependencies reach Linus.

What I've done occasionally in the past was to put these kinds of
patches into a separate "dt-bindings" branch that I could use to resolve
dependencies from device tree files. The ARM SoC maintainers never had
any issues with that approach.

I guess this is a bit of a special case, because the DT includes are
ultimately really a part of the device tree, so mixing them both isn't
problematic.

Thierry

--abXpfoLbeV2BRxSZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+/7c8ACgkQ3SOs138+
s6GvWhAAhYKoK8A9tZy063DCPqqf86bEShf5PNCBAoCHKugibe2N4Zlj8bv5XFFz
l3Z6p7r0GpSIJM6gHoM+HRzRuN/E2NPE6SMnRCS8aIYoCD3BoTHTzJ7UcTHCc6Wf
4BnFEomaF7Fmm/Ad2TKacDsPu3SXNfeWNOGIzGzMExpege12kd2tOZ2dfZmINgC3
fMG3C0muiu045x1PARJQbjkWfB3ND3QtCAgru5MMw/gYwD7rosIKYHdftmYjNLOX
X0wc1FwVejm4yoOYsMWrNWTzs5tX8ptDrdgwCKz7hJRHGInoDrgGN/vxNMZhbtLW
SV/BiqsQEoEfYf51PCC77FPZe0F+pQlve4XG2sOKCmH4ULJKgzKfDumAUaCmCRbs
FfqpD42Ec88gwXxgJegvlg0NI2ox+t4sIDIPSSwpM+jugMnbrxR6H96jXUABhOXx
rGyOCrOkANmbFLORyCG5+WfG4CntJvXJnUWA9OzNk+UXen7vs55R/8oISeV+gegS
p1FLTXeXsMUCSSts7va7xg6Kcei15TaU1eA7G36SIU2f216pzogO4mFhccz+6YY6
PM7VZXibb/f6nyY9sz3wqAwk4RylS1D/JVMRer5vwxKl0ZBRsHCIfQCDX/0QUteb
PNv2UxrFhaHfUog8rr3/b1hp/1PiGGdXMTUvG6h+JA1xiAF3ct0=
=AuDL
-----END PGP SIGNATURE-----

--abXpfoLbeV2BRxSZ--

--===============0083933268==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0083933268==--
