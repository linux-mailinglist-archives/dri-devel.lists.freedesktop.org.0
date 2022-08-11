Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8D659067B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 20:49:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C626318A430;
	Thu, 11 Aug 2022 18:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC3910FB01
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 18:49:29 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id j17so9426916qtp.12
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 11:49:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=RhMgUDFA93QBx75MeKT6IhTNiHWRpz583vvBHXd9MR4=;
 b=CJi7YDwWT/hmT4MwrdO6f//OQDUrSxkGwM4kusFp+nUKh8XbQY0Fwywaglv2PGazwL
 MVWpgn97eMaQDPnFtL5vWHVC9ggvv807LZg0ke08BcQ6MfwuX4eQMXONid/i3a5/I48s
 QZGPH7sFtgLNKykUbtSsZSfe+7pgMbbD7YqlTfX6+duEdNBI6iemgMxS/PQkpc7MEiI+
 PH1lAg1g4Rwfpc3A7cJaiFnPI0dNQaKm56lcODiN77v0s0CuxAlBH3JdS6KTyuiczGo3
 rtFzhfL0u8wkXSzLE/72J1t4yYq9zzMw/VeMgIOESrVqgNay56P2XOlvBLBarfAlncB3
 TxpQ==
X-Gm-Message-State: ACgBeo1mOkBafj3be0jyK2BxPIcx6ZLe3gKe1QITlc3u3Y3p692qoNU0
 omMu2Z7oI7Cc07yCtprIURUsb9Et2YhHjWWo
X-Google-Smtp-Source: AA6agR7G8Hqqa1SUJL5cIsWr4XsgFfKyqq0e9ky15CTYzmgRPulZ+dYnsQQH3f4ohAhnvRh61e2ZoA==
X-Received: by 2002:ac8:5e54:0:b0:341:b0a6:ef3b with SMTP id
 i20-20020ac85e54000000b00341b0a6ef3bmr465443qtx.132.1660243768285; 
 Thu, 11 Aug 2022 11:49:28 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com.
 [209.85.128.170]) by smtp.gmail.com with ESMTPSA id
 l17-20020a05620a28d100b006b998b5191esm26055qkp.87.2022.08.11.11.49.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 11:49:26 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-328a1cff250so181776087b3.6
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 11:49:26 -0700 (PDT)
X-Received: by 2002:a81:1204:0:b0:322:7000:4ecb with SMTP id
 4-20020a811204000000b0032270004ecbmr582563yws.47.1660243765824; Thu, 11 Aug
 2022 11:49:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1657294931.git.geert@linux-m68k.org>
 <1cae5ebc28513ec1c91c66b00647ce3ca23bfba7.1657294931.git.geert@linux-m68k.org>
 <YvPVxy4kYKdzWgT8@phenom.ffwll.local>
 <CAMuHMdVMuuXgYW-AkyB+G77Wsjkm715u1ifDvaY=5DufXjryRA@mail.gmail.com>
 <YvUqPL5l8/+XbvaQ@phenom.ffwll.local> <YvVKe72jYBjucmkz@ravnborg.org>
In-Reply-To: <YvVKe72jYBjucmkz@ravnborg.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Aug 2022 20:49:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVD37MCXau4w87=x_jk9j-NMJCmu0d9qPuMqmHA_vPQRQ@mail.gmail.com>
Message-ID: <CAMuHMdVD37MCXau4w87=x_jk9j-NMJCmu0d9qPuMqmHA_vPQRQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] drm/fourcc: Add drm_format_info_bpp() helper
To: Sam Ravnborg <sam@ravnborg.org>
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

Hi Sam,

On Thu, Aug 11, 2022 at 8:29 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> On Thu, Aug 11, 2022 at 06:11:40PM +0200, Daniel Vetter wrote:
> > On Thu, Aug 11, 2022 at 09:59:39AM +0200, Geert Uytterhoeven wrote:
> > > On Wed, Aug 10, 2022 at 5:59 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > On Fri, Jul 08, 2022 at 08:20:46PM +0200, Geert Uytterhoeven wrote:
> > > > > Add a helper to retrieve the actual number of bits per pixel for a
> > > > > plane, taking into account the number of characters and pixels per
> > > > > block for tiled formats.
> > > > >
> > > > > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > > Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> > >
> > > > > --- a/drivers/gpu/drm/drm_fourcc.c
> > > > > +++ b/drivers/gpu/drm/drm_fourcc.c
> > > > > @@ -370,6 +370,25 @@ unsigned int drm_format_info_block_height(const struct drm_format_info *info,
> > > > >  }
> > > > >  EXPORT_SYMBOL(drm_format_info_block_height);
> > > > >
> > > > > +/**
> > > > > + * drm_format_info_bpp - number of bits per pixel
> > > > > + * @info: pixel format info
> > > > > + * @plane: plane index
> > > > > + *
> > > > > + * Returns:
> > > > > + * The actual number of bits per pixel, depending on the plane index.
> > > > > + */
> > > > > +unsigned int drm_format_info_bpp(const struct drm_format_info *info, int plane)
> > > > > +{
> > > > > +     if (!info || plane < 0 || plane >= info->num_planes)
> > > > > +             return 0;
> > > > > +
> > > > > +     return info->char_per_block[plane] * 8 /
> > > > > +            (drm_format_info_block_width(info, plane) *
> > > > > +             drm_format_info_block_height(info, plane));
> > > >
> > > > Do we really needs this for blocky formats where this is potentially
> > > > ill-defined? I think if there's no need then this should also return 0
> > > > when block_width/height != 1, it doesn't make much sense to compute bpp
> > > > when it's not really bits per _pixel_.
> > >
> > > Yes, we do need this.  For low-color formats, the number of bits
> > > per pixel is less than eight, and block_width is larger than one.
> > > That is actually the point of this patch.
> >
> > Hm right, I didn't realize that this is how we have to describe the
> > formats with less than 8 bpp.
> >
> > I think we can include them easily with a check for char_per_block == 1
> > and then making sure that the division does not have a reminder (just in
> > case someone does something really funny, it could e.g. be a 332 layout or
> > something like that for 3 pixels).
> >
> > > > Minimally this needs to check whether the division actually makes sense or
> > > > whether there's a reminder, and if there's  reminder, then fail. But that
> > > > feels like a bad hack and I think we should avoid it if it's not
> > > > absolutely necessary.
> > >
> > > Looking at drivers/gpu/drm/drm_fourcc.c, the only supported format
> > > where there can be a remainder is P030, which has 2 spare bits per
> > > 32-bit word, and thus is special anyway.
> > > Still, 4 * 8 / 3 = 10, so you get the correct numbers of bits for
> > > the first plane.  For the second plane, you get 8 * 8 / 3 = 21,
> > > but as .is_yuv = true, you have to divide that result by two again,
> > > so you get 10 again.
> >
> > Yeah I don't think we should describe these with bpp or cpp or anything
> > like that. bpp < 8 makes sense since that's how this has been done since
> > decades, but trying to extend these to funny new formats is a bad idea.
> > This is also why cpp and depth refuse to compute these (or at least
> > should).
>
> Daniel and I discussed this on irc. Let me try to recap here.
> Using the bits per pixel info from drm_format_info is something we shall
> try to avoid as this is often a sign of the wrong abstraction/design (my
> words based on the irc talk).
> So we shall limit the use of drm_format_info_bpp() to what we need now,
> thus blocky formats should not be supported - to try to avoid seeing
> this used more than necessary.
>
> Daniel suggested a rename to drm_format_info_legacy_bpp() to make it
> obvious that this is often/always the wrong solution. I did not jump on
> doing the rename as I do not know stuff good enough to tell people what
> to use when this is not the right solution. The rename is simple, it is
> the follow-up that keep me away.
>
> On top of this there is a few formats in drm_drourcc that has a depth
> field set which should be dropped. .depth is only for the few legacy
> formats where it is used today.
>
> We would also like to convert the fbdev helpers to drm_format_info,
> and doing so will likely teach us a bit more what we need and what we
> can drop.
>
> Geert - can you give drm_format_info_bpp() a spin so it is limited to
> the formats used now (not the blocky ones).

You mean return 0 if char_per_block[] > 1?
I'm not sure it's actually safe to do so (and make this change this late
in the development cycle), as this is used in drm_client_buffer_create(),
drm_client_buffer_addfb(), and drm_mode_getfb().  Some of them do
rely on bpp to be non-zero.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
