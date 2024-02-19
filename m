Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B27B185A8FA
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 17:31:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 504F110E420;
	Mon, 19 Feb 2024 16:31:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OH4aye1F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1E210E3A3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 16:31:19 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a2a17f3217aso597458966b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 08:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708360277; x=1708965077; darn=lists.freedesktop.org;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CJnshEXb5iP21arWLxZBg7eXP7IT09TyOJfu5lknJns=;
 b=OH4aye1FEnrPrQYukO0GfEwQdfjUeKT9xUkFOMN6zsyLSBXNIvabkbzquf/NgbJRFD
 DD1e74Pgr5EfEWnxBC9YIAEbYalwwzI55zqPV5KXguoiDu3aZkBZHaDZ4TnRJ04X+Hv7
 2o8tNe+rAnvs+KoPkJ7YY2mz94W5GMqE4bT2/Etz8LxUH/obAxC29qbu0k95CUfaQbY1
 zNr1gI9yM5svXVHygoZnG0FjNlYWAQVK0JrEjmRfW+Y6UftLtwAA5xROqgqU4SI4Zwj2
 ua9La5T6IJ6MvgqAe0ChOjY5WGGgK2/bOJFI/Ys4nPrl6H/BAU57Zh3IEzUvSlrc9E1D
 UMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708360277; x=1708965077;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CJnshEXb5iP21arWLxZBg7eXP7IT09TyOJfu5lknJns=;
 b=fC86OUm3d9nj+WkMUjcxGlRD6ONEgqZlZX7aKpuGhsctJOYB37f5xQTyHxY7kqSidU
 ygU3LidsDmezrCYutmCFRusoouP/hR5WJUCyhzkNDsGLITmxuaRPDobJugeURRLe98Iv
 YLn/kGXu3t1MKpOICWECdoRNP85v7mSjKdChyg97hcyii/+CYz9rFx5+kgXmaTUin13a
 PpWk2l/DpHcVaIhdIy409IvQgi5l5ms75/b6wWxZtpiGetUAjxyPSUZsyuRjnYcoEMwi
 1sy5ctasG+xJPBDivEf5flp1aed7beRndVMosp6n8zjr8kWTBL6rUvBgK+xDkmgjzSGT
 fGDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6P3UMr3V9dyJL/iU5b7UxKqu9IswHFHVw5HLr40P4mAe1guphwhSWOmGCA3stzrm+HgI7UsOCZuwyR/NDfeb1qR1t3BBBs/IM2muZEwFv
X-Gm-Message-State: AOJu0Yzu6AJsliJab4+PNpOFQbSZTTe9O2OTsLhfvAxGLglcFIM0079w
 Q6X4b635jJ81ji2qgOq/bJUeqNb/jFq7khnbSnGPBA0AA58MKVNJt557VUCg
X-Google-Smtp-Source: AGHT+IHwY+g0l6OBkTZ/znpmFhm6zjeMvBV15GsnsAHatlQUq8ac60IGd6BvGeEMX5W3lkEExT16JQ==
X-Received: by 2002:a17:906:f150:b0:a3e:8f38:8d76 with SMTP id
 gw16-20020a170906f15000b00a3e8f388d76mr2234550ejb.59.1708360277472; 
 Mon, 19 Feb 2024 08:31:17 -0800 (PST)
Received: from localhost
 (p200300e41f2d4600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f2d:4600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 bn9-20020a170907268900b00a3db46018a4sm3088388ejc.71.2024.02.19.08.31.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 08:31:17 -0800 (PST)
Content-Type: multipart/signed;
 boundary=63829e55cfba98703e2f61921804ec1df7a9f29322c3de52c6af38343b10;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Mime-Version: 1.0
Date: Mon, 19 Feb 2024 17:31:16 +0100
Message-Id: <CZ976COWNF9P.9CWFVDV5ZKAY@gmail.com>
To: "Mikko Perttunen" <cyndis@kapsi.fi>
Cc: "Mikko Perttunen" <mperttunen@nvidia.com>,
 <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH] gpu: host1x: Skip reset assert on Tegra186
From: "Thierry Reding" <thierry.reding@gmail.com>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240214114049.1421463-1-cyndis@kapsi.fi>
 <CZ6F0Y2S635X.1X4B2G0KT43NX@gmail.com>
 <cea93e4c-f6f0-4017-89b5-30e3d7b482dc@kapsi.fi>
In-Reply-To: <cea93e4c-f6f0-4017-89b5-30e3d7b482dc@kapsi.fi>
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

--63829e55cfba98703e2f61921804ec1df7a9f29322c3de52c6af38343b10
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Feb 19, 2024 at 3:18 AM CET, Mikko Perttunen wrote:
> On 2/16/24 19:02, Thierry Reding wrote:
> > On Wed Feb 14, 2024 at 12:40 PM CET, Mikko Perttunen wrote:
> >> From: Mikko Perttunen <mperttunen@nvidia.com>
> >>
> >> On Tegra186, other software components may rely on the kernel to
> >> keep Host1x operational even during suspend. As such, as a quirk,
> >> skip asserting Host1x's reset on Tegra186.
> >=20
> > This all sounds a bit vague. What other software components rely on the
> > kernel to keep host1x operational during suspend? And why do they do so=
?
> > Why is this not a problem elsewhere?
>
> My assumption is that it's due to a secure world application accessing=20
> NVDEC or display engines during suspend or resume. This happening=20
> without kernel knowledge is a bad thing, but it's hard to change at this=
=20
> point.
>
> The reset line (CAR vs BPMP vs non-accessible reset line), and the=20
> secure application code programming this stuff is slightly different in=
=20
> every chip generation, which is where I think the differences happen.

*sigh*

I guess it is what it is. Please add a bit more background information
to the commit message and also a comment for the skip_reset field so
that people (including myself) will remember down the road why this
exists.

Thierry

--63829e55cfba98703e2f61921804ec1df7a9f29322c3de52c6af38343b10
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmXTglUACgkQ3SOs138+
s6FSNA/+JKS6P4nREJMSGDNusAkqIp/UTtXTLulM5h+O3EKLTT8JAomrUY7oWjYg
GvMz4BqpbShqgj/LbVbHMxPgCRhTizhINzsAyL6HmgdGAapk3xZ4G5uwW1xzbs7C
X8KaT8alBagFLs52hcpq0DX4kVdyqwzV4Sffvp03dtc1lYr2fHgR8l4Ram+QH9GH
SzMNaCk9DqF0mdHQeTy34/JhWfUfB83cv969iGqKkuPsJuk+Ji4YZACOvKAzgKTP
Y5vkggjWoYAzg3I8JaYApw2YVXcaZ1DVIBK9ApNAwMtk/L3ldeWeEIFFq+MFyyEs
hvrsBM4NTx4CSR6LhtBncWYy6a5mvWahHYMjrqY8I5IosgUUZF3quyKxwGcJVz1o
Y1pPOxAuj9n9B2+wn2uZIraOR64IH6CKKi9acLgRUfoZo5+E+r0HdhJB0z1zySsj
l2qjFIYoCuS87FvUGJyfZAoLdK7MUMSIRqjtPFCpRqTu+gUSEpR69a4zlwOM74GN
sN1+IU5saWx+IbDGCQ6FoKRq5tYclsgQ9Mj/Ljkpmv5yK6msysKZM9Io7oJXW3Qs
+N3f95EWR48dNpPBo/tdaR7X/HVmczq16Tb8e5O2Sj0pHml/US7OLDRc+ISN24SJ
R6qHw15H/+s1cxebsyI2LHvSiZWRsD+gs0u38JRy6toYiDJCFX4=
=R2gT
-----END PGP SIGNATURE-----

--63829e55cfba98703e2f61921804ec1df7a9f29322c3de52c6af38343b10--
