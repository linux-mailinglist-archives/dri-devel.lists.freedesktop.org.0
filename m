Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E66A2D86DA
	for <lists+dri-devel@lfdr.de>; Sat, 12 Dec 2020 14:22:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8BD36E85A;
	Sat, 12 Dec 2020 13:22:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EEAF6E844;
 Sat, 12 Dec 2020 13:22:31 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id n1so6522827pge.8;
 Sat, 12 Dec 2020 05:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VTZpp0n/Om/Jf11Mz+DqRKpiaIjN4mJ897+taVy59Ug=;
 b=gs+DafSa6tm6ZhcmtOMAV2zOpZsgVdlfnJO3Cc8h6uZ7zEIkJ//kiGJiG610YJYd9c
 hi7RAK/gnCn0RzWdwMYCDo5iWNdBQbtvJKYrsQI5ZcoVP15/FlhWsHbcStHoxRpLv5K2
 7tZggztOJ5OrWHKSc7C0B5gdsPwG3Jh4XQNGDZzJ5uC91i9eb/FOwSgLNZwxuhvbJlm1
 NZRNGWscN+BvdnS2hdE/2kf8TIOM+A9TYoTVx3z4X0kR366gEuSlj/jqKKPOYQFh4Kj3
 5afdtXgK8N3xa39LgKIpCZwsKgk5qgska42v8wTbiGBbB+guXeCE2Frkke6P3b+dq3Ir
 zifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VTZpp0n/Om/Jf11Mz+DqRKpiaIjN4mJ897+taVy59Ug=;
 b=elUe3EVxoJomd+L+OwDLpkyuXi1PY6lIaL+yX9OxDv7A9JqwXBtlpEVh3rvN81upo9
 snBCsLUUAVdR5zMcBWrsUIlba6PMdvYrziakwIS9w3haj0tLdfqLci/AOr111dZBv5aP
 XLATsz34EgQ3RGMevWJy5PdITch4u5wSx7QPThz1BgJ6eOVdGpUNb9npIu5K92jJfRkr
 qEezTZH6OsyCXyPGZ4oJ+EbePsgEOpBGAjN0DNz7B9/z4b1oVwlhqBxThb6mH7e/oSXO
 HN4/GkUVRh+6QN/k5JXl4V4wjFAIhUVmBJKG9XNhzxFgnSf1767oPPPrT2G4Hd15ReMz
 +vvA==
X-Gm-Message-State: AOAM5323CDiL3iB0zpWrbO20PJ8sZ2jRMrXN/7xNXQEOpSRnwMapSiFu
 6YSwzM3LsZUs7qAd/CkoUCUO1BWziaHhRyQPJVw=
X-Google-Smtp-Source: ABdhPJz6qkGZaIbcK80z8oNTbmCmaNucZ+fxbrx52JjiY59cFl32wS2FAI0NK0C4i2f9nCp4IxJVJq78J8uiblnFRTg=
X-Received: by 2002:a05:6a00:170a:b029:19d:afca:4704 with SMTP id
 h10-20020a056a00170ab029019dafca4704mr15887538pfc.7.1607779350726; Sat, 12
 Dec 2020 05:22:30 -0800 (PST)
MIME-Version: 1.0
References: <20201210192536.118432146@linutronix.de>
 <20201210194042.860029489@linutronix.de>
 <CAHp75Vc-2OjE2uwvNRiyLMQ8GSN3P7SehKD-yf229_7ocaktiw@mail.gmail.com>
 <87h7osgifc.fsf@nanos.tec.linutronix.de>
 <87360cgfol.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87360cgfol.fsf@nanos.tec.linutronix.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 12 Dec 2020 15:22:14 +0200
Message-ID: <CAHp75Ve5zzeQw8P2wD083WW5+KGehETTy810wksfpXbj+3GBug@mail.gmail.com>
Subject: Re: [patch 03/30] genirq: Move irq_set_lockdep_class() to core
To: Thomas Gleixner <tglx@linutronix.de>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Saeed Mahameed <saeedm@nvidia.com>, netdev <netdev@vger.kernel.org>,
 Will Deacon <will@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 linux-s390@vger.kernel.org, afzal mohammed <afzal.mohd.ma@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Dave Jiang <dave.jiang@intel.com>, xen-devel@lists.xenproject.org,
 Leon Romanovsky <leon@kernel.org>,
 "open list:HFI1 DRIVER" <linux-rdma@vger.kernel.org>,
 Marc Zyngier <maz@kernel.org>, Helge Deller <deller@gmx.de>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 linux-pci <linux-pci@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, Wambui Karuga <wambui.karugax@gmail.com>,
 Allen Hubbe <allenbh@gmail.com>, Juergen Gross <jgross@suse.com>,
 David Airlie <airlied@linux.ie>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lee Jones <lee.jones@linaro.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-parisc@vger.kernel.org,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, LKML <linux-kernel@vger.kernel.org>,
 Tariq Toukan <tariqt@nvidia.com>, Jon Mason <jdmason@kudzu.us>,
 linux-ntb@googlegroups.com, intel-gfx <intel-gfx@lists.freedesktop.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Dec 12, 2020 at 12:07 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> On Fri, Dec 11 2020 at 22:08, Thomas Gleixner wrote:
>
> > On Fri, Dec 11 2020 at 19:53, Andy Shevchenko wrote:
> >
> >> On Thu, Dec 10, 2020 at 10:14 PM Thomas Gleixner <tglx@linutronix.de> wrote:
> >>>
> >>> irq_set_lockdep_class() is used from modules and requires irq_to_desc() to
> >>> be exported. Move it into the core code which lifts another requirement for
> >>> the export.
> >>
> >> ...
> >>
> >>> +       if (IS_ENABLED(CONFIG_LOCKDEP))
> >>> +               __irq_set_lockdep_class(irq, lock_class, request_class);
> >
> > You are right. Let me fix that.
>
> No. I have to correct myself. You're wrong.
>
> The inline is evaluated in the compilation units which include that
> header and because the function declaration is unconditional it is
> happy.
>
> Now the optimizer stage makes the whole thing a NOOP if CONFIG_LOCKDEP=n
> and thereby drops the reference to the function which makes it not
> required for linking.
>
> So in the file where the function is implemented:
>
> #ifdef CONFIG_LOCKDEP
> void __irq_set_lockdep_class(....)
> {
> }
> #endif
>
> The whole block is either discarded because CONFIG_LOCKDEP is not
> defined or compile if it is defined which makes it available for the
> linker.
>
> And in the latter case the optimizer keeps the call in the inline (it
> optimizes the condition away because it's always true).
>
> So in both cases the compiler and the linker are happy and everything
> works as expected.
>
> It would fail if the header file had the following:
>
> #ifdef CONFIG_LOCKDEP
> void __irq_set_lockdep_class(....);
> #endif
>
> Because then it would complain about the missing function prototype when
> it evaluates the inline.

I understand that (that's why I put "if even no warning") and what I'm
talking about is the purpose of IS_ENABLED(). It's usually good for
compile testing !CONFIG_FOO cases. But here it seems inconsistent.

The pattern I usually see in the cases like this is

 #ifdef CONFIG_LOCKDEP
 void __irq_set_lockdep_class(....);
 #else
 static inline void ... {}
 #endif

and call it directly in the caller.

It's not a big deal, so up to you.

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
