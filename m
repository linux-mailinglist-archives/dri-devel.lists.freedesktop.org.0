Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6181DE774
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 14:59:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32D356E0C9;
	Fri, 22 May 2020 12:59:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D34D6E0C9
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 12:59:17 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id j21so12949974ejy.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 05:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZW5lGmB6LapbscwV/BtBehKVwRSoVgdjATk0hkmmT0o=;
 b=pCYb+erS0ga5JAdH3+v7xJEGa80jYFbQf/IjxC70Wz9WnXm4mbKkPQ5pWCvnpu0eJk
 ZpYd3BY+Kc5pLF9NWfnxhHn6Pt5BtznZwGbXUIS9+X5M1+kPfG1b47zQ5gbSytrEyaab
 fIr48P7BVgAGbkHrHWzwh2eezAV+XDyb5ooSgsY9m12ZT1mstCpMs/43LGPnwGBilx5l
 qw3Fzz+amJYBjH4p2RgSJMZ1iXlrgi4gDMSegzHjliRKrhvPoqKh5WWnN6K2WN21XqoO
 9SEBQs6vpgR7AfDvA+mVwUi18utSB+PyyACqGGQHQ8yoTbPLTfIyFCyAPHXXVQvrZo9C
 wAtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZW5lGmB6LapbscwV/BtBehKVwRSoVgdjATk0hkmmT0o=;
 b=GPPt4jDjo+rS6TFp5JHkq1dYhcTQeMyl/o8XY40rvKYIYnJ0YHyDzk5naChycJjJmC
 5PDTdogCgYo0GrbulZl+8UsZ9f4BrakJXPTf5A/jfW03JtMatjI+QonNfLG9Kt3lWwDD
 XIgWiq57vPaxlVBcyQg5+DP1rVrEWptMTO5fPHkIGM2VnAayXIyMDjjkRYf3BJzrZ4Iz
 4wFDVlyhHqQFqnI/3uXfgl4/IcUCIkzWU19WeB0I30EkHhLk1xipSYM9egDpK+O+DL+I
 YUxwMnkfqmDHR0vRXwsuUwYkwR9aVwgxe7zKSVV/3Klcl2M7qPsVT2eh0f3LLZm9viqo
 vPIQ==
X-Gm-Message-State: AOAM533v08IRNtiZ5FM+kGmPUUiQrIkk42tuDa1B+PVu3mZk9CJPLAJP
 wUiHgArgTNrZuyiAQYce/3ZWjcQ4
X-Google-Smtp-Source: ABdhPJzbVOQxgtkfX5DSe5uy+Y4yhs9DBCwwJvPjdCZVLa9SRWBLMBVIiYqLk4QkteajZIvbjKZHCA==
X-Received: by 2002:a17:906:64c:: with SMTP id
 t12mr7852404ejb.524.1590152355994; 
 Fri, 22 May 2020 05:59:15 -0700 (PDT)
Received: from localhost (pd9e51079.dip0.t-ipconnect.de. [217.229.16.121])
 by smtp.gmail.com with ESMTPSA id a15sm8008320ejj.104.2020.05.22.05.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 05:59:14 -0700 (PDT)
Date: Fri, 22 May 2020 14:59:13 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH] drm/tegra: hub: Do not enable orphaned window group
Message-ID: <20200522125913.GK2163848@ulmo>
References: <20200519090301.32689-1-nicoleotsuka@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200519090301.32689-1-nicoleotsuka@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 linux-tegra@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0279586955=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0279586955==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="M9kwpIYUMbI/2cCx"
Content-Disposition: inline


--M9kwpIYUMbI/2cCx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2020 at 02:03:01AM -0700, Nicolin Chen wrote:
> Though the unconditional enable/disable code is not a final solution,
> we don't want to run into a NULL pointer situation when window group
> doesn't link to its DC parent if the DC is disabled in Device Tree.
>=20
> So this patch simply adds a check to make sure that window group has
> a valid parent before running into tegra_windowgroup_enable/disable.
>=20
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>  drivers/gpu/drm/tegra/hub.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Applied, thanks.

Thierry

--M9kwpIYUMbI/2cCx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7HzKEACgkQ3SOs138+
s6H7NxAAlocR8/osRzgQ4vml66I6m+TJuF9k2Ow7YvMDRZYSDXW/Vsl2rqwUZrwZ
A6wx5r9OxEq/eXjSpNHvF2nOqPRetvKHqJKBFFXOixDdD0UtIvlAKdIEZ8Ch3Gx0
fu+OHajYhSQwEUxgNToQy5lqRJz4nZKTmXJgirAHD1BBqxjc3FqZaXBnwkE2bmMx
rwJGkoylRBaw3TSxzSHx+CalaDf2yxfLHwcXa9/zcfFKJ8oEOBgREnL5PxbZhH5J
LOhqHzDR7TpQgGJjA3XAHYwt+nS04lfbQpiy+gYWwVQ+n5S0I5nThGUEXbNSKivR
REjA95NXLQLBziROaxWuUlH8iWggdfhnAP8PfM5pG/TR26/r3f//4VDaR3RZoqzA
dkaPwAg14VPir9OOOOkFxYp9hBw9fh91FbzwSMguAbG9bE4Dt9ENCH6+2EVYi3qo
14NESubshj9GpokX6gjs2Ksz6GDzvXsCygYC+gcmTRSYZq30D5LFgvWqLtElw2/P
j8w0Wq/yg9KSCf5/4YMGynGeZ6NLWbch+jolHGeothCJ1DbZqiZYbqO+UECEJtCh
+m0PRjJMLvCRsjGwyG8vGY9QoOtsoUT8nCKSy1bRaNcK+OGwOUpzAp0bZUyJKkgs
5ci/nJu96j3qB+W/5fKnjT9JMMiUxInzQyU91aeurJWtPIAH+Oo=
=G02C
-----END PGP SIGNATURE-----

--M9kwpIYUMbI/2cCx--

--===============0279586955==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0279586955==--
