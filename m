Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA68E307135
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:19:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAAF26E934;
	Thu, 28 Jan 2021 08:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8BB96E560
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 10:24:02 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id gx1so1076727pjb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 02:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=xRcgTb91tK28anYqrlC++wtp+Am92iHcjy/4eSWbMUs=;
 b=ZVd0VPHkqckjxZmYv4/v2cboiZSDr8qUPwHMzMlYHsy0Hu3sK1Sh2jfHizwSenYTig
 AhejQOWtpeZ6dqXMdwqVaZLcgU4eRtnJIhzFAUjdHqTxQdJOLRaJM3nA+QMX5DBrFf0l
 FEjo16QriDvnD/40PuuhCJfhDE37wGRKgRZgqGdh1w7ZQLl9zmuB+/UpKLSRkCkeKgbs
 Qtk5QufgvK8Hdz7om32gkQZ8rOPszKZnTwGaPCHTaZEIe4VlQxkTHRQOdObfncNdfbww
 lF8aItGo2wKUlFFRS9qH3RqjWY4t4aWl5oWjSJIMHSSUnpgu4Nyk5kTyPImZSSTwvPIk
 129g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=xRcgTb91tK28anYqrlC++wtp+Am92iHcjy/4eSWbMUs=;
 b=ZhiwmJr476G8wA/tEwJDNjYbQu4qYpno6Z5TMw5nCEm5pO+/nr1bHckMTDrKcsh4uP
 5iZdn0i4YtLbooJ+MIzaAxDE7f7yiRBjVKIHMVnISE8yND10/KCfwnfs5fWgRWHn0hDO
 /QMEw9pNvzEat+IkRKOgHI6CCUrVkJlu+MCtXih/0j9KYrMvfDflKm4yfF4u6u+IlY4S
 OUQY4M3SuhUoookXVNJVWKfZvKK+DHWlj+ihGGnWWxpCeJcFUPGACE10bN0ueaDAG1SY
 Hcka/F2qi96kzJF6sF2uqJhAbl2lWD3NFkb0QbJEbeBfpd7ns6YW6v/mviLClEjAiekM
 jzlw==
X-Gm-Message-State: AOAM532H/sQqypqACEHwAaQFXxcIA05Kplb7jEFwEhOeRmoX+na24CZd
 +J5obYiR+8bAhCIGQ3RLxv0=
X-Google-Smtp-Source: ABdhPJzTgP2xJ9TiEus/lM8X6G6P4az0ohaUTLuqRAbnoOTXq0i9h7FnZEwNwwYqWfTlv5yT/U1Epg==
X-Received: by 2002:a17:90a:3f82:: with SMTP id
 m2mr4895955pjc.235.1611743042596; 
 Wed, 27 Jan 2021 02:24:02 -0800 (PST)
Received: from localhost ([103.220.76.197])
 by smtp.gmail.com with ESMTPSA id d128sm2152572pga.87.2021.01.27.02.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 02:24:01 -0800 (PST)
Date: Wed, 27 Jan 2021 18:23:55 +0800
From: carlis <zhangxuezhi3@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v6] fbtft: add tearing signal detect
Message-ID: <20210127182355.00007300@gmail.com>
In-Reply-To: <20210127085951.GE2696@kadam>
References: <1611732502-99639-1-git-send-email-zhangxuezhi3@gmail.com>
 <20210127085951.GE2696@kadam>
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
Cc: devel@driverdev.osuosl.org, linux-fbdev@vger.kernel.org,
 mh12gx2825@gmail.com, gregkh@linuxfoundation.org,
 oliver.graute@kococonnector.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sbrivio@redhat.com, colin.king@canonical.com,
 zhangxuezhi1@yulong.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 27 Jan 2021 11:59:51 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> On Wed, Jan 27, 2021 at 03:28:22PM +0800, Carlis wrote:
> >  static int init_display(struct fbtft_par *par)
> >  {
> > +	int rc;
> > +	struct device *dev = par->info->device;
> > +
> > +	par->gpio.te = devm_gpiod_get_index_optional(dev, "te", 0,
> > GPIOD_IN);
> > +	if (IS_ERR(par->gpio.te)) {
> > +		rc = PTR_ERR(par->gpio.te);
> > +		pr_err("Failed to request te gpio: %d\n", rc);
> > +		par->gpio.te = NULL;
> > +	}
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
> 
> #SadFaceEmoji
> 
> > +		}
> > +	} else {
> > +		pr_info("%s:%d, TE gpio not specified\n",
> > +			__func__, __LINE__);
> > +	}  
> 
> regards,
> dan carpenter
> 
Sorry,i will delete this log in patch v8
regards
zhangxuezhi
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
