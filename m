Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C33E3813860
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 18:22:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D4A310E1C8;
	Thu, 14 Dec 2023 17:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F39010E1C8
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 17:22:44 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a22f2a28c16so369691766b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 09:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702574562; x=1703179362; darn=lists.freedesktop.org;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gskL73SYt1estiCHnemg6J9wLZhlZpDGrDz26SfS1rQ=;
 b=nGSp1NehBRFDZmdkolWwsZrBXTrQ7/9JY5N1O+O8mTiT4dTLmdEKLmFHqaPo8JFw/1
 Azv89ermc+amduEwdi8YKOXW9QpAHayXtSXeoPmhRpihADQuEpPRYWBpmMXXMDzJyaO2
 dlmeSdrRzAEhhU+ZZgy57ZIG8iDYLp7mC1osUKIzOjodFoUfq6ZNB5ZuJSioputLXyQz
 EQAYtdjljCGqKA41DdTTZ2SXy4HMqaT3kss+OcOlD2qBViiVDfxsrJj3+QybfvU9Sq+a
 PsVNGIzq9L2V4fD4YFU4mW8HX5koaTNmqfJ4jKC48OrTQRhBuTzH0MbWZ0mpQojhHuEh
 dRGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702574562; x=1703179362;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gskL73SYt1estiCHnemg6J9wLZhlZpDGrDz26SfS1rQ=;
 b=sDT+m3lkmJpk8xGSYRti9hfKQxC94WvJX2bGitt8WHr3fGrNqsHLLU6A5jeB3O0LB5
 SjNVeZ09f3VLo/xeV2S2jzdmIbMPpY/AxxDKrG72yDVZCvA5HlT7YPOblOjommPeX436
 h0jZYt8dA8p9NvbONToAq8DBFFXXP3NiIggMripRxg47bUCIKWAhC6vOroaghLsKdOG2
 6K3GFgpd1N65bqZdW8WwDqw8PZMdEUd2NRt5uAzLB99/yWlj6pqDZe21IcWgErbQSdNm
 FuBaKhzUWFHFujVbbpg5jz4LEDlx5lAacl/PQl4S0xPt9vMtK1rfSTgAPyPUwIhMGFrI
 lv/A==
X-Gm-Message-State: AOJu0Yx9mC+h8eWso3XOGxX955KeP5uTwtMAWN8IWxsDnrbgjRTgzPIA
 pcoKfM1uoIhNSAvt9Z/q8Qg=
X-Google-Smtp-Source: AGHT+IF+KLQnvjnbzXoYI+R/38f0suL8s24t04G0woQjI91W/htsUbhCdf6FFQDWE5tozKz9e60COA==
X-Received: by 2002:a17:907:ca2a:b0:a19:9b79:8b44 with SMTP id
 uk42-20020a170907ca2a00b00a199b798b44mr3290310ejc.85.1702574562332; 
 Thu, 14 Dec 2023 09:22:42 -0800 (PST)
Received: from orome.fritz.box
 (p200300e41f0fa600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f0f:a600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ty14-20020a170907c70e00b00a1d70804ac9sm9616950ejc.33.2023.12.14.09.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 09:22:41 -0800 (PST)
Date: Thu, 14 Dec 2023 18:22:40 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Chen Ni <nichen@iscas.ac.cn>
Subject: Re: [PATCH] drm/tegra: dsi: Add missing check for
 of_find_device_by_node
Message-ID: <ZXs54BYDq5Xjw3rL@orome.fritz.box>
References: <20231024080738.825553-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YoXO4vJu2jzRymw/"
Content-Disposition: inline
In-Reply-To: <20231024080738.825553-1-nichen@iscas.ac.cn>
User-Agent: Mutt/2.2.12 (2023-09-09)
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jonathanh@nvidia.com, linux-tegra@vger.kernel.org, mperttunen@nvidia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--YoXO4vJu2jzRymw/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 24, 2023 at 08:07:38AM +0000, Chen Ni wrote:
> Add check for the return value of of_find_device_by_node() and return
> the error if it fails in order to avoid NULL pointer dereference.
>=20
> Fixes: e94236cde4d5 ("drm/tegra: dsi: Add ganged mode support")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/gpu/drm/tegra/dsi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied, thanks.

Thierry

--YoXO4vJu2jzRymw/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmV7Od0ACgkQ3SOs138+
s6E9Sw/+K7E1zQycMWDojVUC/8INCGH/PyVX/VF6pPdrQBBeiV1SWW7eJZN8zBKA
oyjwunugLBII8F2zmdLelaSzmEOY+eFJPEBJG5/y0vCFi9qFaTOyktzbmp3qNehl
eM3oSKzIdxonwO7AH0HmwaTQNd4tZqg7A3jTWfzLv7iiCFMsniHpMcenz7pRHw5c
ogfDv6sSXVgvnFE/GSpytejr1sdb5lQKhv/LoqQZd2C1v/itwteZkzYn71CiQX80
BiwAvgWYlc+3A4WktF+i/Ybcrh9tPtmONMZg/OOriK3fQEE7sFwJ14CEIBxUlBhj
dwoFjqX9G/yu0WPgpNVTQvpCL5DuX4LR2i9nfDADbzMup5H8PXy7Z+fxX8jgFRko
XuuX0Vz72x5x8nQhSnLWoDqutW+XHzWfFFi8iLvnjoBZVXfnxjUroizZIvBRBIOy
BN2/bteLLMDffAMAJt80h5yI/iKidxoGs9SxfCzV7d3sNHl3aNwHSL3DOSDjsoYh
dp9VWzU9XUWE7mNMM39w3G2k1ARB9Dhm17qpNQPycWqrTmEhPNA5+u9aabYAeP8s
6YX5RHjUvpgmLZeOaMAULsJjJb75qvBmK6m5/MBVV6XfxUJgerELHZQ66lLXoRL6
SQ3DnmMzuriqg227ol9sE5qd1ve+DEKTPsSKcI3+uiW3NXn6u7k=
=NmLP
-----END PGP SIGNATURE-----

--YoXO4vJu2jzRymw/--
