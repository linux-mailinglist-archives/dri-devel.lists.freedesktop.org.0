Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 619284775FD
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 16:31:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B7A510E9B8;
	Thu, 16 Dec 2021 15:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11DD810E9B8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 15:31:26 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id s1so10765243wrg.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 07:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=sts3JGyfN1WuKgg88vZXBQQlHHEJeYISoHb+lIrYjpI=;
 b=OI/lA3kVbaJDD/afsQSi+J36E2JqDxVXvOowE3TBOFNTrX1O3LczxrTihQ1jr6Ux6f
 ovaLEraU36ANee/qN+2S8S2u/FdMucEzq/hFYUrnE5bdNBZUd2/3iL9s9yR8moc3CZMU
 Ag5+NZCv2EM7gw8WWiN98BkkFWIS5jCXHKWRcq8FrmRoZ5HDS0i5wSh3wcN+ZOwrtWWO
 O7YH0NPO0KSE+LDkUNWT/cRYfL/tKOdqbASlL9LB5xUnPbcqkw5Qjxu+maa3lETPxwPK
 Nnz1cAva20b7kryGV92hhutdsvoEydLKblUacrE1FntjJzhyX0BXb0uozsSWZ4q3IKDQ
 psfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sts3JGyfN1WuKgg88vZXBQQlHHEJeYISoHb+lIrYjpI=;
 b=JQantEGqIQNwbw56gLVuJp9X/OBy+z2e5L3EGmsNFq2VT62eCsZmKmnDc7WF0OUrRa
 KbvXdZTAD2I89lUMf5plDm6GJdjzxj29nKJVd+d+wrXgzMKkheVbCu3jecsRlhg6GJiJ
 jbsDSFOlP0CcwUt0zMeG5AT0eTNuZHse1wy4NVBere+kHsxtBz3oydK8HbcdT31NfwiH
 boX/J8JhSABg1k8MDpqQeBD13aciDlPyi8PiLnp4Enf2QUymrJW+zdi7322IUQLe4iuS
 nriIQ6EinHzhpdl1cj0rzVFwtR999Cx1SqZwelC0dNR24wsjvjSwcqdumVLH5p0whORA
 c3yQ==
X-Gm-Message-State: AOAM531vR8f296nd2+HX0B/5+GfFVZ3kERJqbiFoVQwFSlbCTGVnw0vQ
 QoNPaNIJgtuJ2vL5z99NHcY=
X-Google-Smtp-Source: ABdhPJx1GRSUJgkEQM02MsqnuDNU/r4aWmqUaySJJcyuR/EPQN8tAfIjZJbeWsV+oiDXQvB/S//viQ==
X-Received: by 2002:a5d:6d05:: with SMTP id e5mr7296693wrq.460.1639668684641; 
 Thu, 16 Dec 2021 07:31:24 -0800 (PST)
Received: from orome ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id d2sm1204462wrw.26.2021.12.16.07.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 07:31:23 -0800 (PST)
Date: Thu, 16 Dec 2021 16:31:19 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 13/22] ASoC: tegra20: i2s: Filter out unsupported rates
Message-ID: <Ybtbx8gQJaSsOjGM@orome>
References: <20211204143725.31646-1-digetx@gmail.com>
 <20211204143725.31646-14-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="S1udWQXOrWShk0yg"
Content-Disposition: inline
In-Reply-To: <20211204143725.31646-14-digetx@gmail.com>
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


--S1udWQXOrWShk0yg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 04, 2021 at 05:37:16PM +0300, Dmitry Osipenko wrote:
> Support new nvidia,fixed-parent-rate device-tree property which instructs
> I2S that board wants parent clock rate to stay at a fixed rate. This allo=
ws
> to play audio over S/PDIF and I2S simultaneously. The root of the problem
> is that audio components on Tegra share the same audio PLL, and thus, only
> a subset of rates can be supported if we want to play audio simultaneousl=
y.
> Filter out audio rates that don't match parent clock rate if device-tree
> has the nvidia,fixed-parent-rate property.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  sound/soc/tegra/tegra20_i2s.c | 49 +++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--S1udWQXOrWShk0yg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmG7W8cACgkQ3SOs138+
s6HSMxAAwX26l+Dg3mv4WaTtS1H3RdqOzt4vyKt0XKp31P44er319zd2Zg254d+i
TawtYdaIqqfVp0nnU21mXGkCdKeI3PYuKMAIkwxr/oqKEz0DXJ3x75+MqGDkX1Xb
CI8kio5xGDi/8WDUmEaItKjlQtysVAS+cqxVpJ6sQ2dCuG03laCvX/P7y/41nYDE
8cVJwGIUu4e7yQ2E9yi2kJqvOfFn/NyA4tyPjAYpFLRI0LiaHioczQNKGkhr3Ecm
FA71vbV3hF/pJ2ygRzKbHKu/9PE08xKkOl6pWgFJSkJ8LGXZjGs5Kx4f0V97r/hK
BrKqrPgG06GCrbI8q4UjGh18GKe4tt1Cu7cX6ak+t6s4tqvIVF45dHFPlHnltpFD
E4x83Tp0qJdcsAOEI8HdnvcIeCKXH9Pz5f+ekHaAVrify7kb+He2L+7b8GzEYwPz
zx5pG+3XisWQog3Ir9UJn4S9SxzLG66SQRVV0tChf6HRbBHp2GqnlmzlJk4nh69+
pCdGvwBd+JGXiuW0EEkh4eGdhYvN7rC9B9gTIJXBGtvEW7qRApHzMtSs8+LQJtat
apPcE2u1SQIL3QWH8SMNZjdkYOIM4CTkrLK2WotRkJajW5mmt7NZJMEfkSjGiOzL
eNMAkyoaWEU/Ne3yVSXk5P1nIvrecBIJnQMYh/fpb8tyFzgPDVo=
=8pKh
-----END PGP SIGNATURE-----

--S1udWQXOrWShk0yg--
