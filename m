Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3952600F62
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 14:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD5610E450;
	Mon, 17 Oct 2022 12:45:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09C010E450
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 12:45:09 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id 13so24665717ejn.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 05:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HWmxqGF/038fMoL0OujOGP+aUEXKzs6WrKb2H91XwNw=;
 b=EFPUYe56DLRb3jgtTvrgrWMjZcb2OFrMZW/fKGOSYVmpPLtM+MB1FhSMEMTC+mmOpM
 oZKQzByoqLHCiacPyzOg15lHZW25asKMonWrwGf9xFik0n3XFA4GipB9Skv3lYTtGBrw
 2HAIRwA+aw3ygewkI9Au7Hn1qKd8Z1s4qsnLPkAC691hzgDKgJojC8AiH1QvzC7MhkCp
 lD9qpS45onpnbXrBuxbQtCy56E+lWY8x76Tio4rOVKtGK3ixVkOlyDVP00rppM5U+bS6
 cLTUGnW3R3KVOrSo9uh+EWC2TYXEIJfMFLK8cwKb8pF3BqOztV6yiV0Z+WISL50PNpYq
 AbDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HWmxqGF/038fMoL0OujOGP+aUEXKzs6WrKb2H91XwNw=;
 b=PXmQyXPGbi1zl+shD4KNQbq7yR3JG25I3unGkboR8nVL69nw2kbaPDgrb+e4/37qYQ
 44+TKCj3SFuKVtEDICL7qz7zqi32u+xWbRORINj61+RApzumU9mqFBMTI8brLc2OKHCe
 aOL4sMADCbKkUjvTWU8CfyWICfjO2BapyT2+aLgGD0VUQE/C/epwk4d2EYt3jsFRu3wK
 T46Sv/f3gFSr4nQdbMnxkLyPRfC/1gX5eZvfXZL+ULb8kOFwcgpRIfHzJAIu/DKXYkTY
 m3z72DLO4RIFkoZ5uoRhjrXr/AODrY6aceGogalkCZ5axWovRl7eGi/LQQfj47NS5Cih
 E26g==
X-Gm-Message-State: ACrzQf1pieBbBo48cB3ErrwoT8L4KkV9RW4BOkBr7MfpiJIf5jtwx0kG
 YRySy2vjJtV3PZO15brb5F8=
X-Google-Smtp-Source: AMsMyM7mhW15Nb2oDKxIsTla97uYTBzTlYARXy6rnD14TSiS80WugSwHh2x9mLvRwyzeCzQXuBw9mw==
X-Received: by 2002:a17:906:5d04:b0:722:f46c:b891 with SMTP id
 g4-20020a1709065d0400b00722f46cb891mr8593565ejt.4.1666010708172; 
 Mon, 17 Oct 2022 05:45:08 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a05640243c600b0045b4b67156fsm7294536edc.45.2022.10.17.05.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 05:45:06 -0700 (PDT)
Date: Mon, 17 Oct 2022 14:45:04 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Remove "status" from schema examples, again
Message-ID: <Y01OUPVLczqzuj3b@orome>
References: <20221014205104.2822159-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ENKGIPZJ+FvcFLFo"
Content-Disposition: inline
In-Reply-To: <20221014205104.2822159-1-robh@kernel.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
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
Cc: linux-iio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>, Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 Rashmi A <rashmi.a@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Sumit Gupta <sumitg@nvidia.com>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Nandhini Srikandan <nandhini.srikandan@intel.com>, netdev@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Vinod Koul <vkoul@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ENKGIPZJ+FvcFLFo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 14, 2022 at 03:51:04PM -0500, Rob Herring wrote:
> There's no reason to have "status" properties in examples. "okay" is the
> default, and "disabled" turns off some schema checks ('required'
> specifically).
>=20
> A meta-schema check for this is pending, so hopefully the last time to
> fix these.
>=20
> Fix the indentation in intel,phy-thunderbay-emmc while we're here.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../arm/tegra/nvidia,tegra-ccplex-cluster.yaml    |  1 -
>  .../display/tegra/nvidia,tegra124-dpaux.yaml      |  1 -
>  .../display/tegra/nvidia,tegra186-display.yaml    |  2 --
>  .../bindings/iio/addac/adi,ad74413r.yaml          |  1 -
>  .../devicetree/bindings/net/cdns,macb.yaml        |  1 -
>  .../devicetree/bindings/net/nxp,dwmac-imx.yaml    |  1 -
>  .../bindings/phy/intel,phy-thunderbay-emmc.yaml   | 15 +++++++--------
>  7 files changed, 7 insertions(+), 15 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--ENKGIPZJ+FvcFLFo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNNTlAACgkQ3SOs138+
s6FjaRAAjTcwhjc2StE06L8/1hqmMcPI/MCBfZcFFcC+zH7z+tLcW29ZRegOLWAo
Rnix/qmiwHYlde5STzozQYYbrLGPN7rBoJKd5uDXwWc0fYOxosOHHDv3q/shRLO4
EpOLNfcMImYQPOV3ni8nH8mNdR62bloiyCz/qG6ASKu2x22ZmHpqYv1TC7H4WNgM
He1HB8XDWbgXdtsXDbKEEDN9gXaFTYCkPH3G5tRq7aWl6bIakBQRzPLjCnaUnznw
NgP7GbBHYIigaGGPAzSBjUHQuJ2zLithJGZ2ISxqGUrtI1dvw9N3oaFGyTUBOdej
sU1+ml7aIYT9bi2ES6xiDuNaVOclaefRw6GxwoRUGlcCa81/N+3zf3RlD6fZ0JxN
B3zvkKn0c7KoZ8MgpouBFNeC4aIO2VOB8FH5eGSnNwz5Sh1+MgIBMKlu1Hq/6zu5
Ih7hVnpzzLirkDdr1mOcnw/4Ok/z92c7UajhH2kv1iK0Z85NitRcCfvdexGoOsQ/
0lwQ4iZ5sMZu++FcGxPdMBiL0ehEbfhPKNjzS+44rbN6xldqYfyiTs0F+s8tZ4VR
Ak8u7RQJ/3zdYi4KH9BgyUeHh7AjyyeYcNAsk7DkuBFtu9GIm50vMSP4oMWShsZv
4omD7j8WnVAveBPTXeKD+1jQztY1gjGbHFSxdgZyKUpkgxb2/Jk=
=QfTP
-----END PGP SIGNATURE-----

--ENKGIPZJ+FvcFLFo--
