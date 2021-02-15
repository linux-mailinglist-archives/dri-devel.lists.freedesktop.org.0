Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 005DA31BC72
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 16:30:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0126F6E8CE;
	Mon, 15 Feb 2021 15:30:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A2CA6E8C8
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 15:30:24 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id o21so4374018pgn.12
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 07:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nd5Yfn43BCBJomp6sHGwdTlb0IPHeJ9K8m6gaCF931g=;
 b=QlbaUqnzMU0C+clIlVwtHO1AAUS6hShwRtyZCDsTmZzZwcmd0MvlA67evCsxYKYrv9
 oKrDig8saJwiRnm4O6aUp1e4/ws+SKz6OIkEQBqzWkWYGXDiNbkIQfjhbtkRbYWfLd0G
 2/FCRBVDNjvBuweRiYhxsjRRVt0/QXtpRK6r/6gXOlSUzoqQ+5KOS5NRoasd9AldnGTg
 SQK3zITTU/cF1MExS0UmOE9w7TqHzbR8an+TKYTEacU5q3iZYLdZn5DWxkSYanN1sJHD
 AxS5K04hDJmBYp+SbaCJr6mhhZzQ9USz2aiea5q+oFgQ5wRm5VgMfP/Qyyzj+W3iEU0R
 jk/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nd5Yfn43BCBJomp6sHGwdTlb0IPHeJ9K8m6gaCF931g=;
 b=Pufvu5an224tQPBeiKuPdnCQFqdmb/E2R5TLx1mw8iN7hUE732TsLIWRiK9XVqwBtT
 BjLNfJ6Gc9Won43GfBMu3WjEUHsTbdhb2RFARFxMiLtzM60P5E7wsoi7vS2y3CtlVNvG
 X6wajX4C9JvMkli3Ql2TKfsZJvW1ismz5g4ucw7lL9uhj8hf5rWgeFoq56ZjDIM9HJGC
 foFgQ8ZI7dhhVABz+DO0W9ATlfmoPeB6wGriEZD43i+rbxSpN4ZTQFctVmRqZ6I16BZx
 2T2WapdCrWbCaDVjQ6wDHDY8yBk87ERkaa5WSjqBvDhulDSCR4DfH3dMhJPd46h0FZdJ
 HtAg==
X-Gm-Message-State: AOAM530xEFG/HCZoJWg94kx95RNQUo663votSgd5lagAitNO9UgjhY0S
 5QVOGecK5oIJMaYFdlzV442jTmj6nnfgBS11BFQ=
X-Google-Smtp-Source: ABdhPJylFq9d2tX3RjtahOe8hIgIQ4VN+QPYppcEIIbyB9lQQ4aHPmvHcrHpBNqSf8zEzCF2lh70YD492yPKz49qdps=
X-Received: by 2002:a65:4c08:: with SMTP id u8mr7118551pgq.203.1613403024154; 
 Mon, 15 Feb 2021 07:30:24 -0800 (PST)
MIME-Version: 1.0
References: <1611838435-151774-1-git-send-email-zhangxuezhi3@gmail.com>
 <CAHp75Vd=ijxnamuSYuxNLeyhGMCod=HaXWrQ0W0+3QCsQAychg@mail.gmail.com>
 <20210129130110.00003bb1@gmail.com>
 <CAHp75Vdi4H_zY3+QPSq_wmdf20B9xPeqsOT10JHfMLJESX77gA@mail.gmail.com>
 <20210129215638.000047b0@gmail.com>
 <CAHp75VcdOibSRuSBZYhFtEcVxuammYMfcnrUQGvS6ttArFxj6g@mail.gmail.com>
 <20210130143924.00005432@gmail.com>
 <CAHp75VenJVOSbAXryGK_BWytRJF=T1zwk5xDimRQOTojoXbMFQ@mail.gmail.com>
 <20210202095234.000059ca@gmail.com>
In-Reply-To: <20210202095234.000059ca@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 15 Feb 2021 17:30:08 +0200
Message-ID: <CAHp75VdwdBtZLG9rMWMzVSy27i3HwVm4eWk7jyKuJ-60JYJSeg@mail.gmail.com>
Subject: Re: [PATCH v12] staging: fbtft: add tearing signal detect
To: Carlis <zhangxuezhi3@gmail.com>
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

On Tue, Feb 2, 2021 at 3:52 AM Carlis <zhangxuezhi3@gmail.com> wrote:
> On Mon, 1 Feb 2021 19:40:21 +0200
> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>
> > On Sat, Jan 30, 2021 at 8:39 AM carlis <zhangxuezhi3@gmail.com> wrote:
> > > On Fri, 29 Jan 2021 16:26:12 +0200
> > > Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > On Fri, Jan 29, 2021 at 3:56 PM carlis <zhangxuezhi3@gmail.com>
> > > > wrote:
> > > > > On Fri, 29 Jan 2021 12:23:08 +0200
> > > > > Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> >
> > ...
> >
> > > > > Hi, I apologize for what I said in the previous two emails. I
> > > > > missed one email you sent before, and now I probably understand
> > > > > what you meant. Here is a version I modified according to your
> > > > > suggestion:
> >
> > I have realized that you are mocking stuff in the generic fbtft
> > structure for all drivers while only a single one is going to use
> > that. Consider moving everything to the driver in question.

>    Do you mean that i define the TE completion and irq_te in the
>    fb_st7789v.c as i did before?

Not in global variables. Perhaps it will require to add/update the
custom (to the specific driver) data structure.
But the idea is that all changes should be isolated to that driver.

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
