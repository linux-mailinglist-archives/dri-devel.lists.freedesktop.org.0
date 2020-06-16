Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 852201FBD55
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 19:50:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 722DC6E8E8;
	Tue, 16 Jun 2020 17:50:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C266E8E8
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 17:50:54 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id r9so7213736ual.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 10:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5sMP3nTa63QmDJKCaYvrAcFjA3YySoTIgUeAWyvfRJc=;
 b=Xcyo4mpB1wBgedNWPapwvUwtDuVUnxV5HwnjTBrl8ez4Eefa8LwRsZyXWqrN5hVInP
 WFjoepUMGsAvF/rV11vpVv8Uj1mHJFbXhAvKs2ZUeTJHa0E1Kx4Cbq2GpeSReleMPxow
 veTvwW6su1W6rzpXgPdN1ydG5zllBiUBKzDOY0I24JlY50re3OETWdllQUehN+celru8
 h76ECLKNJuBKpdwGtIj7Tvokkc5Skhj9QLjlwOft8Syax7FL9aNZ2iyCXis3ycExGrUR
 4AVMwBTbxb24tD53L3LkEseov03sq9RtDlSSS7sDRPijnFMOn02nYQpW1/l+3IdJvy9l
 0DiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5sMP3nTa63QmDJKCaYvrAcFjA3YySoTIgUeAWyvfRJc=;
 b=KOIriTASqsfOn4WWN9TieSn3Q5sa+qRRH72GTDJCd7rNUuSKc7U9DjoS4rXmm1z+wP
 4DjgcBgZI1hdZ/+Nf7pEwwZJRSf61CYJo5OCYlCVXafFrrNSXk6azjPXa5vVPVSSfjf0
 y8TX6qhtzEQ8dlxRFvPNmSdJecFT/lgs6+2ahQ2k5INqYxYnubfpyPA1TsZSHLZmPlOy
 OVB9arajMxvQNYKuizRFrGfbOMPl7HnCIUdHoru43OI3cEzyreg2GEZMYI6i69RnKhv+
 WIf3ctrcsKE7GVdtvdFJCw8DVLUhCI6fKc8MDf3ZlXU62MN46gd4FcO/7to5Z9PA+i9t
 4bHA==
X-Gm-Message-State: AOAM533bcPTUII3rWfUO1kb3yKkojyElgZ+1791FNxLxGKyTAk09zHHy
 UKjah9V/9PXT+BCKnxttbl+U/xfFgaBQmEI1Daw=
X-Google-Smtp-Source: ABdhPJwxqnZ0zbGT6b9qMF90f5G09kOuk/8Saca4YmTVCM+VzfKEHpc81vXVlqZZ+oRVh30GSZpxCj4si5IADFlASLU=
X-Received: by 2002:ab0:3055:: with SMTP id x21mr3068707ual.106.1592329853780; 
 Tue, 16 Jun 2020 10:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200607133832.1730288-1-paul@crapouillou.net>
 <c20796dd-d4d2-a989-ba58-7c3c71c15dc2@tronnes.org>
 <1RIXBQ.4P44ILM1QELP2@crapouillou.net>
In-Reply-To: <1RIXBQ.4P44ILM1QELP2@crapouillou.net>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 16 Jun 2020 18:47:11 +0100
Message-ID: <CACvgo50abpfh6Q+zPZCCG7RnAzX=CZJmtv2SyTyBfLC7qWtU1w@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] DSI/DBI and TinyDRM driver
To: Paul Cercueil <paul@crapouillou.net>
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, od@zcrc.me
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Allow me to compare this approach with some work Linus W [1] did a
while back, which I've just noticed.

Pauls' approach:

 - Perhaps the shortest one possible
Porting an existing DSI panel to DBI is 3 lines of code - compat line
in the SPI/DSI bridge, a bus_type and
mipi_dsi_maybe_register_tiny_driver() call
The clever use of the DSI type (equal to zero) means that things will
work w/o updating existing dsi hosts and devices in panel/. Yet in the
very unlikely case that the panel does not support DSI, we will still
allow it.

Although thinking about the type I wonder if it can accommodate all use-cases:
Since we can have a device (panel) capable of DSI+SPI it makes sense
for it to expose the type bitmask, not the host. Although, what if the
host itself supports DSI+SPI.?
Now we can extrapolate that with a host (say fimd/exynos I think)
which supports a SPI panel (s6e63m0) while having
of_graph_get_port_by_id(0)?

- Strange (ab)use of the DSI bus for DBI (SPI, 6800, 8080 etc)
We care about existing users (DT) and it sounds unlikely (based on
previous discussion) that DBI + SPI/6800... will make it into DT. So
the current approach seems quite reasonable IMHO.


Linus' approach:
- Clear separation of DSI/SPI
Compat strings are still duplicated, although in separate files

- Minor code motion and slightly more invasive porting overall
Much of the boilerplate can be reduced via helper lib and macros. Even
then it's unlikely we'll reach the 3 line delta as with Paul's
approach.

- Does not handle tiny-dsi (dummy) drm driver
It seems doable, with minor changes


Personally I'm on the fence and a deciding factor for me is if Paul's
approach can handle all the combinations of host/device type support.
That said, the input from people likely to do the work would be highly
appreciated.

Once a decision is made, an illustrative series + todo entry would be
great to have.
-Emil

[1] https://lists.freedesktop.org/archives/dri-devel/2020-May/266079.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
