Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AA91EBB29
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 14:03:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC2506E172;
	Tue,  2 Jun 2020 12:03:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914826E172
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 12:03:54 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id c194so6994120oig.5
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jun 2020 05:03:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IgExh/ny3ZdfEOHfQwIXJ7oTzjh0IcO4NnZTa4lzZZg=;
 b=LzFiUBTPVIgLA2jr4Lj+ofSDUFtwuTguXphq46SmGyhoif1JcUl0d8FArWNVw9IOgm
 3gAIxP6Tek2sI+XEQhl7wFhQarr+DlSwyXLwnQNc8H4QH7MTMPpRE6M1FpONOgG7kOac
 S9zArU3oOEC6GqAiQbB8wCBUDZ0sk9p2MY8o/N9uXMC/IpAWgBO3vHm5i4sfOYl1gt8a
 qAzyn/P7Ed9rqRvwhnqEwkPTj+mYS/mQv1bSbxALJrcytThUU8C1Dvi4+uTBib7XmJBo
 q4RDBB0cPUFcsaQA73PWAc+7dyZxB7zdh3LLylh8m3ph3PiCI2AmV/q/CD/lhBaZHLtd
 iGWg==
X-Gm-Message-State: AOAM5336HNJYU45JyL5FiJD7cor9CzwNvGyZ6acawAlii9pUD0f/KzB7
 4aniL7F11+M1bQYuM13AWMN64m31bEZ8L1ocvVU=
X-Google-Smtp-Source: ABdhPJz2czAuYGYJfe62NGAvi2DIXZQZsfLZD8OxGXlID6t22QF7K8A5fIlnr/Ug64ryYGdMa83JGneje4dJWf0Q67U=
X-Received: by 2002:aca:1a19:: with SMTP id a25mr1947756oia.54.1591099433899; 
 Tue, 02 Jun 2020 05:03:53 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200504232908eucas1p296927bc7c736ad924cefaea9a546459d@eucas1p2.samsung.com>
 <b1cf967015c5beafa475aaa30d8e21a58caff870.camel@perches.com>
 <380c0494-ed02-b2be-65b0-d385627fb894@samsung.com>
In-Reply-To: <380c0494-ed02-b2be-65b0-d385627fb894@samsung.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Jun 2020 14:03:38 +0200
Message-ID: <CAMuHMdVYuk9+=3OTufOo98Dd3ijXS6JBH9RqK2v+9mwogxbnXA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] video: fbdev: amifb: add FIXMEs about
 {put,get}_user() failures
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
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
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 2, 2020 at 1:52 PM Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:
> Since we lack the hardware (or proper emulator setup) for
> testing needed changes add FIXMEs to document the issues
> (so at least they are not forgotten).
>
> Cc: Al Viro <viro@zeniv.linux.org.uk>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
