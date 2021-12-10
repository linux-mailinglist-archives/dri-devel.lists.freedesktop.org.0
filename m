Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F5546FD18
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 09:56:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5CDD10E1C6;
	Fri, 10 Dec 2021 08:56:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0894410E288
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 08:56:35 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id o29so6276976wms.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 00:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ugWZHzEIl/ed3UDm2nkNMQGNSpbu5KKxXnSYP4z8tmE=;
 b=V1Hc554AnCsotFmE/SYmLUYY13GxEa0a/+6yg6iYQxXVQooWp4UIl1EXOR/ohWtaoh
 SSDSNJHt4bNUl/dJwy0wej4Ep8UARUR21gHDlk+x663IHiyy4a/NgKCRovFDYw/X0GqK
 B0GvmtraFjTWvvl8t8r0RLTXTsXkqXtW8LJlkQ+OKgUTPFT8X4K/hmLXYq6iNBIRHRDE
 5fEAb3Dz3vp1/xo0UjoVyow4VJpvk8nnqABG1vfT3GWt/VPgf3y2fDFVg0N08aw/nD4M
 9oCdjVfig+4ewNy8Vv94fP+lE9ZFAlF1cWVDMK/Bm2xCoBxzeXAVuJWqn4ALjpPKRpg0
 0oAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ugWZHzEIl/ed3UDm2nkNMQGNSpbu5KKxXnSYP4z8tmE=;
 b=RityU82qmrxmQldLWOO5ExZBgyr/UzqZUYhVjRxuwXxdcc/aA5PRsAWA/TJzYuxbrl
 ikH9Kys+or7n/a/sFAWojvNHgaV75lfBPz7vueEzhiSoiEzFOmOBEDv2QcN2T8KXpKoF
 a9X/noIM7mptEmlkSmzN21aXlpP+8G8wLsu0DRgeGpRTF1bPCPOCFqBUmLYTdAEhmjVi
 72BcvAboSIpVecXJIx/Y8TFi6FpI6AI1j06o1wr/ga5YPWmLlQNpzw73QYWZ4wp0RdMm
 SRtOnFz8C/jdlbKJskkfth7rfVlSgfPm9d+FK/1AKXQ9NY8RPPWvh6G2Ucx0TIezMJch
 crLA==
X-Gm-Message-State: AOAM530XY9zWW8bv9zIQVOCmjKtHVi4MorIMxQXQ0zuRuQ4HQ62CRMpN
 /RYogNo/z2WyyG8xNg/vKWw=
X-Google-Smtp-Source: ABdhPJzpGB9V66upS/EkyZnBy/vCflZB/b4r7xftEE8qItQGNebjwjNFs3haPcemiq8JZjpXgnqFTw==
X-Received: by 2002:a05:600c:3489:: with SMTP id
 a9mr14966701wmq.53.1639126593509; 
 Fri, 10 Dec 2021 00:56:33 -0800 (PST)
Received: from orome ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id w17sm2333809wmc.14.2021.12.10.00.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 00:56:32 -0800 (PST)
Date: Fri, 10 Dec 2021 09:56:28 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 0/2] Add SMBus features to Tegra I2C
Message-ID: <YbMWPGMcHEQXGkHf@orome>
References: <1639062321-18840-1-git-send-email-akhilrajeev@nvidia.com>
 <e3deea6a-3854-e58c-0d27-602413f2a496@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2IhQJxqBxhd1xrh2"
Content-Disposition: inline
In-Reply-To: <e3deea6a-3854-e58c-0d27-602413f2a496@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
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
Cc: devicetree@vger.kernel.org, Akhil R <akhilrajeev@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jonathanh@nvidia.com, linaro-mm-sig@lists.linaro.org, robh+dt@kernel.org,
 andy.shevchenko@gmail.com, ldewangan@nvidia.com, linux-i2c@vger.kernel.org,
 linux-tegra@vger.kernel.org, christian.koenig@amd.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--2IhQJxqBxhd1xrh2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 09, 2021 at 07:04:30PM +0300, Dmitry Osipenko wrote:
> 09.12.2021 18:05, Akhil R =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Add support for SMBus Alert and SMBus block read functions to
> > i2c-tegra driver
> >=20
> > Akhil R (2):
> >   dt-bindings: i2c: tegra: Add SMBus feature properties
> >   i2c: tegra: Add SMBus block read and SMBus alert functions
> >=20
> >  .../devicetree/bindings/i2c/nvidia,tegra20-i2c.txt |  4 ++
> >  drivers/i2c/busses/i2c-tegra.c                     | 54 ++++++++++++++=
+++++++-
> >  2 files changed, 57 insertions(+), 1 deletion(-)
> >=20
>=20
> How this was tested? This series must include the DT patch. If there is
> no real user in upstream for this feature, then I don't think that we
> should bother at all about it.

This is primarily used by a device that uses ACPI and the driver uses
the firmware-agnostic APIs to get at this. However, it also means that
the driver effectively provides this same support for DT via those APIs
and therefore it makes sense to document that part even if there are no
current users of the DT bits.

One big advantage of this is that it helps keep the ACPI and DT bindings
in sync, and document this on the DT side also allows us to document the
ACPI side of things where no formal documentation exists, as far as I
know.

Thierry

--2IhQJxqBxhd1xrh2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmGzFjwACgkQ3SOs138+
s6F8mQ/9Fc5fNDbeJjUOJvaNOnGBiFoOwLTvUU5rJe09sJUQNqqXte8PM4BhTxGm
rnqsAjSmfY3Hgw9XbdIad4hEj3GAtKavsAdK5oyDcqmCyyIcP2k2DxcPSP+LsOCN
MnH6Byzm6HeMPX+FunjtCXxuJT1Htsb+Uy5iUkGctqZeW13f60qMSfmyKlcX6uxJ
b4///ebppLbU9u989KnLx6WDQX9tfppHzCqYR8K9yYH25nidvmr5uu8EHUBYq0s2
t+CyKM+IXbpCsk6ZS1eIPuKIkKntvl8DHkIiEMUX3Vs45DGWc6oYYF/Wa9GSZn3q
xBI1B2nUfQCvumi0cyTwjJBSpkSjnBFLon3KAoqs20LygKF6XLjcHJZDtltuLKXB
XqXCOoR2qoH6JwxdpXgYAr+pXEz1XJeKfQCZ61RDWI34I/nt2SYUxmEJIzFUXhmJ
VgrugrKVa3yeGz8H6oni8YvQLufMPn+MrInuvAy24ndt0ICnB9f970tZwEngFacp
YlxjV63f+KvH78B2KWjxtTTzqExZi393GHoxLjahWWx+EYXrYIdh2F+7DDwHN+NI
6Ac+uWK3ZJZuoLADboTmoc45ShoN0NTkFjIiIGzmzU2cgcxG0D8d33+kT6GBNNPi
z2ZODA/uePOon1EdVR6lbdAFMTA/8RnKQbK5BtuNEZ+YcRnRFqY=
=eLpi
-----END PGP SIGNATURE-----

--2IhQJxqBxhd1xrh2--
