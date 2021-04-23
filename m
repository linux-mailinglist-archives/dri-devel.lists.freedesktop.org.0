Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F4023368EDE
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 10:33:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D276E0F4;
	Fri, 23 Apr 2021 08:33:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 891EB6E0F4
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 08:33:44 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id q10so34708919pgj.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 01:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PPP0dRgPfG6zQIMdWqCkBDehDsZiZdXDI5NgAH85Nqs=;
 b=HY8/qndk5bgQgsED9BAcRMLKI1nSjL/D2dc++lw6cLUyVE1vKQtQOKJSkqjyYpLMen
 HrJtLLy0P7ogIZqdchvzc60HOuBnRLdcRSaVAi3IYqAknoW+/pK/djaYEOYzXJ0ps9Aw
 kDHC0LF/mPnyKVV8U6bFij0c51UMXFsii8RYoNwWJp60eYPTBElwO1aBcpBb3j+NmxbV
 QU9WenoLZVQRotjTLFjdQWh+iUj+aolJxPfnmrmAqVpZVB5u3BqYzUH8boj/OXBACw53
 We+9M+KwDIrL7yv5tevpprwfCJpqVFQYmrFc/6Sr8GCUfglT6LFoqPRLPYDs7lmmyz/t
 29qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PPP0dRgPfG6zQIMdWqCkBDehDsZiZdXDI5NgAH85Nqs=;
 b=fWDRO/7Ju8M8+YFI7KH15WT5QdYi3b39NftUiQgJJklq4uOR0qYxMSuJ3lmISYaz4X
 oYxOABZFk1lshqtzt+TslkSjpk9Fxjib0dEuygbcnKBuBHjNFZac5UOO7xDp/BMTcQDC
 k3zyx982c8yXZryIjl3UBzOPD4sKuGW7WanMBy087tkYT7pssGXB0UlljzDxbQYVcXvy
 8VQaHtU6c857WUMOBIjJEdKYS8FZV7hpA0EQWecbmiNAyZqJF9eOoAINgQjUTzTwG2es
 92/y7n+N95Xjj824rc6Z/FAL4YfEqMPCidYpvRiS4tPQSCZIqrNTJjjNih5Q/2BWrO/O
 5YYw==
X-Gm-Message-State: AOAM532m1/iKwj6fv91Ki/iRhzkcJro35WpnjNn9Amw5Ciden0jAcPHA
 Dn4rYr5XPNpldrF4BbknGFzTpp198pPOe/fLoMP6Ew==
X-Google-Smtp-Source: ABdhPJxaiiAj0rO1om5p99kZATGkc+WzZV3B+EC/6dlnMwASzl0N+Q58LGX5yoSnQ9BHBz01nxUJrsgmNj19R4p1Ao8=
X-Received: by 2002:a63:91c9:: with SMTP id l192mr2724655pge.339.1619166823869; 
 Fri, 23 Apr 2021 01:33:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210422064015.15285-1-jee.heng.sia@intel.com>
In-Reply-To: <20210422064015.15285-1-jee.heng.sia@intel.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 23 Apr 2021 10:33:32 +0200
Message-ID: <CAG3jFysq1w9Di1YAQMS7v37Wdog1TCBYHfycRyF1Rr67U0HjyA@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm: bridge: adv7511: Support I2S IEC958 encoded
 PCM format
To: Sia Jee Heng <jee.heng.sia@intel.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 pierre-louis.bossart@linux.intel.com,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Sia,

Thanks for the reminder!

I've merged this patch to drm-misc-next.

https://cgit.freedesktop.org/drm/drm-misc/log/

On Thu, 22 Apr 2021 at 08:57, Sia Jee Heng <jee.heng.sia@intel.com> wrote:
>
> Support IEC958 encoded PCM format for ADV7511 so that ADV7511 HDMI
> audio driver can accept the IEC958 data from the I2S input.
>
> Signed-off-by: Sia Jee Heng <jee.heng.sia@intel.com>
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511.h       | 1 +
>  drivers/gpu/drm/bridge/adv7511/adv7511_audio.c | 6 ++++++
>  2 files changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> index a9bb734366ae..05e3abb5a0c9 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> @@ -191,6 +191,7 @@
>  #define ADV7511_I2S_FORMAT_I2S                 0
>  #define ADV7511_I2S_FORMAT_RIGHT_J             1
>  #define ADV7511_I2S_FORMAT_LEFT_J              2
> +#define ADV7511_I2S_IEC958_DIRECT              3
>
>  #define ADV7511_PACKET(p, x)       ((p) * 0x20 + (x))
>  #define ADV7511_PACKET_SDP(x)      ADV7511_PACKET(0, x)
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
> index 45838bd08d37..61f4a38e7d2b 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
> @@ -101,6 +101,10 @@ static int adv7511_hdmi_hw_params(struct device *dev, void *data,
>         case 20:
>                 len = ADV7511_I2S_SAMPLE_LEN_20;
>                 break;
> +       case 32:
> +               if (fmt->bit_fmt != SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE)
> +                       return -EINVAL;
> +               fallthrough;
>         case 24:
>                 len = ADV7511_I2S_SAMPLE_LEN_24;
>                 break;
> @@ -112,6 +116,8 @@ static int adv7511_hdmi_hw_params(struct device *dev, void *data,
>         case HDMI_I2S:
>                 audio_source = ADV7511_AUDIO_SOURCE_I2S;
>                 i2s_format = ADV7511_I2S_FORMAT_I2S;
> +               if (fmt->bit_fmt == SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE)
> +                       i2s_format = ADV7511_I2S_IEC958_DIRECT;
>                 break;
>         case HDMI_RIGHT_J:
>                 audio_source = ADV7511_AUDIO_SOURCE_I2S;
>
> base-commit: e488b1023a4a4eab15b905871cf8e81f00336ed7
> --
> 2.18.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
