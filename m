Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BB92F8074
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 17:18:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0408C6E0CA;
	Fri, 15 Jan 2021 16:18:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317BD6E0CA
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 16:18:35 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id u14so3877734wmq.4
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 08:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YCiDkthl4OIFxn0mzHzqR9AizFHqaokWfRlzuTBX9TI=;
 b=sQ3cNpO5YXwK4VHLZJoZzyjhtCNBqZPphdpKRuS+jSbpL9WMgVmOISpXp4XgMZbpdV
 MFpIFNCfhfiyCdQgCzqtDgHSP9j/sRBjSjL0SHVQjnbl5JnoZMXGudb3AtlQNt8r4XnJ
 o4Sy6sj63fpCahORQi/NgsaVtQkhQuWsoDXLnuITDZFtOlKJSZueU2iR7UMr9Q2SnEXF
 pTpOWZMgvt/oecW4bIKdkEx/qgOMVdUAWTCGAm5L1JgeDG+qclHaitwt0vakQlKDyjzC
 /o4wW5rW/DlzEd1Z+EhnHqdbw5nwCrKaBleIiRADUJWScra52As9aL6CXI8SBLUq4OwD
 nerg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YCiDkthl4OIFxn0mzHzqR9AizFHqaokWfRlzuTBX9TI=;
 b=V+uMxhMM5LXNuQMdoq9JXTPGUz+VfAO1avm9PLu2I5ca1Rf3CpLU398OrD6xKE5g7X
 +vx/h1Q43BZgKLS+vaJ/eV6KttHZSEC/jI47S6cr9a8A9ezr81xEMSV2aavM20HYog24
 5HMCBkeUY+WBdeUC0JZKzmFEVp5YHODZnCzji9U6vBjr3w4+JUADBL4P2Q5MEwMqygOG
 FBr/9GRkFWlVk5R+zlmWlMYEg/rRJ3bJJI/NsmJnZB6dwfdhOF/7+HhXTCwb585H7n3G
 Uv/ABddhO/NuVTePKO1+8RljHQFppMGdcrE7kD11fBirTatb9Of7XMTtjnhQTWAiTw88
 +Qhg==
X-Gm-Message-State: AOAM5318h15+LOfwmUGS/6AjfmsOL4TbCNJP2w0PXAb2fmxXNPGvcyEa
 iLNbmtfxN2Egiroc3tV92HY=
X-Google-Smtp-Source: ABdhPJzzC8coE3a103G+lyWv2TG0YUO3toql0/DlMZNWZflDdbjFRJ0HTdJWJsCsRTJcMCvamkt4hQ==
X-Received: by 2002:a7b:c8da:: with SMTP id f26mr9500058wml.50.1610727513875; 
 Fri, 15 Jan 2021 08:18:33 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id b13sm14625594wrt.31.2021.01.15.08.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 08:18:32 -0800 (PST)
Date: Fri, 15 Jan 2021 17:18:31 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 1/3] drm/tegra: dc: Enable display controller driver
 for Tegra114
Message-ID: <YAHAV0ZO1ad6deVB@ulmo>
References: <20210112181421.21293-1-digetx@gmail.com>
 <20210112181421.21293-2-digetx@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210112181421.21293-2-digetx@gmail.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
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
Cc: linux-tegra@vger.kernel.org, Anton Bambura <jenneron@protonmail.com>,
 Mikko Perttunen <cyndis@kapsi.fi>, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>
Content-Type: multipart/mixed; boundary="===============1987689890=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1987689890==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ty3i9iS3x+Y93JVm"
Content-Disposition: inline


--Ty3i9iS3x+Y93JVm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 09:14:19PM +0300, Dmitry Osipenko wrote:
> Display controller driver isn't listed as a DRM sub-device for Tegra114,
> thus display driver isn't loaded on Tegra114. Enable display controller
> driver for Tegra114 SoC.
>=20
> Tested-by: Anton Bambura <jenneron@protonmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/tegra/drm.c | 1 +
>  1 file changed, 1 insertion(+)

Good catch! This used to be covered by an "nvidia,tegra20-dc" fallback
in the DTS, but that was removed at some point.

Applied, thanks.

Thierry

--Ty3i9iS3x+Y93JVm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmABwFcACgkQ3SOs138+
s6EZMA//eyUzW+atqGI456yWuRpLNCkvwa500E5zuhW/MDsPu1FluH29CB4mtIiX
lBWwy3Qvpim9+8EHgwPTuh2Cv8L6Q6oMRJMfH2CUn0STzkPNaPxoXXHVYfkhdCgd
wRFCMP8yt+cvnKD9rTz0fH5YDd+dM69UPSorjHKWPRxMD2Ig0f+CbHl1zORkmHkU
aN49ueeyuPmzxlOnoUIydE1iVQ8tf+TaH7oCzbczqqCbu2hkEoFWVWCy2RPjOvF0
M/H7JJMpr8zMC/WIznU9JE46Rrq2XTFNLT4E2/UNeNTCfjTSdb+z4lSI/Ek+Ttzk
SufLVsas/91QMUfDcprbkLhMqG2sg6QmKufNkGuixF4GMNQLk55AagI1L+aI/SUT
2yxabcKkUC0MYGshd94qOy6++mqVUY7R9RMIs41YxNcsLcYPC63/5fegrRRnRWWE
uBJDpd4T4xik1uiJFd3QVeqk/cogSmQDQlmAg3rJBC0iub7iuoKHypfbTfG16Tj/
cmsXMWpcI+QOrrzuL23f3VIJCLSKFi0uHcsfg4d8HKLMDSQU4ZmYCq1anRyDAGLc
y6w2tkVOW0ywEG0F9cXhszMfJQ9tuHOJw2n5RLTzi8PR0cAybbSlWhPZdyXe7lxS
1xsRedGVAcMOIsuMCha1Q5p5YR/1QMZbfYQ/PQsLzxtF35c6imY=
=IfFI
-----END PGP SIGNATURE-----

--Ty3i9iS3x+Y93JVm--

--===============1987689890==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1987689890==--
