Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C89153A95C
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 16:47:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EDEB10E779;
	Wed,  1 Jun 2022 14:47:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3589310E779
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 14:47:13 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id fu3so2784543ejc.7
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 07:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ib+2pdINzY13tkdFt/33K5unpLr9MXTZJAeLRoX/j+g=;
 b=DROnEQr99X22rbQ1+IN6Bd2hcrecLS98ZlfjXGQrYLXsPHAZUnfNxO3bKavaeYm/ZM
 610HvsocXO9035hSJFF8uSJuRvuvgGENggHH9tC9Bj09gd5Ydr11Nh+sWirHDw4khkhe
 atbL+YCXqWBIkNlbk4xTJ/aQZXq+c7gCOyBcqDygeciNN7ItISmi1Hmkax3WjbEHVHwJ
 1QiEO7qb56NkSbk3RO/cDojFxMjFbv5VJ0xxGm10zeprHsTf+YSNZLCF8CO7GLdT4z42
 K1CCn4IhdxUOsfSuRJYu25If481vgebF7Pyd9/FZdO4tyw87/VBadxSrGryXJ09M3bYv
 1HGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ib+2pdINzY13tkdFt/33K5unpLr9MXTZJAeLRoX/j+g=;
 b=lGYevuNDa4LUEVHS93OqNFqImQyk0+VIOEWwxVtpI4lduXOBVo41EQSU+9JEt+oK/f
 9dwG1Aor+SFgGx2+Fr8aX6a5cFTmpUqjNb6ctFlBD4pgGvmmWKG6++bUOBYYhD3u5yjw
 eYVo+7JCkp3okDgG8/02J7sfRs156+A2IxiXrGiTSgINFFEQWyl+FZ8M4YlVkR2KTGJa
 PnF9GeQJjBjbCB+YjZ/e82Ogp5UTSFZIX6x40JWzkPQV35NDjjKsdQSyMatL9OW39evA
 sc1W6aYOHbjMqlJP9zkOcZcFfhefFgVLFLThDwURQtK1UWv9KewFztRP0qPp891v5mHj
 v+1Q==
X-Gm-Message-State: AOAM531bBxj7yHtsyiX8SeOFqvMrxC4YD6M0T5lnAbi2ckprRNVsUaVN
 /rMDlk4BDbV0Z8aIRQKUBVM=
X-Google-Smtp-Source: ABdhPJzTh2kzz8vuZag+D3UadxCCSgbVs/EirqIqMjSCoVPYcUiRIijpnuh+g+g7f7kDT3+EpLmv0A==
X-Received: by 2002:a17:907:97d5:b0:706:76ba:f28f with SMTP id
 js21-20020a17090797d500b0070676baf28fmr203512ejc.367.1654094830518; 
 Wed, 01 Jun 2022 07:47:10 -0700 (PDT)
Received: from orome ([62.96.65.119]) by smtp.gmail.com with ESMTPSA id
 qw8-20020a170906fca800b006fed40e5564sm783328ejb.83.2022.06.01.07.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 07:47:09 -0700 (PDT)
Date: Wed, 1 Jun 2022 16:47:07 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Miaoqian Lin <linmq006@gmail.com>
Subject: Re: [PATCH v3] drm/v3d/v3d_drv: Fix PM disable depth imbalance
Message-ID: <Ypd76wmrBsIgeE3O@orome>
References: <20220601122050.1822-1-linmq006@gmail.com>
 <YpdpCWW9+igsVydr@phenom.ffwll.local>
 <55d99105-8492-e020-bed6-82e52b5fc8a1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UFHMz0lUhc2lO5hB"
Content-Disposition: inline
In-Reply-To: <55d99105-8492-e020-bed6-82e52b5fc8a1@gmail.com>
User-Agent: Mutt/2.2.4 (c3baa83e) (2022-04-30)
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
Cc: David Airlie <airlied@linux.ie>, Eric Anholt <eric@anholt.net>,
 dri-devel@lists.freedesktop.org, Emma Anholt <emma@anholt.net>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--UFHMz0lUhc2lO5hB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 01, 2022 at 09:55:02PM +0800, Miaoqian Lin wrote:
> Hi, Daniel
>=20
> On 2022/6/1 21:26, Daniel Vetter wrote:
> > On Wed, Jun 01, 2022 at 04:20:50PM +0400, Miaoqian Lin wrote:
> >> The pm_runtime_enable will increase power disable depth.
> >> If the probe fails, we should use pm_runtime_disable() to balance
> >> pm_runtime_enable().
> >> Also call disable function in remove function.
> >>
> >> Fixes: 57692c94dcbe ("drm/v3d: Introduce a new DRM driver for Broadcom=
 V3D V3.x+")
> >> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> >> ---
> >> Changes in v3:
> >> - call pm_runtime_disable() in v3d_platform_drm_remove
> >> - update commit message
> >>
> >> Changes in v2
> >> - put pm_runtime_disable before dma_free_wc
> >> - rename dma_free to pm_disable
> >>
> >> v1: https://lore.kernel.org/r/20220105120442.14418-1-linmq006@gmail.com
> >> v2: https://lore.kernel.org/r/20220106124657.32737-1-linmq006@gmail.com
> > Maybe a bit late since we're at v3 already, but are there no devm_
> > functions here that would dtrt automatically?=20
>=20
> Sorry I don't see one, or we can use devm_add_action_or_reset() to add ha=
ndling
>=20
> action. something like disp_cc_sm8250_probe() in drivers/clk/qcom/dispcc-=
sm8250.c
>=20
> How do you think?

Looks like there's a devm_pm_runtime_enable() helper that does exactly
that. See commit b3636a3a2c51 ("PM: runtime: add devm_pm_runtime_enable
helper"). I haven't seen any large janitorial series yet for that, so
perhaps it's just not widely known yet.

Thierry

--UFHMz0lUhc2lO5hB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmKXe+sACgkQ3SOs138+
s6G5NRAAm+7+JLpQwcbmQEA9ILZ74xJkjZz+/ZlHJU1BF/IDWqOJWT2fWdrNKS3H
JOYpuq+LENvxoU91xe3d3yXMADFU0/v97apTBB0UJbZZTD9Af5xwhGGziAIMmPdD
6ZMO5Jzq9x/udiLjEdLV1+kNt0RE40MSD/ZmrhxRnFPjrLY/AKN6rsT87BbXCd0j
w0thsxX7OtqSv1ovYD9+aEaKU4ap4ukib0dwwkkyX4pAg2p0O7D+pRk66/BDU4Nd
3iQ3NcuwOQj5ErJ2QysygElOHzk+lhJG4BkLI3IJwFrSqFWNRjrZ1TpHlo2Nt2xO
grlAni/O8erj+EnHk1VabGGmdAEGxtL4dUZmxpZV8w7VQz5ehh/OTpl0JEUJIOCp
U9bAQCqz/9D/xE906HQj2yyCYK0lofORQ8PgASntx4uvte7CD2SorS+9Tp0L//Wd
TlmzW+idcF8/ELfHvhRfyhp/DqGuUh4UI946qmEqEYkW/YWAMXgYm1h4jGwY/HCn
ATw3HDq8IzOuKkBji3ClrsFPw7F8kFSgi5ysouAUeMAz1itZX67TQSPhrw1VporY
zTatyEfZo5aesC5d+E6/d0IdvgidiPVdTDn5mOLL1ceme5umt9zX0Fg5+Avq0M4o
MPnGHIgZR8U72nAqdWQq/c7BsgFJm7SGgIGUIIOmViOn3FN0IVk=
=5P+q
-----END PGP SIGNATURE-----

--UFHMz0lUhc2lO5hB--
