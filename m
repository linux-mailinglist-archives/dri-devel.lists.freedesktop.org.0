Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 452245933EA
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 19:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0687AE91E;
	Mon, 15 Aug 2022 17:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B87979A369
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 14:24:01 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-324ec5a9e97so76123147b3.7
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 07:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=kQQEaPp2Z1x+uRKoO9699voAY2Wj6klgLTPVLoLCvwY=;
 b=LjN+OpFAH03eKRaPpRA0npbbHABADnljnJlmSjYvfSvMx3/anFEuOSBnbwpPLDcdh3
 lMs99D4Kr3wq84oq/pghoiliGDATNN3NuOQv4KFwhC2uF6dvvIzLiPb/xbR+xYRUBo6+
 G3u6Dv+4183zse4x7TkbVHmgigXlhMj+6iR3CDqXIqOONk29b69G1WBeDBazXvzRpSw0
 tsy4rZk2PzwTtkD3870Z1Rs6IqQKEZqidCOHzFypkD4siSj882JE+3nGQ79ELA5HN9Yv
 HBdmkcvD3cNbnBtK6rE/ysz8wk4Gt0BZXo4WzXT7m1WCYIDhxrbIZlKV6NOok5SPpyEL
 cY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=kQQEaPp2Z1x+uRKoO9699voAY2Wj6klgLTPVLoLCvwY=;
 b=Q3IUHC0cUPtbP69HOSczEXURA1ZSzwbcUInvJMU6kyOcAYsZ9urky7Jh7wvbNiCGRa
 AVbXxqnldPCNanrUdZmpfnD/BbyjtzOa0LA5dKhfH2UaXRErv1wMrQhxqFfXx0k0d+e6
 SRjkuzQdqH2xmgIy/K5Jik94v+cm44hFQdB4WI93dz5GQNDbVEnhc9AUQMGtNUJ0ihlt
 0cRppyC5fgU2ssSd1v8KD3GvVs+6/iqlVFwLiwx+RLQHSbGHKeYh+HBmYLxx3J+GAugK
 8we2iJWSbbT8Gqc0UdXnHYa6ZOLEEqQfzFfesWs3fvv39zH2a9EnsVfy5gHmPUWUAl0U
 KhVw==
X-Gm-Message-State: ACgBeo0GlbDtIeG6mfSt/+6aOZselr9UjIUPc3ujReM5H+8jIUZTz3s4
 bXQBdCT2OXZYZYYVGffeswexFMjPPBzzd7gQSikw6Q==
X-Google-Smtp-Source: AA6agR6qu89G/Z5zZf/8RMW3WBMTSYwHu9O5gaJYuXBJl/5kQE4Bp2zAqIoOO3I5aASGkLCj0X5XpzqXKXQM2cwQSAI=
X-Received: by 2002:a25:b745:0:b0:67c:182d:6d43 with SMTP id
 e5-20020a25b745000000b0067c182d6d43mr11932836ybm.496.1660573440389; Mon, 15
 Aug 2022 07:24:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220815093905.134164-1-hsinyi@chromium.org>
In-Reply-To: <20220815093905.134164-1-hsinyi@chromium.org>
From: Rock Chiu <rock.chiu@paradetech.corp-partner.google.com>
Date: Mon, 15 Aug 2022 22:23:49 +0800
Message-ID: <CAMuczyViora7h_UO+1R6MSYNKOEuRJYEBm_wH134xeDLRGRy+w@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ps8640: Add double reset T4 and T5 to
 power-on sequence
To: Hsin-Yi Wang <hsinyi@chromium.org>
Content-Type: multipart/alternative; boundary="00000000000009cad205e648620d"
X-Mailman-Approved-At: Mon, 15 Aug 2022 17:12:57 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000009cad205e648620d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Rock Chiu rock.chiu@paradetech.corp-partner.google.com

Rock Chiu


Hsin-Yi Wang <hsinyi@chromium.org> =E6=96=BC 2022=E5=B9=B48=E6=9C=8815=E6=
=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=885:39=E5=AF=AB=E9=81=93=EF=BC=9A

> The double reset power-on sequence is a workaround for the hardware
> flaw in some chip that SPI Clock output glitch and cause internal MPU
> unable to read firmware correctly. The sequence is suggested in ps8640
> application note.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/bridge/parade-ps8640.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c
> b/drivers/gpu/drm/bridge/parade-ps8640.c
> index 49107a6cdac18..d7483c13c569b 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -375,6 +375,11 @@ static int __maybe_unused ps8640_resume(struct devic=
e
> *dev)
>         gpiod_set_value(ps_bridge->gpio_reset, 1);
>         usleep_range(2000, 2500);
>         gpiod_set_value(ps_bridge->gpio_reset, 0);
> +       /* Double reset for T4 and T5 */
> +       msleep(50);
> +       gpiod_set_value(ps_bridge->gpio_reset, 1);
> +       msleep(50);
> +       gpiod_set_value(ps_bridge->gpio_reset, 0);
>
>         /*
>          * Mystery 200 ms delay for the "MCU to be ready". It's unclear i=
f
> --
> 2.37.1.595.g718a3a8f04-goog
>
>

--00000000000009cad205e648620d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(32,33,36);font-family:Roboto,Aria=
l,sans-serif;font-size:13px;letter-spacing:0.185714px">Reviewed-by: Rock Ch=
iu=C2=A0</span><a target=3D"_self" style=3D"margin:0px;border:0px;font-fami=
ly:Roboto,Arial,sans-serif;vertical-align:baseline;outline-width:0px;font-s=
ize:13px;letter-spacing:0.185714px"><span class=3D"gmail-ng-star-inserted">=
</span></a><a rel=3D"noopener noreferrer nofollow" class=3D"gmail-keep-focu=
s-ring" target=3D"_self" href=3D"mailto:rock.chiu@paradetech.corp-partner.g=
oogle.com" style=3D"margin:0px;border:0px;font-weight:inherit;font-style:in=
herit;font-family:inherit;vertical-align:baseline;text-decoration-line:none=
"><span style=3D"margin:0px;border:0px;font-weight:inherit;font-style:inher=
it;font-family:inherit;vertical-align:baseline;outline-width:0px">rock.chiu=
@paradetech.corp-partner.google.com</span></a><div><br clear=3D"all"><div><=
div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature=
"><div dir=3D"ltr">Rock Chiu</div></div></div><br></div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Hsin-Yi Wang &lt;<a=
 href=3D"mailto:hsinyi@chromium.org">hsinyi@chromium.org</a>&gt; =E6=96=BC =
2022=E5=B9=B48=E6=9C=8815=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=885:3=
9=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">The double reset power-on sequence is a workaround for the har=
dware<br>
flaw in some chip that SPI Clock output glitch and cause internal MPU<br>
unable to read firmware correctly. The sequence is suggested in ps8640<br>
application note.<br>
<br>
Signed-off-by: Hsin-Yi Wang &lt;<a href=3D"mailto:hsinyi@chromium.org" targ=
et=3D"_blank">hsinyi@chromium.org</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/bridge/parade-ps8640.c | 5 +++++<br>
=C2=A01 file changed, 5 insertions(+)<br>
<br>
diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridg=
e/parade-ps8640.c<br>
index 49107a6cdac18..d7483c13c569b 100644<br>
--- a/drivers/gpu/drm/bridge/parade-ps8640.c<br>
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c<br>
@@ -375,6 +375,11 @@ static int __maybe_unused ps8640_resume(struct device =
*dev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gpiod_set_value(ps_bridge-&gt;gpio_reset, 1);<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 usleep_range(2000, 2500);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gpiod_set_value(ps_bridge-&gt;gpio_reset, 0);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Double reset for T4 and T5 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0msleep(50);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_set_value(ps_bridge-&gt;gpio_reset, 1);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0msleep(50);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_set_value(ps_bridge-&gt;gpio_reset, 0);<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Mystery 200 ms delay for the &quot;MCU =
to be ready&quot;. It&#39;s unclear if<br>
-- <br>
2.37.1.595.g718a3a8f04-goog<br>
<br>
</blockquote></div>

--00000000000009cad205e648620d--
