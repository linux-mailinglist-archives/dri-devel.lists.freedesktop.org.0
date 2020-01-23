Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 076861462CE
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 08:43:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A1F6FB11;
	Thu, 23 Jan 2020 07:43:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4496FB11
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 07:43:51 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id h9so1851815otj.11
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 23:43:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vLGlAAGiegO0GysYxYun8pWcF7YLYXC3rdiJuuUaflk=;
 b=YHP5sKzGJ/VRoKLyHbv3F7kvk07TDbFj6I8QNWPSN6OoyZWIJ6INNrDYZiB3jXdh9O
 QShPlRQiAw9zle0qB7QlYLWFyDXCZG8Rxo/+p9Th7NWQIsQbeDgIJC00wIzqDBk/dCH2
 no6zrYc/W8vjxgolrlu+dlbsbPEGo8ouXry38Wy5Ux5CGY/rmy7/UactQYembTb4RmHr
 jEd5TKKfmxaRSS/7YvwG3zVhfHMywJO7RV1xv588ChBxsIPBc4vflJBPJ+M5oDugPy1w
 7sGKVehwGCSXF4v7GjQLywm9jnasfVGEWbfvh0nv/uU1rPTJ7ZOMgOtKNlwq0LK4ZXib
 jEcQ==
X-Gm-Message-State: APjAAAWJQCVcT/EfFjsh8mMvA6IePUCJTc80qsVx7c4UYHMReirRVc60
 qwDg44jTBJR3jujJjqRiQQXcBODyBDidb/NvRpk=
X-Google-Smtp-Source: APXvYqzGxT2Jtu940TL4l2TiU5FOZBq7t2LMHQVChF947mfbvyVwZosKQjz0+xvORbuInNBHdiuc+1exNEHQYrNmoss=
X-Received: by 2002:a9d:7984:: with SMTP id h4mr10595289otm.297.1579765430323; 
 Wed, 22 Jan 2020 23:43:50 -0800 (PST)
MIME-Version: 1.0
References: <20200115124548.3951-1-geert+renesas@glider.be>
 <20200115124548.3951-2-geert+renesas@glider.be>
 <ba21d2c8-ccc6-2704-fa1f-d28239700547@lechnology.com>
 <20200120190249.GA9619@ravnborg.org>
In-Reply-To: <20200120190249.GA9619@ravnborg.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Jan 2020 08:43:39 +0100
Message-ID: <CAMuHMdV4QtKTBvM+8U=BgDV7zzQfO50Z_pnwpNWLhh6Gioe+=A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: restrict properties for sitronix,st7735r
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Lechner <david@lechnology.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Chris Brandt <chris.brandt@renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Mon, Jan 20, 2020 at 8:02 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> From 6b54fb0a071c0732cd4bd5b88f456b5a85bcf4f2 Mon Sep 17 00:00:00 2001
> From: Sam Ravnborg <sam@ravnborg.org>
> Date: Mon, 20 Jan 2020 19:55:04 +0100
> Subject: [PATCH] dt-bindings: restrict properties for sitronix,st7735r
>
> David Lechner noticed (paraphrased):
> - not all properties from panel-common are applicable.
> - missing optional rotation and backlight properties
>
> Fix this by listing all allowed properties, and do not allow other properties.
>
> Fixes: abdd9e3705c8 ("dt-bindings: display: sitronix,st7735r: Convert to DT schema")
> Reported-by: David Lechner <david@lechnology.com>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

I'm far from a DT yaml expert, but LGTM, so:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
