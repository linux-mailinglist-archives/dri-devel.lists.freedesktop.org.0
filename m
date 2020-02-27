Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A948F171229
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 09:14:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526046EC29;
	Thu, 27 Feb 2020 08:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A9726E07F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 04:43:22 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id t23so1977384wmi.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 20:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iIRkIDTBodKX4dkgFd9NHi/q9E7gvyMiSRGcug9zgEc=;
 b=Us1LyHphk+WWpJGQGNWrJOT9C8VYpUn1TxvmNpmDdV4P1760S0Rja1ZiSEUYtTYkMy
 akqKzBjGqMTsWST0lqSrmYv0SdiSAk18+dIeymealBwJRmw9KKy1vOCpncBRhXO+Lybq
 MN0DUc9a1IwE4zO5ez3TjDx+9L+jhvHaR4KXUgNnWamgg78KfQaVEy+iiGindRYVruC1
 AX7jPa36xEPmBFexBjTpLNTy7ZVUP5elG/12vq3fSsixgAcxymw3TNfEBMAtW577DNIF
 ilZPOdyHmrpxOGxLVMOYNdZYcwHlUWHEBgE5p3Ei50Y+67+H7xRdH1+tIytgZvsD7c9r
 answ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iIRkIDTBodKX4dkgFd9NHi/q9E7gvyMiSRGcug9zgEc=;
 b=Fcae5q+fULcmUat7hl5HgHflXCWwL7x97s4SX/+/vsuMXndAa47bgGpvnEDVhKvw7F
 gvf4h36gtNlyzzNO5gE/JwlOubvQ+n7VSLCs1ep+42QDVCeaDMHhCOkC1koplk+q4hX+
 nhTYJMOPTk9mUmm8JwTX44wkw2aDvpAQ1nSsmRxTc8WHB5Y7g/8TJzO6Arqjw4kh7eV8
 ev+cyeWuhdlBuqSDhxC7GayaRX6N2/GYYpWPrXzOTcqVoKOmtVVEyk8CC/r0BOG2H1bk
 7GlJbLXNg1Ddn4Ir6fhcS+/AvCHbYeSFZqitCRCC3SOkcNnGRnCY0REt0AV9zq6R1nDp
 H6iQ==
X-Gm-Message-State: APjAAAWpk5gwEbWmCzGkRlTqV57pyihmeXt/BvcK95DAjL9qY/Ow4l9u
 CE+ZaCD4OIdjsE4mL39wKuoMsEa4snCa24vYXofGNw==
X-Google-Smtp-Source: APXvYqzGjSU510w13memgD/p0yG3imSlGFQPTjRwXWyF9iNwsJYlMRCIaUpr6NT1ayPFIV9WHdIOopePUPg7uVSFTDo=
X-Received: by 2002:a1c:9dcb:: with SMTP id g194mr2834814wme.114.1582778601010; 
 Wed, 26 Feb 2020 20:43:21 -0800 (PST)
MIME-Version: 1.0
References: <1577774571-60493-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1577774571-60493-1-git-send-email-tiantao6@hisilicon.com>
From: Xinliang Liu <xinliang.liu@linaro.org>
Date: Thu, 27 Feb 2020 12:43:09 +0800
Message-ID: <CAKoKPbxp7=qRb6JxmC9itB3zaHUg2-GhnEpKNwN9+dw6YfkJKA@mail.gmail.com>
Subject: Re: [PATCH] drm/hisilicon: Add new clock/resolution configurations
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
Content-Type: multipart/mixed; boundary="===============0718245037=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0718245037==
Content-Type: multipart/alternative; boundary="0000000000004590dc059f875cb4"

--0000000000004590dc059f875cb4
Content-Type: text/plain; charset="UTF-8"

Thanks for the patch.
Applied to drm-misc-next.

On Tue, 31 Dec 2019 at 14:43, Tian Tao <tiantao6@hisilicon.com> wrote:

> Add the three new pll config for corresponding resolution 1440x900 and
> 1600x900, 640x480 for hibmc
>
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> Signed-off-by: Gong junjie <gongjunjie2@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c   | 3 +++
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h | 2 ++
>  2 files changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> index f1ce6cb..6bf4334 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> @@ -40,6 +40,7 @@ struct hibmc_dislay_pll_config {
>  };
>
>  static const struct hibmc_dislay_pll_config hibmc_pll_table[] = {
> +       {640, 480, CRT_PLL1_HS_25MHZ, CRT_PLL2_HS_25MHZ},
>         {800, 600, CRT_PLL1_HS_40MHZ, CRT_PLL2_HS_40MHZ},
>         {1024, 768, CRT_PLL1_HS_65MHZ, CRT_PLL2_HS_65MHZ},
>         {1152, 864, CRT_PLL1_HS_80MHZ_1152, CRT_PLL2_HS_80MHZ},
> @@ -47,6 +48,8 @@ static const struct hibmc_dislay_pll_config
> hibmc_pll_table[] = {
>         {1280, 720, CRT_PLL1_HS_74MHZ, CRT_PLL2_HS_74MHZ},
>         {1280, 960, CRT_PLL1_HS_108MHZ, CRT_PLL2_HS_108MHZ},
>         {1280, 1024, CRT_PLL1_HS_108MHZ, CRT_PLL2_HS_108MHZ},
> +       {1440, 900, CRT_PLL1_HS_106MHZ, CRT_PLL2_HS_106MHZ},
> +       {1600, 900, CRT_PLL1_HS_108MHZ, CRT_PLL2_HS_108MHZ},
>         {1600, 1200, CRT_PLL1_HS_162MHZ, CRT_PLL2_HS_162MHZ},
>         {1920, 1080, CRT_PLL1_HS_148MHZ, CRT_PLL2_HS_148MHZ},
>         {1920, 1200, CRT_PLL1_HS_193MHZ, CRT_PLL2_HS_193MHZ},
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h
> b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h
> index 9b7e859..17b30c3 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h
> @@ -179,6 +179,7 @@
>  #define CRT_PLL1_HS_74MHZ                      0x23941dc2
>  #define CRT_PLL1_HS_80MHZ                      0x23941001
>  #define CRT_PLL1_HS_80MHZ_1152                 0x23540fc2
> +#define CRT_PLL1_HS_106MHZ                     0x237C1641
>  #define CRT_PLL1_HS_108MHZ                     0x23b41b01
>  #define CRT_PLL1_HS_162MHZ                     0x23480681
>  #define CRT_PLL1_HS_148MHZ                     0x23541dc2
> @@ -191,6 +192,7 @@
>  #define CRT_PLL2_HS_78MHZ                      0x50E147AE
>  #define CRT_PLL2_HS_74MHZ                      0x602B6AE7
>  #define CRT_PLL2_HS_80MHZ                      0x70000000
> +#define CRT_PLL2_HS_106MHZ                     0x0075c28f
>  #define CRT_PLL2_HS_108MHZ                     0x80000000
>  #define CRT_PLL2_HS_162MHZ                     0xA0000000
>  #define CRT_PLL2_HS_148MHZ                     0xB0CCCCCD
> --
> 2.7.4
>
>

--0000000000004590dc059f875cb4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the patch.<br>Applied to drm-misc-next.<br></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On T=
ue, 31 Dec 2019 at 14:43, Tian Tao &lt;<a href=3D"mailto:tiantao6@hisilicon=
.com">tiantao6@hisilicon.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Add the three new pll config for corresponding =
resolution 1440x900 and<br>
1600x900, 640x480 for hibmc<br>
<br>
Signed-off-by: Tian Tao &lt;<a href=3D"mailto:tiantao6@hisilicon.com" targe=
t=3D"_blank">tiantao6@hisilicon.com</a>&gt;<br>
Signed-off-by: Gong junjie &lt;<a href=3D"mailto:gongjunjie2@huawei.com" ta=
rget=3D"_blank">gongjunjie2@huawei.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c=C2=A0 =C2=A0| 3 +++<br=
>
=C2=A0drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h | 2 ++<br>
=C2=A02 files changed, 5 insertions(+)<br>
<br>
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/gpu/d=
rm/hisilicon/hibmc/hibmc_drm_de.c<br>
index f1ce6cb..6bf4334 100644<br>
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c<br>
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c<br>
@@ -40,6 +40,7 @@ struct hibmc_dislay_pll_config {<br>
=C2=A0};<br>
<br>
=C2=A0static const struct hibmc_dislay_pll_config hibmc_pll_table[] =3D {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{640, 480, CRT_PLL1_HS_25MHZ, CRT_PLL2_HS_25MHZ=
},<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {800, 600, CRT_PLL1_HS_40MHZ, CRT_PLL2_HS_40MHZ=
},<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {1024, 768, CRT_PLL1_HS_65MHZ, CRT_PLL2_HS_65MH=
Z},<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {1152, 864, CRT_PLL1_HS_80MHZ_1152, CRT_PLL2_HS=
_80MHZ},<br>
@@ -47,6 +48,8 @@ static const struct hibmc_dislay_pll_config hibmc_pll_tab=
le[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {1280, 720, CRT_PLL1_HS_74MHZ, CRT_PLL2_HS_74MH=
Z},<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {1280, 960, CRT_PLL1_HS_108MHZ, CRT_PLL2_HS_108=
MHZ},<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {1280, 1024, CRT_PLL1_HS_108MHZ, CRT_PLL2_HS_10=
8MHZ},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{1440, 900, CRT_PLL1_HS_106MHZ, CRT_PLL2_HS_106=
MHZ},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{1600, 900, CRT_PLL1_HS_108MHZ, CRT_PLL2_HS_108=
MHZ},<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {1600, 1200, CRT_PLL1_HS_162MHZ, CRT_PLL2_HS_16=
2MHZ},<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {1920, 1080, CRT_PLL1_HS_148MHZ, CRT_PLL2_HS_14=
8MHZ},<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {1920, 1200, CRT_PLL1_HS_193MHZ, CRT_PLL2_HS_19=
3MHZ},<br>
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h b/drivers/gpu=
/drm/hisilicon/hibmc/hibmc_drm_regs.h<br>
index 9b7e859..17b30c3 100644<br>
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h<br>
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h<br>
@@ -179,6 +179,7 @@<br>
=C2=A0#define CRT_PLL1_HS_74MHZ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x23941dc2<br>
=C2=A0#define CRT_PLL1_HS_80MHZ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x23941001<br>
=C2=A0#define CRT_PLL1_HS_80MHZ_1152=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00x23540fc2<br>
+#define CRT_PLL1_HS_106MHZ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A00x237C1641<br>
=C2=A0#define CRT_PLL1_HS_108MHZ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x23b41b01<br>
=C2=A0#define CRT_PLL1_HS_162MHZ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x23480681<br>
=C2=A0#define CRT_PLL1_HS_148MHZ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x23541dc2<br>
@@ -191,6 +192,7 @@<br>
=C2=A0#define CRT_PLL2_HS_78MHZ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x50E147AE<br>
=C2=A0#define CRT_PLL2_HS_74MHZ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x602B6AE7<br>
=C2=A0#define CRT_PLL2_HS_80MHZ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x70000000<br>
+#define CRT_PLL2_HS_106MHZ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0075c28f<br>
=C2=A0#define CRT_PLL2_HS_108MHZ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x80000000<br>
=C2=A0#define CRT_PLL2_HS_162MHZ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xA0000000<br>
=C2=A0#define CRT_PLL2_HS_148MHZ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xB0CCCCCD<br>
-- <br>
2.7.4<br>
<br>
</blockquote></div>

--0000000000004590dc059f875cb4--

--===============0718245037==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0718245037==--
