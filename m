Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF1D3055C3
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 09:30:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907646E7D2;
	Wed, 27 Jan 2021 08:29:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B116E519
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 06:19:35 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id d13so482616plg.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 22:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=+AVxzGfMqYMx9RPIgoRtcct2VE1ZRqZ1PBLR8znjyvQ=;
 b=jQGw6IpPbNt4L5SXLZ6/mKlNuFjt5RROmiIjibyXO+me3dqe6+J9AGUFDjNXYKkqjM
 qVqGmLPPpkmYWNenr063FwvG7ZWOeVOWPsTZKPLvvAlS9mEfSXmVJrMbXwrvbx10D90s
 SZve8a4DPC8Kw8nuQ8qXCH2yYbdXUJ6nnS9LIS3kggQWUWhBY9eY/LYZJa6HWIMJ3vw8
 02Yd6E8icfCEJ4S49jZK9N8X9c/T/rrT2u1yDMkPM5Psp9pW2PcI/eiDINV0f/FFuBAc
 VVNRbdC4Kph5tndKiflPXfs179eMyxaCC3Rb27VPIkTw7utVRzoeY+qg9h9ax+2gJ/f8
 xpQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=+AVxzGfMqYMx9RPIgoRtcct2VE1ZRqZ1PBLR8znjyvQ=;
 b=VE2q1Qmu5gshsF7owpnJu+3gWiYIkxgf2mGj0hIPg3mLQyNP4eX9fI3uVbNT5ZzkPZ
 LNjRPZTv1oh+icrWnOoSX0PIv9fKD8AzfYi7ZqeZyA65h5zF1VAqzBaWi5x3pzhxRmlP
 hfZBCFUb/rF/XnYh3vhnwftzb+AmfzV+Aag1G+c7OkgDBZIsb2PFhC/qkWSW0h/LXZyh
 5U5XvAYU11WdjqUWwc6qIsL1WV9b/+prjpB594yWFRUzHYijCqbhdaCEwnXfuZI/bOPZ
 hT9xMcnZUkJF60lIN/dWGrseZdT9bqCunGpyRd+lJsjIjoisFnQEBEW6PE87V4Zc1aPX
 +MHA==
X-Gm-Message-State: AOAM533yqVIon49Bw8FkmMKOaS1I+7eeGIj0rYceYJx66x0WX2HISBzX
 w+NvFjWai9C96eFuckuOCJo=
X-Google-Smtp-Source: ABdhPJw3xTWutH1s20TQixwXD6pOjBaO3Uam1zSz+Lc9n84CDHMRzzsMAr0X6sMA+/isS4YpBnlbFA==
X-Received: by 2002:a17:903:22c2:b029:dd:f952:e341 with SMTP id
 y2-20020a17090322c2b02900ddf952e341mr9583056plg.67.1611728374922; 
 Tue, 26 Jan 2021 22:19:34 -0800 (PST)
Received: from localhost ([103.220.76.197])
 by smtp.gmail.com with ESMTPSA id i7sm1057917pfc.50.2021.01.26.22.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 22:19:34 -0800 (PST)
Date: Wed, 27 Jan 2021 14:19:27 +0800
From: carlis <zhangxuezhi3@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v5] fbtft: add tearing signal detect
Message-ID: <20210127141927.00004472@gmail.com>
In-Reply-To: <20210127054523.GA2696@kadam>
References: <1611711140-68260-1-git-send-email-zhangxuezhi3@gmail.com>
 <20210127054523.GA2696@kadam>
Organization: Tyzmig-ryrjum-8kedto
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 27 Jan 2021 08:29:46 +0000
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

On Wed, 27 Jan 2021 08:45:23 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> On Wed, Jan 27, 2021 at 09:32:20AM +0800, Carlis wrote:
> > @@ -82,6 +111,29 @@ enum st7789v_command {
> >   */
> >  static int init_display(struct fbtft_par *par)
> >  {
> > +	int rc;
> > +	struct device *dev = par->info->device;
> > +
> > +	par->gpio.te = devm_gpiod_get_index_optional(dev, "te", 0,
> > GPIOD_IN);
> > +	if (par->gpio.te) {
> > +		init_completion(&spi_panel_te);
> > +		mutex_init(&te_mutex);
> > +		rc = devm_request_irq(dev,
> > +				      gpiod_to_irq(par->gpio.te),
> > +				     spi_panel_te_handler,
> > IRQF_TRIGGER_RISING,
> > +				     "TE_GPIO", par);
> > +		if (rc) {
> > +			pr_err("TE request_irq failed.\n");
> > +			devm_gpiod_put(dev, par->gpio.te);
> > +			par->gpio.te = NULL;
> > +		} else {
> > +
> > disable_irq_nosync(gpiod_to_irq(par->gpio.te));
> > +			pr_info("TE request_irq completion.\n");
> > +		}
> > +	} else {
> > +		pr_info("%s:%d, TE gpio not specified\n",
> > +			__func__, __LINE__);
> > +	}  
> 
> I'm sorry that I was not clear before.  This code will crash if
> devm_gpiod_get_index_optional() returns an error.  You *NEED* to check
> for error pointers and return the error code.  Write it exactly like
> this:
> 
> 	par->gpio.te = devm_gpiod_get_index_optional(dev, "te", 0,
> GPIOD_IN); if (IS_ERR(par->gpio.te))
> 		return PTR_ERR(par->gpio.te);
> 
> 	if (par->gpio.te) {
> 		init_completion(&spi_panel_te);
> 
> 
> regards,
> dan carpenter
> 

hi,i will fix it like below:
	par->gpio.te = devm_gpiod_get_index_optional(dev, "te", 0,
GPIOD_IN); if (IS_ERR(par->gpio.te)) {
		rc = PTR_ERR(par->gpio.te);
		pr_err("Failed to request  te gpio: %d\n", rc);
		par->gpio.te = NULL;
	}
	if (par->gpio.te) {
		init_completion(&spi_panel_te);
		mutex_init(&te_mutex);
		rc = devm_request_irq(dev,
				      gpiod_to_irq(par->gpio.te),
				     spi_panel_te_handler,
IRQF_TRIGGER_RISING, "TE_GPIO", par);
		if (rc) {
			pr_err("TE request_irq failed.\n");
			devm_gpiod_put(dev, par->gpio.te);
			par->gpio.te = NULL;
		} else {
			disable_irq_nosync(gpiod_to_irq(par->gpio.te));
			pr_info("TE request_irq completion.\n");
		}
	} else {
		pr_info("%s:%d, TE gpio not specified\n",
			__func__, __LINE__);
	}

regards,
zhangxuezhi
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
