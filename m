Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77463209B74
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 10:42:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC456E5D5;
	Thu, 25 Jun 2020 08:42:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56ED16E5D5
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 08:42:07 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id z5so2988401pgb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 01:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GU/dRkgQDpr9iw62AixUC1kVf/kYhjdwq8ObET+oNC8=;
 b=aD5XCCCYMBYfnYftEvzlMtdYLSuRDmX+CPFGMUNSvAjujtddg8Ko2Qh1hZScr8E3hC
 VUHdOwGax68Ruo/XnH8rLV3FHrcWpdIyaXTb/D1GlN4PabQQiPVmxHEwyGWUWyIwhyiO
 EZu9nREZ9b3ij2dBfLrcwxDWPHcFPW31Q+6+0tpuuZes+OkKGgCPmo7HUbp3N0GgMyxr
 r/S0B68REb0nkWf2WnfsHjMymYrGw/GpCryE6uFFO7fGlDRX6PRGVYfYv5M3Xe46bccJ
 iFUbPmqgvwJHOu8oohOOo/XAIsE+IBM+PiRAMiAMbTwRMcFIircqvwnklKTJMUHPeJBf
 iBhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GU/dRkgQDpr9iw62AixUC1kVf/kYhjdwq8ObET+oNC8=;
 b=WwLLMhtZ5XUS9iQHrapYFMIxelTTCMj3L80Md3ssCQvDFz+71pI5rYvPTggLNzc7qL
 MXOsh2FiwsjsOUAhXGkb+/z5mRc5OZgEQK0ZPkHJVESH2wCmycGeJPf4kKgwDCZUrsJ6
 q79/6JogIs9oOtf4LSRxOvV67vGMdu/O/1iyDdShIRZkA9ZpjCH1wIIZl1PKjMHm2eQa
 1oWpFBo7UJuHxKtgvL1wfCqQPtIgkGScD/w59IjTxwVbZWKAS+Z77Vhl+bylvFobPMFf
 8ZeWdnZjHtXlMEUNJkc/bvzkZBcOCGo6UD7e5268AMKpxg5JvqIhRi2UrrU5Mf5f4MR+
 9NKw==
X-Gm-Message-State: AOAM530kATg3tPK3noDzt05zBpUuYS5MVjhw0RQmh5qEzm1Og8R5esww
 4yxHlUB6E1/5HkmeMFYAD5MtqEiTuPR38dJ7/SA=
X-Google-Smtp-Source: ABdhPJwF0Hl8GGRnPxFLftmdeC1miOVc1ZdvpotybNbXAyxg4QkjTMyM9o8rj7A1t8eWmkzECLsfKekYfiyFWAyAwxM=
X-Received: by 2002:a63:924b:: with SMTP id s11mr24565556pgn.74.1593074526947; 
 Thu, 25 Jun 2020 01:42:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200624114127.3016-1-a.hajda@samsung.com>
 <CGME20200624114136eucas1p1c84f81b1d78e2dbad7ac1b762f0a4b4f@eucas1p1.samsung.com>
 <20200624114127.3016-4-a.hajda@samsung.com>
 <2203e0c2-016b-4dbe-452d-63c857f06dd1@arm.com>
 <CAHp75VfpP1cGK3FvTL0hBudRY2N_7GpXYRuUHUCipz7X2sMLmQ@mail.gmail.com>
 <be755825-b413-e5c1-7ea4-06506b20d1f0@arm.com>
 <20200624150434.GH5472@sirena.org.uk>
 <381de683-df5e-4112-5690-13dd9272ae22@arm.com>
 <70b61b75-c68b-ad89-5f6a-f1d681b9f5d0@samsung.com>
In-Reply-To: <70b61b75-c68b-ad89-5f6a-f1d681b9f5d0@samsung.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 25 Jun 2020 11:41:54 +0300
Message-ID: <CAHp75VfQdwHotuGWMUGUvEWNcZNkm+VkdmNuVJDS_T6hbcTqsg@mail.gmail.com>
Subject: Re: [RESEND PATCH v5 3/5] drivers core: allow probe_err accept
 integer and pointer types
To: Andrzej Hajda <a.hajda@samsung.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Robin Murphy <robin.murphy@arm.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 24, 2020 at 10:40 PM Andrzej Hajda <a.hajda@samsung.com> wrote:
> On 24.06.2020 17:16, Robin Murphy wrote:

...

> I have proposed such thing in my previous iteration[1], except it was
> macro because of variadic arguments.

You may have a function with variadic arguments. Macros are beasts and
make in some cases more harm than help.

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
