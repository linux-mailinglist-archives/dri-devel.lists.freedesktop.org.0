Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF4658F8B5
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 10:00:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD9039A6BE;
	Thu, 11 Aug 2022 08:00:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F17197E91
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 07:59:54 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id j11so12748016qvt.10
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 00:59:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=Mzt9xiZn2UZTlTKHVMvt4CFBZHRE5sVzzM2CBT3iHn0=;
 b=WpoBdEUl3RgAbX2Bl56+7tQ5/ALMjPv7/qlfYR1KeBWb3K3uncQKvsfa/YXzzVS/CV
 4REC8nr+LMtT2HmlXa7EbRzW3TA9RQKYHmxixM0slg9t3F8UZvBtcWct3SHHlc/5MjiH
 sJJYPE/0IvJ+zLgmOCRahJTbAFGPnUoMv4VyKfJepEuG47f67MwLg8WkMMYz/NesIIMl
 8t710PiLIZeUbe6sj0bhhQwk3reXR1TQ3wi5rjBfHE1212IHHNQrGla7wnWjwBobOv9N
 tYgT8XYgfC8zJAc9KfulYh/UZO42eUcSNO18lCgMJ4ojCvwyhDq/y5TkY7n891Y5ntnH
 TrnQ==
X-Gm-Message-State: ACgBeo3xx2x8SdD3555kJ2idCmy6wOOPOlg0ZAH6hHTeC4eart4QYwXR
 wGAKiZM+0P13PLaUtJoyWkc25ZDodZyGDC0W
X-Google-Smtp-Source: AA6agR4+/CygjLahcwK3hNnG9d5Jf76xNY+i4yo4Ynn0pVp+XAd4iJaxg3+zc740PaOGpgQJaQs2vg==
X-Received: by 2002:ad4:4ea1:0:b0:474:8090:5cd2 with SMTP id
 ed1-20020ad44ea1000000b0047480905cd2mr26772770qvb.105.1660204792736; 
 Thu, 11 Aug 2022 00:59:52 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com.
 [209.85.128.178]) by smtp.gmail.com with ESMTPSA id
 l1-20020a05620a28c100b006b998b5191esm1617221qkp.87.2022.08.11.00.59.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 00:59:51 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-324ec5a9e97so165163227b3.7
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 00:59:51 -0700 (PDT)
X-Received: by 2002:a81:b049:0:b0:324:7408:94b with SMTP id
 x9-20020a81b049000000b003247408094bmr31043465ywk.283.1660204791329; Thu, 11
 Aug 2022 00:59:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1657294931.git.geert@linux-m68k.org>
 <1cae5ebc28513ec1c91c66b00647ce3ca23bfba7.1657294931.git.geert@linux-m68k.org>
 <YvPVxy4kYKdzWgT8@phenom.ffwll.local>
In-Reply-To: <YvPVxy4kYKdzWgT8@phenom.ffwll.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Aug 2022 09:59:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVMuuXgYW-AkyB+G77Wsjkm715u1ifDvaY=5DufXjryRA@mail.gmail.com>
Message-ID: <CAMuHMdVMuuXgYW-AkyB+G77Wsjkm715u1ifDvaY=5DufXjryRA@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] drm/fourcc: Add drm_format_info_bpp() helper
To: Daniel Vetter <daniel@ffwll.ch>
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
 David Airlie <airlied@linux.ie>, Linux/m68k <linux-m68k@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Wed, Aug 10, 2022 at 5:59 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> On Fri, Jul 08, 2022 at 08:20:46PM +0200, Geert Uytterhoeven wrote:
> > Add a helper to retrieve the actual number of bits per pixel for a
> > plane, taking into account the number of characters and pixels per
> > block for tiled formats.
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

> > --- a/drivers/gpu/drm/drm_fourcc.c
> > +++ b/drivers/gpu/drm/drm_fourcc.c
> > @@ -370,6 +370,25 @@ unsigned int drm_format_info_block_height(const struct drm_format_info *info,
> >  }
> >  EXPORT_SYMBOL(drm_format_info_block_height);
> >
> > +/**
> > + * drm_format_info_bpp - number of bits per pixel
> > + * @info: pixel format info
> > + * @plane: plane index
> > + *
> > + * Returns:
> > + * The actual number of bits per pixel, depending on the plane index.
> > + */
> > +unsigned int drm_format_info_bpp(const struct drm_format_info *info, int plane)
> > +{
> > +     if (!info || plane < 0 || plane >= info->num_planes)
> > +             return 0;
> > +
> > +     return info->char_per_block[plane] * 8 /
> > +            (drm_format_info_block_width(info, plane) *
> > +             drm_format_info_block_height(info, plane));
>
> Do we really needs this for blocky formats where this is potentially
> ill-defined? I think if there's no need then this should also return 0
> when block_width/height != 1, it doesn't make much sense to compute bpp
> when it's not really bits per _pixel_.

Yes, we do need this.  For low-color formats, the number of bits
per pixel is less than eight, and block_width is larger than one.
That is actually the point of this patch.

> Minimally this needs to check whether the division actually makes sense or
> whether there's a reminder, and if there's  reminder, then fail. But that
> feels like a bad hack and I think we should avoid it if it's not
> absolutely necessary.

Looking at drivers/gpu/drm/drm_fourcc.c, the only supported format
where there can be a remainder is P030, which has 2 spare bits per
32-bit word, and thus is special anyway.
Still, 4 * 8 / 3 = 10, so you get the correct numbers of bits for
the first plane.  For the second plane, you get 8 * 8 / 3 = 21,
but as .is_yuv = true, you have to divide that result by two again,
so you get 10 again.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
