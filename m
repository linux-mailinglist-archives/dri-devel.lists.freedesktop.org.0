Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E5C171234
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 09:14:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 924876EC16;
	Thu, 27 Feb 2020 08:14:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B106E07F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 04:41:39 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id f15so1958052wml.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 20:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ATY4FirrWSRXwibhVzuS9x+D/nw752P7FZdija4RCNQ=;
 b=gmg/er50IvxXlWNr0zfc/dvQNv03qhfATae241DtxAZu1+ZtFllYnggWsathlrRgwk
 Gwr4fHoW4uG/UgbwAVz+KmoNFhvakTFpDutUcS6bXDKvKVH/otHYO8tpOGN15KkXQtLY
 YeeG2/p6l3dppCPojjwTn/7Iw7D/sdscr9U1APhJYDfue7VlWNHWGyoiK8+vCbByvLHE
 qe0y6txBxT37ivTfAtRIZHnJN3fuJLOt6wf8R53RyzyCCMV3fYpnAUwr9+cmtOklXWcr
 HUUYeoD7YtzHZM/wh5OfiSSEhX+SSQolHGHdggA1QQu3zUjmQwQMGZB1TWX7jB6tEDhO
 V6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ATY4FirrWSRXwibhVzuS9x+D/nw752P7FZdija4RCNQ=;
 b=AHAao3SHLvbO5JK+AYQbYZQxPUxjBXpX+/HiBQ5+Gx0btMR69Ql3IYtSD1mqa/eVz4
 od4ng3Penwx51+KFn9JDoojEygfIU1w2tMjyl/Z2ILdVm1M+Sck1zRjQVGE6ftR9QTDI
 OVasEdPZuVnMMNrxmTP258qUB9x0XaagwO9O45+jbwpcZ0RzkuvdURXa0Rd8yv/vwRU0
 JjGh0qAvnoyA7uOUyZsDxo5mIv1Al7d/ZUihvNmKRQnAOSGH1813UhZanZrLHLmX4jNO
 6BWYIATv6DZ/YfWYHahIM6PmVSC4LHxZFfSLACBSFwYNMFQS3ZgF4tE3B/FjsDmk9VYh
 v0FA==
X-Gm-Message-State: APjAAAWCoGGyDiku7+AFyQGIavXa9XXElzBUiC4+ywu0DKsOZE3erp6g
 ZntD3hoIlmMA5eweh+gEG0DQmmOJTmcc5WziJvLURUqD06yyww==
X-Google-Smtp-Source: APXvYqwvk99BX7pf0oATbtVpr3E2NR/Z3kuUNA6ggqJtAJ2Pyk14N8ZY6F+h7/cWChOK8QJnDND1leHdEDjjGiGWebU=
X-Received: by 2002:a1c:6056:: with SMTP id u83mr2763181wmb.53.1582778497854; 
 Wed, 26 Feb 2020 20:41:37 -0800 (PST)
MIME-Version: 1.0
References: <1578476501-45807-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1578476501-45807-1-git-send-email-tiantao6@hisilicon.com>
From: Xinliang Liu <xinliang.liu@linaro.org>
Date: Thu, 27 Feb 2020 12:41:26 +0800
Message-ID: <CAKoKPbwy_2iiPb=myySoKb1UmYMPrZk=RfWKgU6wanwzKZ_NqA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/hisilicon: Add the mode_valid function
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
Content-Type: multipart/mixed; boundary="===============1070386407=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1070386407==
Content-Type: multipart/alternative; boundary="0000000000001f8dbb059f875636"

--0000000000001f8dbb059f875636
Content-Type: text/plain; charset="UTF-8"

Thanks for the patch.
Applied to drm-misc-next.

On Wed, 8 Jan 2020 at 17:41, Tian Tao <tiantao6@hisilicon.com> wrote:

> add mode_valid function, we can make sure the resolution is valid.
>
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> Signed-off-by: Gong junjie <gongjunjie2@huawei.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> ---
> v2:     declare hibmc_crtc_mode_valid as static.
>         Modify the return value of hibmc_crtc_mode_valid .
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> index 843d784..675d629 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> @@ -242,6 +242,24 @@ static void hibmc_crtc_atomic_disable(struct drm_crtc
> *crtc,
>         hibmc_set_current_gate(priv, reg);
>  }
>
> +static enum drm_mode_status hibmc_crtc_mode_valid(struct drm_crtc *crtc,
> +                                       const struct drm_display_mode
> *mode)
> +{
> +       int i = 0;
> +       int vrefresh = drm_mode_vrefresh(mode);
> +
> +       if (vrefresh < 59 || vrefresh > 61)
> +               return MODE_NOCLOCK;
> +
> +       for (i = 0; i < ARRAY_SIZE(hibmc_pll_table); i++) {
> +               if (hibmc_pll_table[i].hdisplay == mode->hdisplay &&
> +                       hibmc_pll_table[i].vdisplay == mode->vdisplay)
> +                       return MODE_OK;
> +       }
> +
> +       return MODE_BAD;
> +}
> +
>  static unsigned int format_pll_reg(void)
>  {
>         unsigned int pllreg = 0;
> @@ -510,6 +528,7 @@ static const struct drm_crtc_helper_funcs
> hibmc_crtc_helper_funcs = {
>         .atomic_flush   = hibmc_crtc_atomic_flush,
>         .atomic_enable  = hibmc_crtc_atomic_enable,
>         .atomic_disable = hibmc_crtc_atomic_disable,
> +       .mode_valid = hibmc_crtc_mode_valid,
>  };
>
>  int hibmc_de_init(struct hibmc_drm_private *priv)
> --
> 2.7.4
>
>

--0000000000001f8dbb059f875636
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the patch.<br>Applied to drm-misc-next.<br></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On W=
ed, 8 Jan 2020 at 17:41, Tian Tao &lt;<a href=3D"mailto:tiantao6@hisilicon.=
com">tiantao6@hisilicon.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">add mode_valid function, we can make sure the re=
solution is valid.<br>
<br>
Signed-off-by: Tian Tao &lt;<a href=3D"mailto:tiantao6@hisilicon.com" targe=
t=3D"_blank">tiantao6@hisilicon.com</a>&gt;<br>
Signed-off-by: Gong junjie &lt;<a href=3D"mailto:gongjunjie2@huawei.com" ta=
rget=3D"_blank">gongjunjie2@huawei.com</a>&gt;<br>
Reviewed-by: Thomas Zimmermann &lt;<a href=3D"mailto:tzimmermann@suse.de" t=
arget=3D"_blank">tzimmermann@suse.de</a>&gt;<br>
<br>
---<br>
v2:=C2=A0 =C2=A0 =C2=A0declare hibmc_crtc_mode_valid as static.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Modify the return value of hibmc_crtc_mode_vali=
d .<br>
---<br>
=C2=A0drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c | 19 +++++++++++++++++=
++<br>
=C2=A01 file changed, 19 insertions(+)<br>
<br>
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/gpu/d=
rm/hisilicon/hibmc/hibmc_drm_de.c<br>
index 843d784..675d629 100644<br>
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c<br>
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c<br>
@@ -242,6 +242,24 @@ static void hibmc_crtc_atomic_disable(struct drm_crtc =
*crtc,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 hibmc_set_current_gate(priv, reg);<br>
=C2=A0}<br>
<br>
+static enum drm_mode_status hibmc_crtc_mode_valid(struct drm_crtc *crtc,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const str=
uct drm_display_mode *mode)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int i =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int vrefresh =3D drm_mode_vrefresh(mode);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (vrefresh &lt; 59 || vrefresh &gt; 61)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return MODE_NOCLOCK=
;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; ARRAY_SIZE(hibmc_pll_table=
); i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (hibmc_pll_table=
[i].hdisplay =3D=3D mode-&gt;hdisplay &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0hibmc_pll_table[i].vdisplay =3D=3D mode-&gt;vdisplay)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return MODE_OK;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return MODE_BAD;<br>
+}<br>
+<br>
=C2=A0static unsigned int format_pll_reg(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int pllreg =3D 0;<br>
@@ -510,6 +528,7 @@ static const struct drm_crtc_helper_funcs hibmc_crtc_he=
lper_funcs =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .atomic_flush=C2=A0 =C2=A0=3D hibmc_crtc_atomic=
_flush,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .atomic_enable=C2=A0 =3D hibmc_crtc_atomic_enab=
le,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .atomic_disable =3D hibmc_crtc_atomic_disable,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.mode_valid =3D hibmc_crtc_mode_valid,<br>
=C2=A0};<br>
<br>
=C2=A0int hibmc_de_init(struct hibmc_drm_private *priv)<br>
-- <br>
2.7.4<br>
<br>
</blockquote></div>

--0000000000001f8dbb059f875636--

--===============1070386407==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1070386407==--
