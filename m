Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2734FAD28
	for <lists+dri-devel@lfdr.de>; Sun, 10 Apr 2022 12:21:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 749D410F58B;
	Sun, 10 Apr 2022 10:21:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E6010F58B
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Apr 2022 10:21:02 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 h126-20020a1c2184000000b0038eb17fb7d6so1688682wmh.2
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Apr 2022 03:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8ohIuOdM6DzJDhbBlT7yQBBise/yXXw2K/gzL9jVclM=;
 b=hq3T+QZbJGzqXy1RTjkX6lJuyGFt12NpBY5omJXC8yM3Bj3LRiIq2LH71J4pURY7/Y
 vGTdytP1PjwMyFd4tHzAy06DGN+e7LAP2XKAkzorOO3oJSEDu15/f1V1X7jmWs6rCwC4
 cQGAaO+4HGtE2b2mXvT2QBAKCmmSfMuerSQSZCLwEMAahd3HuWCca4Tl3dulQ8dLN2+b
 vAWDNpK5ssYlt4eLB6lUATK3+sd2AQXePzBXasTO2ab6JZgDUXnpUV1f7g3hm5FXjtve
 sgUqt3gkgpfYKV2N7DaZ3CkOPIxyqiSYxByY02ZZukkFzEl+L4aoCTror9yakfiy5W4g
 kjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8ohIuOdM6DzJDhbBlT7yQBBise/yXXw2K/gzL9jVclM=;
 b=kBWVsuAYUrdV4r+Cbn9BY50UoVHflMEonf+WN1wc6pBT/lKHBU8WnM76nJshpeTjRd
 nAOUlKu+CpHAzP3fibX5DDizxI97LmpXxEdmxGNS0UUv1l15dliFLZeiILv/1GWN6fLT
 eu2Sev4fEoTRsMtfTTWZLDy2cbVs0V6i5EXXc+/gj3kgE6LM3+JnptTI+IgTSYkovxYf
 lEYg0hI6c5Jjk4ej/MKHJl7Ctn+TQLDmcw8SlcAphB59ABzhpeLUEVulWRl4ZMWvZKIh
 9/909qQPzg44EtmPWAiPXbs3pJbuVeTr5mCzFfoemvDT8KMPWdRTaJTh0tUC85bNg4jT
 VqPA==
X-Gm-Message-State: AOAM533rAA2JmrZAyOXJR4RJ2O2Zf3Q6hxjwOYdVjs42xiiUx3vamD8I
 9vAdta54zyURZCFu8D5rCASFd8KmFJeG/Q==
X-Google-Smtp-Source: ABdhPJxnZBhyOuKv7rt3TbuLfT5xeuF09Ok0dSyFkx/h4GqX91irFb+b5FiBQjHDhSxAMKCbNZTD2Q==
X-Received: by 2002:a7b:cd03:0:b0:37b:fc83:a4e2 with SMTP id
 f3-20020a7bcd03000000b0037bfc83a4e2mr24599840wmj.193.1649586061290; 
 Sun, 10 Apr 2022 03:21:01 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net.
 [89.212.118.115]) by smtp.gmail.com with ESMTPSA id
 a11-20020a056000188b00b00204109f7826sm26818620wri.28.2022.04.10.03.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Apr 2022 03:21:00 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 andrzej.hajda@intel.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, hverkuil-cisco@xs4all.nl,
 Sandor Yu <Sandor.yu@nxp.com>
Subject: Re: [PATCH v2 2/5] drm: bridge: dw_hdmi: default enable workaround to
 clear the overflow
Date: Sun, 10 Apr 2022 12:20:59 +0200
Message-ID: <8087050.NyiUUSuA9g@jernej-laptop>
In-Reply-To: <39592fee39610c544058e6b8f9af4b4ea8dc4cdc.1649412256.git.Sandor.yu@nxp.com>
References: <cover.1649412256.git.Sandor.yu@nxp.com>
 <39592fee39610c544058e6b8f9af4b4ea8dc4cdc.1649412256.git.Sandor.yu@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Sandor.yu@nxp.com, shengjiu.wang@nxp.com, cai.huoqing@linux.dev,
 maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne petek, 08. april 2022 ob 12:32:25 CEST je Sandor Yu napisal(a):
> i.MX8MPlus (v2.13a) has verified need the workaround to clear the
> overflow with one iteration.
> Only i.MX6Q(v1.30a) need the workaround with 4 iterations,
> the others versions later than v1.3a have been identified as needing
> the workaround with a single iteration.
> 
> Default enable the workaround with one iteration for all versions
> later than v1.30a.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 23 +++++++----------------
>  1 file changed, 7 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c index
> 4befc104d220..02d8f7e08814 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2086,30 +2086,21 @@ static void dw_hdmi_clear_overflow(struct dw_hdmi
> *hdmi) * then write one of the FC registers several times.
>  	 *
>  	 * The number of iterations matters and depends on the HDMI TX 
revision
> -	 * (and possibly on the platform). So far i.MX6Q (v1.30a), i.MX6DL
> -	 * (v1.31a) and multiple Allwinner SoCs (v1.32a) have been 
identified
> -	 * as needing the workaround, with 4 iterations for v1.30a and 1
> -	 * iteration for others.
> -	 * The Amlogic Meson GX SoCs (v2.01a) have been identified as 
needing
> -	 * the workaround with a single iteration.
> -	 * The Rockchip RK3288 SoC (v2.00a) and RK3328/RK3399 SoCs 
(v2.11a) have
> -	 * been identified as needing the workaround with a single 
iteration.
> +	 * (and possibly on the platform).
> +	 * 4 iterations for i.MX6Q(v1.30a) and 1 iteration for others.
> +	 * i.MX6DL (v1.31a), Allwinner SoCs (v1.32a), Rockchip RK3288 SoC
> (v2.00a), +	 * Amlogic Meson GX SoCs (v2.01a), RK3328/RK3399 SoCs (v2.11a)
> +	 * and i.MX8MPlus (v2.13a) have been identified as needing the 
workaround
> +	 * with a single iteration.
>  	 */

It would be easier to read and modify later if platforms/controllers/variants 
are given as list, one per line, but it could be done later.

Best regards,
Jernej

> 
>  	switch (hdmi->version) {
>  	case 0x130a:
>  		count = 4;
>  		break;
> -	case 0x131a:
> -	case 0x132a:
> -	case 0x200a:
> -	case 0x201a:
> -	case 0x211a:
> -	case 0x212a:
> +	default:
>  		count = 1;
>  		break;
> -	default:
> -		return;
>  	}
> 
>  	/* TMDS software reset */




