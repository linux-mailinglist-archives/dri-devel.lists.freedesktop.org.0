Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8911D23400F
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 09:36:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188B86E9F0;
	Fri, 31 Jul 2020 07:36:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCF66E920
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 16:18:42 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id t4so22939110iln.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 09:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mFpUgsSUr/jtVIusv5yowX+L5bNHFtEGoq677Selrmc=;
 b=GWuHm23TrFWnj5is5q4cfElU1gXC+8A3ORSZrC8HLTqvdjnzKRa3mL3W7RHQ58gsNe
 cU3XThUbR2EwhMEMQlGI4/+O2T9ZHFUEBUBD5QqNeIzRYt2M2eUoPsl2V/fw2GG9ulIx
 oMiz+inoHqyxe/Lz9iwW78+XwiAXLVrv5TaPsrxHFVU28T/LLciGXiPIcCzyMNSA7C64
 qFmJiejEcoyxFE5unYO7ODTKt9Dg1bbh2nMKzWWtzh5TH6WUDRsCapIR91sHcNZtwoaS
 aQWMi/ZZYgE67Gx6DLjkvvXlw04Rs9KqDHEpmXbzyRU7KUGSwJIk2XenNGMO6Xhz+tm3
 Emjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mFpUgsSUr/jtVIusv5yowX+L5bNHFtEGoq677Selrmc=;
 b=KU266klFKhPTOFET5YpcSvAG8vIfMAJfJiHZRrHZvEqCzPJDpdUKTYxNyAQ5Q3P5Ff
 elS4kogxenFS2LWSR/Xl8Fiz23RdjtwWfDpjinlxdFahX2jtsU87LtnzLwzRSshFAs0z
 1t3mCzKF+S8t9iyfgvR40tpPv3t7h3E5qkhSZfji55+yGQspY0JsTNPDidKjyz6irueR
 hgYj4P7S+ENA/5JRCh8IHqeecJnUAaZGR7/pRUmyWYEH5pcsVHHYtDK/knyfJ/prtIMv
 E22wYC4V4HbGFG8Tfb37beahXnJ4IxPakh8GRx6Dkb/00DuBnyOTsx8Xfy54haTuJDD1
 9fAA==
X-Gm-Message-State: AOAM533yg1OebSI45BO9/h/slPvhh2uJx/RRI8rL5P47aJ+yIQ9SUDPS
 8vSSOKPGIQr3Ql60aXzYZABFW6UI9bZidVVddHc=
X-Google-Smtp-Source: ABdhPJyXPg4c6fWqnKb2CCajM+SSAbdZ0W93Ppa+Cn0Gt64j1ss1Vv9bCOTf9jgsn0br8Q5KQbfaX4stm6hrnk3m4P0=
X-Received: by 2002:a92:bb4d:: with SMTP id w74mr26338540ili.161.1596125921599; 
 Thu, 30 Jul 2020 09:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200713144331eucas1p25911c4ffa9315f632d8f6dd833588981@eucas1p2.samsung.com>
 <20200713144324.23654-1-a.hajda@samsung.com>
 <e55a23bf-59bb-43c6-f7d7-467c282b8648@samsung.com>
 <20200730070832.GA4045592@kroah.com>
In-Reply-To: <20200730070832.GA4045592@kroah.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 30 Jul 2020 09:18:30 -0700
Message-ID: <CAKdAkRTKjHg2y8yTFgxr4yY98M8D2noutDBfB1mh7wwLLQrYbw@mail.gmail.com>
Subject: Re: [PATCH v9 0/4] driver core: add probe error check helper
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailman-Approved-At: Fri, 31 Jul 2020 07:36:08 +0000
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
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 lkml <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 30, 2020 at 12:10 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jul 28, 2020 at 05:05:03PM +0200, Andrzej Hajda wrote:
> > Hi Greg,
> >
> > Apparently the patchset has no more comments.
> >
> > Could you take the patches to your tree? At least 1st and 2nd.
>
> All now queued up, thanks!

I believe it still has not been answered why this can't be pushed into
resource providers (clock, regulators, gpio, interrupts, etc),
especially for devm APIs where we know exactly what device we are
requesting a resource for, so that individual drivers do not need to
change anything. We can mark the device as being probed so that probe
deferral is only handled when we actually execute probe() (and for the
bonus points scream loudly if someone tries to return -EPROBE_DEFER
outside of probe path).

And now with coccinelle script we can expect a deluge of patches
reshuffling drivers...

Thanks.

-- 
Dmitry
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
