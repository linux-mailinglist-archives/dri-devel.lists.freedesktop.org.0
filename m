Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 637C020D035
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 18:38:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E35389CB3;
	Mon, 29 Jun 2020 16:38:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 652F089CB3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 16:38:18 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id f6so4218825pjq.5
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 09:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kfKoyluBhqQK8WBSpnVThNVVFytFAMIzrkcMglZ8Sh0=;
 b=uauVhkLqChQY63QDsmizLdb/jQYdWYW2KZ7pDQo7+LSredLUfRUSIycrU7mWGxUqmv
 UqhWWO75apzhc+4AIvEGjaPBN6DgDsjFKLLbLxodJmTZyv5NWBdEI7SN9qeaem1xeojk
 4YuYBBHgFJC1Axa1M4NXPDBt4XfhgZKQAp4wgHVmxX1gQhufADuzSGfbv4UHcpkYfOj7
 q1VsVxAKsaF0O5un27MpbU1wyibjF4fizkGKLO2oiNuG3h8NFSAQlD/cwH+02E3TJnUt
 h1tf5Dv0xt/qmGWxJMBRxbW19fIlwNgnPTt2O9f+wtLKjcFE+X9sFxQyvTbE/GTASltt
 alBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kfKoyluBhqQK8WBSpnVThNVVFytFAMIzrkcMglZ8Sh0=;
 b=B67WdK4nWJD7kKgdCVZt8jw0zr+8eNOaLg8QMH4jQ2Lzgp6aAOotK+mIlYA2A5OUHn
 0vXJEglbdwT8wwsJhUwYJRo9yvJezqQcPwFJ3P7sbwmTJgn8yPowUsAOGYqGI2Xgxs1h
 f0f696JFEeuHX+6nDhGrbbqzr7CYl813kb2+MyFvVBAP3xWz3cSSmCRzD87rUMy+D6jN
 EFHKT5Lvs9aBTBSvQcz3GDzP3Pd3vJmvtSekZWSN5ZrLb22dHqmcp1vRQzBGwfTnKCvx
 WHBd3vtAqsj9avFqtRi0htORSEaTTuotxM2KbnUDcV9T5S+XG/vTep6PIO9IQ/od37mg
 a3DQ==
X-Gm-Message-State: AOAM5338/KWPpjwqno/VkP65bvJMc+0jIMdvg77PMeYjzVR4HDEkHMP3
 +UJ2j6uK30xUfy/PXLfAMkl8sE3ycsjLeL7/V9k=
X-Google-Smtp-Source: ABdhPJyR7dnU1HeSw18RQd4JxqNmjcJaca3SHFEBSw63fP13UbNmoK//y1xzhiGRspEbeWiiZppivaRU9rPhRRIw160=
X-Received: by 2002:a17:902:7611:: with SMTP id
 k17mr14218920pll.255.1593448697956; 
 Mon, 29 Jun 2020 09:38:17 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200629112248eucas1p187e5dac2f4f6120aacbc86e48ad0fff9@eucas1p1.samsung.com>
 <20200629112242.18380-1-a.hajda@samsung.com>
 <20200629112242.18380-2-a.hajda@samsung.com>
In-Reply-To: <20200629112242.18380-2-a.hajda@samsung.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 29 Jun 2020 19:38:04 +0300
Message-ID: <CAHp75VegHLG5tgVFjwmpmDfSqELqNXcb9dFSM4jLRx+anW7Lsw@mail.gmail.com>
Subject: Re: [PATCH v7 1/4] driver core: add device probe log helper
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

On Mon, Jun 29, 2020 at 2:22 PM Andrzej Hajda <a.hajda@samsung.com> wrote:
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

FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

(I'm fine with current code, though, consider below comments)

> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> Reviewed-by: Rafael J. Wysocki <rafael@kernel.org>
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
> +
> +       if (err != -EPROBE_DEFER)

Perhaps positive conditional.

> +               dev_err(dev, "error %d: %pV", err, &vaf);
> +       else
> +               dev_dbg(dev, "error %d: %pV", err, &vaf);

Perhaps {} to be added here.

> +
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
