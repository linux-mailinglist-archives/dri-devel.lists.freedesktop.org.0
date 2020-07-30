Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFE723401F
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 09:37:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C1F6E9FB;
	Fri, 31 Jul 2020 07:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C1E86E941
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 18:45:37 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id g19so17199746ioh.8
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 11:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1M+mQosS53rR8rnqJ+wOq1od8dF70GSvNLfqjFKtb+w=;
 b=dnn2ECJVDMO+WGWX3kTgDJexFtgoLfprxeNovVCxUtS7jXjzesDr+4uAhaLiU2Ve3U
 Vq0wUFZU8UxDAxoZbCpPs+PAU39psgwwzYlKI1ZYmBSqh3XOywQ3Ddit8RJqOUfsom+S
 DGOPtMLSRb5w2Hd5iEFWqomAwX0q4aoCrnIo2r1w0kTmypujBaHXvKnAOQcdePIPdOjS
 vbP4saDH69ElaTRcJ+xWTL/KnMMtIyPaGNXTS7OVdN4a8Va83V6uwkMbs7DoJvaeJsbR
 N0oTZ0JeyM/ndJWcOS4JEpbaTLhC9b0dccIuTnIwbd3J/CF/n84n+V3P3ENpXirb9I/N
 RWFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1M+mQosS53rR8rnqJ+wOq1od8dF70GSvNLfqjFKtb+w=;
 b=s48OB5QQm7ySs4J8HzgffqpP/RZWQ8ISbELtRE0SOOEdI/OZMd+YC/2cpCRQ6EE2vb
 6rrK2t1Ro7TJSIjAficyWyxBpmFAqc2TmBiV96guL6vMeMgdeo+ly4q1HX9Fp5/ALa8u
 xdPqnxUgfjm1HITuIDKR7oLGe7sj7h5Ojo9L4a9zL8Jxn+bPZBMLnWjX+Tl7FtOIq41H
 82LiIqtJHB32LUWr2HTaJoneUMg9aKVcbMQiuX+FyztfNZEtX6GkQ5cLxjGbb6b87vy/
 5YQDDey2VLmjFI6a7xAM4kXeP78P1faU9C8K4v2YPYE8ofW7GRvndJ2BwJaggUM0NZXX
 KSfQ==
X-Gm-Message-State: AOAM531UDJUhBlZuixBia5/FYo3hRgjUiHqa8vTjXOZ9k87MbAFirt0k
 RO+fhNckLh6YcfxSh3vPSLCWgPtU1gnbjNOiWUo=
X-Google-Smtp-Source: ABdhPJyePUmV86fwPoIT2w0lFQuKXuE+2i6wYo+AAjl0IXq3XELDfg7qMjjDf6BiJmMlAYOVZXaDgNcncxLDT9NlbG8=
X-Received: by 2002:a05:6638:2601:: with SMTP id
 m1mr620541jat.141.1596134736322; 
 Thu, 30 Jul 2020 11:45:36 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200713144331eucas1p25911c4ffa9315f632d8f6dd833588981@eucas1p2.samsung.com>
 <20200713144324.23654-1-a.hajda@samsung.com>
 <e55a23bf-59bb-43c6-f7d7-467c282b8648@samsung.com>
 <20200730070832.GA4045592@kroah.com>
 <CAKdAkRTKjHg2y8yTFgxr4yY98M8D2noutDBfB1mh7wwLLQrYbw@mail.gmail.com>
 <20200730164845.GE5055@sirena.org.uk>
 <CAKdAkRS+QooavPaKMcsaUQdRJGky_6JYq1EiUbyT_gcU3ZYeJw@mail.gmail.com>
 <20200730181639.GG5055@sirena.org.uk>
In-Reply-To: <20200730181639.GG5055@sirena.org.uk>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 30 Jul 2020 11:45:25 -0700
Message-ID: <CAKdAkRSaF3q1MJ7mteD-4C4O58LL4FP6xpTovVOdu0v2VD=sAQ@mail.gmail.com>
Subject: Re: [PATCH v9 0/4] driver core: add probe error check helper
To: Mark Brown <broonie@kernel.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonas Karlman <jonas@kwiboo.se>, lkml <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 30, 2020 at 11:16 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Jul 30, 2020 at 10:46:31AM -0700, Dmitry Torokhov wrote:
> > On Thu, Jul 30, 2020 at 9:49 AM Mark Brown <broonie@kernel.org> wrote:
>
> > > The error messages are frequently in the caller rather than the
> > > frameworks, it's often helpful for the comprehensibility of the error
> > > messages especially in cases where things may be legitimately absent.
>
> > Not for deferral. All you need to know in this case is:
>
> > "device A is attempting to request resource B which is not ready yet"
>
> > There is nothing to handle on the caller part except to float the error up.
>
> You can sometimes do a better job of explaining what the resource you
> were looking for was,

I think it is true for very esoteric cases. I.e. your driver uses 2
interrupt lines, or something like that. For GPIO, regulators, and
clocks we normally have a name/connection ID that provides enough of
context. We need to remember, the error messages really only make
total sense to a person familiar with the driver to begin with, not
for a random person looking at the log.

> and of course you still need diagnostics in the
> non-deferral case.  Whatever happens we'll need a lot of per-driver
> churn, either removing existing diagnostics that get factored into cores
> or updating to use this new API.

The point is if you push it into core you'll get the benefit of
notifying about the deferral (and can "attach" deferral reason to a
device) without changing drivers at all. You can clean them up later
if you want, or decide that additional logging in error paths does not
hurt. This new API does not do you any good unless you convert
drivers, and you need to convert the majority of them to be able to
rely on the deferral diagnostic that is being added.

Thanks.

-- 
Dmitry
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
