Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 202FF2416B7
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 08:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9EB6E4BA;
	Tue, 11 Aug 2020 06:59:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2530589CAF
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 09:46:05 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id w17so4494531ply.11
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 02:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3fQqRDOEEK3chzUCl0lL9Ogs6I8yGgHjcMYgs480q6A=;
 b=tJvq3feYTqDjpFSHsGa2nJp192C6I/gC+CaEBcq+Rjc10MIMDQEU3hwx8IX6Kd9idz
 AruD5txahoyc/RfHJNXbJrjPl6nc7UFpzVUaQeNGh5Pn6Jt3C6tfMbmw3RcNqymAsb6f
 IByBxrDQLihGva6ZJJSzfOCbQOMpoQ89ePpCdAc06+LDjHNe49iOuezNAf5j5IfaBJ/G
 Kaf58/2KRp1dnSVJNv3TXUz7ETLosn6Q61C9Akr0W6sQHuPPrT7nj2IqhwwwPfHNaL3G
 mArAkvtKlrcZT8j3HfLZqz4krYEZdlGTf2oFVGjHDUPYFOU3TK4n0dw6NweWPnPV3oP4
 dIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3fQqRDOEEK3chzUCl0lL9Ogs6I8yGgHjcMYgs480q6A=;
 b=HMYrZhCVu5kSbnfj5uewsDksQ+LFQnMX0NGAOlLa/t9mgAbIsn6kLaQs0bRfefPN8K
 HhNLaUN4bBVDmAcmas7bQnLOCxfuJcs2zc+sWyLlsAvpJQksyXTeflchVPBh3e8Xtmbn
 VR1A5RNFkWbPdwSBfwpgmzljAKoR3n/jMvhXcFF+4YMq3kQcjHWbW/UH6ROQ4I1JTlcC
 LlFYjTlsp6d79MX6INHE+TiFuxOlRHolYFd/eYZ9zXFAoZYw86kutOmM6n6bsMAdq/bq
 oz//YhXoapM29ROvSKXmVhf6lmuZwnA6b9WnOohOvFsGYt4WGSGg8QEbP0q6qLDL2cyk
 r7xg==
X-Gm-Message-State: AOAM5330af6euvYMWKFDiWbkNBzmu6cs/NLsoyyTpOQZGk7lkhfno0u8
 QHOKUM3nBKkWsVvwcRrH69GoyNnnkg/4bQ==
X-Google-Smtp-Source: ABdhPJwvz+1J3dgGouXI08GF3iGqfuD+/RYt1n1Cm2Iz11htOXNeqE5EI6zW35FtLcFUJzc2qTBLsw==
X-Received: by 2002:a17:902:d3c6:: with SMTP id
 w6mr21348487plb.209.1597052764753; 
 Mon, 10 Aug 2020 02:46:04 -0700 (PDT)
Received: from gmail.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id l4sm9385502pgk.74.2020.08.10.02.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 02:46:04 -0700 (PDT)
Date: Mon, 10 Aug 2020 15:14:13 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 01/12] fbdev: gxfb: use generic power management
Message-ID: <20200810094413.GA7579@gmail.com>
References: <20200805180722.244008-1-vaibhavgupta40@gmail.com>
 <20200805180722.244008-2-vaibhavgupta40@gmail.com>
 <20200808111746.GA24172@ravnborg.org>
 <20200810093948.GB6615@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200810093948.GB6615@gmail.com>
X-Mailman-Approved-At: Tue, 11 Aug 2020 06:58:41 +0000
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
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <bjorn@helgaas.com>, Bjorn Helgaas <helgaas@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Andres Salomon <dilinger@queued.net>,
 Bjorn Helgaas <bhelgaas@google.com>, Paul Mackerras <paulus@samba.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-geode@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > > -static int gxfb_suspend(struct pci_dev *pdev, pm_message_t state)
> > > +static int __maybe_unused gxfb_suspend(struct device *dev)
> > >  {
> > > -	struct fb_info *info = pci_get_drvdata(pdev);
> > > +	struct fb_info *info = dev_get_drvdata(dev);
> > I do not see any dev_set_drvdata() so I guess we get a NULL pointer
> > here which is not intended.
> > Adding a dev_set_data() to gxfb_probe() would do the trick.
> > 
> gxfb_probe() invokes pci_set_drvdata(pdev, info) which in turn calls
> dev_set_drvdata(&pdev->dev, data). Adding dev_get_drvdata() will be redundant.
> 
s/dev_get_drvdata/dev_set_drvdata

Thanks
Vaibhav Gupta
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
