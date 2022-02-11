Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D00D34B25B9
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 13:27:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9541110EB2C;
	Fri, 11 Feb 2022 12:27:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com
 [209.85.221.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF6610EB2C
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 12:27:42 +0000 (UTC)
Received: by mail-vk1-f169.google.com with SMTP id d27so4868734vkn.5
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 04:27:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Huyy9WHn7ezhBl1tBw8tTsSyyS9994mO5WZfsmLZIXc=;
 b=3dhI9UfJjr8y2AhyPP+WDMvIiw2XPZFBXAnvYHb5sW21gAHqVIRplBQfa1qCTU5PrI
 tG5DQXbVvi9vWJY10mE/5AAE/zuyw/AxdKQov7h3AHYA5Rja3Z/H0z6OTbOyaJT2oZtG
 DLVTxxTd63HWjfy34R0QqxXyQR2LKNXabVtZQF8lltAQSEK5vS7ol2QqTA33/2wbVH1J
 dyhPh7o6OiBSb/CPnXGtEujfhyyZf4mwAZYQ0EdESdkpzf8TIchVxQkubRQ1R37Fqmvn
 7JXfl89Fvr5fUbbdgHBpdHexpmgPfr98IvaK6lr2YWeX9T9oaKdcN8SuNOdDubvlT1uu
 K7qg==
X-Gm-Message-State: AOAM532yF8sUIk6gzipLo69uCbCRDsR/nhsg/L4DvsV0gBIumPY5EI0u
 na8o2VkZnRs6QsqAFJX2aCjLXz7Y3O76PQ==
X-Google-Smtp-Source: ABdhPJw+/oj0RTj5uZfPFB41bmTI5bN+vTvYXaubHpDEI/HWwL72mRMGTXtE23f67DTn1MkggyiLqg==
X-Received: by 2002:a1f:2555:: with SMTP id l82mr387611vkl.7.1644582461696;
 Fri, 11 Feb 2022 04:27:41 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com.
 [209.85.221.181])
 by smtp.gmail.com with ESMTPSA id x8sm1531150vkc.7.2022.02.11.04.27.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Feb 2022 04:27:41 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id w207so4348882vkd.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 04:27:41 -0800 (PST)
X-Received: by 2002:a1f:2ac3:: with SMTP id q186mr352535vkq.33.1644582461104; 
 Fri, 11 Feb 2022 04:27:41 -0800 (PST)
MIME-Version: 1.0
References: <20220211091927.2988283-1-javierm@redhat.com>
 <20220211091927.2988283-2-javierm@redhat.com>
 <YgY6OqN+guBlt/ED@smile.fi.intel.com>
 <4fa465d9-4fac-4199-9a04-d8e09d164308@redhat.com>
 <YgZEuXvJ2ZiOyNS+@smile.fi.intel.com>
 <7560cd10-0a7c-3fda-da83-9008833e3901@suse.de>
 <87pmnt7gm3.fsf@intel.com>
In-Reply-To: <87pmnt7gm3.fsf@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 11 Feb 2022 13:27:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWJ_T5HoWcOuSCDP-uquqpiWGPUmKNaC9U5d=JkGRGP0g@mail.gmail.com>
Message-ID: <CAMuHMdWJ_T5HoWcOuSCDP-uquqpiWGPUmKNaC9U5d=JkGRGP0g@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] drm/format-helper: Add
 drm_fb_xrgb8888_to_gray8_line()
To: Jani Nikula <jani.nikula@linux.intel.com>
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
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

On Fri, Feb 11, 2022 at 1:06 PM Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Fri, 11 Feb 2022, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > Am 11.02.22 um 12:12 schrieb Andy Shevchenko:
> >> On Fri, Feb 11, 2022 at 11:40:13AM +0100, Javier Martinez Canillas wrote:
> >>> On 2/11/22 11:28, Andy Shevchenko wrote:
> >>>> On Fri, Feb 11, 2022 at 10:19:22AM +0100, Javier Martinez Canillas wrote:
> >>
> >> ...
> >>
> >>>>> +static void drm_fb_xrgb8888_to_gray8_line(u8 *dst, const u32 *src, unsigned int pixels)
> >>>>> +{
> >>>>> + unsigned int x;
> >>>>> +
> >>>>> + for (x = 0; x < pixels; x++) {
> >>>>> +         u8 r = (*src & 0x00ff0000) >> 16;
> >>>>> +         u8 g = (*src & 0x0000ff00) >> 8;
> >>>>> +         u8 b =  *src & 0x000000ff;
> >>>>> +
> >>>>> +         /* ITU BT.601: Y = 0.299 R + 0.587 G + 0.114 B */
> >>>>> +         *dst++ = (3 * r + 6 * g + b) / 10;
> >>>>> +         src++;
> >>>>> + }
> >>>>
> >>>> Can be done as
> >>>>
> >>>>    while (pixels--) {
> >>>>            ...
> >>>>    }
> >>>>
> >>>> or
> >>>>
> >>>>    do {
> >>>>            ...
> >>>>    } while (--pixels);
> >>>>
> >>>
> >>> I don't see why a while loop would be an improvement here TBH.
> >>
> >> Less letters to parse when reading the code.
> >
> > It's a simple refactoring of code that has worked well so far. Let's
> > leave it as-is for now.
>
> IMO *always* prefer a for loop over while or do-while.

(guess what ;-) I tend to disagree.

> The for (i = 0; i < N; i++) is such a strong paradigm in C. You
> instantly know how many times you're going to loop, at a glance. Not so
> with with the alternatives, which should be used sparingly.

In this case it's fairly obvious, and you get rid of the extra variable x.
Less code, less variables, what can go wrong? ;-)

> And yes, the do-while suggested above is buggy, and you actually need to
> stop and think to see why.

Yes, that one is wrong.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
