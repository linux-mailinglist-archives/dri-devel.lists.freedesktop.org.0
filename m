Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C683465A7
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 17:49:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9AEA6E0ED;
	Tue, 23 Mar 2021 16:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A65FB6E0ED
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 16:49:23 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id dm8so24266863edb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 09:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=iIst2vNUuR9o1HS8SwPrAaScoswSlCZZ25v5hTCN338=;
 b=KvK4BWg/abYVDAS6lhUQLj0Mh49P6oKeGYyJKr+u4XEMSGrdCFC3EFn390dqyiVWTY
 u17CuDCkEtxYsUULX7IvtJgLiPYleWNL37H+MOenDj6BwQBEvr2duevSaJJQd+fRy8AU
 HixlSDg+DHtRJvv3sK5MkdFjns9H5YwMJk5JrCY4N3NMuvEIlbj2NoTLJF6hPsOLiRq/
 0KUAi7Op7xy8ptVt/HCX36rE/YrhA656Zv4Lb5V3F+W3cwVQtb+Sb+t1b71HA8TqN3Fg
 Dcc6iqgojZxiLuaEQA0aS7Q5QELzoPP2RcPUFJNZdOokRffIq2bVxD+ZK5qOxHJW3L7g
 sqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iIst2vNUuR9o1HS8SwPrAaScoswSlCZZ25v5hTCN338=;
 b=cd+ZfSqW6XWmJMhv/SWITOTO4LClx9YTormiRrQvmjKP4l7EzL7gxtDNylz0kXIP0l
 FQMK6qvxZv8c+528/fgGp+wPuznsVQ81OWHu9Z8dufw4L5yY72CXd5SNE86HTqlAWU4l
 RwL41VJzhoXyL4JwjPd3jovuu2R1tUTp3BlZgz4v16JTdc68P7Q/Rs3vtGZ2a1NEEu2O
 D/s+5nA55L13zpkjBGlsBh7B6fkFx72gWOfvZPP1IOG9VWPog/GE/PprnaS6nOAxIo52
 oEEjY5ZREaDJ2z0IAD2vJrblxxrHfvwXwk1wtN7HIIlBsyGyS6pqt/RvoRKOXPxoGDKi
 rIwQ==
X-Gm-Message-State: AOAM530hWtlmOYpDoQQ1BvCGTIuxV9YuyiS044MHtebMClLRXmB7sH8H
 pEiBzz/fcpRmPznbwIqcRq5bpYRJiFQ=
X-Google-Smtp-Source: ABdhPJyAroDMsy9lYDJuW292LQrc5eHTY4Tj7ifSEn1o8ZA2ls+EEiXsQJkuM8GhNfbd9J1GLnOo8w==
X-Received: by 2002:a05:6402:1c98:: with SMTP id
 cy24mr5494989edb.296.1616518162361; 
 Tue, 23 Mar 2021 09:49:22 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id u59sm13706511edc.73.2021.03.23.09.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 09:49:21 -0700 (PDT)
Date: Tue, 23 Mar 2021 17:49:42 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 1/9] drm/fourcc: Add macro to check for the modifier vendor
Message-ID: <YFocJrHaB3N1Gudt@orome.fritz.box>
References: <20210323155437.513497-1-thierry.reding@gmail.com>
 <20210323155437.513497-2-thierry.reding@gmail.com>
 <cEyRtluqBdulJxqLBLGpza4_rFKfTtmboo04l2mUFzjOcxGcILAbxPsLVmqQrMrAC0--VT7V_9rgVtvgbW3jLejGf-V8gpnMO10QHK9GtSQ=@emersion.fr>
MIME-Version: 1.0
In-Reply-To: <cEyRtluqBdulJxqLBLGpza4_rFKfTtmboo04l2mUFzjOcxGcILAbxPsLVmqQrMrAC0--VT7V_9rgVtvgbW3jLejGf-V8gpnMO10QHK9GtSQ=@emersion.fr>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
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
Cc: David Airlie <airlied@linux.ie>, linux-tegra@vger.kernel.org,
 James Jones <jajones@nvidia.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0977695202=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0977695202==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EnrfyH8bJj4R/c8p"
Content-Disposition: inline


--EnrfyH8bJj4R/c8p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 04:04:35PM +0000, Simon Ser wrote:
> Can we instead have a macro/function to get the vendor? This would be
> useful elsewhere as well, see drmGetFormatModifierVendor in a recent-ish
> libdrm patch [1].
>=20
> [1]: https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/108/diffs#9=
1ecb12b27c7154b26013bb95e17a5cc24ea443e_947_947

Either way would work. I chose this because it ends up being much
shorter than extracting the vendor and comparing to the constant.

Maybe we should just add both?

Thierry

--EnrfyH8bJj4R/c8p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBaHCUACgkQ3SOs138+
s6G/LhAAj35SCy/UYCTDvzLBrqVrHxBeQuXbVxVmSD5jF7SB8/uaUBryWKp1N8bO
je+9gjkk+UHaeEcbCn6ChZWOGKEP0+5Hwr9nj6tDB+d1M5xkXFYmuyzZgGaoJYTU
+GWX4BnmePGH6IFWQpGNi6WbJXdRp4hZa46cgvCK3JhDrju+1ypUy9bXpu+oZOxW
TzmeHUUUoNpCAHK8txuLCwcTYqxCpHcosGMQHVOfPKp8Els9hK/cQAQCW7fSrfBU
097/oB3XudGZnpzjlQtIJ2DP9hEzMS+Fyg/fxoc60RqnluxntwF9mZd3uZJB+xzJ
UnNjwxOyXWCF1LsJwmLKWJLcPEC/h3Bz+MlGxj5C7M+8k55+luOQdy80JthPDU1b
hj2OYsiNDFzBAc7lvk9HKMY7IMbIfWJzrd1/gipXDthT09En+g4P3kD66tzt1CBi
aKOHEmp+lUt9Yt/cL1mE3QZggECjlQ3JshNHMIofiPGeD63F+xdF0dh/yKQNGvaz
tsWCKlVA8ROIoCbm4t2ZUR6W81KmFv9eUDAPjeVLNnuwnJedgdCncApLvRNzGo/g
DvwsGigR76XawoQNTkDLi/lr7LejGWtb13k0ATm0an4cbXgp1YCTEbfEKUhmjNqW
2miDOv6s5gYDRtm41IMBmJrFVhRf5/e8itlCNVIEQihXaAvsz48=
=9b/f
-----END PGP SIGNATURE-----

--EnrfyH8bJj4R/c8p--

--===============0977695202==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0977695202==--
