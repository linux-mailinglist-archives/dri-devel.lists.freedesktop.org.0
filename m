Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC373070DB
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:16:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D456E904;
	Thu, 28 Jan 2021 08:15:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7064989F63
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 09:26:37 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id w14so826402pfi.2
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 01:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=VlZoZLBDHB4T/YMJIRvfZ215W20PBGmlP7rUa/kbeTE=;
 b=Rx6L/dzb+PTIyI7DqI/ktCHUMBm59DVOBMgR7YEtBRsitAiGP0B3mtvfCX5iqklZhq
 VXzl1QYGhSzgyS3d1UER9u9RkDlvCMnyGb0Z5wJKnXiBqh4pTGhN/E28k/apx6Z9imhW
 c95BvtjoreLkwhzwlCPSurK+3AVgYTsvqT7/24d6ProSzBX+FM4w3DhX5ni4/r9yKq44
 4ONeHfdbfLjPvWivYr0EP8gKpMebu2NmDwHyYnnKCLrt1QJK3eSmtGr7OcdxwmIrPBKG
 OtSaLuaUZxmyHalSyJEP/bn/Uuw4+pIdhdWyORK2s7NmPPRTqIa9NxVY02LrEX3jCrbS
 5sIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=VlZoZLBDHB4T/YMJIRvfZ215W20PBGmlP7rUa/kbeTE=;
 b=LH8IDlDQTiChss7xouxlMvbbpnPrjH05RBs+hG0poILHSfioqAdk2inUP7wkvogX4v
 XgJkJ9EnA0nu0CfSllrQAwIOPYq5zlx1Ig3h23lXKAtq5fB4Lo4dJEIfvPWQv+XCXsrD
 W88MEPSL9tG2Ivqw8zr7wFPmJpuZH2fm31vCy0iFJZlSeKmKiEg8CWZHZibs3BYxKHjG
 QTZdgnEJdZw0kZO+DiFza2vGKO0Bjej6+bKmb5zJn8ulYGuhmT+noe1CyCu1EkXArJTL
 cgFou6yWZ8IXzFqUcmr1BnH5L4uHhigp9Hez2rUpLHr1t4jGm1bWHotVzyYbMf4pXPqA
 ZLpw==
X-Gm-Message-State: AOAM5338c26GFYSZF7BpKGLRFnSurQPD1RRoSmMoiJYzwiCISbsMXEJp
 WD9AbHkH6aXmuKE4sAho7Uk=
X-Google-Smtp-Source: ABdhPJxk9kiZWo3vZgXC5SEmEnufwVt5fJXqLZTuie25SOyDno9HYRBGpqPOmD+gQGQ5rRynQeJcsw==
X-Received: by 2002:a65:4385:: with SMTP id m5mr10413483pgp.296.1611739597098; 
 Wed, 27 Jan 2021 01:26:37 -0800 (PST)
Received: from localhost ([103.220.76.197])
 by smtp.gmail.com with ESMTPSA id a21sm1829002pgd.57.2021.01.27.01.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 01:26:36 -0800 (PST)
Date: Wed, 27 Jan 2021 17:26:31 +0800
From: carlis <zhangxuezhi3@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v6] fbtft: add tearing signal detect
Message-ID: <20210127172631.00001846@gmail.com>
In-Reply-To: <CAMuHMdV5VxNBNV-UMswKKZmQRFUvG+pnBbOOW8XJT8pbbvmp5Q@mail.gmail.com>
References: <1611732502-99639-1-git-send-email-zhangxuezhi3@gmail.com>
 <CAMuHMdV5VxNBNV-UMswKKZmQRFUvG+pnBbOOW8XJT8pbbvmp5Q@mail.gmail.com>
Organization: Tyzmig-ryrjum-8kedto
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:36 +0000
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
Cc: driverdevel <devel@driverdev.osuosl.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 mh12gx2825@gmail.com, Greg KH <gregkh@linuxfoundation.org>,
 oliver.graute@kococonnector.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Stefano Brivio <sbrivio@redhat.com>, Colin King <colin.king@canonical.com>,
 zhangxuezhi1@yulong.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 27 Jan 2021 10:00:13 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Carlis,
> 
> On Wed, Jan 27, 2021 at 9:52 AM Carlis <zhangxuezhi3@gmail.com> wrote:
> > From: zhangxuezhi <zhangxuezhi1@yulong.com>
> >
> > For st7789v ic,add tearing signal detect to avoid screen tearing
> >
> > Signed-off-by: zhangxuezhi <zhangxuezhi1@yulong.com>  
> 
> Thanks for your patch!
> 
> > --- a/drivers/staging/fbtft/fb_st7789v.c
> > +++ b/drivers/staging/fbtft/fb_st7789v.c  
> 
> > @@ -82,6 +111,34 @@ enum st7789v_command {
> >   */
> >  static int init_display(struct fbtft_par *par)
> >  {
> > +       int rc;
> > +       struct device *dev = par->info->device;
> > +
> > +       par->gpio.te = devm_gpiod_get_index_optional(dev, "te", 0,
> > GPIOD_IN);
> > +       if (IS_ERR(par->gpio.te)) {
> > +               rc = PTR_ERR(par->gpio.te);
> > +               pr_err("Failed to request te gpio: %d\n", rc);
> > +               par->gpio.te = NULL;  
> 
> Errors (e.g. -EPROBE_DEFER) should be propagated upstream,
> not ignored.
> 
> > +       }
> > +       if (par->gpio.te) {
> > +               init_completion(&spi_panel_te);
> > +               mutex_init(&te_mutex);
> > +               rc = devm_request_irq(dev,
> > +                                     gpiod_to_irq(par->gpio.te),
> > +                                    spi_panel_te_handler,
> > IRQF_TRIGGER_RISING,
> > +                                    "TE_GPIO", par);
> > +               if (rc) {
> > +                       pr_err("TE request_irq failed.\n");
> > +                       devm_gpiod_put(dev, par->gpio.te);
> > +                       par->gpio.te = NULL;  
> 
> Errors (e.g. -EPROBE_DEFER) should be propagated upstream,
> not ignored.
> 
> > +               } else {
> > +
> > disable_irq_nosync(gpiod_to_irq(par->gpio.te));
> > +                       pr_info("TE request_irq completion.\n");
> > +               }
> > +       } else {
> > +               pr_info("%s:%d, TE gpio not specified\n",
> > +                       __func__, __LINE__);
> > +       }
> >         /* turn off sleep mode */
> >         write_reg(par, MIPI_DCS_EXIT_SLEEP_MODE);
> >         mdelay(120);  
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

hi,i will fix in the patch v7
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
