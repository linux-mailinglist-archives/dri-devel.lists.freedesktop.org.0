Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DCC68EE6F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 13:05:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B69E910E752;
	Wed,  8 Feb 2023 12:05:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969D410E752;
 Wed,  8 Feb 2023 12:05:15 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id p26so50545078ejx.13;
 Wed, 08 Feb 2023 04:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Qf8E7bQwKhDkFIo8fdvSZrq36zm9wcv8IHaQt11ajo=;
 b=oEN4CSEWxG+jRpgPd3zzw3vZ4UL7U/vrQCSqUOTgSvUyrploJh15BBQH96YAdp3iue
 P3so4jJzKEEd/pD9Vay8+LpDGANKeXx6a9S4MOKUZ9u5D++ZQMjc8viwEJkqVt23Xcvt
 fN+F8Qnz8H/Qcn7x0gViOuWrmVmX9G8BENSvuNrdoUtru31NidxuYKPzTrEln8WvdK5G
 Y0ZoKB7k0Zvm2/q77YTlseZj5CDhG3cRj56T51CDRJORcNOs0gW6CYNlH4Hfn6vILQ6Q
 WAUerJ7SAprTzx2SQwDIjPbkAJ6VuyF2DWcA0y1VTETRFBWpAp6BpYabI5kxf/W+JOsZ
 jnsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2Qf8E7bQwKhDkFIo8fdvSZrq36zm9wcv8IHaQt11ajo=;
 b=W1PRUu8U3daO/0S9D1DZyBQJRpKOYkQG3XTqa8i816fsKX/6LkyUA0EneI7HRwVorz
 kRyAmCKiNYqIgc2vC5ipwJPJlSR4A1PyzWbxkTr8qlwArBc5Geg5t1PQU+ETwvHHFpsQ
 3Vcj3DrAbuEOn8+nl8Q0Bv8Qp7FI4AOgdbtSSmmvhxRRCVqL0qQpc11PSXCOQEEODWH3
 IZ2hAd6koc4hi7xbbRqAGHfSdy5Co174z+OxEO/Fj/dMJ3ihqyqEHjqqeFCz3f1LK8tR
 F5tYkEPPFUkMXD88n6rnbTEAfxZhUY+cx3sjjxb3dh4G1Au529Q/KopOFk+o9y0je78Q
 DQDA==
X-Gm-Message-State: AO0yUKUSArJvGt2kLJY7iig0sP9sl7MTW0eZDrt+A6ktHcWPLeUIMkwe
 u0dp2hARZWC3iV7zKoyRXgnrwYEzaN8=
X-Google-Smtp-Source: AK7set9o88ftQF7t44unq/PJDZHydQFg6hvfa7D9KiPzJcj5jy9UCnGpb2oFJAJfW9sjUqT+kW/eHw==
X-Received: by 2002:a17:906:b202:b0:882:239e:23c0 with SMTP id
 p2-20020a170906b20200b00882239e23c0mr7454586ejz.12.1675857914055; 
 Wed, 08 Feb 2023 04:05:14 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a170906845000b008784ecb2dd5sm8200157ejy.104.2023.02.08.04.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 04:05:13 -0800 (PST)
Date: Wed, 8 Feb 2023 13:05:12 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: jdhillon <jdhillon@amd.com>
Subject: Re: [PATCH] drm: Rename headers to match DP2.1 spec
Message-ID: <Y+OP+K5BJu2dVbjt@orome>
References: <20230206193708.82187-1-jdhillon@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SWA8unSNEqI8cGUa"
Content-Disposition: inline
In-Reply-To: <20230206193708.82187-1-jdhillon@amd.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
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
Cc: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--SWA8unSNEqI8cGUa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 06, 2023 at 02:37:08PM -0500, jdhillon wrote:
> This patch changes the headers defined in drm_dp.h to match
> the DP 2.1 spec.
>=20
> Signed-off-by: Jasdeep Dhillon <jdhillon@amd.com>
> ---
>  drivers/gpu/drm/tegra/dp.c   |  2 +-
>  include/drm/display/drm_dp.h | 13 +++++++------
>  2 files changed, 8 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tegra/dp.c b/drivers/gpu/drm/tegra/dp.c
> index 08fbd8f151a1..f33e468ece0a 100644
> --- a/drivers/gpu/drm/tegra/dp.c
> +++ b/drivers/gpu/drm/tegra/dp.c
> @@ -499,7 +499,7 @@ static int drm_dp_link_apply_training(struct drm_dp_l=
ink *link)
>  		for (i =3D 0; i < lanes; i++)
>  			values[i / 2] |=3D DP_LANE_POST_CURSOR(i, pc[i]);
> =20
> -		err =3D drm_dp_dpcd_write(aux, DP_TRAINING_LANE0_1_SET2, values,
> +		err =3D drm_dp_dpcd_write(aux, DP_LINK_SQUARE_PATTERN, values,
>  					DIV_ROUND_UP(lanes, 2));
>  		if (err < 0) {
>  			DRM_ERROR("failed to set post-cursor: %d\n", err);
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index ed10e6b6f99d..2093c1f8d8e0 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -641,12 +641,11 @@
>  # define DP_LINK_QUAL_PATTERN_CUSTOM        0x40
>  # define DP_LINK_QUAL_PATTERN_SQUARE        0x48
> =20
> -#define DP_TRAINING_LANE0_1_SET2	    0x10f
> -#define DP_TRAINING_LANE2_3_SET2	    0x110
> -# define DP_LANE02_POST_CURSOR2_SET_MASK    (3 << 0)
> -# define DP_LANE02_MAX_POST_CURSOR2_REACHED (1 << 2)
> -# define DP_LANE13_POST_CURSOR2_SET_MASK    (3 << 4)
> -# define DP_LANE13_MAX_POST_CURSOR2_REACHED (1 << 6)
> +#define DP_LINK_SQUARE_PATTERN				0x10f

I think it'd be better to add new definitions for these rather than
replace the existing ones. DP v1.2 calls these TRAINING_LANE0_1_SET2 and
TRAINING_LANE2_3_SET2, respectively, so within the context of DP v1.2
hardware the new names don't make any sense.

While at it, maybe add a comment to the new definitions that the old
ones were deprecated in DP v1.3 and have been repurposed in v2.0 and
v2.1, respectively.

Thierry

--SWA8unSNEqI8cGUa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmPjj/UACgkQ3SOs138+
s6GKHA//R4JXK2S2g26cJ1/sBCVDxKdH4THcS+hzpDTepbPT9gDEW6rpGO7canEL
cMwZ2uVbMZt5QhmKVb+oKTxSTLi+chB2ZNLWuVdQ2qK/EUL/ukqTZxRXNMRXgy01
xfzMc/UMbeq7yvC42EN/yue3EWVHXEKi8Nssk7DpG1FLMl49bYwuwlQkuTpN8tOQ
PR+lv6lhl4rc6M7hAyTxT56CKUbYoGu+XT8sK752+X0cCfp62fDKdL6foISQ2Cq0
C1RJUfUEezOQFejWL1TO/8Mfi1s1uaomMUZ3Uof7pZZwVaRNsf4/ErCg6gWfmGi7
vPlSmOL0jgisfJGqrar16JIf5ebspr9uId4Fpep7HKDGINDzIHBQsUumQRlGQfqw
sW8Jz8L6X+PUP7Yypg3xccgZm+rZCspQAN9h7Wz9z3/STZpZN6L6NFdGeVFsNHfN
ug6R+xl2y7SC3X9mHfgqya0QBq3yM3IhKMhk6xWd45a7znC72djPuw2k7hbfWBLe
CQ2VsIf72JywBdFVeQmPAmkqqCGxjWQ2cBkCViNBDE6GLIgwRoMB/XFUskUDoD1Z
qw2Hr0sqJyLCRL6oOUkTWOwvexEuuz6s+hluoCNJzi1DdNA82JHEsqcRnnHlgePP
T6HTyls2X8JMCSoW27G6TquILuzwF2jY9K0vT/eTeBquv8hhJgE=
=ltN6
-----END PGP SIGNATURE-----

--SWA8unSNEqI8cGUa--
