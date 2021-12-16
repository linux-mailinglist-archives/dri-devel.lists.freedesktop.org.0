Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF0E4775CA
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 16:23:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEAF810E340;
	Thu, 16 Dec 2021 15:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4230910E340
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 15:23:04 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id e5so11422210wrc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 07:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=CYj9Ti5Fz1gBasjmZUChCljCufoB/S9vsIkoqPg2LeM=;
 b=LTLemxb1FP6iTpX0FqdTf3ZYAFXDEKAFY3uo8UJCQMrttG/8H7/bHoWOa5rx/i8ld4
 r804GELD1w7olXyG9qg7spLjZRAGYdp7rs0zeumICvoYw/jLahaXrBpuV7HmQKrqd3LM
 3YgbqKpqYKUJhYhrsxEwEiHvb4Dm4MQcQxYe0mr4nXhrBSifXn4b74yl0uo7LfOlrHCz
 NECYqvVTYi18n35vAZ/o1tuBvNIiY+Q3Cb16sojfs0TBmt9DKxzN0I6xxNnNWr9KIJsE
 esincN1Za8oR0rR431bpTe5wvUy8NC8L5dAnRels1yuHPrdRfccZebHaoZK3632u92pB
 /upA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CYj9Ti5Fz1gBasjmZUChCljCufoB/S9vsIkoqPg2LeM=;
 b=NlutH4jDiQQ98Uv2ayCP7Upe6jz16ueY+hVIQIMHOVZ0ZyPF/j3VaO4PTTO7DDEW0T
 nWdnmThPPt0aryljBuDyX5WCOXZ9eheTyKFKqmU9oIhdLO9AzBkLoyEpxNjJCzicQDUF
 8odznNr3ws+ncGq64BhcIkUVqeH6QeZTsqFeLQ0CASySeAynGylpWEyNwuDvpg2tuNC0
 sABoIn9neyoFFKlUmGRFhTPTkXR5izDQnb9ZBwHS7xSwrTCr1LeXxZd2Foa5ArwkQ3Wk
 gHpM6uOAoWeRRrCCYtzBf3f2pNXlDJ1lqnGnAbfbaMz3zjOQWWkvSgQzBfQHkdUL9qN1
 eqlg==
X-Gm-Message-State: AOAM533p9OdGG16eOzbbwklMdfxLFtoNj2ai6hXuQmL2g6nBApUPnqgf
 zfCxCqhhFCMwUHDBQB1qNNs=
X-Google-Smtp-Source: ABdhPJydZjy551Whm5yD/fZHgAm5UZMb55oNe8NHznW7CKu4C9s4F8KgAmJ0kEUxEqaJ/o6UmVqTFg==
X-Received: by 2002:a5d:62cf:: with SMTP id o15mr4025559wrv.651.1639668182811; 
 Thu, 16 Dec 2021 07:23:02 -0800 (PST)
Received: from orome ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id y11sm6477355wry.70.2021.12.16.07.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 07:23:00 -0800 (PST)
Date: Thu, 16 Dec 2021 16:22:57 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 11/22] ASoC: tegra20: spdif: Support system suspend
Message-ID: <YbtZ0V4wt2HKPazO@orome>
References: <20211204143725.31646-1-digetx@gmail.com>
 <20211204143725.31646-12-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9NVu7ZJ+lp3JPxD0"
Content-Disposition: inline
In-Reply-To: <20211204143725.31646-12-digetx@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 Agneli <poczt@protonmail.ch>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--9NVu7ZJ+lp3JPxD0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 04, 2021 at 05:37:14PM +0300, Dmitry Osipenko wrote:
> Support system suspend by enforcing runtime PM suspend/resume.
> Now there is no doubt that h/w is indeed stopped during suspend
> and that h/w state will be properly restored after resume.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  sound/soc/tegra/tegra20_spdif.c | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--9NVu7ZJ+lp3JPxD0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmG7WdEACgkQ3SOs138+
s6EKCRAAkaJkIFGe+TIGDvf3VgojxAnoy/xehj12RZkWXIHCSj2L8Uxnkd2xS+Xh
ban5ECkhc2qCrux3ywGTAp6WR+DRZRF6uMm0MCMY98MCBAAhvLm4edllsC2ksiVI
rruKcqjeuD690pyKmVxpG43jJjmEqeDuwuOPtBIDWWcU0jym5v+X3T3Dae7TE1nm
jwvBQ3kpBaOb1eCEYI/JNv402M/e4KO1MJUAfKCoxDDgB7Zijv3jnRYMyT7AJtwQ
tk8eLpkI56pro+A89npTVm/YF/whi+RBd/fACHFHIVLWzih0i/g4v+mqRPzchT9+
7NfuCuRPiH1UUTLiXP0Yq3GW6jOiHAcdVFSTFpgmYxL/wXCK+CWYBIt0oN+clwqY
x1UxyL03y7+jcpp8JGA4qNe4fqZ8srIiEZQMNHFjto+SaCx34LNJ3PRp68iY55Ji
ITEgIoIIza5Ss6G1J+oZpEpYqg+qkx+1krv0BhramziMfvQTdd7Bdq23XRMj/Rwc
tAEe1oS2HiXt6u33K/Ft9pxxUhE1k7AhwqACUt97ekKT44wKEYYil9+eWBy/dR8u
kO2Q7ODb8Jarb6GrNG1OUtcnftrAngx0JzMH2WVoqPRLumrCLPUiiM1CCg3VLc2P
UNTrRK3LrBZsHznR2J05vCm/VVAWljBW5T4/dsxPf1oUTw5T+YE=
=8OvB
-----END PGP SIGNATURE-----

--9NVu7ZJ+lp3JPxD0--
