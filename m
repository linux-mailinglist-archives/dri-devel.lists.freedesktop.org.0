Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3317736DC4B
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 17:47:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF2688FDD;
	Wed, 28 Apr 2021 15:47:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B03D6E111
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 15:47:08 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 l10-20020a17090a850ab0290155b06f6267so3145223pjn.5
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 08:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FR4VebHJb51xCPyIYHwDlPXBLlPi9HnbG6Ct8peaY2k=;
 b=pa0Dt5H3GtN3dXiSJu/8K3iibwIyRBRb2PS8cC82+QX4EUK1GDjf/XSwzV+sstKU4A
 evlP8lqeosCXknvxdSbcJ7fMTBJAA+hLmegYAQV+WDcXkdb4L1HJ+bjfghlgmKbz5UtS
 IariBHzBCMzLkMuaxTjeNVAXjcul8KomK7/pBfdrP+ku1trJY33+R9n2fAzCgl4ZY5Nt
 NbaC+cuiMkQyRBOO3jtBuA0b6Jl5tvIzBl45RIRvPnhXE0qYi99C3dIbMsgvUPCCaXdL
 LFeuv0lem6DcNlWfgD/mTRtCPUZbb2kF4q5aUyV5CvREeELbldOtTkPzt56j8NZcmfrd
 phzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FR4VebHJb51xCPyIYHwDlPXBLlPi9HnbG6Ct8peaY2k=;
 b=pEuNPaTauiPJ3ox15eysilK+wQnE1xWTs/JD7kRREFQOOXw7UDIkFEEJpa+6NtxzZo
 J18nM0AbHV5XCAe+WL7MaWIOLCrkeKT96HU5gtnO53OCZkbMT0zImlK80UabxmLyKPVs
 DaizPOPSJ11vcIGFsaD9aPEmQbjm8SjoLZsJPJPdxb23aO/vLlZ+XM7RzrVhCi2odQcC
 j5w9Q6XsioJ5gExdwCsVXLZXnS4cjrjCh/sbrAdmkm5NuD/0BZLvazIakKS87L/k6dfy
 xbWIIgPdMifIzA3gLIl2Ofx1+GK8YaPUdRooj3/ICnL/Ivo576Viy4QETUtBgQAvfjIc
 9YTw==
X-Gm-Message-State: AOAM5328QywIOuYvR6O6ulhJwSmdmvFxqJ0HVTDzXOuBIcssa3/p/A4X
 C0zDcK7ipjNK/lQR/hYGcjd/rN/37WKx9H06E+O0cA==
X-Google-Smtp-Source: ABdhPJye0QKIyaf0M7+v5Y7xHFw1H6cygyY4UoYiSfc3SapgV38stH2k8ZYtnt7r1sw1UQQ7rbOJ6iZ1k0CEPXn8JsQ=
X-Received: by 2002:a17:90a:6687:: with SMTP id
 m7mr1966973pjj.75.1619624814266; 
 Wed, 28 Apr 2021 08:46:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210428115116.931328-1-hsinyi@chromium.org>
In-Reply-To: <20210428115116.931328-1-hsinyi@chromium.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 28 Apr 2021 17:46:43 +0200
Message-ID: <CAG3jFyvg-7qxDMkoWVgaqqt7wsDSafqrp8QXvYNWRJH98XMK2g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: anx7625: Fix power on delay
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Xin Ji <xji@analogixsemi.com>
Content-Type: multipart/mixed; boundary="===============0330717949=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0330717949==
Content-Type: multipart/alternative; boundary="000000000000458c2a05c10a4ad1"

--000000000000458c2a05c10a4ad1
Content-Type: text/plain; charset="UTF-8"

Merged.

https://cgit.freedesktop.org/drm/drm-misc/commit/?id=1fcf24fb07e254ca69001ab14adc8cf567127c44

On Wed, 28 Apr 2021 at 13:51, Hsin-Yi Wang <hsinyi@chromium.org> wrote:

> From anx7625 spec, the delay between powering on power supplies and gpio
> should be larger than 10ms.
>
> Fixes: 6c744983004e ("drm/bridge: anx7625: disable regulators when power
> off")
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
> v1->v2: Extend sleep range a bit as the regulator on some device takes
> more time to be powered on after regulator_enable() is called.
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c
> b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 23283ba0c4f9..b4e349ca38fe 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -893,7 +893,7 @@ static void anx7625_power_on(struct anx7625_data *ctx)
>                 usleep_range(2000, 2100);
>         }
>
> -       usleep_range(4000, 4100);
> +       usleep_range(11000, 12000);
>
>         /* Power on pin enable */
>         gpiod_set_value(ctx->pdata.gpio_p_on, 1);
> --
> 2.31.1.498.g6c1eba8ee3d-goog
>
>

--000000000000458c2a05c10a4ad1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Merged.<br><br><a href=3D"https://cgit.freedesktop.org/drm=
/drm-misc/commit/?id=3D1fcf24fb07e254ca69001ab14adc8cf567127c44">https://cg=
it.freedesktop.org/drm/drm-misc/commit/?id=3D1fcf24fb07e254ca69001ab14adc8c=
f567127c44</a></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, 28 Apr 2021 at 13:51, Hsin-Yi Wang &lt;<a href=3D"m=
ailto:hsinyi@chromium.org">hsinyi@chromium.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">From anx7625 spec, the delay =
between powering on power supplies and gpio<br>
should be larger than 10ms.<br>
<br>
Fixes: 6c744983004e (&quot;drm/bridge: anx7625: disable regulators when pow=
er off&quot;)<br>
Signed-off-by: Hsin-Yi Wang &lt;<a href=3D"mailto:hsinyi@chromium.org" targ=
et=3D"_blank">hsinyi@chromium.org</a>&gt;<br>
Reviewed-by: Neil Armstrong &lt;<a href=3D"mailto:narmstrong@baylibre.com" =
target=3D"_blank">narmstrong@baylibre.com</a>&gt;<br>
---<br>
v1-&gt;v2: Extend sleep range a bit as the regulator on some device takes<b=
r>
more time to be powered on after regulator_enable() is called.<br>
---<br>
=C2=A0drivers/gpu/drm/bridge/analogix/anx7625.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/br=
idge/analogix/anx7625.c<br>
index 23283ba0c4f9..b4e349ca38fe 100644<br>
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c<br>
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c<br>
@@ -893,7 +893,7 @@ static void anx7625_power_on(struct anx7625_data *ctx)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 usleep_range(2000, =
2100);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0usleep_range(4000, 4100);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0usleep_range(11000, 12000);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Power on pin enable */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gpiod_set_value(ctx-&gt;pdata.gpio_p_on, 1);<br=
>
-- <br>
2.31.1.498.g6c1eba8ee3d-goog<br>
<br>
</blockquote></div>

--000000000000458c2a05c10a4ad1--

--===============0330717949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0330717949==--
