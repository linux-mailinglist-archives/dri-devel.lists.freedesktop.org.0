Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E866AC7A7
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 17:21:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7042B10E3DC;
	Mon,  6 Mar 2023 16:21:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E6410E29C
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 16:21:11 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id q15so7442512oiw.11
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Mar 2023 08:21:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678119670;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mupyAyevtyw777NCln3ZN8/0+T6wpA1bTYPrDt/CRuI=;
 b=Y8PBl9lfw2o8R4puw0SsM/GLqz5+MarulepYQ1AyJLZuCREV2jSmzQfIuSbhmClSoV
 1omEpIOAmcVOuPMJaRF5ugLv1qvDanaW41F6hXk/x/XNP+J/sbVjKW5Dn8yZga6A9zuh
 yqh+sB0AbZteVCRwmf+2gXreQXwhNkWLSXaxdSRr94eNYCC1FnU4Tp9GI8+2DGLO2g87
 p0SMZEDU4bLCXo9jsAiUe/jNuRBnXXDd3VhUS79nJdnNhkJhUDJV/fOyiCyXGP20Fcq8
 xEitbw0khQWUcfTpoMvPAmodIzvhkZ+ILXVKNWvc95dq7XdWObcVDaI1EAUHwy17x+F2
 H/tg==
X-Gm-Message-State: AO0yUKWYkQfCrWQ9FY0ECadlBi+WgJJljrQIDd74ZsXWv/Zt5exBILHD
 tZHnTmTFdF4YdE5O9n+4ft0VRjDQ6/dBmQ==
X-Google-Smtp-Source: AK7set8dUUxV9l9G/H+yVbdAX32UTV8UJDNSPEvKg+H8rdztad3JyrE3XX0c3YzTrz4HxMc/1YjVhQ==
X-Received: by 2002:a54:461a:0:b0:383:ee19:aa8f with SMTP id
 p26-20020a54461a000000b00383ee19aa8fmr5356044oip.22.1678119670147; 
 Mon, 06 Mar 2023 08:21:10 -0800 (PST)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com.
 [209.85.160.52]) by smtp.gmail.com with ESMTPSA id
 i67-20020acaea46000000b00383e0c1f6cdsm4069859oih.27.2023.03.06.08.21.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 08:21:09 -0800 (PST)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-17671fb717cso10429766fac.8
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Mar 2023 08:21:09 -0800 (PST)
X-Received: by 2002:a5b:18e:0:b0:967:f8b2:7a42 with SMTP id
 r14-20020a5b018e000000b00967f8b27a42mr5167551ybl.7.1678119226571; Mon, 06 Mar
 2023 08:13:46 -0800 (PST)
MIME-Version: 1.0
References: <20230306160016.4459-1-tzimmermann@suse.de>
 <20230306160016.4459-12-tzimmermann@suse.de>
In-Reply-To: <20230306160016.4459-12-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Mar 2023 17:13:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVDr19p3GtR4n_hJAtc_RX+VJwVfU1Mzvtka9er+WS8bg@mail.gmail.com>
Message-ID: <CAMuHMdVDr19p3GtR4n_hJAtc_RX+VJwVfU1Mzvtka9er+WS8bg@mail.gmail.com>
Subject: Re: [PATCH 11/99] fbdev/aty: Duplicate video-mode option string
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
Cc: linux-fbdev@vger.kernel.org, adaplas@gmail.com, timur@kernel.org,
 corbet@lwn.net, deller@gmx.de, thomas@winischhofer.net, mbroemme@libmpq.org,
 linux@armlinux.org.uk, dri-devel@lists.freedesktop.org,
 sudipm.mukherjee@gmail.com, James.Bottomley@hansenpartnership.com,
 spock@gentoo.org, pjones@redhat.com, paulus@samba.org, geert+renesas@glider.be,
 shawnguo@kernel.org, s.hauer@pengutronix.de, linux-kernel@vger.kernel.org,
 teddy.wang@siliconmotion.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

Thanks for your patch!

On Mon, Mar 6, 2023 at 5:00=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
> Assume that the driver does not own the option string or its substrings
> and hence duplicate the option string for the video mode. The driver only
> parses the option string once as part of module initialization, so use
> a static buffer to store the duplicated mode option. Linux automatically
> frees the memory upon releasing the module.

Are you sure about that?
All of this code is inside "#ifndef MODULE".
In the aty128fb case, the function is not marked __init.
Enabling these 3 drivers adds 3x256 bytes of static buffer, more
if you enable more fbdev drivers.

> Done in preparation of switching the driver to struct option_iter and
> constifying the option string.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

> --- a/drivers/video/fbdev/aty/aty128fb.c
> +++ b/drivers/video/fbdev/aty/aty128fb.c
> @@ -1723,7 +1723,17 @@ static int aty128fb_setup(char *options)
>                         continue;
>                 }
>  #endif /* CONFIG_PPC_PMAC */
> -               mode_option =3D this_opt;
> +               {
> +                       static char mode_option_buf[256];
> +                       int ret;
> +
> +                       ret =3D snprintf(mode_option_buf, sizeof(mode_opt=
ion_buf), "%s", this_opt);
> +                       if (WARN(ret < 0, "aty128: ignoring invalid optio=
n, ret=3D%d\n", ret))
> +                               continue;
> +                       if (WARN(ret >=3D sizeof(mode_option_buf), "aty12=
8fb: option too long\n"))
> +                               continue;
> +                       mode_option =3D mode_option_buf;
> +               }
>         }
>         return 0;
>  }
eturn 0;
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
