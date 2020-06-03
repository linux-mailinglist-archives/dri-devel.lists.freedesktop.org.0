Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9F61ED247
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 16:43:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC7589B42;
	Wed,  3 Jun 2020 14:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D87689B42
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 14:43:27 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id s19so1958711edt.12
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jun 2020 07:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=o9fRNgvSMNigCVKD/ACsDI+dr0Pf1b/8hEBeq9sdd5M=;
 b=ac47t/BB9D4PVYXuiMGnyZqA3biXinoGHdO6dJlgyDU0Ie92fcnQ9sBMt3Za/Bt13u
 Sk4GlbqLptQTIKX15mkz84CUw6q3F6qsZKhW1TKNU5GwzdwbrGIS7CzqqImoljV1PEPF
 Zau6LnnvS8+llleGj9Ff5Vj9lOg0L6frs90o5YKc5q9KG/kgYXsivxzgj6BPyUAeTZSy
 gSpjao2R+ecD190c1XIQbXt3OFxWZUgev3fLrnxEorLmZjUQT52ZZ966slo3XuxVtWHO
 x6cIO/mFtnY5ZytjRR5fO3SY+jsQblvKGVUlbwVwWf+yUuvNEB1cRR+H77BWfXfO9e8F
 ng6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=o9fRNgvSMNigCVKD/ACsDI+dr0Pf1b/8hEBeq9sdd5M=;
 b=oozBR7PX/ll9zjLFcXSxIJoTD79kygQRouf8jsR2vuz8aol6doThN+CtPPZ1IWTn/2
 czsa41Gu7Dpzg1MC4l+zCifBRA1XtNvwIT7snU+7IRizcOEjQtmYM8MYMYufvRMrVB5H
 99E1KvpbWoSek6ricvEavKQCTLigaieS9HPDzPTW2KjuiVmEQdJbivD8+6u+7d4mhl86
 jrGUuLMrcdw+4znrUc9wpEVdmRdBq070Z/aXLASxfU8gnTLl6Y7VjX9gSWp1fWO2lCbU
 RkWIPArCU/oItumEO90JKYx0GEFWILlvZPELQK26xAglnJ1kxI9Zu1IYgpc3yIdvLK+R
 vSDA==
X-Gm-Message-State: AOAM5332g+XCybbrc5fwEOFxFEvQji2f2NMZlIzs3EVKH4ahnznt139l
 n/XnyhoifTb77jLCCauh55J2ZoDc
X-Google-Smtp-Source: ABdhPJyaxsz3XlsHiigzT1CahYYFukjnepSqw+UP20iJTINU57nJkUBY8P/fydw/aLWRj5Bqpf40rw==
X-Received: by 2002:a50:fe07:: with SMTP id f7mr30596654edt.315.1591195405971; 
 Wed, 03 Jun 2020 07:43:25 -0700 (PDT)
Received: from localhost (pd9e51079.dip0.t-ipconnect.de. [217.229.16.121])
 by smtp.gmail.com with ESMTPSA id j2sm1345039edn.30.2020.06.03.07.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2020 07:43:24 -0700 (PDT)
Date: Wed, 3 Jun 2020 16:43:24 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] drm/panel: simple: Set connector type for DSI panels
Message-ID: <20200603144324.GD3478467@ulmo>
References: <20200602171240.2785-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20200602171240.2785-1-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
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
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1089945631=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1089945631==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9dgjiU4MmWPVapMU"
Content-Disposition: inline


--9dgjiU4MmWPVapMU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 02, 2020 at 08:12:40PM +0300, Laurent Pinchart wrote:
> None of the DSI panels set the connector_type in their panel_desc
> descriptor. As they are all guaranteed to be DSI panels, that's an easy
> fix, set the connector type to DRM_MODE_CONNECTOR_DSI.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 7 +++++++
>  1 file changed, 7 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--9dgjiU4MmWPVapMU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7XtwwACgkQ3SOs138+
s6H32RAAl+2VDTjQrs9MexWOL9xc0Xq5Zfzvc1Hj4d1yaUsh/mYDzT2m9Nk1HXfA
e9I9TJkK3HzcREv6TnhaXTkAkBeyaMriHFyxqaJQS5Sx5APc+uRaQdYSCVFosRKX
2em5fqwmbsIS5UDm42q5ITkjIgsqCZwl6ygnidssalZZoqYbxwgo1ElueoR3/fxj
MRn0ozIA1/n21rgDJ/ew0qsIZG3kkkX3w4eXcAHX3RCDtKAOjsG+UTEL6d9c6hRY
jw8Z4IyhUIXsB8bFrRI45KGXbMryslz/KPOtZpWneiKOA1kx0n0+XjEI7Zujkzp8
S6Dk1FfHlXogGXAdnTpH+Ahsqn5Z+u1TOjIrw6YS0xwjcdPDHoTy6HJ55WML0ES5
uD3ayUyKcwx1w6izwlgWd1dpW8LKC/vbtkwDqRCHUc88/QnUhFVrrsBdMo2NkKIf
MlVx0Aw5YpKFdQYzY6/0vI35PF6waYx72IiI9PcpP99uiQv7E5M3nikhEBG2u0MH
SbhipCPUaaYqQlyfzGLz6J9w8IwD8nKjZ9j/JdxVr/HFYbVnwH+hXVaL6YXG8quk
3m7fHes+Vmgc5OuwhC/DuuKJM9yH8fovRqwDwG0yLkGTM4DwX9kc90mDBXNg8/S/
jdtHfugSR17Sh+WWktwE1H4l5h6akLlaBVnnaVL/q6j83kQzj50=
=tYYh
-----END PGP SIGNATURE-----

--9dgjiU4MmWPVapMU--

--===============1089945631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1089945631==--
