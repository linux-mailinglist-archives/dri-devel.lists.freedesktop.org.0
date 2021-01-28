Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08653307EEC
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 20:46:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A94556EA16;
	Thu, 28 Jan 2021 19:46:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B8E6E162
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 11:42:28 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id u15so3188101plf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 03:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=KO0WExq/gHwR9DEe69o/s4rzo4GEwimZkxdlRgtkdt8=;
 b=VorbS2Tww05G2RqblM7MjH3U2m09eiWPvsMMzTgplJBDvbzex346FvkybynsGJxywL
 d/tTzS9AXbxEBBsRt3VBvVgOdiRb6Bg7EEO9MkK8OIAWNcKnAbl6GvcDUKGkXDKDVn1r
 UtFO0srYd92w9V1xeiiHEWp647E7S5z2ykDVb6TeRuoEYKGTP2CBfWwAvF/WrkCZFGiO
 a0UEfWtIXrq1z+ATFCuaOK5JiFZiEVAzYga0jeL3odQZuZ6aiMcDfYqhJefv1gbL+sUt
 vpJvYmwCao30fSrvvDxqmALvWKSaUPuNXbGoo9pNOXWB6rA+CdxQaZV96Y/KliwNM4ix
 pEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=KO0WExq/gHwR9DEe69o/s4rzo4GEwimZkxdlRgtkdt8=;
 b=NkQIZkw45NC6YXdECGV2KQQ9yA97/y0hN2DIXM1vGefv90f0GolywkFp7eTQeYhj9z
 KnDcNFiVIwnFpuTvkLI3rm2OQkzt66FLhpczOfeFyeCUUhQkTUElEGl48NJHcIxU5hR+
 SHslnjQ0016EMpBIy5Gd6mSbI6ulO7XmZDrBLQt5CmxkGx8dLKIO3I0EyUA4wAAv5eBN
 zJe6nvrMgAMDmQESzhHm4G5V9yfbRMwCfk0eYEkL58EOkqSNRR4mkh8Vfp7H2fwV65jk
 MPL0v02Yor2CBQC2b7FsP5chJB/IQXK2G4QThPwiQ6FKVzCRv6cBDey+VjzoKB+VOCCq
 Y2Kg==
X-Gm-Message-State: AOAM532GqMDm6XH9ZnQgAYDcXdKJv1/ExNUj7bNbHjgFcYGx8jz8lpnF
 ix8E3CnFqH5SsnxX4lnf6hQ=
X-Google-Smtp-Source: ABdhPJwhUxpcLrJ3VbBzjIIFavVwOeiK8Zh32aX7HjZx9zUI906jfdBNLiTExTZ8v0icX5Dqz5kJUw==
X-Received: by 2002:a17:90a:eacf:: with SMTP id
 ev15mr10877278pjb.209.1611834147786; 
 Thu, 28 Jan 2021 03:42:27 -0800 (PST)
Received: from localhost ([103.220.76.197])
 by smtp.gmail.com with ESMTPSA id w16sm2497434pfj.103.2021.01.28.03.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:42:27 -0800 (PST)
Date: Thu, 28 Jan 2021 19:42:21 +0800
From: carlis <zhangxuezhi3@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v10] staging: fbtft: add tearing signal detect
Message-ID: <20210128194221.0000364e@gmail.com>
In-Reply-To: <CAMuHMdX50YJ6_=maJveDk=dh+suFeCEtarWrqoP_gNMP9k922Q@mail.gmail.com>
References: <1611754972-151016-1-git-send-email-zhangxuezhi3@gmail.com>
 <20210127223222.3lavtl3roc4cabso@kari-VirtualBox>
 <20210128094258.000012c3@gmail.com>
 <20210128065233.ji4b7ea54ihyu2l5@kari-VirtualBox>
 <CAMuHMdWK0wbMVJNwSW=pafsyjDVg14h2AX=haJeAkyivehP=JQ@mail.gmail.com>
 <20210128190301.00007ebe@gmail.com>
 <CAMuHMdX50YJ6_=maJveDk=dh+suFeCEtarWrqoP_gNMP9k922Q@mail.gmail.com>
Organization: Tyzmig-ryrjum-8kedto
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 Jan 2021 19:44:34 +0000
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
 mh12gx2825@gmail.com, Stefano Brivio <sbrivio@redhat.com>,
 Greg KH <gregkh@linuxfoundation.org>, oliver.graute@kococonnector.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Kari Argillander <kari.argillander@gmail.com>,
 Colin King <colin.king@canonical.com>, zhangxuezhi1@yulong.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 28 Jan 2021 12:15:28 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Carlis,
> 
> On Thu, Jan 28, 2021 at 12:03 PM carlis <zhangxuezhi3@gmail.com>
> wrote:
> > On Thu, 28 Jan 2021 10:42:54 +0100
> > Geert Uytterhoeven <geert@linux-m68k.org> wrote:  
> > > On Thu, Jan 28, 2021 at 7:53 AM Kari Argillander
> > > <kari.argillander@gmail.com> wrote:  
> > > > On Thu, Jan 28, 2021 at 09:42:58AM +0800, carlis wrote:  
> > > > > On Thu, 28 Jan 2021 00:32:22 +0200
> > > > > Kari Argillander <kari.argillander@gmail.com> wrote:  
> > > > > > >  #include "fbtft.h"
> > > > > > >
> > > > > > >  #define DRVNAME "fb_st7789v"
> > > > > > > @@ -66,6 +69,32 @@ enum st7789v_command {
> > > > > > >  #define MADCTL_MX BIT(6) /* bitmask for column address
> > > > > > > order */ #define MADCTL_MY BIT(7) /* bitmask for page
> > > > > > > address order */
> > > > > > >
> > > > > > > +#define SPI_PANEL_TE_TIMEOUT     400 /* msecs */
> > > > > > > +static struct mutex te_mutex;/* mutex for set te gpio irq
> > > > > > > status */  
> > > > > >
> > > > > > Space after ;  
> > > > > hi, i have fix it in the patch v11  
> > > > > >  
> > > >
> > > > Yeah sorry. I accidentally review wrong patch. But mostly stuff
> > > > are still relevant.
> > > >  
> > > > > > > @@ -82,6 +111,33 @@ enum st7789v_command {
> > > > > > >   */
> > > > > > >  static int init_display(struct fbtft_par *par)
> > > > > > >  {
> > > > > > > + int rc;
> > > > > > > + struct device *dev = par->info->device;
> > > > > > > +
> > > > > > > + par->gpio.te = devm_gpiod_get_index_optional(dev, "te",
> > > > > > > 0, GPIOD_IN);
> > > > > > > + if (IS_ERR(par->gpio.te)) {
> > > > > > > +         rc = PTR_ERR(par->gpio.te);
> > > > > > > +         dev_err(par->info->device, "Failed to request te
> > > > > > > gpio: %d\n", rc);
> > > > > > > +         return rc;
> > > > > > > + }  
> > > > > >
> > > > > > You request with optinal and you still want to error out? We
> > > > > > could just continue and not care about that error. User
> > > > > > will be happier if device still works somehow.  
> > >
> > > devm_gpiod_get_index_optional() returns NULL, not an error, if the
> > > GPIO is not found.  So if IS_ERR() is the right check.
> > >
> > > And checks for -EPROBE_DEFER can be handled automatically
> > > by using dev_err_probe() instead of dev_err().
> > >  
> > hi, i fix it like below!?
> >         par->gpio.te = devm_gpiod_get_index_optional(dev, "te", 0,
> >         GPIOD_IN); if (IS_ERR(par->gpio.te)) {
> >                 rc = PTR_ERR(par->gpio.te);
> >                 dev_err_probe(par->info->device, rc, "Failed to
> > request te gpio\n"); return rc;
> >         }
> >         if (par->gpio.te) {
> >                 init_completion(&spi_panel_te);
> >                 rc = devm_request_irq(dev,
> >                                       gpiod_to_irq(par->gpio.te),
> >                                      spi_panel_te_handler,
> >         IRQF_TRIGGER_RISING, "TE_GPIO", par);
> >                 if (rc) {
> >                         dev_err(par->info->device, "TE request_irq
> >         failed.\n"); return rc;  
> 
> dev_err_probe()
> 
> >                 }
> >
> >                 disable_irq_nosync(gpiod_to_irq(par->gpio.te));
> >         } else {
> >                 dev_info(par->info->device, "%s:%d, TE gpio not
> >                 specified\n", __func__, __LINE__);
> >         }  
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

hi,i will fix it like below:


	par->gpio.te = devm_gpiod_get_index_optional(dev, "te", 0,
	GPIOD_IN); if (IS_ERR(par->gpio.te))
		return dev_err_probe(par->info->device,
	PTR_ERR(par->gpio.te), "Failed to request te gpio\n");

	if (par->gpio.te) {
		init_completion(&spi_panel_te);
		rc = devm_request_irq(dev,
				      gpiod_to_irq(par->gpio.te),
				     spi_panel_te_handler,
	IRQF_TRIGGER_RISING, "TE_GPIO", par);
		if (IS_ERR(rc))
			return dev_err_probe(par->info->device,
	PTR_ERR(rc), "TE request_irq failed.\n");

		disable_irq_nosync(gpiod_to_irq(par->gpio.te));
	} else {
		dev_info(par->info->device, "%s:%d, TE gpio not
		specified\n", __func__, __LINE__);
	}


regards,
zhangxuezhi
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
