Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E54951AB4
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 14:19:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A2EA10E45E;
	Wed, 14 Aug 2024 12:19:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gb7FFiZ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F4210E45C
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 12:19:06 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-e115ee08372so433967276.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 05:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723637946; x=1724242746; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GkO7BE2UO9+ru7pUnpn1jnINQAT3cICAUmPfXNrgDqo=;
 b=gb7FFiZ+41438sddR31t94mdRkSKTYcMveEyKxRzwutmD3coUkMPGjLsB61V3Ep2f6
 L75k+G05HlNU84UjnC91CZE2UpPW0OLBs6uMlfmnsfL8o4RGIHovaNA8Q93WqoAzrbKU
 GvmXWrin2ZJPbWstYLbFoT1WRclNVGuWkwjmtKMlHacF/zeABopz2TlAyd75J6qQpBoc
 22K0cxYlYQ/td4r8A1GX9N2frhsGDf1CjcbagXzeLtjMWwELCB/owXm/fyzLetVVAfBD
 uLjeY5glMWQBjUASF21cZ/CMzX+EC7XO3f1W5Rz95b18NnLvWh3nGEV4I1M5zcNSzPji
 0IQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723637946; x=1724242746;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GkO7BE2UO9+ru7pUnpn1jnINQAT3cICAUmPfXNrgDqo=;
 b=Ye/775njLDBI6p0WSkmSKc9kJ6odytnrQvlcdJxFcKy8gsmd1x7fkmELPlh7czLI2V
 6GHy0zX/EeZpXnw3RpT+f8BtDKJ2z/N+XHbV+bEfS2SS3NpBaP10xY/MBT+S9OeHpzzm
 Jmxz0P4w5ONnCGlXO/rLQObR4bnMstYN9wz8cZtzqP8JwSjKb/So4uMtONgPtLicCK+D
 aPFvOsRWbykDW1AGY5g/G+SgsAmLvzwVu/Y6zSTLMf8EvreUMpAjN3mlK5pcnOv4QRmR
 Op/KgIhnFg7jjZEsncc64gygRY6wzswX+PrvLPUF8wemS0MacGKcvWERFZYPGUVxYbgE
 Pu3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnx53G/xSmjoe+soGQJ7Ot1Y1PgeBI+vcr5CseG+kHbjDZ9zkPSqLE4eMPjKqMf+VtT561In9Y1YZHc101PaNXfYhqGDCoA/dso44FhYbR
X-Gm-Message-State: AOJu0YxCTO0XPAv/6EsssVuwuVvRMjSJejQXxFZiW0NHxoLuZraeZE7N
 4t5FZAqJfKNsZY5Ug6r55FD6nTcnH3RIrVWgRQhRVSjgjCbYXDHvC/qshMcSXbsSvVvypDBqynB
 c04Eapci88hFK/PXn3DnyLMebmG/nPv8ZCCHfWA==
X-Google-Smtp-Source: AGHT+IGjt5Gtd47+v4F9si1piYkQh5EGe0K9dfdnK1s/935m+Ubkmif2Bq5NIc2x2lXYaVSpzgpxhQW9gwzCUMfPSuo=
X-Received: by 2002:a05:6902:1895:b0:e03:a6b3:9f28 with SMTP id
 3f1490d57ef6-e1155a38eb4mr3847917276.10.1723637945672; Wed, 14 Aug 2024
 05:19:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240728114200.75559-1-wahrenst@gmx.net>
 <20240728130029.78279-1-wahrenst@gmx.net>
 <20240728130029.78279-7-wahrenst@gmx.net>
In-Reply-To: <20240728130029.78279-7-wahrenst@gmx.net>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 14 Aug 2024 14:18:29 +0200
Message-ID: <CAPDyKFoJh3j8xSeXZ9o031YZLTCDYVA+dgvURuwozjDpU_aauA@mail.gmail.com>
Subject: Re: [PATCH V2 15/16] serial: 8250_bcm2835aux: add PM suspend/resume
 support
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, Maxime Ripard <mripard@kernel.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Jiri Slaby <jirislaby@kernel.org>, Minas Harutyunyan <hminas@synopsys.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lukas Wunner <lukas@wunner.de>, 
 Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
 Peter Robinson <pbrobinson@gmail.com>, 
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
 linux-pm@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel-list@raspberrypi.com
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 28 Jul 2024 at 15:07, Stefan Wahren <wahrenst@gmx.net> wrote:
>
> This adds suspend/resume support for the 8250_bcm2835aux
> driver to provide power management support on attached
> devices.
>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  drivers/tty/serial/8250/8250_bcm2835aux.c | 37 +++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>
> diff --git a/drivers/tty/serial/8250/8250_bcm2835aux.c b/drivers/tty/serial/8250/8250_bcm2835aux.c
> index 121a5ce86050..36e2bb34d82b 100644
> --- a/drivers/tty/serial/8250/8250_bcm2835aux.c
> +++ b/drivers/tty/serial/8250/8250_bcm2835aux.c
> @@ -13,6 +13,7 @@
>   */
>
>  #include <linux/clk.h>
> +#include <linux/console.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> @@ -213,11 +214,47 @@ static const struct acpi_device_id bcm2835aux_serial_acpi_match[] = {
>  };
>  MODULE_DEVICE_TABLE(acpi, bcm2835aux_serial_acpi_match);
>
> +static int bcm2835aux_suspend(struct device *dev)
> +{
> +       struct bcm2835aux_data *data = dev_get_drvdata(dev);
> +       struct uart_8250_port *up = serial8250_get_port(data->line);
> +
> +       serial8250_suspend_port(data->line);
> +
> +       if (device_may_wakeup(dev))
> +               return 0;
> +
> +       if (uart_console(&up->port) && !console_suspend_enabled)
> +               return 0;
> +
> +       clk_disable_unprepare(data->clk);
> +       return 0;
> +}
> +
> +static int bcm2835aux_resume(struct device *dev)
> +{
> +       struct bcm2835aux_data *data = dev_get_drvdata(dev);
> +       int ret;
> +
> +       ret = clk_prepare_enable(data->clk);

Doesn't this create clk prepare/enable - unprepare/disable imbalance
problem when the uart is configured for system wakeup?

> +       if (ret)
> +               return ret;
> +
> +       serial8250_resume_port(data->line);
> +
> +       return 0;
> +}
> +
> +static const struct dev_pm_ops bcm2835aux_dev_pm_ops = {
> +       SYSTEM_SLEEP_PM_OPS(bcm2835aux_suspend, bcm2835aux_resume)
> +};
> +
>  static struct platform_driver bcm2835aux_serial_driver = {
>         .driver = {
>                 .name = "bcm2835-aux-uart",
>                 .of_match_table = bcm2835aux_serial_match,
>                 .acpi_match_table = bcm2835aux_serial_acpi_match,
> +               .pm = pm_ptr(&bcm2835aux_dev_pm_ops),
>         },
>         .probe  = bcm2835aux_serial_probe,
>         .remove_new = bcm2835aux_serial_remove,
> --
> 2.34.1
>

Kind regards
Uffe
