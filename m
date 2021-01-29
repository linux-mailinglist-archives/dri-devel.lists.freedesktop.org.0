Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7724B3094D1
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jan 2021 12:29:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D786ECAC;
	Sat, 30 Jan 2021 11:29:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 940DC6EB18
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 12:47:41 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id md11so5756842pjb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 04:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=gey6ZY0toHv6VOmxg4G7/z9gStOYikqSFh5g6TpL77g=;
 b=vXuqtJc1idgNU9yQCo/fp7Ab+usyyyfz1rSAqGtMgWtscmTnt8AT0BdLItHL2GlrXk
 gkQmfIP6Z4ygt7lY4rgpNd/7dGSgSR7JEiYxoOkcy5wpVlMS0eYu0/UgLLUPxNt1kMLS
 b2E/+9KjqTf9Q9BOZMpWXbC+Hdn1uGfY0NqP4oA7G2kArYNox63IVCU3KqqkVF9TdIWY
 6ukXjx71x12HkKZTJJ2sapPY+W13ItMFJmVurVOiPIuqBc18o4LXBawyUsaNk/SKg8qc
 9+pZHOFFQ7TifaeYRrP4QKIDZU5g4SrAkESSsWNbFKMZ1o2boq4S3tpqHNQVh3nriy8Y
 KgKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=gey6ZY0toHv6VOmxg4G7/z9gStOYikqSFh5g6TpL77g=;
 b=AE8lLB9J5jhgYioYvKGPJTk1ipibiuF6HRsCdi9erAutGNXG9tjQMZPtHwa9pmq/Fe
 TIpHefd3JYQZPOFDGrQy6Q7X+ntID3Q1erEHEvA+7FDv+Ykt3HWonpTPNncR9dYxQ4zl
 JAEVzAIfzsmA9C2tfwrAoCEea9kuxJn8p0Ufrp2AJK4d0VfQW83kpqWO3fLPuMCj/hFK
 2BgIOKOKO2rkgw9bD9bM7TkFUuTZpzznAXhbITaaZsC+9hBwFhg1Ov+W//LDmLIAywxz
 O3b+h5e88PrTxvMtVN27zHYsIPlphceV4//ryzOd4HBsszZYxXeqAD3KMOFlJA3elsTF
 AFlA==
X-Gm-Message-State: AOAM530L4wQDpnhWKooRz9uHOwncLxIlAkVgyh1tj/XuA8tV9VXOABcy
 bnaaEYSggVB0FscMmnNjfHQ=
X-Google-Smtp-Source: ABdhPJzrUKpZVmxy7aREzbzLAECwsJsp1TVGwWCQ4IACdk/D7pTSz/Vr2FguW3H0pi0FGnZzWRgFdw==
X-Received: by 2002:a17:902:ab93:b029:df:f681:cdf3 with SMTP id
 f19-20020a170902ab93b02900dff681cdf3mr4248655plr.28.1611924461212; 
 Fri, 29 Jan 2021 04:47:41 -0800 (PST)
Received: from localhost ([103.220.76.197])
 by smtp.gmail.com with ESMTPSA id 21sm8415028pfh.56.2021.01.29.04.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 04:47:40 -0800 (PST)
Date: Fri, 29 Jan 2021 20:47:33 +0800
From: carlis <zhangxuezhi3@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v12] staging: fbtft: add tearing signal detect
Message-ID: <20210129204733.00003954@gmail.com>
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
hi,here i can not get you.....
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
Why? My thinking is that if the TE is not configured and NULL is
returned, the initialization can still proceed.....
> 
> >                 par->irq_te = gpiod_to_irq(te);
> >                 gpiod_put(te);
> >  
> 
> >                 if (par->irq_te) {  
> 
> This is wrong.

Why? i have read gpiod_to_irq code, if an error occurs, a negative
value is returned, and zero is not possible,so I need this value to
determine if TE IRQ is configured

> 
> >                         rc = devm_request_irq(dev,
> >                                               par->irq_te,
> >                 panel_te_handler,
> >                                               IRQF_TRIGGER_RISING,
> >                 "TE_GPIO", par);  
> 
> Try to use less LOCs.
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
