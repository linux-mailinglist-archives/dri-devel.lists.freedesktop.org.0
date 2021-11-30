Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A365A462E5F
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 09:16:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E0E6E989;
	Tue, 30 Nov 2021 08:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E32E26E97F
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 08:16:50 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id p37so39672037uae.8
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 00:16:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3tvLL9kOtzMPDSDABpyDexTlx7DFRm6dXyi4fSUyw0k=;
 b=dFiIyhqdbu3DKR9nLI0iGrez4vrQZtUe/E5ZqhlWZYMXYTpB3EeBBA6D/BXBqTOkx7
 SB6yfces9GjYmVvb6AgzXj+bERfuyv0AFijBnIKcNzHHxeQ0POUmxHj5Nsk0PFz/Jf4w
 SWnyrcpwt0ZYra96rOMLSfbrLE30gwIDJHqi3xWaZFFnyFdRF+5dt3NFxHfGKOrzF9M7
 0qdpoxqiy2UebBYh2myMDrcEDTOucNFNg1o1zJ0WmD8h0laT06Ir9E9Mj4kePNNnLIXf
 BjNsiY8aiyqNNOscb/YuXiLIWkR8OLlV2cVqA1CoUhlp2gYBJ5RUjSYRGU8M4rh2KZpq
 YIxg==
X-Gm-Message-State: AOAM5330YvRn5OO1EeUQJteQI8URbKS5l372aC0oaPlaYA8diYYrQCdi
 P8QF4o3PR96rU7qDIvq1BPxq1eATXwKAhg==
X-Google-Smtp-Source: ABdhPJyDpe7pF7/aXeNb7DQzzTIgjmqihuvsil/7sZmK3qYfco5sKww3qo6h2ve5j4XHfAD9NXq4kw==
X-Received: by 2002:ab0:6f0a:: with SMTP id r10mr57216810uah.106.1638260209908; 
 Tue, 30 Nov 2021 00:16:49 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com.
 [209.85.222.53])
 by smtp.gmail.com with ESMTPSA id l28sm9670251vkn.45.2021.11.30.00.16.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 00:16:49 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a14so39771065uak.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 00:16:49 -0800 (PST)
X-Received: by 2002:a05:6102:e10:: with SMTP id
 o16mr37823915vst.5.1638260209223; 
 Tue, 30 Nov 2021 00:16:49 -0800 (PST)
MIME-Version: 1.0
References: <aadbd32c-c0ab-4c8a-c590-3334f736f224@gmail.com>
In-Reply-To: <aadbd32c-c0ab-4c8a-c590-3334f736f224@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Nov 2021 09:16:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU_90XdFZM6kVA78XUX+7+Jm1WqjBmBN7irVOY3k-Gcfg@mail.gmail.com>
Message-ID: <CAMuHMdU_90XdFZM6kVA78XUX+7+Jm1WqjBmBN7irVOY3k-Gcfg@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: add spi_device_id table
To: Heiner Kallweit <hkallweit1@gmail.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-staging@lists.linux.dev,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Heiner,

On Mon, Nov 29, 2021 at 10:12 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
> After 5fa6863ba692 ("spi: Check we have a spi_device_id for each DT
> compatible") we need the following to make the SPI core happy.
>
> Works for me with a SH1106-based OLED display.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Thanks for your patch!

> --- a/drivers/staging/fbtft/fbtft.h
> +++ b/drivers/staging/fbtft/fbtft.h
> @@ -307,12 +307,19 @@ static const struct of_device_id dt_ids[] = {                              \
>                                                                            \
>  MODULE_DEVICE_TABLE(of, dt_ids);                                           \
>                                                                            \
> +static const struct spi_device_id spi_ids[] = {                            \
> +       { .name = _compatible },                                           \

Shouldn't this be the part of _compatible after the "<vendor>," prefix?

> +       {},                                                                \
> +};                                                                         \
> +                                                                          \
> +MODULE_DEVICE_TABLE(spi, spi_ids);                                        \
>                                                                            \
>  static struct spi_driver fbtft_driver_spi_driver = {                       \
>         .driver = {                                                        \
>                 .name   = _name,                                           \
>                 .of_match_table = dt_ids,                                  \
>         },                                                                 \
> +       .id_table = spi_ids,                                               \
>         .probe  = fbtft_driver_probe_spi,                                  \
>         .remove = fbtft_driver_remove_spi,                                 \
>  };                                                                         \

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
