Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC5E157353
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 12:17:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691EC6EC01;
	Mon, 10 Feb 2020 11:17:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48CF56EC01
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 11:17:18 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id b18so8855259oie.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 03:17:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uaCtQNIy6IQx3uNLs54ga0WpoB8S0EJs2n7XCZo4GWA=;
 b=jTLYKKk14rGIBttLAVIOJFx/une/3trxoApMaflm5O7DhYqIFbmQSVGwEmuJ6YnzuQ
 OXkcPeH1kqvvyKYPJSd4f7xTux6zmdJ5ta1rps3uUcwoOvSkFe4U45Y4rAUmXRJQH5Cn
 0WjYPUzKCZR/fUKgMf4S5fVsFbx81d+zdhgX/WRzYvhTH7r6+TZcOLZExUMyU/bR7GWR
 5MgwNM6Bgsj4P+AtaZa3f7eT68GoZD9uYRF9O7iej++HKRYQoBiFdBrI0brdCYsTJzQg
 uZot3nTgsiGjUXoJcebQGkR+MSSmjj528AULukh1q0U//qb21SVuTHlv/dke2KrUEFYU
 8W1w==
X-Gm-Message-State: APjAAAXTLawqf20R8Kk5oR2W2tvONTLzpkk+f6TaHWuIZNOJ2/rk/WG5
 sApmyxZdWoBvkONmNpqEM5xmCAOUpN0Lt9o/1aQ=
X-Google-Smtp-Source: APXvYqwl6Yr5ge3Dx87NUUNYMHGwhpVcvytxUTMwUiHhtL+jKJ7CpOM8rysExxtcDzjVRZbRXYa4xnXuWppyfV+jWh0=
X-Received: by 2002:a54:4707:: with SMTP id k7mr461629oik.153.1581333437650;
 Mon, 10 Feb 2020 03:17:17 -0800 (PST)
MIME-Version: 1.0
References: <20200112171521.22443-1-geert@linux-m68k.org>
In-Reply-To: <20200112171521.22443-1-geert@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Feb 2020 12:16:56 +0100
Message-ID: <CAMuHMdX9M25O9MOQ5tb-cLs36E8qCf1M4YCbYN9BU+h1N3n0MQ@mail.gmail.com>
Subject: Re: [PATCH] fbdev: c2p: Use BUILD_BUG() instead of custom solution
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
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
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux/m68k <linux-m68k@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 12, 2020 at 6:15 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> Replace the call to the custom non-existing function by a standard
> BUILD_BUG() invocation.
>
> Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Thanks, applied and queued for v5.7.

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
