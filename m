Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D58987A1D
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 22:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF93F10E08A;
	Thu, 26 Sep 2024 20:37:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="feFl/+Ul";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D372A10E08A
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 20:37:22 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a8d6d0fe021so228471766b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 13:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727383041; x=1727987841; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=775UvlkSoXpTO0ArAyGUdf/HYXxZJcefCUu1uzpll20=;
 b=feFl/+UllEulafY7pEaIyjDc7YlA4htfVt81P1364UBcsL74aooYhlgiu8WlryT+75
 jSZ7QWTV0fpRCDNqY5JORr+fSB4UJbfMJoapYNTPSafLmgXs00IILOYJ1tqEvTmT0CRm
 ZoFwknoOr3ygi3Mo5G8/3OrDNi0j64gwPZjDR53Db3wISDMgoS88lHSoP5Z+EpnxMk9m
 T2hUCMHcWv1DKmuqi6c70P3+GhPVSr6jGEgfKVvCjj+Uy+1VmURsTMH9Uvozj9KAfnal
 dY7Di9rr3eOPqwrTULbjM6WP1n/owLQGaW1Td9POM/XrWvT0fyzT2llLvUAYzLP7OhT3
 NANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727383041; x=1727987841;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=775UvlkSoXpTO0ArAyGUdf/HYXxZJcefCUu1uzpll20=;
 b=J80gJlcR0KLrWTd9ASkfWuGg8Q+V/TllKxZUtNE/iI4TAIO3n1jqTvwuSVAI2ON/gZ
 tlU7oadoXRociyRZRgX7G11KlTsmcfdMS3tBenaAMFW4WZCEVfd52snhToPxgHmUdlR8
 k5BjMYe9DPg5I6k/W3BdDKsZU6fFJRNDk0spiVZZ6EYL95ja7ueuFs+pJFWYwB7J1cL0
 9/XCmz+/BnfraqWGlTo8z7qNF0xWA43zyd/FdQn24UXSu3duyeA7ode+1/1UbP5r7u/o
 OMjcWVIKspr1mRxAEtTdpPuEqKeppeUKpu27vEwSU3dFM10/kcYG2C6slcFe4R/PlV4O
 QIXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXB84dczk5dgIRAMViC0mnBGDXdHegBX0/YrhHITN782qIwzJ3AtBUQvRjgkwrzH0MB4ObJmtm+mko=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziJOqnpccY3wGmPDfoSKVxvwytUWdUg5u77H/U2gpkkLOPCmzE
 hvl/XOtfvp++wvSaIiPDsSIM42v1s5orreSB9uSgttDEzEDdj5+YNk1rUxR4anfQ82XNECS4Ght
 i1Kk3Tjf9kOHxa4zswyGKTfk3hnA=
X-Google-Smtp-Source: AGHT+IHc1Ezux9pM0aThP/TOYS2knno6+tOUMZrrGeAxftJLhrEpwS38H4GtC6O7ecA8U44MVby/mKDHkInNDMwyPXE=
X-Received: by 2002:a17:907:a08:b0:a8d:55ce:fb97 with SMTP id
 a640c23a62f3a-a93c48f33c3mr77813366b.11.1727383040932; Thu, 26 Sep 2024
 13:37:20 -0700 (PDT)
MIME-Version: 1.0
References: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com>
 <MA0P287MB02176175318B96135BE3E320B8902@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
 <nycvar.YFH.7.76.2409111420040.31206@cbobk.fhfr.pm>
 <MA0P287MB0217A06CA89D6A7D0631466EB86A2@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
 <nycvar.YFH.7.76.2409262001520.31206@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2409262001520.31206@cbobk.fhfr.pm>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 27 Sep 2024 06:37:07 +1000
Message-ID: <CAPM=9tw9Dns-fjeQmqLDyf5P99+Dq77R5xktvsFbO0crC5b5oQ@mail.gmail.com>
Subject: Re: [WHY SUCH DELAY!] Touch Bar support for T2 Macs
To: Jiri Kosina <jikos@kernel.org>
Cc: Aditya Garg <gargaditya08@live.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
 "mripard@kernel.org" <mripard@kernel.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "bentiss@kernel.org" <bentiss@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>, 
 Orlando Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay <kekrby@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 27 Sept 2024 at 04:03, Jiri Kosina <jikos@kernel.org> wrote:
>
> On Thu, 26 Sep 2024, Aditya Garg wrote:
>
> > It has been more than a month since I've sent this patch set and I
> > haven't got a clear yes or not for the same. I understand maintainers
> > are busy people, but I'd really appreciate if I get some response for
> > this series of patches from the HID and DRM maintainers.
>
> Just to reiterate -- I am waiting for Ack from the DRM people and will
> then take it through hid.git.
>
> Dave, who'd be the best person to do this from the DRM side please?
>

I think Thomas or Maxime could take a look, though it might be easier
to submit this in pieces, does it really need to all go in at once?

Dave.
