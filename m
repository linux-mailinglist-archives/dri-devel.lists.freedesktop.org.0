Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 588F948944D
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 09:52:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B365112AE83;
	Mon, 10 Jan 2022 08:52:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com
 [209.85.221.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B6812AE83
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 08:52:45 +0000 (UTC)
Received: by mail-vk1-f173.google.com with SMTP id bj47so2639521vkb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 00:52:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PRrhnzxIx33BHyJCSHFJIK780dP5z6iPEtjsS253KxU=;
 b=I6GQzw3tiykWRmziZL+Q3534Tslk9Wi4htG4BaQV+tzOia9byOWxhPHqvAStggKZee
 142GxWuQnBaJQp22Y+GRjYLHhuhzqIUugBf2Rn+an1pqTf2fnv8BUSGuN1lJMMx34DX0
 WBhZrmNmI0LrrHzk9TVNrykI0L+jUF3jAqlVdm1PRS/gK20/NGADDSE/MlSKdSsxYQ68
 pt1y6XNIOciqItTe0u+QOwvxSxE4eigRM0IoQylDUytO2EJPULY5ZRtzc/W9AVq6tNL5
 4kLJb1A8heKcyt/gwfodzHITRSpGPa6Yvu7c4a15DT/h4dxURipOoeRJH7PsQhqEdbIV
 Fd/A==
X-Gm-Message-State: AOAM532TjvwQvzf1X+hGlx3r9G2SGNV7SakqnKjT+Uqe0Y//TBKN57C4
 SlYSD+n9HlOCmal1AojKz5S6BIORhPQDYw==
X-Google-Smtp-Source: ABdhPJzhLRCdyc2mNgrcQjrjiGfk1Re137aAnRbK0x6IoR8yzuMc8UP981Pr+jKfQwxJEnxKg79FCw==
X-Received: by 2002:a05:6122:d0f:: with SMTP id
 az15mr28485870vkb.28.1641804764707; 
 Mon, 10 Jan 2022 00:52:44 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com.
 [209.85.222.52])
 by smtp.gmail.com with ESMTPSA id u8sm3849143vsi.18.2022.01.10.00.52.43
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 00:52:44 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id l15so10654761uai.11
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 00:52:43 -0800 (PST)
X-Received: by 2002:a67:e905:: with SMTP id c5mr191335vso.68.1641804763769;
 Mon, 10 Jan 2022 00:52:43 -0800 (PST)
MIME-Version: 1.0
References: <20211224052309.1997096-1-nikita.yoush@cogentembedded.com>
 <20211224052309.1997096-3-nikita.yoush@cogentembedded.com>
In-Reply-To: <20211224052309.1997096-3-nikita.yoush@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Jan 2022 09:52:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVHMzZipXaUE_SrkHtj6edZATefC908P1ngLrnOry8KCA@mail.gmail.com>
Message-ID: <CAMuHMdVHMzZipXaUE_SrkHtj6edZATefC908P1ngLrnOry8KCA@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a77961: Add lvds0 device node
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 24, 2021 at 6:23 AM Nikita Yushchenko
<nikita.yoush@cogentembedded.com> wrote:
> Add the missing lvds0 node for the R-Car M3-W+ SoC.
>
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.18.


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
