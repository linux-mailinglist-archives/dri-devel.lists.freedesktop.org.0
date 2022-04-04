Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E6B4F13FF
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 13:46:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C247B10F070;
	Mon,  4 Apr 2022 11:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFFD010F06E
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 11:46:29 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id t19so7413824qtc.4
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 04:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0vrtxx97wpbMiIv6dqlYr09ni3VUiuon0GQZYjngD7U=;
 b=PzNjHZDNTJ0DNBO0nKoXdOYSWHzkg8paRdqTPpSYi67LX6R0q2OLGbXIoBO2SYA0zP
 Rq7sUbYDN+jup5DkmVToilcAks+RsykHtSdPG7VFq4kFttoWthZs0qWODbXEsooQyFfN
 +M4tmCKmIMap/q1n2mqPi+ILEcuotF0A/tUlctiF4CNev1c+jiQqdo2O7Hilge8uI6kZ
 qNbSjz17NMqGV0EMTql5uuVRwZhm8howT3ziIthimhH+f6hRAn8xEmr5sGiFTqLsTHHK
 EbgBX8QF+sss6S10s9SumD8zHUKxZMf7Q/jE3ryZ0C2reYbNKMjmHE39K/faGnrcIRbf
 iDgQ==
X-Gm-Message-State: AOAM531yWIXiYjpDitW/EGI3k7k7jQ37mH/PO28TY/nLrVyB/jzncEVt
 HQqeSDRo6+Y6IQeQ0E9VNJlQpct6VYAA2w==
X-Google-Smtp-Source: ABdhPJxU19Gtpa6xDwXSMj7EphylsP+tXzD2H4PqpLxw8vrpu8sLhF0si8v0ncT2KD7Ze4IYlYra4g==
X-Received: by 2002:a05:622a:64b:b0:2e1:cbc3:c9ff with SMTP id
 a11-20020a05622a064b00b002e1cbc3c9ffmr16987808qtb.226.1649072788205; 
 Mon, 04 Apr 2022 04:46:28 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com.
 [209.85.128.172]) by smtp.gmail.com with ESMTPSA id
 d21-20020a05622a101500b002e07151139fsm8740165qte.17.2022.04.04.04.46.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 04:46:28 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-2e68c95e0f9so96480697b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 04:46:27 -0700 (PDT)
X-Received: by 2002:a81:5c2:0:b0:2e5:e4eb:c3e7 with SMTP id
 185-20020a8105c2000000b002e5e4ebc3e7mr22191370ywf.62.1649072787360; Mon, 04
 Apr 2022 04:46:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAMhUBjmFhqTLBscHHVZ1VTSqrJBT1VEevA+KkjY+y9_ZtdRkMg@mail.gmail.com>
 <631f03bd-0fdf-9cc8-bf37-89235fb84162@gmx.de>
In-Reply-To: <631f03bd-0fdf-9cc8-bf37-89235fb84162@gmx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Apr 2022 13:46:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUiEo8q9x0C0x5zOM=ax1=S06=s0JjcJvZYD4aMGLmEaQ@mail.gmail.com>
Message-ID: <CAMuHMdUiEo8q9x0C0x5zOM=ax1=S06=s0JjcJvZYD4aMGLmEaQ@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IFtCVUddIGZiZGV2OiBpNzQwZmI6IERpdmlkZSBlcnJvciB3aGVuIOKAmHZhci0+cA==?=
 =?UTF-8?B?aXhjbG9ja+KAmSBpcyB6ZXJv?=
To: Helge Deller <deller@gmx.de>
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
 Zheyu Ma <zheyuma97@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Helge,

On Sun, Apr 3, 2022 at 5:41 PM Helge Deller <deller@gmx.de> wrote:
> On 4/3/22 13:26, Zheyu Ma wrote:
> > I found a bug in the function i740fb_set_par().
>
> Nice catch!
>
> > When the user calls the ioctl system call without setting the value to
> > 'var->pixclock', the driver will throw a divide error.
> >
> > This bug occurs because the driver uses the value of 'var->pixclock'
> > without checking it, as the following code snippet show:
> >
> > if ((1000000 / var->pixclock) > DACSPEED8) {
> >      dev_err(info->device, "requested pixclock %i MHz out of range
> > (max. %i MHz at 8bpp)\n",
> >          1000000 / var->pixclock, DACSPEED8);
> >     return -EINVAL;x
> > }
> >
> > We can fix this by checking the value of 'var->pixclock' in the
> > function i740fb_check_var() similar to commit
> > b36b242d4b8ea178f7fd038965e3cac7f30c3f09, or we should set the lowest
> > supported value when this field is zero.
> > I have no idea about which solution is better.
>
> Me neither.
> I think a solution like commit b36b242d4b8ea178f7fd038965e3cac7f30c3f09
> is sufficient.
>
> Note that i740fb_set_par() is called in i740fb_resume() as well.
> Since this doesn't comes form userspace I think adding a check for
> the return value there isn't necessary.
>
> Would you mind sending a patch like b36b242d4b8ea178f7fd038965e3cac7f30c3f09 ?

When passed an invalid value, .check_var() is supposed to
round up the invalid to a valid value, if possible.

Commit b36b242d4b8ea178 ("video: fbdev: asiliantfb: Error out if
'pixclock' equals zero") does not do that.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
