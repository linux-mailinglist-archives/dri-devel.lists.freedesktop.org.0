Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93010171226
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 09:13:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A1F6EC18;
	Thu, 27 Feb 2020 08:13:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC7B16E436
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 04:40:25 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id z12so1948795wmi.4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 20:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o2wBnPoHk+gak6teJWG83gLm9R1pohmBuxsgoQJWTVY=;
 b=tVMleHUzm0TlGrF1DNLtzALqVryv2klVNriP3GIqInQ9by/LPhTXa7Fw6RO5HckvjM
 ilJ7DFfMoW8zXAciVo5rFEDE3Mk4FUNJvAaBenVilIZAAF7Yw0bO0IxW1tj7tpT8r6my
 vp3Y52RqLPbzGYNB51jYT6sXcDhcNzkwokNf1F/j/lxnZ59YFfQDdS530yQM8kwc97j7
 YFL+qJK1s+8JmZFX2zxcKRrbVUQ+6OsP0p3vkqvEYAuZXWKBeZbPyX9E7uF4zOZBToyQ
 jUqI5H6BnPE3bkvk6+Z9aOza6rXP/TWni+Zm2W7Qbd+BTemuw5wHoTBISikr3NsuvG+u
 9x1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o2wBnPoHk+gak6teJWG83gLm9R1pohmBuxsgoQJWTVY=;
 b=O3q75OydiobSK7XVSDFl+jB1T7DR9B5y7Y73fluSjq2/IrvQrPgeVIObT/iROjFepj
 ENxx59+6DzEACx6/Dm/RCCowW7Wwm3ZOo3PjxxvA6g9lbFO6zldCVd6a+o5tmWZIO1xK
 vnuJr1YVhfMTFu4wyGgWDbdTy7u9i9wnBVJE0tTAuCMLgsMcMr/guuJNW3ARvGr45Dl3
 ltUVCRjljgKiO8bTiosn6WRWgrxtOfF0J2DL/X9tv+X2fhGU7oTeI4dGqO2JUAp3JrGM
 y0YPbvIdgJHxiN30SF3GbnKVR1Un7zApurAPZT5OJADo6alKowVmu60JByX3jvk7vS6l
 0B8A==
X-Gm-Message-State: APjAAAWEHlqCN/QOP1rzJMSE7w8fG1NyOytJHuRkAhbnlunVLnl86Vod
 RkdJIbXn0VRQbaxJAkPHz//uz6NVFrViaqz+D4J4ew==
X-Google-Smtp-Source: APXvYqzlwVNM2hCazoQaxlUAG1Ulc8MvUjsAPqbQPiTatC/T2bv3FTDlCviSKXvGlzdx/Fasx2w+4U0uqI+3giYvnE0=
X-Received: by 2002:a05:600c:218a:: with SMTP id
 e10mr2676779wme.6.1582778424445; 
 Wed, 26 Feb 2020 20:40:24 -0800 (PST)
MIME-Version: 1.0
References: <1578712146-16327-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1578712146-16327-1-git-send-email-tiantao6@hisilicon.com>
From: Xinliang Liu <xinliang.liu@linaro.org>
Date: Thu, 27 Feb 2020 12:40:12 +0800
Message-ID: <CAKoKPbzfSV9-5SSeLrYh47HGxaC6o1u4Dz6rpxJuWoBbrb6=Ow@mail.gmail.com>
Subject: Re: [PATCH] drm/hisilicon: Enable the shadowfb for hibmc
To: Tian Tao <tiantao6@hisilicon.com>
X-Mailman-Approved-At: Thu, 27 Feb 2020 08:13:09 +0000
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
Cc: airlied@linux.ie, puck.chen@hisilicon.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linuxarm@huawei.com, kraxel@redhat.com,
 tzimmermann@suse.de, alexander.deucher@amd.com, tglx@linutronix.de
Content-Type: multipart/mixed; boundary="===============1460490226=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1460490226==
Content-Type: multipart/alternative; boundary="000000000000bf687c059f8751ca"

--000000000000bf687c059f8751ca
Content-Type: text/plain; charset="UTF-8"

Thanks for the patch.
Applied to drm-misc-next.

On Sat, 11 Jan 2020 at 11:09, Tian Tao <tiantao6@hisilicon.com> wrote:

> set the prefer_shadow as 1,so we use the shadowfb to acceleration.
>
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> Signed-off-by: Gong junjie <gongjunjie2@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index dbdeb2b..2883555 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -93,7 +93,7 @@ static int hibmc_kms_init(struct hibmc_drm_private *priv)
>
>         priv->dev->mode_config.fb_base = priv->fb_base;
>         priv->dev->mode_config.preferred_depth = 24;
> -       priv->dev->mode_config.prefer_shadow = 0;
> +       priv->dev->mode_config.prefer_shadow = 1;
>
>         priv->dev->mode_config.funcs = (void *)&hibmc_mode_funcs;
>
> --
> 2.7.4
>
>

--000000000000bf687c059f8751ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the patch.<br>Applied to drm-misc-next.<br></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On S=
at, 11 Jan 2020 at 11:09, Tian Tao &lt;<a href=3D"mailto:tiantao6@hisilicon=
.com">tiantao6@hisilicon.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">set the prefer_shadow as 1,so we use the shadow=
fb to acceleration.<br>
<br>
Signed-off-by: Tian Tao &lt;<a href=3D"mailto:tiantao6@hisilicon.com" targe=
t=3D"_blank">tiantao6@hisilicon.com</a>&gt;<br>
Signed-off-by: Gong junjie &lt;<a href=3D"mailto:gongjunjie2@huawei.com" ta=
rget=3D"_blank">gongjunjie2@huawei.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/=
drm/hisilicon/hibmc/hibmc_drm_drv.c<br>
index dbdeb2b..2883555 100644<br>
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c<br>
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c<br>
@@ -93,7 +93,7 @@ static int hibmc_kms_init(struct hibmc_drm_private *priv)=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 priv-&gt;dev-&gt;mode_config.fb_base =3D priv-&=
gt;fb_base;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 priv-&gt;dev-&gt;mode_config.preferred_depth =
=3D 24;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;dev-&gt;mode_config.prefer_shadow =3D =
0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;dev-&gt;mode_config.prefer_shadow =3D =
1;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 priv-&gt;dev-&gt;mode_config.funcs =3D (void *)=
&amp;hibmc_mode_funcs;<br>
<br>
-- <br>
2.7.4<br>
<br>
</blockquote></div>

--000000000000bf687c059f8751ca--

--===============1460490226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1460490226==--
