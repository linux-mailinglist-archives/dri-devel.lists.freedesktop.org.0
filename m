Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4211C16BCA4
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 09:53:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C99E6EA87;
	Tue, 25 Feb 2020 08:52:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B905F6E9D2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 02:19:16 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z15so4462345wrl.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 18:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NyF9P5qx2ppJMfX9M+J+pojkLv28rz3NS++Dm8DD+go=;
 b=F3SfqteQKz+UuaNRS5Cp6pi0HkNS+D1y6CtAHGOa60qENLCfoKqh/tJXthsjnjgKSI
 sAaUSw81+5kDaCZkED+y/+ZlnSSOec3jzN0Jqu2ExFRYHSqKFEuXrXjuZtAQkrYYUT59
 LXTYTz7RjVfkwn772H26v5BdwZjE6Xpthbvx9ANeiTw3V7u2MVXRscb1u9v/DhoY0hhc
 tLTdlotJMvMZc3ToW2fTSpKfCwpOFtoFYPKjStLvMBSoTiF5FYP+fyHvuIMtmwwLb+uk
 wjuSQjyuh0OlGLJRhK9L/HF1qXaSDD4blR5r8GVzNjr4gh6u+DeqIMi517ME9d+sJM9u
 ZgKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NyF9P5qx2ppJMfX9M+J+pojkLv28rz3NS++Dm8DD+go=;
 b=RtMYgXwUfeNCijVTAEQWC5yJ6Db7gkE3xO9jBMZxbTGoMG3Fam3ptOPINTbZmU8CZ7
 m9ywN2MvYHBGTbmOdw9mDyaIIPEMMeU0PJCpOqTW/T36HRoP1qutTv/6aKCsYnZ7uRM8
 DMCRl+Ah4yfAMHXpJKV8vfme766GuFUzOdVvTZZKuap/8+I9ZoitWe9vZZe00wOV2/1S
 kxIYw6nZYGputgytlbrq3Jhrr8tIsG5mdISvuyddcpw+knsi9hkFDMl7KDxeQdYKa5Wc
 KFu75+LSoprn6/zGKBIux3HWU+/EBNXQTfPB1DwcrDtkDz+j3nte6hAWvCTwxg4OZ9ib
 VuSA==
X-Gm-Message-State: APjAAAXWDqRa/lMIRXF9gmTluP3i1agFEzY73GR+sEMFY1y9zAyNx1Ze
 XvrHeGqhMEen1SzdYVILo7X0m+V7AQ3mDJMTPlG5ng==
X-Google-Smtp-Source: APXvYqyfqdydxeOKaYtN4smvItnEqT2N2Lns3L2Gjar2Ks2KOqgsnwKu/MUAEZrFGL7DiCQUnW4VKgjdyDC0USjLYbQ=
X-Received: by 2002:adf:df83:: with SMTP id z3mr69457078wrl.389.1582597155359; 
 Mon, 24 Feb 2020 18:19:15 -0800 (PST)
MIME-Version: 1.0
References: <1582080707-18825-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1582080707-18825-1-git-send-email-tiantao6@hisilicon.com>
From: Xinliang Liu <xinliang.liu@linaro.org>
Date: Tue, 25 Feb 2020 10:19:04 +0800
Message-ID: <CAKoKPbxCF_B6iPEYAcVBJgNJ72GEwHu+WEg=QTO=fGgiOOYUGw@mail.gmail.com>
Subject: Re: [PATCH] drm/hisilicon: Set preferred mode resolution and maximum
 resolution
To: Tian Tao <tiantao6@hisilicon.com>
X-Mailman-Approved-At: Tue, 25 Feb 2020 08:50:43 +0000
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
Content-Type: multipart/mixed; boundary="===============2105037705=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2105037705==
Content-Type: multipart/alternative; boundary="00000000000044a4ac059f5d1d4b"

--00000000000044a4ac059f5d1d4b
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Feb 2020 at 10:52, Tian Tao <tiantao6@hisilicon.com> wrote:

> set the preferred mode resolution to 1024 * 768 and maximum
> resolution to 1920 * 1200.
>
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> Signed-off-by: Gong junjie <gongjunjie2@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> index 6d98fdc..82fc7d3 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
> @@ -11,8 +11,10 @@
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
> @@ -20,7 +22,13 @@
>
>  static int hibmc_connector_get_modes(struct drm_connector *connector)
>  {
> -       return drm_add_modes_noedid(connector, 800, 600);
> +       int count;
> +
> +       drm_connector_update_edid_property(connector, NULL);
> +       count = drm_add_modes_noedid(connector, 1920, 1200);
>

Hi Tao, maybe it's better like this:
count = drm_add_modes_noedid( connector ,
                                      conn->dev->mode_config.max_width,
                                      conn->dev->mode_config.max_height);


> +       drm_set_preferred_mode(connector, 1024, 768);
> +
> +       return count;
>  }
>
>  static enum drm_mode_status hibmc_connector_mode_valid(struct
> drm_connector *connector,
> --
> 2.7.4
>
>

--00000000000044a4ac059f5d1d4b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, 19 Feb 2020 at 10:52, Tian Ta=
o &lt;<a href=3D"mailto:tiantao6@hisilicon.com">tiantao6@hisilicon.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">set t=
he preferred mode resolution to 1024 * 768 and maximum<br>
resolution to 1920 * 1200.<br>
<br>
Signed-off-by: Tian Tao &lt;<a href=3D"mailto:tiantao6@hisilicon.com" targe=
t=3D"_blank">tiantao6@hisilicon.com</a>&gt;<br>
Signed-off-by: Gong junjie &lt;<a href=3D"mailto:gongjunjie2@huawei.com" ta=
rget=3D"_blank">gongjunjie2@huawei.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 10 +++++++++-<br>
=C2=A01 file changed, 9 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers/gpu=
/drm/hisilicon/hibmc/hibmc_drm_vdac.c<br>
index 6d98fdc..82fc7d3 100644<br>
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c<br>
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c<br>
@@ -11,8 +11,10 @@<br>
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
@@ -20,7 +22,13 @@<br>
<br>
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
 1200);<br></blockquote><div><br></div><div>Hi Tao, maybe it&#39;s better l=
ike this:</div><div>count =3D drm_add_modes_noedid(

connector

,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 conn-&gt;dev=
-&gt;mode_config.max_width,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 conn-&gt;dev-&gt;mode_config.max_height);<br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_set_preferred_mode(connector, 1024, 768);<b=
r>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return count;<br>
=C2=A0}<br>
<br>
=C2=A0static enum drm_mode_status hibmc_connector_mode_valid(struct drm_con=
nector *connector,<br>
-- <br>
2.7.4<br>
<br>
</blockquote></div></div>

--00000000000044a4ac059f5d1d4b--

--===============2105037705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2105037705==--
