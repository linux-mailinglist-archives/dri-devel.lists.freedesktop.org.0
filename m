Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E27D9477150
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 13:06:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ABD610F7EB;
	Thu, 16 Dec 2021 12:05:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9ADE10F7E6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 12:05:57 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id z6so19287095plk.6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 04:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/H9EMWcxNE3MmWqEWI7uZzzhhZUDkalTYtdIjgNw5Dc=;
 b=teae7+Rhl19M4VEPLx685yvVeu8Acpi1N/Q35d7UqM35OMBXKsYtbOvxs/oPnKEPHA
 uU2ND/nWUiX7tr+jD35MeS4paRLxt/v6E2Exr0ipkKMPiXYpRjTeUGF0zBUERw8i+Rph
 oofYWwiuh7mvVbrDLrID0c93OHC/yIAZZceQsrsBXfy+NZmvUgRQh/exOrnDfs06Zk7I
 grzU/3eXm1NKpr0mwckRW0DBxad1qY+XU6UkjXsn4QTIMqHv24vUdt7GgisQJG0Tlbdo
 DKM15Q7K9WSwX1WcCQIhs0UVI+MUpdwcRLJ6A7uZvlQS9MlsanqeM5W22oVrIrI9swQQ
 ecCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/H9EMWcxNE3MmWqEWI7uZzzhhZUDkalTYtdIjgNw5Dc=;
 b=gChhWr38xoG132/4PtC4+Jnri37sQtFKmcwbpRrXWWgXVdncQh66urKpMUGo5AX0t0
 PT58OT+SW7RaapEtdt8cwi3QRnHXd7A2SuiitSFQEhXzdJFn3mRFyCEf+pGTUdByniJT
 CLwEWXMHTmcmT19tVNRr3rimM/dXgcOQIF+4VkcQsKaz7XC53ENijyejtQfyVh8rW8qT
 IDodcwBn7EjB1iK2DrEMVax4fYB1wdxmkT7BX1JDjo11GSZE+6kwtxIPnXmMdTF/FHXx
 UvBy4MX1+Wmxk1nRd95Ssdqg0wPN0YwstRfC71bGNU3dcOauB6lGnMwAYirvM3Uxhk+L
 d3HQ==
X-Gm-Message-State: AOAM531wZe18czkPoTrrA2M07pMer5OyD5gqOh/yiiWf19M7osW2aWsh
 lmtGz5cOcLrf81KcL1UBjQUkZVnMAkTLPvVt3C0PDg==
X-Google-Smtp-Source: ABdhPJxt4oYy09frB9H5orpzx03e+FHCldURdWKv5OSg4sNb7f/HwpftIGM+WCx1aCNgmg4+AiDJcZ04o+hK2r1rFk0=
X-Received: by 2002:a17:90b:4a05:: with SMTP id
 kk5mr5723305pjb.232.1639656357229; 
 Thu, 16 Dec 2021 04:05:57 -0800 (PST)
MIME-Version: 1.0
References: <20211215002529.382383-1-swboyd@chromium.org>
In-Reply-To: <20211215002529.382383-1-swboyd@chromium.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 16 Dec 2021 13:05:45 +0100
Message-ID: <CAG3jFysdAbHYXWv_87vB87Wf75Hev=bpjpNppdhcapb0_-dAfQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Set max register for regmap
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen,

Thanks for submitting this fix.

On Wed, 15 Dec 2021 at 01:25, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Set the maximum register to 0xff so we can dump the registers for this
> device in debugfs.
>
> Fixes: a095f15c00e2 ("drm/bridge: add support for sn65dsi86 bridge driver")
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 6154bed0af5b..83d06c16d4d7 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -188,6 +188,7 @@ static const struct regmap_config ti_sn65dsi86_regmap_config = {
>         .val_bits = 8,
>         .volatile_table = &ti_sn_bridge_volatile_table,
>         .cache_type = REGCACHE_NONE,
> +       .max_register = 0xFF,
>  };
>
>  static void ti_sn65dsi86_write_u16(struct ti_sn65dsi86 *pdata,
>
> base-commit: 136057256686de39cc3a07c2e39ef6bc43003ff6
> --
> https://chromeos.dev
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>

Applied to drm-misc-next
