Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1504BA700
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 18:21:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0717C10E2F6;
	Thu, 17 Feb 2022 17:21:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
 [209.85.222.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A3110E2F6
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 17:21:40 +0000 (UTC)
Received: by mail-ua1-f41.google.com with SMTP id 4so3029437uaf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 09:21:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mDJqoFZz0dz3Q1I37x7okE1Q7HMXJStYbJXkk2d13x4=;
 b=swfMvTWBNjpX9eSMsAsArnedjIXdDq62hikjfVjJYwKcDhaxGG9745cgXEAz5oqn7n
 oJXaUB6WtHgMZC+PRgWf7/sQ+KhUsABfPTRP7lvuMBB9A8x7ASgNNLvPFFx14S99oxc4
 qMEEiykFW8j9r/smfL1vhfG1kckQqi+PlQB3q8VY3GgxrqHem1XKBMRYJWlet2w25sWa
 cqDSQs6QTSP2KAH3eAkrr3TqTYPXWClNfUMNo0yjYD6fp1LrDpgCgPaFRxGA9+uIgbIf
 xvyAeuiTI2Fvst/LrVW+al/rF+1EqsW/F7qm8L/MeJ4enfPb/TagBUnI9LWu+sx2Qj0/
 Axkg==
X-Gm-Message-State: AOAM530adZgkE43kJmjgia/UVG9QujppdjruKovQUYTcCJK2+35HtFsC
 mAMFf1E9cfd16bJbWJMHcgC2flEhFQSajA==
X-Google-Smtp-Source: ABdhPJy4pKB3EOFJf9OnUEDQciknjocS08J8do8fgzlH/7Au0I4DYrP3gR1dP5AtYh4/Gt4qj/lf+Q==
X-Received: by 2002:ab0:280f:0:b0:33c:ead3:23d7 with SMTP id
 w15-20020ab0280f000000b0033cead323d7mr1562616uap.50.1645118499139; 
 Thu, 17 Feb 2022 09:21:39 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com.
 [209.85.217.51])
 by smtp.gmail.com with ESMTPSA id y187sm1062189vkf.13.2022.02.17.09.21.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 09:21:38 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id q9so1594146vsg.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 09:21:38 -0800 (PST)
X-Received: by 2002:a67:b00e:0:b0:30d:dc98:6024 with SMTP id
 z14-20020a67b00e000000b0030ddc986024mr1803164vse.57.1645118498172; Thu, 17
 Feb 2022 09:21:38 -0800 (PST)
MIME-Version: 1.0
References: <20220215165226.2738568-1-geert@linux-m68k.org>
 <20220215165226.2738568-3-geert@linux-m68k.org>
 <4fff0c08-adab-c1d5-4a7e-1513cb2bf7ca@suse.de>
 <CAMuHMdVK7eWfod73JQAntO=7BAMEcS-ktH4NJmDjna3zUn7giw@mail.gmail.com>
 <z7NQYyKnuywG0bUt7Wr9e53SGgSZgbMVNKpLAOIP0mH3GljFQI3hd_aQFc8qaqwTbBq8yF3QvR9ugLxlivX-ogj508Vc60XHQPAN3IL5Uik=@emersion.fr>
In-Reply-To: <z7NQYyKnuywG0bUt7Wr9e53SGgSZgbMVNKpLAOIP0mH3GljFQI3hd_aQFc8qaqwTbBq8yF3QvR9ugLxlivX-ogj508Vc60XHQPAN3IL5Uik=@emersion.fr>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Feb 2022 18:21:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVeqOj1VfMC6EHHJSX1ttRW3RzaP5tw3aSM4=+SBcz3vg@mail.gmail.com>
Message-ID: <CAMuHMdVeqOj1VfMC6EHHJSX1ttRW3RzaP5tw3aSM4=+SBcz3vg@mail.gmail.com>
Subject: Re: [PATCH 2/8] drm/fb-helper: Add support for DRM_FORMAT_C[124]
To: Simon Ser <contact@emersion.fr>
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
 David Airlie <airlied@linux.ie>, Helge Deller <deller@gmx.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Linux/m68k <linux-m68k@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Simon,

On Thu, Feb 17, 2022 at 5:18 PM Simon Ser <contact@emersion.fr> wrote:
> On Thursday, February 17th, 2022 at 17:12, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > What is C0?
> >
> > A non-existing color-indexed mode with zero colors ;-)
> > Introduced purely to make a check like in the comment below work.
> > What we really want to check here is if the mode is color-indexed
> > or not...
>
> Maybe it would be worth introducing a drm_format_info_is_color_indexed
> function? Would be self-describing when used, and would avoid to miss
> some places to update when adding new color-indexed formats.

Yep, and a .is_color_indexed flag, cfr. the existing .is_yuv flag.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
