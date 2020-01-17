Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E804F140C19
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 15:08:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFDC86F58E;
	Fri, 17 Jan 2020 14:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD59A6F58E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 14:08:46 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id z9so20480649oth.5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 06:08:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N+Kvtznk/wQ3RQceXPlbXNebs+cmr/OsrKXgAi73pC8=;
 b=T6N7bg6JnYon5HcwwCCjBxl+f3p6n9oDPw7B7AvsxoKU03unjDaBULLqoQmIJKDlxB
 gMyDT69wYI8ZDjPttuG1fJ1EFCLHfmyTdnA4StItHEZ0sOosLpSXc01BATy86CfGWq+s
 6YSydJcrymIcqc5W4W/TL1UyvFI6ah9eWjB96fIMrx1RVyXi+HJF2iVZQEed09aBaq0d
 lnUZZQ9ynJgJTSlXeDgOhBQ/RVsMtcaNY5rmdfWdtxpkqQZCMiwRUDr6gRMaFtejS2z4
 2G5kOkTGYDihywaTaxefbuKCSwcxOqF0bOzJnhrLTl2gfxDYeT1WTvg7Amd7JUNZjTL1
 RBaw==
X-Gm-Message-State: APjAAAWCrQg8EKMOQ66Gspa37HFDC8230BhxcPonxXX49ZIp0gwBbHPh
 QnGcoxN3l/fYzC+8qWxQVGjdL+H8DQsV/V+367Y=
X-Google-Smtp-Source: APXvYqwfyMoS4OLZbI0D8YiBzxm1g6GgAYSbLMjZHjS79Rgj58kvMeYupqdn8up0R2mIakaN+MsqQVPiWg9tYoEVsD0=
X-Received: by 2002:a05:6830:2141:: with SMTP id
 r1mr6202897otd.39.1579270125929; 
 Fri, 17 Jan 2020 06:08:45 -0800 (PST)
MIME-Version: 1.0
References: <CGME20200116145157eucas1p2401abc6b00654d767e872edbd0338957@eucas1p2.samsung.com>
 <d98fea18-b72e-6d0f-33ac-1421738bd12b@samsung.com>
In-Reply-To: <d98fea18-b72e-6d0f-33ac-1421738bd12b@samsung.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Jan 2020 15:08:34 +0100
Message-ID: <CAMuHMdVxesjdmL7asPwOP2xoS6quLs4-onT80afi7ui2GSZ-tg@mail.gmail.com>
Subject: Re: [PATCH 2/2] video: fbdev: sh_mobile_lcdcfb: add COMPILE_TEST
 support
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 16, 2020 at 3:52 PM Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:
> Add COMPILE_TEST support to sh_mobile_lcdcfb driver for better compile
> testing coverage.
>
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

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
