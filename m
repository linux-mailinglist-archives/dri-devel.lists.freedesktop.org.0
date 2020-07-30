Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB5D234009
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 09:36:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537EC6E9EB;
	Fri, 31 Jul 2020 07:36:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D75A6E93C
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 17:46:43 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id d18so29104482ion.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 10:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KAQxMtrcNtT/qn4VP9i1rWA9WddbB6VGPbgpkMkGrA0=;
 b=DR65LCOUMQR20BJpxQ9xrmHCoWWhUQ8CIys3obDf+4dsubLWlGYWkVgHK80ueyn9Ht
 tisBUvDtBMEqouGdnSOotr7ZVXkUYZ5ELYgzRS37so41EvGVV3W5AVVEzbJGu1pqK3xC
 PALm8nzf7olRFrjBT2UgQleA2wTWMeB/k8HjG9FdODa6BiJTz5MhY6xw1uaqaM+L5XAw
 sq03qRHMP13q76GoVjPiktV7yUZQ6jBmQVrboaQHDeV5Ie7RAlWXxHYc1fSWC6ZSCmAc
 v0h8HIGh2upttDFZyv5JL6pMFZuLdl4OkPzftWSje+AOrhg17VWaYN+Ouz6gJDFLG8pl
 h0qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KAQxMtrcNtT/qn4VP9i1rWA9WddbB6VGPbgpkMkGrA0=;
 b=syWX7a33JC3je68/GsckH6xuMNv7F0l38MNLtnIQXXJS7UwR0gMG66ivW2j6+Wyg1v
 NjyDYpx/KOhnOpCjcNBN6gDtNGCgqfFVTCN8LmEOEujnnz3Vhbm+tN0+tAKmq6Eas37V
 xJhqPMnY9kTrWP+n64l3iLnF2H2HswRnTiz0ltxo5TQXlsx3fW/pnLLKzvy8dkH4UN4E
 vwEMEBbUxs/T3x/n9p0lVromKn8XwKoLgHu5NFAppN3tj5LdsXdAY/RgD0qNtl1imhNy
 Ximfe1bu8z5GqPSg4YgOpWxy5YtrPCssNeJr1nn85JCmbWynR+ftbg2Iqj5zH/P2BJFX
 u5Fg==
X-Gm-Message-State: AOAM533z+p34MnGAGO10FFZi/JOd2aMKEIk+pzb6p4XUcv8NZkecjste
 hgAgFqqxmzZdyZvMpLFNdkU4s28sgoEQqam/X2I=
X-Google-Smtp-Source: ABdhPJyhYSIPo/giDMeelwhangK4RmO8N4BnVkCP2Rskejgr5cQANOAipXRcjsyTeYIcHCvQYRbde9p2WR4m/oKgVd8=
X-Received: by 2002:a6b:dd12:: with SMTP id f18mr22464031ioc.109.1596131202475; 
 Thu, 30 Jul 2020 10:46:42 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200713144331eucas1p25911c4ffa9315f632d8f6dd833588981@eucas1p2.samsung.com>
 <20200713144324.23654-1-a.hajda@samsung.com>
 <e55a23bf-59bb-43c6-f7d7-467c282b8648@samsung.com>
 <20200730070832.GA4045592@kroah.com>
 <CAKdAkRTKjHg2y8yTFgxr4yY98M8D2noutDBfB1mh7wwLLQrYbw@mail.gmail.com>
 <20200730164845.GE5055@sirena.org.uk>
In-Reply-To: <20200730164845.GE5055@sirena.org.uk>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 30 Jul 2020 10:46:31 -0700
Message-ID: <CAKdAkRS+QooavPaKMcsaUQdRJGky_6JYq1EiUbyT_gcU3ZYeJw@mail.gmail.com>
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

On Thu, Jul 30, 2020 at 9:49 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Jul 30, 2020 at 09:18:30AM -0700, Dmitry Torokhov wrote:
>
> > I believe it still has not been answered why this can't be pushed into
> > resource providers (clock, regulators, gpio, interrupts, etc),
> > especially for devm APIs where we know exactly what device we are
> > requesting a resource for, so that individual drivers do not need to
> > change anything.
>
> The error messages are frequently in the caller rather than the
> frameworks, it's often helpful for the comprehensibility of the error
> messages especially in cases where things may be legitimately absent.

Not for deferral. All you need to know in this case is:

"device A is attempting to request resource B which is not ready yet"

There is nothing to handle on the caller part except to float the error up.

>
> >                  We can mark the device as being probed so that probe
> > deferral is only handled when we actually execute probe() (and for the
> > bonus points scream loudly if someone tries to return -EPROBE_DEFER
> > outside of probe path).
>
> Is this a big issue?

We do not know ;) Probably not. It will just get reported as an
ordinary failure and the driver will handle it somehow. Still it would
be nice to know if we attempt to raise deferrals in code paths where
they do not make sense.

Thanks.

-- 
Dmitry
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
