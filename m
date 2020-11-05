Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FFC2A83E2
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 17:47:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32DC66EDDA;
	Thu,  5 Nov 2020 16:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A2A16EDDB
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 16:47:44 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id k3so3545120ejj.10
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 08:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KTrM17LaE3eRnXRmmf0/lRu9nMHN1CBl40QfrrxpBNY=;
 b=hHybng4WEtcZxHNWh6mlbWhH1415hVUIZHRfQwhwOksDeBgZBCx9tos9IXIVBt0Wog
 +UOIUgdB5oDqnD08cbnQV7CHAd7h798SgHSSm5BdSaNNfZGrLE7h3Y+O0AaczmRr0l/t
 ik8qY/CCX402NHiGjo/0kTQ535uF1043ZKzUD3UetAft8DKnL03Bj1kooXQ2fvpdEQjk
 K4bwTEesmS/ijllySN0QQSx+pOSBJwi3YToevwY8i+xSj2A6gIAGoU1cMvB9lGbB+nID
 pvZdknEWXvXMvy4YDXHKqTflUCLl6UwTRudiWfKSFfGA8eLoth95VBYM1iV0dQ7nJpJJ
 XTpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KTrM17LaE3eRnXRmmf0/lRu9nMHN1CBl40QfrrxpBNY=;
 b=pjoLJMSXRnjPlBfRhyO9FdnROvzR+JK4b/3Kb3SNCsc7pzWIXXatrBC/RmPdTfJ7qx
 Bz/GVa8jGXME1O1KxYAL8+o+5bNCWjBPnPhcN3L8fnKh/xF7X+Np5b0hlzaIPd3/xMqE
 UbrqeoplCix9nF9wB4T8BCF2n9ipCxyyOScLS2JJ+3K/wXcpydF6lA6DSu5kez3kM0uX
 J76DOVly0gy1X0Os1llDK71ka1ib1rdBrHg2nWLFyS2fCPq3l+mNnkA+yh7zZZOQQRSO
 EmliuZ2XzDx6nrIXA6UqwuQ3DfeIlTLWRxLh4F550PnGYDTqU0q4+mgxkaaMqZyzSL76
 hBYA==
X-Gm-Message-State: AOAM533Lr2LKa+5/2BW2jj/8sx82coIjb7WxhSws0jPgHGGA2wwl2abK
 q4v5vzVT9d/R39Bl2mK34G4=
X-Google-Smtp-Source: ABdhPJwfC8uPR2uvawZdxTifaAYqgR1RHreUAqyPxO+5utXztVkevqTadscf5EjE8nYcrS2HlVHGDQ==
X-Received: by 2002:a17:906:a098:: with SMTP id
 q24mr3061994ejy.191.1604594863017; 
 Thu, 05 Nov 2020 08:47:43 -0800 (PST)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id f16sm1210281edw.15.2020.11.05.08.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 08:47:41 -0800 (PST)
Date: Thu, 5 Nov 2020 17:47:40 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 16/19] gpu: drm: panel: panel-ilitek-ili9322: Demote
 non-conformant kernel-doc header
Message-ID: <20201105164740.GG485884@ulmo>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
 <20201105144517.1826692-17-lee.jones@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20201105144517.1826692-17-lee.jones@linaro.org>
User-Agent: Mutt/1.14.7 (2020-08-29)
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============0460518075=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0460518075==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="df+09Je9rNq3P+GE"
Content-Disposition: inline


--df+09Je9rNq3P+GE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 05, 2020 at 02:45:14PM +0000, Lee Jones wrote:
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/gpu/drm/panel/panel-ilitek-ili9322.c:177: warning: Enum value 'I=
LI9322_INPUT_SRGB_THROUGH' not described in enum 'ili9322_input'
>  drivers/gpu/drm/panel/panel-ilitek-ili9322.c:177: warning: Enum value 'I=
LI9322_INPUT_SRGB_ALIGNED' not described in enum 'ili9322_input'
>  drivers/gpu/drm/panel/panel-ilitek-ili9322.c:177: warning: Enum value 'I=
LI9322_INPUT_SRGB_DUMMY_320X240' not described in enum 'ili9322_input'
>  drivers/gpu/drm/panel/panel-ilitek-ili9322.c:177: warning: Enum value 'I=
LI9322_INPUT_SRGB_DUMMY_360X240' not described in enum 'ili9322_input'
>  drivers/gpu/drm/panel/panel-ilitek-ili9322.c:177: warning: Enum value 'I=
LI9322_INPUT_DISABLED_1' not described in enum 'ili9322_input'
>  drivers/gpu/drm/panel/panel-ilitek-ili9322.c:177: warning: Enum value 'I=
LI9322_INPUT_PRGB_THROUGH' not described in enum 'ili9322_input'
>  drivers/gpu/drm/panel/panel-ilitek-ili9322.c:177: warning: Enum value 'I=
LI9322_INPUT_PRGB_ALIGNED' not described in enum 'ili9322_input'
>  drivers/gpu/drm/panel/panel-ilitek-ili9322.c:177: warning: Enum value 'I=
LI9322_INPUT_YUV_640X320_YCBCR' not described in enum 'ili9322_input'
>  drivers/gpu/drm/panel/panel-ilitek-ili9322.c:177: warning: Enum value 'I=
LI9322_INPUT_YUV_720X360_YCBCR' not described in enum 'ili9322_input'
>  drivers/gpu/drm/panel/panel-ilitek-ili9322.c:177: warning: Enum value 'I=
LI9322_INPUT_DISABLED_2' not described in enum 'ili9322_input'
>  drivers/gpu/drm/panel/panel-ilitek-ili9322.c:177: warning: Enum value 'I=
LI9322_INPUT_ITU_R_BT656_720X360_YCBCR' not described in enum 'ili9322_inpu=
t'
>  drivers/gpu/drm/panel/panel-ilitek-ili9322.c:177: warning: Enum value 'I=
LI9322_INPUT_ITU_R_BT656_640X320_YCBCR' not described in enum 'ili9322_inpu=
t'
>  drivers/gpu/drm/panel/panel-ilitek-ili9322.c:177: warning: Enum value 'I=
LI9322_INPUT_UNKNOWN' not described in enum 'ili9322_input'
>=20
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-ilitek-ili9322.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Again, for the subject prefix, this should probably be:

	drm/panel: ili9322:

but otherwise this seems okay:

Acked-by: Thierry Reding <treding@nvidia.com>

--df+09Je9rNq3P+GE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+kLKwACgkQ3SOs138+
s6HGQg//QkgHbc3TJbLwEy4mxRTrjYNfzt1lk9oH16BLdotyt6riD0K/bOlNq8wX
AR7YRFjlaAr89UosEyZ7YhQzY5wDcCGoAAANBqUQodK2chv9AmeRmmKfLDOxqZ7x
KrnvKdU8pKi7hxHflZBEZci29zzG/JO4iu+HQhSLkD6bShn+5WzZuCPTNotz+hr9
QGSRqJSWNeIk0IPmsIDaWDaZBLRQN7ct0HxOZSTbyy+KluUuXE7rPLEEPuLH+1Z8
AubtbihjLCAwjD/JwzbeSCJ1M4qkFsN2iBkGNG1ybbu/1R7o4XGKQkExepeW3Ccc
epNP9X7ZMZpkT77LOvEc3Zy/Mut8gy1AF787VPyIkpHcAeK7pWFXRUgj8GHZc18W
6LINDgB2aWUSCWpf76ayUyz4ZtpyNjd56vCLW8yhLdBLmkRqe3laeZCzKCJwHUtC
Tg4NWCWKIvQdmHuJ7GY/yoTAHLufpgXhHWGtWDeH+ihde3BAyk/Ye20uV8iyu9xc
Po07itNDfSKB68QkzfZSwZIYWRr8Vuj/CMIAGxLvWiiHVWr24csYt3Yv3I6aEKCg
E89LpPvNo7RYX10dpx0PNsE26gcA3lpI+L3m+q+w+VIZuEO+AgABuWW/h3wteqzG
AkzfbYDBOOtuU26mYXPiYWm4vLkDBO+pTacckyPJbK3bstzLiw0=
=eVAB
-----END PGP SIGNATURE-----

--df+09Je9rNq3P+GE--

--===============0460518075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0460518075==--
