Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9253D56BBAC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 16:32:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD4610E606;
	Fri,  8 Jul 2022 14:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 724D510E5FB
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 14:32:18 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id v16so19364106wrd.13
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jul 2022 07:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QFviFYUhe5vJfEEk33Lo3p/SFZLGtcyfY7lkrIA4frE=;
 b=nY/g1z6brJ3G8Bos/uXtiRiUHMSh1WkxwW/iwfrKlGdBJcKHSoookCb4MzPczBGC9T
 VTehaSApVgqCtSuxKmCfqJ3A/L0vXUIReUrRZpDWD5/PAr4VDwRt6v/jCBXnQiOo0b7n
 EpIT/D7kjduVZSPOL4JC4v/8G9HINcf+gYGdXfFLQRGQDNJL6RzsrPJ1zZ9ex6PQhpGv
 kbOodrU53hSAjwRwDp+5GRVdtmhP6clpdVjGNUcZ5/pwxFZEOW6DA7OoaCODxBOyFv6g
 WyF7Ljt5FqyE3DRxk5/YQo8XHfzMs8coQZgqYhRLMgadJswLTgvcMhKb1bIs49HVqvhk
 bt+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QFviFYUhe5vJfEEk33Lo3p/SFZLGtcyfY7lkrIA4frE=;
 b=CTuC+1Aqe+9YlYBppTZK/WJ/c1RL0S9MRK/UyF1KdY8eavVRKQWSgTlAGiiifE/CfQ
 hGnoIAACsuQEWZzoGNSMz+TxHTpqCiq5C759xDFVORQ5o1601GOCbHvpohlwzw8w7rJm
 TQau0FVkfkzPbHdDeWPjZN+HNjMYhN1PUb9Y6dn9s8J5trWziTTM2LjTgnbjDnQu1tMJ
 396jP1ekRHCoP8oDPxnnLcDtTJ+kpAQFgbp4zxVJtX9TyBFlfEy53HPbIgL/lXpAkAFI
 /r02YpHSIERbtvpIyHZyZDFDYgzlyN6HxdL/kwq1HsbqihUQj1UnfNh9ZlsV0Q41urcs
 EoKg==
X-Gm-Message-State: AJIora80oRXTOdaJsPIiiP7wi09OqBZAA6gDLHGRiga673EWGWasquKM
 DlSNp9S2q2jXtQEkTd+U+sA=
X-Google-Smtp-Source: AGRyM1tDvkQkd3A9ZPQcpvz5nIG0CH0v1SVETmwkcxnbbRsyrcbd3vVquyufihHLwwABVIvqDMoFcA==
X-Received: by 2002:a5d:5919:0:b0:21d:60cf:cbf4 with SMTP id
 v25-20020a5d5919000000b0021d60cfcbf4mr3482741wrd.188.1657290736834; 
 Fri, 08 Jul 2022 07:32:16 -0700 (PDT)
Received: from orome (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a1cf40a000000b003a2c7bf0497sm2348141wma.16.2022.07.08.07.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 07:32:15 -0700 (PDT)
Date: Fri, 8 Jul 2022 16:32:14 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] gpu: host1x: Register context bus unconditionally
Message-ID: <Ysg/7u5gRiDbEm5F@orome>
References: <503bffe670b24aac0dfb03c8fc16437b8f0cca58.1657215044.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="c+67CJDB9HiizjPT"
Content-Disposition: inline
In-Reply-To: <503bffe670b24aac0dfb03c8fc16437b8f0cca58.1657215044.git.robin.murphy@arm.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
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
Cc: linux-tegra@vger.kernel.org, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, mperttunen@nvidia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--c+67CJDB9HiizjPT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 07, 2022 at 06:30:44PM +0100, Robin Murphy wrote:
> Conditional registration is a problem for other subsystems which may
> unwittingly try to interact with host1x_context_device_bus_type in an
> uninitialised state on non-Tegra platforms. A look under /sys/bus on a
> typical system already reveals plenty of entries from enabled but
> otherwise irrelevant configs, so lets keep things simple and register
> our context bus unconditionally too.
>=20
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/gpu/host1x/context_bus.c | 5 -----
>  1 file changed, 5 deletions(-)

Applied, thanks.

Do we need this in v5.19 or is it enough if this gets into v5.20?

Thierry

--c+67CJDB9HiizjPT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmLIP+4ACgkQ3SOs138+
s6GhBRAAwanw1vAqG944lpU++RQCxMXnWxXKI1hwybu+US2ZfoYlbomHu3Bs+MXa
i+clodQY6naysqAsaC1UmJEfWN/edFqzlB27hyHgw5WtouLz2Oo83UlrOj36e2je
oZFAcnVHuzkYZkHJLlEMN9UQrD5/w/e+smKDH4exp6tsE46ya/AaUlfYZfZxed1K
Roi+2BZtPZ3UEq6KoZemRfepZwfueg2JFJWMurLYX3MKNDIFe9Igno439FqubKoR
mK62xFnWnLQgZcuvyoDbYPrgoU0h3QInwhHYK6Xg8Ai2Mjz9Gu88VQNknWslS1FO
iiNWTJ3RjAyxxvaTyTezKAxRXF2FdILbllHdRspilbRqfmdhpNZe0FsvYkBUC4nq
oZdzcrDAJa1G31NFrX0bOBGyAJYiAoGTX26NLBxGelyabX+QxfoPPDGHPhsXoG9g
9OlR4qu0By6+Nn99ZpD9A3FB1Z9L9qVI85feFpHXCCMwka5soPnxWej2EkRvzsrG
ASmOd3/K+OpQ0GAZwgsSjZ0IGf/VnWxbDUE8Kz7eXQkEz7A1MyYxgLWyx83NAlGU
lDh4n3VicTANSspDGGxdC/j9HaLiuDfSuBvglPJAKMFnKVl2ZRROZAU//ZZ3YjYg
F5ZlQ8FtvyV97McS2BCC3QUPLFpaPjDgUqkucr0o31lSOlyKtLI=
=8Mh3
-----END PGP SIGNATURE-----

--c+67CJDB9HiizjPT--
