Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 818DB45E0FE
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 20:29:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61D776E0A6;
	Thu, 25 Nov 2021 19:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E0BE6E0A6
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 19:29:34 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id v1so29601612edx.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 11:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+QdSnn9hnDbXHilVPEzYaOF00rC6aTmARJsrJsKk/HA=;
 b=eZYdfa3q9HtFJRaW20SwlL7XA8WQ7r8jlBGVqh9TyKPBpv/nzIIQJ1cuusxBBozWUp
 SmRZuuOksbeR9Ls1NpzezJ370EtRbOBpS3Ct/g+9c5X3nrrFfrbYZPjn+2cdCDkvrKWu
 Syfgv5XE2Z851DPSLlO0SXfAZ7RcV3EeuawAvCDT+hY6nkmfboeK5w4IHrl9/cDJ73va
 uXtUsQZIq0M4138F61KBzWewxcAsGrbhmCYYPkhWuDoMzmrEE7fympSIBETcwojM7rWH
 dl4WCZb0PFuuETHN9RlD3tdpk0F6EE75DHgzpve6zHolLrfHTPaGkzEMAA+ND0mMkrrQ
 BIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+QdSnn9hnDbXHilVPEzYaOF00rC6aTmARJsrJsKk/HA=;
 b=TUc6Tn/NB2uHZedclQj5UiM2rZGVLFmLqoTatOJopy6g4/PZ8VeSgC8IN9vVpsJ7Y6
 OPfpmA6qSZPnig37J8SzZxfroSUOGwfFJBeDdyljsCDrpn3pyFdPTHsVi0rTOxqFkOo+
 ajrQwsjTXvcKBCxcUhFuZ5tNY+4iiX8ViFP+5rnUFnym4vyWih7/wBNnHtQ738wK/6La
 xOGRooQ98h0mlL3i2PYR+BQQDb62VNrbMx86GiosEVweSR2publKMaGd0VmhyzAdxk2H
 aleOh3cxCgeN0WoS0TYv3QQhUbTU6QYWG8szW0vUcjkIoBr63IdxSvNyTRR9pbQzeX+q
 cdMw==
X-Gm-Message-State: AOAM533W3dTz2Nm3P1yoRFE3efzjBvNAPsmwy7dVJn6Zu7RAE6x6RqGV
 x2LxurM4S6SPZ7F3j6DL4qbNY2iWVnc+fmrBklQ=
X-Google-Smtp-Source: ABdhPJxia6v+ggx0h/6ClA1/sHMg1Q/7ZU1xWeQZA6EVhTerXcEGn294ZgigAx875QVPOK7l2krbLRnAJ036HXO5fPk=
X-Received: by 2002:a17:906:489b:: with SMTP id
 v27mr33672901ejq.567.1637868572711; 
 Thu, 25 Nov 2021 11:29:32 -0800 (PST)
MIME-Version: 1.0
References: <1637859224-5179-1-git-send-email-akhilrajeev@nvidia.com>
In-Reply-To: <1637859224-5179-1-git-send-email-akhilrajeev@nvidia.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 25 Nov 2021 21:28:56 +0200
Message-ID: <CAHp75VfPPpTNCaM+GhcqZS53ts-20GBzm+4OWLAjND=z79pgxg@mail.gmail.com>
Subject: Re: [PATCH v4] i2c: tegra: Add the ACPI support
To: Akhil R <akhilrajeev@nvidia.com>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jon Hunter <jonathanh@nvidia.com>,
 linaro-mm-sig@lists.linaro.org, Laxman Dewangan <ldewangan@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-i2c <linux-i2c@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>, Dmitry Osipenko <digetx@gmail.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 25, 2021 at 6:54 PM Akhil R <akhilrajeev@nvidia.com> wrote:
>
> Add support for the ACPI based device registration so that the driver
> can be also enabled through ACPI table.
>
> This does not include the ACPI support for Tegra VI and DVC I2C.

Thanks for an update, my comments below.

...

> -       err = reset_control_reset(i2c_dev->rst);
> +       if (handle)

> +               err = acpi_evaluate_object(handle, "_RST", NULL, NULL);

Does it compile for CONFIG_ACPI=n case?

> +       else
> +               err = reset_control_reset(i2c_dev->rst);

If not, you will need something like this instead:

#ifdef CONFIG_ACPI
               err = acpi_evaluate_object(ACPI_HANDLE(...), "_RST", NULL, NULL);
#else
               err = reset_control_reset(i2c_dev->rst);
#endif

...

> +       err = device_property_read_u32(i2c_dev->dev, "clock-frequency",
> +                                      &i2c_dev->bus_clk_rate);
>         if (err)
>                 i2c_dev->bus_clk_rate = I2C_MAX_STANDARD_MODE_FREQ;

Actually you need to switch to use i2c_timings data structure and
corresponding methods.
This change will be incorporated there. I.o.w. do it as a prerequisite
to this patch.

...

> +       if (ACPI_HANDLE(i2c_dev->dev))
> +               return 0;

With above mentioned ifdeffery this may be converted back to
has_acpi_companion() which is slightly better in this case.

> +       if (ACPI_HANDLE(i2c_dev->dev))
> +               return 0;

Ditto.

P.S> Sorry if I missed something in the previous reviews.

-- 
With Best Regards,
Andy Shevchenko
