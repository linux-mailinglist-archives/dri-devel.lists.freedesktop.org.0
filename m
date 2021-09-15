Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8DA40CF14
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 23:57:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C0C6EA6E;
	Wed, 15 Sep 2021 21:57:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1056B6EA6E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 21:57:46 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id g9so5412406ioq.11
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 14:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TzpBTwqbvFq/TilgQetFLjjI03dWCIPzcsLrYptjiKc=;
 b=K6TMOauirSkiFMCwCeX2VqFIOB5bE6uQEXKKkqTILVEQ91KLpfHsDFwiS5d9bhVgbZ
 IXMsjXJ8tPickITCEI9YSB4pK1mF2nWDXBajTRZ9yYTPo08FP5w5PSgK1EJiKI+9MxtD
 flsuvMHCXjN2ePJgCg7E55UUs+Skjlpgj+9KM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TzpBTwqbvFq/TilgQetFLjjI03dWCIPzcsLrYptjiKc=;
 b=PR2TVR1aT3/uydrc1AHDwEnO151KriMVRONx1BmBiqk+UNgkcXsr8CluDPQOakSCif
 AngqJdSHbmE2oyL9Z09Jb/pdpjgWfTIvSRGF4gOS8+MMYXzXvRDw04G0R8QS2IZZAYsf
 fQETA6ZILlo+8VVIjL1tD8c2lj2KylDrrtZscRQY4bF9FSVMneluALKsME3xQIeEawPi
 C1uXUqajwR6maBw/039GylpVmppf0/UGPnTEJ9icyluH+BmKWVZQUIsgV+QRmu9UWvsw
 0ToYwj6gTLru9gP9ip9hHz5w+EHXPKlzQoqm847whvY4dnMkfBic4qLEGHgDlVk0K1aR
 u5fA==
X-Gm-Message-State: AOAM531McfiB2NUopnXQ3asy3lVDwf7hnpuw6mYEB2NfrIS5whiVK1+j
 PGyPeSxYzypJCoHk6W0z8u93sqxzI78MvQ==
X-Google-Smtp-Source: ABdhPJwhW0EnfuXfrNNt5JlPUk2lv0Z5g8k457DifbHHvNf/vvLA1HnLa2cYDYroQCsHOwK0zkF5eA==
X-Received: by 2002:a05:6638:1613:: with SMTP id
 x19mr1772020jas.77.1631743065008; 
 Wed, 15 Sep 2021 14:57:45 -0700 (PDT)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com.
 [209.85.166.46])
 by smtp.gmail.com with ESMTPSA id h9sm560152ioz.30.2021.09.15.14.57.43
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 14:57:43 -0700 (PDT)
Received: by mail-io1-f46.google.com with SMTP id a15so5447393iot.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 14:57:43 -0700 (PDT)
X-Received: by 2002:a02:6d59:: with SMTP id e25mr1826747jaf.68.1631743062700; 
 Wed, 15 Sep 2021 14:57:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210913143255.RFC.v2.1.I8ad7a535bb18a1f41f3858f83379beedb397a9db@changeid>
 <20210913143255.RFC.v2.2.I2f55fee564b0008908d8a25a8825117119c80c4a@changeid>
 <CAD=FV=UGicZhuZHmc8asQU6kGgGGg+nZDqKPJ5QOc5tH3eBf9Q@mail.gmail.com>
 <CA+cxXhnqOjRah_K5OoTE1SN8u5WK0WkLkZwsaTiFoBVijaVw_Q@mail.gmail.com>
In-Reply-To: <CA+cxXhnqOjRah_K5OoTE1SN8u5WK0WkLkZwsaTiFoBVijaVw_Q@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 15 Sep 2021 14:57:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VH767enDNFO01+Y9Y3QEyAqSzCLzCd=cTuGGYziK5icA@mail.gmail.com>
Message-ID: <CAD=FV=VH767enDNFO01+Y9Y3QEyAqSzCLzCd=cTuGGYziK5icA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/2] drm/bridge: parade-ps8640: Add support for AUX
 channel
To: Philip Chen <philipchen@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
 Andrzej Hajda <a.hajda@samsung.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
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

Hi,

On Tue, Sep 14, 2021 at 5:28 PM Philip Chen <philipchen@chromium.org> wrote:
>
> > > Changes in v2:
> > > - Handle the case where an AUX transaction has no payload
> > > - Add a reg polling for p0.0x83 to confirm AUX cmd is issued and
> > >   read data is returned
> > > - Replace regmap_noinc_read/write with looped regmap_read/write,
> > >   as regmap_noinc_read/write doesn't read one byte at a time unless
> > >   max_raw_read/write is set to 1.
> >
> > What about if you set val_bytes? I think you just need to set that to
> > "1" and it'll work?
> I think val_bytes is already set to 1 as we set val_bits to 8. See:
> map->format.val_bytes = DIV_ROUND_UP(config->val_bits, 8);

To me that feels like a bug in the regmap API, then. I can't see how
it would make any sense for this function not to take val_bytes into
account...

I wonder if other users are somehow getting lucky today. Maybe users
that are using this for MMIO get lucky because max_raw_read is set
properly. ...and maybe other i2c users get lucky because some
peripherals are OK w/ this bug? AKA, maybe this actually works in most
cases for FIFOs:

write address of bridge chip on i2c bus
write R/W bit on i2c bus
write FIFO register address on i2c bus
read byte
read byte
read byte
...
read byte
read byte
end transaction

Normally for i2c you assume that the other side will read from
subsequent register addresses for each "read byte", but I suppose it's
possible that some i2c devices are setup to realize that if the
register address was the address of a FIFO that it shouldn't read from
the next register address but should just read the next byte in the
FIFO?


In any case, it's fine to do it with a loop like you're doing but it
still seems weird that you'd need to.


-Doug
