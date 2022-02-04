Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B190F4A9537
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 09:37:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CBCB10F40C;
	Fri,  4 Feb 2022 08:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A24D10F419;
 Fri,  4 Feb 2022 08:36:58 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id k9so4768614qvv.9;
 Fri, 04 Feb 2022 00:36:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5LkLCh9tgcGFKu8QRYGFG/lHSI3FKQNh68/jvHDjNJA=;
 b=mP5j2sNeVBN0g8evtFvrfrlknHR9o5lUiKdpCroIX3jDfVQvOlPcoeyUdIO8Y3h0fM
 jiNckC/Uu4FsfHfFoi7BYAj1zE2WIVdeyAe/KMkRL2+Nvwqt5I8alEnvy5MhL97Gc8En
 7ZYmec0tUB145jMtc8RAbFeL9wzprky43wkMruaoPKn161JxgP1FSQml3sYiOfaKoWQ3
 +/z8fccTeWPtNW8LPWBNuVpp9OrVrK8FXLE++Aw3/tCNOnRa0t1OJsTL8ZB54TsAGL6x
 hlKxA8q5yA2Ro4cPRFwzGRf1w+gD7AFWcLu+AM9lEhEAkPnn2zsLqw7SUim81Xp5qXJR
 VAIw==
X-Gm-Message-State: AOAM533YwCBymterb6kUEnAiqynrMf6LhHicsjx4woEdRZb8rvU3HZXG
 GrBOc14GPPP3SPi3tGWThvxoxHI0lB4bcg==
X-Google-Smtp-Source: ABdhPJxUtr5MFYuT89mcD4vDZfZbPqzf/MD1IIBuliCBAO/gMa1QAj7Qz9IbhwcTjAZOA5/tDRmcEA==
X-Received: by 2002:ad4:5962:: with SMTP id eq2mr1128434qvb.99.1643963817168; 
 Fri, 04 Feb 2022 00:36:57 -0800 (PST)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com.
 [209.85.219.46])
 by smtp.gmail.com with ESMTPSA id x11sm681207qkm.108.2022.02.04.00.36.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 00:36:57 -0800 (PST)
Received: by mail-qv1-f46.google.com with SMTP id o9so4748794qvy.13;
 Fri, 04 Feb 2022 00:36:57 -0800 (PST)
X-Received: by 2002:a67:c198:: with SMTP id h24mr484417vsj.5.1643963467627;
 Fri, 04 Feb 2022 00:31:07 -0800 (PST)
MIME-Version: 1.0
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
 <20220131210552.482606-22-daniel.vetter@ffwll.ch>
In-Reply-To: <20220131210552.482606-22-daniel.vetter@ffwll.ch>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Feb 2022 09:30:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUm76tT6u+i=A50ffh=k8hX5kgoMqH=t_wfHqH95nVOPA@mail.gmail.com>
Message-ID: <CAMuHMdUm76tT6u+i=A50ffh=k8hX5kgoMqH=t_wfHqH95nVOPA@mail.gmail.com>
Subject: Re: [PATCH 21/21] fbdev: Make registered_fb[] private to fbmem.c
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
 Zheyu Ma <zheyuma97@gmail.com>, Xiyu Yang <xiyuyang19@fudan.edu.cn>,
 Jens Frederich <jfrederich@gmail.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jon Nettleton <jon.nettleton@gmail.com>, linux-staging@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Zhen Lei <thunder.leizhen@huawei.com>, Matthew Wilcox <willy@infradead.org>,
 Helge Deller <deller@gmx.de>, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

Thanks for your patch!

On Tue, Feb 1, 2022 at 9:50 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> Well except when the olpc dcon fbdev driver is enabled, that thing
> digs around in there in rather unfixable ways.

Can't the actual frame buffer driver (which one?) used on olpc export
a pointer to its fb_info?

> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -48,10 +48,14 @@
>  static DEFINE_MUTEX(registration_lock);
>
>  struct fb_info *registered_fb[FB_MAX] __read_mostly;
> -EXPORT_SYMBOL(registered_fb);
> -
>  int num_registered_fb __read_mostly;
> +#if IS_ENABLED(CONFIG_OLPC_DCON)

CONFIG_FB_OLPC_DCON (everywhere), cfr. the build failure reported
by the robot.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
