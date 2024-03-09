Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 979AF876F77
	for <lists+dri-devel@lfdr.de>; Sat,  9 Mar 2024 08:11:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C174E10F7AB;
	Sat,  9 Mar 2024 07:11:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="f9udrGtf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AFA610F78A
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Mar 2024 07:11:46 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-6e56787e691so2677237b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Mar 2024 23:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709968306; x=1710573106;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LzMizfaSjLR1VVjX8BQWxkiusEt5V28FKCfB4nOvlsI=;
 b=f9udrGtffDNPLs6gmy3SW+s35vd+VcS7DV0YYuU2e4yzTKJhpU07E04n+qhxPhL8eS
 cebO0M8BXPQQOpJmLk4N85zzdpPMnTdNAARlodrc9g0rXID02GFFlC3Rt1nTkA2zjbI2
 UZ6e2UXIsDiGOFamHa06C8FPUO95OnxNzJjEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709968306; x=1710573106;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LzMizfaSjLR1VVjX8BQWxkiusEt5V28FKCfB4nOvlsI=;
 b=o1s1jf7YmFEvDGO8SpP0ar2U4qVKsuGtcly29ZLLawVdDfjVGPXU0Y7B+ySDouRws3
 tu3qmX4oQ06JgghHRAkXlGQ8LuVx3VZB9YV+iFzO7YqTymkXo971u2kfwBafMhN1iBET
 Yhes2CJUoUBVNZAhwcla6FIduEbI/Zx/eR8OTO79M/6S6A0NvDks8uRH2X9DR5B3So5Z
 2gIA657VgCyq22hQhm68leORDNntb2kOU17FwGbvwwj3eD1jAKBRIJTzgabG1H6GltIE
 vfreGYSa9Z6MeZPM8GgkScM1N2c4GOHuCWboBYXVRf2KI0KNWLSQfWiUn72Asn8yYv3c
 X57w==
X-Forwarded-Encrypted: i=1;
 AJvYcCURwx8O0hIZAvkQ1y4wI9IcK7wVOXNyl8R2b/dFzPQ0vFvpz4LKy7BVfOixpBqkHv52jU8iv4clJcl78Cvbbrc4NF/vr7SJ6WzdLx721zFL
X-Gm-Message-State: AOJu0YyqWfUra5hdCPC//U8OD62R9/USOJHwgYLBwaZSxijk/EDJ01AK
 owe7E8RDaqSeLJ/oeKjRRAwSg2QMekiL/SC4kNZ2x1mJJwBvlEbzrQgZ/QVDOZ1ql+q4DwC+Lsc
 Ze1qcOwA9Ylejl0HdqyQfnp5kyE2UeJFTqYtT
X-Google-Smtp-Source: AGHT+IEjv3I74rC5g5xttaAypFWQmqJiyvJ1tVlk5IQ8Hs7cvr3AbTcQJPutfvDuP4dT6AXev5gMw+VQ3hhs7s7zuLM=
X-Received: by 2002:a17:903:1c9:b0:1dd:6c08:af with SMTP id
 e9-20020a17090301c900b001dd6c0800afmr1493796plh.4.1709968305651; Fri, 08 Mar
 2024 23:11:45 -0800 (PST)
MIME-Version: 1.0
References: <20240308090548.269625-1-kuro.chung@ite.com.tw>
 <20240308090548.269625-2-kuro.chung@ite.com.tw>
In-Reply-To: <20240308090548.269625-2-kuro.chung@ite.com.tw>
From: Pin-yen Lin <treapking@chromium.org>
Date: Sat, 9 Mar 2024 15:11:34 +0800
Message-ID: <CAEXTbpemo3FDkOUf_3Wb0dbQxHKjP5OykdkkvK-xgHgqCR4pkQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] drm/bridge: it6505: fix hibernate to resume no
 display issue
To: kuro <kuro.chung@ite.com.tw>
Cc: Allen Chen <allen.chen@ite.com.tw>, Kenneth Haung <kenneth.hung@ite.com.tw>,
 Kuro Chung <kuro.chung@ite.corp-partner.google.com>, 
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

On Fri, Mar 8, 2024 at 4:54=E2=80=AFPM kuro <kuro.chung@ite.com.tw> wrote:
>
> From: Kuro <kuro.chung@ite.com.tw>
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
> Signed-off-by: Kuro Chung <kuro.chung@ite.corp-partner.google.com>
>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 50 ++++++++++++++++++++---------
>  1 file changed, 35 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge=
/ite-it6505.c
> index b53da9bb65a16..eff888fe7c2e7 100644
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
> @@ -2475,31 +2477,49 @@ static void it6505_irq_link_train_fail(struct it6=
505 *it6505)
>         schedule_work(&it6505->link_works);
>  }
>
> -static void it6505_irq_video_fifo_error(struct it6505 *it6505)
> +static bool it6505_test_bit(unsigned int bit, const unsigned int *addr)
>  {
> -       struct device *dev =3D &it6505->client->dev;
> +       return 1 & (addr[bit / BITS_PER_BYTE] >> (bit % BITS_PER_BYTE));
> +}
>
> -       DRM_DEV_DEBUG_DRIVER(dev, "video fifo overflow interrupt");
> -       it6505->auto_train_retry =3D AUTO_TRAIN_RETRY;
> -       flush_work(&it6505->link_works);
> -       it6505_stop_hdcp(it6505);
> -       it6505_video_reset(it6505);
> +static bool it6505_is_video_error_int(const int *int_status)
> +{
> +       if ((it6505_test_bit(BIT_INT_VID_FIFO_ERROR, (unsigned int *)int_=
status)) || (it6505_test_bit(BIT_INT_IO_FIFO_OVERFLOW, (unsigned int *)int_=
status)))
> +               return 1;
> +       return 0;
>  }
>
> -static void it6505_irq_io_latch_fifo_overflow(struct it6505 *it6505)
> +static void it6505_irq_video_error_handler(struct it6505 *it6505)
>  {
>         struct device *dev =3D &it6505->client->dev;
> +       int int_status[3] =3D {0};
> +       int reg_0d;
> +       int i;
>
> -       DRM_DEV_DEBUG_DRIVER(dev, "IO latch fifo overflow interrupt");
>         it6505->auto_train_retry =3D AUTO_TRAIN_RETRY;
>         flush_work(&it6505->link_works);
>         it6505_stop_hdcp(it6505);
>         it6505_video_reset(it6505);
> -}
>
> -static bool it6505_test_bit(unsigned int bit, const unsigned int *addr)
> -{
> -       return 1 & (addr[bit / BITS_PER_BYTE] >> (bit % BITS_PER_BYTE));
> +       DRM_DEV_DEBUG_DRIVER(dev, "Video Error reset wait video...");
> +

I still don't see any code comment around the following section.

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

Okay let me make the questions more specific:

1. What would happen if we remove the loop and only check the video
error interrupts once? If another video error interrupt comes out, we
handle it in the next interrupt handler. Will this lead to an infinite
loop?

2. Why do we run the loop for 10 times (100ms as you mentioned), but
not 5 times or 20 times? Does this "100ms" come from the hardware spec
or your experience on debugging this issue? I guess it's okay if it's
"I tried it a few times and 100ms seems to be just enough", but I
would prefer you to write that down in the code comments.

>  }
>
>  static irqreturn_t it6505_int_threaded_handler(int unused, void *data)
> @@ -2519,8 +2539,6 @@ static irqreturn_t it6505_int_threaded_handler(int =
unused, void *data)
>                 { BIT_INT_HDCP_KSV_CHECK, it6505_irq_hdcp_ksv_check },
>                 { BIT_INT_AUDIO_FIFO_ERROR, it6505_irq_audio_fifo_error }=
,
>                 { BIT_INT_LINK_TRAIN_FAIL, it6505_irq_link_train_fail },
> -               { BIT_INT_VID_FIFO_ERROR, it6505_irq_video_fifo_error },
> -               { BIT_INT_IO_FIFO_OVERFLOW, it6505_irq_io_latch_fifo_over=
flow },
>         };
>         int int_status[3], i;
>
> @@ -2550,6 +2568,8 @@ static irqreturn_t it6505_int_threaded_handler(int =
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

Regards,
Pin-yen
