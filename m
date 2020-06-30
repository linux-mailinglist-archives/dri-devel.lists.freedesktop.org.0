Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7125120F208
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 12:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028D189C08;
	Tue, 30 Jun 2020 10:00:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 975A489C08
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 10:00:15 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id gc15so1813758pjb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 03:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bS0b9bomKbWXIqGH1Zn1LUVsA5coUEY5p6IxbrWuUK8=;
 b=hXxJ7jHSRR9RC7jPAR8UazOI0+y6V4kRxr3Yvm4SgETLWpYx9ONMzLlV7qJpbOY/6W
 HbRjoYS5yrixrD/eNc8NQG2gTvYVyprGeojRsBzDeKUhoo30xVrDvD1u524X4jOv0Efs
 KjZd5woAIewUlg1ZLitc8ogpLw357Y0Vzt57JHhlidrx/k2XW/hSRDYLDEftzxHsh3Gf
 YBxloTbDS1Cmxfi2ObHtLSy/2qn1Sz50FOZR4kAmnVxSBJ9RB6LKcOtYFXAVfp5rdkco
 KcKNemTAxhE1vGcyMgR64hSpgTDd6pCnXQAUo1aYC75E24oob1cMcspCRkY1DWHeBByM
 64uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bS0b9bomKbWXIqGH1Zn1LUVsA5coUEY5p6IxbrWuUK8=;
 b=s+wGNmdx3fPcuKWucopyF13C4kYQvlip9t7qfGLiXBkQ/SdoXnvQpvn9qRKtdBgLBv
 pnihYbOkT3ymcXE4mz7dzQ2KiZPtrt33TfBKpLZM/5wasp3Fm+nF4VYuErJNn2HdA3kr
 xRiTz6eYgVsw7DfL2772ffnIPfbRO1rkJQFSPV4EdVKspaoIBcjK1JpA5QclLjrWZGbs
 KhPbPeBfP59GOghzsyLQsPo/1eZrnv+Jmo7c/AqzPLvU06uKYYhehdxInyFNamhbx9Ib
 Uka7gQAJzYj7MzJ38nNEYpUuM1k/3C894/MW6VGuFD/ICz2lcsf3rfupnAjPI/Ijff2F
 TKPA==
X-Gm-Message-State: AOAM531a45lUZFhmUMHP2nbhM3lBpVcuzS6d5cHRHW+QUHYv0qEbvclJ
 po5T1zoLoPf1LvCXonv5uhLVkr0pFlc3p3AW3D4=
X-Google-Smtp-Source: ABdhPJyDAWVlXnklUfmuNIokLXtYElqabkjA8Cr1sJHfddgAENO5LBwoK9RGkW420nWl8wlBjw/H2sVLKtawRm0W9Mg=
X-Received: by 2002:a17:90a:d712:: with SMTP id
 y18mr760791pju.228.1593511214814; 
 Tue, 30 Jun 2020 03:00:14 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200629112249eucas1p160b845444f8fbad96bdec41e9d3938da@eucas1p1.samsung.com>
 <20200629112242.18380-1-a.hajda@samsung.com>
 <20200629112242.18380-3-a.hajda@samsung.com>
 <CAHp75VdS_u8h4qfBxsQRUp1-2SL_hq20=dQkpteXH7Xg7epArQ@mail.gmail.com>
 <a48ab93c-0d9c-ed8b-76dd-62007826bf6f@samsung.com>
In-Reply-To: <a48ab93c-0d9c-ed8b-76dd-62007826bf6f@samsung.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 30 Jun 2020 13:00:01 +0300
Message-ID: <CAHp75VdgCJXEkLuUQ7Z+5J499TNtgvsXG=4cncuQuKqAgHm4hw@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] driver core: add deferring probe reason to
 devices_deferred property
To: Andrzej Hajda <a.hajda@samsung.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 30, 2020 at 11:32 AM Andrzej Hajda <a.hajda@samsung.com> wrote:
> On 29.06.2020 18:36, Andy Shevchenko wrote:
> > On Mon, Jun 29, 2020 at 2:22 PM Andrzej Hajda <a.hajda@samsung.com> wrote:
> >> /sys/kernel/debug/devices_deferred property contains list of deferred devices.
> >> This list does not contain reason why the driver deferred probe, the patch
> >> improves it.
> >> The natural place to set the reason is dev_err_probe function introduced recently,
> >> ie. if dev_err_probe will be called with -EPROBE_DEFER instead of printk the message
> >> will be attached to deferred device and printed when user read devices_deferred
> > to a deferred
> >
> > reads
> OK, thx.
> >
> >> property.

...

> >>          list_for_each_entry(curr, &deferred_probe_pending_list, deferred_probe)
> >> -               seq_printf(s, "%s\n", dev_name(curr->device));
> >> +               seq_printf(s, "%s\t%s", dev_name(curr->device),
> >> +                          curr->device->p->deferred_probe_reason ?: "\n");
> > Hmm... "\t" will be dangling in the latter case
>
>
> Hmm, I followed your advice [1] :)
>
> [1]:
> https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1787370.html

Ah, indeed :-)
Okay, as I  said I'm fine with the code. Since it's debugfs, we are fine.

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
