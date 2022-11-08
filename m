Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE587621115
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 13:41:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B226610E088;
	Tue,  8 Nov 2022 12:41:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA5E210E088
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 12:41:16 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id a5so22230704edb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Nov 2022 04:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sojKUSuREfykk+D9JSHzONYCemfTYMKELjFcEAjqmzM=;
 b=Ij1vlYWVBhi07yZxug2R/KBT6Xnn6j654mq1kNgaxwRQZPUFYN8hPagGk8bQvML0yx
 AQh+vN+RefHi34G29jho/RLWpHhTtqwAc0s4G+flwSdidGe3FylEQyXxqvcNFaeCXy7/
 5PvTNjWXfkWSJYfXmTNSOdDiW5J+sfrlbkwsIf7qG+9XJNkB/RK+biq06fw1kO2sLUFN
 HBPGIhsFt24gr5uZg1wgOAKBc4caltkMdBGQQuASjYYr5czSYhj6L1Y6vR8GaKBCwNtD
 JxWdn0zNR74QhMaRP1t0GkEroAxGvWCJ2+SSL8VLTalIRrXsfFToNXdq7dhPhh3jsiz3
 9NMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sojKUSuREfykk+D9JSHzONYCemfTYMKELjFcEAjqmzM=;
 b=bMxWALa6YjvyZHU9d+OkkIkLr6b1bZ0rTxg2Ac0n6Ne3JBsfUKVn1PBtyOSTu1nRyv
 4TB+wPl5Y0UzCud/zGuXpFv39OoWC4S8MBevZ1ntT1qFiw4Qn2DbNME4xUxBFjOK81t/
 wX32AIdYkNTK8JTBq7st/alAgslurTs3lLXzneqKgwIcYPKXsFMD82terUnG3HuALNvX
 JwmHoyzMokIzxMOVjkw2CzNR2BymxRgvy1t/IqHydufBy0vym6td1AYlPJzl+V1/dvO/
 VstiR6H9f7bhX4DayurnximvLPgXb/F9vwyQuXl6HoxL7OMmSp86s377Cw8Jbq90zR1i
 0grA==
X-Gm-Message-State: ACrzQf0PQ1R8Gc17QvnbD/R2YocNUXCUWoOrbbbRq1AYdT4/EkMdzJ3o
 w7zuvhM1ZbCMkmyDMRjS2Amm+JGPFOGCoBunStu7AQ==
X-Google-Smtp-Source: AMsMyM5++w/HC8dqvK3AOVDcYoLuwnOWlFEzIff3hS5lWQZQDZ5KliH/yNuRAN+/P8Avgd2LUby4DCGzivt5clij6LE=
X-Received: by 2002:a05:6402:c07:b0:461:87ab:78aa with SMTP id
 co7-20020a0564020c0700b0046187ab78aamr56337494edb.258.1667911275482; Tue, 08
 Nov 2022 04:41:15 -0800 (PST)
MIME-Version: 1.0
References: <20221104063652.82789-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20221104063652.82789-1-jiapeng.chong@linux.alibaba.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 8 Nov 2022 12:40:59 +0000
Message-ID: <CAPY8ntC534yqrTLESGJ6BC68cg_=8wWYXZT44_ZBg1n5CzSEzw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: sii9234: Remove the unused function
 sii9234_mode_valid()
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
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
Cc: neil.armstrong@linaro.org, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robert.foss@linaro.org,
 andrzej.hajda@intel.com, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 4 Nov 2022 at 06:37, Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> The function sii9234_mode_valid() is defined in the sii9234.c file, but
> not called elsewhere, so remove this unused function.

Did you mean bridge_to_sii9234() rather than sii9234_mode_valid() here?

sii9234_mode_valid() is referenced in sii9234_bridge_funcs, and it's
bridge_to_sii9234 that you've actually removed.

  Dave

> drivers/gpu/drm/bridge/sii9234.c:870:31: warning: unused function 'bridge_to_sii9234'.
>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2735
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/bridge/sii9234.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
> index 5b3061d4b5c3..62b6bc8ca7af 100644
> --- a/drivers/gpu/drm/bridge/sii9234.c
> +++ b/drivers/gpu/drm/bridge/sii9234.c
> @@ -867,11 +867,6 @@ static int sii9234_init_resources(struct sii9234 *ctx,
>         return 0;
>  }
>
> -static inline struct sii9234 *bridge_to_sii9234(struct drm_bridge *bridge)
> -{
> -       return container_of(bridge, struct sii9234, bridge);
> -}
> -
>  static enum drm_mode_status sii9234_mode_valid(struct drm_bridge *bridge,
>                                          const struct drm_display_info *info,
>                                          const struct drm_display_mode *mode)
> --
> 2.20.1.7.g153144c
>
