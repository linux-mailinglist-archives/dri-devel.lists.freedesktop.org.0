Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7831D47A0
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 10:02:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F906EC10;
	Fri, 15 May 2020 08:02:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE8C6EC10
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 08:02:37 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id s198so1471004oie.6
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 01:02:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZZ6vQ622AaV/0HEime7/TJpo5Nl9rILDzhMaaomGY/U=;
 b=uRLRn8ABPyy0MA8IjY6t0U/AEZMb+23hHPG7rI3++I8rtgcpH8DFW4eyw2bZHAE7wd
 k3wERqY8MBkHKNK9fvGUHB8W0ibFga6jVF8qs30QLnlwf7qxDGObiAaaIPaH1pfwkycV
 x/di7m+gYDziQkydhXuXOqxhTljWQRFJign7PAZaZYT6r7rZ7hbzMVMTER43Ib0blI2u
 /ihAHlc/atRtla7OJL2YFHr+P4XjSDaGeG4QpvKM0FE24vsTg/L4RamdiCEsreVPudvf
 O3vJEK7/YEZHpen4tdShgs1UoHtdtEQ4IMIMsDts2Vo4XXp2eW7NAhIeHzwDT1JSGwIH
 9szg==
X-Gm-Message-State: AOAM533fEveZHGa9LbETX6KnkierD9H6YW/MHfuEPeBpTuNoVCL5QPSd
 N6Pkuq2s5N+7IH04UjOi5Wsp5XbYCq4zvvF8Jls=
X-Google-Smtp-Source: ABdhPJzN8vLde9ZUe9S+qS5BonElYeoTqoiGm2rI6IOYvfC6AUI+uzWHSOmSDDQBakSFOgcFTv+oQlC2M0atUYWMYEA=
X-Received: by 2002:aca:d50f:: with SMTP id m15mr1265980oig.54.1589529756623; 
 Fri, 15 May 2020 01:02:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200515012432.31326-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200515012432.31326-7-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20200515012432.31326-7-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 May 2020 10:02:25 +0200
Message-ID: <CAMuHMdWngTHUP=_kwTFsvjLt+7ciEfNhBYz8xXFOktt+gJg5Jg@mail.gmail.com>
Subject: Re: [PATCH 6/8] dt-bindings: media: renesas, fdp1: Add resets property
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
> The resets property ise used in DT sources in the kernel tree. Document

is

> it and make it mandatory.
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
