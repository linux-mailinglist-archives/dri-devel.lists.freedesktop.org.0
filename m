Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A00FB86FE02
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 10:52:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8CE510FEE8;
	Mon,  4 Mar 2024 09:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="DaE6wIoG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C5A610FEEA
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 09:52:06 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id
 e9e14a558f8ab-3652731b2b7so16364955ab.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 01:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709545925; x=1710150725;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hx8/Hsvcr26lKZm0DtuzO5aNbidCutGEeUVS79P8xjM=;
 b=DaE6wIoGfZXiI1lYidXdlEHjDSM2SOAYAxdQZCUQ79EG3NVEHnpqgKVLpWTXteg5zt
 cMxc5zjZqIxr7AC4c0+EbnAdIyQ/9qDfywzNRYCBLpRqkq9y7bN2tWi/6ELOHBQMFOOs
 fTc6I6t6arP+ijHwXbOOUaSXZMO+dJY8RQzi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709545925; x=1710150725;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hx8/Hsvcr26lKZm0DtuzO5aNbidCutGEeUVS79P8xjM=;
 b=TpyBZSrYNF+5u1z03pySZGBg0h70dHvT1Z7hDojvkqd7u0rjYYxcndid9roJSLrpFN
 au4wS/rDp2v8zxnwDS1cOp1xuCmhpmMhzY9UmiKXBctLJ0PyixE6sF2l0NInogaFu/z8
 ObWi8tb7QYlgBidhqzHkPgwn6nwQpsmkCP/7rUHDQWixuO80A4Y8HHXVaOqM0PA6M/yd
 KKsHT/80RQsmUOorElXpMZvyfcKclsvFwacmDAXVs2lr/57t9Qo1QxbjEZDs9zJ1N5B/
 sq0tk+r59aJtkRbqM0yi3mn84KJpFiEakfDp3UOD5JCItXufVjpgTRDJ6aOKnUsJP3YY
 iQIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMMd2gmaHSxFfiQL+W5cKwEeNeFq+zT3+BkLqSgLctVI7qOez8WRO6ftAKi5CO5f4pwp5uQP85aRu04SWmdBPycdA9KPNxfpZ6VX99HRgs
X-Gm-Message-State: AOJu0YxYewp4UDVZqLBbdvfNs9BmBFtrhLG10DwRSEVA3qM7jTE48+um
 6h4VIPi0RZZg71zw78v/ZaOw1aI+lZTKufCTN1m0mAsS9rFgTVzhqtYuIuYTXkPVUMrfJ+D51zE
 vJZYXFUvGtR0977v7oB3PCoB5tSF9SYr6tov2
X-Google-Smtp-Source: AGHT+IH/NAnRd0+yII2gWLY3BpVKXn2PCZi/S1811itOlN+9KIoSfK3mWzqkvq+toKSfLZpuAryNZA+TrKh7tLuCAvo=
X-Received: by 2002:a92:c569:0:b0:365:c6ae:c40e with SMTP id
 b9-20020a92c569000000b00365c6aec40emr10789756ilj.0.1709545925353; Mon, 04 Mar
 2024 01:52:05 -0800 (PST)
MIME-Version: 1.0
References: <20240304031945.250763-1-kuro.chung@ite.com.tw>
 <20240304031945.250763-2-kuro.chung@ite.com.tw>
In-Reply-To: <20240304031945.250763-2-kuro.chung@ite.com.tw>
From: Pin-yen Lin <treapking@chromium.org>
Date: Mon, 4 Mar 2024 17:51:54 +0800
Message-ID: <CAEXTbpc6084rcmhFABw51SibU7FVyTWo=teQsETq5vCujGKWng@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] UPSTREAM: drm/bridge: it6505: fix hibernate to
 resume no display issue
To: kuro <kuro.chung@ite.com.tw>
Cc: Kenneth Haung <kenneth.hung@ite.com.tw>,
 Andrzej Hajda <a.hajda@samsung.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, 
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Kuro,

On Mon, Mar 4, 2024 at 11:08=E2=80=AFAM kuro <kuro.chung@ite.com.tw> wrote:
>
> From: kuro chung <kuro.chung@ite.com.tw>
>
> ITE added a FIFO reset bit for input video. When system power resume,
> the TTL input of it6505 may get some noise before video signal stable
> and the hardware function reset is required.
> But the input FIFO reset will also trigger error interrupts of output mod=
ule rising.
> Thus, it6505 have to wait a period can clear those expected error interru=
pts
> caused by manual hardware reset in one interrupt handler calling to avoid=
 interrupt looping.
>
> Signed-off-by: Allen Chen <allen.chen@ite.corp-partner.google.com>
> (cherry picked from commit Iaa3cd9da92a625496f579d87d0ab74ca9c4937c4)
>
> BUG=3DNone
> TEST=3DNone
>
> Change-Id: Iaa3cd9da92a625496f579d87d0ab74ca9c4937c4

Again, please remove the gerrit-specific lines like "BUG=3D",
"Change-Id", and the "cherry picked from commit ...".
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 54 ++++++++++++++++++++++++-----
>  1 file changed, 45 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge=
/ite-it6505.c
> index b53da9bb65a16..e592e14a48578 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -1318,6 +1318,8 @@ static void it6505_video_reset(struct it6505 *it650=
5)
>         it6505_set_bits(it6505, REG_DATA_MUTE_CTRL, EN_VID_MUTE, EN_VID_M=
UTE);
>         it6505_set_bits(it6505, REG_INFOFRAME_CTRL, EN_VID_CTRL_PKT, 0x00=
);
>         it6505_set_bits(it6505, REG_RESET_CTRL, VIDEO_RESET, VIDEO_RESET)=
;
> +       it6505_set_bits(it6505, REG_VID_BUS_CTRL1, TX_FIFO_RESET, 0x02);
> +       it6505_set_bits(it6505, REG_VID_BUS_CTRL1, TX_FIFO_RESET, 0x00);
>         it6505_set_bits(it6505, REG_501_FIFO_CTRL, RST_501_FIFO, RST_501_=
FIFO);
>         it6505_set_bits(it6505, REG_501_FIFO_CTRL, RST_501_FIFO, 0x00);
>         it6505_set_bits(it6505, REG_RESET_CTRL, VIDEO_RESET, 0x00);
> @@ -2480,10 +2482,6 @@ static void it6505_irq_video_fifo_error(struct it6=
505 *it6505)
>         struct device *dev =3D &it6505->client->dev;
>
>         DRM_DEV_DEBUG_DRIVER(dev, "video fifo overflow interrupt");
> -       it6505->auto_train_retry =3D AUTO_TRAIN_RETRY;
> -       flush_work(&it6505->link_works);
> -       it6505_stop_hdcp(it6505);
> -       it6505_video_reset(it6505);
>  }
>
>  static void it6505_irq_io_latch_fifo_overflow(struct it6505 *it6505)
> @@ -2491,10 +2489,6 @@ static void it6505_irq_io_latch_fifo_overflow(stru=
ct it6505 *it6505)
>         struct device *dev =3D &it6505->client->dev;
>
>         DRM_DEV_DEBUG_DRIVER(dev, "IO latch fifo overflow interrupt");
> -       it6505->auto_train_retry =3D AUTO_TRAIN_RETRY;
> -       flush_work(&it6505->link_works);
> -       it6505_stop_hdcp(it6505);
> -       it6505_video_reset(it6505);
>  }
>
>  static bool it6505_test_bit(unsigned int bit, const unsigned int *addr)
> @@ -2502,6 +2496,46 @@ static bool it6505_test_bit(unsigned int bit, cons=
t unsigned int *addr)
>         return 1 & (addr[bit / BITS_PER_BYTE] >> (bit % BITS_PER_BYTE));
>  }
>
> +static bool it6505_is_video_error_int(const int *int_status)
> +{
> +       if ((it6505_test_bit(BIT_INT_VID_FIFO_ERROR, (unsigned int *)int_=
status)) || (it6505_test_bit(BIT_INT_IO_FIFO_OVERFLOW, (unsigned int *)int_=
status)))
> +               return 1;
> +       return 0;
> +}
> +
> +static void it6505_irq_video_error_handler(struct it6505 *it6505)
> +{
> +       struct device *dev =3D &it6505->client->dev;
> +       int int_status[3] =3D {0};
> +       int reg_0d;
> +       int i;
> +
> +       it6505->auto_train_retry =3D AUTO_TRAIN_RETRY;
> +       flush_work(&it6505->link_works);
> +       it6505_stop_hdcp(it6505);
> +       it6505_video_reset(it6505);
> +
> +       DRM_DEV_DEBUG_DRIVER(dev, "Video Error reset wait video...");
> +
> +       for (i =3D 0; i < 10; i++) {
> +               usleep_range(10000, 11000);
> +               int_status[2] =3D it6505_read(it6505, INT_STATUS_03);
> +               reg_0d =3D it6505_read(it6505, REG_SYSTEM_STS);
> +               it6505_write(it6505, INT_STATUS_03, int_status[2]);
> +
> +               DRM_DEV_DEBUG_DRIVER(dev, "reg08 =3D 0x%02x", int_status[=
2]);
> +               DRM_DEV_DEBUG_DRIVER(dev, "reg0D =3D 0x%02x", reg_0d);
> +
> +               if ((reg_0d & VIDEO_STB) && (reg_0d >=3D 0))
> +                       break;
> +
> +               if (it6505_is_video_error_int(int_status)) {
> +                       it6505_video_reset(it6505);
> +                       DRM_DEV_DEBUG_DRIVER(dev, "Video Error reset wait=
 video (%d)", i);
> +               }
> +       }
> +}
> +
>  static irqreturn_t it6505_int_threaded_handler(int unused, void *data)
>  {
>         struct it6505 *it6505 =3D data;
> @@ -2522,7 +2556,7 @@ static irqreturn_t it6505_int_threaded_handler(int =
unused, void *data)
>                 { BIT_INT_VID_FIFO_ERROR, it6505_irq_video_fifo_error },
>                 { BIT_INT_IO_FIFO_OVERFLOW, it6505_irq_io_latch_fifo_over=
flow },
>         };
> -       int int_status[3], i;
> +       int int_status[3], i, reg_0d;
>
>         if (it6505->enable_drv_hold || !it6505->powered)
>                 return IRQ_HANDLED;
> @@ -2550,6 +2584,8 @@ static irqreturn_t it6505_int_threaded_handler(int =
unused, void *data)
>                         if (it6505_test_bit(irq_vec[i].bit, (unsigned int=
 *)int_status))
>                                 irq_vec[i].handler(it6505);
>                 }
> +               if (it6505_is_video_error_int(int_status))
> +                       it6505_irq_video_error_handler(it6505);
>         }
>
>         pm_runtime_put_sync(dev);
> --
> 2.25.1
>

Did you check my comments in v1? Please reply if you don't agree with
those comments.

By the way, some mails are bounced back because of the address
changes. Please refer to the MAINTINERS file on the latest kernel (not
ChromeOS v5.15 downstream branch) for the contacts.

Regards,
Pin-yen
