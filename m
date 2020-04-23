Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3151B5E94
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 17:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB5126E887;
	Thu, 23 Apr 2020 15:05:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0EA86E887
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 15:05:25 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id s18so351488pgl.12
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 08:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YHcF20Pivw8z3/ND3mH4iQQaNlvKu4UnK2vOPdbQVJA=;
 b=FfBGHPK7wd3f4BANvXku7COH9+t7ONn4xwNP0pCwrDxGoSAjfB+kx+Ba2EjlFV+MQx
 6JOKBdD69hIcNz+Lx0mdmGb4L7e8Z3Rq71Pmu08iUZaKD09/qI2P1Ufw4/8/ycV6U4VO
 PYJdNt4VGItxq7kJAlDRpz8DxoOvOjDhWktDup3jVleZ4Tocp5zsDz+ATnQEvpnMPrFv
 6UEd4Uu0xASl247ScxZsDPwy0zvKJ5ofx0Kry678mnDgEpnZIyVvLHVS+0I1TJnXgyd4
 CoHNMAjjymhKxRZJCFoGWt0v/1M/GTR7iKdgHZ4H2MWSIDwfojhh/OEdjCh/55XlfHZZ
 iOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YHcF20Pivw8z3/ND3mH4iQQaNlvKu4UnK2vOPdbQVJA=;
 b=WWAEYP5kCP4mWkVOf7mJ0IygAXklLYgWhFn1ILHnNMzZU8NbKRv4Og77ukJWdw/LPg
 7z7/ouMhMYuCF7h2rUY/Fc+1tdqLv/R51dHdB0KcHN7Ekin9aw7ECkSfIq3hOZFKm02d
 vmWiOoR6jKuaK6xeZ3c8RQlFQ7SHgzon1n2UjbIi3f5GdmKpb4DRSlwdwXT86DXewwLg
 9pUskDNs6Rt6wwYC9DAyIhQHpbXzoSCixxnW49nf3PWwG61zyzVz7K6NOpFJvMoHBSsT
 Pu4Plaatkeas6sNfWsp4AvObB3rjQTENzB6cRjez8WP5gIuiqpfFAybKmuJBjLDf3buo
 HIeQ==
X-Gm-Message-State: AGi0PuZLOdCB/gyBMu5uFJYOjB3+3iBzQokm1FnLg4itJzXeG541HNJZ
 +VeD1zqCzBHAg3iP0nBl/rjvEXc8iL94ZgKPggY=
X-Google-Smtp-Source: APiQypLZf74LwPBpTYXTJ9GR4vXb1ctcANv6Y0o2lRSo2eTWzHdfq22mdOYPLt5ZSvJ/rqzQ1KHuwiCeFT/95uxbJt4=
X-Received: by 2002:a63:5511:: with SMTP id j17mr4281090pgb.4.1587654325529;
 Thu, 23 Apr 2020 08:05:25 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200423142637eucas1p2ea543e281d96c75aa4292b49756f2146@eucas1p2.samsung.com>
 <20200423142627.1820-1-zhengdejin5@gmail.com>
 <081f8192-1708-80ff-6eef-885d72bdf5c5@samsung.com>
In-Reply-To: <081f8192-1708-80ff-6eef-885d72bdf5c5@samsung.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 23 Apr 2020 18:05:18 +0300
Message-ID: <CAHp75Vd8kC6ub-=pwe3QtdZ=FBqka3F1bbHea6__G5_Vm_ybcQ@mail.gmail.com>
Subject: Re: [PATCH v2] console: console: Complete exception handling in
 newport_probe()
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
Cc: linux-fbdev@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, FlorianSchandinat@gmx.de,
 Dejin Zheng <zhengdejin5@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 23, 2020 at 5:55 PM Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:

> > +     if (err)
> > +             iounmap((void *)npregs);
>
> Looks OK but while you are at it, could you please also add missing
> release_mem_region() on error and on device removal:
>
>         newport_addr = dev->resource.start + 0xF0000;
>         if (!request_mem_region(newport_addr, 0x10000, "Newport"))
>                 return -ENODEV;
>
>         npregs = (struct newport_regs *)/* ioremap cannot fail */
>                 ioremap(newport_addr, sizeof(struct newport_regs));
>         console_lock();
>         err = do_take_over_console(&newport_con, 0, MAX_NR_CONSOLES - 1, 1);
>         console_unlock();
>         return err;
> }
>
> static void newport_remove(struct gio_device *dev)
> {
>         give_up_console(&newport_con);
>         iounmap((void *)npregs);
> }
>
> ?

Don't you think that proper solution is rather switch to memremap()?

> >       return err;
> >  }

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
