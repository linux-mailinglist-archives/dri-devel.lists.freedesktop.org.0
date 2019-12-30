Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D97812D794
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2019 10:37:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 345BA6E1F3;
	Tue, 31 Dec 2019 09:37:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA5F689AB6
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2019 01:43:33 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c14so31428639wrn.7
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Dec 2019 17:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rj2N8hQAi0JH9XvkbZ6iG8mnO5O8GUdLkkWqFzKZO/Q=;
 b=AR1vQPZFvlxigvIs3F+ZYVbiXddX7Acy6PQDP/yqAe5kGJAaJeR9vU3NyptXRPJkXX
 9cHEMo77SHxKTk5oSscsv/NGmvPHGiZKQXf3sJZ6EcNkKu49ssVUcyWek0qccZKHRUnm
 rE7u5ZaknNKqw4Yu2s0aEKgxCnlyQXUJ6vTLa88xDTlwBLLz2occhbjIcxDIPeaV37LE
 Uo+MiVBcaicbPry7Wp6dn+Gx+R1hmDC+7P33w5HcXuJrD3tpQ2JKAl3J0zL3KqA9M6vR
 GOa9LIs405C5IdeevLoYDJW6KoF+T4v9u0acChkqoQa9lar0LwVgOkACpKaQQooLx1ca
 lv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rj2N8hQAi0JH9XvkbZ6iG8mnO5O8GUdLkkWqFzKZO/Q=;
 b=i+VPm5o9wqBx8CbYW6GucqhRbmroNS/lX7+2IH465RUrUoqbRDVad9xvwGBGNb8RRt
 Xo2Bll0CYiOP00AyDdnQpoEODh3LEUEJv6L7zoC1UbyyR3oAaEtqA/AMMp0mS1O+umPz
 lobBVhg+kAY1WVI9g9g2GV7O7/AfqeJJ9w1qprB4YlFCdgPiB/E4UUqr5kdd0UumyRKZ
 AsUjeqxJysh2/fxToXkuuf/7QAB5MtnOmG3K/Scp6VAuKn8RHwnf+Lw6WF3jIj6M9wmz
 rrAYAOLaXoXuZVVYaVQU0L7/eaae3yyfNhbm7wzBP2O0eeGXnrX3wSjNOZzK4kfG0YBw
 ZP9A==
X-Gm-Message-State: APjAAAXH5yxqZgem0+pc0oZuVGTy9FsW3T+ycgLMrzGpLxNdG0Gn3hk8
 cImiO4gC/ULTEUfQ3Q3Fv7QRzIQgGVVZUTt77npXjA==
X-Google-Smtp-Source: APXvYqzw9aaXgWGixkj8HvBwMM917tdKemXS7jvBwahI8cZflulzRk6R43abAPGYKp0NkJNm4V1UQFEc1gSULhFgH2A=
X-Received: by 2002:adf:ffc7:: with SMTP id x7mr63520373wrs.159.1577670212381; 
 Sun, 29 Dec 2019 17:43:32 -0800 (PST)
MIME-Version: 1.0
References: <1577494764-28381-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1577494764-28381-1-git-send-email-tiantao6@hisilicon.com>
From: Xinliang Liu <xinliang.liu@linaro.org>
Date: Mon, 30 Dec 2019 09:43:21 +0800
Message-ID: <CAKoKPbyOurfg6ii_PTnYEdW-Rwd9-9YaE36NoZx3pSzsmk1XAw@mail.gmail.com>
Subject: Re: [PATCH] drm/hisilicon: Checked the resolution is valid before
 connector
To: Tian Tao <tiantao6@hisilicon.com>
X-Mailman-Approved-At: Tue, 31 Dec 2019 09:37:01 +0000
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
Cc: airlied@linux.ie, puck.chen@hisilicon.com, linuxarm@huawei.com,
 dri-devel@lists.freedesktop.org, kraxel@redhat.com, tzimmermann@suse.de,
 alexander.deucher@amd.com, tglx@linutronix.de
Content-Type: multipart/mixed; boundary="===============0792559278=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0792559278==
Content-Type: multipart/alternative; boundary="00000000000095049b059ae1f8a6"

--00000000000095049b059ae1f8a6
Content-Type: text/plain; charset="UTF-8"

Hi tiantao,
Thanks for the patches.
I see you sent two patches about resolution. Could you just send them as a
series?

Xinliang

On Sat, 28 Dec 2019 at 08:59, Tian Tao <tiantao6@hisilicon.com> wrote:

> In the previous version, the callback function mode_valid of
> drm_connector_helper_funcs directly returned MODE_OK. Now we will
> ensure that the resolution is correct and return MODE_OK, otherwise
> return MODE_NOMODE.
>
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> Signed-off-by: Gong junjie <gongjunjie2@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 41
> ++++++++++++++++++++++--
>  1 file changed, 39 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> index 6d98fdc..3d08210 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> @@ -11,22 +11,59 @@
>   *     Jianhua Li <lijianhua@huawei.com>
>   */
>
> +#include <drm/drm_gem_vram_helper.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/drm_crtc_helper.h>
>  #include <drm/drm_print.h>
>
>  #include "hibmc_drm_drv.h"
>  #include "hibmc_drm_regs.h"
>
> +static const struct hibmc_resolution {
> +       int w;
> +       int h;
> +} hibmc_modetables[] = {
> +       {640, 480}, {800, 600}, {1024, 768}, {1152, 864}, {1280, 768},
> +       {1280, 720}, {1280, 960}, {1280, 1024}, {1440, 900}, {1600, 900},
> +       {1600, 1200}, {1920, 1080}, {1920, 1200}
> +};
> +
> +static int hibmc_valid_mode(int w, int h)
> +{
> +       int size = sizeof(hibmc_modetables) / sizeof(struct
> hibmc_resolution);
> +       int i;
> +
> +       for (i = 0; i < size; i++) {
> +               if (hibmc_modetables[i].w == w && hibmc_modetables[i].h ==
> h)
> +                       return 0;
> +       }
> +
> +       return -1;
> +}
> +
>  static int hibmc_connector_get_modes(struct drm_connector *connector)
>  {
> -       return drm_add_modes_noedid(connector, 800, 600);
> +       int count;
> +
> +       drm_connector_update_edid_property(connector, NULL);
> +       count = drm_add_modes_noedid(connector, 1920, 1200);
> +       drm_set_preferred_mode(connector, 1024, 768);
> +
> +       return count;
>  }
>
>  static enum drm_mode_status hibmc_connector_mode_valid(struct
> drm_connector *connector,
>                                       struct drm_display_mode *mode)
>  {
> -       return MODE_OK;
> +       int vrefresh = drm_mode_vrefresh(mode);
> +
> +       if (vrefresh < 59 || vrefresh > 61)
> +               return MODE_NOMODE;
> +       else if (hibmc_valid_mode(mode->hdisplay, mode->vdisplay) != 0)
> +               return MODE_NOMODE;
> +       else
> +               return MODE_OK;
>  }
>
>  static const struct drm_connector_helper_funcs
> --
> 2.7.4
>
>

--00000000000095049b059ae1f8a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi tiantao,<div>Thanks for the patches.</div><div>I see yo=
u sent two patches about=C2=A0resolution. Could you just send them as a ser=
ies?</div><div><br></div><div>Xinliang=C2=A0</div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, 28 Dec 2019 at 08=
:59, Tian Tao &lt;<a href=3D"mailto:tiantao6@hisilicon.com">tiantao6@hisili=
con.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">In the previous version, the callback function mode_valid of<br>
drm_connector_helper_funcs directly returned MODE_OK. Now we will<br>
ensure that the resolution is correct and return MODE_OK, otherwise<br>
return MODE_NOMODE.<br>
<br>
Signed-off-by: Tian Tao &lt;<a href=3D"mailto:tiantao6@hisilicon.com" targe=
t=3D"_blank">tiantao6@hisilicon.com</a>&gt;<br>
Signed-off-by: Gong junjie &lt;<a href=3D"mailto:gongjunjie2@huawei.com" ta=
rget=3D"_blank">gongjunjie2@huawei.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 41 +++++++++++++++=
+++++++--<br>
=C2=A01 file changed, 39 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers/gpu=
/drm/hisilicon/hibmc/hibmc_drm_vdac.c<br>
index 6d98fdc..3d08210 100644<br>
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c<br>
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c<br>
@@ -11,22 +11,59 @@<br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0Jianhua Li &lt;<a href=3D"mailto:lijianhua@huaw=
ei.com" target=3D"_blank">lijianhua@huawei.com</a>&gt;<br>
=C2=A0 */<br>
<br>
+#include &lt;drm/drm_gem_vram_helper.h&gt;<br>
=C2=A0#include &lt;drm/drm_atomic_helper.h&gt;<br>
=C2=A0#include &lt;drm/drm_probe_helper.h&gt;<br>
+#include &lt;drm/drm_crtc_helper.h&gt;<br>
=C2=A0#include &lt;drm/drm_print.h&gt;<br>
<br>
=C2=A0#include &quot;hibmc_drm_drv.h&quot;<br>
=C2=A0#include &quot;hibmc_drm_regs.h&quot;<br>
<br>
+static const struct hibmc_resolution {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int w;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int h;<br>
+} hibmc_modetables[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{640, 480}, {800, 600}, {1024, 768}, {1152, 864=
}, {1280, 768},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{1280, 720}, {1280, 960}, {1280, 1024}, {1440, =
900}, {1600, 900},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{1600, 1200}, {1920, 1080}, {1920, 1200}<br>
+};<br>
+<br>
+static int hibmc_valid_mode(int w, int h)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int size =3D sizeof(hibmc_modetables) / sizeof(=
struct hibmc_resolution);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; size; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (hibmc_modetable=
s[i].w =3D=3D w &amp;&amp; hibmc_modetables[i].h =3D=3D h)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
+}<br>
+<br>
=C2=A0static int hibmc_connector_get_modes(struct drm_connector *connector)=
<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return drm_add_modes_noedid(connector, 800, 600=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int count;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_connector_update_edid_property(connector, N=
ULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0count =3D drm_add_modes_noedid(connector, 1920,=
 1200);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_set_preferred_mode(connector, 1024, 768);<b=
r>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return count;<br>
=C2=A0}<br>
<br>
=C2=A0static enum drm_mode_status hibmc_connector_mode_valid(struct drm_con=
nector *connector,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_disp=
lay_mode *mode)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return MODE_OK;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int vrefresh =3D drm_mode_vrefresh(mode);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (vrefresh &lt; 59 || vrefresh &gt; 61)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return MODE_NOMODE;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (hibmc_valid_mode(mode-&gt;hdisplay, mo=
de-&gt;vdisplay) !=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return MODE_NOMODE;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return MODE_OK;<br>
=C2=A0}<br>
<br>
=C2=A0static const struct drm_connector_helper_funcs<br>
-- <br>
2.7.4<br>
<br>
</blockquote></div>

--00000000000095049b059ae1f8a6--

--===============0792559278==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0792559278==--
