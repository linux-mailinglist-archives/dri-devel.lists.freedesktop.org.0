Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BC467D127
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 17:18:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3DF610E14C;
	Thu, 26 Jan 2023 16:18:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6769210E14C
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 16:18:41 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id hw16so6372337ejc.10
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 08:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FUBsQLCrBYvivpWewp0oU92BS4YfC60hR9QBE+PdkbE=;
 b=MDT9jpfK9P3FwxyqCm5a1rLJrZNTV6H0yJVbSzRPOSeHdbI82Lus4jUzoERKF8PvJN
 9JH2GCyoAaBT5BgN/t72cHMWW9J6j62yeSctn2ozOBsGjPwbiV40xI1m5GxZ6tqAOL9e
 4VD9EbRiZuN8A1iVNF/XUu/o3O0ARrm/QOYlfJdloUPze1lPIuuFczM/b+Rbem4k0Ju6
 Dd5z/GDEiHJAlmVGHI8zl4lThCl5OvlEouFdoxthnbTwXcV91vG/n8ITGlLAhSZNz5Do
 DMq95jBgu+p0UCELr28Dw8kVPj/i57AotVA1mLKdHX6voPMsFGHFCbVeHyLKZPs+W8HA
 WUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FUBsQLCrBYvivpWewp0oU92BS4YfC60hR9QBE+PdkbE=;
 b=msebRHfQ5VgN41e5m0h9OqG9kccVO1aqUN9+vzuYK1StEEO2mtcVmXbiS5fykqOn5o
 l9f6z7suOi2rEw4hiM2565QmHe0x/zWSrckQPRHQJ8hBr0/I408NDiK97fn9IJi+6tnw
 YgQhOC3KLTRhu/7SXUG12pjdKFEB6U4IXawXolS+qr/XimKhFgCUE3ZNrV7xiz/z2F0g
 ngbm0WJLR8c90KEHiNDCnA4vm5ewz0fXGqk5LW+mHjIKLgQg/wBjHeq93gt+cxcSUJiK
 iegGYyQZIPFemB1g+48Km7nkS8WxPMDS5PMWzh9Z1w0qOSQjQj1Lgt3Mjz7f6h1rRang
 k7XQ==
X-Gm-Message-State: AO0yUKVOvBDlPuolkHXm+Fwzvq7B3ivCaAHJ5XwI/N/tuOl3CKkGjN8c
 hyNKnGNwnZ8I9tvpMpkZqV0=
X-Google-Smtp-Source: AK7set8+0zZ5cyuprg85X8cYX0HvtU9ZtPVvQ5tjiO/y8rHKxnwhKwllcAVZglc/XqIoZvfF9LwjKQ==
X-Received: by 2002:a17:906:d1d0:b0:878:6df7:ce74 with SMTP id
 bs16-20020a170906d1d000b008786df7ce74mr1931574ejb.23.1674749919780; 
 Thu, 26 Jan 2023 08:18:39 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 z21-20020a1709060f1500b0084debc3fdadsm776545eji.188.2023.01.26.08.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 08:18:39 -0800 (PST)
Date: Thu, 26 Jan 2023 17:18:37 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] drm/simpledrm: Fix an NULL vs IS_ERR() bug
Message-ID: <Y9Kn3UQ8WGUtgJgi@orome>
References: <Y9JHzImRcUaa0mi1@kili>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FvZpDm5J7z3glGpv"
Content-Disposition: inline
In-Reply-To: <Y9JHzImRcUaa0mi1@kili>
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
Cc: Thierry Reding <treding@nvidia.com>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--FvZpDm5J7z3glGpv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 26, 2023 at 12:28:44PM +0300, Dan Carpenter wrote:
> The devm_memremap() function doesn't return NULL, it returns error
> pointers.
>=20
> Fixes: 9a10c7e6519b ("drm/simpledrm: Add support for system memory frameb=
uffers")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  drivers/gpu/drm/tiny/simpledrm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Good catch! Applied to drm-misc-next, thanks.

Thierry

--FvZpDm5J7z3glGpv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmPSp9sACgkQ3SOs138+
s6ECOw//YIt/L+hHtCZtIp19H1O9jC1ZEjq0DLfDAEVYv+sousVYhkgAaxdKySj3
Kj9RNprI2A0+cQxtx+P1iP6zPwJSCj0KI1mxY10rHCoOKVVS3QyrHKudWs5kTwBc
dOqbPTTrn+KOK+ie4IBj3mbpyheGBnoNC+7Z+GirC5p7J/7kiG6fHRiNZc0ha8MS
VQc5TSA7eFGhEk0Vwrg+IPmvs2MP73CQbr38Q+lWZWi1IrWHtQovFsIZljrvG786
EHot53V/wgSbcEMDjDkvUdZSybnDSRKobNuVAXnRfmasXnsoe0dIJH4/Nads/oyL
XSBRvuqPV6KjPflZQhOQ1ptTirEh/duhhaY8rPppIBuBk9AjV2oBZwe/tQHyKyUb
pyTg8lx3mtLigqQMc0pgjIX0zkrdrTFbcX1y0y6CJsneN6wfs4itjVfn/EezSB4T
nlFCVD72SCESU82j9YoLh7suWUVhkQRt3O80a9DCOkRKfY+HVxGL0HxW9i63GRnK
8Pz2SpLTHe9kTv5w3/4iUCKYqBUusB/VixPq97r1AacfTJRr891wk0DDX8gc9cLv
+Pm6vHX44/44uo2AD2GijHLBQNcuFSvHF5NOEuZbhT4079hugc4U3P3Xx3MbK7xa
3guf7rsp88R9Q6KxQHH/L1siiCyXGu9ERdia7KpQOOJYPB5HCik=
=2ARH
-----END PGP SIGNATURE-----

--FvZpDm5J7z3glGpv--
