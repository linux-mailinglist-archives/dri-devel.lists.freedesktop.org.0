Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 254B448E825
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 11:17:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4141A10E398;
	Fri, 14 Jan 2022 10:17:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 816DD10E398
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 10:17:32 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id g5so5588310vkg.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 02:17:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n/k7QX5xJRfyMxEBsWvg+WGjqrbJJEYkdAPVqldbfhI=;
 b=GdJEfrBYu32BC1bOzB1VoZ+U5+BPDRSLMq7amXn5PhGh7+HvKrFv3Po+6MjUwdBDKy
 U/updqlp/tiawuMidOzZ4JSTBkzkWBEp/sXlSKsex53kBw/tLrClqunkCbqoP8cLkhwM
 S3NtbTf8Eg9QKZub1BQWNwY32pta27jm1LeGkTYPIMPU1FUcv6K+FVulgW1NV2Ant1Fq
 3/lGA7Xj25rZFNup6x4JSU8En+EELiZsJpDNYHC+t3C+uQWYF+1+EO9ZGaiHECfztnXe
 euPC2s8kd3t2DGcE+OEYKlu72VLXTEVHg/7g0QGNYK5miRDlLCNLg4BAodECRmMx0Ex7
 SNPA==
X-Gm-Message-State: AOAM530QcTiZxrfV+xi82mrhXUF42dKlIEnE+j934/zJ0Njn4NVAppBM
 0ULpWabgeVXkKQCzJ/capeb8U/ikYZ6c4h4/
X-Google-Smtp-Source: ABdhPJwTbjnqahMUFjyVsd+mV0om+rNsVh/hJLqNNiPyiTYyRG6Sspn4L68kwm9K28MC57rSUne3mw==
X-Received: by 2002:a1f:2e4b:: with SMTP id u72mr4043026vku.4.1642155451374;
 Fri, 14 Jan 2022 02:17:31 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com.
 [209.85.222.46])
 by smtp.gmail.com with ESMTPSA id g43sm2096728uae.2.2022.01.14.02.17.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 02:17:30 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id c36so15996919uae.13
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 02:17:30 -0800 (PST)
X-Received: by 2002:a67:e905:: with SMTP id c5mr3785219vso.68.1642155450169;
 Fri, 14 Jan 2022 02:17:30 -0800 (PST)
MIME-Version: 1.0
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
 <20220112174612.10773-11-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220112174612.10773-11-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Jan 2022 11:17:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUyPbykGc+OPPmxd63qsSRjG1h_xm3GXHsdbcwfZ+48ew@mail.gmail.com>
Message-ID: <CAMuHMdUyPbykGc+OPPmxd63qsSRjG1h_xm3GXHsdbcwfZ+48ew@mail.gmail.com>
Subject: Re: [RFC 10/28] drm: rcar-du: of: Increase buff size for compatible
 variable
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
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

On Wed, Jan 12, 2022 at 6:46 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Increase buff size for compatible variable to avoid stack corruption
> with RZ/G2L SoC's(renesas,du-r9a07g044l) which requires a buff size
> more than the current allocated size.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/gpu/drm/rcar-du/rcar_du_of.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_of.c
> @@ -200,7 +200,7 @@ static void __init rcar_du_of_lvds_patch(const struct of_device_id *of_ids)
>         struct device_node *lvds_node;
>         struct device_node *soc_node;
>         struct device_node *du_node;
> -       char compatible[22];
> +       char compatible[24];
>         const char *soc_name;
>         unsigned int i;
>         int ret;

What about changing the code to use kasprintf() instead, to prevent
this from ever happening again?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
