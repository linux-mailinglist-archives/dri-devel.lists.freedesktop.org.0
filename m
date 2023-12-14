Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FD5813868
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 18:23:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63AEF10E995;
	Thu, 14 Dec 2023 17:23:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99FE10E9B8
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 17:23:45 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a1f653e3c3dso938674866b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 09:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702574624; x=1703179424; darn=lists.freedesktop.org;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NjfgAmCHro8WpwTbdDICAMGVZxRX0DY8en3op8vtBmg=;
 b=FxIaBbsmIwHBRbbmyaweTxfxfjw/2tGwtmYyw/j4N4GNW94aCR83aAwqJBvxePczE8
 7X/j19f8Qycc+MaYWYskAjo8jh5iLGVeIx6fSqcM2iy+e+sJIDmmogY16MakFewaiweb
 nng/OPsTa+oTxzQbT6S/s7vgMB6LnB7nf7YT0TMyt0OVAFI7Ltj0bhbwD8UyVqx793ne
 0oM4ag35YCEpFhFMbdzTlXq1mFVNNlAiCnWvP6AHPzWFo+prJkBIlZ8EoluJCEBqQ4Xp
 9w2c73MQu9r7bfEJq3M8iQ6+U9+ixI8z0K8GV0lpaTfO8XZ+ObTZd02pATSPgd0fEpwP
 DqUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702574624; x=1703179424;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NjfgAmCHro8WpwTbdDICAMGVZxRX0DY8en3op8vtBmg=;
 b=Zdbkw7PGRMmlaC77klJjefwUUZVJUEQZ6B0v++j8ioStf1HEUFMzfmifSHJBKk6nzJ
 zp12nlqcGOvi6uyg50jZqqAgMQqZ572MB5s3bEaV2/3vjprQOhBJRw8rz+R6g2AFuWZD
 AOlmYUSScfp7DNnuyEP762emvd/q0IdltE17lFaTBtJpODwyDtvRE8LTiVaYRJrsi7/P
 6MniPLIhEP79BKxT4UZ01y9EZDI3sjs6Z0pAWcevBXxwmA/5Ak1LeDAfjbOzRRpRiDRK
 MaeeRN+2IaGOxTiCEuPa+acMRTWlM54IxD7jtWMO3U/RLvuHXiEDg5yunzscOZvBF/nx
 6NeQ==
X-Gm-Message-State: AOJu0YwaKBnSlxJRhjy7LXGVdoXY4m77vJaraDdeU4HCk5Ei0DqDKLA8
 GbDjZscVKnTMiWjqmDvSFtFWKJWuCFY=
X-Google-Smtp-Source: AGHT+IFtbQpVVn4O3orT5ng99RxXEB37KZytm/DB87hmngzw/A4f5W/EwLa4VEQiP4pyUJOX5ku0pg==
X-Received: by 2002:a17:907:e8f:b0:a1f:5d99:fa8c with SMTP id
 ho15-20020a1709070e8f00b00a1f5d99fa8cmr3562053ejc.77.1702574623908; 
 Thu, 14 Dec 2023 09:23:43 -0800 (PST)
Received: from orome.fritz.box
 (p200300e41f0fa600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f0f:a600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ub26-20020a170907c81a00b00a1c96e987c4sm9747583ejc.101.2023.12.14.09.23.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 09:23:43 -0800 (PST)
Date: Thu, 14 Dec 2023 18:23:42 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2] drm/tegra: include drm/drm_edid.h only where needed
Message-ID: <ZXs6HtH0-qa4xgQr@orome.fritz.box>
References: <20231212142409.3826544-1-jani.nikula@intel.com>
 <20231213101951.3932273-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nyW34cH9WClVZ6vc"
Content-Disposition: inline
In-Reply-To: <20231213101951.3932273-1-jani.nikula@intel.com>
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--nyW34cH9WClVZ6vc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 12:19:51PM +0200, Jani Nikula wrote:
> Reduce the need for rebuilds when drm_edid.h is modified by including it
> only where needed.
>=20
> v2: Fix build (kernel test robot <lkp@intel.com>)
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/tegra/drm.h    | 2 +-
>  drivers/gpu/drm/tegra/output.c | 1 +
>  drivers/gpu/drm/tegra/sor.c    | 1 +
>  3 files changed, 3 insertions(+), 1 deletion(-)

Applied, thanks.

Thierry

--nyW34cH9WClVZ6vc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmV7Oh4ACgkQ3SOs138+
s6Gl5A/8DEwIypqGfhipLCj04MtME1RYd0WRLM08GUYZdzuiodYu1O1/JC+vYBFk
ABPOBWW7E7DCo+M+IEJ2itv/IVpafamwmyjALbKDuxeRjI+t+zsfLciTEvM/5AAw
peWUW8hwkpJIkPYizpoPeceU/LhbuC3L51pAJNY4RZg0OqjzMJU/wl6E6vflBL+x
N0KDqjzEXHJTDesGWYPtX9AnrSk6kxmZld2KnfQBL30h/s/sS144rqTj2rBvdKv1
/GR6qITkUFh775bywQgmIL2clsU+zwZIWdVdFXtJNDIdf19njkHMRCwiRrPFXBUu
9nGjGbeAwmbvVzd0/krnZFAglJH6gux8v1dh8053AhdqocFnbPUhkDWa0l6ZVwgs
J8ZNIuJWhBVe9sQdHzBx0k/8WaHkmLzGdvO47w8a+NeaOq3FXf4JKYrP4sMUf78e
HmefU/K3hfHpp4pKNtK0OfX+ucicWAkTAjrd0LoJvnPcol+pb2g287RUkWwn10Pb
blyRAfJGkP1WJjdC041BOSUMQ2rXcYSKtEHOV7ohNOsmzjHo5vOyPF+1utqLXzcd
29hfRCubfm71iidEbfGR/zjFdbhdNdlK9bPMz5VTmRDU50zRzRMTtrUXgNGUMh7P
nduzc3raj3dKbi2mXNPSZiTTb+ZZosQsslVFZqGFjmZp8Eo0v+g=
=/P37
-----END PGP SIGNATURE-----

--nyW34cH9WClVZ6vc--
