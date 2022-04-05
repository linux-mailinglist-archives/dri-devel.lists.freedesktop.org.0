Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 784914F23AC
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 08:52:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D5010ED7F;
	Tue,  5 Apr 2022 06:52:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0791110ED7F
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 06:52:47 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id b18so9677425qtk.13
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 23:52:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xS9sh+p2XRsClxVSPRroc3YnRbOn46SzHPHvIsqLwCM=;
 b=5o4BxiFp3oXgL8zyDDFGMlxB+xJc7Au/O/f44KleqXuboQytGI2WqxKiixP2xLMbvs
 0w7E0mEWJZ1YBiQL3SOMEW5AjAUq7IBiuxR6EzG/kveu/Umfd7YhHBG22W6Mko1OAPWv
 cS9sO8F6bRlhbW13d6MiGm5aHYRSnXXTmYZeswC+Eqt7Ri+s19z6okLAfvtYPOaUyr7N
 EhI1f3CncLcM4Oms8yWkvuFfAWaMAVyqjxksVM75lc3uiNkFqRHCSAFU7JqBiGfn1V7K
 BnTn1ruTGMK6XC0lpOSmbQ6lcaSZ2S3g533Krt4UHqKjP1d/fpCDhCzRo9LwPtqEB9GN
 RQYw==
X-Gm-Message-State: AOAM530qUxYw0wmmcLJX4sdvT0IvkAiogG6QzxpDjS9624C3q7j0/pYf
 qFy2b2X7eb320aIOQRCqnbatCX6HcNAabA==
X-Google-Smtp-Source: ABdhPJzrN+yrPk7wsqoiD10ntC+8tP/Mrowi24Foj1C5slxQACfe1GCXK6QZ6F5CYW8RiqQaYFDL/A==
X-Received: by 2002:ac8:7d16:0:b0:2e1:e825:ec84 with SMTP id
 g22-20020ac87d16000000b002e1e825ec84mr1610166qtb.433.1649141565220; 
 Mon, 04 Apr 2022 23:52:45 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174]) by smtp.gmail.com with ESMTPSA id
 a129-20020a376687000000b0067d186d953bsm7558680qkc.121.2022.04.04.23.52.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 23:52:44 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id j2so21814922ybu.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 23:52:44 -0700 (PDT)
X-Received: by 2002:a25:9e89:0:b0:63c:ad37:a5de with SMTP id
 p9-20020a259e89000000b0063cad37a5demr1478959ybq.342.1649141564401; Mon, 04
 Apr 2022 23:52:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAMhUBjmFhqTLBscHHVZ1VTSqrJBT1VEevA+KkjY+y9_ZtdRkMg@mail.gmail.com>
 <631f03bd-0fdf-9cc8-bf37-89235fb84162@gmx.de>
 <CAMuHMdUiEo8q9x0C0x5zOM=ax1=S06=s0JjcJvZYD4aMGLmEaQ@mail.gmail.com>
 <a564f6af-31fa-79a2-72c3-578f2c095b23@gmx.de>
In-Reply-To: <a564f6af-31fa-79a2-72c3-578f2c095b23@gmx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Apr 2022 08:52:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU=r+TEJmgdnuM+0Mxa0jQ4HjtKT1jzkw_2R+1v9K_9RQ@mail.gmail.com>
Message-ID: <CAMuHMdU=r+TEJmgdnuM+0Mxa0jQ4HjtKT1jzkw_2R+1v9K_9RQ@mail.gmail.com>
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

On Tue, Apr 5, 2022 at 8:34 AM Helge Deller <deller@gmx.de> wrote:
> On 4/4/22 13:46, Geert Uytterhoeven wrote:
> > On Sun, Apr 3, 2022 at 5:41 PM Helge Deller <deller@gmx.de> wrote:
> >> On 4/3/22 13:26, Zheyu Ma wrote:
> >>> I found a bug in the function i740fb_set_par().
> >>
> >> Nice catch!
> >>
> >>> When the user calls the ioctl system call without setting the value to
> >>> 'var->pixclock', the driver will throw a divide error.
> >>>
> >>> This bug occurs because the driver uses the value of 'var->pixclock'
> >>> without checking it, as the following code snippet show:
> >>>
> >>> if ((1000000 / var->pixclock) > DACSPEED8) {
> >>>      dev_err(info->device, "requested pixclock %i MHz out of range
> >>> (max. %i MHz at 8bpp)\n",
> >>>          1000000 / var->pixclock, DACSPEED8);
> >>>     return -EINVAL;x
> >>> }
> >>>
> >>> We can fix this by checking the value of 'var->pixclock' in the
> >>> function i740fb_check_var() similar to commit
> >>> b36b242d4b8ea178f7fd038965e3cac7f30c3f09, or we should set the lowest
> >>> supported value when this field is zero.
> >>> I have no idea about which solution is better.
> >>
> >> Me neither.
> >> I think a solution like commit b36b242d4b8ea178f7fd038965e3cac7f30c3f09
> >> is sufficient.
> >>
> >> Note that i740fb_set_par() is called in i740fb_resume() as well.
> >> Since this doesn't comes form userspace I think adding a check for
> >> the return value there isn't necessary.
> >>
> >> Would you mind sending a patch like b36b242d4b8ea178f7fd038965e3cac7f30c3f09 ?
> >
> > When passed an invalid value, .check_var() is supposed to
> > round up the invalid to a valid value, if possible.
>
> I don't disagree.
> The main problem probably is: what is the next valid value?
> This needs to be analyzed on a per-driver base and ideally tested.
> Right now a division-by-zero is tiggered which is probably more worse.
>
> That said, currently I'd prefer to apply the zero-checks patches over
> any untested patches. It's easy to revert such checks if a better solution
> becomes available.
>
> Thoughts?

Fair enough. And you're the maintainer ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
