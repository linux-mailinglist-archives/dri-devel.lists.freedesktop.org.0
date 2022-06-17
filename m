Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 751A454F19B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 09:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C83011A952;
	Fri, 17 Jun 2022 07:12:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D8111AD63
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 04:32:56 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id 23so5441234ybe.8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 21:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fYvxWmo/gtPcPNWz2JHZETNW1Lk7r5mXI16AzpmDmVY=;
 b=hqyJElAZypBVqYd7ldcibf4l05dRm6ns9yMsNkGuzAZA8FN07kCZ6nIFtcRLevyw1r
 arWazBVKzS8uQxOWBcDplm4fqrTnelItdpyMtF9yJZ2TbOwKDKFUeUgX0urN4438Cxfz
 4kTGBdbH4MZWCNYrD54Dzo1kUalcvSq74opPuhYObHz6XUu/MU+fnlGyi649vNS5uNwq
 UluTYrPGysGF/lQIsM5ZfiSR5n9lyM8hYg4IFk5a1d4stkWS5LaybO0kpr0uSVQKeJFC
 Hu6IUzHDv+2x8kF079XZnfNjnuYPmdhTCaUyPyYA/PsNwUxvIJJBWc40o6U8goI013sx
 SP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fYvxWmo/gtPcPNWz2JHZETNW1Lk7r5mXI16AzpmDmVY=;
 b=oU4R9jrXHYm7Kj7uzh/yMXlCkk9Zz9kNG+l2S0vitOauXlzcJcJQzW6CCe3Jm4ol7H
 uVTEGeNozmxdMYlTY404B5q/Q4R6KtX8TGIXBhmrFfF6KMSZ+SczOOcW2kQepRVJivyg
 y4g23clUDhXtK0sZ6L6jrgFo6FIJKoMuBxFYFraz9o8u59gDQJ1QHqjh8SrUZ0mcwYSg
 gdqNNiKZ0AE5UIYNr1Ao8OZ54Ntsm7TAmIqx21P5VylE/l6IhIetKEDVkwB4XQZu89Cj
 0iLmr1WZp71pmbj0amPfLgaXubzFmfgKyjgUOZKDZwsA7cBBcdWj3hy7/RmyvhoYIf1R
 qJTw==
X-Gm-Message-State: AJIora/9FG1Hlu+twbCmIxtIzORYsvxvxW57arfOxnInVaDLk0cdL8YU
 8aYXl992t9x0cqqOO7B6XyVRQnkgSYYNsfugVxk=
X-Google-Smtp-Source: AGRyM1setUWvP2RM/5r2k4ZEfXeUaLkb7MZMVlyaDqybV2o/tM9TgH32UUaR7F+9BDua/9/jkhPI4l8m3px3tMRko7U=
X-Received: by 2002:a05:6902:1209:b0:65f:fe1f:ccc5 with SMTP id
 s9-20020a056902120900b0065ffe1fccc5mr9222958ybu.470.1655440375338; Thu, 16
 Jun 2022 21:32:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220615222221.1501-1-jirivanek1@gmail.com>
 <20220615222221.1501-2-jirivanek1@gmail.com>
In-Reply-To: <20220615222221.1501-2-jirivanek1@gmail.com>
From: Vinay Simha B N <simhavcs@gmail.com>
Date: Fri, 17 Jun 2022 10:02:44 +0530
Message-ID: <CAGWqDJ5A2-nk-=SaOF0aZSCKR9yJZ+4QRUBQ55NxsYF2dqGiHg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/bridge/tc358775: Return before displaying
 inappropriate error message
To: Jiri Vanek <jirivanek1@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000084dc8505e19d3fe5"
X-Mailman-Approved-At: Fri, 17 Jun 2022 07:12:24 +0000
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000084dc8505e19d3fe5
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Vinay Simha BN <simhavcs@gmail.com>

On Thu, Jun 16, 2022 at 3:55 AM Jiri Vanek <jirivanek1@gmail.com> wrote:

> Function for reading from i2c device register displays error message even
> if reading ends correctly. Add return to avoid falling through into
> the fail label.
>
> Signed-off-by: Jiri Vanek <jirivanek1@gmail.com>
> ---
>  drivers/gpu/drm/bridge/tc358775.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/bridge/tc358775.c
> b/drivers/gpu/drm/bridge/tc358775.c
> index 62a7ef352daa..cd2721ab02a9 100644
> --- a/drivers/gpu/drm/bridge/tc358775.c
> +++ b/drivers/gpu/drm/bridge/tc358775.c
> @@ -339,6 +339,7 @@ static void d2l_read(struct i2c_client *i2c, u16 addr,
> u32 *val)
>                 goto fail;
>
>         pr_debug("d2l: I2C : addr:%04x value:%08x\n", addr, *val);
> +       return;
>
>  fail:
>         dev_err(&i2c->dev, "Error %d reading from subaddress 0x%x\n",
> --
> 2.30.2
>
>

-- 
regards,
vinaysimha

--00000000000084dc8505e19d3fe5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Vinay Simha BN &lt;<a href=3D"mailto:simhavcs=
@gmail.com">simhavcs@gmail.com</a>&gt;</div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 16, 2022 at 3:55 AM Jiri =
Vanek &lt;<a href=3D"mailto:jirivanek1@gmail.com">jirivanek1@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Funct=
ion for reading from i2c device register displays error message even<br>
if reading ends correctly. Add return to avoid falling through into<br>
the fail label.<br>
<br>
Signed-off-by: Jiri Vanek &lt;<a href=3D"mailto:jirivanek1@gmail.com" targe=
t=3D"_blank">jirivanek1@gmail.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/bridge/tc358775.c | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc3=
58775.c<br>
index 62a7ef352daa..cd2721ab02a9 100644<br>
--- a/drivers/gpu/drm/bridge/tc358775.c<br>
+++ b/drivers/gpu/drm/bridge/tc358775.c<br>
@@ -339,6 +339,7 @@ static void d2l_read(struct i2c_client *i2c, u16 addr, =
u32 *val)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_debug(&quot;d2l: I2C : addr:%04x value:%08x\=
n&quot;, addr, *val);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
<br>
=C2=A0fail:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&amp;i2c-&gt;dev, &quot;Error %d readin=
g from subaddress 0x%x\n&quot;,<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">regards,<br>vinaysimha</div>

--00000000000084dc8505e19d3fe5--
