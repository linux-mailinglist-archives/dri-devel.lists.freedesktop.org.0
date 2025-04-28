Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E6EA9E85C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 08:36:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3222210E38A;
	Mon, 28 Apr 2025 06:36:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com
 [209.85.221.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A82010E38A
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 06:36:56 +0000 (UTC)
Received: by mail-vk1-f179.google.com with SMTP id
 71dfb90a1353d-525b44b7720so1773333e0c.0
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Apr 2025 23:36:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745822213; x=1746427013;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4HxYx13nksu5xy2CnHaN8inhIAqufNq0pgtm+B7CBB0=;
 b=k/wIRgNdwpbxJjopEOaoWslp9tgrqpVHp/vYdROVNlmIniE2J5OwzA426xvh/19yT5
 SWGBtuxp+KRWibeRwbCQBog5fCmQEloRpJbX4Ca/CTbtMrBE9UFiVfQZBEgn/peCoBC+
 hbzG95rrZdzthBPgkfYdzpRqmawc3vGBIIKJGHfUBdC01aQwX56goHTWNP9p8cX/RRpv
 ZGs2sHKWjHYzWXgtM8UyNqzJMOIA0J/AoMQJCQM6eT1fRIGJp/VjveYgt/oGLVhFWYxk
 capgCgomRJiQdwGEbbHTKQ6X3J+b0NgxljGzw5X9rFnpBNQgNDMekhYLnd+W3DfCkUNq
 PyJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMTELbs8ZFxAQWSAwCcl+2ZGfQLw0ts+8ouWHavY980U4KkbCK9lUa8XImL6zbwhlnMK+zhVH3OGk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPhuAj7NGQUh3fB9RY26ut7UoGgCrdDP6fq+/oBBn2H5m9FcEp
 W53RkCfR4eIpZ9OB3gtlz3BAS+QznoveCYjS4HkZsuMm+xTOrgBA91jLJX3B
X-Gm-Gg: ASbGncu/waiTHZh7/U0AMPOKCNu4KzTzXWQIp9+/wyTId28p8B4+KBlguTzdq5IJ05T
 JbTsaKE/bOEWAteQ//88F5VV0Ea3SFw+AFn3EPf1nmeBuVnH1Nzx7Xsj2sO4owBDw5Pq+0GzcHh
 1K6iY0Qy/Bve3QzIeDiLHmzr3EtmPe/utwB2Ojyv7XzC6C14d5KnTVCM4JWkkbEXAvX2ucT7uzR
 3O1vb+cbKHQmAPHNXabz10rtkm1yR3zbAMoqbekYUrT+7ckYG4+E24UByPSPNQ/8A0VtJWOPjW/
 34awgFPY7HzH7k7WEa+XCAlLlfm3jwezKv5m0NbZVoJRtX0S/WERZ8gSejMShx8vzYHyrLGgwB/
 1Doq9Y5w=
X-Google-Smtp-Source: AGHT+IEU/7fYUmqqYV6cVxhSABDlbJJ62ycL28Ig+Aop3pIpk1u3xjlPjJzmpBhJylPuMxoGzSBK0A==
X-Received: by 2002:a05:6102:26ce:b0:4c3:6ba1:4129 with SMTP id
 ada2fe7eead31-4d641f67797mr4388479137.20.1745822213552; 
 Sun, 27 Apr 2025 23:36:53 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com.
 [209.85.221.179]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-877c67bbac8sm875807241.0.2025.04.27.23.36.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Apr 2025 23:36:52 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id
 71dfb90a1353d-5242f137a1eso1566995e0c.1
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Apr 2025 23:36:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXkol4KQB11rwOoj0TzGOwnZ+1FdNJSSkKW006ZmnuMdzU110XJsSiMidKmtBqzDy2a48fBKBzWHy8=@lists.freedesktop.org
X-Received: by 2002:a05:6102:32d4:b0:4c4:e414:b4eb with SMTP id
 ada2fe7eead31-4d640d802fcmr4616539137.12.1745822212499; Sun, 27 Apr 2025
 23:36:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250426062305.work.819-kees@kernel.org>
 <b982d4f1-6ed8-490b-8d47-6dc5231913e7@gmx.de>
In-Reply-To: <b982d4f1-6ed8-490b-8d47-6dc5231913e7@gmx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Apr 2025 08:36:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVY1_gEqULGD0BzdTd05OAkodhk+RXKRAy-T-0+RJt7yQ@mail.gmail.com>
X-Gm-Features: ATxdqUETGiqKKLP9sekTsuKQhnr5eXZt4XYi72gcVaTSzgLI84_ILYIl_9rFvl8
Message-ID: <CAMuHMdVY1_gEqULGD0BzdTd05OAkodhk+RXKRAy-T-0+RJt7yQ@mail.gmail.com>
Subject: Re: [PATCH] video: fbdev: arkfb: Cast ics5342_init() allocation type
To: Kees Cook <kees@kernel.org>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Zheyu Ma <zheyuma97@gmail.com>, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Helge Deller <deller@gmx.de>
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

Hi Kees,

On Sat, 26 Apr 2025 at 13:33, Helge Deller <deller@gmx.de> wrote:
> On 4/26/25 08:23, Kees Cook wrote:
> > In preparation for making the kmalloc family of allocators type aware,
> > we need to make sure that the returned type from the allocation matches
> > the type of the variable being assigned. (Before, the allocator would
> > always return "void *", which can be implicitly cast to any pointer type.)
> >
> > The assigned type is "struct dac_info *" but the returned type will be
> > "struct ics5342_info *", which has a larger allocation size. This is
> > by design, as struct ics5342_info contains struct dac_info as its first
> > member. Cast the allocation type to match the assignment.
> >
> > Signed-off-by: Kees Cook <kees@kernel.org>

Thanks for your patch, which is now commit 8d2f0f5bbac87b9d ("fbdev:
arkfb: Cast ics5342_init() allocation type") in fbdev/for-next.

> I applied your patch, but wouldn't this untested patch be cleaner and fulfill the
> same purpose to match a kzalloc return type?
>
> diff --git a/drivers/video/fbdev/arkfb.c b/drivers/video/fbdev/arkfb.c
> index 7d131e3d159a..a57c8a992e11 100644
> --- a/drivers/video/fbdev/arkfb.c
> +++ b/drivers/video/fbdev/arkfb.c
> @@ -431,7 +431,8 @@ static struct dac_ops ics5342_ops = {
>
>   static struct dac_info * ics5342_init(dac_read_regs_t drr, dac_write_regs_t dwr, void *data)
>   {
> -       struct dac_info *info = (struct dac_info *)kzalloc(sizeof(struct ics5342_info), GFP_KERNEL);
> +       struct ics5342_info *ics_info = kzalloc(sizeof(struct ics5342_info), GFP_KERNEL);

sizeof(*ics_info)?

> +       struct dac_info *info = &ics_info->dac;

Exactly my thought when I noticed this commit.  Adding casts makes
it harder to notice any future discrepancies.

> > --- a/drivers/video/fbdev/arkfb.c
> > +++ b/drivers/video/fbdev/arkfb.c
> > @@ -431,7 +431,7 @@ static struct dac_ops ics5342_ops = {
> >
> >   static struct dac_info * ics5342_init(dac_read_regs_t drr, dac_write_regs_t dwr, void *data)
> >   {
> > -     struct dac_info *info = kzalloc(sizeof(struct ics5342_info), GFP_KERNEL);
> > +     struct dac_info *info = (struct dac_info *)kzalloc(sizeof(struct ics5342_info), GFP_KERNEL);
> >
> >       if (! info)
> >               return NULL;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
