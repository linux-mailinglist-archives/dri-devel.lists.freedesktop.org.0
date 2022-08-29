Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAD35A4FC6
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 17:04:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C926710F38C;
	Mon, 29 Aug 2022 15:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3278D10F37D
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 15:04:11 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id k9so10595106wri.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 08:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=347LfAP44frQffdHJ/9JrhHkWnMPl3tC3TkZmIT/0NE=;
 b=jWuBrwJQtN3vnRcvGuWYl6rCPZeeGWKfwekOKFMZAZJAopoRRDOSpGVrBSVgL3YUbn
 Gts3fGDwlIff6pYoiRTaQeUDPYQy/fFV2eELp/KRKZf38hGTlpXdWvKeo/7NqeepsRWY
 yTihnSYuAX6/QBE8kRmxAd7cenmDMHTrI0AnopDvWgtxw8iK8wa6HQqNq6swKQXf0iFx
 JJlZL1+lvcdfk+VPOmCYMh10xZsleuo4sRPp/LiollY71hl18vvA4nnvM9vWXUM9noWS
 2m0e7LLzx7ztw6ON3JCeH9Wyt0Y2/V+KYN+O7mttlB+64NztmemE1uUoqDFNJT0kY6KK
 ZQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=347LfAP44frQffdHJ/9JrhHkWnMPl3tC3TkZmIT/0NE=;
 b=IFNe/XBk0QVhr4MfFEoh2mnolECaJmDKYhfG/xSN5WQqj4LCf9OcPySXY89l33RAqe
 gjgAawkxQ6H8MGgDPEoY22Vsw0hFVjW38t7bYOtJwvwNDuGvAidZ25sM88cudWr6NYIu
 5SfVCMQhezk4DJPUFMymg7D+yfxg51lAc0pPifKmAbKICL55zQNk9jQbhkOF0dmSIu3x
 Bib0rr6G9aI4Vx6HUxMfk7etRalyz+q3MgjlJljXYV9G4fxH1UCUq/qWAQhwXdlD8c3T
 egIWbEWe66Y5AMBo7ZcD4oBY7/UcfnrrKW539eLAizKm47JqSkWQjbZ5p62zPR8ubS6Q
 PCag==
X-Gm-Message-State: ACgBeo2UyXDfnhbhFAKwmodUrRxHYr4Zo9/nnAcFo+9QfUpqcR3bJN3N
 r6J18V7qo13npuZUhYMrIYfECA6NvVB5QCMji8dMrHriNnkb6A==
X-Google-Smtp-Source: AA6agR4GKG6UxIBeSkOj9tZcipNHDDnq+j1l+bVcOZUPMOaA9GrHrvXDpw8gLBRsJuY++8TK/MQWsHwVNf9LJUS8rQ0=
X-Received: by 2002:a17:906:d550:b0:733:8e1a:f7 with SMTP id
 cr16-20020a170906d55000b007338e1a00f7mr14228340ejc.580.1661785438494; Mon, 29
 Aug 2022 08:03:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220716081304.2762135-1-zheyuma97@gmail.com>
In-Reply-To: <20220716081304.2762135-1-zheyuma97@gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 29 Aug 2022 17:03:47 +0200
Message-ID: <CAG3jFytOyhy_es2cULpp0TCdp70HTcqKo1hd-ZxVaC4O-vi-3w@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: megachips: Fix a null pointer dereference bug
To: Zheyu Ma <zheyuma97@gmail.com>
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
Cc: martyn.welch@collabora.co.uk, narmstrong@baylibre.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, peter.senna@gmail.com,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 martin.donnelly@ge.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 16 Jul 2022 at 10:13, Zheyu Ma <zheyuma97@gmail.com> wrote:
>
> When removing the module we will get the following warning:
>
> [   31.911505] i2c-core: driver [stdp2690-ge-b850v3-fw] unregistered
> [   31.912484] general protection fault, probably for non-canonical address 0xdffffc0000000001: 0000 [#1] PREEMPT SMP KASAN PTI
> [   31.913338] KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
> [   31.915280] RIP: 0010:drm_bridge_remove+0x97/0x130
> [   31.921825] Call Trace:
> [   31.922533]  stdp4028_ge_b850v3_fw_remove+0x34/0x60 [megachips_stdpxxxx_ge_b850v3_fw]
> [   31.923139]  i2c_device_remove+0x181/0x1f0
>
> The two bridges (stdp2690, stdp4028) do not probe at the same time, so
> the driver does not call ge_b850v3_resgiter() when probing, causing the
> driver to try to remove the object that has not been initialized.
>
> Fix this by checking whether both the bridges are probed.
>
> Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
> ---
>  drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> index cce98bf2a4e7..c68a4cdf4625 100644
> --- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> +++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> @@ -296,7 +296,9 @@ static void ge_b850v3_lvds_remove(void)
>          * This check is to avoid both the drivers
>          * removing the bridge in their remove() function
>          */
> -       if (!ge_b850v3_lvds_ptr)
> +       if (!ge_b850v3_lvds_ptr ||
> +               !ge_b850v3_lvds_ptr->stdp2690_i2c ||
> +               !ge_b850v3_lvds_ptr->stdp4028_i2c)

This chunk fails checkpatch --strict.

Alignment should match open parenthesis
#39: FILE: drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c:300:


>                 goto out;
>
>         drm_bridge_remove(&ge_b850v3_lvds_ptr->bridge);
> --
> 2.25.1
>
