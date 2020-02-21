Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E082F167BAD
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 12:14:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6B86F3F5;
	Fri, 21 Feb 2020 11:14:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B316EEA5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 07:06:35 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id n3so521600wmk.4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 23:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tnhksa9dcsp7vR4R7C1B/j50JEKmKmsNqeT0f74ynMw=;
 b=fJGtH6wvHzg7bye3S2FMFwMaG8t8vjNYxCMEWktO7dTmH44xrLT6mZUZ3Ve/H6XwTp
 EcqVPIgwbA0tfWotrHHEbPA5LwdN7+KWxbOjYWhlCvId2UQ4ANcAs12lqu0Ja0s4lFRj
 p+N1hrNF3efkNHh7Ak4H2+ztebl9DLBFXeIunPyduENhj2dOSEdrgLNa/T3ULbRRuRPD
 j9hUX+Q9Ftm20iVtCF5pUsytI5/GoJZE9TEocS1hNkaDEl5yBLZyfJ6iRBV4p+kY6FJa
 VSHTk7FRhd0ffqpP4j9hi9PCcMuRNIuc0aV0tUlLDzXdrDUQ2wAhZ6ZNBQdpciwkcahn
 CQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tnhksa9dcsp7vR4R7C1B/j50JEKmKmsNqeT0f74ynMw=;
 b=Nd64x0iFQocSldaasJINl3jRA3jFb7HHvYxP0peczLVhtqwUzc839vO7VwKTl5lzS+
 4GS9K5dHP+dPndRUGuohwQPlZPhkOW+EwjYYrXkF0ljM84YZYlw375SfMw+Nt4NdFmN9
 7nD3rL05dzXcCbMUeL4jTKoEckDvpfuWGB62Is05+kEl+z36dBW1srapsAr0R/v1Chn2
 9hRN3q6rJKjj0Y60Otp2cMJ8c68hpxO5mmMkRbwMlgEio+/538Hi2oKpLWKKS6zZtVNY
 A4gbmnF+Tyoz4p8ob2GTuiDHp3gbPbCFTJBVOFMy8pAipmNgRRt8Weqk7bEgMzzZpJwR
 Bg2g==
X-Gm-Message-State: APjAAAWoTeqU8NPvcwFz/8aa3ZPiaxceid/rXkMEidmhk/yiYWECwF/s
 AfqhDkHxBQ8d3jDJgGRlIp52WgYePqhlpS09MG7Y9Q==
X-Google-Smtp-Source: APXvYqzYRNtA/FGfQWOKW8tnz1eHqcimwuq5Y9ueZ8vzl7hXcr0f9NvLnPmKdxS39Ns5CXWKIFS2Kubf8d+SO2iwjVs=
X-Received: by 2002:a1c:1b93:: with SMTP id b141mr1928194wmb.114.1582268794127; 
 Thu, 20 Feb 2020 23:06:34 -0800 (PST)
MIME-Version: 1.0
References: <1582264523-61170-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1582264523-61170-1-git-send-email-tiantao6@hisilicon.com>
From: Xinliang Liu <xinliang.liu@linaro.org>
Date: Fri, 21 Feb 2020 15:06:21 +0800
Message-ID: <CAKoKPbztX8--gWgLDYJFQX1=Wf1jiFKx+H2_RFN90fxOpr_RdQ@mail.gmail.com>
Subject: Re: [PATCH] drm/hisilicon: Fixed pcie resource conflict using the
 general API
To: Tian Tao <tiantao6@hisilicon.com>
X-Mailman-Approved-At: Fri, 21 Feb 2020 11:14:23 +0000
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
Content-Type: multipart/mixed; boundary="===============2090043985=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2090043985==
Content-Type: multipart/alternative; boundary="00000000000069e702059f10a9a1"

--00000000000069e702059f10a9a1
Content-Type: text/plain; charset="UTF-8"

Hi tao,
Are you sending a wrong patch?
Function hibmc_remove_framebuffers is added by your prior reviewing patch.
Please send patch based on drm-misc-next branch[1] or linux-next.

Thanks,
-Xinliang

[1] https://anongit.freedesktop.org/git/drm-misc.git

On Fri, 21 Feb 2020 at 13:56, Tian Tao <tiantao6@hisilicon.com> wrote:

> the kernel provide the drm_fb_helper_remove_conflicting_pci_framebuffer
> to remvoe the pcie resource conflict,there is no need to driver it again.
>
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 22
> +++++-----------------
>  1 file changed, 5 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index 7ebe831..0f7dba7 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -47,22 +47,6 @@ static irqreturn_t hibmc_drm_interrupt(int irq, void
> *arg)
>         return IRQ_HANDLED;
>  }
>
> -static void hibmc_remove_framebuffers(struct pci_dev *pdev)
> -{
> -       struct apertures_struct *ap;
> -
> -       ap = alloc_apertures(1);
> -       if (!ap)
> -               return;
> -
> -       ap->ranges[0].base = pci_resource_start(pdev, 0);
> -       ap->ranges[0].size = pci_resource_len(pdev, 0);
> -
> -       drm_fb_helper_remove_conflicting_framebuffers(ap, "hibmcdrmfb",
> false);
> -
> -       kfree(ap);
> -}
> -
>  static struct drm_driver hibmc_driver = {
>         .driver_features        = DRIVER_GEM | DRIVER_MODESET |
> DRIVER_ATOMIC,
>         .fops                   = &hibmc_fops,
> @@ -343,7 +327,11 @@ static int hibmc_pci_probe(struct pci_dev *pdev,
>         struct drm_device *dev;
>         int ret;
>
> -       hibmc_remove_framebuffers(pdev);
> +       ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev,
> +
>  "hibmcdrmfb");
> +       if (ret)
> +               return ret;
> +
>
>         dev = drm_dev_alloc(&hibmc_driver, &pdev->dev);
>         if (IS_ERR(dev)) {
> --
> 2.7.4
>
>

--00000000000069e702059f10a9a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi tao,</div><div>Are you sending a wrong patch?</div=
><div>Function hibmc_remove_framebuffers is added by your prior reviewing p=
atch.<br></div><div>Please send patch based on=C2=A0drm-misc-next branch[1]=
 or linux-next.</div><div><br></div><div>Thanks,</div><div>-Xinliang</div><=
div><br></div><div>[1]=C2=A0<a rel=3D"vcs-git" href=3D"https://anongit.free=
desktop.org/git/drm-misc.git" title=3D"drm-misc Git repository" style=3D"co=
lor:black;text-decoration-line:none;font-family:sans-serif;font-size:13.333=
3px;white-space:nowrap;background-color:rgb(238,238,238)">https://anongit.f=
reedesktop.org/git/drm-misc.git</a></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Fri, 21 Feb 2020 at 13:56, Tian Tao &=
lt;<a href=3D"mailto:tiantao6@hisilicon.com">tiantao6@hisilicon.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">the kern=
el provide the drm_fb_helper_remove_conflicting_pci_framebuffer<br>
to remvoe the pcie resource conflict,there is no need to driver it again.<b=
r>
<br>
Signed-off-by: Tian Tao &lt;<a href=3D"mailto:tiantao6@hisilicon.com" targe=
t=3D"_blank">tiantao6@hisilicon.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 22 +++++-----------=
------<br>
=C2=A01 file changed, 5 insertions(+), 17 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/=
drm/hisilicon/hibmc/hibmc_drm_drv.c<br>
index 7ebe831..0f7dba7 100644<br>
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c<br>
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c<br>
@@ -47,22 +47,6 @@ static irqreturn_t hibmc_drm_interrupt(int irq, void *ar=
g)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return IRQ_HANDLED;<br>
=C2=A0}<br>
<br>
-static void hibmc_remove_framebuffers(struct pci_dev *pdev)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct apertures_struct *ap;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ap =3D alloc_apertures(1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ap)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ap-&gt;ranges[0].base =3D pci_resource_start(pd=
ev, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ap-&gt;ranges[0].size =3D pci_resource_len(pdev=
, 0);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_fb_helper_remove_conflicting_framebuffers(a=
p, &quot;hibmcdrmfb&quot;, false);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(ap);<br>
-}<br>
-<br>
=C2=A0static struct drm_driver hibmc_driver =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .driver_features=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .fops=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &amp;hibmc_fops,<br>
@@ -343,7 +327,11 @@ static int hibmc_pci_probe(struct pci_dev *pdev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_device *dev;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0hibmc_remove_framebuffers(pdev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D drm_fb_helper_remove_conflicting_pci_fr=
amebuffers(pdev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;hibmcdrmfb&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dev =3D drm_dev_alloc(&amp;hibmc_driver, &amp;p=
dev-&gt;dev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(dev)) {<br>
-- <br>
2.7.4<br>
<br>
</blockquote></div></div>

--00000000000069e702059f10a9a1--

--===============2090043985==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2090043985==--
