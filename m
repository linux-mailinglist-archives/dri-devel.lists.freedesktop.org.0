Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E432A41A2
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 11:23:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 179186EC13;
	Tue,  3 Nov 2020 10:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D22A36EC26
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 10:23:38 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id b8so17922633wrn.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Nov 2020 02:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=X3yKDwPPNTrytpbBfgv7cCHjHcmjRfwqt9p/XDeYkyo=;
 b=QRhxYm+YceTsQC+h72Ex2xvsSiHV6Zcg8bngRxEDEX+YshcYjYMlKTtM1jsKqc2CqG
 Fi7hsXT0eYnb4vuhiEVTLbK2rD27QVzC+RSUkHmTyy/dWJoMZ14gnDJ+GGWyTOsftlkw
 hUdPkXtNR59R+A3KSa13fN0kg08pHN0XTiZsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=X3yKDwPPNTrytpbBfgv7cCHjHcmjRfwqt9p/XDeYkyo=;
 b=mEALJ66RQOJ5QH72jAorp8BJoNS4uRn6zRDKJ5MUgHeo5inTbe1HQpzCFwd40VUhUG
 r5tmG5u0kkwRcl9mFCjP1ncDBSwz7nrsXkBCQ+HlHSibDXJt+wHkjrWJT3sgt8DnMkUw
 uFqV9/bgV/EuWd/sP5bKjSGrNqEVXNqeH9+jPaVl3JK9N9JDvbq8PtMUerN1MFAbzllE
 csQmDsNHnqyfV2lCdqRJGyjEsUXPIKlp65rJOSxH9Funwp/urB1Gx0weiVpVL8mrmZpE
 4We6q4XYIF9sRhqI2/4q+LInQskUPSjxGY16nJ9raY3b1EsELKCW8Q9Y9wKeeIEbkiF6
 Gudg==
X-Gm-Message-State: AOAM533x3LJmlkikMMaz2Na9xEg1PFeAHiLysh/AQSBNP2E36o4JDaZG
 NgBsXI0Jymd2bUHjCW7qYqKIg2cKXn2i3IO1
X-Google-Smtp-Source: ABdhPJy8mdOpufzGnndck6O/psSpr1rfJsmzfCAICDlLUNVHP24rvX9xmKGZSifSRoVv/X13c7Kz7w==
X-Received: by 2002:adf:e807:: with SMTP id o7mr13825087wrm.303.1604399017611; 
 Tue, 03 Nov 2020 02:23:37 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t4sm2413753wmb.20.2020.11.03.02.23.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 02:23:36 -0800 (PST)
Date: Tue, 3 Nov 2020 11:23:34 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [PATCH v2] drm: Add the new api to install irq
Message-ID: <20201103102334.GA401619@phenom.ffwll.local>
Mail-Followup-To: Tian Tao <tiantao6@hisilicon.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <1604369441-65254-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1604369441-65254-1-git-send-email-tiantao6@hisilicon.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: tzimmermann@suse.de, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 03, 2020 at 10:10:41AM +0800, Tian Tao wrote:
> Add new api devm_drm_irq_install() to register interrupts,
> no need to call drm_irq_uninstall() when the drm module is removed.
> 
> v2:
> fixed the wrong parameter.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>  drivers/gpu/drm/drm_drv.c | 23 +++++++++++++++++++++++
>  include/drm/drm_drv.h     |  3 ++-
>  2 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index cd162d4..0fe5243 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -39,6 +39,7 @@
>  #include <drm/drm_color_mgmt.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
> +#include <drm/drm_irq.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_mode_object.h>
>  #include <drm/drm_print.h>
> @@ -678,6 +679,28 @@ static int devm_drm_dev_init(struct device *parent,
>  	return ret;
>  }
>  
> +static void devm_drm_dev_irq_uninstall(void *data)
> +{
> +	drm_irq_uninstall(data);
> +}
> +
> +int devm_drm_irq_install(struct device *parent,

parent argument should not be needed, we have drm_device->dev. If that
doesn't work, then don't use the drm irq helpers, they're optional (and
there's already devm versions of the core irq functions).

Just a detail aside from all the other things alreay mentioned.
-Daniel

> +			 struct drm_device *dev, int irq)
> +{
> +	int ret;
> +
> +	ret = drm_irq_install(dev, irq);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_add_action(parent, devm_drm_dev_irq_uninstall, dev);
> +	if (ret)
> +		devm_drm_dev_irq_uninstall(dev);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(devm_drm_irq_install);
> +
>  void *__devm_drm_dev_alloc(struct device *parent, struct drm_driver *driver,
>  			   size_t size, size_t offset)
>  {
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 0230762..fec1776 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -513,7 +513,8 @@ struct drm_driver {
>  
>  void *__devm_drm_dev_alloc(struct device *parent, struct drm_driver *driver,
>  			   size_t size, size_t offset);
> -
> +int devm_drm_irq_install(struct device *parent, struct drm_device *dev,
> +			 int irq);
>  /**
>   * devm_drm_dev_alloc - Resource managed allocation of a &drm_device instance
>   * @parent: Parent device object
> -- 
> 2.7.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
