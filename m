Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 928914CA3C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 11:06:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 153CD6E55C;
	Thu, 20 Jun 2019 09:06:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5C66E55C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 09:06:12 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id k11so2215272wrl.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 02:06:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JLAB3Vbq6atzRDwMPLEQ9hXckVRJCFIUBFgi18+pmmQ=;
 b=lIP8ty9X0pmPRNLp6b/fEK1/zGmSzkxnmszkU4DePHBLDH/JJTmE7gj8dw8yepdcWE
 HlfSWGImUAZXiYT7ZOF6xagdJt6JseOVgSIa2pPBvPb1UVfq4Z7R9ZjTGMlwnZBinYH/
 2Yyf6MCgksS7iYgOOUOvD1NkQiolSTXpHEQbS0gFSLlg4PZjmgsDEweWT1vXtXzRlavx
 oyEx7Fm5gmFnm18fAdQoPmEESb36rkD04VoE2PEecINfTYGr5Ij6m+lkeefVShZByzak
 9icPK2oz1GeYO/XemrKx2wi8Pdl5Jgv09YJaP8TNaYT0F8JM/ulEnPDNNdOm2D2G/Z3t
 x2Lw==
X-Gm-Message-State: APjAAAWRYEqeBhBpn8R5faziPz7ZB5z1p2aZB7R2q16gpExxZ5SUSUNk
 W8M0c1ie/+POkGPa5D56pHp65Ip9Bs0=
X-Google-Smtp-Source: APXvYqyIO+/N7WsyvX2722wWyUHnjXfpbHpEtG5nUFeC1Q2vNQjoqACgOF0Y5zw07hPT30TFVLPPlw==
X-Received: by 2002:a05:6000:11c2:: with SMTP id
 i2mr10352007wrx.199.1561021571455; 
 Thu, 20 Jun 2019 02:06:11 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
 by smtp.gmail.com with ESMTPSA id j132sm4282541wmj.21.2019.06.20.02.06.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 20 Jun 2019 02:06:10 -0700 (PDT)
Date: Thu, 20 Jun 2019 11:06:09 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH 3/4] dt-bindings: display: Convert panel-lvds to DT
 schema
Message-ID: <20190620090609.GD26689@ulmo>
References: <20190619215156.27795-1-robh@kernel.org>
 <20190619215156.27795-3-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20190619215156.27795-3-robh@kernel.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=JLAB3Vbq6atzRDwMPLEQ9hXckVRJCFIUBFgi18+pmmQ=;
 b=gcC/P9eBiF17fUxfWGvp3H1k0IInMVdsQd5Gga1rvT6Mml9dJpAWVEfolEbctrwa00
 rZ/W1R0BV0KhM1IrIfgLroAv+CYj3c+Bfhvn7srrDbzVa1DPleQaC8jwziiBHJgbrCqL
 pEDVv5M1WccfSoL982XseDShKETpKkY6s+B3wXxktgUMxWHs7gz/88TckOxAvav47Xt8
 WLsMke/32WHXBg9d05+QxugtCZaJ+eR3hSi+HEMS3NW4uMOPazc8jNik/BUe2D56kkRc
 Ww1Weq9wz9UnM9/yeRV6Ljvz96ysbQJTugPWAsUxpbLySCApleZRgEN8X1bwV0eIEV10
 eG5Q==
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
Cc: devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============0266225881=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0266225881==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Hf61M2y+wYpnELGG"
Content-Disposition: inline


--Hf61M2y+wYpnELGG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2019 at 03:51:55PM -0600, Rob Herring wrote:
> Convert the panel-lvds binding to use DT schema. The panel-lvds schema
> inherits from the panel-common.yaml schema and specific LVDS panel
> bindings should inherit from this schema.
>=20
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/display/panel/panel-lvds.txt     | 121 ------------------
>  .../bindings/display/panel/panel-lvds.yaml    | 107 ++++++++++++++++
>  2 files changed, 107 insertions(+), 121 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/panel=
-lvds.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel=
-lvds.yaml

Similar to my comments on panel-common.yaml, perhaps make this just
lvds.yaml? Otherwise:

Acked-by: Thierry Reding <treding@nvidia.com>

--Hf61M2y+wYpnELGG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0LTIEACgkQ3SOs138+
s6FLsw/+NC/6Khpjg6ysa3WInhNhqMUsQWEt+rIBtVK3wuiFuV3Fmhbj5eTi7pip
azMl6odp9t4TnQbzpAbqOwA73Xsp1KWdjGawLxeZTXcdckPrMMzTbiCbbLkw3nuA
26f+cj53Kp5vmuJlxOllFWS8YB3tPy0rV6+7DDBKqONdIne14CUu118dFgJMOcxq
ATqXCBQGd9SJE0XRkVwY5uixnKjeuy2SMr1JU+Ear6UQqF2hVc9Lrkxs4Dd4YbMc
GqcdrUuaSvUifujZ2dr1aZt6WleALu0yHfUnd/cuo3JOjBhsSJbrCg6EPMFdlsdh
QjiWZCVsAnaO6NMLsLrxzTkDOsZnBW8T38bh+jIPEXgCGsKTNIOKaXtXPrKqPkPK
5hy95N1u5UgvPNUw4BPVUVzjcuHgTuevyHrfnvR7cYa1BspbdVMhvwjifPTCR5Qa
pSAezwB/wVTLpLEeq3wySXAHj3VACaGtAfuunZ1i7V2x0hMe4W2wYj3SGWMEAUo6
srlTiiDZYxrZk5+ot2pRzlFIH4rC+iTTOKtnhnQzyeQA1kgqeouvHuHjJlBP2ZQD
mul4nf2BMRhopoccrOLOw2ElpoyVQebipi3xkkapvrBY+0Y+c2N3zt5v4QLmuBvN
4n9yVm1sJd8FTC3iRG9UnBCN8hxc3MnRlZd3nr1xDze2ujRNFUQ=
=Cr2T
-----END PGP SIGNATURE-----

--Hf61M2y+wYpnELGG--

--===============0266225881==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0266225881==--
