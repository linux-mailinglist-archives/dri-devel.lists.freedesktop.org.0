Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4977C27A824
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 09:07:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E92B6E3F7;
	Mon, 28 Sep 2020 07:06:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C566EC6C
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 10:13:09 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id 34so2128504pgo.13
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 03:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=720jfHfclRnuElbF5sBzZ7YrsJeN0GPjCiRxFVwpZoA=;
 b=i7Zjo2El5BzxdVYuuVMLa8MGZcc6OstPdzLxRwuXbMZdkeeu04m+n0XhYNS/MxNSkI
 +geUVpxEp6s3OgH7eUXw9uaBQrQGlBCVnmiYJWiL3enEzsGYVYIsC0NToHgONfeoZtNQ
 08429bRaEKBsTttN92pFdakTfdyCrToHclfhyX4rr8XMkapPN+F4kiDVVqbmyDLyD3DY
 dkEFSJmSw51IsvsTjnMzLX2WELq2j0Z0PtdNZQsCioN4TodyVPV5jr2EAiY+nnVMnv9J
 0xrYTrx5pOJ46fagsf8opPRq6G3TwOCJP3ZFC0vp+96yjyM/fmXmr77viRZrad1yqkEO
 CHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=720jfHfclRnuElbF5sBzZ7YrsJeN0GPjCiRxFVwpZoA=;
 b=naTUjCScXkpUOq0rD2DFoSMsMdtZ9VhUEtNAVKXYcYRMAJC1Jywcc7lnXgAQaA/gA0
 MU1ToscppZNPuv6q0tHsMx99u3NGrZ3oeYYLGvnQhcDwBBp+YLMc4AiUnM0tT1q9Obl7
 vuF8Eelv+OeQWgTdwrN05POwZ2+30OfU2yGWE/HYqZVKSenwZXM8KmQBHM5WINKm3Way
 QmZTADEFjQxbZsZXp2kS2tXQJC4Wxk42mp5+nu7zUIQ5E3apjv0ZLJKLcHkFvpN+yEuK
 AmqUlZt6vt/tobWIk0D4eXV3cuCwTV9DTWUjQsLHEo2nq0P8IOwcWLZiXhOC4AGTdY/X
 VLqg==
X-Gm-Message-State: AOAM532on6hXpZdX67bs0UiELvIHQoJ3rifEekbT/jnTZtd7CrN4rENX
 QuyeUhap52AgKSeBY3/EUQ==
X-Google-Smtp-Source: ABdhPJyH9hSYbuzMVkeLBRiy0bfoGk8cDtw/2un0NnyLt7EEM2tTDwRAuEk/AUNhm/BuhmA41p3M3g==
X-Received: by 2002:aa7:8249:0:b029:142:2501:35c9 with SMTP id
 e9-20020aa782490000b0290142250135c9mr3375837pfn.41.1601028789229; 
 Fri, 25 Sep 2020 03:13:09 -0700 (PDT)
Received: from PWN (n11212042027.netvigator.com. [112.120.42.27])
 by smtp.gmail.com with ESMTPSA id h1sm1665573pji.52.2020.09.25.03.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 03:13:08 -0700 (PDT)
Date: Fri, 25 Sep 2020 06:13:00 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Jiri Slaby <jirislaby@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 0/3] Prevent out-of-bounds access for built-in font data
 buffers
Message-ID: <20200925101300.GA890211@PWN>
References: <0000000000006b9e8d059952095e@google.com>
 <cover.1600953813.git.yepeilin.cs@gmail.com>
 <3f754d60-1d35-899c-4418-147d922e29af@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3f754d60-1d35-899c-4418-147d922e29af@kernel.org>
X-Mailman-Approved-At: Mon, 28 Sep 2020 07:06:24 +0000
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all!

On Fri, Sep 25, 2020 at 08:46:04AM +0200, Jiri Slaby wrote:
> > In order to perform a reliable range check, fbcon_get_font() needs to know
> > `FONTDATAMAX` for each built-in font under lib/fonts/. Unfortunately, we
> > do not keep that information in our font descriptor,
> > `struct console_font`:
> > 
> > (include/uapi/linux/kd.h)
> > struct console_font {
> > 	unsigned int width, height;	/* font size */
> > 	unsigned int charcount;
> > 	unsigned char *data;	/* font data with height fixed to 32 */
> > };
> > 
> > To make things worse, `struct console_font` is part of the UAPI, so we
> > cannot add a new field to keep track of `FONTDATAMAX`.
> 
> Hi,
> 
> but you still can define struct kernel_console_font containing struct
> console_font and the 4 more members you need in the kernel. See below.
> 
> > Fortunately, the framebuffer layer itself gives us a hint of how to
> > resolve this issue without changing UAPI. When allocating a buffer for a
> > user-provided font, fbcon_set_font() reserves four "extra words" at the
> > beginning of the buffer:
> > 
> > (drivers/video/fbdev/core/fbcon.c)
> > 	new_data = kmalloc(FONT_EXTRA_WORDS * sizeof(int) + size, GFP_USER);
> 
> I might be missing something (like coffee in the morning), but why don't
> you just:
> 1) declare struct font_data as
> {
>   unsigned sum, char_count, size, refcnt;
>   const unsigned char data[];
> }
> 
> Or maybe "struct console_font font" instead of "const unsigned char
> data[]", if need be.
> 
> 2) allocate by:
>   kmalloc(struct_size(struct font_data, data, size));
> 
> 3) use container_of wherever needed
> 
> That is you name the data on negative indexes using struct as you
> already have to define one.
> 
> Then you don't need the ugly macros with negative indexes. And you can
> pass this structure down e.g. to fbcon_do_set_font, avoiding potential
> mistakes in accessing data[-1] and similar.

Sorry that I didn't mention it in the cover letter, but yes, I've tried
this - a new `kernel_console_font` would be much cleaner than negative
array indexing.

The reason I ended up giving it up was, frankly speaking, these macros
are being used at about 30 places, and I am not familiar enough with the
framebuffer and newport_con code, so I wasn't confident how to clean
them up and plug in `kernel_console_font` properly...

Another reason was that, functions like fbcon_get_font() handle both user
fonts and built-in fonts, so I wanted a single solution for both of
them. I think we can't really introduce `kernel_console_font` while
keeping these macros, that would make the error handling logics etc.
very messy.

I'm not very sure what to do now. Should I give it another try cleaning
up all the macros?

And thank you for reviewing this!

Peilin Ye

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
