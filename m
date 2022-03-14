Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 698D44D85ED
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 14:30:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB77D10EBBA;
	Mon, 14 Mar 2022 13:30:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 100B410EBBE
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 13:30:34 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id kk16so12479622qvb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 06:30:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7ESmoGYKvForOfgnFNNl3bul8J0TvzMfyrdSY3ncE6E=;
 b=ShuWJ+ZsQ+xgL9itjg9s2b6IF9Iq7xT0Ve6lJAF3LUTakRTA75y4HwiUnr2LTQUGEx
 BrpBmLZxYAMb3VGL8UimrYBIrbdVsTP9TbeHMwDYKvZnc+B21yiTN07kE4XzLSIKKpF2
 CVjxqkwFcpgrhXJq09JP8YFBhnwFSXpnXvSZFk+fzhmrrqxfNAH9kmOgUd5CPOOetqJM
 KwLj0+hQW8VIu2U/WHRCIbaMmLUN63ZteqBdhtmLdCrU5/x2ZSXsamVa0Znc23FlBy2s
 f+6ggSjyWc+C77zGruCtj03Gc7P0WE8wUgWoDzTKkc0XRlrTOluticX+3/cPEAPRfUEX
 omfw==
X-Gm-Message-State: AOAM530izMBrF2JMO9jr+LwCmu0to2SkA60VhksNj8uGqG1YXbf0FTP0
 ZqAguxOs9ZgQ4FqQ2tpKC4WG+ty7rMAlkg==
X-Google-Smtp-Source: ABdhPJzQn9h68V6T5NjpLM6mkRsI4V0c2skTV4IWoOv6xm0cLAsBCQCVvhxi409HfFUCbMCtDzR0eA==
X-Received: by 2002:a05:6214:1cc2:b0:435:7195:784f with SMTP id
 g2-20020a0562141cc200b004357195784fmr17290240qvd.59.1647264632275; 
 Mon, 14 Mar 2022 06:30:32 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com.
 [209.85.128.181]) by smtp.gmail.com with ESMTPSA id
 p7-20020a05622a13c700b002de9f3894c2sm11558901qtk.50.2022.03.14.06.30.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 06:30:31 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-2e5757b57caso7314227b3.4
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 06:30:30 -0700 (PDT)
X-Received: by 2002:a0d:f1c7:0:b0:2db:d2bc:be11 with SMTP id
 a190-20020a0df1c7000000b002dbd2bcbe11mr18928111ywf.62.1647264630398; Mon, 14
 Mar 2022 06:30:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1646683502.git.geert@linux-m68k.org>
 <8d3c0cc370b0214244b01a64c588e5e506531716.1646683502.git.geert@linux-m68k.org>
In-Reply-To: <8d3c0cc370b0214244b01a64c588e5e506531716.1646683502.git.geert@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Mar 2022 14:30:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVq19wpA_7nKKTm-G2EmK3cMxxP6nbR_u=vkazqCZ=KhQ@mail.gmail.com>
Message-ID: <CAMuHMdVq19wpA_7nKKTm-G2EmK3cMxxP6nbR_u=vkazqCZ=KhQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] drm/fourcc: Add DRM_FORMAT_C[124]
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Javier Martinez Canillas <javierm@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Helge Deller <deller@gmx.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux/m68k <linux-m68k@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 7, 2022 at 9:53 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> Introduce fourcc codes for color-indexed frame buffer formats with two,
> four, and sixteen colors, and provide a mapping from bit per pixel and
> depth to fourcc codes.
>
> As the number of bits per pixel is less than eight, these rely on proper
> block handling for the calculation of bits per pixel and pitch.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -99,7 +99,10 @@ extern "C" {
>  #define DRM_FORMAT_INVALID     0
>
>  /* color index */
> -#define DRM_FORMAT_C8          fourcc_code('C', '8', ' ', ' ') /* [7:0] C */
> +#define DRM_FORMAT_C1          fourcc_code('C', '1', ' ', ' ') /* [7:0] C0:C1:C2:C3:C4:C5:C6:C7 1:1:1:1:1:1:1:1 eight pixels/byte */
> +#define DRM_FORMAT_C2          fourcc_code('C', '2', ' ', ' ') /* [7:0] C0:C1:C2:C3 2:2:2:2 four pixels/byte */
> +#define DRM_FORMAT_C4          fourcc_code('C', '4', ' ', ' ') /* [7:0] C0:C1 4:4 two pixels/byte */
> +#define DRM_FORMAT_C8          fourcc_code('C', '8', ' ', ' ') /* [7:0] C 8 one pixel/byte */
>
>  /* 8 bpp Red */
>  #define DRM_FORMAT_R8          fourcc_code('R', '8', ' ', ' ') /* [7:0] R */

After replying to Ilia's comment[1], I realized the CFB drawing
operations use native byte and bit ordering, unless
FBINFO_FOREIGN_ENDIAN is set.
While Amiga, Atari, and Sun-3 use big-endian bit ordering,
e.g. Acorn VIDC[2] uses little endian, and SH7760[3] is configurable
(sh7760fb configures ordering to match host order).
BTW, ssd130{7fb,x}_update_rect() both assume little-endian, so I
guess they are broken on big-endian.
Fbtest uses big-endian bit ordering, so < 8 bpp is probably broken
on little-endian.

Hence the above should become:

    #define DRM_FORMAT_C1          fourcc_code('C', '1', ' ', ' ') /*
[7:0] C7:C6:C5:C4:C3:C2:C1:C0 1:1:1:1:1:1:1:1 eight pixels/byte */
    #define DRM_FORMAT_C2          fourcc_code('C', '2', ' ', ' ') /*
[7:0] C3:C2:C1:C0 2:2:2:2 four pixels/byte */
    #define DRM_FORMAT_C4          fourcc_code('C', '4', ' ', ' ') /*
[7:0] C1:C0 4:4 two pixels/byte */

The same changes should be made for DRM_FORMAT_[RD][124].

The fbdev emulation code should gain support for these with and without
DRM_FORMAT_BIG_ENDIAN, the latter perhaps only on big-endian platforms?

[1] https://lore.kernel.org/r/CAKb7UvgEdm9U=+RyRwL0TGRfA_Qc7NbhCWoZOft2DKdXggtKYw@mail.gmail.com/
[2] See p.30 of the VIDC datasheet
    http://chrisacorns.computinghistory.org.uk/docs/Acorn/Misc/Acorn_VIDC_Datasheet.pdf
[3] See p.1178 of the SH7660 datasheet
    https://datasheet.octopart.com/HD6417760BL200AV-Renesas-datasheet-14105759.pdf

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
