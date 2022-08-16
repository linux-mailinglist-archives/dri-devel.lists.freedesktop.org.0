Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 768115951AF
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 07:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8BBDDC62D;
	Tue, 16 Aug 2022 05:08:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C12B6DC627
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 05:08:29 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-332fc508d88so53861047b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 22:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=MBSDgt1+KSEMqLb88Z3kkhrcZMPuM+VYZYiBJd++HWM=;
 b=ialTs+JRTPXZpcZbTfdBeaRhv22RmAXvx1OhrylS37gvBZ+FPrEa2Ez89OiaPxwQ9D
 ua5yHGmGXIjYX+TIP6VN7SP9IivKO7pbYNYzhQ1QcWQv3upgFU6zBSt0MX6zSE7w1v36
 DY9F5KcKqJROyfsREA1cwEhjViUfVNbCz/CWoC68hE6SITCGs0hCwQjAPODVLopgFwuv
 QALMsJFLqwrRj3Y2Suuzd5XHBAe34fSDfn50qgFSFpjk7MpQWRfJ8ztaendd/herIZba
 RvJvF1HH2cKzh1JoWyCnRglpGcAa0fG5fX2Mwr6xwn7O70xu5lbEGVaDd6XAxVL1lA7w
 +Hsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=MBSDgt1+KSEMqLb88Z3kkhrcZMPuM+VYZYiBJd++HWM=;
 b=DWeI8PebRhWoa9f5o6E9jJVK9eCXc9DveHFyxWLqCHug56zHyaSMZU/1tFGYptJlpO
 +vbOigiSXZ/y5JubzcgbgCPJlfq14Vn4awiEGbu0rI0zdWKuRVTdyhNkZT2CMteOMpvx
 zcw5Hnwv2rdG8zmgf32P0Mk3sVn9ErVtUCkG6m11bDi7ZWgZBIYIW4qYsMqkduaUEXES
 ybH/KqNJzXyL3JCyIohFsWUj+oJi3Z2B6OBW8H5vPPzxsTV/k7xTZ/SgoQORVNcbhPUh
 RTbdGNxp890wWtv01o1F+slYVZPLwCIZAZO7PGUBAmofivho5c12UWPMsFwC3cJ4Qljq
 bxHA==
X-Gm-Message-State: ACgBeo1PLfe8jBq3+l1uLE8hdZOwfN0qPdCqO1MB3A99854cMRu35ctI
 TppgqyCjs9NinlhRuxsC4mqy+YiuLMBiXAmFYqWXwg==
X-Google-Smtp-Source: AA6agR5pVH1dUTfVBzR2nBu+fzXW1D2Jhm2zSJo2x2RpMuFIg1ZvlQT5wUDcW8jdXQ/dCDx9n0xJ+06XchwNP0TxggY=
X-Received: by 2002:a81:478b:0:b0:329:f9b1:9911 with SMTP id
 u133-20020a81478b000000b00329f9b19911mr15505202ywa.8.1660626508904; Mon, 15
 Aug 2022 22:08:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220815093905.134164-1-hsinyi@chromium.org>
In-Reply-To: <20220815093905.134164-1-hsinyi@chromium.org>
From: Rock Chiu <rock.chiu@paradetech.corp-partner.google.com>
Date: Tue, 16 Aug 2022 13:08:18 +0800
Message-ID: <CAMuczyURTSj6x-BWu-ciSyPidFTUD-p6QkDQ23u63vgFcs26qQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ps8640: Add double reset T4 and T5 to
 power-on sequence
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hsin-Yi Wang <hsinyi@chromium.org> =E6=96=BC 2022=E5=B9=B48=E6=9C=8815=E6=
=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=885:39=E5=AF=AB=E9=81=93=EF=BC=9A
>
> The double reset power-on sequence is a workaround for the hardware
> flaw in some chip that SPI Clock output glitch and cause internal MPU
> unable to read firmware correctly. The sequence is suggested in ps8640
> application note.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Reviewed-by: Rock Chiu <rock.chiu@paradetech.corp-partner.google.com>
>
> ---
>
>  drivers/gpu/drm/bridge/parade-ps8640.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bri=
dge/parade-ps8640.c
> index 49107a6cdac18..d7483c13c569b 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -375,6 +375,11 @@ static int __maybe_unused ps8640_resume(struct devic=
e *dev)
>         gpiod_set_value(ps_bridge->gpio_reset, 1);
>         usleep_range(2000, 2500);
>         gpiod_set_value(ps_bridge->gpio_reset, 0);
> +       /* Double reset for T4 and T5 */
> +       msleep(50);
> +       gpiod_set_value(ps_bridge->gpio_reset, 1);
> +       msleep(50);
> +       gpiod_set_value(ps_bridge->gpio_reset, 0);
>
>         /*
>          * Mystery 200 ms delay for the "MCU to be ready". It's unclear i=
f
> --
> 2.37.1.595.g718a3a8f04-goog
>
