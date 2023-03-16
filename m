Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A785E6BD59F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 17:31:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB9810E0E9;
	Thu, 16 Mar 2023 16:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E39510E0E9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 16:31:06 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id h19so2356726qtn.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 09:31:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678984265;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=onE1BSa8siKq3creWSMcSkNL7lBSXVXcbw9MfjVIBVY=;
 b=iDqpK03coFSd8K11nt2O+VMN6TPXUCrPJwkauUOA5C9UDKxJaad+lA0jAVJfYMUiaH
 VEHc791RNWUXHtaU0o0t69TGzhWkp0yCg3i1ZM9X/sxVeaKFRZjaa9xwL3dSHpmmbNWn
 WI+u9CQ3vQiUAawQ/2l52aU+vGMUQq079FurQtA+2xJAmB5gTwEOJIwcZlZvHIFWUO15
 QWPI1Og30kKN4Jrh/dtNBxcpu5dpKEehzGGyuRVf17rR698/8sPViB+j3m+3DYiMiy8x
 rMGwIO0Kz7K/SalKzYjSeMNr8B+pk0E0NPBMhUfeE0JwqM+y+EFPpiPNYCrh3hJ3h3NN
 /zHQ==
X-Gm-Message-State: AO0yUKWMHNziqDSu3Tt6TthOUaLoiGymaT4XLnNL2oH2Jt4NDYNTsDP4
 1IQwYfT9GKshhcGPWpnp9jaCrzdc2l+AbQ==
X-Google-Smtp-Source: AK7set9pnxPjrlGhsa59zDUtgGdx/xfS5S59EyGYn9XEWHrlB7CThX8u4zTftqfnbjeROd5XgnPDeQ==
X-Received: by 2002:a05:622a:180d:b0:3b8:6d3a:5ec7 with SMTP id
 t13-20020a05622a180d00b003b86d3a5ec7mr7626054qtc.22.1678984264767; 
 Thu, 16 Mar 2023 09:31:04 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175]) by smtp.gmail.com with ESMTPSA id
 d18-20020ac86152000000b003d3a34d2eb2sm4589057qtm.41.2023.03.16.09.31.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 09:31:04 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id e194so2621527ybf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 09:31:03 -0700 (PDT)
X-Received: by 2002:a05:6902:145:b0:ac2:a7a7:23c3 with SMTP id
 p5-20020a056902014500b00ac2a7a723c3mr21898287ybh.12.1678984262946; Thu, 16
 Mar 2023 09:31:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230307215039.346863-1-javierm@redhat.com>
In-Reply-To: <20230307215039.346863-1-javierm@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Mar 2023 17:30:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUs0bXz1T41=bW0D1NwVYZyKUsrjCkF2hGsRPSt5+qvMA@mail.gmail.com>
Message-ID: <CAMuHMdUs0bXz1T41=bW0D1NwVYZyKUsrjCkF2hGsRPSt5+qvMA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/format-helper: Make conversion_buf_size() support
 sub-byte pixel fmts
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>,
 Maxime Ripard <maxime@cerno.tech>, David Gow <davidgow@google.com>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Tue, Mar 7, 2023 at 10:54=E2=80=AFPM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> There are DRM fourcc formats that have pixels smaller than a byte, but th=
e
> conversion_buf_size() function assumes that pixels are a multiple of byte=
s
> and use the struct drm_format_info .cpp field to calculate the dst_pitch.
>
> Instead, calculate it by using the bits per pixel (bpp) and divide it by =
8
> to account for formats that have sub-byte pixels.
>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> Tested by making sure that the following command still succeeds:
>
> ./tools/testing/kunit/kunit.py run \
> --kunitconfig=3Ddrivers/gpu/drm/tests/.kunitconfig
>
> Changes in v2:
> - Drop an unused variable, that was pointed out by the kernel robot.

Thanks for your patch!

> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -409,12 +409,15 @@ static size_t conversion_buf_size(u32 dst_format, u=
nsigned int dst_pitch,
>                                   const struct drm_rect *clip)
>  {
>         const struct drm_format_info *dst_fi =3D drm_format_info(dst_form=
at);
> +       unsigned int bpp;
>
>         if (!dst_fi)
>                 return -EINVAL;
>
> -       if (!dst_pitch)
> -               dst_pitch =3D drm_rect_width(clip) * dst_fi->cpp[0];
> +       if (!dst_pitch) {
> +               bpp =3D drm_format_info_bpp(dst_fi, 0);
> +               dst_pitch =3D DIV_ROUND_UP(drm_rect_width(clip) * bpp, 8)=
;

I know I'm a bit late to the party,  but here's actually a helper for that:

    dst_pitch =3D drm_format_info_min_pitch(info, 0, drm_rect_width(clip));

> +       }
>
>         return dst_pitch * drm_rect_height(clip);
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
