Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E68462FB1
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 10:32:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 067836FC58;
	Tue, 30 Nov 2021 09:32:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E83816FC58
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 09:32:03 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id n15so19612859qta.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 01:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dowhile0-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aUO0zYMOFTImjhGnSua4FGc7M45+0o91QH3P+KyNO88=;
 b=C03OfCYd9KW5usMblxVVjO4GA8qqiIkLGOcYZdvMMcY9dVe047o0+AGFOm2iqa267O
 f9Xmd0H1uoP8+2QugfNG4NhBvL2p3O/6FS8+8JprxI431e001pvtmmOIcSfoG4Xtg//I
 KpgfBKzR8okx3vZ7nsdpD/EG+FrWNSiUmZirNJyCmnUXcqrMb0R+hxidJbo7MsSyuiK2
 iuTLyvb3zhaBhKXInoBNQ2H5NOxAbmzsvlWqip5omDpqyQe4i+VIxeKKyaM44CgJkqlg
 VUL7g/WEuRDD5HgmFjIl8JN3ExPHJL4PUaEuGjteHIn+7JIpgFNW0XfMvGap6N/jWPSG
 1G8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aUO0zYMOFTImjhGnSua4FGc7M45+0o91QH3P+KyNO88=;
 b=oncCpvRe8SbOoeN0+QstVwFA1JWDVZD+lfTAXHnm97dkuPaj1WkFi0mos3KgRwKUyN
 WimLLpKGF57dssNpVNZdMvP39Ls5KXQoGwPYt2rZZbEZzqPE8iMLj0/KxHjsshk2OMp9
 GNdWT7OPxX0PP01F5iD9mFvEwA/JAm6Xa56RkFX11uYYrYk4bXVScn+I1VhgVdStQcsw
 X/ebgmgR6VcoBZSsFgt0R2TvSdgCWcqdXFyKEU0AShzPC5MwbZr6zGsKS2w6AGYvOXnu
 0LcZ6sZ2I/yNDyE7hjQvO1fnZMt8WwcGh0Q3fHi/9ZB9+LD1oKmYtG+FCmKyHdk9ZPiZ
 zbxQ==
X-Gm-Message-State: AOAM530dOnzUO2/4Xq69B5ICo1/CoSGXDn5e/un3hsZ7oDtGeZcGOjcK
 VVTnDyH7dZ6A1uEvJ1QOCxZ5kSpA1I+Md+8YpLCWO3STUJk=
X-Google-Smtp-Source: ABdhPJxmLDZCFj0xvJYiN+/PqdA9cil06ermArqh0vD0zpnelQPpEweDRgPqu4aIMcAqQlHtdTH8wFo7SO3yeN29Ldk=
X-Received: by 2002:a05:622a:202:: with SMTP id
 b2mr49227244qtx.34.1638264723012; 
 Tue, 30 Nov 2021 01:32:03 -0800 (PST)
MIME-Version: 1.0
References: <20211117145829.204360-1-marcan@marcan.st>
 <20211117145829.204360-2-marcan@marcan.st>
 <f3582c00-925d-91ec-c829-0aaa8f0157c0@suse.de>
 <36f3cf18-6654-e1bf-1fa6-a5797751ee86@marcan.st>
 <CAL_JsqLd=NrZgkTw+N2+Ka4zqRVpZMRNSisUDV9MhBQA-0TZQg@mail.gmail.com>
 <CABxcv=mkuJLrXr_nbELg39qJvUvV2y69FAisFKURR9bqa3FzKg@mail.gmail.com>
 <9315c6f5-48f6-4f29-1e31-87ab5ed771b5@suse.de>
In-Reply-To: <9315c6f5-48f6-4f29-1e31-87ab5ed771b5@suse.de>
From: Javier Martinez Canillas <javier@dowhile0.org>
Date: Tue, 30 Nov 2021 10:31:52 +0100
Message-ID: <CABxcv=kWa8ghQkVeKFN+emQ1wRV=AErULVr9E6R3ZBBiCkMxcw@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/simpledrm: Bind to OF framebuffers in /chosen
To: Thomas Zimmermann <tzimmermann@suse.de>
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
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On Tue, Nov 30, 2021 at 9:31 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 30.11.21 um 07:44 schrieb Javier Martinez Canillas:

[snip]

> >
> > I think that instead it could be done in the sysfb_create_simplefb()
> > function [0], which already creates the "simple-framebuffer" device
> > for x86 legacy BIOS and x86/arm64/riscv EFI so it makes sense to do
> > the same for OF. That way the simplefb platform device registration
> > code could also be dropped from the driver and users would just need
> > to enable CONFIG_SYSFB and CONFIG_SYSFB_SIMPLEFB to have the same.
> >
> > I have a couple of boards with a bootloader that populates a
> > "simple-framebuffer" in the /chosen node so I could attempt to write
> > the patches. But probably won't happen until next week.
>
> IMHO it's better to keep the OF-related setup in the OF code. The sysfb
> code is for screen_info. We can try to find common code for OF and sysfb
> that then lives in a shared location.
>

Ok. As long as we don't end with code duplication then that works for me too.

> Using a single global screen_info variable is somewhat awkward these
> days. In the long term, I can think of pushing sysfb code into
> architectures. Each architecture would then setup the platform devices
> that it supports. But that's not really important right now.
>

That makes sense. And provide a set of helpers as you mentioned that could
be shared across the different architectures and firmware interfaces.

Best regards,
Javier
