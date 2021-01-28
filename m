Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8C13070E7
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:16:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B5F6E90A;
	Thu, 28 Jan 2021 08:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 668DB6E8C5
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 06:52:37 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id f11so5027828ljm.8
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 22:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0f8ZmrzuRXVxsk0SyBLitP6T9N64hUKSEphOtPuOnnU=;
 b=s+g+9RsgEvfyHBAfUcVSsvVK/MPPAhyVtK61GUGybbJo3USYD2l22Xsq5KyeCpb0f/
 l1xM12+qQnzcDbEEwE5NLLvrD1GkzD3o6ODrZXwCpwUiuHBGvcW4/gcxN7/QesOCbvRw
 qZzz213l28pva/a4EMbmsfli5alFUpJDcK/5ctFYL7S4mKgjcuLe+HBeNwfv31f6o592
 eefP7qqqkvXrSvxcezl8+8YrbiZi7tbRSVFNpUxApCFR8x48GWr/a6UXw8+gm5GA7cXU
 PldFlVfnAt6ruHdg4Fzwg0D6SryNeBQPFysHDqBV57Tk611P+KNV7o5H2hSK6tRoFJHJ
 a9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0f8ZmrzuRXVxsk0SyBLitP6T9N64hUKSEphOtPuOnnU=;
 b=tvYjczFd8v7ZB9QQMSVHoVq49ZUWa/MDzYnGe5ZgLeiHDxSuSTUtND/NL6kiydlQk/
 HW5/wIBAd80C51HVT0YeaElAMIy6CqAB3Of0mVedK3/maZI9AhLe+Kq0Pv6iYUjVKzrz
 xwL7HZzC29UBQOaKa5bXVYoc+lC3QRXbOhDGcu58CVqsqxMoMZy+zME2S9OqG0QYl2+n
 B43G1/umVM4tIjpFnmhJrwWtThr+Ga40acrhYieohRO5ot1PzwC5MxJowLk64Qbz7urz
 jcaCcTHbrkQJ032awSnGieaIy2UCkFwPAavupKLWGInamEfheNdU5zASE8xBz3vG2wyC
 HONQ==
X-Gm-Message-State: AOAM533UvpJ3r0WvxIDjqnKRhjQ39zX6dA5MYfespmXLZHcvQzG5hZ1g
 WAkVYiRJKVgBzrvUeTpXzvI=
X-Google-Smtp-Source: ABdhPJzrGUlABaISZ4hc6GbDuExEK/6vRiKAKwuM77hmE1jRQLaxmTiugZ80sCFhjv+vgSxmjuzXCw==
X-Received: by 2002:a2e:8106:: with SMTP id d6mr7678908ljg.217.1611816755777; 
 Wed, 27 Jan 2021 22:52:35 -0800 (PST)
Received: from kari-VirtualBox (87-95-193-210.bb.dnainternet.fi.
 [87.95.193.210])
 by smtp.gmail.com with ESMTPSA id o4sm1313687lfo.231.2021.01.27.22.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 22:52:35 -0800 (PST)
Date: Thu, 28 Jan 2021 08:52:33 +0200
From: Kari Argillander <kari.argillander@gmail.com>
To: carlis <zhangxuezhi3@gmail.com>
Subject: Re: [PATCH v10] staging: fbtft: add tearing signal detect
Message-ID: <20210128065233.ji4b7ea54ihyu2l5@kari-VirtualBox>
References: <1611754972-151016-1-git-send-email-zhangxuezhi3@gmail.com>
 <20210127223222.3lavtl3roc4cabso@kari-VirtualBox>
 <20210128094258.000012c3@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210128094258.000012c3@gmail.com>
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:35 +0000
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
Cc: devel@driverdev.osuosl.org, linux-fbdev@vger.kernel.org,
 mh12gx2825@gmail.com, gregkh@linuxfoundation.org,
 oliver.graute@kococonnector.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sbrivio@redhat.com, colin.king@canonical.com,
 zhangxuezhi1@yulong.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 28, 2021 at 09:42:58AM +0800, carlis wrote:
> On Thu, 28 Jan 2021 00:32:22 +0200
> Kari Argillander <kari.argillander@gmail.com> wrote:
> > >  #include "fbtft.h"
> > >  
> > >  #define DRVNAME "fb_st7789v"
> > > @@ -66,6 +69,32 @@ enum st7789v_command {
> > >  #define MADCTL_MX BIT(6) /* bitmask for column address order */
> > >  #define MADCTL_MY BIT(7) /* bitmask for page address order */
> > >  
> > > +#define SPI_PANEL_TE_TIMEOUT	400 /* msecs */
> > > +static struct mutex te_mutex;/* mutex for set te gpio irq status
> > > */  
> > 
> > Space after ;
> hi, i have fix it in the patch v11
> > 

Yeah sorry. I accidentally review wrong patch. But mostly stuff are
still relevant.

> > > @@ -82,6 +111,33 @@ enum st7789v_command {
> > >   */
> > >  static int init_display(struct fbtft_par *par)
> > >  {
> > > +	int rc;
> > > +	struct device *dev = par->info->device;
> > > +
> > > +	par->gpio.te = devm_gpiod_get_index_optional(dev, "te", 0,
> > > GPIOD_IN);
> > > +	if (IS_ERR(par->gpio.te)) {
> > > +		rc = PTR_ERR(par->gpio.te);
> > > +		dev_err(par->info->device, "Failed to request te
> > > gpio: %d\n", rc);
> > > +		return rc;
> > > +	}  
> > 
> > You request with optinal and you still want to error out? We could
> > just continue and not care about that error. User will be happier if
> > device still works somehow.
> You mean i just delete this dev_err print ?!
> like this:
> 	par->gpio.te = devm_gpiod_get_index_optional(dev, "te",
> 0,GPIOD_IN); 
>         if (IS_ERR(par->gpio.te))
> 		return PTR_ERR(par->gpio.te);

Not exactly. I'm suggesting something like this.

if (IS_ERR(par->gpio.te) == -EPROBE_DEFER) {
	return -EPROBE_DEFER;

if (IS_ERR(par->gpio.te))
	par-gpio.te = NULL;

This like beginning of your patch series but the difference is that if
EPROBE_DEFER then we will try again later. Any other error and we will
just ignore TE gpio. But this is up to you what you want to do. To me
this just seems place where this kind of logic can work.

> > > +		if (par->gpio.te) {
> > > +			set_spi_panel_te_irq_status(par, true);
> > > +			reinit_completion(&spi_panel_te);
> > > +			ret =
> > > wait_for_completion_timeout(&spi_panel_te,
> > > +
> > > msecs_to_jiffies(SPI_PANEL_TE_TIMEOUT));
> > > +			if (ret == 0)  
> > 
> > !ret
> > 
> > > +				dev_err(par->info->device, "wait
> > > panel TE time out\n");
> > > +		}
> > > +		ret = par->fbtftops.write(par, par->txbuf.buf,
> > > +					 startbyte_size + to_copy
> > > * 2);
> > > +		if (par->gpio.te)
> > > +			set_spi_panel_te_irq_status(par, false);
> > > +		if (ret < 0)
> > > +			return ret;
> > > +		remain -= to_copy;
> > > +	}
> > > +
> > > +	return ret;  
> > 
> > Do we want to return something over 0? If not then this can be return
> > 0. And then you do not need to even init ret value at the beginning.
> > 
> > Also wait little bit like Greg sayd before sending new version.
> > Someone might nack about what I say or say something more.
> > 
> hi, i copy fbtft_write_vmem16_bus8 from file fbtft_bus.c and modify it
> ,just add te wait logic, i will take more time to check this original
> function.

It might be ok or not. You should still check.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
