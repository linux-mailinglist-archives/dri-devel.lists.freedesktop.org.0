Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7173680740
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 09:17:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FC5B10E0E5;
	Mon, 30 Jan 2023 08:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B98410E05C
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jan 2023 17:09:07 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id bk15so25818730ejb.9
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jan 2023 09:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=bfLdSQqDxRQGeCe/h7f1wp4AyGL2GN6r31nH4LUfHC4=;
 b=UObinvVveCeYYhB2GznEucUqc/D2WRv+mJ5MWfPP5fZJKV9t39zDBPGyGWRYQ7pnh3
 ZMcMSKI3kNM48Qc7u0rdBuFxDFCnWwXwRokRdHwbdkBmk3s8H4zNYVjFIfACgFOcNVU+
 2ANXTPhIRwkcKw54R7RlvQzpiVyzJwqD/Ae6owdsDQ+uCkiPJUIab0J9ksVg1Wet3BIL
 dcblNhDicfAqAKhshc3nRLjOOasZBo5u3Gt2h0BcVvkZjGKqd0nlsjHmX7uUeISAeUUa
 cb63hhlN2BAgn/TYIbrSf1hmG8pY9xc0gk9DzaZ4JzrTT1IxDTgIkwg8Awr6F42MfoIZ
 4YhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bfLdSQqDxRQGeCe/h7f1wp4AyGL2GN6r31nH4LUfHC4=;
 b=zY3A1zdfXg5EMaPid7ORxz/zYZQ5IlpNwJoeHDsL5zsA8rgGbTm52EPkypzYp6nkA+
 0xoGsIo4yR3ObJJAxe6+oMyENM+pJi3SxmcT9raGiJQXXS2k5zuldXR4gFOiENrm0iUZ
 TEv0jGOgNsFj/XRqbRbEi1cbXLEMLruTK81DjiiLQsIdQCB4PB8aFREFLePIKxvF3l/V
 kWRJdWhqT1ZgoW67rSEX+crE0CexjZpBXsusIlb0w+DzwHff1rtglN0kcDa/Uq2oIb08
 Nz6OqPe971dGpQPfim9fs6IuaahwQ3e5tgfJwdlCJ/L0LqBVtXBI5dVUErfdrIkFY/2K
 493A==
X-Gm-Message-State: AO0yUKXzvSskJK7vLNg3SQEPHRA8ny15VSw829xGmtj2CgYk61ZL8NKt
 qGxtp1XwKeVrINgcZy2pTIdJj76UskE2DSy1
X-Google-Smtp-Source: AK7set9ZxDHcjjoILQS39I59VVgCdpkwiyLUI2OWMbkZzLjM0RY0UXszWjvZ8JF73kprf5vXcNnnfg==
X-Received: by 2002:a17:906:2e92:b0:87b:d60a:fcbb with SMTP id
 o18-20020a1709062e9200b0087bd60afcbbmr8915268eji.47.1675012145571; 
 Sun, 29 Jan 2023 09:09:05 -0800 (PST)
Received: from sakura.myxoz.lan (90-224-45-44-no2390.tbcn.telia.com.
 [90.224.45.44]) by smtp.gmail.com with ESMTPSA id
 oy17-20020a170907105100b0087bd50f6986sm4126966ejb.42.2023.01.29.09.09.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 09:09:04 -0800 (PST)
Message-ID: <727b87ec3e93c6cfd9524d3947ca6e272cdf1a38.camel@gmail.com>
Subject: Re: [PATCHv2] fbcon: Check font dimension limits
From: Miko Larsson <mikoxyzzz@gmail.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 gregkh@linuxfoundation.org, Daniel Vetter <daniel@ffwll.ch>, Helge Deller
 <deller@gmx.de>
Date: Sun, 29 Jan 2023 18:09:03 +0100
In-Reply-To: <20230129151740.x5p7jj2pbuilpzzt@begin>
References: <20230129151740.x5p7jj2pbuilpzzt@begin>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.module_f37+15877+cf3308f9) 
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 30 Jan 2023 08:17:13 +0000
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
Cc: Sanan Hasanov <sanan.hasanov@Knights.ucf.edu>, stable@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 2023-01-29 at 16:17 +0100, Samuel Thibault wrote:
> blit_x and blit_y are u32, so fbcon currently cannot support fonts
> larger than 32x32.
>=20
> The 32x32 case also needs shifting an unsigned int, to properly set
> bit
> 31, otherwise we get "UBSAN: shift-out-of-bounds in fbcon_set_font",
> as reported on:
>=20
> http://lore.kernel.org/all/IA1PR07MB98308653E259A6F2CE94A4AFABCE9@IA1PR07=
MB9830.namprd07.prod.outlook.com
> Kernel Branch: 6.2.0-rc5-next-20230124
> Kernel config:
> https://drive.google.com/file/d/1F-LszDAizEEH0ZX0HcSR06v5q8FPl2Uv/view?us=
p=3Dsharing
> Reproducer:
> https://drive.google.com/file/d/1mP1jcLBY7vWCNM60OMf-ogw-urQRjNrm/view?us=
p=3Dsharing
>=20
> Reported-by: Sanan Hasanov <sanan.hasanov@Knights.ucf.edu>
> Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
> Fixes: 2d2699d98492 ("fbcon: font setting should check limitation of
> driver")
> Cc: stable@vger.kernel.org
>=20
> ---
> v1 -> v2:
> - Use BIT macro instead of fixing bit test by hand.
> - Add Fixes and Cc: stable headers.
>=20
> Index: linux-6.0/drivers/video/fbdev/core/fbcon.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-6.0.orig/drivers/video/fbdev/core/fbcon.c
> +++ linux-6.0/drivers/video/fbdev/core/fbcon.c
> @@ -2489,9 +2489,12 @@ static int fbcon_set_font(struct vc_data
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 h > FB=
CON_SWAP(info->var.rotate, info->var.yres, info-
> >var.xres))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return -EINVAL;
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (font->width > 32 || font->=
height > 32)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return -EINVAL;
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Make sure drawing engi=
ne can handle the font */
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!(info->pixmap.blit_x & (1=
 << (font->width - 1))) ||
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !(info->pix=
map.blit_y & (1 << (font->height - 1))))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!(info->pixmap.blit_x & BI=
T(font->width - 1)) ||
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !(info->pix=
map.blit_y & BIT(font->height - 1)))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return -EINVAL;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Make sure driver can h=
andle the font length */

Tested-by: Miko Larsson <mikoxyzzz@gmail.com>
--=20
~miko
