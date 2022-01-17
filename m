Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 707A84900D0
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 05:33:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2EB910E429;
	Mon, 17 Jan 2022 04:33:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C988E10E343
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 04:33:45 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id t24so60247194edi.8
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jan 2022 20:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7jrKjyT1kUm6YgYqjVjGNp13+22Ic721iKzftS1kH20=;
 b=JHCBzpxZO0qDrU3BMMl1rhqj69ppdwRjuS+PkPO9ZkTDdHFBPcx/CtuYLr3cXB6HYx
 pm0L+DGXBsrNR41zE5UgmfDxVI8wvQo8NUJ4yGog5vvaO5AeuJ9ZKbwTVKVdokvQda0Q
 9ke31ZMGpJy9T9e4TAO8pxV8x5sJTk+wdB15Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7jrKjyT1kUm6YgYqjVjGNp13+22Ic721iKzftS1kH20=;
 b=sTvCDT/D2zCMhmU05du7fSDDskf3NXlwmkLden4kLKnY6DqaR6HPVdNyMyq2H8T9SP
 xYMpgxXqR9ZMpWjP9eX4EdT0IBSc2I9UOIwwon3wWiZet9/Dftfl1dg/VOwo7/m5RWkX
 RZAl/oS1FZw8ZIb3jUumZ3Sl7L+x0awbR65d+dG80CNv4RmtERelaaFrpMmV14sf4/0P
 +EX6U7UYmSmox7Vj+nxTpYXY0obi2FUcHThmLWD/rt78axwjddd4GYUEYyqlJiactB0C
 JLoMqVJZrGJRs6yuizhyvSInJV//BCikTyHXIvzlXRPJ+UqukP1pA6+FkSbzI8zXey0D
 keOQ==
X-Gm-Message-State: AOAM531JQjT4lzWOXGu/MVxvUOFp3XQfhWqZN+xOHS9/Vm+XPaC3TWYa
 4oM/r/RosXtByjrrozxwTYpPyYFnp4qwgd+K
X-Google-Smtp-Source: ABdhPJw4T/bnFp+0ZvXmKZGRvic+L91AXu8jxyfnDSFHP2Kn4kgOljfHhSYrvRitdHUnhrR58/VgXg==
X-Received: by 2002:a17:906:9397:: with SMTP id
 l23mr8913909ejx.480.1642394024141; 
 Sun, 16 Jan 2022 20:33:44 -0800 (PST)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com.
 [209.85.128.44])
 by smtp.gmail.com with ESMTPSA id t14sm333679edq.24.2022.01.16.20.33.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Jan 2022 20:33:42 -0800 (PST)
Received: by mail-wm1-f44.google.com with SMTP id
 c126-20020a1c9a84000000b00346f9ebee43so19817328wme.4
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jan 2022 20:33:42 -0800 (PST)
X-Received: by 2002:a05:600c:2253:: with SMTP id
 a19mr4527780wmm.8.1642394022326; 
 Sun, 16 Jan 2022 20:33:42 -0800 (PST)
MIME-Version: 1.0
References: <YeRyfaesC2kxkgZC@ls3530>
In-Reply-To: <YeRyfaesC2kxkgZC@ls3530>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 17 Jan 2022 06:33:26 +0200
X-Gmail-Original-Message-ID: <CAHk-=whE5gmEKLt+rtEn2MV=BN8p+QTU56VaPdSD_kmxkx7smQ@mail.gmail.com>
Message-ID: <CAHk-=whE5gmEKLt+rtEn2MV=BN8p+QTU56VaPdSD_kmxkx7smQ@mail.gmail.com>
Subject: Re: [GIT PULL] fbdev updates for v5.17-rc1
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
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 16, 2022 at 9:32 PM Helge Deller <deller@gmx.de> wrote:
>
> This pull request contains only one single initial patch which adds
> myself to the MAINTAINERS file for the FRAMBUFFER LAYER.

I'll pull this (as my test builds for other things complete), but this
is just a note to say that this pull request email was marked as spam
for me, with gmail saying something along the lines of "lots of emails
from gmx.de have been marked as spam"

I see nothing odd in the email itself, and it has proper SPF and DKIM,
but it's possible that you end up sharing a subnet (or an ISP) with
spammers...

Or maybe it was a random one-off. We'll see. I check spam filters
enough that I _usually_ tend to catch these things.

                Linus
