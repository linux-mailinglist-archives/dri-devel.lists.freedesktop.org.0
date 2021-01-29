Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD663094DB
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jan 2021 12:29:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03BF06ECC2;
	Sat, 30 Jan 2021 11:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 269B26EB16
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 12:54:54 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id r38so6586568pgk.13
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 04:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=hEFtshIJPKNSQZ+CC0supJzNPIjoTkOgp8j1yQcbZhI=;
 b=B49bAVMmMWCyao1WgFn6Dw5fLu30hjmYlejPf1p/6p4S1Nf0Ct6eVyiAcixZ+lC1no
 Nj9NY5K6yxO9eb6xJZyE14yGoVyFHfdahcfSqAS/vovupBiI3QATrR4KJ5w+53btcpqv
 1LFcc7TqeREXy3kYtiPHnpN8ABEp6ACgYRJOmXCW8GJMa/2qBeig9oeFHkpojK03wZUN
 mxdMj0LLyT6U6o6lhgYjFM/hZJZVYipUHvi4WE2i3SPkh/zqs6vuq0rhYY614g073r3r
 T9cGQTS3RKenOAJESbPA3JShLeq3vDs0B4/ZBWCQNadDSRG5nP72sR1HCS9sCx0gp/Bq
 hS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=hEFtshIJPKNSQZ+CC0supJzNPIjoTkOgp8j1yQcbZhI=;
 b=gbqZXogHV8HeF4Jqg5bpOoUpiJj3x4wtmZHBMVel2marFimQZX2UvKqgC0/KrDZQ8O
 G3lWVlBPVBvy+GpZq6VM8Fyj4ZenjBgsH4GDZ1bZNKk1nOMc0xU5NQ4Fi6Xb1/AdpqRM
 9PtVYs7I93woStiFoZxnpOu3yxaTCVSeSsvyHV/RfODHWJEmVj6SQtyKHfdORHjk5lhX
 s8x7fSbPRQlD25b8XBOoF/DhEVL6Ia2we8AhFA54vA6by3w1Ey7FQu4h14TQ2BMVHkyC
 bKwh1Q8xfjkVcXYat8qcJULZacf399xIoirXXrLKwnpNOkeUpvX0jlvryJm8DJOqqyMf
 qRZg==
X-Gm-Message-State: AOAM53394A/xbwrfDVGQ4lmlzQRkwH3xAhJnaW7hTQ0A4gyomdobxXwv
 Im4MxRBnSIvsQ57LQvh38/g=
X-Google-Smtp-Source: ABdhPJyXCt2fIv2Ld4WrkceGfcg/wM0H8EGE5oOM/aWMgQeVI+RaaeUKcdVGuowoyh8ppXslv9Y6BA==
X-Received: by 2002:a63:5014:: with SMTP id e20mr4647413pgb.152.1611924893831; 
 Fri, 29 Jan 2021 04:54:53 -0800 (PST)
Received: from localhost ([103.220.76.197])
 by smtp.gmail.com with ESMTPSA id a2sm8861568pgq.94.2021.01.29.04.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 04:54:53 -0800 (PST)
Date: Fri, 29 Jan 2021 20:54:47 +0800
From: carlis <zhangxuezhi3@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v12] staging: fbtft: add tearing signal detect
Message-ID: <20210129205447.0000464f@gmail.com>
In-Reply-To: <CAHp75Vdi4H_zY3+QPSq_wmdf20B9xPeqsOT10JHfMLJESX77gA@mail.gmail.com>
References: <1611838435-151774-1-git-send-email-zhangxuezhi3@gmail.com>
 <CAHp75Vd=ijxnamuSYuxNLeyhGMCod=HaXWrQ0W0+3QCsQAychg@mail.gmail.com>
 <20210129130110.00003bb1@gmail.com>
 <CAHp75Vdi4H_zY3+QPSq_wmdf20B9xPeqsOT10JHfMLJESX77gA@mail.gmail.com>
Organization: Tyzmig-ryrjum-8kedto
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 30 Jan 2021 11:28:30 +0000
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

On Fri, 29 Jan 2021 12:23:08 +0200
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Fri, Jan 29, 2021 at 7:01 AM carlis <zhangxuezhi3@gmail.com> wrote:
> > On Thu, 28 Jan 2021 16:33:02 +0200
> > Andy Shevchenko <andy.shevchenko@gmail.com> wrote:  
> > > On Thu, Jan 28, 2021 at 2:58 PM Carlis <zhangxuezhi3@gmail.com>
> > > wrote:
> > >
> > > Thanks for your contribution, my comments below.
> > >  
> > > > From: zhangxuezhi <zhangxuezhi1@yulong.com>  
> > >
> > > You probably have to configure your Git to use the same account
> > > for author and committer.  
> >
> > hi,you mean like below:
> >         Carlis <zhangxuezhi1@yulong.com>
> > ?  
> 
> I meant that you shouldn't probably have a From: line in the commit
> message.
> 
> ...
> 
> > hi, i have modified it according to your suggestion like below:  
> 
> Please, go again thru my comments and comments from others and
> carefully address all of them everywhere in your contribution. If you
> have questions, ask them in reply in the corresponding context.
> 
> ...
> 
> > /**
> >  * init_tearing_effect_line() - init tearing effect line  
> 
> >  *  
> 
> For example, above was commented on and hasn't been addressed here.
> 
> >  * @par: FBTFT parameter object
> >  *
> >  * Return: 0 on success, < 0 if error occurred.
> >  */
> > static int init_tearing_effect_line(struct fbtft_par *par)
> > {
> >         struct device *dev = par->info->device;
> >         struct gpio_desc *te;
> >         int rc;
> >
> >         te = gpiod_get_optional(dev, "te", GPIOD_IN);
> >         if (IS_ERR(te))
> >                 return dev_err_probe(dev, PTR_ERR(te), "Failed to
> >         request te GPIO\n");
> >  
> 
> >         if (te) {  
> 
> This one is not like I suggested.
I don't think I have a problem here, if te GPIO is not configured, it
should return NULL, if it is configured, it should be greater than 0 
> 
> >                 par->irq_te = gpiod_to_irq(te);
> >                 gpiod_put(te);
> >  
> 
> >                 if (par->irq_te) {  
> 
> This is wrong.
> 
> >                         rc = devm_request_irq(dev,
> >                                               par->irq_te,
> >                 panel_te_handler,
> >                                               IRQF_TRIGGER_RISING,
> >                 "TE_GPIO", par);  
> 
> Try to use less LOCs.

LOCs???? i can not get you 
> 
> >                         if (rc)
> >                                 return dev_err_probe(dev, rc, "TE
> > IRQ request failed.\n");
> >
> >                         disable_irq_nosync(par->irq_te);
> >                         init_completion(&par->panel_te);  
> 
> >                 } else {
> >                         return dev_err_probe(dev, par->irq_te,
> > "gpiod to TE IRQ failed.\n");
> >                 }  
> 
> Again, it is not what had been suggested.
> 
> >         }
> >
> >         return 0;
> > }  
> 
> The rest is better, but we will see later on when you submit a new
> version (And I feel it won't be last).
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
