Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8075A7BD
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jun 2019 01:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC4346E98C;
	Fri, 28 Jun 2019 23:47:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B706E98C
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 23:47:51 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 207so10574044wma.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 16:47:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WpQcKsFD0NKZ7fPE5iTV9T6ToE9rNRS6uT4dH8oCPLc=;
 b=ZGqQjRMj90pTq1dlKLiKquZ+CAs2UfJgpnKspFECqTEGO4dhBHFIno2W5t6uChtLlb
 XXgZEebOZd2L6HMIoWxzsZaFgHUOmygEqr6cdRcSjhFweUsXGqGwaooJ1qmmKqS4xcpJ
 hOwBi39rNW8Ta5wN9IALBwEIIhUKRSI4K8R0MitC2g8OlTYJfsB5BWbAw1I2hftviENc
 vOQjW295jbMm75Dt4sOMkhktryy6D04y6AINQqUIdPrDP6m+ClvklE60c0y/eXFGpeQX
 z0MvII3kPdQaA36M/IOOcYT1QxfzDq/Gs2rGvVmlN2ObOIi5TS+iTWlXUi+fxquMj0/Q
 bdNA==
X-Gm-Message-State: APjAAAVPB+1NdQYRDSJhE7OH4eQFMb1+lHjVKX8T/S/zUFE5H2w3266t
 J3kKCMryP+fzMUN/R/S2HJ4=
X-Google-Smtp-Source: APXvYqw6ZEMnpha5XCDbIvNtiOuep0jp4imvqTJh2Woy7CGxoh5T4N0DDfQGVf/ZJoBoO90+uDIqLg==
X-Received: by 2002:a7b:c313:: with SMTP id k19mr8328858wmj.2.1561765670272;
 Fri, 28 Jun 2019 16:47:50 -0700 (PDT)
Received: from localhost
 (p200300E41F2AB200021F3CFFFE37B91B.dip0.t-ipconnect.de.
 [2003:e4:1f2a:b200:21f:3cff:fe37:b91b])
 by smtp.gmail.com with ESMTPSA id 18sm2622459wmg.43.2019.06.28.16.47.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 16:47:48 -0700 (PDT)
Date: Sat, 29 Jun 2019 01:47:47 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 1/7] dt-bindings: Add panel-timing subnode to
 simple-panel
Message-ID: <20190628234747.GA1189@mithrandir>
References: <20190401171724.215780-1-dianders@chromium.org>
 <20190401171724.215780-2-dianders@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20190401171724.215780-2-dianders@chromium.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=WpQcKsFD0NKZ7fPE5iTV9T6ToE9rNRS6uT4dH8oCPLc=;
 b=TWvOtAdomHPpfqXEDjnGsUAE3rCGlYqAN8dwbsRG1MOzi5mIpkI8S96tuE/Kpa2n+B
 Jo1O0Xs8KFecgA39TZq8DETewatPBOCRCN3NeiriIwStN5Ndeby3p39OFU4WVMISyxU+
 LNEovz2X/nWrrvbC8zBvcDYzWt0Tfpjup3ksupEMAN6CG92A/piwxTfEzBw7bOGKgqgD
 pP4c1YFtF1XLhmrbm3hfbQWaXuxAG2JfA6rCx2iekseDJ0RyTKZTbEUfMEgouKmJg7cZ
 WvwWbI21l39jAFtFVdXg5Cs8/+zfbca73AR0vrdT+95M4lIGJIz3+ZkJn5/2067p6gMy
 GQuA==
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Jeffy Chen <jeffy.chen@rock-chips.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>,
 Enric =?utf-8?B?QmFsbGV0YsOy?= <enric.balletbo@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Ezequiel Garcia <ezequiel@collabora.com>,
 mka@chromium.org
Content-Type: multipart/mixed; boundary="===============0352765055=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0352765055==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 01, 2019 at 10:17:18AM -0700, Douglas Anderson wrote:
> From: Sean Paul <seanpaul@chromium.org>
>=20
> This patch adds a new subnode to simple-panel allowing us to override
> the typical timing expressed in the panel's display_timing.
>=20
> Changes in v2:
>  - Split out the binding into a new patch (Rob)
>  - display-timings is a new section (Rob)
>  - Use the full display-timings subnode instead of picking the timing
>    out (Rob/Thierry)
> Changes in v3:
>  - Go back to using the timing subnode directly, but rename to
>    panel-timing (Rob)
> Changes in v4:
>  - Simplify desc. for when override should be used (Thierry/Laurent)
>  - Removed Rob H review since it's been a year and wording changed
> Changes in v5:
>  - Removed bit about OS may ignore (Rob/Ezequiel)
>=20
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Jeffy Chen <jeffy.chen@rock-chips.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: St=C3=A9phane Marchesin <marcheu@chromium.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-rockchip@lists.infradead.org
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>=20
>  .../bindings/display/panel/simple-panel.txt   | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)

Sorry for taking so long to get back to this, sounds good to me:

Acked-by: Thierry Reding <thierry.reding@gmail.com>

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0Wpx0ACgkQ3SOs138+
s6FkAA//dq1vkl6yNj7/hlMzdjFe9maoEW7fwyt9MG/kUuV2+7K/iB2hj9M9DaKS
36rSIataHUoMbKAZprhPFKpa4Ux0KVuFcld+pU/GfvX1ux+omwfYZioEtkacrlFa
FVpTSbqsQm/A1a6jTK/44si7bTgnG3AiJ7Nz+7+VBEn0Fsf+Hua9GUbwMHCPz1lb
fRuJXIEGj6s9ZnCd/2YevxcrAscypxSeU5kAePyZF2i7bdeta2TR7655vYQkdqOb
nNFz+2R53UC5P4K9ekNZPue3QivyLjyN9M+OCmf+uSkdCK2RLF/lGKDtzcxtbMJF
FK4bsJRqF0icbG7bQucnIIIf5zgUFWuURWyzciqEa0TjnkqIy4Ugdw7iUY6MERlE
fn2u1wJAjWuztuyl9FSOgBs86zFvlnW79FkX7q4Db4BZSU1c7Vld08Cw0/scsuuW
fwJMzZSf/vSshfuJrXRo8wB+YsU7WgY0Y6v7IYx+5r3gvxKAGy02i/rjvPRb+e9c
0kvQKZqBYPxZDv3xkWZHLD4fZo5vkluDnxxTU/6omXTRCsqIAS26XZ8jlXE5fcHk
0hfy2HaCXhG7ckpQusum9uasjhcpQg3QKxul3oqM2iD1XvJIwcBwJq15pMvUm5w3
Qqm5DatatB3t0U+G84KTeIEzFIBNjeLY0kNjTOa0Ke9GRDyGoEU=
=lrYn
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--

--===============0352765055==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0352765055==--
