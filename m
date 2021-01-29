Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B604D308970
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 15:04:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCAFF6EB40;
	Fri, 29 Jan 2021 14:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95E036EB36
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 14:04:39 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id i7so6728016pgc.8
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 06:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2HvMuSQuok3SxIwyh3VLvvIEGSa363+ZDsGak3OB2UY=;
 b=ALiKoCrdDwt8AS06d21H4u1TK0pIPrseT+wzfjYy166kpAnVAeShq36PpQ10AFYB8p
 kJzZC0yUvsmD7jc+ymLlGeL8H0kqm2D3sxtA2buaKAbxV0tDm16pIM+FEZbQnkXx7bCs
 U1LRB8Efwokpm0XKdPPW1QLxJkalaJtvp20zv3jtxm19QX1PsC91geRNG65fsLTAsUaB
 FtqaaywyPJuQ3slXtuJlCA7JiQoANy6Artj0XtsXjWZgvG7ly/oEnltVMgv/QQ9zHdG+
 IpUBByf0VNxc9rUwrDRoNKYTxZYz3vncH600Txee/iCCrt7vsB8jsVW7ZWNelFTxq5Th
 DEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2HvMuSQuok3SxIwyh3VLvvIEGSa363+ZDsGak3OB2UY=;
 b=bSelcw+zSoDKUC0zvxiG09nE+h2fZfMr75WGQl7kWTwfVUnY2+ce1nEKwx+lCmrp8N
 /qm09v4gJQsqDrPsc7gIP6kwNEIneGdx76Tf7NEMTxHhtgRUw4EmGRitL1YEpGwj1pzf
 vllyteNbh091chXL78rg6l6ZoddINP5SiZhdNTk0JCeweMXSYZnrijKYZdbgQe0XxSRJ
 bykEDXEWzlf1xwK1vGKW+kHZUyQNOYQWKNbOQ9y5qgM0RKLKhvMtGGTxEp6j6wcwWSgR
 UMf3f63h/AGu2hMsEC7Hf6Dz4nanw6SB5NE5RCIZs6KAwh7i1jEdjJEfnFpm5e6QrRUH
 V4wQ==
X-Gm-Message-State: AOAM530tv/ZLzrOj55SR84u4UkIBJZxThPFV42mCsAAEREH7oW8uDX0u
 c2Z9Gw6PU9FkTpPpHoGbqoqpcLWa2jdIOEnwEXk=
X-Google-Smtp-Source: ABdhPJxw061PU6908QgfoAUJstvhxaahvZZ6H9ZS4oW2+gLfQwwyqDKviRNcnNYL9evlmb6KqWQFI39LTyTWSDr1s/I=
X-Received: by 2002:a63:fc56:: with SMTP id r22mr4893662pgk.203.1611929079216; 
 Fri, 29 Jan 2021 06:04:39 -0800 (PST)
MIME-Version: 1.0
References: <1611838435-151774-1-git-send-email-zhangxuezhi3@gmail.com>
 <CAHp75Vd=ijxnamuSYuxNLeyhGMCod=HaXWrQ0W0+3QCsQAychg@mail.gmail.com>
 <20210129130110.00003bb1@gmail.com>
 <CAHp75Vdi4H_zY3+QPSq_wmdf20B9xPeqsOT10JHfMLJESX77gA@mail.gmail.com>
 <20210129205447.0000464f@gmail.com>
In-Reply-To: <20210129205447.0000464f@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 29 Jan 2021 16:04:23 +0200
Message-ID: <CAHp75Vc5G1jOjGe8AzLgNtYrPi8zbO4niQ58CLU0iPhJfiw0Ag@mail.gmail.com>
Subject: Re: [PATCH v12] staging: fbtft: add tearing signal detect
To: carlis <zhangxuezhi3@gmail.com>
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
Cc: "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 Deepak R Varma <mh12gx2825@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 oliver.graute@kococonnector.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stefano Brivio <sbrivio@redhat.com>, Colin King <colin.king@canonical.com>,
 zhangxuezhi1@yulong.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 29, 2021 at 2:54 PM carlis <zhangxuezhi3@gmail.com> wrote:
> On Fri, 29 Jan 2021 12:23:08 +0200
> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Fri, Jan 29, 2021 at 7:01 AM carlis <zhangxuezhi3@gmail.com> wrote:
> > > On Thu, 28 Jan 2021 16:33:02 +0200
> > > Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

...

> > This one is not like I suggested.
> I don't think I have a problem here, if te GPIO is not configured, it
> should return NULL, if it is configured, it should be greater than 0

Pointers are always greater than 0 or a special NULL case. The
rationale I explained in the previous mail.

...

> > >                         rc = devm_request_irq(dev,
> > >                                               par->irq_te,
> > >                 panel_te_handler,
> > >                                               IRQF_TRIGGER_RISING,
> > >                 "TE_GPIO", par);
> >
> > Try to use less LOCs.
>
> LOCs???? i can not get you

Lines Of Code. Above can occupy less LOCs.

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
