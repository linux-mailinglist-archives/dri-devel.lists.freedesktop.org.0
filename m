Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7C3AAE561
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 17:50:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 517D110E849;
	Wed,  7 May 2025 15:50:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JlCdBfZW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDCC410E849
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 15:50:27 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3a0b135d18eso13658f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 08:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746633026; x=1747237826; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3XArmO2zHe1NgTSOCugIlMV91OaFSwhzmds/RQoWQO0=;
 b=JlCdBfZWLTP5P0g0pkjbRDai0dLOM8yHXS5bVD0DFxhi0GaaXqnButdfJZSeplNDMi
 xNqy+AQ0c5oi/JdSZAk8jTLu0Ua89YX5XirmrEgZ4+WeF1oJEH+XOCNf7LAW66Leme8s
 nVPwDWhuP+gAt9Hry1HFEUDe40iS6rgOsuvDLvW9z/BoZFC7G7KAlzk2/SnY3QK0W6/i
 wX0Hsw4WW9SXAUuEs/SryrjeMxgc/9Zkq72mWGv35jFiGrJSOHAbjR5r7vjb8nlEffbr
 B2A7mMR63Fz2XS9xvkgghIE1FjoEdb0hfsbmg5xaTNHC1ckbyCdf6eQhFf11rhRxLa5Y
 KAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746633026; x=1747237826;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3XArmO2zHe1NgTSOCugIlMV91OaFSwhzmds/RQoWQO0=;
 b=MtCneg+nsALJK8CNVVBo9yMVBtWfXH+JxH4xU0D+xxeJ8nToWvIL0UXGjLcyh4GWE0
 iAcpo65w0p8r0uOwH/GzczvmR5Z96qc5NhewlWg1IODNkfdgu3z41tCZJVGf2A9pedV9
 OzTMiZvL+iZ3zJE/RgM1qW+fhCkJEaZ/NFkkRR/f629VdUL8cMPnYiBfBpiHlogDjcDH
 N9mZ3//egR0MyJcCrRSW7K3AU6fuC7mN7it0rB1eQmT8uO2TPoMuaaWdrYGj496TvRE+
 OQaB3dgLVN038Ne9qC7hwMyrZzXKQ1pDmFdg37GTmvqbiq6VRSRqXu6Eotfp1nM7ilz9
 JWAw==
X-Gm-Message-State: AOJu0Yy+g1DmL84+MC2OoqJ7LqddZ9Mj7FyyhjUr8S4YUx1BjxsvEmqb
 awNHNefdQ/lbbAqxW3jJ/XjRycSlsHrxCKxqcwD2tS/7Sy8NA6py+djqdA==
X-Gm-Gg: ASbGncsZWVDskqCErW1B6qs9fjItUQzQT+2w9ekdDHf6aOiUk8MUZm+yKgR4aedNPOD
 HrZyDZ0qO9Z8r3mIek6UuYAmjfEt7TUM4TnZ8GXLO3D6B6jaOZmtEtv27X9jfVaig08oyZ7E7Wh
 S5swt0VLoe5Qt+/bTjaUHEVvBGJ5lzthoz5vJG8mct0AQ4P/ydlbVlfS/wHtCe1aR1/KjlZdHGz
 K8fU8d0MdW7q35l/inqhhMe67vD9l4+m26u22J5zATNILQ6o/nj16toG4ocbCSiBTN+6KWuxONr
 WkHeBeOAdobX1Z8Om1bFn3MJ9PZUD4kkbRHoOhtHBriHwCHsb1xVAfjdELj71e2PysDerYL5d1Y
 YufyvYeJYPkFG1xzDwNAE+t6RGiWXT9MIEvqi3g==
X-Google-Smtp-Source: AGHT+IEUj0r5+bPExNa7QXy7YMEx/UNNIRMfaOUw1AfiD8WFXvb1kGRAnzb6MbYOoXr4iSguE5CLXA==
X-Received: by 2002:a05:6000:22c2:b0:3a0:b930:b370 with SMTP id
 ffacd0b85a97d-3a0b930b52amr464513f8f.28.1746633026347; 
 Wed, 07 May 2025 08:50:26 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a0b44ad93asm3375394f8f.91.2025.05.07.08.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 08:50:25 -0700 (PDT)
Date: Wed, 7 May 2025 17:50:23 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] gpu: host1x: Remove mid-job CDMA flushes
Message-ID: <z2ddfg5pjlehoo5r7vjlhm7t4jusjsblujcn7qy2tnc6ioesxt@w5ybhrazrkx5>
References: <20250204024546.1168126-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qfmapx2y3upagwor"
Content-Disposition: inline
In-Reply-To: <20250204024546.1168126-1-mperttunen@nvidia.com>
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


--qfmapx2y3upagwor
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] gpu: host1x: Remove mid-job CDMA flushes
MIME-Version: 1.0

On Tue, Feb 04, 2025 at 02:45:46AM +0000, Mikko Perttunen wrote:
> The current code can issue CDMA flushes (DMAPUT bumps) in the middle
> of a job, before all opcodes have been written into the pushbuffer.
> This can happen when pushbuffer fills up. Presumably this made sense
> at some point in the past, but it doesn't anymore, as it cannot lead
> to more space appearing in the pushbuffer as it is only cleaned full
> jobs at a time.
>=20
> Mid-job flushes can also cause problems, as in an extreme situation
> (seen in practice), the hardware can run through the entire pushbuffer
> including the prefix of a partially written job without the driver
> being able to process any CDMA updates. This can cause the engine
> MLOCK to be taken and held for extended periods as the tail of the
> job is not yet available to hardware.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/host1x/cdma.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)

Applied, thanks.

Thierry

--qfmapx2y3upagwor
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgbgT8ACgkQ3SOs138+
s6Gdag//SKI4A3pKqM1VtANevINYZp81X2chnY4ArN4+TPPfkrCZ+1d5+8ThbF85
fYAdxCf0sI2+j9vKxGQOm0St0W8B/4STb21kmR0l9SKh2uElMNgglbR9AMoBPABD
dxWAxnbre5QTOQcD+08bLj8zD7QDmozPSI8XahgGyq3nwgjBROHPdvyEeOet1bW2
JGxt/5mwHIwwf52merw8MKMyfGp4FeWamt0SmKtmnlt5h5mgJec4A3KU+Z1/tBxN
zKcj1RpItGxXFenlOdvq0tr69SRlPYHjlr4MlMV6FGqLK42e+U6aTDL287QyDidM
yp27f4mundMwmctybbs/oZGTKPuBv75RBq0KiNlt2y3TLlVREQgwYJtVdb53yHOB
xQ8NTBf1Gcw77G0ZiNxImVIUicLrstlqGh9PiaP5UWABlXYkt9gM7hDsdackWJeK
w/EC6p0JOlr64jXtu7+9fE80E7AxjpjeLerNoRTTo4acvWu6ykj9iZ3aho1Hdnv6
HTFP1KDeUY73MmWzRm2psjR4X5QVjIvkNL5TuwJOBGHvmyOZLFSvyrUwP6//4KnP
vV5T6Txy9J9bTSuZiSChQk/B+HWphSWkgiDBhE18SuF6cunVpy7e4EAP8aTbF27w
TXrcs+Tw6f4oJfPcjUnnnutTu5iXE1Im3OZLgoPlXwmPX+i0DL4=
=4eM0
-----END PGP SIGNATURE-----

--qfmapx2y3upagwor--
