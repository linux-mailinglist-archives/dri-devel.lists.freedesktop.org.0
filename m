Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8224D2642DA
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 11:52:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADF256E8DE;
	Thu, 10 Sep 2020 09:52:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5036E8DE
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 09:52:12 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id 60so4838547otw.3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 02:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7+9oH0sYC9uFa4rtOU4xv5EuedXzTFlA2T6c2Xjms4c=;
 b=VoNYT4divfz9p2rNQGr5X6Q8+1oxhTSVss+m6fylLhsbFpns9bpJLXAhjDpJBPhWNv
 AzsZSj1SFcEzJ1FuiHfOZFLcoCRZ45MTCPD+HyNn7V/vYCm3cevNbr8mDLzLlclLuP9Q
 R3kQPIiWjetdc045KGopZxP4eIeER8YTbr+1rNG8fwQsuZaPYYURi/Xb31bFuaYU7JBh
 OmIfw15qLO6eO33B0PBOcXp0XHDn2Ny0b9ekuca/pp5WoAZ/sh+ZY5foXVHpKul4HTyK
 /Axjm0Oc2ZzQoI3q/hgVVyu+EK76lj0xaSk6w/TYzmULuKHeKWgOhrZxE0V8aPQcI/TZ
 B3pg==
X-Gm-Message-State: AOAM532F3T7RqsuneH/hpleIhQyXzb37JvG4Sv+AsPFV8q24cSlMI6zv
 4rKAFmC9Ij7W3cn/JrlaALRPw0oeL3BDz5XNphQ=
X-Google-Smtp-Source: ABdhPJzm8K9YBV4cCFZpYIMaQ6gkxYlG7O3M9AkmIx5/FbwBxVxPhAujFiCDvP12dzPOH5rDjKJZBJ9/24ioqZzdfC4=
X-Received: by 2002:a05:6830:1008:: with SMTP id
 a8mr3144760otp.107.1599731531860; 
 Thu, 10 Sep 2020 02:52:11 -0700 (PDT)
MIME-Version: 1.0
References: <87o8mhrtxo.wl-kuninori.morimoto.gx@renesas.com>
 <87d02xrtux.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87d02xrtux.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Sep 2020 11:52:00 +0200
Message-ID: <CAMuHMdV=S9jRbGCYRw=p-AcBc7WrYmBCDVFEvrrBeuCCMLbm4Q@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] arm64: dts: renesas: r8a77961: Add HDMI device
 nodes
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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
Cc: Linux-DT <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus <magnus.damm@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Laurent <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 8, 2020 at 2:35 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch adds HDMI device nodes for R-Car M3-W+ (r8a77961) SoC.
> This patch was tested on R-Car M3-W+ Salvator-XS board.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

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
