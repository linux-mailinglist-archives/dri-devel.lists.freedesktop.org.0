Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BA3358452
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 15:13:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4626EADD;
	Thu,  8 Apr 2021 13:13:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C876EADD
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 13:13:32 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id hq27so2942824ejc.9
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Apr 2021 06:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KXkPh24Hwqh6mTV/RDgcTljwHVMEkhnZM2etNRFV8Hk=;
 b=J0XwKAeygTg3yKHLKu/SCPwKPyRpLSZ82umOn5OMnDOwn/xkoygTyXE1AtL/KUjEeL
 mDHUFaYznayZEWTncOeUGTKZm6PhHd8/A4fe//bCp7N56hgS8SWkhyA1g1egZxq6F/ia
 Yp2/OlXNS/3ApbWwtbO9JA7ZMr2L4tKFwW78R3rbgrhkCcqXlGjiwaxWT4dRuudoVZvH
 qE+wym3/w2kljqsl9r1dkLrQNEoZTeWLBoActU3zvsqKLcvhoEfTw7JHsy8+sEaDDbl8
 45GCt05P56xM2SKKCWGQJxAR2+3SVVUw5c0p3jC+RVwyvLUUYjfL/IW5RScb7V79qXVN
 dKvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KXkPh24Hwqh6mTV/RDgcTljwHVMEkhnZM2etNRFV8Hk=;
 b=iIifQ9bSIp8/ZesN+m3Qkkc4iZHgKNIJK0t7FPZMiAmPsx0MxIvI3ZUziHF5M6EatO
 xDaNfHO8uPoLmJVOh4ARQA2r1m7TaBZTL6jvyIslu+X8Cwx2Kl1xcUtdesSdS0B3LG2c
 o/tZlHaZcozxsU7Uy6HBKwu5dkt0fUqgNtguYyMBCL6FWyE7IeBPqmeptz+msi5UZGt5
 iW+3PcI5BbKkKE9MdDkG7MSilmG5qjNfTp/D19Edwd6q9F4XD48ZF5KDnazqXcT8WolK
 3AqD9powCL2/RN6uc7z0fcN1ZSdi1z4kxfPbENJ87OjX4SItnKwZ0IwbG4tjrBXuRWFw
 J1Ow==
X-Gm-Message-State: AOAM532EEHYF1CmZAdb9xE6H51zn49T+eLFIQhcP0TkmIX+FHLjyU9++
 LxLRiINsHrpEv7DSwExBbxM=
X-Google-Smtp-Source: ABdhPJy1fJViw0AYFh8pvEWm8aKOUNwMhXAzU2iqbXeSUTcIKv4ETrk1db9sxO2LV2y06KbCFzkZ7A==
X-Received: by 2002:a17:906:46c8:: with SMTP id
 k8mr8063042ejs.389.1617887611011; 
 Thu, 08 Apr 2021 06:13:31 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id g25sm17049325edp.95.2021.04.08.06.13.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 06:13:29 -0700 (PDT)
Date: Thu, 8 Apr 2021 15:14:04 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Carlis <llyz108@163.com>
Subject: Re: [PATCH v2] drm/panel: panel-dsi-cm: convert sysfs snprintf to
 sysfs_emit
Message-ID: <YG8BnO1pVhDKCS3F@orome.fritz.box>
References: <20210408085257.2396-1-llyz108@163.com>
MIME-Version: 1.0
In-Reply-To: <20210408085257.2396-1-llyz108@163.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Xuezhi Zhang <zhangxuezhi1@yulong.com>,
 sam@ravnborg.org
Content-Type: multipart/mixed; boundary="===============1115958559=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1115958559==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2bcb+exNMFQwtjzu"
Content-Disposition: inline


--2bcb+exNMFQwtjzu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 08, 2021 at 08:52:57AM +0000, Carlis wrote:
> From: Xuezhi Zhang <zhangxuezhi1@yulong.com>
>=20
> Fix the following coccicheck warning:
> drivers/gpu/drm//panel/panel-dsi-cm.c:271:8-16:=20
> WARNING: use scnprintf or sprintf
> drivers/gpu/drm//panel/panel-dsi-cm.c:251:8-16:=20
> WARNING: use scnprintf or sprintf
>=20
> Signed-off-by: Xuezhi Zhang <zhangxuezhi1@yulong.com>
> ---
> v2: change snprint to snprintf in subject.
> ---
>  drivers/gpu/drm/panel/panel-dsi-cm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Nit: I suspect you might've just resent this from some private email
address, but it's kind of hard to tell because you haven't been using
at least the same name in both email addresses.

However, if you're forwarding this patch on behalf of somebody else you
need to add your own Signed-off-by: line.

Reviewed-by: Thierry Reding <treding@nvidia.com>

--2bcb+exNMFQwtjzu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBvAZwACgkQ3SOs138+
s6EXcxAAqJo4eElRQWDWZdgX/WmNo+QgaatLvhDo9ASmYl8sY3Q469PvWVmv2kKp
FUrP2RMOHaRZBu944WQPo09aI9m9EQKKacffyJix5/zZWF6W+HkV5ES3f8/s9s6g
b9DuffTspwaTu8dJsN46bgL1YBR2GIyg5trx185AtO5cy9pwE4s+t6YX74h1wz3N
6UtuhBQ9L2tpK1H23WrHoelp2de53sreS8CzTlLc3j8ysWOio3Pydqo8gnw5+FvX
rkN9WRiCNQryAPIghFcJ5Cmfx2rvEevrcn9zD2OpYv4e+b0RCgz89K54bFsxCx7e
sVkbWWMZueybr9dCYBPglWH+PCq8bocQziPhWxoCRvKyUXR6AQJj7R/80pZdUIEO
2bo5lIWCUxiHLWyO+xKNt56WlauWqLpNr/+d2LQOhr1NDe6tvQ/X8PJGjSdm6U13
n5dfM45voGp6zNdaLO/HWHT9KeznEp2sgwi1SkFhReo/iZRTsa80HJ9bj7yeSiUt
GXeC21u+6CqTZc65WhX6nNH/d+oKvIn2Zt6EQtIKLdYEylWaJDzNO8BcheI4J0x/
awTPZMpzczLdZna8qNQCJf/+CX+dCRBxw/AZlrZoaUosX+ucTeRQs8uLRAqWeFaV
NRFpURCRVYlowM0zwwT6vAVHrPrPkS6HxR6mhTVARvX+nxUua6s=
=GbDC
-----END PGP SIGNATURE-----

--2bcb+exNMFQwtjzu--

--===============1115958559==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1115958559==--
