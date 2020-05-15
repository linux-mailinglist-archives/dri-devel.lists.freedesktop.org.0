Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E86F21D4791
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 10:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB7EB6EC0D;
	Fri, 15 May 2020 08:00:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6ECA6EC0D
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 08:00:34 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id x7so1481305oic.3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 01:00:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YncV898UjXxBWm2giPLj4L0kWGTVbAItgNGD5qYRB1A=;
 b=GmO9wO1iBtxTj8sr3XAN3lV/dTl3J+IV1BNzUw7er8wx1sQLOSHmVyeBFu2dEmkznO
 C+SihfFLzY4WXNX0N56fwqOWG7Q5CRD3nwVXSOR7ScjAdpUCGRfQgN8aO5GJwIoRWimJ
 YmoScE9pd+HyF6Uiny0CWfJS0DJ7lSH+fUxzjVACECrA0fOAvGwLne/Jx8pEMV2Y3KZ4
 zGvK7rNPHFcyUtogmQVjjn67d291YK3vUGJh3ovcVUKJZgQkGp2rqaKV9IMf14ZsTxL3
 D2O3NIwRfi6pnml1FqDvykUq6Sgkh8bk/lmuIp9YFFANtfuYHidxsKIok20YC4JXpoib
 DDnw==
X-Gm-Message-State: AOAM533L60OqW0+2DNAwVPc8CypsgEdsQchoY7MaJ8o0R2M34D++yjuh
 iz4qhEDi114HGJnIlND4+np0xj4q4xBaMcGcW18=
X-Google-Smtp-Source: ABdhPJz9ZEjPHeQF+FJnfoyiI0zgf3mPHnnSP/Y1JD/deklz9tASyJRaKQKwRTDPSLTcGhW6Haj4dup2gF+MZuYHnzU=
X-Received: by 2002:aca:cd93:: with SMTP id d141mr1172333oig.148.1589529634075; 
 Fri, 15 May 2020 01:00:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200515012432.31326-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200515012432.31326-6-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20200515012432.31326-6-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 May 2020 10:00:23 +0200
Message-ID: <CAMuHMdXxXAgh02rH7VXM7idVZn-nGg=fR6jREr_bm5tY5_Z5TQ@mail.gmail.com>
Subject: Re: [PATCH 5/8] dt-bindings: media: renesas,
 fdp1: Make power-domains mandatory
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
 Rob Herring <robh+dt@kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 15, 2020 at 3:42 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> All DT source files in the kernel tree specifyc the power-domains

specify (whoops, missed the same typo in PATCH 2/8).

> property. Make it mandatory.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

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
