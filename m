Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F2D5F09BB
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 13:15:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD91D10E28E;
	Fri, 30 Sep 2022 11:15:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF21010E28E
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 11:15:32 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id u24so5501588edb.11
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 04:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date;
 bh=82k8K7wBV8vdfpRd5YAh1WBisKofCQbvAdBOvCTOeYg=;
 b=k6To3IkWvpzrGIO31DDNcsB19TwpI+nEKYH/oogZCF9csK9LfvPsZoRuK4GenIXECN
 RcDAbi3s8LSl6IvP8F5X21UJoDLoYa07jn/AM8PihE99Bhzxw+bjyeFGhWoPYkiHMaai
 HGN6osyvyZjMHbf7rVj7TbVd5FrgUcxEY+Ap+iXyuEO2akTHdQgE7qkgak+l+j4ztSxq
 jfHn9CkcBhI29U7G90TIZAGFGqN5Z+phy1Vm5ucnna7bFYuWEEjMRi8c3gdc+sVuAIuC
 nwhEnwr/TaA6Euk+4r6i+YB4+6ORpOkYa5scf9Ckeq6sGDC2hfP/yBnmdoAs/pbjSFGU
 jmPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=82k8K7wBV8vdfpRd5YAh1WBisKofCQbvAdBOvCTOeYg=;
 b=tW1+hzVLtadcStpG5onmn/7aLPrB7SBZVcOzpGRr+yrXZEHOqswoGwM8asSxNFCbfU
 u1j3WuBZKtrifqsdJtQ1RnLXsYCoCUeUy5EeiuPRfWEZNU5ZwtYbscnyf+FO2OPWguLM
 Ph7C0MkR54vvgI+PxrgJ/IVhhgX5g1ekps6NgR1nUgfRiW9h8JMewVTHQEURcuFCG3fK
 kCqwStPuTYNV9GySvk8xcdum10o5KsMomV47wV4Zddntfh/UgG+yeNP4NFAWkl6i+Ck2
 yAm+e+yvt8mP/TPkGHh5BI7V/IbZPGKEZBLJH5n+bgWgS8j4pWY7EyrDYcElBmKWnU1A
 hjkQ==
X-Gm-Message-State: ACrzQf0BKChiecZNmI1Cz38Vt0WrIuFfm2aP06llrKH0F+jqhTcwlDm7
 pojHJuHLzZJGLTT4MN8dr98=
X-Google-Smtp-Source: AMsMyM5nowLwHGG9KEbijT5oLrhvfkp9xXs2YSmrwJSIMzrw6RC6lPOe1BnBcUTSEqvmYeE5dmekAA==
X-Received: by 2002:a05:6402:4511:b0:43b:a182:8a0a with SMTP id
 ez17-20020a056402451100b0043ba1828a0amr7360937edb.410.1664536530996; 
 Fri, 30 Sep 2022 04:15:30 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 kx2-20020a170907774200b00781b589a1afsm1015145ejc.159.2022.09.30.04.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 04:15:29 -0700 (PDT)
Date: Fri, 30 Sep 2022 13:15:27 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 4/4] arm64: dts: smaug: Add display panel node
Message-ID: <YzbPz8mL0Yo+vgSS@orome>
References: <20220929170502.1034040-1-diogo.ivo@tecnico.ulisboa.pt>
 <20220929170502.1034040-5-diogo.ivo@tecnico.ulisboa.pt>
 <23bc38b8-ed67-d243-9739-f07b7411be3a@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="scwoK3rA0vIPJtsc"
Content-Disposition: inline
In-Reply-To: <23bc38b8-ed67-d243-9739-f07b7411be3a@linaro.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
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
Cc: devicetree@vger.kernel.org, arnd@arndb.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-tegra@vger.kernel.org,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--scwoK3rA0vIPJtsc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2022 at 12:51:07PM +0200, Krzysztof Kozlowski wrote:
> On 29/09/2022 19:05, Diogo Ivo wrote:
> > The Google Pixel C has a JDI LPM102A188A display panel. Add a
> > DT node for it. Tested on Pixel C.
> >=20
> > Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> > ---
> >  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 72 +++++++++++++++++++
> >  1 file changed, 72 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64=
/boot/dts/nvidia/tegra210-smaug.dts
> > index 20d092812984..271ef70747f1 100644
> > --- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> > +++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> > @@ -31,6 +31,39 @@ memory {
> >  	};
> > =20
> >  	host1x@50000000 {
> > +		dc@54200000 {
> > +			status =3D "okay";
>=20
> You should override by labels, not by full path.

Why exactly is that? I've always stayed away from that (and asked others
not to do so, at least on Tegra) because I find it impossible to parse
for my human brain. Replicating the original full hierarchy makes it
much more obvious to me where the changes are happening than the
spaghetti-like mess that you get from overriding by label reference.

Thierry

--scwoK3rA0vIPJtsc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmM2z88ACgkQ3SOs138+
s6H+ng//c8m7BmaweBUTtWUqEtORNLhy+bkeDZrxOKM2MIIgs5jyVaClGqE89RXU
V25DekngE0duUOsjoROsEzrehI7pORpBk/Euq+nRactLk7p7K9l1prTKopFpY6u5
/VDVgHVu4qNUN9qqbkF4t3zNjmcIjUwmTVGKPJDIibNs3rYNrXkreZNpRwrg8XMt
vKAzAkG7TD5VDad2MqezR7qgvX61VBWMidQrzZZksykrcDn4D3TZpqmlsvuveo2X
ucgISinsdiKwoel3Tqq+uOjqTQlZbgp0bERhynexOSONDC16QXMvv1XXQ69GH+/W
3qRL3Y7gT0di9ETMU1P2yHzc5PyCkQDVfIPDnoBI2jEoy/a3hW1e2WO6b61wmeqX
qhq6/qyGiIRlJi+PIDf40pOYw2rvVuxTqleppqPEtFhe0oULyy5y4re20bXGRtfZ
2+flkNuoYpW2xjueeON1NE5+Y1VAJ/vsnR7VFeWi0i8ZuppQVkL4KfxWWFxxjPHw
myG116QyfrEf7q5YKDfY19PaGsj0IaGxdO6iyF+FE+FnbNG/L7CgarRyztlsXn85
/vX1Or55mRlhO4As6d7shRvvCp9Z3AFEDzv9CLAaUmnGby070iHtqjlAy3etRAct
EZrlv9nk8722huQdoVWWpCqYmKZxft6H197KV17H85Y/kEjWVgs=
=mKMG
-----END PGP SIGNATURE-----

--scwoK3rA0vIPJtsc--
