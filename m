Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 062BD462D04
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 07:45:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E99276E1F9;
	Tue, 30 Nov 2021 06:45:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9FC96E1F9
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 06:45:05 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id b67so25694760qkg.6
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 22:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dowhile0-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qKE3SwAPujqmjUAZ9rQU1XdIfpsX7BZWFDwsRhFkyDo=;
 b=g7xUjsHLoB/kGuWRUDrA4d3KpXufSvrgvzJQ6chy6Ws52RnweR0HKccFg4O6xqRU09
 T1hqP5mfqLt0B7sLTHR0XX4fZvcW6fg18HQSQ4FGEcBlTJ5G7EgTj8u7fruO+EMHrYQR
 7Y8nYjZvd0EqxmGFiomh+R9dk0pGYkBmUtMPOHMDW1GCjnFeGA+ci9CC/zW2HhmbpqBw
 3EHoO4FBD9nxho73oFftoo4XVljvlbn3FQgpwLwnSbYY3CaqfqAuDGkFQjv1g9bJPGox
 RB3vIiVq6XBFj8BWIkYnHeho85J+mMybfT4FrFsTRj7Wt0GYZhL4Yjs01Lf3u3H9MY5d
 XK3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qKE3SwAPujqmjUAZ9rQU1XdIfpsX7BZWFDwsRhFkyDo=;
 b=SRBEoilAc/sI5U3CquxZZcJwG4UWqQEX8wD5+GI1jMYU429Ix/MjBZoEwRWBhSwBE4
 CDbMOYPERki3yNiYSSiq5dtUCMng31/Xssl/V8Klpp6BR9ex34Yuz6kmxESOY5flcXUy
 na9JlvxRHKD0oVtHwi+SWnlxy2rS59lp1XvRCEB/jKOHym8XLe7qC00Gl4+Gyasz+Gdp
 SMD+kb+LbIR4jU9HD8Hja3g2XmIr479fby6SPynyoMYqjtQPP0MRIuMpGPJVW/Q1CtWa
 FHrZJRc7lAo5G70/9JyQuY+GpxR8RYbHx/ecHyUiN3VU2EnNKDm3B79fZdnx3Najsbc2
 5oEg==
X-Gm-Message-State: AOAM5310BRwzM7rYjZ6xw4G843zoAK8vXzb7/so9Gi00TpZK7syTIY+9
 b8uFJqV6hX5LLcgI7EdJqaPDYycOjNqVmKab9ZzqTQ==
X-Google-Smtp-Source: ABdhPJwlh9AXckQRtlJG9Tc6C7SGMudaXmy5jY/4bAoMJccAQqzFx6Kkm7Odxp+lmklWV0D4oI1N34TE5V7Fve1V0FA=
X-Received: by 2002:a05:620a:430c:: with SMTP id
 u12mr35141300qko.589.1638254704508; 
 Mon, 29 Nov 2021 22:45:04 -0800 (PST)
MIME-Version: 1.0
References: <20211117145829.204360-1-marcan@marcan.st>
 <20211117145829.204360-2-marcan@marcan.st>
 <f3582c00-925d-91ec-c829-0aaa8f0157c0@suse.de>
 <36f3cf18-6654-e1bf-1fa6-a5797751ee86@marcan.st>
 <CAL_JsqLd=NrZgkTw+N2+Ka4zqRVpZMRNSisUDV9MhBQA-0TZQg@mail.gmail.com>
In-Reply-To: <CAL_JsqLd=NrZgkTw+N2+Ka4zqRVpZMRNSisUDV9MhBQA-0TZQg@mail.gmail.com>
From: Javier Martinez Canillas <javier@dowhile0.org>
Date: Tue, 30 Nov 2021 07:44:53 +0100
Message-ID: <CABxcv=mkuJLrXr_nbELg39qJvUvV2y69FAisFKURR9bqa3FzKg@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/simpledrm: Bind to OF framebuffers in /chosen
To: Rob Herring <robh+dt@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>, Hector Martin <marcan@marcan.st>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > >
> > > Simpledrm is just a driver, but this is platform setup code. Why is this
> > > code located here and not under arch/ or drivers/firmware/?
> > >

Agreed. Creating platform devices is something for platform code and
not really a DRM driver.

> > > I know that other drivers do similar things, it doesn't seem to belong here.
> >

Yeah, the simplefb driver does this but that seems like something that
should be changed.

> > This definitely doesn't belong in either of those, since it is not arch-
> > or firmware-specific. It is implementing support for the standard
> > simple-framebuffer OF binding, which specifies that it must be located
> > within the /chosen node (and thus the default OF setup code won't do the
> > matching for you); this applies to all OF platforms [1]
> >
> > Adding Rob; do you think this should move from simplefb/simpledrm to
> > common OF code? (where?)
>
> of_platform_default_populate_init() should work.

That should work but I still wonder if it is the correct place to add
this logic.

I think that instead it could be done in the sysfb_create_simplefb()
function [0], which already creates the "simple-framebuffer" device
for x86 legacy BIOS and x86/arm64/riscv EFI so it makes sense to do
the same for OF. That way the simplefb platform device registration
code could also be dropped from the driver and users would just need
to enable CONFIG_SYSFB and CONFIG_SYSFB_SIMPLEFB to have the same.

I have a couple of boards with a bootloader that populates a
"simple-framebuffer" in the /chosen node so I could attempt to write
the patches. But probably won't happen until next week.

[0]: https://elixir.bootlin.com/linux/v5.16-rc3/source/drivers/firmware/sysfb_simplefb.c#L60

Best regards,
Javier
