Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7D51D5BCF
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 23:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1716ED4C;
	Fri, 15 May 2020 21:48:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B266ED4C
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 21:48:15 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id e2so3412231eje.13
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 14:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LxeJwDOC4JESBFPEWaMDxHHvxvCUi5Rdm/ngJV7pp5o=;
 b=gv5cLZR2/19GNH1WNdqRaNYCRHAoQhvJOZeAe7DRqu0h3xx2h2zr0ED4THVChJ4Ku4
 sxIguvV6iuWWddqwgeioUP1eppq6vKl6TQ7AwHLbROQTC/sx/SZcOLKH4ZcaRvHiyGQq
 xdFxCWMeiCKtaRfZixXSoz+VWbXbS1aNle/WIZquDuuO0H1XpFJiDTlB6vNWk5MzFkab
 CKN+zBEbZAtZnAo26vP7Y5JX+cpmNf7VY0gATjEm42BdrK4WdtJg0cwB9fnAoGKGAH+J
 aUCYBt8KZ7mhNeYnU7k1ZWgSHonazOf5gpvv/gCpm0m+jTUDbpVfGEPdpsrd7AF1ivmj
 k9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LxeJwDOC4JESBFPEWaMDxHHvxvCUi5Rdm/ngJV7pp5o=;
 b=KqoeOKLTMVriHF+3xooyAYaVkN+23QoZhaZuO7gkwDDjrZRm2OEtuh0CAueriQR3zM
 713CyG3XGIQnB1mDzb024IcTJAC/U3RAOpPBTtXsh+v3MtD0RF3RElxxJ6iD9cCPSg8+
 bBUesPm2RWetZ0A0KtaZNxUwtKkke7BQ20w72SPiuy1/BB3j2Vxpk0o8//xUaKxJISoX
 J/ZC/BdmuPUlO4u5i01BraDL7h9To44M3ouX3IkCNT5+Q9T2cBL4sLGu3HvTsFXavtqw
 7RBwoWJz/0yHmuLQeOupupMDAb4JKRlJVBuM7AOs3y2nE1guiar0YpgfxJc7AAAvzbBh
 9EnA==
X-Gm-Message-State: AOAM531fqemvk3Rxt7iz3gFMYwtRAIoblr4VJ/xCH5GcD087V59NfV++
 D2y+FieLO0NETdjzcM98LAfN/acGjDvn3zk/hLU=
X-Google-Smtp-Source: ABdhPJxzQ1KczziCXxwnrq+IJ8zQvE+wvGpU2ZR+A70QjLCVg9dy4aM8cJQqI/HGsL979n/RLG/86VIcDk4qIuc8GO0=
X-Received: by 2002:a17:906:2503:: with SMTP id
 i3mr4552438ejb.293.1589579293554; 
 Fri, 15 May 2020 14:48:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200508163314.1.Idfa69d5d3fc9623083c0ff78572fea87dccb199c@changeid>
In-Reply-To: <20200508163314.1.Idfa69d5d3fc9623083c0ff78572fea87dccb199c@changeid>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 15 May 2020 14:48:33 -0700
Message-ID: <CAF6AEGsYshudTEyL3vk+d3wZeYLOcMTqNR+sWZhBUZUzSZ9orA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Clear old error bits before AUX
 transfers
To: Douglas Anderson <dianders@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Sandeep Panda <spanda@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 8, 2020 at 4:33 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> The AUX channel transfer error bits in the status register are latched
> and need to be cleared.  Clear them before doing our transfer so we
> don't see old bits and get confused.
>
> Without this patch having a single failure would mean that all future
> transfers would look like they failed.
>
> Fixes: b814ec6d4535 ("drm/bridge: ti-sn65dsi86: Implement AUX channel")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 6ad688b320ae..d865cc2565bc 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -827,6 +827,12 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
>                                      buf[i]);
>         }
>
> +       /* Clear old status bits before start so we don't get confused */
> +       regmap_write(pdata->regmap, SN_AUX_CMD_STATUS_REG,
> +                    AUX_IRQ_STATUS_NAT_I2C_FAIL |
> +                    AUX_IRQ_STATUS_AUX_RPLY_TOUT |
> +                    AUX_IRQ_STATUS_AUX_SHORT);
> +
>         regmap_write(pdata->regmap, SN_AUX_CMD_REG, request_val | AUX_CMD_SEND);
>
>         ret = regmap_read_poll_timeout(pdata->regmap, SN_AUX_CMD_REG, val,
> --
> 2.26.2.645.ge9eca65c58-goog
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
