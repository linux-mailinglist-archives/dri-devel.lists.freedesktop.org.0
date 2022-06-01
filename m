Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DB953A625
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 15:49:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A1210EAF4;
	Wed,  1 Jun 2022 13:49:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C54D10EAF4
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 13:49:49 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id y19so3906028ejq.6
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 06:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QvjPKiOfGImvDjhqugo/v+WDsPZmegSZEn/73m+BNHo=;
 b=VsofI4krUYAalrek0vVuj2G9lgL2zB+ayRPc7dvQb0yrZjALbFncxV8nYffevYTxWD
 TsA2xUICUHHYTmxZvIY1ybVpQt7DbsU4O3CQmn8je1Mviid+N9Zp1KoxurVwFck1eQ8Z
 WRgkPY2drl74uhFbroh2Cm8DTaBqnvOyXudavdV/npNJtq+ramamNFRkcZASucsm9Yt/
 m4OB3EzPDMyYS0jLKXHekVkK0NW6aSUyVh47+3Mxk46w858Dv1QSKPrSPdUeqwnJNYIP
 qW9vpc7tVgEw+XLtUalL7v/Ezb1f0svDUE8KsqS4TcbP124qgGlqjyskpKP/2+JrPZu/
 jSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QvjPKiOfGImvDjhqugo/v+WDsPZmegSZEn/73m+BNHo=;
 b=2CJTsgOA9l2jpM59Pe2hctGE3jxFvKY/r1+tvmiVj8Sn5UL0xfvz2+nvNh6CJ3BDuY
 gH1FX64Yx/QwINVq8sqtQ77ML74fa/PEzSPCStAt6TT2sgZaN74rzmaci819G5xcmSaq
 sBxf9dqj91n+9CEQb9cVkHjzyBHiONIOBdPEQXeYaKS7kT6FMXFlkJ1cZZU5gjOU3JKl
 4wHQY9Y3YldafaRAMp03y14FzXy/phUHRDd/dTpwGViDHK6m6d6NKZcIhjGb2rQsTir6
 vW9P+ktn7xlbQ4GHIfC9n4MiDPDolHj94XWsD1lmeIfXx/c7LZGEhkeOQf6Iy4L/mXMQ
 TUFQ==
X-Gm-Message-State: AOAM530hR8vzpadCo1/KuZUVbrJpqZOODtg3kP+/qldKgfq+dd3/rAbG
 m8R+Zt7Pa7t0viU5s5gkuLk=
X-Google-Smtp-Source: ABdhPJz72ws/249EpRhr/3T5VKr7XNwzK/fi5VqwXYdvozLbMKmkovHMYPXoxGWRi3rpw5aHQ1Zg3A==
X-Received: by 2002:a17:907:97c7:b0:6fe:f7eb:be67 with SMTP id
 js7-20020a17090797c700b006fef7ebbe67mr41353162ejc.559.1654091387355; 
 Wed, 01 Jun 2022 06:49:47 -0700 (PDT)
Received: from orome ([62.96.65.119]) by smtp.gmail.com with ESMTPSA id
 fi26-20020a170906da1a00b00707d11fd421sm579899ejb.107.2022.06.01.06.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 06:49:46 -0700 (PDT)
Date: Wed, 1 Jun 2022 15:49:44 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [GIT PULL] drm/tegra: Preparatory work for v5.19
Message-ID: <YpdueBx4Dd5jRqxU@orome>
References: <20220601100335.3841301-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FgGGDq7yl7JL732T"
Content-Disposition: inline
In-Reply-To: <20220601100335.3841301-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--FgGGDq7yl7JL732T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 01, 2022 at 12:03:35PM +0200, Thierry Reding wrote:
> Hi Dave, Daniel,
>=20
> The following changes since commit cb7e1abc2c73633e1eefa168ab2dad6e838899=
c9:
>=20
>   drm/tegra: gem: Do not try to dereference ERR_PTR() (2022-05-06 15:52:4=
9 +0200)
>=20
> are available in the Git repository at:
>=20
>   https://gitlab.freedesktop.org/drm/tegra.git tags/drm/tegra/for-5.19-pr=
ep-work
>=20
> for you to fetch changes up to 597b89d30b42dcc8e6b262e6876b42dde66f97f0:
>=20
>   gpu: host1x: Add context bus (2022-06-01 11:50:42 +0200)
>=20
> I realize that this is quite late, but as mentioned in the tag
> description, this doesn't actually add anything new and is only
> to simplify dependency handling for a new feature that we have
> planned for v5.20, so it'd be great if we can still get this
> in.

I meant to send along this link for reference:

	https://patchwork.ozlabs.org/project/linux-tegra/patch/20220516085258.1227=
691-6-cyndis@kapsi.fi/

Thierry

--FgGGDq7yl7JL732T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmKXbnUACgkQ3SOs138+
s6FVQQ//VSSv2vgMgEmNhaI1F+gkKSB9H6aXVDbdWOR0wXU88y8uuc2LyzOGjyb1
rQoc/aaVqDOxFPx7inPKIPleITI/0ubeoaMqkBuNoC/rumE4BN2hmyk1J6lj79ZL
pUA+YAByEBlcH0axu7lmVtkl2HCpJGkzJIgyr0Lt207TA13uPe6SXsrkzeSE2M0p
k2lbSUu7dHKN8cTO+1cHQaR9KE2PceDLfsv95P/iNNvDFjfZyuXtfCj1O3mQS9RT
oQUh4uUwmFBe30hnJzxCCL2t+GDiNztZn5LQzk7nvt+iWn1xAyWNRtr85SUxLCqp
9TQMSgxWxXawoOrbJg2ODaxc6ZKJHPfBws6joPb4Q+SuxLGq4r7FkiFx1YZB5osn
uqCl+env+w8B+JFbQkSrufMHfQT4IpkZOEYgPUFkAFsUglpPYmmzCdnM6AD+wsqE
KMx8dBCmnwPg0VZehY+yQ60FHxFrLtTeqlVn7cS+JMLThGczT6mCGk6cLAb57Vp2
PGC0aDWA6OhfLofojM2vE0b74BjrGKzApHzSFSWJbmND4cf/3OQnPwcCj9vI5hOU
V19W1XCk4TLpYmhX7jEyHFXiaqnYo0ufnIPRhpgwZ4EOBUFs47xD1rNR66Vk+7nj
3t+pvMtUHLvaWpqUzX4CBfHCHnsSRAGbcMq+6k6SOTk+bpTH5ls=
=xNsD
-----END PGP SIGNATURE-----

--FgGGDq7yl7JL732T--
