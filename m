Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D132217AE10
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 19:29:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 279AC6EBF5;
	Thu,  5 Mar 2020 18:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27CBF6EBF5
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 18:29:35 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id m2so6287485qka.7
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2020 10:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aO2Nq+upn1lfouLFIykWQjQaxMLKoHNR//pZLEIFyDY=;
 b=jvOU9y2jIyuus28lCdGSa29MRkBfX+AYfa5dfh0jIofGHb60Kox/pvSem+UEw4v45i
 bEK4m8apx06qK2bXZLYnmrQLG7H6sS962p/so7lwIXzHijeZ1GCFtKfq2u8atHdw211U
 q4YjG1gpJhref3SVpbLge9rRpDiEn5bk3H2y1jWijafqK1aPMHAgHsEtrB4wS7aVJH7V
 ITm4r4BXl4VO+6XWjwbvp5PE1U9Gbj4i9JFQsnAzHDzRSrVk0qWn4wgc709ZaaVdqKOQ
 bLddG18m4X9KkYtRuvEbYEhr5Y9Weui9eLIZrWbF2OEkP/iuXz3h5dx6S56m3q0IXKLa
 IA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aO2Nq+upn1lfouLFIykWQjQaxMLKoHNR//pZLEIFyDY=;
 b=BymPjd3jJKEONyszdbguYv/MIXMODfJkAKvTXo//BXN3S6jLRB7KmzcSjLulb/jRG7
 gkOXVpVVaiq6qypvMGRpoCmXLq4YtI9lvTtpRiIXOBomVXFI5EZV/qAFC+lepPHTD+HN
 gS+bNdB/I47zkWMAIfC0cqXL39MJVQxwsgWW8Bzw56ApqliHXuTxDypTslzs1CI7h5Jj
 oxVUtzEesbkAHH7fYb1FkiWrszNrgO12f+Nmfa3yWVYFRCKgujiUDdYdvwQg0l/VhAhq
 Ot5AzcP/XcoNgA9UJNywgP9FBFM+1C8qSv+8Ya4fMDoq7aNWcb6rZFOoyAxHPJqMkpTL
 gPKQ==
X-Gm-Message-State: ANhLgQ0pdEX3EEhqXMyMQ9KQvIo9FlyXcMn8gvkwBZNQPQMR4N5KUaG3
 1VN85K7sUdEA4CSLtsd5+0LnORoICjZQ9lErR/4=
X-Google-Smtp-Source: ADFU+vsq2/P0E2CDnX7KV7FdX1+WD1Ea4vTrjXDFHtSlnmi/MkBaggpukFlmsbWyGUmeM7eR/CtWPLqYjK5bAud44Y4=
X-Received: by 2002:a05:620a:12a2:: with SMTP id
 x2mr9530926qki.276.1583432974202; 
 Thu, 05 Mar 2020 10:29:34 -0800 (PST)
MIME-Version: 1.0
References: <20200213145416.890080-1-enric.balletbo@collabora.com>
 <20200213145416.890080-2-enric.balletbo@collabora.com>
 <CA+E=qVffVzZwRTk9K7=xhWn-AOKExkew0aPcyL_W1nokx-mDdg@mail.gmail.com>
 <CAFqH_53crnC6hLExNgQRjMgtO+TLJjT6uzA4g8WXvy7NkwHcJg@mail.gmail.com>
 <CA+E=qVfGiQseZZVBvmmK6u2Mu=-91ViwLuhNegu96KRZNAHr_w@mail.gmail.com>
 <CAFqH_505eWt9UU7Wj6tCQpQCMZFMfy9e1ETSkiqi7i5Zx6KULQ@mail.gmail.com>
 <CA+E=qVff5_hdPFdaG4Lrg7Uzorea=JbEdPoy+sQd7rUGNTTZ5g@mail.gmail.com>
 <5245a8e4-2320-46bd-04fd-f86ce6b17ce7@collabora.com>
In-Reply-To: <5245a8e4-2320-46bd-04fd-f86ce6b17ce7@collabora.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Thu, 5 Mar 2020 10:29:33 -0800
Message-ID: <CA+E=qVcyRW4LNC5db27d-8x-T_Nk9QAhkBPwu5rwthTc6ewbYA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/bridge: anx7688: Add anx7688 bridge driver
 support
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Icenowy Zheng <icenowy@aosc.io>, 
 =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megous@megous.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Torsten Duwe <duwe@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, David Airlie <airlied@linux.ie>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Collabora Kernel ML <kernel@collabora.com>, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 5, 2020 at 7:28 AM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> Hi Vasily,

CC: Icenowy and Ondrej
>
> Would you mind to check which firmware version is running the anx7688 in
> PinePhone, I think should be easy to check with i2c-tools.

Icenowy, Ondrej, can you guys please check anx7688 firmware version?

> Thanks in advance,
>  Enric
>
> [snip]
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
