Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3105A4EF1
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 16:15:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E142910F1D4;
	Mon, 29 Aug 2022 14:15:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4A510F1D8
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 14:15:09 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id g21so6097802qka.5
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 07:15:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=+LNH7GWYgSUzsjvph8IQNcroBifhiDios4fo6CTY2/U=;
 b=Umq1L58/8ZVt6T36VRrhc6x8It27sWetXhEsskg/w4LPGhJIMvkAQmNjYsV98iyMD6
 Mx00vgvUJgORyjpQ6XOKxf2Uj+hPt+gCS/PmjT4T0u3op6FsT6lMwA5lRhMUCOhB3TkG
 sBq9SPVrmQKw5ZDlWeoUGEe0HEu3VoiHPz+vpEQU7sd0lPjvGPQIWz2bYwUHtUm0eAlz
 Z1fyy9YxPyaYtG+Ei68Zz60hvJVdGWdgB/RnvqLtKdkGR4XCHal6wsSI8bDQbq6IcHGB
 Ir5wMeN/w0Na1zgDw+op7nV2Vhzg1xdW8EF78mfVcgARbdZl0FRUWdGQZrW5HojGayK4
 Xj+w==
X-Gm-Message-State: ACgBeo17RS46DQ2ilAxPbvE+g35BW35CziHtuIKqLLWHMidNhk4dN6d4
 BfPKSoX6VaqeCRAl0nwSnCaq00PBtEMf8g==
X-Google-Smtp-Source: AA6agR7pP4Z5o2tv9gpFZ0QBglqnrUhwdwaw+sJddgxJNfjGxOOjoPFBm+pd2pUTDtAKUUgsK9DALg==
X-Received: by 2002:a05:620a:370f:b0:6bc:1ea1:b466 with SMTP id
 de15-20020a05620a370f00b006bc1ea1b466mr8544030qkb.564.1661782507481; 
 Mon, 29 Aug 2022 07:15:07 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com.
 [209.85.128.175]) by smtp.gmail.com with ESMTPSA id
 z20-20020ac87f94000000b003051ea4e7f6sm5471825qtj.48.2022.08.29.07.15.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Aug 2022 07:15:06 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-334dc616f86so198699597b3.8
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 07:15:06 -0700 (PDT)
X-Received: by 2002:a25:415:0:b0:696:814:7c77 with SMTP id
 21-20020a250415000000b0069608147c77mr8612505ybe.36.1661782506395; 
 Mon, 29 Aug 2022 07:15:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAMuHMdUusnhYodWGCxJBu-1Hd2KW-xdT8jxE_iVdQjDo8b3Y5Q@mail.gmail.com>
 <20220817131454.qcuywcuc4ts4hswm@houat>
 <CAMuHMdVPEgnnsY-4uuf=FDJ0YxWpch-0kZWFT_TZfcDvXLtwWQ@mail.gmail.com>
 <20220818123934.eim2bfrgbxsmviqx@houat>
 <CAMuHMdWXbHkrBZgsmUnU=q52+q7UZZNO3tgQW7Men+msQ1JDwQ@mail.gmail.com>
 <20220818134200.cr22bftmjn226ehn@houat>
 <CAMuHMdX6dyQaB34oeXwiCa2rDkxks0qNh=ekqh7Wd2kSNED9TA@mail.gmail.com>
 <20220818154641.ouvrar5s74qu74zn@houat>
 <CAMuHMdUjE0mwu8z5AksW4h1OwzDCQ5h1ZoCWDi+rC4p2Pu5O4g@mail.gmail.com>
 <6d1dfaad-7310-a596-34dd-4a6d9aa95f65@gmail.com>
 <20220829132953.sfv5yex2dhv76vrq@houat>
In-Reply-To: <20220829132953.sfv5yex2dhv76vrq@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Aug 2022 16:14:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXxoEYV7v-R+o4eMJEiV_xGUgpN6sUbZ95r_qewV5QpRA@mail.gmail.com>
Message-ID: <CAMuHMdXxoEYV7v-R+o4eMJEiV_xGUgpN6sUbZ95r_qewV5QpRA@mail.gmail.com>
Subject: Re: [PATCH v1 04/35] drm/modes: Introduce 480i and 576i modes
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Emma Anholt <emma@anholt.net>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Phil Elwell <phil@raspberrypi.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@lists.linux.dev, Mateusz Kwiatkowski <kfyatek@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Mon, Aug 29, 2022 at 3:30 PM Maxime Ripard <maxime@cerno.tech> wrote:
> On Wed, Aug 24, 2022 at 06:42:18PM +0200, Mateusz Kwiatkowski wrote:
> > - Speaking of closed captioning... a lot of different stuff were put in the
> >   blanking interval over the years. Like teletext in Europe. There are projects
> >   like VBIT2 <https://github.com/peterkvt80/vbit2> which intentionally
> >   reconfigure the Raspberry Pi composite output to include the blanking interval
> >   in the framebuffer so that teletext can be output by drawing on the edge of
> >   the "screen" (from the computer point of view).
>
> I'm not sure how we would support this in KMS to be honest. Asking for a
> wider mode and the userspace putting whatever it wants in the margins
> seems like a good choice.

s/wider/higher/

Teletext is transmitted in the "visible" parts of (horizontal) lines, but during
the vertical blank.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
