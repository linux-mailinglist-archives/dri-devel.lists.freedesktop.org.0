Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E49317123C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 09:14:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA676EC21;
	Thu, 27 Feb 2020 08:14:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623936E436
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 04:39:55 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id v2so1586447wrp.12
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 20:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7rRwZ8ep9yfl/IFIsWFO4Cyu9ipL1R94VDq6/m4vxY8=;
 b=s5HJ6l9SaFlYM+oDvyKeFowXwgWCtEVbBkbUablzVRNsDSxJrFjjg9f2FAyTnTMsU/
 NXWkIjuCPAkgLUbubnK+tbyTPGybicxP6uD8Pa0UAnUnUjyJsVRdiMJIhleIU/1rrgi9
 367wCm+GyqnefXCcLoIVBlNUbLBq0OecDlfhFoQR0YlizXiXlDYNdRFwMvQ0cBOmCcpm
 uF4FBdvwSuKfg/b5MDH0H95dT37v7BorFPP/YY+8wReN9IbWYjBc/G7x3VODou7vBZkJ
 rRcEvUgST5pR9onnb+q1D1fUgQTmej7bVAF2cBXEwFSTRt6hkb35dsIMXJz/9q9ITL+4
 9i5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7rRwZ8ep9yfl/IFIsWFO4Cyu9ipL1R94VDq6/m4vxY8=;
 b=loz4iXY2wOl9bgcaJxde9w9waKOqqgDTIc6kL7Q6z4j1wQWi4wNTapfB5xXpqIxS/D
 drzr7GbjyMjjARAZ3FKgyTAQ9qVBRZOkx2sQVXUk9RlgVMuiQ2ZatK5akPO7S4c9r/rK
 RzQ/HcjJlMHFcnhrwG3Fs8J5Xlt+kl+lwAILsntf3g/25D8/Kl07JabHfAKDI8eHjCk2
 ynyHZfaZRmnTLeQEYwub3BPj0eLuJNsF9TnA43zCDryAPHuPyQh55PINUMa5RsCTiQFB
 16Dd2HWneCeZOq5J4PQl2UN3xFIkYRQpa/RfPVCsdNd5MUm4o7pDrk+5oQQK3Yw3SWbT
 /6fQ==
X-Gm-Message-State: APjAAAXR0axNynwrIBKo0Gjd2mi2vSAjWxFPU4P8teV2UcdVA2limp0S
 uAERpC4PywmQWZS3yM9IWzfmyxkLuiqQNhLlmM43xw==
X-Google-Smtp-Source: APXvYqzsUyjECumsqVLY2xre4wt6cIUwwa2nW/lodeKF8+AEKlWNMPTxodXc1OX4EoXNfLXI4QsBmgj6vsHGZmqY/i4=
X-Received: by 2002:adf:ffc4:: with SMTP id x4mr2439077wrs.306.1582778394056; 
 Wed, 26 Feb 2020 20:39:54 -0800 (PST)
MIME-Version: 1.0
References: <1582524112-5628-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1582524112-5628-1-git-send-email-tiantao6@hisilicon.com>
From: Xinliang Liu <xinliang.liu@linaro.org>
Date: Thu, 27 Feb 2020 12:39:42 +0800
Message-ID: <CAKoKPbw9MNsJqAOhFMqDcafk8kJLA7Fm8pcrakEjyTBvak8Bvw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/hisilicon: Fixed pcie resource conflict between
 drm and firmware
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
Content-Type: multipart/mixed; boundary="===============1308641863=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1308641863==
Content-Type: multipart/alternative; boundary="000000000000efb0c9059f874f35"

--000000000000efb0c9059f874f35
Content-Type: text/plain; charset="UTF-8"

Thanks for the patch.
Applied to drm-misc-next.

On Mon, 24 Feb 2020 at 14:02, Tian Tao <tiantao6@hisilicon.com> wrote:

> use the drm_fb_helper_remove_conflicting_pci_framebuffer to remove
> the framebuffer initialized by fireware/bootloader to avoid resource
> conflict.
>
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
>
> ---
> v2:     use the general API to remove the conflict resource instead of
> rolling
>         our own.
> ---
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index 4a8a4cf..7518980 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -327,6 +327,11 @@ static int hibmc_pci_probe(struct pci_dev *pdev,
>         struct drm_device *dev;
>         int ret;
>
> +       ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev,
> +                                                       "hibmcdrmfb");
> +       if (ret)
> +               return ret;
> +
>         dev = drm_dev_alloc(&hibmc_driver, &pdev->dev);
>         if (IS_ERR(dev)) {
>                 DRM_ERROR("failed to allocate drm_device\n");
> --
> 2.7.4
>
>

--000000000000efb0c9059f874f35
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Thanks for the patch.<br>Applied to drm-m=
isc-next.<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Mon, 24 Feb 2020 at 14:02, Tian Tao &lt;<a href=3D"mailto:t=
iantao6@hisilicon.com">tiantao6@hisilicon.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">use the drm_fb_helper_remove_c=
onflicting_pci_framebuffer to remove<br>
the framebuffer initialized by fireware/bootloader to avoid resource<br>
conflict.<br>
<br>
Signed-off-by: Tian Tao &lt;<a href=3D"mailto:tiantao6@hisilicon.com" targe=
t=3D"_blank">tiantao6@hisilicon.com</a>&gt;<br>
<br>
---<br>
v2:=C2=A0 =C2=A0 =C2=A0use the general API to remove the conflict resource =
instead of rolling<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 our own.<br>
---<br>
---<br>
=C2=A0drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 5 +++++<br>
=C2=A01 file changed, 5 insertions(+)<br>
<br>
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/=
drm/hisilicon/hibmc/hibmc_drm_drv.c<br>
index 4a8a4cf..7518980 100644<br>
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c<br>
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c<br>
@@ -327,6 +327,11 @@ static int hibmc_pci_probe(struct pci_dev *pdev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_device *dev;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D drm_fb_helper_remove_conflicting_pci_fr=
amebuffers(pdev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;hibmcdrmfb&quot;);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dev =3D drm_dev_alloc(&amp;hibmc_driver, &amp;p=
dev-&gt;dev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(dev)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_ERROR(&quot;fai=
led to allocate drm_device\n&quot;);<br>
-- <br>
2.7.4<br>
<br>
</blockquote></div></div>

--000000000000efb0c9059f874f35--

--===============1308641863==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1308641863==--
