Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9854A4CA38
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 11:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9568A88924;
	Thu, 20 Jun 2019 09:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 668A888924
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 09:04:36 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id n9so2216012wru.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 02:04:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=frEcVN2zYwEjXXcdpOrh/A8lpjK7Wt/Osnn6cOQk8TI=;
 b=Pc5zeRoGekxg4I90+JetIMn9LHNCAscWzdNHxIcCJqf7CHXle1exAqtL6At7FG2ahk
 lFjWzw17GrwY5jFGIGCDqf4FO8oWt3A2aT031an2zuJs+6C9U1siPVi0MntrRJ2eBlqC
 osF+4kq5RHHZ+bdgxQ1ui1HOAOpIldDDl4ge9G6NUtNfEYf3CwUu5p/M+RrcB0LQ90at
 9y5UCqCgEawsLH1buXuLxbHQpagF/wdQw3Wp3oakH/zSUH1cQFI1gIloScRk/kqH8Ujk
 175f8P8m0G34x1bavy+EsFG/2ABCrhjHZVtIA8mqBpJPxLmJYCe0dD4CHc+Ag0SCjfYs
 A8hg==
X-Gm-Message-State: APjAAAXjLn6XBdblNw36me4gPthoF2WYQrMJUGSVBZp/Ujg1r9wfxB6b
 dv3snvlDwh6b6ocEgXSEbvc=
X-Google-Smtp-Source: APXvYqyxsynCQ2c9RC9uAK6hutNbPLw+1d7pYKO6/QteD5atlKmrp+VbDxgVsVkhM4eMyRx67ptWXQ==
X-Received: by 2002:adf:fb81:: with SMTP id a1mr6192035wrr.329.1561021475036; 
 Thu, 20 Jun 2019 02:04:35 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
 by smtp.gmail.com with ESMTPSA id i25sm9974743wrc.91.2019.06.20.02.04.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 20 Jun 2019 02:04:34 -0700 (PDT)
Date: Thu, 20 Jun 2019 11:04:33 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH 2/4] dt-bindings: display: Convert
 ampire,am-480272h3tmqw-t01h panel to DT schema
Message-ID: <20190620090433.GC26689@ulmo>
References: <20190619215156.27795-1-robh@kernel.org>
 <20190619215156.27795-2-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20190619215156.27795-2-robh@kernel.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=frEcVN2zYwEjXXcdpOrh/A8lpjK7Wt/Osnn6cOQk8TI=;
 b=MzM6ns8vtQLkNpw0Dn4I9cpgJVYEWNm8OtSBtlnD8FX9n575n8/Oeff0k2KkOlIhoY
 MLpRvANlojpKMQa0MjsCAupanapxcV4Z+33srJb+JpUrQPr6vCApYJkhb7NNyRe24EoG
 8by8vQ2fDNgh2EZOxuKUTYendMlvjCsv5zJMEQX122JLpqpyQmZf9x4drJ9McaeUtztk
 CZ6nkLV0lQ9WCkRJMjskMqlQTDG/M1Fz4u12+qGZnZaIAxcFjECy5GvxncqbAYHbZvsz
 vvxHvsW5O+ZDkT1hKQ82irQbm96C1ZCTnS3w06/SH+dW0bwGo3rs0N8+FCfgcdTn2Jsm
 T++A==
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
Content-Type: multipart/mixed; boundary="===============0590326022=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0590326022==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ncSAzJYg3Aa9+CRW"
Content-Disposition: inline


--ncSAzJYg3Aa9+CRW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2019 at 03:51:54PM -0600, Rob Herring wrote:
> Convert the ampire,am-480272h3tmqw-t01h panel binding to DT schema.
>=20
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../panel/ampire,am-480272h3tmqw-t01h.txt     | 26 ------------
>  .../panel/ampire,am-480272h3tmqw-t01h.yaml    | 41 +++++++++++++++++++
>  2 files changed, 41 insertions(+), 26 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/ampir=
e,am-480272h3tmqw-t01h.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/ampir=
e,am-480272h3tmqw-t01h.yaml

Acked-by: Thierry Reding <treding@nvidia.com>

--ncSAzJYg3Aa9+CRW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0LTCEACgkQ3SOs138+
s6GvOQ//XxDI3X8EUQGi0NRcbq7IOM9paPnzNrYo2a4zkZMJ5ujAQrRoZiW1J2FI
toUoyxQG9LTUGhOVrWccCwZEvmpvzJANlJRfgPL4Cpa49w75eywf7t4ZLnckaz4S
xUdHR2OV8cSl5WnrqEVBXnPIuafBv3DRdjw8VtI3EIOXE5LwvuQML1avCPbD71uB
SOFGia2wXlGoDfu4G/RW9LuEFoRbY9mZFIJxFFXLi9RvuGwP0/bPOsPbML+i+BJI
hV4hh3fvX3FiS/vl8DSAaUC+SFehXKJX8ch9Nw4VO8S++sE6FmR8PHUSiRIGN6Z1
KktrzUsJFs1oe4N0gRm+xZZHKzAGXS7VgOSp3Vjva49ZpTl3rJuShhMpMoWWikQB
WUjsONmVfQyOuzwMPSdHbRVbOK3XG40V9WB7gqv5R9ofoW7hNbhqdPAXnRtY3z1x
3eEukFHYOKl0mAzAYBHp+Zhro/94H50l+lrx12n6nwXoBB7VOix32BtWb6DHEhvr
ZKuGSbzhyZr7VPpyMt2xpSQr0c0y/NOCRGrnSZQ4pa06p3pEej04PyzxOmmv0dqm
/vE5lK4+78h9mDJrIByuWU1iv/3J4KiqBEb+v8i17+VE2hu48BbvdxpJ1D99y1Ys
MKW1PyO0J9gyj2P/dOwi60W/MfcyR+IDzJRyBJ19pbElya/zs4A=
=cdt8
-----END PGP SIGNATURE-----

--ncSAzJYg3Aa9+CRW--

--===============0590326022==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0590326022==--
