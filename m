Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B59A34C405
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 08:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 963666E160;
	Mon, 29 Mar 2021 06:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 880DF6E0F2;
 Mon, 29 Mar 2021 06:50:46 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id u9so17688867ejj.7;
 Sun, 28 Mar 2021 23:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=MRKoM7dLBS9DMoYGv5mFilj8qS/0VViXMQGlcQLXpXA=;
 b=nLSWHKf5KAmj1oGujUv1uA9+7+PNBOeKPQb5KRjdmPRLgc2Vy3m8JTlf+wSsNuwwLD
 1CLQ3o2yXPwTBBqemFJn7JxtFsE0fQSr7TOIdnKHXwzYhE4K6Vz7//alWLAJ339ziNoM
 +Dl/upjMwMrtkv6Nwb3fSQJhb4cqc3vhJ9V0r6eD92btN57tboCb2UUXPyrFjOAPsMkh
 FlKGNnvmmUGs6+3s+52a7yyww57Is1RvCbzWg7k/cK4g4fZZoTFp/BCKBpY1mrrXT2gS
 07B8GAqHJKhd7Mo0idhmeQ4P3WV/MugJ5YHungvXhLB2D1UATEIgRLTdXH690rQaSPZ2
 3WDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MRKoM7dLBS9DMoYGv5mFilj8qS/0VViXMQGlcQLXpXA=;
 b=VX44F9a/VFJJOyRpa3hCS++GNC6bnswve257KZYJF5VWbq8QARXbCvNpJogdR6//tT
 kcsVbrWq7cTKRPwurZtmAiljV2c4ZASLVQSrCEB1Z7cE1m33D/rhT159qxpcYsMmjXjg
 Rf7OUNUhwxz6NnLW5BU2al/x25ESFrwifigWWZRbihQsEVXj541PtlidW+fBWgR5/Qbf
 e+zAY4ofqgz7DDTyh6+bYUk+ITIVoq8dj3MX7xor5B303LO8eZaItSGcQHt5ijcIlUnF
 NIDx6qFugmspXZDS/Ov9E1SIjBuk7INxVdl7S4tScbsBVYzSlVz1ZJnGGiHyn0kV+0ZR
 HriA==
X-Gm-Message-State: AOAM530438dbe8SJpae86X6bBGfbWjl6ppOu2UxBFcdTCsqYGQPMwZt7
 0wu/qQGMrP6Txw5HGjDcErM=
X-Google-Smtp-Source: ABdhPJzkQD/gxtEB7aJEpelFjec40cUy+ftj4/iW4yoqa2XdZRoReftjFH3rK8clufBajPxwC4spGA==
X-Received: by 2002:a17:906:ecf3:: with SMTP id
 qt19mr26693818ejb.467.1617000645203; 
 Sun, 28 Mar 2021 23:50:45 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id c19sm8403325edu.20.2021.03.28.23.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 23:50:44 -0700 (PDT)
Date: Mon, 29 Mar 2021 08:51:09 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v2 02/20] drm/tegra: Don't register DP AUX channels
 before connectors
Message-ID: <YGF43W1kppXmOTwh@orome.fritz.box>
References: <20210326203807.105754-1-lyude@redhat.com>
 <20210326203807.105754-3-lyude@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210326203807.105754-3-lyude@redhat.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 dri-devel@lists.freedesktop.org,
 "open list:DRM DRIVERS FOR NVIDIA TEGRA" <linux-tegra@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0789543396=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0789543396==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3/3ODl/4QwGFlK0b"
Content-Disposition: inline


--3/3ODl/4QwGFlK0b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 26, 2021 at 04:37:49PM -0400, Lyude Paul wrote:
> As pointed out by the documentation for drm_dp_aux_register(),
> drm_dp_aux_init() should be used in situations where the AUX channel for a
> display driver can potentially be registered before it's respective DRM
> driver. This is the case with Tegra, since the DP aux channel exists as a
> platform device instead of being a grandchild of the DRM device.
>=20
> Since we're about to add a backpointer to a DP AUX channel's respective D=
RM
> device, let's fix this so that we don't potentially allow userspace to use
> the AUX channel before we've associated it with it's DRM connector.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/tegra/dpaux.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--3/3ODl/4QwGFlK0b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBheN0ACgkQ3SOs138+
s6E2+g/+IIUa7Z93weSOTP7EoyYiNnDgVw5B2vMst7Px4Nck336qqsZbv0J9ZQ0L
h5P0mlUejyzOxAshnHtiYejeAXTN1GbyFUw6GlN+EEaZFoPcOSkSszhaO+UWNERE
sIVhvhYtePlzA9dASwQtxjXYOHjWmBO1EcQaLCUjeI0bRAPKhlFjnpMM3xLRlegU
k4yJCJIwUzRTaz7AHESzqZney+D89lF2yl8PO7xn176KWR/bJwW7cozPvzLoJCdh
Qx8j3tXwGe11Ssc6EqUmuYOqNqIZQDLn+n+8PnEpRKebSr1UKj1907EtiUwsVPEJ
BdeDhJKMqNKX9Rna/4Qj+ggLrhAPmlZOeMqHe6oretW9JBQGBd54GcijZVU65SbR
LEaye5H1okuCEDPRCAswRBpkpOss8ri0BZtWecDzQvorSKq6pIcOL9pgBccasjHQ
k4/d0bDTj4qR8S5iqYs7IChTSTKIpd5UUVYCyVuiVoVkr4j4QxW3/zvffr/RtxmN
GEm3qwnJ6S6Ug3GH6Fsp7rNSWOxlhvEhet54IqJpAWUsKtGL3nCOEQ21xM87qUsh
Bl+xjmYrHzwOokbIT6Ee1aB+4M7GsvVU1tO3sW/djawCF/LjdBJDa7ZBQTy6lhRV
tRaDjz8d3XII/RohT4aLokZOpGop8lMWohyjqv8tWgiCpq5jWtU=
=BnXA
-----END PGP SIGNATURE-----

--3/3ODl/4QwGFlK0b--

--===============0789543396==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0789543396==--
