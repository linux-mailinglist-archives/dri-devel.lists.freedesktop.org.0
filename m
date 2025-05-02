Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CF7AA6BBD
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 09:37:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CACE10E01F;
	Fri,  2 May 2025 07:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8260710E01F
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 07:37:14 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id
 a1e0cc1a2514c-86dc3482b3dso2089147241.0
 for <dri-devel@lists.freedesktop.org>; Fri, 02 May 2025 00:37:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746171432; x=1746776232;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8llC9jHROc+tcTrdFCCLdaEjIsrrc+65EGVehejnUu0=;
 b=it3xct7jB9xS/RzDRcK/XKEgINNznQRNUxXD/SAoQKFkLe6yCpwqJD5ozc+Lu15PcN
 F79LHEuCz9oAxuzjUn3/oUukMElWOjEaMLPIIPFKZ45rkWSi5+MvZen17MfYoiFQ3qjy
 P9NmzRxoPaRCVQSS32wH1zQhXvxHLJb6IgmcqEd0cBlxC4MO+d0SI2ajGsocqz9+n4Yu
 1r+poatkKRg+moiGA70by6ldBnpAnTCt8JoxyA/Ky6AjgO4Cnma0YjUCYjJZlFrDlDvO
 0hVqvDgwIaVBcN3Odl792GHS0l7CHe/CntHlaofe30tdr9x3tE3gzc9NuVwcxwAKyAn9
 d89w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWp4j9+PlOXY4JbwHaLgNodFhrikB1VRLdvgrC+mtzf/+5s6wWXmZAZOkDuZ+7/iVE0QTxiH31bQK8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgAsptFVLVZmmOYr/jhc7Pkpr6qIev9SomGF21B5WSirKg9Wuv
 DK+7OzasUOPg9/zbYXLlOmLbMAnkTh4sGYhYXmgz3yJxsqZtTVpPssM8hbjd
X-Gm-Gg: ASbGncvaVXVqnPnxPfvbe1lzq1DhLdEhJyMf9QUWHKw8fkgjIUAWuz7PiQtYS5Is0C8
 x9AoxRpRM7xZOQzVWb4bZcANX4iQkB0wjFKjW+OWiMRwIripHLccU+5M76C3xlR49MbF0xmstTG
 swMvB56n16/qGFRwcNDTIfrMYfxxDTDzgtqsLSg5iT1nSvDj2hwNj6+2w+6FY+1oWjL5YdVbNDM
 dm14MW3zEGXeD+uv93e7Ow8+ejAcK6I/fkFNgBB27E2QB2k9IV4OFuXEk+8mMqtgJhBE9JUfqH8
 tJQxxD3GvueO0b0E/J9kZs9f7WeGJqnODTfxxmn6Trj08ECPfOwBgrEdleRdqy9rvw0CD1Nda00
 M/FI=
X-Google-Smtp-Source: AGHT+IH8wh0kIVDoQmBgivehVSipWhlgEBF1kw4KNQkl8gc5W6Bt5JFIsfIuTqR4KYWmtsBww05yOg==
X-Received: by 2002:a05:6122:1907:b0:52a:654e:bd98 with SMTP id
 71dfb90a1353d-52adea1c00bmr4164734e0c.0.1746171431899; 
 Fri, 02 May 2025 00:37:11 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com.
 [209.85.217.44]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-8780affe7c1sm177734241.11.2025.05.02.00.37.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 May 2025 00:37:10 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id
 ada2fe7eead31-4c4eeb36d12so1902792137.0
 for <dri-devel@lists.freedesktop.org>; Fri, 02 May 2025 00:37:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVUHZSEcV717OhA9Z318aAt0pq6uoC3mDu6vLN08H5rdUBeX3fHDix4CDSs92CEMtVd3J/PkwK++uU=@lists.freedesktop.org
X-Received: by 2002:a05:6102:5123:b0:4c1:8ded:2d66 with SMTP id
 ada2fe7eead31-4dae8bbcf5fmr3872454137.12.1746171430220; Fri, 02 May 2025
 00:37:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250426062305.work.819-kees@kernel.org>
 <b982d4f1-6ed8-490b-8d47-6dc5231913e7@gmx.de>
 <CAMuHMdVY1_gEqULGD0BzdTd05OAkodhk+RXKRAy-T-0+RJt7yQ@mail.gmail.com>
 <e68c6218-6055-45a6-b96e-9c8381a4b409@gmx.de>
In-Reply-To: <e68c6218-6055-45a6-b96e-9c8381a4b409@gmx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 May 2025 09:36:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXWCPcjqqxJ2JxQBeTSnQaAUFL0DqnJ7X8kEYko2L935A@mail.gmail.com>
X-Gm-Features: ATxdqUGW6RuInIXJPMsgitscW_CZTwRS749shCj0tpcRFKiOrjcAgwc2y1eUuZY
Message-ID: <CAMuHMdXWCPcjqqxJ2JxQBeTSnQaAUFL0DqnJ7X8kEYko2L935A@mail.gmail.com>
Subject: Re: [PATCH] video: fbdev: arkfb: Cast ics5342_init() allocation type
To: Helge Deller <deller@gmx.de>
Cc: Kees Cook <kees@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Zheyu Ma <zheyuma97@gmail.com>, 
 Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Helge,

On Tue, 29 Apr 2025 at 22:17, Helge Deller <deller@gmx.de> wrote:
> On 4/28/25 08:36, Geert Uytterhoeven wrote:
> > On Sat, 26 Apr 2025 at 13:33, Helge Deller <deller@gmx.de> wrote:
> >> On 4/26/25 08:23, Kees Cook wrote:
> >>> In preparation for making the kmalloc family of allocators type aware,
> >>> we need to make sure that the returned type from the allocation matches
> >>> the type of the variable being assigned. (Before, the allocator would
> >>> always return "void *", which can be implicitly cast to any pointer type.)
> >>>
> >>> The assigned type is "struct dac_info *" but the returned type will be
> >>> "struct ics5342_info *", which has a larger allocation size. This is
> >>> by design, as struct ics5342_info contains struct dac_info as its first
> >>> member. Cast the allocation type to match the assignment.
> >>>
> >>> Signed-off-by: Kees Cook <kees@kernel.org>
> >
> > Thanks for your patch, which is now commit 8d2f0f5bbac87b9d ("fbdev:
> > arkfb: Cast ics5342_init() allocation type") in fbdev/for-next.
> >
> >> I applied your patch, but wouldn't this untested patch be cleaner and fulfill the
> >> same purpose to match a kzalloc return type?
> >>
> >> diff --git a/drivers/video/fbdev/arkfb.c b/drivers/video/fbdev/arkfb.c
> >> index 7d131e3d159a..a57c8a992e11 100644
> >> --- a/drivers/video/fbdev/arkfb.c
> >> +++ b/drivers/video/fbdev/arkfb.c
> >> @@ -431,7 +431,8 @@ static struct dac_ops ics5342_ops = {
> >>
> >>    static struct dac_info * ics5342_init(dac_read_regs_t drr, dac_write_regs_t dwr, void *data)
> >>    {
> >> -       struct dac_info *info = (struct dac_info *)kzalloc(sizeof(struct ics5342_info), GFP_KERNEL);
> >> +       struct ics5342_info *ics_info = kzalloc(sizeof(struct ics5342_info), GFP_KERNEL);
> >
> > sizeof(*ics_info)?
> >
> >> +       struct dac_info *info = &ics_info->dac;
> >
> > Exactly my thought when I noticed this commit.  Adding casts makes
> > it harder to notice any future discrepancies.
>
> I've changed it accordingly.

Thanks, but the one-line summary no longer matches what the commit
is doing...

Commit f1a78a7d7827357c ("fbdev: arkfb: Cast ics5342_init() allocation
type") in fbdev/for-next.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
