Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAA617121C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 09:13:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C1DC6EC0B;
	Thu, 27 Feb 2020 08:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E903C6E07F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 04:42:51 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id r17so1633431wrj.7
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 20:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UYonJsbRQ4X/ZtT3nyD1T8bLQQW7oOMof/INh73rxkQ=;
 b=wDrNcgbG1abFulS2ErpDe9L785jVek84PAfa+XEGvW4FEcRMXMkDEtPOWdiDEWrcLb
 4mVE2D6VSlVKetCg4vYMC50+ZBrZuQhJK+lWzwpSF8Dg/xOZVkbXB5mjkap+Y6qTPs1x
 hVLc57RxzScmVs1+aqETfEXeyxINuECedfF7ar/POppJ4+VARYsQF3ucU37fSrKSM2W0
 hSP4wF7Kf11vAd+ycvFwN85ObaS9PDp0AXcMsz08ucoP5Rw4oYwG8vLIKjKV9c3Xr3Uy
 I5NyelNxwW9GGKqWXpKqx+HwQJtvUjFWYJrJ5YJgTKsn5v1qRzM/KSHqqyIVliedt+g0
 N5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UYonJsbRQ4X/ZtT3nyD1T8bLQQW7oOMof/INh73rxkQ=;
 b=pNa5qZ0lRW7DaGaFyBPe5oSvUiOFqOfGOgHLSX2e6pC1mPtwYwBmoLQcCzKJye8ZGq
 DhbXJx26vMPE90DjZsHkHc0LrezEhmhn3lEgjxN43MDpPAM1/dApyBrHStOLTHTevnBZ
 v5kFzYcepKBRCCjz6Iuropq3QnVaHtJkzpWdTUtBaWIpd+ZYNvJEfza6laoDguYEUY/q
 Lq4AsiFPxGbx5n5cz3ANAHmLaSnvtegPcQxcgOpkVw9xvHRA/uNkWD06eZILxg2vWTwL
 hXiIou3a8UCpO8b+3B+jk4cPZotfgLaAkjW7GNj1ieCc5T/l1GxzyOOqGWNYUEvkoOEx
 AYXA==
X-Gm-Message-State: APjAAAUkykRDZdlVmCKky9utBr3oGjdGaw+CK8R2zwRbftIKzxRDfz7m
 6POhgXxOvx0PJt7EyJFHkzd77GGoVO267v2jxWS0dQ==
X-Google-Smtp-Source: APXvYqyyie3j3xOCY8G3mjHtaXXg0FrcDSQC6ikNa9+EJqWpw4yTTbNBbslijnfx29JhInQbRFv5b0g3/vSIcwMSsbw=
X-Received: by 2002:adf:df83:: with SMTP id z3mr2368174wrl.389.1582778570632; 
 Wed, 26 Feb 2020 20:42:50 -0800 (PST)
MIME-Version: 1.0
References: <1578023756-46567-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1578023756-46567-1-git-send-email-tiantao6@hisilicon.com>
From: Xinliang Liu <xinliang.liu@linaro.org>
Date: Thu, 27 Feb 2020 12:42:39 +0800
Message-ID: <CAKoKPbxJyOh1Ec9Ff-evnpCsrh71p7vnVo3h4AcmbUnkNKWxSw@mail.gmail.com>
Subject: Re: [PATCH] drm/hisilicon: fixed the wrong resolution configurations
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
Content-Type: multipart/mixed; boundary="===============1100010306=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1100010306==
Content-Type: multipart/alternative; boundary="00000000000076294a059f875aac"

--00000000000076294a059f875aac
Content-Type: text/plain; charset="UTF-8"

Thanks for the patch.
Applied to drm-misc-next.

On Fri, 3 Jan 2020 at 11:55, Tian Tao <tiantao6@hisilicon.com> wrote:

> The maximum resolution supported by hibmc is 1920 * 1200 instead of
> 1920 * 1440, this patch fixed this problem
>
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> Signed-off-by: Gong junjie <gongjunjie2@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index 2fd4ca9..dbdeb2b 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -89,7 +89,7 @@ static int hibmc_kms_init(struct hibmc_drm_private *priv)
>         priv->dev->mode_config.min_width = 0;
>         priv->dev->mode_config.min_height = 0;
>         priv->dev->mode_config.max_width = 1920;
> -       priv->dev->mode_config.max_height = 1440;
> +       priv->dev->mode_config.max_height = 1200;
>
>         priv->dev->mode_config.fb_base = priv->fb_base;
>         priv->dev->mode_config.preferred_depth = 24;
> --
> 2.7.4
>
>

--00000000000076294a059f875aac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the patch.<br>Applied to drm-misc-next.<br></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On F=
ri, 3 Jan 2020 at 11:55, Tian Tao &lt;<a href=3D"mailto:tiantao6@hisilicon.=
com">tiantao6@hisilicon.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">The maximum resolution supported by hibmc is 192=
0 * 1200 instead of<br>
1920 * 1440, this patch fixed this problem<br>
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
index 2fd4ca9..dbdeb2b 100644<br>
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c<br>
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c<br>
@@ -89,7 +89,7 @@ static int hibmc_kms_init(struct hibmc_drm_private *priv)=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 priv-&gt;dev-&gt;mode_config.min_width =3D 0;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 priv-&gt;dev-&gt;mode_config.min_height =3D 0;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 priv-&gt;dev-&gt;mode_config.max_width =3D 1920=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;dev-&gt;mode_config.max_height =3D 144=
0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;dev-&gt;mode_config.max_height =3D 120=
0;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 priv-&gt;dev-&gt;mode_config.fb_base =3D priv-&=
gt;fb_base;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 priv-&gt;dev-&gt;mode_config.preferred_depth =
=3D 24;<br>
-- <br>
2.7.4<br>
<br>
</blockquote></div>

--00000000000076294a059f875aac--

--===============1100010306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1100010306==--
