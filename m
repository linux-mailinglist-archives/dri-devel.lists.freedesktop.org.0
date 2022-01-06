Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA07E487422
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 09:33:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D2211AC6C;
	Fri,  7 Jan 2022 08:33:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B32BD10E60A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 19:22:21 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id d201so10315037ybc.7
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jan 2022 11:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RrC8aje6km/1ES6rDpplrGhbv7V0Qz1ViNM3eJyFAhs=;
 b=hC7q7olhv7CNpdj1SejBRWuDjNCk8MzGCmwvY42Mv0hz7Urxo2flQ+FM21DKUvk6IV
 hKxtpp11UMNxp0Bqtw8SjTsh6G6aoZteyzkSfTwS7LKs3s0wrT4Ast3B3tUjvzlw4084
 jPEzssWlF6K33GQk3avErS/ME2VDOzzdg+dEbqYnFgwNZMSJPsHUCEXM/nlKKgYFrL7z
 k0L6jVxQF/ahqgQ1rB9wHaau5mvnqxJNWBQPjn2AINeSS8iq+SfPBpdrV7lI9vd6/F0Z
 kpSPUFy+hnvV6HHK7gzn052ywJwxthHVD/4B3EJu72ZiqNq9USiM99BzZC/k1JKzm7Oz
 kuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RrC8aje6km/1ES6rDpplrGhbv7V0Qz1ViNM3eJyFAhs=;
 b=aREn9hKAlVwrnqPFdFYVR3E0G+2Ily+a6R6tI2recLFFMCQcR14Yxum/7CI5l2ZpoK
 QCrcfGuKWZnwg6P9CCAGgMtPjH4ItIbn3u67xKk/qpwAfm6sKron7UP/TTN7EDvEXVji
 Vhp1Qz3njp8KQHbVCWMS1j10YgnFjSNk7UL78U8rhyY4qqGCHbFfyqN+sHi9raFf8i1V
 mE+T5D/bb6mEvUn3EPjM+rxhetdb9ZT5830c52rNrNDKv+pjLAVbbJb1AMHzqmjvxNGy
 YwSGknEWKqa9gM7qvk11JnIsb2KK7xL5qob2LYTJVigfdk0Q1AZNNxea044bvCEiWaS4
 Hj9A==
X-Gm-Message-State: AOAM533yem1BMsROK2syJLSlbIKq/LMFIwU+2eFqJLLWnHwYligHVWf8
 HqkUMbO2ajvoZIhfSnZnzPS0gboTjF8bLvvd7wU=
X-Google-Smtp-Source: ABdhPJwRkfTyj5IzVDqvuKz5RiYydwbEdgu1xS8PXZQcLUdyhm7XqUT/WvwehDV8qS+QQjstpf2mGK97BLyYse1hkCY=
X-Received: by 2002:a25:3417:: with SMTP id b23mr73871780yba.370.1641496940264; 
 Thu, 06 Jan 2022 11:22:20 -0800 (PST)
MIME-Version: 1.0
References: <20211110220050.2854-1-jirivanek1@gmail.com>
 <20220106190027.1498-1-jirivanek1@gmail.com>
In-Reply-To: <20220106190027.1498-1-jirivanek1@gmail.com>
From: Vinay Simha B N <simhavcs@gmail.com>
Date: Fri, 7 Jan 2022 00:52:08 +0530
Message-ID: <CAGWqDJ6T6EGNjoc2qfNHLMdcuwcnJArF7a7sToRXJ90Zs57E_A@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge/tc358775: Fix for dual-link LVDS
To: Jiri Vanek <jirivanek1@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000006414705d4eeca7c"
X-Mailman-Approved-At: Fri, 07 Jan 2022 08:33:30 +0000
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

--00000000000006414705d4eeca7c
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Vinay Simha BN <simhavcs@gmail.com>

Jiri Vanek,
Could you please share the part number or datasheet of the dual-link LVDS
display/panel used.


On Fri, Jan 7, 2022 at 12:30 AM Jiri Vanek <jirivanek1@gmail.com> wrote:

> Fixed wrong register shift for single/dual link LVDS output.
>
> Tested-by: Jiri Vanek <jirivanek1@gmail.com>
> Signed-off-by: Jiri Vanek <jirivanek1@gmail.com>
>
> ---
> v1:
> * Initial version
>
> v2:
> * Tested-by tag added
>
> ---
>  drivers/gpu/drm/bridge/tc358775.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358775.c
> b/drivers/gpu/drm/bridge/tc358775.c
> index 2272adcc5b4a..1d6ec1baeff2 100644
> --- a/drivers/gpu/drm/bridge/tc358775.c
> +++ b/drivers/gpu/drm/bridge/tc358775.c
> @@ -241,7 +241,7 @@ static inline u32 TC358775_LVCFG_PCLKDIV(uint32_t val)
>  }
>
>  #define TC358775_LVCFG_LVDLINK__MASK                         0x00000002
> -#define TC358775_LVCFG_LVDLINK__SHIFT                        0
> +#define TC358775_LVCFG_LVDLINK__SHIFT                        1
>  static inline u32 TC358775_LVCFG_LVDLINK(uint32_t val)
>  {
>         return ((val) << TC358775_LVCFG_LVDLINK__SHIFT) &
> --
> 2.30.2
>
>

-- 
regards,
vinaysimha

--00000000000006414705d4eeca7c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Reviewed-by: Vinay Simha BN &lt;<a href=3D"mailto:sim=
havcs@gmail.com">simhavcs@gmail.com</a>&gt;</div><div><br></div><div>Jiri V=
anek,<br></div><div>Could you please share the part number or datasheet of =
the dual-link LVDS display/panel used.</div></div><br><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 7, 2022 at 12:3=
0 AM Jiri Vanek &lt;<a href=3D"mailto:jirivanek1@gmail.com">jirivanek1@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Fixed wrong register shift for single/dual link LVDS output.<br>
<br>
Tested-by: Jiri Vanek &lt;<a href=3D"mailto:jirivanek1@gmail.com" target=3D=
"_blank">jirivanek1@gmail.com</a>&gt;<br>
Signed-off-by: Jiri Vanek &lt;<a href=3D"mailto:jirivanek1@gmail.com" targe=
t=3D"_blank">jirivanek1@gmail.com</a>&gt;<br>
<br>
---<br>
v1:<br>
* Initial version<br>
<br>
v2:<br>
* Tested-by tag added<br>
<br>
---<br>
=C2=A0drivers/gpu/drm/bridge/tc358775.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc3=
58775.c<br>
index 2272adcc5b4a..1d6ec1baeff2 100644<br>
--- a/drivers/gpu/drm/bridge/tc358775.c<br>
+++ b/drivers/gpu/drm/bridge/tc358775.c<br>
@@ -241,7 +241,7 @@ static inline u32 TC358775_LVCFG_PCLKDIV(uint32_t val)<=
br>
=C2=A0}<br>
<br>
=C2=A0#define TC358775_LVCFG_LVDLINK__MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x00000002<br>
-#define TC358775_LVCFG_LVDLINK__SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>
+#define TC358775_LVCFG_LVDLINK__SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1<br>
=C2=A0static inline u32 TC358775_LVCFG_LVDLINK(uint32_t val)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ((val) &lt;&lt; TC358775_LVCFG_LVDLINK__=
SHIFT) &amp;<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">regards,<br>vinaysimha</div>

--00000000000006414705d4eeca7c--
