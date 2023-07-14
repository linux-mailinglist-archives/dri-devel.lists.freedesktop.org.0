Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7182375397A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 13:27:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E69D10E7F3;
	Fri, 14 Jul 2023 11:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0DD10E7F3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 11:27:04 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-c84fd44593aso1687457276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 04:27:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689334023; x=1691926023;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M9d2GJn9eN8pUvgJt/sqbVpEovcEaIR0UrH2yseemVM=;
 b=YC/8YX5URBCNFMVzabYrITgG1RWAUGFiprFd8QmaaP4IhmMM1jxx32fwD5kvyWBrmV
 mRuh9x1TxTZ3YRx6i2njqe73RXB1+1iwt8aoUxWfNMTvIm9ip+bSeJ89K4jAAgpTFZea
 F1rBAlkMPLhlQBx4tdjBQnjcxtMRvRVpJlYajtKf/KZmf4T8i2pMocN29eTK0Y0IN5T3
 o/VzWaCwT1DNc4oL5hF/xLxuGi1ffIs/QY6CD7wOoru2eHmf76yXd27IvFpwbGfevLYn
 4Zx6VHtslLUaA65NgCxU7i1H2ZfF43jD/eUC1SVzO/MFB5YUMu14aAPt+Vz3QNF2GtIo
 mcYA==
X-Gm-Message-State: ABy/qLZ1tkHIDm80EE0WsWBH5s+OSOyvS3OK0kvQqJI3MJ25FgIlTyUO
 FH6ILNwB04hLYmsNKV7/KemA/aNa1IlwZw==
X-Google-Smtp-Source: APBJJlEKN7kMyMBYYa4oQxFsHWpjnM/zoKPjTRnMxrKvyfDp/qHX+XrGlG13I5hDm0LuxvLQw8rO8w==
X-Received: by 2002:a25:bac7:0:b0:c33:2a1a:3dfa with SMTP id
 a7-20020a25bac7000000b00c332a1a3dfamr3691539ybk.23.1689334023242; 
 Fri, 14 Jul 2023 04:27:03 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com.
 [209.85.128.179]) by smtp.gmail.com with ESMTPSA id
 v30-20020a25aba1000000b00c832ad2e2eesm1791743ybi.60.2023.07.14.04.27.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jul 2023 04:27:03 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-570877f7838so17088367b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 04:27:03 -0700 (PDT)
X-Received: by 2002:a81:678b:0:b0:57a:6e41:948e with SMTP id
 b133-20020a81678b000000b0057a6e41948emr4381884ywc.11.1689334022850; Fri, 14
 Jul 2023 04:27:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689252746.git.geert@linux-m68k.org>
 <72746f6d9c47f09fc057ad7a4bbb3b7f423af803.1689252746.git.geert@linux-m68k.org>
 <87ilamu7e3.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87ilamu7e3.fsf@minerva.mail-host-address-is-not-set>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Jul 2023 13:26:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV1MXexXuRuvW2ap5KA51q_3h9X8jXdYXtFb2RF-BBLnw@mail.gmail.com>
Message-ID: <CAMuHMdV1MXexXuRuvW2ap5KA51q_3h9X8jXdYXtFb2RF-BBLnw@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/ssd130x: Add support for DRM_FORMAT_R1
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
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Fri, Jul 14, 2023 at 12:14=E2=80=AFPM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
> Thanks a lot for your patch, this has been on my TODO for some time!
>
> > The native display format is monochrome light-on-dark (R1).
> > Hence add support for R1, so monochrome applications can avoid the
> > overhead of back-and-forth conversions between R1 and XR24.
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > ---
> > This work interfered with commit 49d7d581ceaf4cf8 ("drm/ssd130x: Don't
> > allocate buffers on each plane update") in drm-misc/for-linux-next,
> > which always allocates the buffer upfront, while it is no longer needed
> > when never using XR24.
>
> you mean R1 here, right ?

I did mean R1. I think you missed the double negation.

> It's still used in ssd130x_clear_screen() though.

I guess it became worthwhile to make ssd130x_clear_screen()
do memset(data_array, 0, ...) and call ssd130x_write_data() directly,
avoiding the pointless reshuffling of black pixels in
ssd130x_update_rect()?

> > Probably ssd130x->buffer should be allocated on first use.
>
> Yes, that makes sense.
>
> > And why not allocate the buffers using devm_kcalloc()?
>
> I think there are some lifetimes discrepancies between struct device and
> struct drm_device objects. But we could use drm_device managed resources
> helpers, i.e: drmm_kzalloc().

The display should not be updated after .remove(), so I think plain
devm_kcalloc() should be fine.

> >  drivers/gpu/drm/solomon/ssd130x.c | 57 ++++++++++++++++++++++---------
> >  1 file changed, 40 insertions(+), 17 deletions(-)
> >
>
> [...]
>
> > +     case DRM_FORMAT_XRGB8888:
> > +             dst_pitch =3D DIV_ROUND_UP(drm_rect_width(rect), 8);
> > +             buf =3D ssd130x->buffer;
> > +             if (!buf)
> > +                     return 0;
> > +
>
> I think this check is not needed anymore now that the driver won't attemp=
t
> to update planes for disabled CRTCs ?

Probably. We do need it here when allocating on first use.

> It's OK for me to be paranoid though, specially after the other issue tha=
t
> you found. So I'll let you decide if you think is worth to keep the check=
.

I kept the check as I only moved/shifted that part of the code.

> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Thanks!

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
