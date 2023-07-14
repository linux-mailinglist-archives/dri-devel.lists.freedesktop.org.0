Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAF3753B3F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 14:43:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD4010E888;
	Fri, 14 Jul 2023 12:43:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E4810E888
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 12:43:45 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id
 5614622812f47-3a43cbb432aso677889b6e.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 05:43:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689338624; x=1691930624;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Px1vO0AvllUBalN0eYcohDkgadNEXWhdZtlNo8lqudc=;
 b=lfBOHFtdh0u2/wJUaJJhb7TQWb+FRSP/ceg6RGT4Mbm/hMnN8fQzuM72y7Oe4Namow
 8YeYrOZY5taT2i8iO68wbjsxPPV17qDNOtlCboQl8uW3Ho0NOwmM3+tPuFByp+qGGeDb
 zZ9TxFwsRODkrqNcFVPSvUkn9nc/iCEGHo0CHUL3YIDl5H8pUnOa6k+5cHRK73ipYrn1
 VmZVD1tjCWg7fR5NQ5uYX995sHzSQ8OPvC7yOK/MbKHX59w6RQbMmrLNOThtPSo/Xuqd
 W9Ro3uHsbUGb+3si1rcGpMAVCXP7X+MJwqSs1IgwhdXxKIodyXGg8FjcFdk9KESBqfdo
 sYCA==
X-Gm-Message-State: ABy/qLZMB8rAVRtkHCR9or3OCxPfen0VNvZJAzOVsxllxaPonSBqg2sv
 FMIYtwvRtSq/Cbke17rMdXVabrWhkwOPHQ==
X-Google-Smtp-Source: APBJJlHX21jhOla/zqSZ/9NVdt7ssnVBaxM9+Tx2Ljv49D3E7NotErDUOYAvK9fS1BgimJnvu25G+A==
X-Received: by 2002:a05:6808:ec2:b0:3a3:47c5:1de3 with SMTP id
 q2-20020a0568080ec200b003a347c51de3mr5542238oiv.49.1689338624093; 
 Fri, 14 Jul 2023 05:43:44 -0700 (PDT)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com.
 [209.85.167.171]) by smtp.gmail.com with ESMTPSA id
 w13-20020a056808140d00b003a38eba0bcdsm3854591oiv.0.2023.07.14.05.43.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jul 2023 05:43:43 -0700 (PDT)
Received: by mail-oi1-f171.google.com with SMTP id
 5614622812f47-3a43cbb432aso677863b6e.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 05:43:42 -0700 (PDT)
X-Received: by 2002:a05:6358:913:b0:131:b4c:b868 with SMTP id
 r19-20020a056358091300b001310b4cb868mr5242387rwi.3.1689338622730; Fri, 14 Jul
 2023 05:43:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689252746.git.geert@linux-m68k.org>
 <72746f6d9c47f09fc057ad7a4bbb3b7f423af803.1689252746.git.geert@linux-m68k.org>
 <87ilamu7e3.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdV1MXexXuRuvW2ap5KA51q_3h9X8jXdYXtFb2RF-BBLnw@mail.gmail.com>
 <875y6macxu.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <875y6macxu.fsf@minerva.mail-host-address-is-not-set>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Jul 2023 14:43:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUrqwQAaNFONO0KOktrRY_twpktAP6=AeKv_8jjdb5_fA@mail.gmail.com>
Message-ID: <CAMuHMdUrqwQAaNFONO0KOktrRY_twpktAP6=AeKv_8jjdb5_fA@mail.gmail.com>
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

On Fri, Jul 14, 2023 at 2:35=E2=80=AFPM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
> > On Fri, Jul 14, 2023 at 12:14=E2=80=AFPM Javier Martinez Canillas
> > <javierm@redhat.com> wrote:
> >> Geert Uytterhoeven <geert@linux-m68k.org> writes:
> >> Thanks a lot for your patch, this has been on my TODO for some time!
> >>
> >> > The native display format is monochrome light-on-dark (R1).
> >> > Hence add support for R1, so monochrome applications can avoid the
> >> > overhead of back-and-forth conversions between R1 and XR24.
> >> >
> >> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

> >> > Probably ssd130x->buffer should be allocated on first use.
> >>
> >> Yes, that makes sense.
> >>
> >> > And why not allocate the buffers using devm_kcalloc()?
> >>
> >> I think there are some lifetimes discrepancies between struct device a=
nd
> >> struct drm_device objects. But we could use drm_device managed resourc=
es
> >> helpers, i.e: drmm_kzalloc().
> >
> > The display should not be updated after .remove(), so I think plain
> > devm_kcalloc() should be fine.
>
> That was precisely my point, that there could be atomic commits even afte=
r
> the driver has been removed (e.g: if using DRM fbdev emulation, user-spac=
e
> can keep the /dev/fb0 opened and continue updating the framebuffer. That'=
s
> not released until the fd is closed and struct fb_ops .fb_destroy called.
>
> But that's a general rule in DRM, any user-visible resource must not be
> allocated using device managed resources and instead use the drm_device
> managed resources helpers. To make sure that are not released until the
> last call to drm_dev_put():

These buffers are not user-visible, so they should not be accessed
after .remove().  When these are accessed, the next step would be
to write the buffer data to the device, which would also fail miserably,
as the regmap, GPIO, and regulator are hardware resources managed
through devm_*().

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
