Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6452036E49E
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 07:50:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C756EC7B;
	Thu, 29 Apr 2021 05:49:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B63D6ECE0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 01:11:47 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id i4so38798601ybe.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 18:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B9WmxfQPgVB/G8qqdqqrH4JxR1XC119NUyqOOtSd7t0=;
 b=pkiPHPNLc8oPY1Rpg9s6MMH9zsVYb3Pu6hknNjJ97Hfi1mRnSBTaBnKpkK1xFjd1Qc
 cQcOSKlv6GspGLFBVFS0a2R7wfDy66R5CFpgbbx4KptsbtihfP16CiZn9rhGgXqx5QTW
 bT7wJSVgy86XNC/E1yQdfItBAZhtztfAwi05/r0kJhF9SMDdROLy1hNoB4qjsCCc7xWl
 mnFO4W/wNfSaDiAaT4Hzi7/2XKbK/+nwY+9Li/v4xqODqdRq+++/zwuK2aVSJ6jeZ06F
 W59O7/MT/99ty+gNnLuDf32EQ5etfkSEubBJ3iZEk34moqDnV4u5QwEcMfSvrieB519k
 avQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B9WmxfQPgVB/G8qqdqqrH4JxR1XC119NUyqOOtSd7t0=;
 b=jEqtX+H6JeJnjQXANeow3iaF9HowQybuLMTYQQEjTeNxxf9POMIX5RDnGCpQSBXsRU
 NXd3e/sw+ZEm6WCeaXLxWyMjoalUK+GrzV8llF3hnuGcllaRwqBG4AYvX3k9B9DgEpmL
 wRojZZ7FOhLTNKJ8gQITEsTcmDgoauWv8Mnmef9MtRN3WLPVSVnXC/dVwFrgFTcPqDGy
 EM1bm85r0FYQWiWvIH/b9+wWDC7tOuKHQSJgaXwzbPUheUnj5WqQ5fh+DLlerxTZo/y+
 MjABlVE8ZIfj3Q3zi0aZoUS0cizoo21LWPzTKJZSYzQjymAnyiBReHXD8YKDcmiXAsOU
 Pp6g==
X-Gm-Message-State: AOAM5320oeR8ObhqdRzeY35ZadG2WfSlk/NCz6c4Nj366/fD/vL/CQX4
 4BQ+51FNEsDeRwx+TcsIZsUQzVUFVgk+l7/MyNfTbg==
X-Google-Smtp-Source: ABdhPJzGFBnav+DZBGGJcieg9JxgTULrcj3YfzoYD2uRXeNcTYI7rbQImezTdi5sUdA9XukgcMPYmupPisXhoBxFVf8=
X-Received: by 2002:a25:58d5:: with SMTP id m204mr47013043ybb.32.1619658706418; 
 Wed, 28 Apr 2021 18:11:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210428222953.235280-1-sebastian.reichel@collabora.com>
 <20210428222953.235280-2-sebastian.reichel@collabora.com>
In-Reply-To: <20210428222953.235280-2-sebastian.reichel@collabora.com>
From: Saravana Kannan <saravanak@google.com>
Date: Wed, 28 Apr 2021 18:11:10 -0700
Message-ID: <CAGETcx_YoYJkOgh=kX7tZf-oAWGMmTDT+Azm1A3thWD1SRy_4A@mail.gmail.com>
Subject: Re: [PATCHv2 1/5] rtc: m41t80: add support for fixed clock
To: Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailman-Approved-At: Thu, 29 Apr 2021 05:49:49 +0000
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
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 28, 2021 at 3:29 PM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Congatec's QMX6 system on module (SoM) uses a m41t62 as RTC. The
> modules SQW clock output defaults to 32768 Hz. This behaviour is
> used to provide the i.MX6 CKIL clock. Once the RTC driver is probed,
> the clock is disabled and all i.MX6 functionality depending on
> the 32 KHz clock has undefined behaviour. For example when using
> the hardware watchdog the system will likely do arbitrary reboots.
>
> Referencing the m41t62 directly results in a deadlock. The kernel
> will see, that i.MX6 system clock needs the RTC clock and do probe
> deferral. But the i.MX6 I2C module never becomes usable without the
> i.MX6 CKIL clock and thus the RTC's clock will not be probed. So
> from the kernel's perspective this is a chicken-and-egg problem.
>
> Technically everything is fine by not touching anything, since
> the RTC clock correctly enables the clock on reset (i.e. on
> battery backup power loss) and also the bootloader enables it
> in case an something (e.g. an unpatched kernel) disabled this
> incorrectly.
>
> A workaround for this issue is describing the square wave pin
> as fixed-clock, which is registered early and basically how
> this pin is used on the i.MX6.
>
> Suggested-by: Saravana Kannan <saravanak@google.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  Documentation/devicetree/bindings/rtc/rtc-m41t80.txt |  9 +++++++++
>  drivers/rtc/rtc-m41t80.c                             | 12 ++++++++++++
>  2 files changed, 21 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt b/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt
> index c746cb221210..cdd196b1e9bd 100644
> --- a/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt
> +++ b/Documentation/devicetree/bindings/rtc/rtc-m41t80.txt
> @@ -21,10 +21,19 @@ Optional properties:
>                        clock name
>  - wakeup-source: Enables wake up of host system on alarm
>
> +Optional child node:
> +- clock: Provide this if the square wave pin is used as boot-enabled fixed clock.
> +
>  Example:
>         rtc@68 {
>                 compatible = "st,m41t80";
>                 reg = <0x68>;
>                 interrupt-parent = <&UIC0>;
>                 interrupts = <0x9 0x8>;
> +
> +               clock {
> +                       compatible = "fixed-clock";
> +                       #clock-cells = <0>;
> +                       clock-frequency = <32768>;
> +               };
>         };
> diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
> index 89128fc29ccc..b3ece42b6f90 100644
> --- a/drivers/rtc/rtc-m41t80.c
> +++ b/drivers/rtc/rtc-m41t80.c
> @@ -544,10 +544,22 @@ static struct clk *m41t80_sqw_register_clk(struct m41t80_data *m41t80)
>  {
>         struct i2c_client *client = m41t80->client;
>         struct device_node *node = client->dev.of_node;
> +       struct device_node *fixed_clock;
>         struct clk *clk;
>         struct clk_init_data init;
>         int ret;
>
> +       fixed_clock = of_get_child_by_name(node, "clock");
> +       if (fixed_clock) {
> +               /*
> +                * skip registering square wave clock when a fixed
> +                * clock has been registered. The fixed clock is
> +                * registered automatically when being referenced.
> +                */
> +               of_node_put(fixed_clock);
> +               return 0;
> +       }
> +
>         /* First disable the clock */
>         ret = i2c_smbus_read_byte_data(client, M41T80_REG_ALARM_MON);
>         if (ret < 0)

Reviewed-by: Saravana Kannan <saravanak@google.com>

-Saravana
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
