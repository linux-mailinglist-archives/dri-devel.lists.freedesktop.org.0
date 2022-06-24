Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 731C5559E7D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 18:27:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 768A510ECBA;
	Fri, 24 Jun 2022 16:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DCBF10ECBA
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 16:26:57 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id m1so3830803wrb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 09:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=AYBPwF7uWIloDNYt/QphPzAZXxTZcC03d+PPytnRwV4=;
 b=mimzjrl/A6qU0/5rr7lNYmMv2tJhodCuBM5NpFGwCSRaR86aqKpwv/A0E5I8XgTcbr
 fhRD7ZQQxqAgmClbXZnR54ZZNXThxu4ahODR30Fo1QO4NHbv2dHERxdhSVhvmP7m35Zx
 P3FBSvAZPUW+Xu5+e/0e3+Nl/Z9Mp7puaRCJ2+akNawws+wPa8d2h2I2A6tRT/u5C86B
 nOQHoVIaVhsVYEKKiSeuPsJiDhzXiP66Wbya9WkYGbe7m1+QNZkuqw9LYZlBeFll8URZ
 NWECCncB+oN6TRUgY/51UZJxR1kNhIRwOMHsWVbuhMdioWkyeMQ7SrZJW+UFh/IEuoW9
 ypzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AYBPwF7uWIloDNYt/QphPzAZXxTZcC03d+PPytnRwV4=;
 b=Uezd+TKQ3c+rMEQ7NPL3e4wu759FKPviMeNi1RxpYezvze1IOdw1PgYbfjRGF744Tm
 qRhoDZVgMtImIs8tdJoEI75A9JCjPcjhe5EphReXtC7/Fr7R7imWFUxBG33SC/kA+/mW
 bs0xBL1S8YqpdvE7PglW6tCEgYtMzNfO+w1mXHJ9GRxen/EGp6vRm4ExTth1eD2aHkHQ
 o1wP7/eHJgbVk7PbxBKLlL0Og8tFuB+i0cYEcQ6rEQnahV21Lf2PtVNPbO44hkvc5Okc
 a85Gud5JJwiQ4/L7KI44bcNTydNdiQqOJ5SOO34F+L/xeB7bUDyMFdqnpGytMhar4h3o
 4mxA==
X-Gm-Message-State: AJIora/pZKPRfABfe3mifS5alepkBq4UAJ/piGRcN81VhW3+yzHI/Pv+
 P+qhM1lndM1j5qP/yGrmxMs=
X-Google-Smtp-Source: AGRyM1v+N3LKkbjjD/Y44CNLdhyBhCqakzmU8gne5rz8XZ5zNdfvBOpmiM3UKIygTyHT+0oIoj0PUQ==
X-Received: by 2002:a05:6000:1d98:b0:21b:aead:9b6c with SMTP id
 bk24-20020a0560001d9800b0021baead9b6cmr5798557wrb.531.1656088015980; 
 Fri, 24 Jun 2022 09:26:55 -0700 (PDT)
Received: from orome (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a05600c28d200b003976fbfbf00sm3340148wmd.30.2022.06.24.09.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 09:26:55 -0700 (PDT)
Date: Fri, 24 Jun 2022 18:26:53 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: rectify entry for NVIDIA TEGRA DRM and
 VIDEO DRIVER
Message-ID: <YrXlzY/tGl9CA170@orome>
References: <20220623095452.30745-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WXw1FbmeQU/+1/K2"
Content-Disposition: inline
In-Reply-To: <20220623095452.30745-1-lukas.bulwahn@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--WXw1FbmeQU/+1/K2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 23, 2022 at 11:54:52AM +0200, Lukas Bulwahn wrote:
> Commit fd27de58b0ad ("dt-bindings: display: tegra: Convert to json-schema=
")
> converts nvidia,tegra20-host1x.txt to yaml, but missed to adjust its
> references in MAINTAINERS.
>=20
> Hence, ./scripts/get_maintainer.pl --self-test=3Dpatterns complains about=
 a
> broken reference.
>=20
> Repair these file references in NVIDIA TEGRA DRM and VIDEO DRIVER.
>=20
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Thierry, please pick this minor non-urgent clean-up on top of the commit =
above.
>=20
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thierry

--WXw1FbmeQU/+1/K2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmK15c0ACgkQ3SOs138+
s6EvHRAAj5Sn5POcAeo1gyPgf25OpMA4+Nq1XJ9gk8Zi0UKEtV5jh0ZwmhaDKizm
pcOi+xqYXm7QDe39q6P7BiQ8kUVlhGPjL/CKskcbYTYWIQbaYxdltwJKWtDa6Je8
xpsGwgtQMBXZ0DChn+pWky2mrjN5D1r6ZBUIGHdfcb0xFf2PPj9bIcsqxN05S/Oc
xZVb3MVMaGbYKK1HIOAlwIByk5/NFBoRYr1ygVFxovwMjddvg2wDwSPfx2Ed2CgQ
f+wZyJGloC98bMl25pa/PzYWdPOSA6c3DSwwt5jSCTXYjboo7TXfw84hfLe5bI4t
PahEzkik35FSjYTi0ZpOICKLRE2pGGSZvS76J/vRYySy4MOjHY/TJkcoBQy/5MVb
+jhGZTUlSAzoZ+gmeVBkylwKJJyIe/DpHGQ1bABsls2HMkkAjZPRA6lyxrnqB0vy
h4D+srDkbnAh6O35nw3Q80HvujztmPce+VW6W8vgRwKSOoWvLCQon615lfBbxUFR
SOVnIDq6Va7t+29tJwzikYstxRoNxC7EHzdhjwc2SQmD2i7nEJPhW5ByJXrr/y2b
Tlzuv6VUr5BqOAR/pP/g2lohdqFah6gVnBv/0CqD/8jGGnpMLXER+31H0HNzoKTS
EP2Hy2m6ihgTJ8VX9MWjjzqF+oEXbFF7Ziy6yjyl9CwJGpHCX3o=
=0k8q
-----END PGP SIGNATURE-----

--WXw1FbmeQU/+1/K2--
