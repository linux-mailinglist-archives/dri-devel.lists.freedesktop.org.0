Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A34342149
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 16:53:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF16D6EA3F;
	Fri, 19 Mar 2021 15:53:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24BB76EA3F
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 15:53:44 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id u19so3963749pgh.10
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 08:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p9e3JvlVImVqovnPE5o8T2aAk9m+EOrR0HqRpW5NiBo=;
 b=vb+NnwFLp3brgZEgYGmuei6Z77uEhzOwdKxFI+PxtoSMuUA/vDs2i7dluCb9hOjL4h
 0v3wSe/bOKViqmXVjcUEa2swJl0MdWk5DSbq0BThoQBCZFVQk6Fc3ysvij/IXZO7/8Xh
 XyqMqzXdAz9Luuzov63lSHAiV5E+R+kScBU43CCh6ASys7aDZYSTtZhFej/wZWB/0v/I
 zvbJsOnZNwWkHffOX4TM8JhKC0T5LxGSc+wT+p5V4/ugsHzYy87E1DMOJer+/5t69bvb
 fPNHN48IU4hnBzjx9uf0hUDorQPe5ZE+8M7S4Vo/bx7YtksKQ2j9MhP7u2C9PEaJMlXE
 5/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p9e3JvlVImVqovnPE5o8T2aAk9m+EOrR0HqRpW5NiBo=;
 b=ihe8hF1+1bOTi10aGM6rnOcIDfpIXL6ZnZJ4FSmwXlfNDDyAfbAJPe5336RpUlPE+r
 5T5ODp+aFtCIFBD+IoRA0JU19zLTUUmDGljMAMdX2BSR6KQNMO9aFX47yNsuYIgFv2fg
 mVvIL5VK4Jv+MAsGkulXhd0Qv7a17XzLPB2L3g6nNb+oSqV8h1GC2xmnXj3qyAC3syup
 WZbMp3yiMYgplCt64McVnihh7nhAwfxw8MOCICksgW485GUoz0Csg523UYYoajhD9yrX
 6ijDapUfP/JsxSwTubbx+VeHxGXzNzzGqfXp9gUL6njZ32Qm3n4TbwnRmHRMROY71dKL
 LSgw==
X-Gm-Message-State: AOAM5336qaLA7glBMTT/OTKuEbb9VUbnjQ1ZF2FZipoRIoubA93HckW2
 Ap8UCFwYHgi47dbUiIVcIilfC/So9SQlZDhtP/jy9A==
X-Google-Smtp-Source: ABdhPJzXZOjanMlGVi/fCuO0+YZk/KVHvw5XGQK/9qGjL7GsnwaNBiM1MEUhdEiOxgZeMQhrIwA8irhlhzKXdOaxFYw=
X-Received: by 2002:a05:6a00:b54:b029:207:2a04:7b05 with SMTP id
 p20-20020a056a000b54b02902072a047b05mr9864816pfo.12.1616169223661; Fri, 19
 Mar 2021 08:53:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210312085203.13556-1-jee.heng.sia@intel.com>
In-Reply-To: <20210312085203.13556-1-jee.heng.sia@intel.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 19 Mar 2021 16:53:32 +0100
Message-ID: <CAG3jFyuvTadeP-CLZ77k32vQvYVjrEakcXXr5U22Zgom=H34kg@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: adv7511: Support I2S IEC958 encoded PCM
 format
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

Thanks for the patch, it looks good to me.

Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Fri, 12 Mar 2021 at 10:09, Sia Jee Heng <jee.heng.sia@intel.com> wrote:
>
> Support IEC958 encoded PCM format for ADV7511 so that ADV7511 HDMI
> audio driver can accept the IEC958 data from the I2S input.
>
> Signed-off-by: Sia Jee Heng <jee.heng.sia@intel.com>
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
> base-commit: de066e116306baf3a6a62691ac63cfc0b1dabddb
> --
> 2.18.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
