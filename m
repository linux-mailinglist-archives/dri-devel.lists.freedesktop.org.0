Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A44627D13
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 12:55:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68DED10E059;
	Mon, 14 Nov 2022 11:55:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E67810E059
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 11:55:37 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id i21so16915387edj.10
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 03:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CM8CetEjy9AtRJt6iFAp3jP90kKTaExr8JeOyMvIVJc=;
 b=hOwvUyYn7csn3gK9TbdL9iyPpWzc4KrDMcNw8dscnwiXYSB4bwIuQnyMX6NlwDQqCB
 wdG6DG3Ejv1XfwQ1KI5HbiEJAUExZ6QlKGimfkECjD85f7C6HGK+3Tdy1ivkC3bCr4oh
 M0XlUzp2nld008uiWfghpc2v6ARtwhBKlas6sZq9kRmmzbLsKk6Uawmc/GEZnmLqUX+Y
 i58WhDLWxUTIXaHPzofCdDvRu0T9QjLehSO1cL8IC8Xrf0VLmeN978kPLR2e7m4X+lf+
 VsBo84S6Ze4VpHWBYX64ZsxiYsXNAWY8fzCMMahLS7FYcRUvvhocabV4Qd8B2xSb9WVr
 9ZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CM8CetEjy9AtRJt6iFAp3jP90kKTaExr8JeOyMvIVJc=;
 b=2miLnfFgPzcaPe/r7DRg/1v7UFGA6vzPX73XeCg7s0WVwx47dDaUOFBadq6ODdc3LO
 M3vMpA4QxVgi0gfk3wWRIjOGwarIHWsRhFe2B0WCKiBQVCiE4GQl0U7FzpJziA3Xeqqs
 cdWOAnG2TOIKmcHpS0IurHv06s9bbKfHwt8EH5gyJPN1ggT73bJQMtb412L5uXyp+5Eu
 TzMdOP+Lfo4pW9Knf1OogQP4Y56j80S7ZOCEr9SePA2478kNPBOYr93gzFvlnzZ3JFDw
 mYq1afRlR0s18kkb+sAT5URANZIgqRWDwEqe9qDxpCQwiJfM6C63uXAg56ALLqLxtIEE
 yUwQ==
X-Gm-Message-State: ANoB5pnVrKGmAtjQ/qjIrZ4KwCx6/DVf/S6Nx0vce4DlZefiMUkRuRLX
 U3yzZfcZZ7j7jvfHHSGurqHXudXZ+sEBxguYKK3Wc82TK0PcCA==
X-Google-Smtp-Source: AA0mqf4If3GW2KfLbb1CT1ZdaVRv6bcCu4sY/SBT133ZDI3MAGRdFSw5Dgkh0s3ZhARkLFh5paeUDSXC9vHoKD8aLU4=
X-Received: by 2002:a05:6402:448e:b0:467:9046:e2e8 with SMTP id
 er14-20020a056402448e00b004679046e2e8mr7227375edb.136.1668426935555; Mon, 14
 Nov 2022 03:55:35 -0800 (PST)
MIME-Version: 1.0
References: <20221114081956.37853-1-yuancan@huawei.com>
In-Reply-To: <20221114081956.37853-1-yuancan@huawei.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 14 Nov 2022 11:55:20 +0000
Message-ID: <CAPY8ntBWKaAWmKB2hHirvwzgMZoBP2ONb_WKJz44XTxUJ2k_sw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel/raspberrypi-touchscreen: Fix error handling in
 rpi_touchscreen_init()
To: Yuan Can <yuancan@huawei.com>
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
Cc: architt@codeaurora.org, f.fainelli@gmail.com, emma@anholt.net,
 sam@ravnborg.org, dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yuan

On Mon, 14 Nov 2022 at 08:21, Yuan Can <yuancan@huawei.com> wrote:
>
> A problem about modprobe panel-raspberrypi-touchscreen is triggered with
> the following log given:
>
>  [  542.980748] Error: Driver 'rpi-ts-dsi' is already registered, aborting...
>
> And with this log printed, the panel_raspberrypi_touchscreen is listed by
> lsmod, rmmod on it can trigger the WARN of "Unexpected driver unregister".
>
> The reason is that the return value of mipi_dsi_driver_register() and
> i2c_add_driver() is not checked in rpi_touchscreen_init(), if
> i2c_add_driver() failed, the rpi_touchscreen_dsi_driver is never
> unregistered, and next time when install this module, the
> mipi_dsi_driver_register() is failed but rpi_touchscreen_init() returns 0,
> leading to the panel_raspberrypi_touchscreen listed by lsmod.
>
> Call graph of modprobe panel-raspberrypi-touchscreen at the first time:
>  rpi_touchscreen_init()
>    mipi_dsi_driver_register() # register rpi_touchscreen_dsi_driver
>    i2c_add_driver()
>      driver_register()
>        bus_add_driver()
>          priv = kzalloc(...) # OOM happened
>  # return without unregister rpi_touchscreen_dsi_driver
>
> Call graph of retrying modprobe panel-raspberrypi-touchscreen:
>  rpi_touchscreen_init()
>    mipi_dsi_driver_register() # Error message printed, register failed!
>    i2c_add_driver() # succeed and return
>
> Fix by checking the return value of both functions and unregister
> rpi_touchscreen_dsi_driver if i2c_add_driver() failed.
>
> Fixes: 2f733d6194bd ("drm/panel: Add support for the Raspberry Pi 7" Touchscreen.")
> Signed-off-by: Yuan Can <yuancan@huawei.com>

Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

I would strongly recommend that you look at switching to the tc358762
bridge, panel-simple, and the rpi-panel-attiny-regulator regulator
driver, rather than this driver.

The raspberrypi-touchscreen driver has no suitable hooks for the
edt-ft5x06 touch driver to register for regulator control. If the
display sleeps then the power is killed to the touch controller but
the touch driver has no knowledge of this. This issue should have been
solved with rpi-panel-attiny / tc358762 / panel-simple.

  Dave

> ---
>  .../gpu/drm/panel/panel-raspberrypi-touchscreen.c   | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
> index 79f852465a84..9f3d0fedc3f2 100644
> --- a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
> +++ b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
> @@ -497,8 +497,17 @@ static struct i2c_driver rpi_touchscreen_driver = {
>
>  static int __init rpi_touchscreen_init(void)
>  {
> -       mipi_dsi_driver_register(&rpi_touchscreen_dsi_driver);
> -       return i2c_add_driver(&rpi_touchscreen_driver);
> +       int ret;
> +
> +       ret = mipi_dsi_driver_register(&rpi_touchscreen_dsi_driver);
> +       if (ret)
> +               return ret;
> +
> +       ret = i2c_add_driver(&rpi_touchscreen_driver);
> +       if (ret)
> +               mipi_dsi_driver_unregister(&rpi_touchscreen_dsi_driver);
> +
> +       return ret;
>  }
>  module_init(rpi_touchscreen_init);
>
> --
> 2.17.1
>
