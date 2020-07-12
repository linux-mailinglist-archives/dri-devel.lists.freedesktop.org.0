Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D577221CBB3
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jul 2020 00:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 228C06E084;
	Sun, 12 Jul 2020 22:05:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E26996E084
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jul 2020 22:05:48 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id m8so4980282qvk.7
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jul 2020 15:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jcB+huYj0l0LbQtJUOWS2otYcMgoEC0yYEjN+YAq8sY=;
 b=tAHHLtnqQX5ndIdJi7+GtljunjEdgt3lSN+jOb4LDTJWEffOrfv4M76QeHh0P1Jb3F
 d5kBAPlMe2TPtGcM99r3aXbQPIpTc6Kl6HThztFh2AiEdln92CTaG8eu07nQgSztszwl
 ylbQtCzzlo8S2n2uDj9Q4Z4wokRWWNO6XmUKE7CAKwS/28cVHjoKfJ1manUoBP9NJT9d
 L6/o/ZzXAb/aRcsdfoW9IC5Ma2SYSzLMba7Fmp93cNQXtp8K01Q1aFQ0h5EfsXhLGB/5
 bOm4ru1V8boWXvgHiKuAJ9CnGzZ46MiLRVYwaXg+RXXXn5k/YIXnpZeUQWFdJYljhOPR
 BsPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jcB+huYj0l0LbQtJUOWS2otYcMgoEC0yYEjN+YAq8sY=;
 b=fOui6ioWaZVwHdXz5AwETCDGgW17dPN+7gh5WFQXEG4z/rI3CxqUCL8rNHOpY4B1GC
 z5+6SnvGIicivxYK/McwlvyxkZjXNe2OjiSPaTOqKSvdZuyQog7FCwJWqPTClUKOIDUB
 TLeq+1e7kOI92HtB8jNJ+VNUix+VRmxmlmiGaUSI1Vo9E8hXEe4ZJLdePjep5gXRs2Zv
 K+4xRQcG89G4LG8Gc8Aw+LdJPy5q4zwrej8tyF+IFyQb+xqIbUNmdkhPFqcmbcyX6Pl5
 lT/lDNp+vn8SApOof4oiYZTTVkOXxGA4ziRe0c759M5pMRWo+ercEOFuCCo9ic9hdwWf
 FfhA==
X-Gm-Message-State: AOAM533SNfN7NT3+9yYz8li9BSxfNN6pQyWFm3TCrVCyUp1VOvKTmi3C
 Pby2PKVU9ptDtbLMUm25GnE=
X-Google-Smtp-Source: ABdhPJxZboeLYvPQHsIcuJNgOvm11GuHFXfkASS3WF2CvtMIVKQDiD+gcdLk2sbid06pIK9ieYcbqQ==
X-Received: by 2002:a05:6214:969:: with SMTP id
 do9mr77959625qvb.85.1594591547909; 
 Sun, 12 Jul 2020 15:05:47 -0700 (PDT)
Received: from smtp.gmail.com ([2607:fea8:56a0:8440::b10e])
 by smtp.gmail.com with ESMTPSA id b53sm17136505qtc.65.2020.07.12.15.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jul 2020 15:05:46 -0700 (PDT)
Date: Sun, 12 Jul 2020 18:05:44 -0400
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Melissa Wen <melissa.srw@gmail.com>
Subject: Re: [PATCH] drm/vkms: change the max cursor width/height
Message-ID: <20200712220544.3zmyohuf7cj4y27y@smtp.gmail.com>
References: <20200710160313.xjoz6ereyma5vkc3@smtp.gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200710160313.xjoz6ereyma5vkc3@smtp.gmail.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, David Airlie <airlied@linux.ie>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel-usp@googlegroups.com
Content-Type: multipart/mixed; boundary="===============0850301598=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0850301598==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4i736vmv6djksaji"
Content-Disposition: inline


--4i736vmv6djksaji
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Melissa,

First of all, thanks a lot for your patch! This is a nice change since
it increases the code coverage.

Reviewed-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>

On 07/10, Melissa Wen wrote:
> This change expands the coverage for the IGT kms_cursor_crc test, where
> the size varies between 64 and 512 for a square cursor. With this, in
> addition to the cursor 64x64, this patch enables the test of cursors with
> sizes: 128x128, 256x256, and 512x512.
>=20
> Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_=
drv.c
> index 1e8b2169d834..57a8a397d5e8 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -133,6 +133,8 @@ static int vkms_modeset_init(struct vkms_device *vkms=
dev)
>  	dev->mode_config.min_height =3D YRES_MIN;
>  	dev->mode_config.max_width =3D XRES_MAX;
>  	dev->mode_config.max_height =3D YRES_MAX;
> +	dev->mode_config.cursor_width =3D 512;
> +	dev->mode_config.cursor_height =3D 512;
>  	dev->mode_config.preferred_depth =3D 24;
>  	dev->mode_config.helper_private =3D &vkms_mode_config_helpers;
> =20
> --=20
> 2.27.0
>=20

--=20
Rodrigo Siqueira
https://siqueira.tech

--4i736vmv6djksaji
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl8LiTMACgkQWJzP/com
vP+a4hAAhzqDRriWgEIVgNEePc5SENkHgaesIXCA/hVw4/JfnPSvX4HJZimZwh+g
pGc+V5kX4iQBN9sryivDJvAc5nMoSgUENo+Ql4DYzUb078spWnZJOG3A5fQ73SAc
tYbkxnxJawOub4Cx9gbJBrkRoby3o2xoi+v6KQNC2nR5DWUB0esnIiWKpyA+en5g
IcokeXwVzwoDzfIdmYYtNA+Se4V1rbMfs/1z3GzQGZvP3NjKgt37y3r5uJanaZHH
UZ11weGaODBAnMvYkUc1Si/Z2uMJPCDfCEWds0JAVxIWu0g5HEt/YugttjCOWQfr
4nybiERjJb90aDaCc3Qd2OwV3AJcx1+B5lgnwyRNKddVdEt4ddnesr2Y8U9WoSX6
3eh8xmGG1tPw7AmC/8hlT3OpydH+rqXgM1x7SCLLywUL1khw3g8T3FoAb3O3MQcr
O/ajRY1ruba7qXHrSXXdoZBWaOJkdH//LKSpjU/OYza9viYh1VB5ZtB/5+3oytzT
P0mbC92HJ7mD61qZ0Z50hsIf6CfYi0NKX9ufDZ/0aR8ERTgUb+J36mHzwqrrSPB9
qp1rEIicbV3B6gz8B5ePwThtdSeLY5tdnF/8zMMPoqf8v0HU2693GtOoGc2KiyAj
UO6flDn3BEmYBMP0uFG9YE6S4GhukiIzZBLuAAb4AqzPYFKnti8=
=RSwA
-----END PGP SIGNATURE-----

--4i736vmv6djksaji--

--===============0850301598==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0850301598==--
