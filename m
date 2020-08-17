Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB1E247FE4
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 09:51:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2233089CB3;
	Tue, 18 Aug 2020 07:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 328136E463
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 07:48:14 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id m34so7716918pgl.11
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 00:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wi7uOh+yRtLfdGHBZ3WK6CGtcfeUS/qkjXRc9sQSjvc=;
 b=Zbh2ZDpx5D7ecoMsmjdy0EZPc17mhOMQ+yg6h9NruYfGK34WnVFxgqtb3ALzVVwFjW
 +fQOuZxuwzoaBjKLFhJHTpRxl+41tCCCAvNdTjbUvmKX4DCUH2imMS/IDINbDFEm8o14
 IZYTsGs25owiK+EZnJmh/I8SHam1odD/s+4vnAWqreIEGAWJQYqNVrpMo4xHS6l4q+Dt
 uZ717gj9zeYVjZcaRC2Cdkhkkdk5SMJX68fcUrPafwrcQkuF95Bs1DR5vrdxo8q60qwc
 NgaROWjOxuRyo4fNRoR4JEBt3XvWexmjtiTiObf7bEyOxfXMr5qzXXvuboSTaTps4Edz
 wp6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wi7uOh+yRtLfdGHBZ3WK6CGtcfeUS/qkjXRc9sQSjvc=;
 b=KNWX9Cus4T1sWky8uBolzaQtAPpy5KK782BPDpvCvMzUjaJf6uI60R4XKvIHcYXbfS
 RDoqepvKNaQ7sOWgcCHnRCk62yW1pK3kTC9wTuMe2KuZMHegD2AT6X/jTKO3j8EM7L/9
 O9wykMNY+xLptb2b6gthXkSTWPtZ+ZZuDBHyNO/Qe6BHYdgC3yKn8F2F9Jjk6cI8wfna
 GdDa88zO/tntqWMVo53NA/jBV4RGyuryxg1djaN4baoVmrQOn8xZNY3QXzVx9s3HWJhn
 DYuQSUWWIYMOqwtiyfEmBScwWqz5f5StpRTt25lYOBsDXkkaagTew1yMJqlXmaXnqXjk
 6umw==
X-Gm-Message-State: AOAM530hj8L2R151D1gcfqFXwejLc5Bx5dQfm0ka2mXXgazo8GCE7mhf
 aOhvhExXfyEKXTfJjBvKNZY=
X-Google-Smtp-Source: ABdhPJyH0PooAF7f8Gjqfs3WOBZbjkvwPWTfgVSpdwmSziet5j+X68Cf8uvMg8Xmk5uW4gSOtAOz0Q==
X-Received: by 2002:a63:794e:: with SMTP id u75mr8901794pgc.50.1597650493498; 
 Mon, 17 Aug 2020 00:48:13 -0700 (PDT)
Received: from gmail.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id mh14sm17112858pjb.23.2020.08.17.00.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 00:48:13 -0700 (PDT)
Date: Mon, 17 Aug 2020 13:16:34 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 09/12] fbdev: i740fb: use generic power management
Message-ID: <20200817074634.GD5869@gmail.com>
References: <20200810165458.GA292825@ravnborg.org>
 <20200810185723.15540-1-vaibhavgupta40@gmail.com>
 <20200810185723.15540-10-vaibhavgupta40@gmail.com>
 <20200816202442.GB1426650@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200816202442.GB1426650@ravnborg.org>
X-Mailman-Approved-At: Tue, 18 Aug 2020 07:50:42 +0000
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, linux-geode@lists.infradead.org,
 Bjorn Helgaas <bjorn@helgaas.com>, Bjorn Helgaas <helgaas@kernel.org>,
 Andres Salomon <dilinger@queued.net>, Bjorn Helgaas <bhelgaas@google.com>,
 Paul Mackerras <paulus@samba.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 16, 2020 at 10:24:42PM +0200, Sam Ravnborg wrote:
> Hi Vaibhav
> 
> On Tue, Aug 11, 2020 at 12:27:20AM +0530, Vaibhav Gupta wrote:
> > Drivers should do only device-specific jobs. But in general, drivers using
> > legacy PCI PM framework for .suspend()/.resume() have to manage many PCI
> > PM-related tasks themselves which can be done by PCI Core itself. This
> > brings extra load on the driver and it directly calls PCI helper functions
> > to handle them.
> > 
> > Switch to the new generic framework by updating function signatures and
> > define a "struct dev_pm_ops" variable to bind PM callbacks. Also, remove
> > unnecessary calls to the PCI Helper functions along with the legacy
> > .suspend & .resume bindings.
> > 
> > Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> 
> I several of the drivers I briefly looked at a new set of helpers were
> introduced for the different types of pm actions.
> They then called a more generic function that uses the passes
> enumeration to decide what to do.
> 
> But in this driver the test "state.event == PM_EVENT_FREEZE" is dropped
> and there is no freeze operation.
> Please explain this change so the reader is not left wondering.
> 
> 	Sam
> 
Okay,

Thanks
Vaibhav Gupta
> > ---
> >  drivers/video/fbdev/i740fb.c | 40 +++++++++++++++---------------------
> >  1 file changed, 16 insertions(+), 24 deletions(-)
> > 
> > diff --git a/drivers/video/fbdev/i740fb.c b/drivers/video/fbdev/i740fb.c
> > index c65ec7386e87..8d7f06fc8a5a 100644
> > --- a/drivers/video/fbdev/i740fb.c
> > +++ b/drivers/video/fbdev/i740fb.c
> > @@ -1175,16 +1175,11 @@ static void i740fb_remove(struct pci_dev *dev)
> >  	}
> >  }
> >  
> > -#ifdef CONFIG_PM
> > -static int i740fb_suspend(struct pci_dev *dev, pm_message_t state)
> > +static int __maybe_unused i740fb_suspend(struct device *dev)
> >  {
> > -	struct fb_info *info = pci_get_drvdata(dev);
> > +	struct fb_info *info = dev_get_drvdata(dev);
> >  	struct i740fb_par *par = info->par;
> >  
> > -	/* don't disable console during hibernation and wakeup from it */
> > -	if (state.event == PM_EVENT_FREEZE || state.event == PM_EVENT_PRETHAW)
> > -		return 0;
> > -
> >  	console_lock();
> >  	mutex_lock(&(par->open_lock));
> >  
> > @@ -1197,19 +1192,15 @@ static int i740fb_suspend(struct pci_dev *dev, pm_message_t state)
> >  
> >  	fb_set_suspend(info, 1);
> >  
> > -	pci_save_state(dev);
> > -	pci_disable_device(dev);
> > -	pci_set_power_state(dev, pci_choose_state(dev, state));
> > -
> >  	mutex_unlock(&(par->open_lock));
> >  	console_unlock();
> >  
> >  	return 0;
> >  }
> >  
> > -static int i740fb_resume(struct pci_dev *dev)
> > +static int __maybe_unused i740fb_resume(struct device *dev)
> >  {
> > -	struct fb_info *info = pci_get_drvdata(dev);
> > +	struct fb_info *info = dev_get_drvdata(dev);
> >  	struct i740fb_par *par = info->par;
> >  
> >  	console_lock();
> > @@ -1218,11 +1209,6 @@ static int i740fb_resume(struct pci_dev *dev)
> >  	if (par->ref_count == 0)
> >  		goto fail;
> >  
> > -	pci_set_power_state(dev, PCI_D0);
> > -	pci_restore_state(dev);
> > -	if (pci_enable_device(dev))
> > -		goto fail;
> > -
> >  	i740fb_set_par(info);
> >  	fb_set_suspend(info, 0);
> >  
> > @@ -1231,10 +1217,17 @@ static int i740fb_resume(struct pci_dev *dev)
> >  	console_unlock();
> >  	return 0;
> >  }
> > -#else
> > -#define i740fb_suspend NULL
> > -#define i740fb_resume NULL
> > -#endif /* CONFIG_PM */
> > +
> > +static const struct dev_pm_ops i740fb_pm_ops = {
> > +#ifdef CONFIG_PM_SLEEP
> > +	.suspend	= i740fb_suspend,
> > +	.resume		= i740fb_resume,
> > +	.freeze		= NULL,
> > +	.thaw		= i740fb_resume,
> > +	.poweroff	= i740fb_suspend,
> > +	.restore	= i740fb_resume,
> > +#endif /* CONFIG_PM_SLEEP */
> > +};
> >  
> >  #define I740_ID_PCI 0x00d1
> >  #define I740_ID_AGP 0x7800
> > @@ -1251,8 +1244,7 @@ static struct pci_driver i740fb_driver = {
> >  	.id_table	= i740fb_id_table,
> >  	.probe		= i740fb_probe,
> >  	.remove		= i740fb_remove,
> > -	.suspend	= i740fb_suspend,
> > -	.resume		= i740fb_resume,
> > +	.driver.pm	= &i740fb_pm_ops,
> >  };
> >  
> >  #ifndef MODULE
> > -- 
> > 2.27.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
