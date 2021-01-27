Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0910A3055B6
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 09:30:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E5F6E5C0;
	Wed, 27 Jan 2021 08:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90DF689A9A
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 01:15:56 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id g15so307378pjd.2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 17:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=KJ+yQ5bWaZ2enwzjx+4GHtaZjxc83d9TFtN5y4k2HgI=;
 b=i/yuys92Y5AzJRo1OemPBFbioTJmSuQ33639+tZ6prHwvFx51LOyZrVSO1E33i+8wh
 dEJHgrQ8sxZTiELoPu/HB5idN1Xr1ngd23fU7Q5qWKVITJs29r5uNEgiLJ+UF3eew7oh
 Te/siDN/xEQeEQxDBwRHsCc0asJLTkm6YLdAmJzmN6G5BtxF5PPok0bVMoyLAZ3KdEOI
 Iq/KGqEfFxJ8EHCQGitG/cuxLRRvin9iwNT0mDvewcCr0Gf/gUQc+rg3v6bY/LX+Q7bw
 v09GqAMKSqwIVfOdSE9AZRLH5lptxD2UA4smZNauFMOwPs6tZbLVbnqHk4lzlHnzj5FL
 mYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=KJ+yQ5bWaZ2enwzjx+4GHtaZjxc83d9TFtN5y4k2HgI=;
 b=sjXrRcCsgp9R9m94Jijw0HPcpuuTzCDnVFJH5BhuQwe32gvOIhK6ZY6c4tr1R1MtOt
 wkUcG0IgepEkoQui0gqfQtUv1S0+CCdSwDFF1NLOO6wh+g+apx6Ykrx3o99Y1/EPv/K6
 iZKPba1LPzqoplY1YI5w1EO9inK4xpCY31tIZfJ8dBPE9Z03wmKG8KzVU2N8K2i/tv4h
 KCcovC3zM2yW32HVt80wExavCAOxDaQ0xuLpw8uf3VqMvQVaN1WDYq3Mipq6qterIoW+
 /k4b5GGHvnBTy760w1nedGh/S2pm78UcHvVIkYMous2u588CgfCyfhdYxOCGXS7aKY7U
 /lvw==
X-Gm-Message-State: AOAM5334py2ZKxNf9bc6SLYOImqpQMNcU49/eZoERXb4gsyTXjQTy1cs
 MF8iXY+0PWTgVRzj09anq8A=
X-Google-Smtp-Source: ABdhPJwh8l3R0l+5Z0cCZw5Tw01gyH/2L5iZDeU27N+EyiLMmddVKlQ+fKoZdTxT07XrfYEndiiX9A==
X-Received: by 2002:a17:902:d64e:b029:df:e5b1:b7f7 with SMTP id
 y14-20020a170902d64eb02900dfe5b1b7f7mr8586928plh.10.1611710156278; 
 Tue, 26 Jan 2021 17:15:56 -0800 (PST)
Received: from localhost ([103.220.76.197])
 by smtp.gmail.com with ESMTPSA id d128sm218943pga.87.2021.01.26.17.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 17:15:55 -0800 (PST)
Date: Wed, 27 Jan 2021 09:15:49 +0800
From: carlis <zhangxuezhi3@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v4] fbtft: add tearing signal detect
Message-ID: <20210127091549.00005933@gmail.com>
In-Reply-To: <20210126175141.GZ2696@kadam>
References: <1611664835-150687-1-git-send-email-zhangxuezhi3@gmail.com>
 <20210126175141.GZ2696@kadam>
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

On Tue, 26 Jan 2021 20:51:41 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> On Tue, Jan 26, 2021 at 08:40:35PM +0800, Carlis wrote:
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
> 
> I explained in my earlier review that devm_gpiod_get_index_optional()
> can return error pointers...  There was quite a bit of detail about
> how to handle this correctly in my earlier review, but I think you
> might not have noticed it.  Please read it again.
> 
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
> > +		pr_err("%s:%d, TE gpio not specified\n",
> > +		       __func__, __LINE__);
> > +	}  
> 
> regards,
> dan carpenter
> 
Thank you for your correction,i will change pr_err to pr_info in next
patch v5

regards,
dan carpenter
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
