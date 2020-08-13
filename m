Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF03124377E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 11:19:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B436E97D;
	Thu, 13 Aug 2020 09:19:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EDF96E97D
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 09:19:54 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id n128so605732oif.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 02:19:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/v4uvvRnqKHcgJNYJduYoJSMkREgWkw0zIPc1FkXq2I=;
 b=tq1TMQMI8cfinaEMPHsADkQFvwP6JmU7+ITGttBRMhDnPZUEhFcgogjCUun+eOkXsw
 MZVFZnKJ8goW1EBj8abNiPefqCSWhGd2q3Am30Zpk7o+nzZmJaZPE+C7/5kMOXgZzBxj
 PMzxSQ9KGF5wa6nVSUb2yPn/PqEELx8mfvcMl2MdmytWWfXbR2AQ3udEfyPyVXyq3jlv
 B76DFeuOgLk/EL+Zs/Nr/PyixMFP47U6NH9ALALmUZcXrTGGKIZrkOOxnNoGlMp28LQz
 Y/NsIo6prpmjMI11J2ivlKf5CKmv4VZgV5RCJRqhEpujYT7MuV7Sv60wOQMXOKEyr8al
 BMUw==
X-Gm-Message-State: AOAM530A+NNyndfYQ7r4MhpoSpv4BxDd/Kn+FEjhbRuDSxAmxvglUDsP
 GUiWKHq1S+XAnQXAIKdhRrihFnFG/4gFk/b7cvA=
X-Google-Smtp-Source: ABdhPJytJP0+Iv9qs3wU8glC01qaC30yEZb/cpAyOSHhM2vuO9fnrK/sIihtm4nDXrZAbYH3np5ihniLKTjWpXHLaH0=
X-Received: by 2002:aca:b742:: with SMTP id h63mr2470003oif.148.1597310393858; 
 Thu, 13 Aug 2020 02:19:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200812140217.24251-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200812140217.24251-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200812140217.24251-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2020 11:19:42 +0200
Message-ID: <CAMuHMdUGXa+uJPjoE=shXkiWvCvxmsYKiec7=LGdcAoQSwjNwQ@mail.gmail.com>
Subject: Re: [PATCH 9/9] arm64: dts: renesas: r8a774e1-hihope-rzg2h: Setup DU
 clocks
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Prabhakar <prabhakar.csengg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 12, 2020 at 4:03 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Setup up the required clocks for the DU to be functional.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.10 (after resolving the port numbering).

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
