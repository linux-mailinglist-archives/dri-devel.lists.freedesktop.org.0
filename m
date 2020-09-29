Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D3C27E305
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 09:51:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 960096E550;
	Wed, 30 Sep 2020 07:51:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E087A6E1D6
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 21:37:49 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id e23so3870291vsk.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 14:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+BR/Wc3zD1LnCuhwJBQGnjaCWZshFk+QV30D6Q4Ifqc=;
 b=aK5mVKbXuYF2+FFxhTkVAjsiyxSS6Nt0nJdGvtMx0Jg7lCMmvJ3LZzHZID57WClQHZ
 75rwEYUJafPTnAfYFt+R50UxHsQnsSCdSRT5bmwGEQqATmDQOq1PiF0DSzV00/vjr+la
 7pr2T+r3va8oUTevUOXXME38uhyWGV5hPb8dLESrCvqcUjSjI4GaXbMBqPJRZg3C9omW
 jGK3vhH8/uXdSI06+cnTujOc3zBCZtiG/U+9ITZcj4nhpw9QoJMZso3PcXorGg44dLvX
 a0nROeS12oiRdGs742NJ2qjNfVevH+qxh1/iT+6Sdnym90Sbo25wgDlQGU2iT+pV9hyi
 woTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+BR/Wc3zD1LnCuhwJBQGnjaCWZshFk+QV30D6Q4Ifqc=;
 b=rWMEOq0QP8C6EFtnafjkgf06Z86/VocEPymFqejVJVXnqh+q4R6lTe0TL1/aRhSLdb
 +/ipKZIBq1DMuOqyWjMU2kVeGjn+ixRJ6kn1K+kECS9HOZpWEi/R7swrr+mYdd2XQO8P
 ZOf1+3ayR4A3yZHucWB2eoabIY6v23j+lwmmCiYglaxWOsmtSbsJkxQDIf3c2p6U3kaP
 5xQK/LZohoaN5nxsDg5oeRpHYwiidkJ1OiGVb4naCRybMiYOGmOkMntRiQHBHy6WBimF
 d2wdm0NCcejl/aotGrlBack9bRouPJqGtIqjDDk1dmgmShDEjQIvutZENA6Lw85v0Bv8
 pyyQ==
X-Gm-Message-State: AOAM531rujAfTBENC8TTD1IUlmx0dpVH0cvMMwU9nauR7eKgdGs+1UhV
 qJWEyeGbrliFQtTxbp6oxPPkM0NQOxaukNG9+N//EQ==
X-Google-Smtp-Source: ABdhPJxVa4KjzBa+FilAjVcyADTwApXi5W3T8zJ7kPRXxcncqAds7XI63rQ8COD4S+mQG8L8HLGawL86KErvpcREeKk=
X-Received: by 2002:a67:8a8a:: with SMTP id m132mr4423212vsd.14.1601415468872; 
 Tue, 29 Sep 2020 14:37:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200928200856.1897023-1-pcc@google.com>
 <0dc9f36b-417d-bfad-9eb7-858c3041ff0c@baylibre.com>
 <20200929093201.GL438822@phenom.ffwll.local>
 <CAMn1gO7w1wUo3e9vUmGeF7fp0K9mq2ydSskX2xD3H=Kndzhc+A@mail.gmail.com>
 <20200929164828.GP438822@phenom.ffwll.local>
 <20200929165206.GQ438822@phenom.ffwll.local>
 <CAMn1gO4csAWAnk5rwfzfW5SVTddj7E84kKG2T-qjGiOmObSXnA@mail.gmail.com>
 <CAKMK7uG5KP15tKVZpwmTnU0rM2VwRpESYk_=B0MuOWt5j3Gp1A@mail.gmail.com>
 <CACRpkdYoOVeEkF6RiJSUykJfmJUthXNHMdTUmu+02OXRCgOd0A@mail.gmail.com>
In-Reply-To: <CACRpkdYoOVeEkF6RiJSUykJfmJUthXNHMdTUmu+02OXRCgOd0A@mail.gmail.com>
From: Peter Collingbourne <pcc@google.com>
Date: Tue, 29 Sep 2020 14:37:37 -0700
Message-ID: <CAMn1gO5r7wJtROCUYtEceqTx1D8ixLerRuctO7Ea9BrGnjqSXw@mail.gmail.com>
Subject: Re: [PATCH] Revert "video: fbdev: amba-clcd: Retire elder CLCD driver"
To: Linus Walleij <linus.walleij@linaro.org>
X-Mailman-Approved-At: Wed, 30 Sep 2020 07:50:09 +0000
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Brodsky <Kevin.Brodsky@arm.com>, Russell King <linux@armlinux.org.uk>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 29, 2020 at 1:29 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Sep 29, 2020 at 8:44 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Tue, Sep 29, 2020 at 7:49 PM Peter Collingbourne <pcc@google.com> wrote:
>
> > But aside from all this, why is this blocking the migration from fbdev
> > to drm? With fbdev you don't have buffer allocations, nor dma-buf
> > support, and somehow android can boot.
>
> I do not know how Android does things these days but back in the
> days it would request a virtual framebuffer twice the height of the
> physical framebuffer and then pan that up/down between composing
> frames, thus achieving a type of double-buffering from userspace.
>
> Given the type of bugs Peter is seeing this seems to still be the
> case, Peter can you confirm?

This is what the userspace fbdev driver does (or at least tries to
do). If this operation fails (as it does with the old fbdev CLCD
driver) the driver falls back to using a single buffer. The DRM driver
doesn't do anything like that, it allocates multiple buffers. IIRC
that fails on stock kernels but with an increase to the amount of
video RAM declared in the DTS (e.g. [1]) that operation turns out to
succeed.

Peter

[1] https://www.spinics.net/lists/arm-kernel/msg800628.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
