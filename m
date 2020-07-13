Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EEC21D94B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jul 2020 16:58:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7FD16E509;
	Mon, 13 Jul 2020 14:58:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDFB16E509
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 14:58:52 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id 1so6103493pfn.9
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 07:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=idB200zkk4M6w9/S7/x4u9pjVtl7D3vW0TITJbchsNw=;
 b=MGhljGuEzLpygi69eidMBOHf8JA7D5si19uxVWcDC6Wy1Ds3uBLnXz+J8pmK1Apf4C
 rMmUlG6BbNE4/eHlD2XU9eX/SsqTtl43LhMyugFG9ueLoLh8na9gJF9gzHZi2RsHIAp4
 6pesbK3XrTP9JIQRWJEoKp6puC2JSUW19qeZrksHqiwiKMbntIEIK16tGnrB5kP4T66g
 ZT/J+hRlu+6DCemfhm1vsgZdBrFLrrpBJeVu4nhLxLLp0MHoQvvA3dHs9EOzuPYjNbUS
 By46/6ScZW9bi40KVfwRLM0C/czPMJALxG9Lxbl337r5C17bgkkNmVWQvXxZ81iY9y5u
 W+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=idB200zkk4M6w9/S7/x4u9pjVtl7D3vW0TITJbchsNw=;
 b=o+FRtAC+Ev7KNN6BzZG8xtq1QSvqELYgK5+yUJBRwmwXRrNJk9CsU0N8DK9W9/zNgU
 zlxvI5LH/a4eomf2E9f7/EkIKOOdXxECPyHrYmHBwQPuR9LVF3vNezDosC4FhowtqwvN
 r0EtmtElqZT2aya7N2FgYHRaZNGPrCakKCrIbvXPanvTz5jv4R690nc8eKjir/7mxNdz
 23EY1W/6wLRKrAyqCCRq9fVXfy6Sl39/Y8Zo67d8NDvBDZ5kf38RezvrjLPI4N3cIvVg
 GVodAcTAHxyOmzF2lxYtRLfmwrc7I2ljS/4OMkwYS7yw5BZB6mff7OkTpDfufUuvzi6r
 6rcg==
X-Gm-Message-State: AOAM533i97teZgGZLkt/yp8/7ffEFYXN6xFrSHywEnSYQjgOctBuWkba
 OGTHNawuT4eW+Gsx1nYUXYQbaqHzKH5BYt6EGVg=
X-Google-Smtp-Source: ABdhPJzSyfGH2iI/Q+3QHtm6sw7B/R49Wh2d9hhEuP9TMUliSNgAwNMZgJjgLyFsLds0c5NgdCISMsDDBLwbg/1t0bM=
X-Received: by 2002:a63:a05f:: with SMTP id u31mr61913148pgn.4.1594652332426; 
 Mon, 13 Jul 2020 07:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200713144331eucas1p24107a30783dacc92887b80cf082be9fb@eucas1p2.samsung.com>
 <20200713144324.23654-1-a.hajda@samsung.com>
 <20200713144324.23654-2-a.hajda@samsung.com>
In-Reply-To: <20200713144324.23654-2-a.hajda@samsung.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 13 Jul 2020 17:58:35 +0300
Message-ID: <CAHp75VdgMgBy2no77YZrAm6p_BCSo9oxpvSrOJMKeBD13SDW=Q@mail.gmail.com>
Subject: Re: [PATCH v9 1/4] driver core: add device probe log helper
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
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 13, 2020 at 5:43 PM Andrzej Hajda <a.hajda@samsung.com> wrote:
>
> During probe every time driver gets resource it should usually check for
> error printk some message if it is not -EPROBE_DEFER and return the error.
> This pattern is simple but requires adding few lines after any resource
> acquisition code, as a result it is often omitted or implemented only
> partially.
> dev_err_probe helps to replace such code sequences with simple call,
> so code:
>         if (err != -EPROBE_DEFER)
>                 dev_err(dev, ...);
>         return err;
> becomes:
>         return dev_err_probe(dev, err, ...);
>

FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> Reviewed-by: Rafael J. Wysocki <rafael@kernel.org>
> Reviewed-by: Mark Brown <broonie@kernel.org>
> ---
>  drivers/base/core.c    | 42 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/device.h |  3 +++
>  2 files changed, 45 insertions(+)
>
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 67d39a90b45c..3a827c82933f 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -3953,6 +3953,48 @@ define_dev_printk_level(_dev_info, KERN_INFO);
>
>  #endif
>
> +/**
> + * dev_err_probe - probe error check and log helper
> + * @dev: the pointer to the struct device
> + * @err: error value to test
> + * @fmt: printf-style format string
> + * @...: arguments as specified in the format string
> + *
> + * This helper implements common pattern present in probe functions for error
> + * checking: print debug or error message depending if the error value is
> + * -EPROBE_DEFER and propagate error upwards.
> + * It replaces code sequence:
> + *     if (err != -EPROBE_DEFER)
> + *             dev_err(dev, ...);
> + *     else
> + *             dev_dbg(dev, ...);
> + *     return err;
> + * with
> + *     return dev_err_probe(dev, err, ...);
> + *
> + * Returns @err.
> + *
> + */
> +int dev_err_probe(const struct device *dev, int err, const char *fmt, ...)
> +{
> +       struct va_format vaf;
> +       va_list args;
> +
> +       va_start(args, fmt);
> +       vaf.fmt = fmt;
> +       vaf.va = &args;

> +       if (err != -EPROBE_DEFER)

I would rather see positive conditional (slightly better to parse when
read), but here I think it's more or less equal.

> +               dev_err(dev, "error %d: %pV", err, &vaf);
> +       else
> +               dev_dbg(dev, "error %d: %pV", err, &vaf);

> +       va_end(args);
> +
> +       return err;
> +}
> +EXPORT_SYMBOL_GPL(dev_err_probe);
> +
>  static inline bool fwnode_is_primary(struct fwnode_handle *fwnode)
>  {
>         return fwnode && !IS_ERR(fwnode->secondary);
> diff --git a/include/linux/device.h b/include/linux/device.h
> index 15460a5ac024..6b2272ae9af8 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -964,6 +964,9 @@ void device_link_remove(void *consumer, struct device *supplier);
>  void device_links_supplier_sync_state_pause(void);
>  void device_links_supplier_sync_state_resume(void);
>
> +extern __printf(3, 4)
> +int dev_err_probe(const struct device *dev, int err, const char *fmt, ...);
> +
>  /* Create alias, so I can be autoloaded. */
>  #define MODULE_ALIAS_CHARDEV(major,minor) \
>         MODULE_ALIAS("char-major-" __stringify(major) "-" __stringify(minor))
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
