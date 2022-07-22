Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF5A57E264
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 15:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BFA21125E2;
	Fri, 22 Jul 2022 13:36:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F12C711B7CE
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 13:36:09 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id e15so5911575edj.2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 06:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=csCPVk6hB5Ta9ejYwXsButhNH0HX4XzJJybT/ifyFJE=;
 b=DuvnTvus6TaGwQHQW4LGA+Gl1HZzCv3r14kXIlvJpVG9K0G6Jy/zdPu0lUeYxcFojt
 bmpnPZTYkymqeob1NPcSLh2Ga6pNCG4DHZU1pMY/X55wTYtav1qVm8PRWt6bF1M9V2Br
 ixSm9zABPgRzrvOVk8BHvVWnWglevpToAzBpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=csCPVk6hB5Ta9ejYwXsButhNH0HX4XzJJybT/ifyFJE=;
 b=t9Bea+4wBFqMGqTl1Snblvtoyzz22WWY6UpZ3Hpt0VJDophUBytmx/Uo+SvjeHrtot
 u9Ei6pjcs7NnPVWzOiDSuGMc/7aQ8TlEMQ4oFJhx1ccvuV915X2hGGVt40cXnxxUGVFT
 tcQpZ+jD9NzWrKcQR58P6ezuSsZMY1AIxAAfPraxWxuiGRaXzpq397k5X2XXRDPRp9fA
 JIGA8/ana/7a1o29YU9a2mRDsrTl4ckYUtPlkc9wokDDBYpLMXV5dND4m4U8Xav3+/mm
 eFqM1Dl0aom85SYGMW7fDADU97bYD8t8Yx3hi3fF3wMMBSSk8oOKmG1b9Z0wYl0yq8wd
 Kprg==
X-Gm-Message-State: AJIora/PhNKjivVdB7yS6SYi9j+Tw8gmEMZkcmEQVkfNKTvqGgrPAFfl
 xLOnvwpB846a3AAsbrzTNIANF3g+Ql4vaa5kxEw=
X-Google-Smtp-Source: AGRyM1th9tKz4VMf1YB+Rd9LVennwxkgGOJocgtHPr9xMNYDs699xWPskTQmcvsc784WpDmGP6Qnag==
X-Received: by 2002:a05:6402:5001:b0:437:8918:8dbe with SMTP id
 p1-20020a056402500100b0043789188dbemr766628eda.70.1658496968291; 
 Fri, 22 Jul 2022 06:36:08 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com.
 [209.85.128.52]) by smtp.gmail.com with ESMTPSA id
 v2-20020a170906292200b0072b41776dd1sm2035913ejd.24.2022.07.22.06.36.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 06:36:07 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id
 ay11-20020a05600c1e0b00b003a3013da120so5192032wmb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 06:36:07 -0700 (PDT)
X-Received: by 2002:a05:600c:2e48:b0:3a3:1ce3:3036 with SMTP id
 q8-20020a05600c2e4800b003a31ce33036mr11932470wmf.188.1658496966715; Fri, 22
 Jul 2022 06:36:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220722074755.660258-1-javierm@redhat.com>
In-Reply-To: <20220722074755.660258-1-javierm@redhat.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 22 Jul 2022 06:35:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WR3UP4XMch5z8Hz8GzWRg5cCsK6FVwgoo=HHDnpTwz+g@mail.gmail.com>
Message-ID: <CAD=FV=WR3UP4XMch5z8Hz8GzWRg5cCsK6FVwgoo=HHDnpTwz+g@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Use dev_err_probe() to avoid
 polluting the log
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Erico Nunes <ernunes@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Enric Balletbo i Serra <eballetbo@redhat.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Jul 22, 2022 at 12:48 AM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> If devm_drm_of_get_bridge() can't find the connected bridge, it returns an
> ERR_PTR(-EPROBE_DEFER) to indicate that the probe should be deferred.
>
> But this path also prints an error message, which pollutes the kernel log
> since is printed on every probe deferral, i.e:
>
>   $ dmesg | grep "failed to create panel bridge" | wc -l
>   38
>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

If someone else doesn't beat me to it, I'll apply next week sometime.
