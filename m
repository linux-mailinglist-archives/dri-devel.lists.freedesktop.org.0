Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2966949CAB0
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 14:23:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA6F910E6EB;
	Wed, 26 Jan 2022 13:23:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 263B410E6EB
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 13:23:05 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id c10so71434560ybb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 05:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jPuiYEcG4FnWkIuFPqkRcRVpvVkaLhzeqgzV7xKH14Q=;
 b=ewLZjb/kz8m2HtjYdnAVs0d6LZQx+WTZt+orOV0l8nTnUgSVQ0eUfPjPKOuGXOprqH
 q+nkNGxOfOEWLG/1cFI1B3cNzRFe08HtHDclQ92/sVafT+mn5HrRKJ214D/lJNSExvNy
 TYDj8iR0Buo4hq3h/SksMeQeDptCb1a8BBpGIQqqYeWdCCQKSGP4sWEZlNzwcqj9Rvyw
 /LahDA5l0TYjKmCykL/i86UddMiaPtnHjEUtQpSI9ONIGFC3a0yBAmWCkgTc9AR7WIfe
 SOjSbumt1c9aEDI92MdG5iUhzjYt0LSSBXSmWbhfsBnJLgJfBKou1pKtJBiAZcyJtBOm
 D7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jPuiYEcG4FnWkIuFPqkRcRVpvVkaLhzeqgzV7xKH14Q=;
 b=7EfFVsExkbkU18C0q/xtgFijGqebxaPQd5xstxLfgwLRW432FHDqLSoX80anihsaeu
 EzS8TM4Hbwnxxb2skMA73GZnCxR8he/AoQJfHj/WYtnZv17iVf2qMFaCe/gJz/SJdqRP
 X1FhgcBJefIMKzdfhDJWWdqszsPduuNjiwIMw658Xxvor4zp/Inz94Xdco1N6ToManby
 k5CZvqJkgfe3Uifk1lRMjF4c4uj5HafwZUKoKLOKmbjK9N648n/U6ZrtzM+UYCwM8nEH
 pPTYT/euK+kFkh35c87sacnZZ6rLlE3GdQxYzVHRxWEbOGisQGkZgdofHd8hoTp/lWC6
 msXg==
X-Gm-Message-State: AOAM53194gaBIcLQK8aaPRQlwWeRAeY1cR2L3/jmgu0XwgHSfSTxiC1w
 7o+OO4n6d/kq7AgdGLjsHznHpSrckNm2C0m6Kteb1g==
X-Google-Smtp-Source: ABdhPJxxCbMVJG9gHaE8ZKo4BsT/wUzC0M9V+d+2hU/nFLU0sy/IPS0viii6yaS4V+oGBlN/XPYsea0s2HkXU8/+GU8=
X-Received: by 2002:a05:6902:b:: with SMTP id
 l11mr33020891ybh.376.1643203384097; 
 Wed, 26 Jan 2022 05:23:04 -0800 (PST)
MIME-Version: 1.0
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <20220125202118.63362-2-andriy.shevchenko@linux.intel.com>
 <YfEG2qVO9K9G+g1d@kroah.com>
 <CAKMK7uGoRC9a4cMCADTipV67oivfWvTw=6RYm2kOthB_bhWnXQ@mail.gmail.com>
 <YfFHa3ayE9wtil9Q@smile.fi.intel.com>
In-Reply-To: <YfFHa3ayE9wtil9Q@smile.fi.intel.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 26 Jan 2022 13:22:52 +0000
Message-ID: <CAPj87rPMOP6W0u5y3FNfpGXHqPbMyLn4JThMY_6+AZLiy0UD5g@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] fbtft: Unorphan the driver
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phillip Potter <phil@philpotter.co.uk>,
 Carlis <zhangxuezhi1@yulong.com>, Lee Jones <lee.jones@linaro.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 26 Jan 2022 at 13:08, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> It's not useful to bury the /dev/fbX out for the devices that
> the use of are black-and-white output on small embedded systems.

It's not useful to decide that such systems should only be supported
by a subsystem which has been deprecated for a long time and which has
little userspace support. It's also not useful to spend time working
on that subsystem, rather than the one everyone has agreed on for the
last 15 years, is supported by userspace, is expressive, and has a
kernel subsystem which isn't a forest of CVEs and broken locking.

Cheers,
Daniel
