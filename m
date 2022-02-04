Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B984AA187
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 22:02:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9C710E22B;
	Fri,  4 Feb 2022 21:02:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C0DA10E5AF
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Feb 2022 21:02:20 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id r144so8897643iod.9
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Feb 2022 13:02:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=io04bmdGVqb9L2Bxd+sAlyc8gW4AQtHE1d41YIHwSP4=;
 b=Y2ilqNluEFTVeXBCDh9uRD3UpLLovwPaumH462BeMF3YuOE9T91BnUFrJlIVTuvC7N
 ahc3AUx6VOQojqTTs9WPUd2tZI2MX4KkVFv0lz4LXBfIfIZA7iS8pATWuvrl1zH4zCkN
 vjfBRbsFrE0+ZmK2/AWUULn/9wpG6OtmJs+LVNLQ9VLAcJQ3AByjqhUA92himb66Q76M
 0+Dnhid69bP864eShhVKgymLOK/xg9BUiwA9vonyrL0cMImhE7VYhKfkAjty6SESq7a4
 Zxch67O+H8APSCijrC3ZIUN6HFnyChtZ05dEZEguWA9/DtWcqh9/WCEm2kuOoO3mlwqU
 Fzyw==
X-Gm-Message-State: AOAM533OUECBA7vHaHxr2XDkpyHhoLC1QC1o5f7I7C2DG0G7KbZArPvA
 U8RdDwqPbpfGmFMkh6hh3f73Ns7vlZA5Lde3Mts=
X-Google-Smtp-Source: ABdhPJxrFRPQc2dIB/rpJG3OFUuQ3pqcG6UwllwxN96YeNR7QHh9tWGlPWYKr5Z1Fter5IjlcEsyr2Pk7BW+lIpqJYs=
X-Received: by 2002:a05:6602:158b:: with SMTP id
 e11mr418853iow.93.1644008539441; 
 Fri, 04 Feb 2022 13:02:19 -0800 (PST)
MIME-Version: 1.0
References: <20220204134347.1187749-1-javierm@redhat.com>
 <20220204134347.1187749-2-javierm@redhat.com>
 <47100413-db63-1efa-45e9-028dfc430b7e@suse.de>
In-Reply-To: <47100413-db63-1efa-45e9-028dfc430b7e@suse.de>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 4 Feb 2022 16:02:08 -0500
Message-ID: <CAKb7UvgxhLFT4aqYSE+=dpqfuTkvr62tsGmQP5H46mAytaQBRg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm/format-helper: Add drm_fb_{xrgb8888,
 gray8}_to_mono_reversed()
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: linux-fbdev <linux-fbdev@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 4, 2022 at 10:53 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 04.02.22 um 14:43 schrieb Javier Martinez Canillas:
> > Add support to convert XR24 and 8-bit grayscale to reversed monochrome for
> > drivers that control monochromatic panels, that only have 1 bit per pixel.
> >
> > The drm_fb_gray8_to_mono_reversed() helper was based on the function that
> > does the same in the drivers/gpu/drm/tiny/repaper.c driver.
> >
> > Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> > ---
> >
> > (no changes since v1)
> >
> >   drivers/gpu/drm/drm_format_helper.c | 80 +++++++++++++++++++++++++++++
> >   include/drm/drm_format_helper.h     |  7 +++
> >   2 files changed, 87 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> > index 0f28dd2bdd72..cdce4b7c25d9 100644
> > --- a/drivers/gpu/drm/drm_format_helper.c
> > +++ b/drivers/gpu/drm/drm_format_helper.c
> > @@ -584,3 +584,83 @@ int drm_fb_blit_toio(void __iomem *dst, unsigned int dst_pitch, uint32_t dst_for
> >       return -EINVAL;
> >   }
> >   EXPORT_SYMBOL(drm_fb_blit_toio);
> > +
> > +static void drm_fb_gray8_to_mono_reversed_line(u8 *dst, const u8 *src, size_t pixels)
> > +{
> > +     unsigned int xb, i;
> > +
> > +     for (xb = 0; xb < pixels / 8; xb++) {
>
> In practice, all mode widths are multiples of 8 because VGA mandated it.
> So it's ok-ish to assume this here. You should probably at least print a
> warning somewhere if (pixels % 8 != 0)

Not sure if it's relevant, but 1366x768 was a fairly popular laptop
resolution. There's even a dedicated drm_mode_fixup_1366x768 in
drm_edid.c. (Would it have killed them to add 2 more horizontal
pixels? Apparently.)

Cheers,

  -ilia
