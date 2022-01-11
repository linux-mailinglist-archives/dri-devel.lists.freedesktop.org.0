Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 525B648A5E6
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 03:53:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA5D610EEEE;
	Tue, 11 Jan 2022 02:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1625E10EEEE
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 02:53:14 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id o6so61568826edc.4
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 18:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RFZY2ueA8dih/Ph6oPag2dxgotRBXhtzjSAvUudHnIY=;
 b=P+MPAoIyBtw16udETh31u1xox98U7/zK5e4+H2Jkqdxs9duw1GWf2p3AnpbOpS/Tnh
 sF6JmmyzaL2YD7cj+PCmFJzKzbGSPfSk3L9DnCwSWQAP5TJB7inJcR0alc7Yl/w8XxON
 GZBxtAvK/V7/1ZnzI7GXFn0V8Lmp9TtPrspMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RFZY2ueA8dih/Ph6oPag2dxgotRBXhtzjSAvUudHnIY=;
 b=rLlSx1RX/uQyh4lIdiMi1mFmqc0frYUsAgB+AWChhB6pWWK0zAWM29hOe5yLZ/txbh
 4zAm1nWr2jVLKVGr36fuEN31xOUCFKWtUKhtn5y5oNoV4yfvZHg6tKUXmZBjmj6TOLo9
 Ees9e4LdrTIOsnB8mcf1sCMSLHLhEYH+UavliGFRDnd3aocofKKJDBuBYgrymJQI5tBf
 ipfHv5DMuIOXJwTiP8U2ps1jglEZawWZbdiAWmdDIUIAVHxrNBWFNURMIeNeY8ODq7Uw
 e64ozGtMqK/hySmG0qVeQUB+f6wn9Erbe3b/mM9m2XXumNwK3me7YDpDa9HimZZNk3oL
 e0kQ==
X-Gm-Message-State: AOAM532cEf/TXl2rEJLd+s2PqDxbKT2eFoYIRTNzYPxraCtd3Za9nc/N
 Bx7+/XqkIPbewhOw4mBeCeM/Xg7c3WUTW5BnLb4=
X-Google-Smtp-Source: ABdhPJzlKQ3FKt1AffzTBfaXEsoqnc9jsTFzs23hwwQlDZH9uOKcw9LZxYKGL219Uu2nAKuF+ZemQQ==
X-Received: by 2002:a17:906:d54e:: with SMTP id
 cr14mr1945370ejc.527.1641869592505; 
 Mon, 10 Jan 2022 18:53:12 -0800 (PST)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com.
 [209.85.221.52])
 by smtp.gmail.com with ESMTPSA id u14sm4330968edv.92.2022.01.10.18.53.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 18:53:11 -0800 (PST)
Received: by mail-wr1-f52.google.com with SMTP id l25so19480548wrb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 18:53:11 -0800 (PST)
X-Received: by 2002:adf:e3c9:: with SMTP id k9mr1899247wrm.193.1641869591441; 
 Mon, 10 Jan 2022 18:53:11 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9tz=_hRpQV1V3M-=KmVVEbr1K166qeb-ne64PHk9Sn-ozg@mail.gmail.com>
 <CAHk-=wg9hDde_L3bK9tAfdJ4N=TJJ+SjO3ZDONqH5=bVoy_Mzg@mail.gmail.com>
 <CAKMK7uEag=v-g6ygHPcT-uQJJx+5KOh2ZRzC2QtM-MCjjW67TA@mail.gmail.com>
 <CADnq5_P9n39RQ5+Nm8O=YKXXvXh1CEzwC2fOEzEJuS2zQLUWEw@mail.gmail.com>
 <CAHk-=wgDGcaRxUwRCR6p-rxDVO78Yj4YyM6ZsPRGiT2JOCoQ6A@mail.gmail.com>
 <CADnq5_OYO7kq+9DBnDvbSfpouFvdLB0LPSL6+f1ZPRBsV=qEqA@mail.gmail.com>
 <CAHk-=wiCCRG9Lwzr+Cur=K1V2GJ9ab_ket7EnG4RZhJ8jJM7xQ@mail.gmail.com>
 <CAHk-=wi8b-YKHeNfwyYHMcgR2vJh4xpSZ0qjkv8E8Y9V8Sv2Tg@mail.gmail.com>
 <CAHk-=whnWnB9yjVaqWNKjavSJxDOEbTAPwef=O7qjL8nKZgV6A@mail.gmail.com>
In-Reply-To: <CAHk-=whnWnB9yjVaqWNKjavSJxDOEbTAPwef=O7qjL8nKZgV6A@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 10 Jan 2022 18:52:55 -0800
X-Gmail-Original-Message-ID: <CAHk-=whSAYiO_TkKut6XckdQigFj39ft1Kcs2qJe5niHWPGdwg@mail.gmail.com>
Message-ID: <CAHk-=whSAYiO_TkKut6XckdQigFj39ft1Kcs2qJe5niHWPGdwg@mail.gmail.com>
Subject: Re: [git pull] drm for 5.17-rc1 (pre-merge window pull)
To: Alex Deucher <alexdeucher@gmail.com>, Jun Lei <Jun.Lei@amd.com>, 
 Mustapha Ghaddar <mustapha.ghaddar@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, 
 meenakshikumar somasundaram <meenakshikumar.somasundaram@amd.com>, 
 Daniel Wheeler <daniel.wheeler@amd.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Koenig,
 Christian" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 10, 2022 at 6:44 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I'll double-check to see if a revert fixes it at the top of my tree.

Yup. It reverts cleanly, and the end result builds and works fine, and
doesn't show the horrendous flickering.

I have done that revert, and will continue the merge window work.
Somebody else gets to figure out what the actual bug is, but that
commit was horribly broken on my machine (Sapphire Pulse RX 580 8GB,
fwiw).

                   Linus
