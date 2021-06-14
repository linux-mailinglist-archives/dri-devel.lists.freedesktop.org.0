Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD16C3A6AE7
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 17:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4465189AA2;
	Mon, 14 Jun 2021 15:50:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E705E89AA2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 15:50:01 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id r20so8893475qtp.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 08:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uVH8Bh1RQJHWJzQ1AoFaP946x9RYcZMc70c4ELHRu6Q=;
 b=b+Yp1rBmV0Nu1UYVC73/9bu6RZSFwBkgP/3JVTtI2b6ZpmndOWLMTPzXxALS4k06z7
 6t8ORgJmUb/F5e72PgWMsaHwOY+NQd349MZjFI171H41ZrcPB5ipgsB8FE2KbPPCSXyW
 ykOh+Yf8QF25Jw2zXqHHTQEbmSy4nMWHUl/NA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uVH8Bh1RQJHWJzQ1AoFaP946x9RYcZMc70c4ELHRu6Q=;
 b=QsADm1T3sLUyZG2wlLQuhxatAyHHU2q0mJYYErBmpqJlExtv60XqfwVo8xCKHMzivt
 dX3OH+9Exw2KyzLXRtqg0FelWl0ktB7Bp53t6QCC/dTeFZ9jk6ydomjrz/Z1omXWWwEJ
 tSQK40ssuKqVAiDY6wlG0mJ8KVGxskx0ic1E8qV9lWdoBE6xIN8XDYYRCmbNxfLj9KCb
 bw18IfVCBWPtC+l/mVhAFsBTPSpRNLqEHfJXB/5KGbZS5NsVYQM/TE0ozakkmM1MV6ev
 kthwFgrT7fm6pcdQ3JtmkYB9fmYN8pImTyBAYk1CxFAOwSR9coGgolPVkkE9P4Hakjj1
 EaIw==
X-Gm-Message-State: AOAM532ENwOAyTPcHVRAFu2nV2e2hzvtcMm9sjnNpUABouMB0fMVHl/S
 y6juagW3rRlpx4WBdzLBJh3pdV6hbqXfpw==
X-Google-Smtp-Source: ABdhPJyAM0PX2sKCTHuol+FhHfqXFIJUfi4hQ+s1Iv1rClkyAs/y42/t95063NBoYo8JLXUR9mflaQ==
X-Received: by 2002:ac8:5d47:: with SMTP id g7mr4813019qtx.351.1623685800576; 
 Mon, 14 Jun 2021 08:50:00 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com.
 [209.85.219.181])
 by smtp.gmail.com with ESMTPSA id i11sm10213770qkl.95.2021.06.14.08.49.59
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 08:49:59 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id g38so16083086ybi.12
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 08:49:59 -0700 (PDT)
X-Received: by 2002:a25:80d4:: with SMTP id c20mr25102536ybm.345.1623685799348; 
 Mon, 14 Jun 2021 08:49:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210611212736.668563-1-linus.walleij@linaro.org>
In-Reply-To: <20210611212736.668563-1-linus.walleij@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 14 Jun 2021 08:49:47 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VZbamOOKCkvyOzy_4-xKwkMpp=eLaaAGDv4xv=eEQigw@mail.gmail.com>
Message-ID: <CAD=FV=VZbamOOKCkvyOzy_4-xKwkMpp=eLaaAGDv4xv=eEQigw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/dbi: Support DBI typec1 read operations
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

On Fri, Jun 11, 2021 at 2:29 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> +static int mipi_dbi_typec1_command_read(struct mipi_dbi *dbi, u8 *cmd,
> +                                       u8 *data, size_t len)
> +{
> +       struct spi_device *spi = dbi->spi;
> +       u32 speed_hz = min_t(u32, MIPI_DBI_MAX_SPI_READ_SPEED,
> +                            spi->max_speed_hz / 2);

I'm kinda curious why "max_speed_hz / 2", but you match the "typec3"
version of this so I guess it's right?


> +       struct spi_transfer tr[2] = {
> +               {
> +                       .speed_hz = speed_hz,
> +                       .bits_per_word = 9,
> +                       .tx_buf = dbi->tx_buf9,
> +                       .len = 2,
> +               }, {
> +                       .speed_hz = speed_hz,
> +                       .bits_per_word = 8,
> +                       .len = len,
> +                       .rx_buf = data,
> +               },
> +       };
> +       struct spi_message m;
> +       u16 *dst16;
> +       int ret;
> +
> +       if (!len)
> +               return -EINVAL;
> +
> +       if (!spi_is_bpw_supported(spi, 9)) {
> +               /*
> +                * FIXME: implement something like mipi_dbi_spi1e_transfer() but
> +                * for reads using emulation.
> +                */
> +               dev_err(&spi->dev,
> +                       "reading on host not supporting 9 bpw not yet implemented\n");
> +               return -EOPNOTSUPP;
> +       }
> +
> +       /*
> +        * Turn the 8bit command into a 16bit version of the command in the
> +        * buffer. Only 9 bits of this will be used when executing the actual
> +        * transfer.
> +        */
> +       dst16 = dbi->tx_buf9;
> +       dst16[0] = *cmd;
> +
> +       spi_message_init_with_transfers(&m, tr, ARRAY_SIZE(tr));
> +       ret = spi_sync(spi, &m);
> +
> +       MIPI_DBI_DEBUG_COMMAND(*cmd, data, len);

nit: Only call MIPI_DBI_DEBUG_COMMAND() if !ret? Otherwise on an error
you're just going to output whatever random data was already in the
buffer that the user passed you. I suppose that same bug is present in
mipi_dbi_typec3_command_read().

Other than that, this seems OK based on my feeble understanding of
MIPI DBI (I couldn't even find the docs that I dug up before, sadly).
Luckily Noralf is also here to review that part! :-) I'm happy with:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
