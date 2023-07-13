Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA407525A8
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 16:54:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F6210E6F1;
	Thu, 13 Jul 2023 14:54:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0056910E6F1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 14:54:13 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-57012b2973eso7054667b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 07:54:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689260052; x=1691852052;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8QVCqYOG8VAURqceBDpWKjPxyj1fgO2WW9WWrQCQVBU=;
 b=Tz0pzV2/bRANq0vEF27G/NsnGmpcUwFGoxJXRQRbvcPEeHPSFsNBIdwlIdDqUJEBYv
 Lw9uOWOYNCNDIoWD77RDJkdI2SlDLGtylKVfaAQ+G7i7y0fIAhJbrVfHnIvk8WZg3oMV
 CAo/YT43UMDBVga+ksqvvC52XSLYuPLQhQm+2UIwCyBt9eMLQBt5dV7GskdN9s4/Rx2d
 x0J6De4l3ZMG84OE8JN/3o31Ui0VP68ulBY63yxVKUdMkJPk9ydbKoXh55Yvk78HLr9h
 bHjX2wC1S3AaoDPXfpInIjAWqHfDyPVlWBNUFNUEVpc5WXPVh0c775ptkC9eXO3ZZly3
 pYcA==
X-Gm-Message-State: ABy/qLbtii9oQMx8gBxMO1L2wlvaZj5AoG01GpycMFi7Jd+aVknVMYle
 1wsPO6yOmojL3ktDj87x0a2yZresiDYj5APX
X-Google-Smtp-Source: APBJJlFHGu6h69ckrRCXfxyKIy3Ah0KkIczpjOhlgR4zQQKAdF25XWgplOTet4tyIml/qL3tDjpQiw==
X-Received: by 2002:a81:49d2:0:b0:56d:31a1:bd9b with SMTP id
 w201-20020a8149d2000000b0056d31a1bd9bmr1910203ywa.41.1689260052639; 
 Thu, 13 Jul 2023 07:54:12 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com.
 [209.85.219.182]) by smtp.gmail.com with ESMTPSA id
 x13-20020a81a00d000000b0056d51c39c1fsm1772851ywg.23.2023.07.13.07.54.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 07:54:12 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-c7a5600d04dso758323276.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 07:54:11 -0700 (PDT)
X-Received: by 2002:a25:ad49:0:b0:c4b:ada8:8b86 with SMTP id
 l9-20020a25ad49000000b00c4bada88b86mr1391571ybe.64.1689260051536; Thu, 13 Jul
 2023 07:54:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230609170941.1150941-1-javierm@redhat.com>
 <20230609170941.1150941-5-javierm@redhat.com>
 <CAMuHMdVXhi52KfpCmnum+9t74UWP+AOLE95xQU6VV6Nz=VHk1Q@mail.gmail.com>
 <87fs5sgdfh.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdWmJjGX+s=z0bBMDz0=zqZJHrGhkzWyRkmstS0eW9aiTg@mail.gmail.com>
 <87cz0vhpd1.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87cz0vhpd1.fsf@minerva.mail-host-address-is-not-set>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Jul 2023 16:53:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX3VNcP1MS_Padps2Qwy=cmAU-4=XddVj+4-1sevCuErg@mail.gmail.com>
Message-ID: <CAMuHMdX3VNcP1MS_Padps2Qwy=cmAU-4=XddVj+4-1sevCuErg@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] drm/ssd130x: Don't allocate buffers on each plane
 update
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
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Thu, Jul 13, 2023 at 4:13=E2=80=AFPM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
> > On Thu, Jul 13, 2023 at 3:21=E2=80=AFPM Javier Martinez Canillas
> > <javierm@redhat.com> wrote:
> >> Geert Uytterhoeven <geert@linux-m68k.org> writes:
> >> > On Fri, Jun 9, 2023 at 7:09=E2=80=AFPM Javier Martinez Canillas
> >> > <javierm@redhat.com> wrote:
> >> >> The resolutions for these panels are fixed and defined in the Devic=
e Tree,
> >> >> so there's no point to allocate the buffers on each plane update an=
d that
> >> >> can just be done once.
> >> >>
> >> >> Let's do the allocation and free on the encoder enable and disable =
helpers
> >> >> since that's where others initialization and teardown operations ar=
e done.
> >> >>
> >> >> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> >> >> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> >> ---
> >> >>
> >> >> (no changes since v1)
> >> >
> >> > Thanks for your patch, which is now commit 49d7d581ceaf4cf8
> >> > ("drm/ssd130x: Don't allocate buffers on each plane update") in
> >> > drm-misc/for-linux-next.
> >> >
> >> >> --- a/drivers/gpu/drm/solomon/ssd130x.c
> >> >> +++ b/drivers/gpu/drm/solomon/ssd130x.c
> >> >> @@ -701,14 +709,22 @@ static void ssd130x_encoder_helper_atomic_ena=
ble(struct drm_encoder *encoder,
> >> >>                 return;
> >> >>
> >> >>         ret =3D ssd130x_init(ssd130x);
> >> >> -       if (ret) {
> >> >> -               ssd130x_power_off(ssd130x);
> >> >> -               return;
> >> >> -       }
> >> >> +       if (ret)
> >> >> +               goto power_off;
> >> >> +
> >> >> +       ret =3D ssd130x_buf_alloc(ssd130x);
> >> >
> >> > This appears to be too late, causing a NULL pointer dereference:
> >> >
> >>
> >> Thanks for reporting this issue.
> >>
> >> > [   59.302761] [<c0303d90>] ssd130x_update_rect.isra.0+0x13c/0x340
> >> > [   59.304231] [<c0304200>]
> >> > ssd130x_primary_plane_helper_atomic_update+0x26c/0x284
> >> > [   59.305716] [<c02f8d54>] drm_atomic_helper_commit_planes+0xfc/0x2=
7c
> >> >
> >>
> >> I wonder how this could be too late. I thought that the encoder
> >> .atomic_enable callback would be called before any plane .atomic_updat=
e.

[...]

> Thanks for the log, so I think the problem is that the default struct
> drm_mode_config_helper_funcs .atomic_commit_tail is
> drm_atomic_helper_commit_tail():
>
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_atomic=
_helper.c#L1710
>
> That helper calls drm_atomic_helper_commit_planes() and attempts to commi=
t
> the state for all planes even for CRTC that are not enabled. I see that
> there is a drm_atomic_helper_commit_tail_rpm() helper that instead calls:
>
> drm_atomic_helper_commit_planes(dev, old_state, DRM_PLANE_COMMIT_ACTIVE_O=
NLY),
> which I thought that was the default behaviour.
>
> Can you please try the following change [0] ? If that works then I can
> propose as a proper patch.
>
> [0]:
> diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/=
ssd130x.c
> index afb08a8aa9fc..c543caa3ceee 100644
> --- a/drivers/gpu/drm/solomon/ssd130x.c
> +++ b/drivers/gpu/drm/solomon/ssd130x.c
> @@ -795,6 +795,10 @@ static const struct drm_mode_config_funcs ssd130x_mo=
de_config_funcs =3D {
>         .atomic_commit =3D drm_atomic_helper_commit,
>  };
>
> +static const struct drm_mode_config_helper_funcs ssd130x_mode_config_hel=
pers =3D {
> +        .atomic_commit_tail =3D drm_atomic_helper_commit_tail_rpm,
> +};
> +
>  static const uint32_t ssd130x_formats[] =3D {
>         DRM_FORMAT_XRGB8888,
>  };
> @@ -923,6 +927,7 @@ static int ssd130x_init_modeset(struct ssd130x_device=
 *ssd130x)
>         drm->mode_config.max_height =3D max_height;
>         drm->mode_config.preferred_depth =3D 24;
>         drm->mode_config.funcs =3D &ssd130x_mode_config_funcs;
> +       drm->mode_config.helper_private =3D &ssd130x_mode_config_helpers;
>
>         /* Primary plane */
>

Thanks, that works!

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
