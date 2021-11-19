Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DB6457123
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 15:49:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7006B6EADD;
	Fri, 19 Nov 2021 14:48:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796506E1A2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 14:48:56 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id w1so43723447edc.6
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 06:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gLcPnEMAwn4t7y2It8oukzLDDUn4wXSHmhDRC10RgYM=;
 b=ReFLHuCsLSa3RFvmafruRHyEDa+24KgoUn+zoWLzX/eFaciYyQ18TlV5aTFsqW74Vw
 Y8cws5QpsPLc7Llvd2wTb53johfDd2D1cUOndTkORzQLOEJqZ3Z4IagFMUvPnzidqc2V
 kbOsj2V8I+/SB3a3JoIrYsdKpsR+6pYgjrocfGdv8cyE4Xu4jhxg4zCiwRaUGqKnHIcw
 2dIGpGcOPo6tZwXEe9UBtlA4N7cpC7E+TN52xTXzVVQvu/KbERUQBW/lOD2NhrzA1J/u
 ZpDERNKi3lBRvefPf2/OPBwpHrtCzfWLQXyERoWJQQt5Uw8+xPsNUrYnPUkhKsNDB3Ck
 FG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gLcPnEMAwn4t7y2It8oukzLDDUn4wXSHmhDRC10RgYM=;
 b=W6N5xtX4ybNvC20gqiySREiLGP4nI2SE9vhn54stIVwQPQHoyT+WfWkuYaqbG2F+XB
 ns7qtSZtMdbE8XGsaRQwUMfeU6rxmWp9xSGrzGnCat07TYqxntzeQmvv/ATcl4y9YfHV
 NHlzVYHSlXObOuiQ4I5iuUXCQQcPgZLXdJBdiFb5IOJ2XDLsjHTBzoYzqK2Vtl25WXPg
 oRIhqCAW+czTEoKDux2SvxqTdDBftiNZHD2A/7xYjIHUVXsmpeaZFeW+zyJmcGDIokWx
 cKPVBIea806q2C/dG4crW7ZMY+QQaKMZILNMLJ1gQ6/29XjAmIjtc+Io+sR7BFSrL1Kp
 6nVQ==
X-Gm-Message-State: AOAM530NNvsK2DzBVavGarAWyc2Ga6NlfB9vDspsP1mHFVaOE8J2iscJ
 k1GlsqM1G+IARLmMSxpY4/IrW+SXBE30MQkiZHg=
X-Google-Smtp-Source: ABdhPJz/LT7khmndaJh6E/cCCG+ln1v78jV4U/c8af892ac//k86Y0EQaIRpS4DpsrDA8ornzvTTsvXSwXQvAI9pdsc=
X-Received: by 2002:a17:906:489b:: with SMTP id
 v27mr8270031ejq.567.1637333334906; 
 Fri, 19 Nov 2021 06:48:54 -0800 (PST)
MIME-Version: 1.0
References: <1637328734-20576-1-git-send-email-akhilrajeev@nvidia.com>
In-Reply-To: <1637328734-20576-1-git-send-email-akhilrajeev@nvidia.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 19 Nov 2021 16:48:15 +0200
Message-ID: <CAHp75Vfi5gw4jnJg2bmubKMB_H8s09PfNWVVZWwewuCnW5_+hg@mail.gmail.com>
Subject: Re: [PATCH] i2c: tegra: Add ACPI support
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
Cc: Christian Koenig <christian.koenig@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jon Hunter <jonathanh@nvidia.com>,
 linaro-mm-sig@lists.linaro.org, Laxman Dewangan <ldewangan@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-i2c <linux-i2c@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>, Dmitry Osipenko <digetx@gmail.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 19, 2021 at 3:37 PM Akhil R <akhilrajeev@nvidia.com> wrote:
>
> Add support for ACPI based device registration so that the driver
> can be also enabled through ACPI table.

the ACPI

...

> +       if (has_acpi_companion(i2c_dev->dev)) {

You are checkin for the companion and using a handle, why not check
for a handle explicitly?

> +               acpi_evaluate_object(ACPI_HANDLE(i2c_dev->dev), "_RST",
> +                                    NULL, NULL);
> +       } else {
> +               err = reset_control_reset(i2c_dev->rst);
> +               WARN_ON_ONCE(err);
> +       }

...

> +       if (i2c_dev->nclocks == 0)
> +               return;

Why? Make clocks optional.

...

> -       i2c_dev->rst = devm_reset_control_get_exclusive(i2c_dev->dev, "i2c");
> -       if (IS_ERR(i2c_dev->rst)) {

> -               dev_err_probe(i2c_dev->dev, PTR_ERR(i2c_dev->rst),
> -                             "failed to get reset control\n");
> -               return PTR_ERR(i2c_dev->rst);

Besides the fact this should be as simple as

return dev_err_probe(...)

> -       }

> +       if (!has_acpi_companion(&pdev->dev)) {

...why do you do this?

> +               i2c_dev->rst = devm_reset_control_get_exclusive(i2c_dev->dev, "i2c");
> +               if (IS_ERR(i2c_dev->rst)) {
> +                       dev_err_probe(i2c_dev->dev, PTR_ERR(i2c_dev->rst),
> +                                     "failed to get reset control\n");
> +                       return PTR_ERR(i2c_dev->rst);
> +               }

...

> +static const struct acpi_device_id tegra_i2c_acpi_match[] = {
> +       {.id = "NVDA0101", .driver_data = (kernel_ulong_t)&tegra210_i2c_hw},
> +       {.id = "NVDA0201", .driver_data = (kernel_ulong_t)&tegra186_i2c_hw},
> +       {.id = "NVDA0301", .driver_data = (kernel_ulong_t)&tegra194_i2c_hw},

> +       { },

No comma for the terminator entry.

> +};

-- 
With Best Regards,
Andy Shevchenko
