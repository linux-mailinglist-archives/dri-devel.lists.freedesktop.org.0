Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B534C46E4
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 14:50:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8486310E76E;
	Fri, 25 Feb 2022 13:50:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B5EC10E76E
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 13:50:40 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id u1so4601390wrg.11
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 05:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ATbGzyh3Nal8Wuh5ClbaaT6PS0PYPkn30M5mIo7tHlA=;
 b=eHwfx0elT0X2NkL9uZ0Nx5YpdEwcwV3MvfmoZzOcHPMysBfwnN9bQ8totyEwfdnOTH
 h3fdfuDwaEZti3nCN2aRrp22fgLYK8J+hzaRxRZ0n73i1aK8TFAJ9BOTyItMO7nx4Nxs
 IEIZxvAIsAewPVjM8h1Efr+nGXBHdFTJXfJJmw3c4xHg8rwYJiCIiBcJS+8b9aB1qgG0
 QmkS/hHGv7NbNksohZm0DYUVbxCIc3B07nxkd+I2MrX5K6l+OQtowoSFzMKqCIOs3anL
 JIQgt3NgeiaY86OR/QQvsJ8/3oG33Q/wNH67cTjEdaw57uoK9GKvf6ejsDrMwx/Woxed
 /rIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ATbGzyh3Nal8Wuh5ClbaaT6PS0PYPkn30M5mIo7tHlA=;
 b=bObc4Avj6J7Uj99Yq4cLFegCTufiAsDv4hl37jYxBxOc8YtbJTGEUjRt02VZW8uOom
 4VnRSxrTJAZXuEmlVjuvzLb2seBq89GMOS2UVVIe4gpPEw2vzcrEI/IiPgsBhmW7Hzac
 Nn3FCeV09hfLsD0ZiKxEymJglgDygARnxQiP5+c6mj1Uo+ken89mJ3sW2xCynORYiA2C
 0jG4CCo9CBhXbSarkV9ybPxppAfv4H3XJ9r+3DnyH0nardP7DFZrlLmhM6pAvz5PfnyB
 aUgme9QnIa2z8PzeZm6TIn8rQIJ9+LkffVwRnS69eMo2a7YTJ0VZk7+T8czIZhrKXzf8
 NlhQ==
X-Gm-Message-State: AOAM530kFlltD5RYz8EFbLmUICShkWodOExaA6k26QGrtPRwk4ZezeHi
 7VYPJx+eWv0PT84ItlF6A5A=
X-Google-Smtp-Source: ABdhPJw5fB4ALqWPdoEsUzsC/EipwrABWUhkidfssIRytK5jfvKZotEhlxoW1j6QMSoUcsjLGy2QbQ==
X-Received: by 2002:adf:f049:0:b0:1ee:7523:ed53 with SMTP id
 t9-20020adff049000000b001ee7523ed53mr5195669wro.586.1645797038349; 
 Fri, 25 Feb 2022 05:50:38 -0800 (PST)
Received: from orome ([62.96.65.119]) by smtp.gmail.com with ESMTPSA id
 t9-20020a05600c198900b0037bd5fabd10sm2896563wmq.48.2022.02.25.05.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 05:50:37 -0800 (PST)
Date: Fri, 25 Feb 2022 14:50:35 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH 1/2] gpu: host1x: Fix an error handling path in
 'host1x_probe()'
Message-ID: <Yhjeq0yIjq0knq8I@orome>
References: <05c1932b66048ebf6742705e2ab16eea852c46d9.1636319710.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vyHKb89PagxoToVb"
Content-Disposition: inline
In-Reply-To: <05c1932b66048ebf6742705e2ab16eea852c46d9.1636319710.git.christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/2.2.1 (c8109e14) (2022-02-19)
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
Cc: airlied@linux.ie, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--vyHKb89PagxoToVb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 07, 2021 at 10:16:25PM +0100, Christophe JAILLET wrote:
> Add the missing 'host1x_bo_cache_destroy()' call in the error handling
> path of the probe, as already done in the remove function.
>=20
> In order to simplify the error handling, move the 'host1x_bo_cache_init()'
> call after all the devm_ function.
>=20
> Fixes: e3166698a8a0 ("drm/tegra: Implement buffer object cache")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Untested.
> I hope that moving host1x_bo_cache_init() is just fine.
> ---
>  drivers/gpu/host1x/dev.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Applied, thanks.

Thierry

--vyHKb89PagxoToVb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmIY3qsACgkQ3SOs138+
s6FT3Q/9F6ouUGIx+ao9mlUapqMP8vnTVr9d0cxp5t28yWE8LlqPzzPSxyxomgUn
mowdGHqZHQily8pApgMRGONs4pdgmIiyGcvlcBgcY5Iby/PXHjupQL/bvkv732/w
pg3hzpTXauvOnTvfhhphqVkg2NSONrSW9i/TVx4Qik5vG3c4K35khMpFzy58xvsh
8ejhPJpwo800XNlFZelmOLgurB0wk3TBTPDLLgkBveQGAjOFmjuJObE9TqnLXcJd
h1Fd42Upp6OD3Fnpht7EoDKeXlQAJCT76yYCfIl50oFv1+UVp6CURk7v9vg8beDz
dEIFSswA6qUOYE1/l9GvY/I8uaqPO8N+1kYeUxQ52sNQrwU0dDRbsgw/xSihZ+uC
wrIrkOOiM+FExKzPzyxAunJP5ywayyjXFdbJ87XuCY3C1/EJMoqDs4ln/j23m33j
Sz+3qWMCbuABwjePdUloBcbVaeaJFAuE9tIeVaA5EMPmw0v/DnNOBRzJTr8N9dQX
zooNMwZqCXIdYisT+5AovG8pGTSnN/WQ5tRdME6qlPTDhjnlsmJbtjcgX4vb//BL
0y3lKvbmAw+qGmSVC7VRYteW4TQrmo8g4CKYQqhFAnWk0YtME+MBGX08ri7gY1Ck
okeFaTvJk6CAG1orZTRdokMiRgnW+sAzg/3TF9YUdLoi0/9WXLw=
=WtCw
-----END PGP SIGNATURE-----

--vyHKb89PagxoToVb--
