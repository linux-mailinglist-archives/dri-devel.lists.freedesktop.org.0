Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D95376A473D
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 17:45:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A6F10E444;
	Mon, 27 Feb 2023 16:45:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B3C10E438
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 16:45:04 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id c18so4641312wmr.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 08:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FeOcTqXDkf0doKsprZO7fxvXxR/92ra2xU2rS73dpcc=;
 b=N1OuYy7nsQ5OY3PZLh6lT9+FHQdTlvdZDP8GDtlTUNgnOwNTFQt7tOo3wv7yL5Ts9F
 DPkFbelV+lIWaakHs5dPEL82nMCQlRW82iWwEYGe9fSvLEEKpn4w8JDyzopc2Wy0TS8U
 agNNWNdy28WaZ27DqQYSH49e3wyvRviIxw7HeueW+jyu8jKhdm04d74rILX7LHlxI57C
 5f3ai0AVdCThBRFJeH4PXh7j9haHSOccftRuBkBlRdnHeGWQLp+E6FWo1BmTiC0pH90z
 687Z9Zedbw7yPM00fCk8M9/r3HnRH3uUObz0qsMH21WFpWUqgxfQPDQA+bSATQTCLhaD
 PgRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FeOcTqXDkf0doKsprZO7fxvXxR/92ra2xU2rS73dpcc=;
 b=0og/EcInLNmyg9u+3c1iDPUYFKj45cClfA676VK5yikP3aPxDag+QSXONAvIi0KAzZ
 OfMuQZDtvBSK99GUC1p/pF6joXlqdVB6HDT3zFvixb8qVHkgB/SE5fdjdjHe8JhPUSf4
 BPbHYf2ulxFyjthhmNZXdr/uuuH4rkff+yzG9w3jK94Wys9Lm2TqId6PZ4JsipwaOdTM
 UMeB9zJDjeq6gLUwTfXkMCZppOaEcVT1WxV0Mq0agtGN24AYr6nVG0kguVQ3UdecbjuJ
 /PIamB8uVE9ZawWgvGLOwRfO3w6B2g8L9lXnRZNSOFC4Xp2zSTmvSlP4RVeekqOkpLPE
 cGfw==
X-Gm-Message-State: AO0yUKXDNmrf0WCUqM60sWxngfFlUy0soHq7FFRqdox8Y44nLPglEjHr
 zn2aBlPir2zi48cNW4j04DM=
X-Google-Smtp-Source: AK7set8HnVjiWkfm607XdfjPyYQyWoO811MLCbol1ln1f8JVz2wkg1XtQo2q9iMxPx0Avd+r1QUrfQ==
X-Received: by 2002:a05:600c:a4c:b0:3ea:e582:48dd with SMTP id
 c12-20020a05600c0a4c00b003eae58248ddmr9905860wmq.34.1677516302316; 
 Mon, 27 Feb 2023 08:45:02 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 t23-20020a1c7717000000b003daf672a616sm9546376wmi.22.2023.02.27.08.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 08:45:01 -0800 (PST)
Date: Mon, 27 Feb 2023 13:27:53 +0300
From: Dan Carpenter <error27@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] fbdev: chipsfb: Fix error codes in chipsfb_pci_init()
Message-ID: <Y/yFqWWbw7RsCN4v@kadam>
References: <Y/yA53V/rW8g1Zlm@kili>
 <2673f515-9516-de13-3e59-4d473165010d@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2673f515-9516-de13-3e59-4d473165010d@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Yang Yingliang <yangyingliang@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 27, 2023 at 11:13:19AM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 27.02.23 um 11:07 schrieb Dan Carpenter:
> > The error codes are not set on these error paths.
> > 
> > Fixes: 145eed48de27 ("fbdev: Remove conflicting devices on PCI bus")
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> with the comments below addressed.
> 
> > ---
> >   drivers/video/fbdev/chipsfb.c | 14 ++++++++++----
> >   1 file changed, 10 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/video/fbdev/chipsfb.c b/drivers/video/fbdev/chipsfb.c
> > index cc37ec3f8fc1..98398789528a 100644
> > --- a/drivers/video/fbdev/chipsfb.c
> > +++ b/drivers/video/fbdev/chipsfb.c
> > @@ -358,16 +358,21 @@ static int chipsfb_pci_init(struct pci_dev *dp, const struct pci_device_id *ent)
> >   	if (rc)
> >   		return rc;
> > -	if (pci_enable_device(dp) < 0) {
> > +	rc = pci_enable_device(dp);
> > +	if (rc < 0) {
> >   		dev_err(&dp->dev, "Cannot enable PCI device\n");
> >   		goto err_out;
> >   	}
> > -	if ((dp->resource[0].flags & IORESOURCE_MEM) == 0)
> > +	if ((dp->resource[0].flags & IORESOURCE_MEM) == 0) {
> > +		rc = -EINVAL;
> 
> I think ENODEV is more appropriate. And it's the default value from the
> original code.

Sorry, I read the original code and my mind saw -EINVAL where it was
actually -ENODEV as you say.  Will resend.

regards,
dan carpenter

