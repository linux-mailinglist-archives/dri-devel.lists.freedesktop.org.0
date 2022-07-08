Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 653DA56C12F
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 22:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1985010E446;
	Fri,  8 Jul 2022 20:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D715E10E309
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 20:09:19 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id z13so28955923qts.12
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jul 2022 13:09:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g4cN28gLKvnxOr4BZ0S05ExiGP3ONr1wnsZDOx3J0h4=;
 b=2ni/EC8FKgndXcVoWX3tiezb94nX4/BjRx7FjcXX0aii5A12TSF4UwJcg0Y6QE4mxe
 7JDUjc+Gb4jro4/YXiNGxgiqQBcoTjFzywqUt+QWRonG6fBoP8FR0cJcda7Irwu0uiXb
 u4VZCngR8YX2bu8eN4p2SjjyTLirlkS6ReTHmXGlfsznfJlGMuwmoSOwovcdpkLjnel3
 zvcWhpOSFTln4k+IkPHYyL2wu1u5rhT6n+THuIBclE7+0eGq4o2ssPEGYL2dylfrZ5Ve
 U1bmhSRWJWtLuBEc+SbdaFY+sIlH2xa5bl2ARbQsBvU+uqBlAR7OYr5313UP5BpxM7Yn
 vPPA==
X-Gm-Message-State: AJIora87p2WYG+dK+F8u6zEQ/IyXTARXs/JWC8DZ+VKfI4HJA1/8PdBo
 slOpfJNzsZ4JAhhoK4omdKWzXk3Umeqnow==
X-Google-Smtp-Source: AGRyM1uLayaXP5uxkSn1U3JKx1YW2Kh+YTsr5URZSyWHyvIjQE/OdycqUCtCPNWE3gC63v6OiTxglA==
X-Received: by 2002:a05:6214:621:b0:432:5e0d:cb64 with SMTP id
 a1-20020a056214062100b004325e0dcb64mr4182808qvx.65.1657310955203; 
 Fri, 08 Jul 2022 13:09:15 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com.
 [209.85.128.177]) by smtp.gmail.com with ESMTPSA id
 l21-20020a37f915000000b006b470422c78sm12141929qkj.121.2022.07.08.13.09.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 13:09:14 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-31cf1adbf92so81436547b3.4
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jul 2022 13:09:13 -0700 (PDT)
X-Received: by 2002:a0d:dd09:0:b0:31c:e3b9:7442 with SMTP id
 g9-20020a0ddd09000000b0031ce3b97442mr5915415ywe.47.1657310953183; Fri, 08 Jul
 2022 13:09:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1657301107.git.geert@linux-m68k.org>
 <64e2e9b14c26df28908789374253fd12072c26c2.1657301107.git.geert@linux-m68k.org>
 <b7d937bc-d7c3-6f7a-047c-fc6e5756a5a0@redhat.com>
 <CAMuHMdWCz4j5bxKBY-W3zWiCLRc9QP+OKco-haGH_9YUhaROgA@mail.gmail.com>
In-Reply-To: <CAMuHMdWCz4j5bxKBY-W3zWiCLRc9QP+OKco-haGH_9YUhaROgA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 Jul 2022 22:09:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWmBsakEndNi0+r3NZ2xLkVt6ZhAoJGS2eWhcc1Bi20HQ@mail.gmail.com>
Message-ID: <CAMuHMdWmBsakEndNi0+r3NZ2xLkVt6ZhAoJGS2eWhcc1Bi20HQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/modes: parse_cmdline: Handle empty mode name part
To: Hans de Goede <hdegoede@redhat.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Linux/m68k <linux-m68k@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hans,

On Fri, Jul 8, 2022 at 10:06 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Fri, Jul 8, 2022 at 9:28 PM Hans de Goede <hdegoede@redhat.com> wrote:
> > On 7/8/22 20:21, Geert Uytterhoeven wrote:
> > > If no mode name part was specified, mode_end is zero, and the "ret ==
> > > mode_end" check does the wrong thing.
> > >
> > > Fix this by checking for a non-zero return value instead.
> >
> > Which is wrong to do, since now if you have e.g. a mode list
> > with:
> >
> > "dblntsc",
> > "dblntsc-ff"
> >
> > in there and the cmdline contains "dblntsc-ff" then you
> > will already stop with a (wrong!) match at "dblntsc".
>
> It indeed behaves that way, and did so before, as str_has_prefix()
> checks for a matching prefix, and thus may never get to the full
> match.  However, can we change that to an exact match, without
> introducing regressions?
> This can be avoided by reverse-sorting the modelist (or iterating
> backwards through a sorted modelist), though.
>
> > > While at it, skip all named mode handling when mode_end is zero, as it
> > > is futile.
> >
> > AFAICT, this is actually what needs to be done to fix this, while keeping
> > the ret == mode_end check.
>
> "ret == mode_end" or "ret" doesn't matter (except for the special
> case of mode_end is zero), as str_has_prefix() returns either zero or
> the length of the prefix.  Hence it never returns a non-zero value
> smaller than the length of the prefix.

Ignore that.  I finally saw what's really happening.
And I do agree with your comment.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
