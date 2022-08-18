Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6921A5980D2
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 11:30:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36030C7ECF;
	Thu, 18 Aug 2022 09:30:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A296C7E8A
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 09:29:47 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id b2so797918qvp.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 02:29:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=FPBV0BvJy0PPQ45PhQv1Qdnn8j75RhV+6l7B5TE8xOo=;
 b=s/GUkub0q3oiu8NvwjjOrC7r+Q653W913JdbTS9W00tOAn954Sb/A+4qU0IQN9qN5y
 afGBAsKtU2293zkmE/jz/hlvQztsoduN9o0Aebi7DaKVzvEEA9Z/8LExC20MoCsAw2k8
 uwkmirXYZ/yHiZjRREHZB0Z4X+NcyvW3o/u5plMV/gu9AVcOaCjNJdp2xzPU6By7RWR4
 yxbiyycxFlaQ6fem+WvA16VcBR0pCbg4DWFlszXLEn6m8mAcfhCqFBy++BycMkYsvFQ8
 a6QNX9lrKRn+ffW2UhFRDdOXDj5NBTeypSaVfbxTnolcTS1Qe7UeCPo1Z7FQC9B6p7CX
 cS1g==
X-Gm-Message-State: ACgBeo31fA4wfSKYgQ1PHX4xfGTO7Pbejf/oa1yBSS7DdlLDXa1fmKOF
 pq0VqNqtdDIlpZXWOU5BbM46+UDJlxyEmw==
X-Google-Smtp-Source: AA6agR4GHzXF2yXhrsElieEXNLGkxPPy5or1Iu/YCWs7qWPnntv/UUul5CwaIYNGSV1+fp6Tfa5aIw==
X-Received: by 2002:a05:6214:c43:b0:476:eb8c:bae8 with SMTP id
 r3-20020a0562140c4300b00476eb8cbae8mr1503650qvj.125.1660814985739; 
 Thu, 18 Aug 2022 02:29:45 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com.
 [209.85.128.182]) by smtp.gmail.com with ESMTPSA id
 u15-20020a05620a454f00b006bb0e5ca4bbsm1158986qkp.85.2022.08.18.02.29.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Aug 2022 02:29:45 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-324ec5a9e97so25536917b3.7
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 02:29:45 -0700 (PDT)
X-Received: by 2002:a25:880f:0:b0:67c:2727:7e3c with SMTP id
 c15-20020a25880f000000b0067c27277e3cmr2060915ybl.36.1660814984766; Thu, 18
 Aug 2022 02:29:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220727160753.1774761-1-biju.das.jz@bp.renesas.com>
 <20220727160753.1774761-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220727160753.1774761-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Aug 2022 11:29:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU8V9=w-uTt7Lx264wtz+TopHUD+W9H66y68tNMOG7P8w@mail.gmail.com>
Message-ID: <CAMuHMdU8V9=w-uTt7Lx264wtz+TopHUD+W9H66y68tNMOG7P8w@mail.gmail.com>
Subject: Re: [PATCH v5 04/10] drm: rcar-du: Add rcar_du_lib_fb_create()
To: Biju Das <biju.das.jz@bp.renesas.com>
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

On Wed, Jul 27, 2022 at 6:08 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Move the common code from rcar_du_fb_create->rcar_du_lib_fb_create,
> so that rzg2l_du_fb_create() can reuse the common code.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v5:
>  * New patch

Thanks for your patch!

> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
> @@ -392,3 +392,72 @@ int rcar_du_dumb_create(struct drm_file *file, struct drm_device *dev,
>
>         return drm_gem_cma_dumb_create_internal(file, dev, args);
>  }
> +
> +struct drm_framebuffer *
> +rcar_du_lib_fb_create(struct drm_device *dev, struct drm_file *file_priv,
> +                     const struct drm_mode_fb_cmd2 *mode_cmd)
> +{
> +       struct rcar_du_device *rcdu = to_rcar_du_device(dev);
> +       const struct rcar_du_format_info *format;
> +       unsigned int chroma_pitch;
> +       unsigned int max_pitch;
> +       unsigned int align;
> +       unsigned int i;
> +
> +       format = rcar_du_format_info(mode_cmd->pixel_format);
> +       if (format == NULL) {
> +               dev_dbg(dev->dev, "unsupported pixel format %08x\n",

I know you're just moving code, but nowadays we do have "%p4cc",
which takes a pointer to the fourcc value.

> +                       mode_cmd->pixel_format);
> +               return ERR_PTR(-EINVAL);
> +       }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
