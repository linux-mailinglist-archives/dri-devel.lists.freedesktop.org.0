Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EBC493E3D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 17:21:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF5610E3A4;
	Wed, 19 Jan 2022 16:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B7ED10E3A2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 16:21:53 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id w26so6184794wmi.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 08:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fLOCYL4kqetR+VuUUrAFHHNiYsj/AuMbKoYUON1f3aE=;
 b=A4AZypwZY7ML0r+Mr74w4qkKLuOawE1kQVgfVAoC0J6FuIuruTpQTYOl6vZdEs4JHk
 HFN2bBoaGQNlKttSamZAY+5o0/zFvkyjhjSvZV8f27vL0RxTrWxzWFAm1NH7NOCQseGE
 F1mpWlMpBB+Pz+IuVLteJfW3fr2b3XeSZ+7O0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fLOCYL4kqetR+VuUUrAFHHNiYsj/AuMbKoYUON1f3aE=;
 b=pR9fwSOQqtq8fjgi6hA7/w1UgJCYPaSl0t+V1dG7rI8uEgZwcU2IL9kLcVhqTJaTN5
 jskK7V0TOyKiLY8Mb8opxUthWlU0ZvgY5Wwz7A/n1BlFj6rVgM3/PKgsvhBhIdzzqw+x
 OlyEmafi7O3UDC+wBlHdjeC2TFssZVnPLbnO4ZbRnNDyEVyYpYfrOSbXy54yDFQ0/3GK
 Ll6uGaZEJjwH0YE8jXIftxadyGZwmDtjztnCIDwHW16JtTTyJKyCUFrkXJ34EYS99vtj
 tz61xxkvRDDaB6eakfnHC6NfSl4h/aDp+yRgX4GtQ1dx5/STFzltHSM+3qqfVsKZwPFb
 756w==
X-Gm-Message-State: AOAM530i27qxiMaeyn45/PZCqGpZhAuJP18c0nEOAx+H+peY5BYFSQSw
 AiKW/roaSa3USwVE2DplAr5YEtu2H28DhQ==
X-Google-Smtp-Source: ABdhPJxcXzMHC+wLtMJiUN8qyEuEAdcGr5wMUZyiUppSZ0jo63DKHq1PvSFG3+2h3fpQX6alvf4v2A==
X-Received: by 2002:a5d:47c3:: with SMTP id o3mr16609703wrc.566.1642609311798; 
 Wed, 19 Jan 2022 08:21:51 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id ay21sm6845186wmb.0.2022.01.19.08.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 08:21:51 -0800 (PST)
Date: Wed, 19 Jan 2022 17:21:49 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Sven Schnelle <svens@stackframe.org>
Subject: Re: fbdev: Garbage collect fbdev scrolling acceleration
Message-ID: <Yeg6nYZX0/0UUd/N@phenom.ffwll.local>
References: <feea8303-2b83-fc36-972c-4fc8ad723bde@gmx.de>
 <87zgnz71ic.fsf@x1.stackframe.org>
 <Yegwl/rwRhjROxcy@phenom.ffwll.local>
 <87y23bitvz.fsf@x1.stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y23bitvz.fsf@x1.stackframe.org>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: linux-fbdev@vger.kernel.org, Hamza Mahfooz <someguy@effective-light.com>,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 19, 2022 at 05:15:44PM +0100, Sven Schnelle wrote:
> Hi Daniel,
> 
> Daniel Vetter <daniel@ffwll.ch> writes:
> 
> > On Thu, Jan 13, 2022 at 10:46:03PM +0100, Sven Schnelle wrote:
> >> Helge Deller <deller@gmx.de> writes:
> >> > Maybe on fast new x86 boxes the performance difference isn't huge,
> >> > but for all old systems, or when emulated in qemu, this makes
> >> > a big difference.
> >> >
> >> > Helge
> >> 
> >> I second that. For most people, the framebuffer isn't important as
> >> they're mostly interested in getting to X11/wayland as fast as possible.
> >> But for systems like servers without X11 it's nice to have a fast
> >> console.
> >
> > Fast console howto:
> > - shadow buffer in cached memory
> > - timer based upload of changed areas to the real framebuffer
> >
> > This one is actually fast, instead of trying to use hw bltcopy and having
> > the most terrible fallback path if that's gone. Yes drm fbdev helpers has
> > this (but not enabled on most drivers because very, very few people care).
> 
> Hmm.... Take my Laptop with a 4k (3180x2160) screen as an example:
> 
> Lets say on average the half of every line is filled with text.
> 
> So 3840/2*2160 pixels that change = 4147200 pixels. Every pixel takes 4
> bytes = 16,588800 bytes per timer interrupt. In another Mail updating on
> vsync was mentioned, so multiply that by 60 and get ~927MB. And even if
> you only update the screen ony 4 times per second, that would be ~64MB
> of data. I'm likely missing something here.

Since you say 4k it's a modern box, so you have on the order of 10GB/s of
write bandwidth.

And around 100MB/s of read bandwidth. Both from the cpu. It all adds up.
It's that uncached read which kills you and means dmesg takes seconds to
display.

Also since this is 4k looking at sales volume we're talking integrated, so
whether it's the gpu or the cpu that's doing the memcpy, it's the same
memory bw budget you're burning down. And at that point doing less copying
(which the shadow buffer thing will do compared to fbcon accelerated
scrolling for every line) is the win.

And since max&usual resolutions pretty much scales down with pcie or
memory bandwidth for roughly the last 2-3 decades, this all works as well
on old stuff.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
