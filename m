Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 767FC748229
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 12:29:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C534D10E34D;
	Wed,  5 Jul 2023 10:29:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9C0D10E34D
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 10:29:47 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-bff27026cb0so7247341276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jul 2023 03:29:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688552986; x=1691144986;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N6aXvCfEidZYxvood9hpU+j2xHJrXwUMnh0Cp5slv0k=;
 b=LCzjI7H6lixI1vaQh/WNOrxuf8Kg0b+5XOOlsdEOocUpWwyrlu4+qjJv6kvo+gZtwB
 5PlUVZBO0tfTYrU6T9eRYn8KAUcuJBxBRm/379pBTJsj3twpetpNIev15Z6ZldobohUF
 fLH8z8d4eVKzGeEJDlhi/5SFKXiSic4Is/L5NIdpGFXz9+m7fYqspCfekcSIFYX0yOeX
 /0nzi8aNVJEN5BB4JtE4h9A1dTs9mUT/IrtiYW09v16kd2djsOhr3YsOvfdaLlAA0l8c
 UhwdSo5xwPqQAMafVX5W8p/E+qGhBEB4MqpDHhAGold5lafZo6KFxilvXEjuiiZNHjmL
 0irg==
X-Gm-Message-State: ABy/qLaTYu1y3N/CAmdV5RJJT19Vw0SDM1mE0CW8Jc0IFAzGhA34NaLB
 byfEDvlj9DjkzKGpMwyqGs2RWSrFSBDNYA==
X-Google-Smtp-Source: APBJJlEx3+jwPyswqWm7HXitfi1FOP+L8h9QLvGUtoes9typ0YrBJE9r/Pw5YFaPJWX8h/bu8njHgA==
X-Received: by 2002:a25:1602:0:b0:c56:8f02:9fc8 with SMTP id
 2-20020a251602000000b00c568f029fc8mr6262290ybw.35.1688552986069; 
 Wed, 05 Jul 2023 03:29:46 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175]) by smtp.gmail.com with ESMTPSA id
 64-20020a251943000000b00be4f34d419asm5282627ybz.37.2023.07.05.03.29.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jul 2023 03:29:45 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-bb3a77abd7bso7272782276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jul 2023 03:29:45 -0700 (PDT)
X-Received: by 2002:a25:11c6:0:b0:c00:514c:55f with SMTP id
 189-20020a2511c6000000b00c00514c055fmr12165982ybr.47.1688552985708; Wed, 05
 Jul 2023 03:29:45 -0700 (PDT)
MIME-Version: 1.0
References: <2c28c0a137854d39b6bc997a21bd6d2db1f7a0a5.1687423204.git.geert+renesas@glider.be>
 <903c71fb-61af-e12a-ca56-a49d4e930f9f@loongson.cn>
In-Reply-To: <903c71fb-61af-e12a-ca56-a49d4e930f9f@loongson.cn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Jul 2023 12:29:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXoZiDupub2zEFjOwTJFswEsJq62zVa_K-g6TWg+zS7-g@mail.gmail.com>
Message-ID: <CAMuHMdXoZiDupub2zEFjOwTJFswEsJq62zVa_K-g6TWg+zS7-g@mail.gmail.com>
Subject: Re: [32/39] drm: renesas: shmobile: Shutdown the display on remove
To: Sui Jingfeng <suijingfeng@loongson.cn>
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
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sui,

On Tue, Jun 27, 2023 at 4:57=E2=80=AFPM Sui Jingfeng <suijingfeng@loongson.=
cn> wrote:
> On 2023/6/22 17:21, Geert Uytterhoeven wrote:
> > When the device is unbound from the driver, the display may be active.
> > Make sure it gets shut down.
>
> would you mind to give a short description why this is necessary.

That's a good comment.
It turned out that this is not really necessary here, but to avoid a regres=
sion
with "[PATCH 34/39] drm: renesas: shmobile: Atomic conversion part 1", wher=
e
it is needed to call drm_atomic_helper_shutdown().
As the comments for drm_atomic_helper_shutdown() says it is the
atomic version of drm_helper_force_disable_all(), I figured I had to
introduce a call to the latter first, before doing the atomic conversion.

Does that make sense?

> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>

> > --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> > +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> > @@ -16,6 +16,7 @@
> >   #include <linux/pm_runtime.h>
> >   #include <linux/slab.h>
> >
> > +#include <drm/drm_crtc_helper.h>
> >   #include <drm/drm_drv.h>
> >   #include <drm/drm_fbdev_generic.h>
> >   #include <drm/drm_gem_dma_helper.h>
> > @@ -145,6 +146,7 @@ static int shmob_drm_remove(struct platform_device =
*pdev)
> >       struct drm_device *ddev =3D &sdev->ddev;
> >
> >       drm_dev_unregister(ddev);
> > +     drm_helper_force_disable_all(ddev);
>
> Is it that the DRM core recommend us to use
> drm_atomic_helper_disable_all() ?

Well, drm_atomic_helper_shutdown() is a convenience wrapper
around drm_atomic_helper_disable_all()... But we can't call any
atomic helpers yet, before the conversion to atomic modesetting.

>
> >       drm_kms_helper_poll_fini(ddev);
> >       return 0;
> >   }

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
