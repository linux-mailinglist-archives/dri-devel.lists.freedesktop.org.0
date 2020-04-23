Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0BC1B6726
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 00:52:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2729E6EA20;
	Thu, 23 Apr 2020 22:52:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2222F6E8F1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 16:04:01 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id f7so3160434pfa.9
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 09:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QRRSRzv3ELZyPDBdtIE45poUqjMQaq7ox4Jm7P7/zG8=;
 b=R1yAor3At9e+xtBhUr6dlgl7zNXUVenScXyHMgcn6IEG2US+/UvODrE8lbtPt/gLs/
 fbWEVj/JWvpO34kH3WTmFqm02fkOHuQ7PhIiONd8EUu3SW3XtYCNPbk92Xa4fdfbrRE1
 PXQd0r0F2W4Fp10i4ld1cmfne4gSHWf8NyMjtGLwvuq4GJmQJABiDyvshdytsc4Dk0Rx
 e//SCLAP6/rdoNEqY0IdCqIT3FibTx1vI72kTE3eLnhpUYI2ZreFg08S9YtkGEs0zhOt
 WX9FXySSlDXshp0yLq17w2rYTW0o1mmx/y55DH11xOJlY8NmfYyv7tfqjERP5kVDnBrD
 Eccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QRRSRzv3ELZyPDBdtIE45poUqjMQaq7ox4Jm7P7/zG8=;
 b=gSelEToUZTeMkvw3AQfKBpXSVZYKBh1DhZkD0DPrf0/bb8r1hWLaF0ndnO/eGhkCdj
 VRLwpriJdE+aH7UGEtCjWvRclFFYnCdiZqYZp8vua+WZYHe/GaOP/7qOawAe4B/Pwudf
 LHJgY/qg7gjeUMr/RgU3tZM6UM42ULEQ5nxLDPTS4V3O3DBOIIlCmC2RdKwnCTtP0+BE
 CRAOIDpLQwO38W1RJBcRrQmi3UA4x5lvUa6gcBZb7tViy6WFSHTQ2V1i0+86Pv7z52jw
 KDi3X8kq85IdOQrt7pq48yRbpQJEruM8U4VVTCSJJoc9ifsfLGi2Y2RNgXtvmxojCU8q
 dBVg==
X-Gm-Message-State: AGi0PubMgYDOPLU56htJY5dIg5bsGlARxnyZiHgefQobwneou+iQT4pT
 ckWUhkTQxCUPU00e+M7mQ00=
X-Google-Smtp-Source: APiQypJNoUyWvf19ibvNaStq1WA8/4V2tFh9qQrvtbqG8Us89/iEAV2d0p9Nj6pt/PJyn6r+TTHe8Q==
X-Received: by 2002:aa7:82d4:: with SMTP id f20mr4501737pfn.253.1587657840767; 
 Thu, 23 Apr 2020 09:04:00 -0700 (PDT)
Received: from localhost (176.122.158.71.16clouds.com. [176.122.158.71])
 by smtp.gmail.com with ESMTPSA id a200sm2867954pfa.201.2020.04.23.09.03.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 Apr 2020 09:04:00 -0700 (PDT)
Date: Fri, 24 Apr 2020 00:03:56 +0800
From: Dejin Zheng <zhengdejin5@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] console: console: Complete exception handling in
 newport_probe()
Message-ID: <20200423160356.GA2538@nuc8i5>
References: <20200423142627.1820-1-zhengdejin5@gmail.com>
 <CAHp75Vf1_SMk=_WDUrB97BGR6K6EXOdtgQ92=hTyMdVUoyWQiw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75Vf1_SMk=_WDUrB97BGR6K6EXOdtgQ92=hTyMdVUoyWQiw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 23 Apr 2020 22:50:35 +0000
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
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, FlorianSchandinat@gmx.de,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 23, 2020 at 05:52:09PM +0300, Andy Shevchenko wrote:
> On Thu, Apr 23, 2020 at 5:26 PM Dejin Zheng <zhengdejin5@gmail.com> wrote:
> >
> > A call of the function do_take_over_console() can fail here.
> > The corresponding system resources were not released then.
> > Thus add a call of the function iounmap() together with the check
> > of a failure predicate.
> 
> ...
> 
> > CC: Andy Shevchenko <andy.shevchenko@gmail.com>
> 
> Use Cc: Better to read.
>
I will pay attention to the next submission, thanks.

> ...
> 
> > v1 -> v2:
> >         - modify the commit comments by Markus'suggestion.
> 
> What suggestion? You need to be clear in changelog what exactly has
> been done without looking to any previous mail.
>
The commit comments have some more appropriate instructions by
Markus'suggestion. here is my first version commit comments:

if do_take_over_console() return an error in the newport_probe(),
due to the io virtual address is not released, it will cause a leak.

Thnaks!

> ...
> 
> >         console_lock();
> >         err = do_take_over_console(&newport_con, 0, MAX_NR_CONSOLES - 1, 1);
> >         console_unlock();
> > +
> > +       if (err)
> > +               iounmap((void *)npregs);
> >         return err;
> >  }
> 
> I have briefly looked at the code (it is actually quite old one!), and
> I think this is half-baked solution, besides the fact of missed
> __iomem annotation and useless explicit casting.
> The proper one seems to switch to memremap() and do memunmap() here.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
