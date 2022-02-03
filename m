Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5569E4A8579
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 14:47:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CAE410F910;
	Thu,  3 Feb 2022 13:47:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 486EC10F90E;
 Thu,  3 Feb 2022 13:47:27 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id p7so5252343uao.6;
 Thu, 03 Feb 2022 05:47:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YMvPdu1FDdP95BRsv+5Teh17OUBAE/eVt5OmqC+P+NU=;
 b=137pFBR0opKmQYPkDSk5Xmd8zLAw4JabHERJsfaCJA4pyd69xoVPUnxc7G+iOcTlxq
 mgnmdNFCcUDCA+a64MWtliC2s+ogHQIzCE1Y1+HvQ4oHJRl3iUV6bON36f948DOxg7K3
 Z8v8zHJYK2zFYRuZPWRUhfGMdH9AvjjTnSNNqiEWaH3VzPN7Ej3Dsyoz8ycVS/WX9OGX
 Ly7pDsZ94LO2wAH5gB4gS9AYDFLV5gTBgtxbg+OdIYoafURXzM45Sw9q2aFsDoUS5BIf
 KM+BryQbWXKT35DzdDY9Iiv5FEf2wc8IqFFBE2ZQjnqF2+SdFpL2qoTvZH8sNDkYoRD2
 kFtw==
X-Gm-Message-State: AOAM531ySA525I6GkyG4jxhG8lk/zro8KmbxwaYTmojTDs4y4rlbCuZX
 GhyoEtfNGz53ltmeqSyKWcdCBHZ62YhCWw==
X-Google-Smtp-Source: ABdhPJyvz7afjjkTn51XZXQWHDWl9ezX6zEtywnyeC5eqBJyMq81gfU1zt2a7V7id4TS9YWTvfnppg==
X-Received: by 2002:ab0:6f0d:: with SMTP id r13mr11709969uah.114.1643896046058; 
 Thu, 03 Feb 2022 05:47:26 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com.
 [209.85.222.41])
 by smtp.gmail.com with ESMTPSA id k204sm7106311vkk.0.2022.02.03.05.47.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 05:47:25 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id p7so5252232uao.6;
 Thu, 03 Feb 2022 05:47:25 -0800 (PST)
X-Received: by 2002:a67:5f83:: with SMTP id t125mr13059550vsb.68.1643896045081; 
 Thu, 03 Feb 2022 05:47:25 -0800 (PST)
MIME-Version: 1.0
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
 <20220131210552.482606-10-daniel.vetter@ffwll.ch>
 <723422bf-eb13-095f-66c5-e4011653e21d@suse.de>
In-Reply-To: <723422bf-eb13-095f-66c5-e4011653e21d@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Feb 2022 14:47:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVa2hL4ctCnd1iY68LcB4Udz1Z+oZ9rTobbkM-K-yJ5og@mail.gmail.com>
Message-ID: <CAMuHMdVa2hL4ctCnd1iY68LcB4Udz1Z+oZ9rTobbkM-K-yJ5og@mail.gmail.com>
Subject: Re: [PATCH 09/21] fbcon: Replace FBCON_FLAGS_INIT with a boolean
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Du Cheng <ducheng2@gmail.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Claudio Suarez <cssk@net-c.es>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 2, 2022 at 10:25 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 31.01.22 um 22:05 schrieb Daniel Vetter:
> > It's only one flag and slightly tidier code.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Du Cheng <ducheng2@gmail.com>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Claudio Suarez <cssk@net-c.es>
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> > +++ b/drivers/video/fbdev/core/fbcon.h
> > @@ -18,8 +18,6 @@
> >
> >   #include <asm/io.h>
> >
> > -#define FBCON_FLAGS_INIT         1
> > -
> >      /*
> >       *    This is the interface between the low-level console driver and the
> >       *    low-level frame buffer device
> > @@ -77,7 +75,7 @@ struct fbcon_ops {
> >       int    blank_state;
> >       int    graphics;
> >       int    save_graphics; /* for debug enter/leave */
> > -     int    flags;
> > +     bool   initialized;
>
> This will add 3 bytes of padding. Maybe you can put the bool elsewhere.

Several of the int variables are used as boolean flags, too.
Perhaps convert them all to bitfields?

    unsigned int initialized : 1;
    ...

> >       int    rotate;
> >       int    cur_rotate;
> >       char  *cursor_data;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
