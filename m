Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9592F29CF5E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 10:59:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B75E66E4CD;
	Wed, 28 Oct 2020 09:59:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46E76E4CD
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 09:59:53 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id x203so4359611oia.10
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 02:59:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JaUb44Rael9RollufcGjxryeAFDxCaJy8yyWeBf3MYE=;
 b=NOZdMiGaZwzcGOs5ERz8atZ9SkhagO4QIs5GLSbG5RLa1j9xwHb4TjZFasYW4KLMN+
 lKm05Pz6alme9Hy0N6qhclppV0JWzwKW4twOqIkidZdF9zkp9bOJ62zQdfmgCW1ycvW1
 2Yha7h7aE1yTqxbsRvKR4oRSBN5XhX6nfc9bcWI9komPQp/2jf30J3LmIODHOCtqWmn8
 uRqn5naDoBCVF7RiRkNTXO2G/2nBKyLO4LBfXjztAcGJYqapPm6Or6G6V78zPSq/8gxC
 hUYpdHbmwd+M54JI9+NimYwWnDtcLgm9juSj9q5IkYqT/AsCZp7pIsfVc8yIHcAX1Z1U
 VFqg==
X-Gm-Message-State: AOAM532K/+sLBhxd+TzKt4U2h8UZ8xfRmjioiVmBVmIBKZ4vmzZ/Co3L
 cesD59unyxWapVXt+5NGc0TGd6AEjJLX94767BM=
X-Google-Smtp-Source: ABdhPJzePWTrTQrFoo0k2/Wped76/eKJoLwdjYRZVWJjY0cwBi5OOjzzJxM0qO7UsqY6ipkAu536zeF2iEbbw19JnUI=
X-Received: by 2002:aca:f40c:: with SMTP id s12mr4365389oih.153.1603879193186; 
 Wed, 28 Oct 2020 02:59:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1603788511.git.yepeilin.cs@gmail.com>
 <cb5bb49a33ff54fef41e719ee9d301a6a73c5f9c.1603788512.git.yepeilin.cs@gmail.com>
In-Reply-To: <cb5bb49a33ff54fef41e719ee9d301a6a73c5f9c.1603788512.git.yepeilin.cs@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Oct 2020 10:59:42 +0100
Message-ID: <CAMuHMdXJef0O9YTh9+kaOuanGJ9WiCXKQs1CUd6DhyWVjfi7MA@mail.gmail.com>
Subject: Re: [PATCH 1/5] fbdev/atafb: Remove unused extern variables
To: Peilin Ye <yepeilin.cs@gmail.com>
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
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 27, 2020 at 6:12 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> Remove 6 unused extern variables to reduce confusion. It is worth
> mentioning that lib/fonts/font_8x8.c and lib/fonts/font_8x16.c also
> declare `fontdata_8x8` and `fontdata_8x16` respectively, and this file
> has nothing to do with them.
>
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
