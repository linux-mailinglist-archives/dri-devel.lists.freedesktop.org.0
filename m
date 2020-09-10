Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C27C5264296
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 11:42:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B5E6E8D7;
	Thu, 10 Sep 2020 09:42:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87266E8D7
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 09:42:09 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id c13so5322811oiy.6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 02:42:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6t4KyNE6aKdBOe7+K4uVYMteUZyvP3X+Q55taPemhA4=;
 b=KVVJWrxWHlntqZf8UNXmNyPBCVL4S38vGkvuOyRQKIquQyzRaNKUCw9KrKmolJhw90
 WgkxCv/QGQD7rU6mlIzWsnkKjMVuX435gHtdu20a72My5Zo+8yP0dO+Aen57h6B/EU0C
 TzEK64vqipKGNAeDu/7AEMFnX6JiK5zoekjzLv9lkQlUTP5bBJRJXs5ImuTBwIhaj0lI
 BVQcB1y6FgF44tVped+a42VToIfdtDoSZ0PhyMf9GL8uJUlEwoRNI7QBwYcuCvMRbjWF
 EMeUpvZLuE3ZP5vSqGQiWKlRL7xz0JkhAOlZihV3lMzkzRpUHKQZ5dsFvzgm5hYbFJYr
 2yzg==
X-Gm-Message-State: AOAM532eV710BnESFjnr//eH1xMNn7XGurWWagHG889U1xFyHt3kMAKt
 HIXuOAJMWYJihd3SUk8eP2iuGzVJbEYjqKspDB7DUgR6
X-Google-Smtp-Source: ABdhPJxchL9382cME/R/2HkTsCBKE3YV6NjMKB4lOkKU/8bIrnJMCyO8Izl/WsAgXXIaQzO2ySl/oeVsdFszrdiEUFA=
X-Received: by 2002:aca:b742:: with SMTP id h63mr3036251oif.148.1599730929239; 
 Thu, 10 Sep 2020 02:42:09 -0700 (PDT)
MIME-Version: 1.0
References: <87sgbu70tq.wl-kuninori.morimoto.gx@renesas.com>
 <87lfhm70s6.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87lfhm70s6.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Sep 2020 11:41:58 +0200
Message-ID: <CAMuHMdU_C90xQv1yrSAuP=hdEBE7vNSBcKN26L9nQStOB6=_eg@mail.gmail.com>
Subject: Re: [PATCH 5/9] arm64: dts: renesas: r8a77961: Add VSP device nodes
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

On Mon, Sep 7, 2020 at 4:59 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch adds VSP device nodes for R-Car M3-W+ (r8a77961) SoC.
> This patch is test on R-Car M3-W+ Salvator-XS board.
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
