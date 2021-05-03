Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC6C371DC1
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 19:08:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FCF96E9DB;
	Mon,  3 May 2021 17:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BBC76E9DB
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 17:08:29 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 gc22-20020a17090b3116b02901558435aec1so3736981pjb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 03 May 2021 10:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WrRWmFjrLRqx+OLwKIC7R/uG9pdSkec2h+vi6VT8VLY=;
 b=Jp74gdkkTmgDo9v4VOfTpJWRqlLJFaozRUNlQT7QkD5ejT0wnbC50osv1BWfZqR/qq
 Ba4U5mUYkXkha4Z4pxqJ/CPZR7j7vcOZ4mOs7ks7D/OniKWFLQ0QeSVylaOnlHu3tFah
 PvZbNIVFG7qeMhr6zz6zSR2DL5LCjy3RnqNS+H9cmjYfR/27ZMkDmLv0fDyXAeFZvMD1
 WnVIGY76KEtZrqr4kaP+vXWQaQylfPx/bWxiYC7prQAnTPFDT8skawp6RHzJyuZAekxg
 92y+HljpwYO4uNzy9fGbUm5IYxIbSNIAzM5okopoBm5Cy8j3R4MjfanI+ReWGcJmwurM
 pAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WrRWmFjrLRqx+OLwKIC7R/uG9pdSkec2h+vi6VT8VLY=;
 b=Qj8QgDtzlmBZ1fPkysvYNa6hD+lgr4aXWVvqsb7NG1XuPrxew+rDsvu7Z+obWwYnyd
 AwGYug8lDTAK/2nppeYsoipd6cVa2zX9XVMfqfgu7AD5KDczW6lvJFuG2nEy4Y4on946
 XAqF70rfDbkvDP30AGwZMjrYoigqyImLrq3Ye7a8m1oJovQRy/4RWTwYG0OHdi0DNLHO
 ank1RiYGPKz9Lapf9uSYRapFURv86A/pRKHZCsKJ0K0kmFzUih+xEZHdYt8bhTTjt/e/
 7oVeceKIp2lQequ8AZ+cpFYc+307ugb7nJck4VrofA6cjzD6p2KPt8itTt1Elx2lmAIo
 P/jA==
X-Gm-Message-State: AOAM533aobAsK/u8/w6Sf1ZBQiEUSVn4EPpT7QJL2+u95lklSlGlm6Vt
 xOYFBOU3LVd4MQnKP4dLlVAS1uM848o651uKjIw=
X-Google-Smtp-Source: ABdhPJxMSaqHagIBw/RaN/Jrt5UgDo95VR2FBt5AZ/JmWispzseF85caEUVyTm8/e3OxIIvge/eTA9e/CFlO1Lga2Yk=
X-Received: by 2002:a17:902:264:b029:eb:3d3a:a09c with SMTP id
 91-20020a1709020264b02900eb3d3aa09cmr21437040plc.0.1620061708582; Mon, 03 May
 2021 10:08:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210428130415.55406-1-andriy.shevchenko@linux.intel.com>
 <20210428130415.55406-2-andriy.shevchenko@linux.intel.com>
 <YJAm6D2LUtVz1YNa@kroah.com>
In-Reply-To: <YJAm6D2LUtVz1YNa@kroah.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 3 May 2021 20:08:12 +0300
Message-ID: <CAHp75VeBbjpczF0ggQ3STySnj15dthPNF_-=b9VXNeMyb_LY8g@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] staging: fbtft: Rectify GPIO handling
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: =?UTF-8?Q?Jan_Sebastian_G=C3=B6tte?= <linux@jaseg.net>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 Phil Reid <preid@electromag.com.au>, Nishad Kamdar <nishadkamdar@gmail.com>,
 linux-staging@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 3, 2021 at 7:46 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Wed, Apr 28, 2021 at 04:04:12PM +0300, Andy Shevchenko wrote:

> > Fixes: 92e3e884887c ("Staging: staging: fbtft: Fix GPIO handling")
> > Fixes: b918d1c27066 ("Staging: staging: fbtft: Fix reset assertion when using gpio descriptor")
> > Fixes: dbc4f989c878 ("Staging: staging: fbtft: Fix probing of gpio descriptor")
> > Fixes: c440eee1a7a1 ("Staging: staging: fbtft: Switch to the gpio descriptor interface")
>
> I get the following error when trying to apply this:

Argh, i replaced over all commit messages when added staging prefix.
Thanks for catching this!

> Please fix up for your next version of this series.

Will do!

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
