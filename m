Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21684207302
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 14:14:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96796E063;
	Wed, 24 Jun 2020 12:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2BEA6E063
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 12:14:24 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id 64so1678878oti.5
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 05:14:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y7yu4WkGImMdwZqD5nlzk3Gg+6uRsmowaSAKYfis8Ec=;
 b=aY0SMisdYlzzsn/HzG+NW5ovhotwrabyua/1JiAqpWSqTw8nY/w2KyzDqu/L3vYE7n
 sg8Yphf2QReY1heW/a5W6oneFAwVXYgifgb9KkatGenD8h7GszwVhzEBnJaaCBS7ejQ5
 u0nPRx+Eo7kOjVLPOXCx/pI3LxNn/234kLuQDR9b5Q30Hy9EUuijN+EK41BSBzzjnuoz
 p3bH1ss/KveXhiz/POd7VircdK1i1wplBmrGomc4jTQMQCbh4vPyMddlqFbnxhiv2VSY
 L2VSpoRwcgCQCjcGbQEmCLZqyDSFHZK1RhBuASFIlsuhj5QfNstUaZbcyiuYaSAvremJ
 ShIQ==
X-Gm-Message-State: AOAM533fXB6MGvo3o0AVOOm2IxRVr001MX+jfaxHz0p/Tkfoj0fMgTva
 gdWb6fzWhCuFN5LR9mrnNv1tshimcczRcNQ0kOw=
X-Google-Smtp-Source: ABdhPJy2xm4K83+5ka8fN3jLluj982gNGnXI4403pr+WEf02r/64OmGrKPGCEimwg+rQZsEsniiOURWTwd2GEXytWe8=
X-Received: by 2002:a05:6830:10ca:: with SMTP id
 z10mr21642271oto.167.1593000864131; 
 Wed, 24 Jun 2020 05:14:24 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200624114136eucas1p1c84f81b1d78e2dbad7ac1b762f0a4b4f@eucas1p1.samsung.com>
 <20200624114127.3016-1-a.hajda@samsung.com>
 <20200624114127.3016-4-a.hajda@samsung.com>
In-Reply-To: <20200624114127.3016-4-a.hajda@samsung.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 24 Jun 2020 14:14:11 +0200
Message-ID: <CAJZ5v0i7mU3dGGZv3sUwG2_2OCRP3=bPB7a8sstj0qLwmiwhog@mail.gmail.com>
Subject: Re: [RESEND PATCH v5 3/5] drivers core: allow probe_err accept
 integer and pointer types
To: Andrzej Hajda <a.hajda@samsung.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 24, 2020 at 1:41 PM Andrzej Hajda <a.hajda@samsung.com> wrote:
>
> Many resource acquisition functions return error value encapsulated in
> pointer instead of integer value. To simplify coding we can use macro
> which will accept both types of error.
> With this patch user can use:
>         probe_err(dev, ptr, ...)
> instead of:
>         probe_err(dev, PTR_ERR(ptr), ...)
> Without loosing old functionality:
>         probe_err(dev, err, ...)
>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>

The separation of this change from patch [1/5] looks kind of artificial to me.

You are introducing a new function anyway, so why not to make it what
you want right away?

> ---
>  drivers/base/core.c    | 25 ++-----------------------
>  include/linux/device.h | 25 ++++++++++++++++++++++++-
>  2 files changed, 26 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 2a96954d5460..df283c62d9c0 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -3953,28 +3953,7 @@ define_dev_printk_level(_dev_info, KERN_INFO);
>
>  #endif
>
> -/**
> - * probe_err - probe error check and log helper
> - * @dev: the pointer to the struct device
> - * @err: error value to test
> - * @fmt: printf-style format string
> - * @...: arguments as specified in the format string
> - *
> - * This helper implements common pattern present in probe functions for error
> - * checking: print message if the error is not -EPROBE_DEFER and propagate it.
> - * In case of -EPROBE_DEFER it sets defer probe reason, which can be checked
> - * later by reading devices_deferred debugfs attribute.
> - * It replaces code sequence:
> - *     if (err != -EPROBE_DEFER)
> - *             dev_err(dev, ...);
> - *     return err;
> - * with
> - *     return probe_err(dev, err, ...);
> - *
> - * Returns @err.
> - *
> - */
> -int probe_err(const struct device *dev, int err, const char *fmt, ...)
> +int __probe_err(const struct device *dev, int err, const char *fmt, ...)
>  {
>         struct va_format vaf;
>         va_list args;
> @@ -3992,7 +3971,7 @@ int probe_err(const struct device *dev, int err, const char *fmt, ...)
>
>         return err;
>  }
> -EXPORT_SYMBOL_GPL(probe_err);
> +EXPORT_SYMBOL_GPL(__probe_err);
>
>  static inline bool fwnode_is_primary(struct fwnode_handle *fwnode)
>  {
> diff --git a/include/linux/device.h b/include/linux/device.h
> index 40a90d9bf799..22d3c3d4f461 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -965,7 +965,30 @@ void device_links_supplier_sync_state_pause(void);
>  void device_links_supplier_sync_state_resume(void);
>
>  extern __printf(3, 4)
> -int probe_err(const struct device *dev, int err, const char *fmt, ...);
> +int __probe_err(const struct device *dev, int err, const char *fmt, ...);
> +
> +/**
> + * probe_err - probe error check and log helper
> + * @dev: the pointer to the struct device
> + * @err: error value to test, can be integer or pointer type
> + * @fmt: printf-style format string
> + * @...: arguments as specified in the format string
> + *
> + * This helper implements common pattern present in probe functions for error
> + * checking: print message if the error is not -EPROBE_DEFER and propagate it.
> + * In case of -EPROBE_DEFER it sets defer probe reason, which can be checked
> + * later by reading devices_deferred debugfs attribute.
> + * It replaces code sequence:
> + *     if (err != -EPROBE_DEFER)
> + *             dev_err(dev, ...);
> + *     return err;
> + * with
> + *     return probe_err(dev, err, ...);
> + *
> + * Returns @err.
> + *
> + */
> +#define probe_err(dev, err, args...) __probe_err(dev, (long)(err), args)
>
>  /* Create alias, so I can be autoloaded. */
>  #define MODULE_ALIAS_CHARDEV(major,minor) \
> --
> 2.17.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
