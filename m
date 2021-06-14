Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FA23A6AEA
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 17:50:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B0689C8D;
	Mon, 14 Jun 2021 15:50:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B1F889CA1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 15:50:13 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id u20so8902378qtx.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 08:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=752ESvCRE8KY4wkfPpFqjo9UfucyvbS7GoKBE01qEZU=;
 b=muxe8lmejubB+eNlKV0175SaVBKou/3/XLvvRkso5GiZKeUAFxzEKcgl5XNva88QTo
 n3Go2ynbh3v28WUzYzF9OBo3mAZQsooyNUIwyCrNyzs4EGHOCKXI6Osi5MA+9hcOUrqP
 dmrq3SDxgo+OaPGmXbvezZuVr1rMSN4MVmnf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=752ESvCRE8KY4wkfPpFqjo9UfucyvbS7GoKBE01qEZU=;
 b=plQLKaYJAiBIucTU6/NKZccwhEkXWr5wXt+xwODCYLdSYCoFD152RF++b1VEgOH1PV
 DiWinNuN11cphXlz15FSR/nt/QiHrW6kQZC56Ht++NsQ2g3ge/LWrg5sdJsSByrcgRJR
 QybbGbqBXy3pruhUIwl4m0znEWPVvMjN63bkwZbZhA2UuSSEmo30aXOqdi2VAGe1ZBdJ
 uBPOWjMMHFRIgeUyngSmDp9gNAO3CurkomaQzAwjbQcGsM61ccqmftVVfw/vHB23x9xv
 vL+ldAVsSmNI2+fS1MPAWeOuV5HQHOU3p46waWiExCT+CMAzEd9PN7mDibg9efkjLosd
 QLAw==
X-Gm-Message-State: AOAM532SY5/BzfznixzX4mwkXCi8Q+wDqXAt9EmtWztxxmUPZ1wzIt/t
 +1y+TdxtCERxFDhx1miJx32mvtZJbhSmHA==
X-Google-Smtp-Source: ABdhPJz1Qwgc93YASvBr75bg34/lHGYaTypiixYAp8kW6PUcx/DwbsEauQgU0H3aPCKcA2XuSmDYVA==
X-Received: by 2002:ac8:6951:: with SMTP id n17mr10356573qtr.340.1623685812168; 
 Mon, 14 Jun 2021 08:50:12 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com.
 [209.85.219.181])
 by smtp.gmail.com with ESMTPSA id f19sm10736567qkg.70.2021.06.14.08.50.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 08:50:11 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id p184so16074454yba.11
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 08:50:11 -0700 (PDT)
X-Received: by 2002:a25:8191:: with SMTP id p17mr25438219ybk.405.1623685811131; 
 Mon, 14 Jun 2021 08:50:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210611214243.669892-1-linus.walleij@linaro.org>
In-Reply-To: <20210611214243.669892-1-linus.walleij@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 14 Jun 2021 08:49:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U3kjPRuFsDA__vzMTPqnL12e0xG2A_Nb5wB=UxzUgdTg@mail.gmail.com>
Message-ID: <CAD=FV=U3kjPRuFsDA__vzMTPqnL12e0xG2A_Nb5wB=UxzUgdTg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: s6e63m0: Switch to DBI abstraction for SPI
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Jun 11, 2021 at 2:44 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
>  static int s6e63m0_spi_probe(struct spi_device *spi)
>  {
>         struct device *dev = &spi->dev;
> +       struct mipi_dbi *dbi;
>         int ret;
>
> -       spi->bits_per_word = 9;
> -       /* Preserve e.g. SPI_3WIRE setting */
> -       spi->mode |= SPI_MODE_3;
> -       ret = spi_setup(spi);
> -       if (ret < 0) {
> -               dev_err(dev, "spi setup failed.\n");
> -               return ret;
> -       }
> -       return s6e63m0_probe(dev, s6e63m0_spi_dcs_read, s6e63m0_spi_dcs_write,
> -                            false);
> +       dbi = devm_kzalloc(dev, sizeof(*dbi), GFP_KERNEL);
> +       if (!dbi)
> +               return -ENOMEM;
> +
> +       ret = mipi_dbi_spi_init(spi, dbi, NULL);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "MIPI DBI init failed\n");
> +       /* Register our custom MCS read commands */
> +       dbi->read_commands = s6e63m0_dbi_read_commands;
> +
> +       spi_set_drvdata(spi, dbi);

I _think_ you want to remove the spi_set_drvdata(). It just gets
clobbered by the dev_set_drvdata() in s6e63m0_probe(), right? That's
why you had to add the "void *" data pointer?

Other than that this looks right to my non-expert eyes. ;-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
