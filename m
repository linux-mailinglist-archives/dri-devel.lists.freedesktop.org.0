Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9580307120
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:17:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A096E93C;
	Thu, 28 Jan 2021 08:16:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECBB489CCB
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 14:03:29 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id l18so1423060pji.3
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 06:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=Rm0ICr4+gWtimOBm/Mxt0G53NyPrN1eFZSwJiNK3hWs=;
 b=KEQUBMhMDJ9TfyDfOif7F0kRrW9aEPKZIr8D8LhjegOZu7ZflSg0kfzCl+pPeA0L0m
 bpxBsRWWkvx3jGY1eg6Ejx7eSvjsd2UP6PLLTpWqAvYlS1irAc8DpR0FTC89F1O+Rrvx
 kiZlGg0m80oVkQZ3L9e3oPnU+05vjunleQIeeDPXpdddVrlDTzcsuzrvSgEEkwd7GoEZ
 ywhhCwBHkoXhiSIQJbYng9UhePzUxH3jWhafmEXpr/t7qpNYD3dslMUxS7IqmQWZfwJI
 PybZJBnjFbmikkGLL5NELmObI8d93WGh9c0QVix51YF3LLj8Lr1P8KIMhlzAxlZ1LzUZ
 VgXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=Rm0ICr4+gWtimOBm/Mxt0G53NyPrN1eFZSwJiNK3hWs=;
 b=MCxbc2FK4dAMETRb6dyNBRbp/0ZnaAsPU39MgC/pzFZTnnYzBxz9nLhWvxVtueGarf
 zn39oyocFOXoVQh6aD4UCp6Dbj8LIg9+CG+l2d80ipcbZqzsQbOeA9nCqRv4QsVCXMTv
 BZq8p90WvOEYEEF2qlEHLvzPV3NUm2uYplxladfLFaZEO7NTXWU6rsXxN/fbbBX3vps7
 sn3Bd0iOzAqGXytLvJzIsZjRIkknK1htiAdo3StSBiwOwEAQx9us0TrPqXxcrvCKyuBu
 ZvOsGdP8s5jGDeI/XRf0Ociwgff9qlQGX65+45z/L3JnXVarw6DlXckSOkZVQYNopCxB
 JY3Q==
X-Gm-Message-State: AOAM533IgPf/HdiWoLGdWJ4uiVwzVFqmUDbLsOioCeNqgywlcI6orbEv
 OS2PpA4gN8cE2fiX1JzFXrw=
X-Google-Smtp-Source: ABdhPJydrXhdwuBTn7I8gPbvmJ5xFHq43eHnRQMEk6NQOg682yGlA8XRBj0RwNK2AJvIMbbllFSEYQ==
X-Received: by 2002:a17:90a:bc49:: with SMTP id
 t9mr5880493pjv.95.1611756209669; 
 Wed, 27 Jan 2021 06:03:29 -0800 (PST)
Received: from localhost ([103.220.76.197])
 by smtp.gmail.com with ESMTPSA id 6sm2615255pgo.17.2021.01.27.06.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 06:03:28 -0800 (PST)
Date: Wed, 27 Jan 2021 22:03:23 +0800
From: carlis <zhangxuezhi3@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v9] staging: fbtft: add tearing signal detect
Message-ID: <20210127220323.00007922@gmail.com>
In-Reply-To: <CAMuHMdV=dsLv0stGa8OThOYLz2xG0Gg7EOYuFcKBeu+T_wANuw@mail.gmail.com>
References: <1611752257-150851-1-git-send-email-zhangxuezhi3@gmail.com>
 <CAMuHMdV=dsLv0stGa8OThOYLz2xG0Gg7EOYuFcKBeu+T_wANuw@mail.gmail.com>
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

On Wed, 27 Jan 2021 14:47:04 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Carlis,
> 
> On Wed, Jan 27, 2021 at 2:03 PM Carlis <zhangxuezhi3@gmail.com> wrote:
> > From: zhangxuezhi <zhangxuezhi1@yulong.com>
> >
> > For st7789v ic,add tearing signal detect to avoid screen tearing
> >
> > Signed-off-by: zhangxuezhi <zhangxuezhi1@yulong.com>
> > ---
> > v9: change pr_* to dev_*  
> 
> Thanks for the update!
> 
> > --- a/drivers/staging/fbtft/fb_st7789v.c
> > +++ b/drivers/staging/fbtft/fb_st7789v.c
> > @@ -9,9 +9,12 @@
> >  #include <linux/delay.h>
> >  #include <linux/init.h>
> >  #include <linux/kernel.h>
> > +#include <linux/mutex.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/completion.h>
> >  #include <linux/module.h>
> >  #include <video/mipi_display.h>
> > -
> > +#include <linux/gpio/consumer.h>
> >  #include "fbtft.h"
> >
> >  #define DRVNAME "fb_st7789v"
> > @@ -66,6 +69,32 @@ enum st7789v_command {
> >  #define MADCTL_MX BIT(6) /* bitmask for column address order */
> >  #define MADCTL_MY BIT(7) /* bitmask for page address order */
> >
> > +#define SPI_PANEL_TE_TIMEOUT   400
> > +static struct mutex te_mutex;/*mutex for tearing line*/
> > +static struct completion spi_panel_te;
> > +
> > +static irqreturn_t spi_panel_te_handler(int irq, void *data)
> > +{
> > +       complete(&spi_panel_te);
> > +       return IRQ_HANDLED;
> > +}
> > +
> > +static void set_spi_panel_te_irq_status(struct fbtft_par *par,
> > bool enable) +{
> > +       static int te_irq_count;
> > +
> > +       mutex_lock(&te_mutex);
> > +
> > +       if (enable) {
> > +               if (++te_irq_count == 1)
> > +                       enable_irq(gpiod_to_irq(par->gpio.te));
> > +       } else {
> > +               if (--te_irq_count == 0)
> > +                       disable_irq(gpiod_to_irq(par->gpio.te));
> > +       }
> > +       mutex_unlock(&te_mutex);
> > +}
> > +
> >  /**
> >   * init_display() - initialize the display controller
> >   *
> > @@ -82,6 +111,33 @@ enum st7789v_command {
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
> > +               dev_err(par->info->device, "Failed to request te
> > gpio: %d\n", rc);  
> 
> This also prints an error in case of -EPROBE_DEFER.
> dev_err_probe()?
> 
> > +               return rc;
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
> > +                       dev_err(par->info->device, "TE request_irq
> > failed.\n");
> > +                       devm_gpiod_put(dev, par->gpio.te);  
> 
> No need to call devm_gpiod_put() here, as it's managed automatically.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

hi,i will fix in patch v11
regards
zhangxuezhi1


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
