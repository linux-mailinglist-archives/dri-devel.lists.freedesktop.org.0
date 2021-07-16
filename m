Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 991D73CBB77
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 19:57:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046136E128;
	Fri, 16 Jul 2021 17:57:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 470616E128
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 17:57:29 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id g19so16128438ybe.11
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 10:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tQW3GGc/1Va1cw3Bpau5ZzEZ6iztReFZLNyywqfViAs=;
 b=qkIpcDi1geFjKktjDaAp51kJDJviDb35yb5ScOgyz6eSvgZuroCOM6dUpRPh8xQEeq
 CCMsdN1Wp2vM0FajpRCOte8J/rAmVJtCkL2Dvhebq+Q4KMSIryqkppgz/w3UujN6+i6n
 1GMMLT8Nm7sFFbgIXslTnDwwhktX8trtzbLxRTUQc1dtHrvKQRo2EiuAquCgX1wvBO7Y
 EH5JkzplO1XELeHghHWcZLgwINaxoxjtAN0oZlD7xJl2QOno5Ji9EHad5Lhmd3/ovfJG
 borYWL0kmhsUinq8z5h1vl0deKAq58dv+W4CGZoMZUN/0Y6uR7qqNx0riYLblc+QrIEj
 3y2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tQW3GGc/1Va1cw3Bpau5ZzEZ6iztReFZLNyywqfViAs=;
 b=FJZKkUFU4ZRZsh70ysjD4A79xbGoeDaa83SSQTEDRez1XtcjU73APnVOlbQLhtylj+
 5/XA8Ft2KbvBh59kdVQXQP/nhYxKvFB0YRCTAx/Eyrzx4SMKn2QdONtM3yBlKLqWqlq7
 SPkDZZdwW1O9dOEjUYtDW36gifXeOF73Rdmgw81eZiPCrWZG9yrqSFSsmDZCuZ1+bxfq
 6hi3MgsfjGf8MUrs9t1lvf3QZGCYwQXjInlkML8pY+0Zz+Ovgv4rduzBcw0dI+s1C3kL
 Hj56aNYs67DGGdM5LQnlzNu6HrD2HGeVmBGiorJS0cNCM1z3+IOALqn2zrJPVwNZUSYK
 4sJQ==
X-Gm-Message-State: AOAM530LCcJyI6I0OrfdvS4ehQoxauBEk1yoOSWCyNzdGXVI8UlmC40F
 Czh5uK6jHvXk1vBThxePK2PqEM2t0h48Wqg+K3ydkQ==
X-Google-Smtp-Source: ABdhPJx3191ATZV8iavJsUcIabdLHawOx50YUWGy62AQyjAgNiWXOFVLNNeLefA69Tj63fceB9/Y4TSbdBL5TsHZF3Q=
X-Received: by 2002:a25:4047:: with SMTP id n68mr15190555yba.96.1626458248262; 
 Fri, 16 Jul 2021 10:57:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210710064511.1288232-1-willmcvicker@google.com>
In-Reply-To: <20210710064511.1288232-1-willmcvicker@google.com>
From: Saravana Kannan <saravanak@google.com>
Date: Fri, 16 Jul 2021 10:56:41 -0700
Message-ID: <CAGETcx_XZDWNQ2OLEs0XMnq3m1WFJ8mD0LAXFTpYBXPLPUCAxA@mail.gmail.com>
Subject: Re: [PATCH] drm/mipi: set fwnode when a mipi_dsi_device registers
 itself
To: Will McVicker <willmcvicker@google.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel-team@android.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi William,

Thanks for catching this.

On Fri, Jul 9, 2021 at 11:45 PM Will McVicker <willmcvicker@google.com> wrote:
>
> This is needed for fw_devlink to work properly with MIPI DSI devices.
> Without setting the device's fwnode, the sync state framework isn't able
> to properly track device links between the MIPI DSI device and its
> suppliers which may result in its supplier probing before the mipi
> device.

I think it'd be more accurate if the commit text is something like:

drm/mipi: set fwnode when a mipi_dsi_device is registered

This allows the fw_devlink feature to work across mipi_dsi bus devices too. This
feature avoid unnecessary probe deferrals of mipi_dsi devices, defers
consumers of
mipi_dsi devices till the mipi_dsi devices probe, and allows mipi_dsi drivers to
implement sync_state() callbacks.

Reviewed-by: Saravana Kannan <saravanak@google.com>

Thanks,
Saravana

>
> Suggested-by: Saravana Kannan <saravanak@google.com>
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
> index 5dd475e82995..469d56cf2a50 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -222,6 +222,7 @@ mipi_dsi_device_register_full(struct mipi_dsi_host *host,
>         }
>
>         dsi->dev.of_node = info->node;
> +       dsi->dev.fwnode = of_fwnode_handle(info->node);
>         dsi->channel = info->channel;
>         strlcpy(dsi->name, info->type, sizeof(dsi->name));
>
> --
> 2.32.0.93.g670b81a890-goog
>
