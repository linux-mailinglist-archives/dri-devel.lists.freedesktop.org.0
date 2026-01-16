Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A27DD30F0E
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 13:14:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B29EB10E205;
	Fri, 16 Jan 2026 12:14:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LhKuDkJp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F8D10E205
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 12:14:26 +0000 (UTC)
Received: by mail-dl1-f48.google.com with SMTP id
 a92af1059eb24-121a0bcd364so2395217c88.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 04:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768565666; x=1769170466; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SxbenU8ZSpGXilJflF1lFNLpWQ3tMY8MCLmXY1GJJ+Y=;
 b=LhKuDkJpw1/n8FRWnmc2ICi6rBUqywy7YPtQ9jVW7quKwWidoGVS1fRUwy6QDx5oM/
 zzkJxEao/jPHkCqb/7wJCveOJt1m1EKD+0YSdEhpY20pUw9j98z6Zqm5lK83r1Im//um
 BsaZCBve/ejiZ1gsKtUB2hhxhyo4IfByz82noOPT/pYcXZy7nk1x4IyRF9Oam0o/h+e9
 Vy8V2ymg3XDqb+EBpwFpVc3TjkeyrEVybIaAFEtQnvF0jUNEwbsOCHZEicN0SithZxlY
 34mOswUAEznrHFTwHkPJUpzGB2HIGFHXD/6DURJvu75yp7IFXmm2bfwImdOcpysUiSBy
 BZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768565666; x=1769170466;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SxbenU8ZSpGXilJflF1lFNLpWQ3tMY8MCLmXY1GJJ+Y=;
 b=jsd7OGEibNiw1SdYk7geC5i9nMWzfSAYJbk77mQ1vk21CK9vDM/MCiuaE2d1my45G+
 Pl7bMcpCkIuOBHCOkNSnmjsynNcqJrGZ7pjSy9icqmIbR0AUXIBS1FWSB+5dWKTURpPx
 oEHgwpC4o7UuXE3p01sDSVzbS7dVgZt5CRxdulwKfIguhiKqn6Y2EutS/OwNSSyFgHat
 SIej+QQuI3mC6KeC7myp7DoDQNeRuKw2wKeC4mEVXlZVnbawI/K0XQqQ14Nj+cvi07Ny
 bMsnAHe6rVhimZKE6Y52yJWtG7Oz0GdSUMCfhwb4rblX1nlPg4H0VyRuOkDOM/kAsuHR
 ykrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6QHvwIhKwQi0h84UDrYTLhSI0VTkV7Nyu/+Qt/TG/I6EqjLf6E8lvTh+k1CXkT6W/o8EJ8lnHWt4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFjcRlTzGulIMP1vdKVMNKZ1jmf0CkhCW6w0P7Rbnii6InCJLh
 hZafkfXkLcezFWNcqthOBLIFhLRQ74ng1sN6R0kHm0kjXU606y4Emw34
X-Gm-Gg: AY/fxX5e5uyJXHQ14sYlJgGEjTAT93p2RTU8m6xQ56xSUdNRFkQRyH3+QTThd+byFmP
 VNOYLDvO3oeestTdIUgM4IpBUFsU9gCpb+tFGLiKf9CYHoMFsUlMLTxpbYkCvc71jwh0wQQU4fO
 ljnGz0cHg3kUK0cL9FSNJkQ15iLUNLvGrWRqadss8zGyDy5pckfOKzljrvD1fRrrMDpCi+F7UOY
 kfy/o8xJ4Yd/rKNdUl3Ca0M/cRATXH1o64takyX5DmaIxTXGrYx/0jauRmpcEXozZONm5wngzhm
 UUnREcoKs9rbIpuScR0cIrR8EdGGAtXSpDLGngtd85U+vCflMy5O9erXQTKFT05RHJngJQCGxRM
 oWQgCKCoi6jzx+g5jG4sgUh/yfcX8ZU6bq+p+6e5AJfxl8FgtZz6qr5pw/nxRS+7SB1a5uaVxNe
 8PA2kqygxQpAkuHtASwDByIwAtJ6a6K8VpCRLgtr3GTPajY+20kZBc1OaDXGyMe5soUcSHDaRiH
 iSUDWr4GcVU
X-Received: by 2002:a05:7022:2484:b0:119:e56c:18a5 with SMTP id
 a92af1059eb24-1244a7257afmr2539382c88.13.1768565665644; 
 Fri, 16 Jan 2026 04:14:25 -0800 (PST)
Received: from orome (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1244ad7201fsm2116504c88.7.2026.01.16.04.14.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jan 2026 04:14:24 -0800 (PST)
Date: Fri, 16 Jan 2026 13:14:19 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH] drm/tegra: dsi: fix device leak on probe
Message-ID: <aWorgofgDfxprcPG@orome>
References: <20251121164201.13188-1-johan@kernel.org>
 <aWd3iFrujbRWyyyx@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xzdfoibcbt5qb265"
Content-Disposition: inline
In-Reply-To: <aWd3iFrujbRWyyyx@hovoldconsulting.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--xzdfoibcbt5qb265
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/tegra: dsi: fix device leak on probe
MIME-Version: 1.0

On Wed, Jan 14, 2026 at 12:01:28PM +0100, Johan Hovold wrote:
> On Fri, Nov 21, 2025 at 05:42:01PM +0100, Johan Hovold wrote:
> > Make sure to drop the reference taken when looking up the companion
> > (ganged) device and its driver data during probe().
> >=20
> > Note that holding a reference to a device does not prevent its driver
> > data from going away so there is no point in keeping the reference.
> >=20
> > Fixes: e94236cde4d5 ("drm/tegra: dsi: Add ganged mode support")
> > Fixes: 221e3638feb8 ("drm/tegra: Fix reference leak in tegra_dsi_ganged=
_probe")
> > Cc: stable@vger.kernel.org	# 3.19: 221e3638feb8
> > Cc: Thierry Reding <treding@nvidia.com>
> > Signed-off-by: Johan Hovold <johan@kernel.org>
>=20
> Can this one be picked up now?

Sorry, forgot to notify you earlier that I've picked this up into
drm-misc-next.

Thierry

--xzdfoibcbt5qb265
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmlqK5sACgkQ3SOs138+
s6HMLg//aI6kPwRqWPyFQ4dxrRNAzkjky7szL1OQcea0JIHd4zW2vzOOL9qtmj3M
S9FW2T2r9mpNxR5MYMtu2F6HDhzBVvGQBgrTJ9H7JBz6zypyan0K2Iw5agjlb2I8
GnSMiAaBTH6Y9XhOW3gG6t7zF3NTemfhCfxX2y0wj5ZRa3NarOEGB+X1YByx0HKM
Jk6BQKGMXcWYRnb6Gxaa83FjC2kI5KkJymlubk+tlOgzcfWcywYXs1TOBbXt/OkP
BCVyhQ89sT0X7Lojl+UCcr7/6LrkPgLWz1bKInlzQ0mjHhuVjL4PBNBwSDuE591z
qiQHGhJGHlTXY+8Lp4ndQAMLp5FBBfKguR7Odxf+4+/VDaGnDvqhpNXU540tU/jP
E8u5pjviUIjSuhSYHTcggcqJ8m9WalGq5CcLXExIl1J66MrRgw1AqJB6nPF4gIPS
fCcMHGkua0XIGD9FoG5Ij+j80uq1cbyKITP0auDAKRgpiEC2nXLkCbl5YQEwcTYp
eUWMnu5tmloUmGc1dLrN39UsJBHzaPm/DFgU3uc938uF7Bc9NF49Hq4sADkwcD0R
+v1OcHotaFOkGqvcPKeNhfuoJ/2jMBs78geOGfJtYVlpGXWZ7T8tndAxGEb/HMmG
25DWp72ALnZJeClQZn5wi30wGTsyKNvyNm7343GAeLQrROXg9Bk=
=pibZ
-----END PGP SIGNATURE-----

--xzdfoibcbt5qb265--
