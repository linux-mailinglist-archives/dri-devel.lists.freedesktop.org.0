Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A56AB1D47A3
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 10:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2EE589C96;
	Fri, 15 May 2020 08:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88ED789C96
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 08:03:20 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id a68so1215082otb.10
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 01:03:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S6RqWFqDLnyhbogEEorXs2l4C9SQA7u1WfGxQI0hFs0=;
 b=GneKYB/D9qL89M4c9fxMPMxQQAmQgQnlKczBflnxzZQXxBaBYMTpXRXeAf8KPzMwxK
 SbHuo6e4lYyD8kCZu2WDnny/JvQDzDQxO/iIhanHOMWRZ1/MY9C8Ml002k6ji5DTzgAV
 dit4Sv+MP5+s24i7e58job6+u52NWCQa9JlQs7IuELRP8OagC8KR2wKmmqlMJVrdg9vR
 2Z49Pd3WuUinkLVnAijSIYBA/Neh3cpqAUDZ0CEQ29pXAd271F4V8qTfPGUfmPDgUHt8
 FHurOCUZk54uJlGn31S+oVNQCIQw6HOpN5ri66iyfvAV5sB8eVwhc74krYC84lI7XUw0
 IXlw==
X-Gm-Message-State: AOAM530Rv9NMAgeUBb6MRzli+GUhylrFcda6BtIHxMyIFajOEYcdjpTT
 nDeCkzYqUjPfYc5Bn5ZXT3lTcCtqY05KrQTSnB0=
X-Google-Smtp-Source: ABdhPJwqzxHWxFv6Mp1ECz3hTRpgWrZ2yzfCv2QUL/NdCvBf1nUgrqWXh9K7DZI4g+rUbxIxZPqwL20omKYmPmjS+Jw=
X-Received: by 2002:a9d:63da:: with SMTP id e26mr1263475otl.107.1589529799904; 
 Fri, 15 May 2020 01:03:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200515012432.31326-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200515012432.31326-9-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20200515012432.31326-9-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 May 2020 10:03:08 +0200
Message-ID: <CAMuHMdWU3y56HCJ8wFgjD2AXTdDcZjUxiLdrS-rqKjuTMvY6gw@mail.gmail.com>
Subject: Re: [PATCH 8/8] dt-bindings: media: renesas,vsp1: Add power-domains
 and resets
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

On Fri, May 15, 2020 at 3:43 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The power-domains and resets properties are used in all DT sources in
> the kernel but are absent from the bindings. Document them and make them
> mandatory.
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
