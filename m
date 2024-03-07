Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A24108748CB
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 08:36:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22EED10E382;
	Thu,  7 Mar 2024 07:36:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="mqM0Th9G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F39BC10E382
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 07:36:46 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1dd0d46ecc3so4462865ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 23:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709797006; x=1710401806;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w+MN4ptFkwcB+XZr/cs1zSULQpGzvYmR0JQ9D+CN+vc=;
 b=mqM0Th9GRmz1Qm9Scg4QNVDkqZqWOYgFcIX2F8wn/79b1atupr2joqafYaHbTFYTzV
 bRbvBn0z+7RzJRAnO+v6E4BrBvRXhHAdhDYYG+G1iHzjbwvwpSRI4aH/EEry/mfG362O
 x/shQ3Cdr3UIu84yV2+7hEMstNNvzODrpHjeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709797006; x=1710401806;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w+MN4ptFkwcB+XZr/cs1zSULQpGzvYmR0JQ9D+CN+vc=;
 b=WfdB2mK2RNhahHUXB2cvOkOExwJXDu/0O2/elRsvCWNfpv2NrUu+Zx3pAMUnglSve0
 /Q0Vv9aIN1HJDFJ/4EMFXufBa0nUA6WyqT3+/S/P8vcQ49xZ8lpAyMzXE61Y/RhN510q
 Er9WNV8SD7rhWEfzs63yvHCMpzBFYuPyfNAFAox+4hvvnnjvs3GDnwOG08ZijgR98tZX
 q/kTyu24Fd0SPvSDcSN4Pzo/K1+Vm4HdiA02clZzj8YcRo02kys8BfWw1A0gTEebGWtf
 VR+h6h1t0vPBGntJWhIFOc2qDd8TmsXQhaqp3Alpde4JatXBLSeo3s7x9zQytUdbRYOl
 g70w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1DDlrp/g9YNC7zDZKkI8oN1VF3a6iAuioYWSvbTgfu9AFsdsZ+vjbqXd/0gKSp//QR2Qei9zzywerYyIJuZJx9PeHCUyh1O8/76iA+Myw
X-Gm-Message-State: AOJu0YzLf+EhxZQZ94Sq4+sutcaP/l7q8diwNKzeClc5wZDF8mvGaKKb
 x77nKRjbHylNzRiqmCGMEkHlBJSGbUC2pnlCepeh6I68xgdbfZuQuX86BUMynmRBOhCv3DihvvX
 F95+Brl59l/ZTk9XmC7YMt6UMfm+I2watZdV1
X-Google-Smtp-Source: AGHT+IHvJsVqLgGrNZlh/xfdeWe4swJEY4jFYFEM6z8EhW5HhXST2toU/hsrYQOATquskgUKjmdb8WOGTkKmoMYBn+o=
X-Received: by 2002:a17:902:a389:b0:1dd:1c6f:af4f with SMTP id
 x9-20020a170902a38900b001dd1c6faf4fmr6633144pla.55.1709797006410; Wed, 06 Mar
 2024 23:36:46 -0800 (PST)
MIME-Version: 1.0
References: <20240306022003.259245-1-kuro.chung@ite.com.tw>
 <20240306022003.259245-2-kuro.chung@ite.com.tw>
In-Reply-To: <20240306022003.259245-2-kuro.chung@ite.com.tw>
From: Pin-yen Lin <treapking@chromium.org>
Date: Thu, 7 Mar 2024 15:36:35 +0800
Message-ID: <CAEXTbpccS64sb9_Ocjby1UxDWfkEPU6-JYRP4dWCKqGRe3Ux0A@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] UPSTREAM: drm/bridge: it6505: fix hibernate to
 resume no display issue
To: kuro <kuro.chung@ite.com.tw>
Cc: Allen Chen <allen.chen@ite.com.tw>, Kenneth Haung <kenneth.hung@ite.com.tw>,
 Allen Chen <allen.chen@ite.corp-partner.google.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
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

Following up my comments from v2 [1]:

On Wed, Mar 6, 2024 at 10:09=E2=80=AFAM kuro <kuro.chung@ite.com.tw> wrote:
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

IIUC you need to sign this off with your name as well. See [2] for more det=
ails.
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

I don't really like functions that only print one line of debug log,
but I'm not sure what other reviewers think about this.
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

Again, I think we need some code comments for this section, and some
of your replies should be included there.

And can you elaborate more about how this speeds up the video
stabilization? What would happen if we only clear the interrupts once
instead of doing a loop?

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

[1]: https://lore.kernel.org/all/CAEXTbpc6084rcmhFABw51SibU7FVyTWo=3DteQsET=
q5vCujGKWng@mail.gmail.com/
[2]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html=
#sign-your-work-the-developer-s-certificate-of-origin

Regards,
Pin-yen
