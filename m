Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BD02403C1
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 11:01:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 401416E3C7;
	Mon, 10 Aug 2020 09:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93706E3BB
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 09:01:01 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id h16so6704423oti.7
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 02:01:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kH5dLM3T0ZjBv81zJx0cc/HzMGKg53a3xLeUDaxakxs=;
 b=EyUJEcXHWD6Qk9UT6JyxxfGwp78uUyCzm+hfa3YLWXnztbA//EL6MwuN5WXpwdQHgJ
 vDKIORbNYHxn0z+mbc5E2K1aofQWBypsjT8Ux+GUKu122hHNtx/Qz4X07KTxwBSwgDsW
 uJ3ejgTa2Cg2hSdlcvFuEV2StCBVMZbtcX8D3Mxkd/WEenC5cGKItm8664fpjtKiLjgj
 WtVntRyt+PYm3Q2UMqzAGAqvUoRBTqQXIAn3zBcn1C4fbtdjiNDFgW2sjN0AS4dYur8/
 n1BbFM8yl52OdmddvNAR7WLA9ggNsMSw8j+hnS4LC5FzDJdKwYuYDnbji0nNG26pwYXx
 fN/g==
X-Gm-Message-State: AOAM533WVkmfKIYeBGCqN/TfsL0UHdfR9rurlCIZk87vbXJPzezl7oT1
 IRt13fEx81oyI35ClnGmWQlX0Nd1RLPloRnAymY=
X-Google-Smtp-Source: ABdhPJwHasC1WwA6qEsYupZfJUk9MX4OlC8dDGZYKH8s/1JXzTkCXirrHzHsSV52j66ecce0DQoIUVMHTDoRmDlFP/I=
X-Received: by 2002:a9d:1b62:: with SMTP id l89mr4144otl.145.1597050061323;
 Mon, 10 Aug 2020 02:01:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200807212218.24773-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20200807212218.24773-1-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2020 11:00:50 +0200
Message-ID: <CAMuHMdXWbbgyELMHqx=7xLLQdmbCNdqfRmW=vqSy-n045VapBg@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Fix crash when enabling a non-visible plane
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 7, 2020 at 11:23 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The DU driver handles non-visible planes (fully clipped by the display's
> boundaries) by considering them as disabled. It thus disables the plane
> at the hardware level when the plane if moved off-screen. However, if

is moved

> the plane was previously disabled and is non-visible when it gets
> enabled, the attempt to disable it crashes, ad the plane wasn't

as

> previously enabled. Fix it.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

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
