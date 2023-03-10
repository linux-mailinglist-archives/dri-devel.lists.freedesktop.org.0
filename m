Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 828386B385B
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 09:18:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2711910E973;
	Fri, 10 Mar 2023 08:18:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB9410E973
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 08:18:29 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id bo10so3144923qvb.12
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 00:18:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678436308;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yspyhPwTEevuTgvrljFgxGQolMO4MrGaHvprikKC5aM=;
 b=LId9eMIbGdudIA3/FWApjppIq7BRNGyBWqsqVw/X8ZZqPNBSkf/yKegmdWBzPSv1RB
 9FQoOVPU/U4yr2qYR/EiyghwSPZXaGRHBgX55ehnQvWbhED3i92qMtbdJvvKYWuJ692A
 aJ9bGzkJdXJTVD2+xQ/ojKMRQ15kj871MkkyadHEG16cg8Kx2QEh/k0yXkTaXLRXv7xY
 5cOq8dXpYM0Gvpswi8HSc+6tJ/pAluT0B+GvpIDtQO7ihXJUnTuBrh0j0lczYE1If0jC
 oBNZHdxkBqAX6coOfyrvuI3ZJFZ8nA6Llx9KE3MNHQzWSXf87rp7SAAtQRX2xtGm9EbM
 B2SA==
X-Gm-Message-State: AO0yUKWQRxngTd33v7NOLOsMA8kHmQNKr7b369fd4bPBLYd+UEuAOMED
 yxObulasJxWBY5PXAS0FhRWALpIaWDUOBQ==
X-Google-Smtp-Source: AK7set/IQLhWWWZKPy2PaM/2aZbDR9c5UuMk3BGMRcxoxPLppdj6ZMoa4OR5BD4UdnrB1mH5zrPWZg==
X-Received: by 2002:a05:6214:cc3:b0:53b:d514:724 with SMTP id
 3-20020a0562140cc300b0053bd5140724mr10640812qvx.26.1678436308584; 
 Fri, 10 Mar 2023 00:18:28 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com.
 [209.85.128.172]) by smtp.gmail.com with ESMTPSA id
 m124-20020a375882000000b0074240840c25sm874521qkb.108.2023.03.10.00.18.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 00:18:27 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-536c02eea4dso83957127b3.4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 00:18:26 -0800 (PST)
X-Received: by 2002:a81:af4b:0:b0:533:91d2:9d94 with SMTP id
 x11-20020a81af4b000000b0053391d29d94mr16066861ywj.5.1678436306111; Fri, 10
 Mar 2023 00:18:26 -0800 (PST)
MIME-Version: 1.0
References: <20230309160201.5163-1-tzimmermann@suse.de>
 <20230309160201.5163-62-tzimmermann@suse.de>
In-Reply-To: <20230309160201.5163-62-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Mar 2023 09:18:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUi9s6TCyQMsMwFErmvgb_RppAMHjBuXNSRk7rEAuiGrA@mail.gmail.com>
Message-ID: <CAMuHMdUi9s6TCyQMsMwFErmvgb_RppAMHjBuXNSRk7rEAuiGrA@mail.gmail.com>
Subject: Re: [PATCH v2 061/101] fbdev/ps3fb: Duplicate video-mode option string
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, thomas@winischhofer.net, adaplas@gmail.com,
 timur@kernel.org, corbet@lwn.net, deller@gmx.de, rdunlap@infradead.org,
 mbroemme@libmpq.org, linux@armlinux.org.uk, dri-devel@lists.freedesktop.org,
 sudipm.mukherjee@gmail.com, James.Bottomley@hansenpartnership.com,
 pjones@redhat.com, paulus@samba.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, linux-kernel@vger.kernel.org,
 teddy.wang@siliconmotion.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Thu, Mar 9, 2023 at 5:02=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
> Assume that the driver does not own the option string or its substrings
> and hence duplicate the option string for the video mode. Allocate the
> copy's memory with kstrdup() and free it in the module's exit function.
>
> Done in preparation of switching the driver to struct option_iter and
> constifying the option string.
>
> v2:
>         * replace static memory with kstrdup()/kfree() (Geert)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for the upodate!

> --- a/drivers/video/fbdev/ps3fb.c
> +++ b/drivers/video/fbdev/ps3fb.c
> @@ -260,6 +260,7 @@ static const struct fb_videomode ps3fb_modedb[] =3D {
>  static int ps3fb_mode;
>  module_param(ps3fb_mode, int, 0);
>
> +static char *mode_option_buf;

Do you really need this variable? It contains the same value
as mode_option below.
This is a common pattern in several patches.

>  static char *mode_option;
>
>  static int ps3fb_cmp_mode(const struct fb_videomode *vmode,
> @@ -1276,8 +1277,11 @@ static int __init ps3fb_setup(void)
>                         continue;
>                 if (!strncmp(this_opt, "mode:", 5))
>                         ps3fb_mode =3D simple_strtoul(this_opt + 5, NULL,=
 0);
> -               else
> -                       mode_option =3D this_opt;
> +               else {
> +                       kfree(mode_option_buf);
> +                       mode_option_buf =3D kstrdup(this_opt, GFP_KERNEL)=
; // ignore errors
> +                       mode_option =3D mode_option_buf;
> +               }
>         }
>         return 0;
>  }
> @@ -1294,6 +1298,7 @@ static void __exit ps3fb_exit(void)
>  {
>         pr_debug(" -> %s:%d\n", __func__, __LINE__);
>         ps3_system_bus_driver_unregister(&ps3fb_driver);
> +       kfree(mode_option_buf);
>         pr_debug(" <- %s:%d\n", __func__, __LINE__);
>  }

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
