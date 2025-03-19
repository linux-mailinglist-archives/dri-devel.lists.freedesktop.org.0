Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0462A683FE
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 04:53:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC36B10E260;
	Wed, 19 Mar 2025 03:53:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hd5HUH2n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A45F810E260
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 03:53:51 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id
 a1e0cc1a2514c-868ddc4c6b6so2889215241.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 20:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742356430; x=1742961230; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Sy6Vl9e/rxmWtHZrHsorf5l24nIqRSzNAnN7RgqPBC0=;
 b=hd5HUH2n4KNeZg2fGgtoeS1/1RhC1Ja/RMDMAsRlrZiqadY52SiHH7kec1ylYFO6iW
 YJY3vZ1FZmkau/GXAvxcTyzReJEWSv3v+AS8PkxeS3Qa77gobxWLUM3eMOHzdCOXRZvH
 8/fnM5UWhM75GvednIIoYipyF+/pqPzj++hkiHEsXPTnBFQCab2Lq9OSlWbzCv9g6e/A
 Yrtjf2UnNKryPrhaU3RzL9r7r/Qw6MPuHF0xYJ6ZS0bqG+T5YVRT52ts4TCBL5Bv9s/3
 zN9ICm/OqjCykfuvvsyzpDIfn35aQH1KerPkG+IIOjZV8p8qwBSa/+V/2QlF9QIXUCvB
 F5DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742356430; x=1742961230;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sy6Vl9e/rxmWtHZrHsorf5l24nIqRSzNAnN7RgqPBC0=;
 b=X4Kc2tzco9x+5Fso8AAAWdqNd7zzeOFYGjLL8JReA6XeTPn1FjlFTqxOGycXhuat87
 S/L0Agfovj4jmpS9nWYM6SeKgxHsf6uJ0s2T9lcJai9VjpLeGwdi9y8B6TH7TPMw+/sn
 MXXLblVX2BqV3s0rrMRkhUAHABgc9eI7+b8rApFipmezb0l5oFTMvaa6iPYQYtsl9cPw
 mHe0L9kz4ysAOW3c2QSNl1UQ8ilsmVu2+ZA+5xuH+IbRDOvG/kCV34glOfx/nwWP5k2+
 J1hrKI10MLK0kJVPAyqIgW1szgw1S7lmH+lGWqmE8+VP6peFkZ0nKFmGyrA8PyRzXVxm
 fXjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsQuCvylEHYSi3Eo5PmpQa/83jjlye9Yjut4j4lbk3upiYp7J7Yxjz2NsEIq2/s+CDtV/gneUjqic=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzE1Fn1XuTtIxfDWkTDCPNLF+ReF2mBcTLuO4GZBXwEB7b83YuW
 adbZ+bFpA13pKMQu2MPhNipU16HMC5VYDq7Pq2Efnfd8SVYgncuCzSlPmsTcR0bMqEmtDv/C5Io
 XipTJ2x5A69tT58ZSvOI4+XIOYfU=
X-Gm-Gg: ASbGncsdl4L99WFXaesiQwxMYjycmULBv3b5f9gOFAU7MX8lQ1uekvVJRFq/fG8cT5i
 m60Cdoli2LVvmMTlgUXnT4zv1djdTFHCb5d/evYfFWSEoFvD7/ZpuC3bQdPTXPKJc5zw3FmENnp
 kKONCgtAcCz9ORFiF8nSp0PgJL/E4Y0x9LW87VT6luwW50sBGo4ejXLqtMmwhrkSqYm40S
X-Google-Smtp-Source: AGHT+IEf2IsyDIhx7A5HPfbVBbRUoVPhZjystc/aO6f/9OBa57Hc0/BRU447v5KvHQviG/q/4HAlXArIEoQ3ZYwEZFs=
X-Received: by 2002:a05:6102:2ac8:b0:4c3:6a7e:c9f3 with SMTP id
 ada2fe7eead31-4c4ec5fff96mr796406137.3.1742356429851; Tue, 18 Mar 2025
 20:53:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250318080738.29292-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250318080738.29292-1-krzysztof.kozlowski@linaro.org>
From: Inki Dae <daeinki@gmail.com>
Date: Wed, 19 Mar 2025 12:53:38 +0900
X-Gm-Features: AQ5f1Jo3Egh7dG7fcGfSF4ABESyAOzZSXSVedX1K1X4OVSCELDuZvTe39Y8-04o
Message-ID: <CAAQKjZP8DDQtKEtc7qFgO18w_EeNgSXYFOX=_tc7xHGKvsCnqw@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: exynos7_drm_decon: Consstify struct decon_data
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="00000000000012d8d50630a9f85a"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000012d8d50630a9f85a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Merged.

Thanks,
Inki Dae

2025=EB=85=84 3=EC=9B=94 18=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 5:19, K=
rzysztof Kozlowski <
krzysztof.kozlowski@linaro.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:

> static 'struct decon_data' is only read, so it can be const for code
> safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> index 5170f72b0830..f91daefa9d2b 100644
> --- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> @@ -43,13 +43,13 @@ struct decon_data {
>         unsigned int wincon_burstlen_shift;
>  };
>
> -static struct decon_data exynos7_decon_data =3D {
> +static const struct decon_data exynos7_decon_data =3D {
>         .vidw_buf_start_base =3D 0x80,
>         .shadowcon_win_protect_shift =3D 10,
>         .wincon_burstlen_shift =3D 11,
>  };
>
> -static struct decon_data exynos7870_decon_data =3D {
> +static const struct decon_data exynos7870_decon_data =3D {
>         .vidw_buf_start_base =3D 0x880,
>         .shadowcon_win_protect_shift =3D 8,
>         .wincon_burstlen_shift =3D 10,
> --
> 2.43.0
>
>
>

--00000000000012d8d50630a9f85a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Krzysztof,</div><div dir=3D"auto"><br></div><div =
dir=3D"auto">Merged.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Tha=
nks,</div><div dir=3D"auto">Inki Dae<br><br><div class=3D"gmail_quote gmail=
_quote_container" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">2025=
=EB=85=84 3=EC=9B=94 18=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 5:19, Krzys=
ztof Kozlowski &lt;<a href=3D"mailto:krzysztof.kozlowski@linaro.org">krzysz=
tof.kozlowski@linaro.org</a>&gt;=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">static &#39;struct decon_data&#39; is o=
nly read, so it can be const for code<br>
safety.<br>
<br>
Signed-off-by: Krzysztof Kozlowski &lt;<a href=3D"mailto:krzysztof.kozlowsk=
i@linaro.org" target=3D"_blank" rel=3D"noreferrer">krzysztof.kozlowski@lina=
ro.org</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/exynos/exynos7_drm_decon.c | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/e=
xynos/exynos7_drm_decon.c<br>
index 5170f72b0830..f91daefa9d2b 100644<br>
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c<br>
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c<br>
@@ -43,13 +43,13 @@ struct decon_data {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int wincon_burstlen_shift;<br>
=C2=A0};<br>
<br>
-static struct decon_data exynos7_decon_data =3D {<br>
+static const struct decon_data exynos7_decon_data =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .vidw_buf_start_base =3D 0x80,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .shadowcon_win_protect_shift =3D 10,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .wincon_burstlen_shift =3D 11,<br>
=C2=A0};<br>
<br>
-static struct decon_data exynos7870_decon_data =3D {<br>
+static const struct decon_data exynos7870_decon_data =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .vidw_buf_start_base =3D 0x880,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .shadowcon_win_protect_shift =3D 8,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .wincon_burstlen_shift =3D 10,<br>
-- <br>
2.43.0<br>
<br>
<br>
</blockquote></div></div></div>

--00000000000012d8d50630a9f85a--
