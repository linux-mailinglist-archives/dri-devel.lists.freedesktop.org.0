Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25848A7A18A
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 13:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0214310E99B;
	Thu,  3 Apr 2025 11:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qxy5Rjw4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2FB210E99B
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 11:03:16 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 46e09a7af769-72c3b863b8eso537200a34.2
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Apr 2025 04:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743678195; x=1744282995; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hvN/6Su1mH83SRr3FDPdM8q8m8TzDCee/L7A0fQJoJI=;
 b=Qxy5Rjw4S66ae7wchLGCkJrbYAE0Uvc0QaAhuPaYD7xn6ubSfYjApAnFsjzzbRnKkl
 nSKQTbE/2YHoI00GuSmeORYRRY/8v8DSAzG0zn9AQvGdfxytPJfb5MCROvVpmSh+NcSj
 bjGIV214/oZyn6+6ZkK3BYItyadrNgiV9e9ZEXk3uEpyvhBLE7XdciV5w/ZkdXlNNoss
 9cw9f1OmDKnghK1Q1mncArNs8D5l9RVLXRgp7s8eqlLfpGimtgEv+mqMFPBPiXVbc1Gz
 hKdvdLHDKjobaUILU/ilAGgf1/8XfezXDpzLg6WdSL3zA3K1h8AIkYx/OY7kVp+TJsNw
 C+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743678195; x=1744282995;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hvN/6Su1mH83SRr3FDPdM8q8m8TzDCee/L7A0fQJoJI=;
 b=YbauiNyGmXKpKl6ybm8MXu5Cd4qeL5J8EyBimklYQig10Cx1diJTfBauHK4wzxTKKx
 7OCQwT0muPFtmb3fWv7qFKF38aZJ0tM+nlcRW/Gstkc8NOIkIY9OdH4Ajt5K2VE745CC
 /cN0Xk++o3RRgCADwbgREPjz/SNIzCIhMMrGdiIVfz18KoKFTeZ/o8MVWdme18XDYr1V
 UnFRUOlVYTGgONVteieBbSsqDGUfltcF9sMjYQ8b9wmmUabWvtGwJGAZiE3QaOLxy18t
 stLPMaBk10np2aFEhN0tur18Im6G343vaxZDYi4/Rir0pmfE0le055UFwoOuvMmW38BK
 5f3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9faPzOCgtVQ0Cjd0fSsnIwAMWAzYC5/qt9tbXjnqR8XGouF7eH2FMldgOPIucJxpP2thIfXzh5Qg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPNFt6Z4yFVQLeA6i/NPtns8xSAVMks5sv8c6U6Gch2UI6v+UG
 0yFFvjegzGwDurs3uTszs7P98H4At2Acb6H2GLtGFRlhxiOcgeGF0XVs+q17BpXElcdGEO7lmdj
 OLWALk+l02idj8i/9BO+stbn/DZs=
X-Gm-Gg: ASbGnct4zxw/V8DmSil6CTX28oii47bKsugwIPUabVvn8ioVtJUFhoZBypMV/822J3n
 wG+ssgHocQaebtqTweF8YvywaoebwbY2g1cjkyUWJ3a8y5eEvudDXQyd1Q1CUwzNRylVAGTk1Kk
 Pl+kA/w8fCn5MKbS/nH9aA8Can
X-Google-Smtp-Source: AGHT+IF4zjgwLRBgQXou7TjHl0ErOu4lNU+weym5nx+Q62vHuNAQGupRBXUxh4pE053Tgvj2HCWIGth2p9X6dUyd/VU=
X-Received: by 2002:a05:6808:180b:b0:3f6:ab0d:8dbf with SMTP id
 5614622812f47-3ff0f5b4637mr12296896b6e.29.1743678195593; Thu, 03 Apr 2025
 04:03:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250401161929.283244-1-tzimmermann@suse.de>
 <20250401161929.283244-10-tzimmermann@suse.de>
In-Reply-To: <20250401161929.283244-10-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Thu, 3 Apr 2025 13:03:04 +0200
X-Gm-Features: ATxdqUEaztZzjvtmISxKzzpJ4jhHNcyt3Z5raV-dNjbARg4lQjfN5QvdjXvvOP8
Message-ID: <CAMeQTsYJyu8=UOkCE__bO2WdAWBBGPAuiW2m7NF727KdzhyfeQ@mail.gmail.com>
Subject: Re: [PATCH 9/9] drm/udl: Support adapters without firmware descriptor
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: airlied@redhat.com, sean@poorly.run, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 1, 2025 at 6:23=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> Set default limit on the number of pixels for adapters without
> vendor firmware descriptor. The devices work as expected, they
> just don't provide any description.
>
> If parsing the vendor firmware descriptor fails, the device falls
> back to the given default limits. Failing to allocate memory is
> still an error.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/udl/udl_main.c | 37 +++++++++++++++++++---------------
>  1 file changed, 21 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_mai=
n.c
> index b5a6b254a2028..2685608af8cec 100644
> --- a/drivers/gpu/drm/udl/udl_main.c
> +++ b/drivers/gpu/drm/udl/udl_main.c
> @@ -76,6 +76,7 @@ static int udl_parse_vendor_descriptor(struct udl_devic=
e *udl)
>  {
>         struct drm_device *dev =3D &udl->drm;
>         struct usb_device *udev =3D udl_to_usb_device(udl);
> +       bool detected =3D false;
>         void *buf;
>         int ret;
>         unsigned int len;
> @@ -84,16 +85,16 @@ static int udl_parse_vendor_descriptor(struct udl_dev=
ice *udl)
>
>         buf =3D kzalloc(MAX_VENDOR_DESCRIPTOR_SIZE, GFP_KERNEL);
>         if (!buf)
> -               return false;
> +               return -ENOMEM;
>
>         ret =3D usb_get_descriptor(udev, 0x5f, /* vendor specific */
>                                  0, buf, MAX_VENDOR_DESCRIPTOR_SIZE);
>         if (ret < 0)
> -               goto unrecognized;
> +               goto out;
>         len =3D ret;
>
>         if (len < 5)
> -               goto unrecognized;
> +               goto out;
>
>         desc =3D buf;
>         desc_end =3D desc + len;
> @@ -103,21 +104,20 @@ static int udl_parse_vendor_descriptor(struct udl_d=
evice *udl)
>             (desc[2] !=3D 0x01) ||   /* version (2 bytes) */
>             (desc[3] !=3D 0x00) ||
>             (desc[4] !=3D len - 2))  /* length after type */
> -               goto unrecognized;
> +               goto out;
>         desc +=3D 5;
>
> +       detected =3D true;
> +
>         while (desc < desc_end)
>                 desc =3D udl_parse_key_value_pair(udl, desc, desc_end);
>
> -       goto success;
> -
> -unrecognized:
> -       /* allow udlfb to load for now even if firmware unrecognized */
> -       drm_warn(dev, "Unrecognized vendor firmware descriptor\n");
> -
> -success:
> +out:
> +       if (!detected)
> +               drm_warn(dev, "Unrecognized vendor firmware descriptor\n"=
);
>         kfree(buf);
> -       return true;
> +
> +       return 0;
>  }
>
>  /*
> @@ -345,11 +345,16 @@ int udl_init(struct udl_device *udl)
>                 drm_warn(dev, "buffer sharing not supported"); /* not an =
error */
>         }
>
> -       if (!udl_parse_vendor_descriptor(udl)) {
> -               ret =3D -ENODEV;
> -               DRM_ERROR("firmware not recognized. Assume incompatible d=
evice\n");
> +       /*
> +        * Not all devices provide vendor descriptors with device
> +        * information. Initialize to default values from real-world
> +        * devices. It is just enough memory for FullHD.
> +        */
> +       udl->sku_pixel_limit =3D USL_SKU_PIXEL_LIMIT_DEFAULT;

Should be UDL_SKU_PIXEL_LIMIT_DEFAULT

> +
> +       ret =3D udl_parse_vendor_descriptor(udl);
> +       if (ret)
>                 goto err;
> -       }
>
>         if (udl_select_std_channel(udl))
>                 DRM_ERROR("Selecting channel failed\n");
> --
> 2.49.0
>
