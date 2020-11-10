Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B23C82AE033
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 20:54:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ED5D89A62;
	Tue, 10 Nov 2020 19:54:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFFBB89A62
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 19:54:01 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id 33so14061365wrl.7
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 11:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=NsjQ2bxKep09VtBbYdsrhQsOr13lbc9Doa193zsbYv8=;
 b=EILuuoycOFbcm8lGc1d+bSvKMCtr0XnpgbcXre2zNgbj7EwEhktxbSKYgev1VCf4WH
 P0t+jZnVWRXur39ydLnJlY73UGET12+Z6hT+BwoNVg42Eg0iXjCKFnCd1guKOPDXdD+M
 1FgLcAcaGKomwRmEoi0vswxU1VXpO4liwoMw2Id1nCFqY4XazT4M2Eu2C4SOem5MWQP3
 ln7rvMmRdbyVe/S/+GoNmUqL8mxBjUIxpM1+iMpNHrAuw4oLZYEt0cDjGh0y9EFuRPqt
 fM4tE7dzYWqXTodY5lhKzbhrvDhGFew7dOC/OIK5wK8+SmELURzef21rqZoC5FSHiRWJ
 zU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NsjQ2bxKep09VtBbYdsrhQsOr13lbc9Doa193zsbYv8=;
 b=pqORMgbtsB/bqasght2GqhnkNMEJi0KeSueJEQ74OKnXs1jJlkaE9m+CXo6YAdi0cI
 sMN523BWAwZtbCmDIjBXmYHH8h6jsxW7XFFBKA7H6ONLFUuU4rJ9KuoOmRcbqGe7HRT3
 U1DVNcMHWJTr6JLOGugR0IfAZy/OlXfYkk57Lc4lJI29vLAVQf05pgotw9Gft6n2DweF
 oPTVAuRk2UK/XEqyEMpDgQeZPmugK31T3Z/lxFQJfiC+O3UdO+mPsYbzyogsmOdxB+vS
 MUNRk9rFRCzLBHsSjIgAb0UJw/rTnOxW7LbOp5NFOTCmXnfsApMxdx3jAGS/wRtjZRoo
 jJSw==
X-Gm-Message-State: AOAM532vqr/UH+wHCkr7FZf5kGYOFd/fZOFETNzuGnTy7IgJ7x3aNJiG
 rBx+SMsrej063o/k0D1xDhU=
X-Google-Smtp-Source: ABdhPJxsskSfxC1zZ7ByjZlL8tFFRGikXfTIX0JDoKXekBFXlSxwZn3Fp+XlBSWVD7VdBxZ2GPd9zQ==
X-Received: by 2002:adf:efc2:: with SMTP id i2mr3484665wrp.383.1605038040688; 
 Tue, 10 Nov 2020 11:54:00 -0800 (PST)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id n9sm4028867wmd.4.2020.11.10.11.53.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 11:53:59 -0800 (PST)
Date: Tue, 10 Nov 2020 20:53:58 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Deepak R Varma <mh12gx2825@gmail.com>
Subject: Re: [PATCH] drm/tegra: replace idr_init() by idr_init_base()
Message-ID: <20201110195358.GE2375022@ulmo>
References: <20201105175928.GA42488@localhost>
MIME-Version: 1.0
In-Reply-To: <20201105175928.GA42488@localhost>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-tegra@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1955416207=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1955416207==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="J4XPiPrVK1ev6Sgr"
Content-Disposition: inline


--J4XPiPrVK1ev6Sgr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 05, 2020 at 11:29:28PM +0530, Deepak R Varma wrote:
> idr_init() uses base 0 which is an invalid identifier for this driver.
> The new function idr_init_base allows IDR to set the ID lookup from
> base 1. This avoids all lookups that otherwise starts from 0 since
> 0 is always unused.
>=20
> References: commit 6ce711f27500 ("idr: Make 1-based IDRs more efficient")
>=20
> Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
> ---
>  drivers/gpu/drm/tegra/drm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thierry

--J4XPiPrVK1ev6Sgr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+q79UACgkQ3SOs138+
s6FSeA/+Iw7B6giIoQpubSiCFapmJ2adHGvhiUk8Z1Bvsk4I60f7TceVbVKJaGBO
rovc1peM2Ct9yZ1Rsp975wI73jzP3DFotX95CP/fkN89xtEj6NEwIsxc9icPDz5W
tpoz1azIGh16XPiEbPuNTLSGDcRrpBA8Kc80A/iEGyoQcjEqxHHCCd8BCW+zR60p
OZnS4kuqVZD64vVKoYWgmYYgMW2Dqq4t6ZShNr5+yZaeObxgbYnO10tyD67d9iCf
GZH6ieKkI1GOziI6GykGpmACRfVozI/YpSwSOzq1+nB+KuNJYP5puL1kY6/HGRYW
GLxhbS/iykwMq26gBOQnIIc3zvpyYaIIupFVm9lND1PH+nRZtzrnrLEFQd83mSoG
q5a+c5Qj5ka13B7sw3MjfUdOcLJqYg9trvinzW7qgyUlWMI8f+wtkKS8BKacPPBT
/vcTvQgDAdb6qE9VhQFJmULpnQ2Wzp4PGr8vdHg9msoeYWpZNbDEllpEJQAdnaCg
IP/i+TiWqnorL/s2gsN21VsV4G1mlOdD3WVG/U01+GwvkQSiBS4gfIn/mz82WE7z
8ZsQfpb36ogBtKiwvXhvl9CGYoFdzeMzKcSRqCqwNgooAtvD6tMo2gV055B2qf1F
BqR1VxxKVrn9hbQioixzn9E/zhX3ZbINEQHotsdRLPVsByVVbIQ=
=OhfJ
-----END PGP SIGNATURE-----

--J4XPiPrVK1ev6Sgr--

--===============1955416207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1955416207==--
