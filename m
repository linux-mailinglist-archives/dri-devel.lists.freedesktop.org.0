Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 940A91D4765
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 09:52:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E5D16EC0C;
	Fri, 15 May 2020 07:52:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 169D06EC0C
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 07:52:12 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id q11so1213373oti.6
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 00:52:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JaQlBb9oArYmKvmoqWVUkmZk8foj3iKrTJtHxEepwn0=;
 b=tR7rEk7f53ttPF+Yvqz58XUdfiiGHWNEG6vicm9Kx//fdB/eofkI3TomhjaWFanrSC
 oBNmezBlt5YA53rzofSEU1ERT9iMMfxVpitg06wiech0cypNzTO/8sGjK4f9U4eQQ9wY
 VOmdiKfEAed75qMsShUVOJPsud65QAHqMHJF6ns/t1PeyGzw4PYa73/OjF9ljsjnF7dn
 wXsPekoZo58hp+tWqdPqiT7eh8Qse+Isj0ZKwl5+Ia/ZcSDoKqTeU/hNCgxYKlkwqNsY
 xcAcuFxMAkBqg9/YCYphFytMvYIT4xqPvNsMTMW9UT0PEBrVCiPSfVvbjOmCcezUEeJu
 4HiA==
X-Gm-Message-State: AOAM5334HS4Wmf6PHo6Yi80NwqEYGH2T/WknqEpehZ1pO+C8rYibQ2dx
 FBKXlqsJeq2GI7GfaP8FdtWTHhUOrVpH7N6GB4U=
X-Google-Smtp-Source: ABdhPJy3iOyQMKi7AuotsPKCDsiz+XoWb2CdQ5Zc7J0FnbL0Xgdt8ZEQFtucaP2b8nKF8xcH85ULQUJvTIaHzoGFZng=
X-Received: by 2002:a9d:63da:: with SMTP id e26mr1239507otl.107.1589529131311; 
 Fri, 15 May 2020 00:52:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200515012432.31326-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200515012432.31326-3-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20200515012432.31326-3-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 May 2020 09:52:00 +0200
Message-ID: <CAMuHMdXR8eNqC6ieqJZaRevRjPj8kYspcixVezjAeuPWgnZB3A@mail.gmail.com>
Subject: Re: [PATCH 2/8] dt-bindings: media: renesas,
 fcp: Make power-domains mandatory
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
