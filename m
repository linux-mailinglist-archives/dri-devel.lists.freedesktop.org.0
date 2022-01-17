Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD90490C94
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 17:38:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E82A110F054;
	Mon, 17 Jan 2022 16:38:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3471F10F03F
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 16:38:37 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id g205so24270002oif.5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 08:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TI+T6c0N7K3peD5+tx0Z05C/5JTL5JQSb7+Gvq9P/90=;
 b=HQGZtxqrdYuyGFZCoIvTbvoyDbXOEqvEXtal37kXs0fwaT8d5+UBqIyUt03jdv+LWO
 YTghMijy/JpjTAiDS1lH/dgiOJTG8ZqcJ/YNZ+hCWHG9ArTln0xRRiNFQnToVrr3UKbu
 cFRDl3Edik/s2Uzs5ZHZggDK4AJW0zTqhLH+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TI+T6c0N7K3peD5+tx0Z05C/5JTL5JQSb7+Gvq9P/90=;
 b=3MSoVoe+TMf43y+UHyrEOisBwluAmK9Kb5pppzNy4J57n1ZMgTM3Uah6W6Cc1PxOeH
 Dt+q7DzaHumosobkB0P4ph7Mi7uJfYboqsKGQzRIwB2nh0WONra8O8hTGHIw55SjjcWI
 7SIWNnUMW4YCPVqPwciqvnpXOaguh5yAtWcKeAf6moZisTW+BNVuEmUWmo+CFoFwlr+a
 j8ev03oTm93CNfGSht0DDBhFi2k9ZYZf1Oo93Aj+bocz9T8rHZEDvt0+VssrSUrEWuRX
 XJPkKtCfXLeMYKmp0UiIGabU0UuOhkfcsOhEDxoN5/qf2/Zbon1aUKFS37BHktHXUe3f
 jG0g==
X-Gm-Message-State: AOAM531nj4jQm9FPKN4IUEGDjUohcBdXLtcsZQnRrbWEX+q2brI/7Hw4
 G8kXKZAZfL02yHtCQ02pXo1+IDpXsGPoOtEvDNGOIA==
X-Google-Smtp-Source: ABdhPJwtZw3vr6mz2n3FOqglwVtWUYAgk2YKpHpdVERnXV0uo5vcLRo2/BjpnL+iKV8aeXnIyLfjH1gWrAF+/H/EIvA=
X-Received: by 2002:a05:6808:3a3:: with SMTP id
 n3mr9217462oie.128.1642437516512; 
 Mon, 17 Jan 2022 08:38:36 -0800 (PST)
MIME-Version: 1.0
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
 <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
 <CAKMK7uHVHn9apB6YYbLSwu+adEB2Fqp4FM0z582zf4F-v3_GnQ@mail.gmail.com>
 <cf21018b-f231-7538-169e-2ad450643cbf@gmx.de>
 <97d49bca-f5f7-dba4-b62d-b6fcdd4276ac@suse.de>
 <e19563aa-21a3-e13c-4143-847bd77a38c7@gmx.de>
In-Reply-To: <e19563aa-21a3-e13c-4143-847bd77a38c7@gmx.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 17 Jan 2022 17:38:25 +0100
Message-ID: <CAKMK7uECQU2ALkLHuFfPCjDcH456R6yJ4N_yKbHJ6PiFZ6fiow@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
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
Cc: linux-fbdev@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 17, 2022 at 5:22 PM Helge Deller <deller@gmx.de> wrote:
>
> On 1/17/22 16:58, Thomas Zimmermann wrote:
> > Hi
> >
> > Am 17.01.22 um 16:42 schrieb Helge Deller:
> >> [...]
> >>>> c) reintroduce the state where fbcon is fast on fbdev. This is important for non-DRM machines,
> >>>>     either when run on native hardware or in an emulator.
> >>>> d) not break DRM development
> >>>>
> >>>> Especially regarding c) I complained in [1] and got no feedback. I really would like to
> >>>> understand where the actual problems were and what's necessary to fix them.
> >>>>
> >>>> Helge
> >>>>
> >>>> [1] https://lore.kernel.org/r/feea8303-2b83-fc36-972c-4fc8ad723bde@gmx.de
> >
> > Seems like few people read linux-fbdev these days.
> > I suggest to partly revert the patch to the point were performance
> > gets better again.
> Yes, *please*!
> That would solve my biggest concern.
>
> As far as I can see that's only 2 commits to be reverted:
> b3ec8cdf457e - "fbdev: Garbage collect fbdev scrolling acceleration, part 1 (from TODO list)"
> 39aead8373b3 - "fbcon: Disable accelerated scrolling"for-next-next
>
> I think both were not related to any 0-day bug reports (but again, I might be wrong).

syzbot, not 0day, and there's like a sea of them unfortunately.
There's all kinds of funny races going on when resizing consoles (due
to bad locking design) which then blow up, especially in less tested
code. For the sw rendering we've merged a bunch of patches, but you
pretty much have to assume that it's all fairly broken code until it's
rewritten and fully covered with tests. Shadowfb + memcpy is probably
much faster for restoring scrolling performance than anything else
really.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
