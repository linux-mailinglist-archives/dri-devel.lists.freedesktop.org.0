Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE5D522862
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 02:22:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E30110E9A5;
	Wed, 11 May 2022 00:22:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7170110EAFE
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 00:22:31 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id y76so978956ybe.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 17:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DdS4LZ7mqGBxPaeGzqFu6xL7PLhOVbvjUXM7la61o/M=;
 b=XgCUr/iOevJS21fhdEkGGCivLNeOLhoAWYumXsPp88f8f/zg+5r5oQHJyI4Ie99jFI
 agkIVkxUbE8yXd6i6Us8qlSyT/Th3Y/mrwqi1qoVavNqEeWz0RweVhVtAqH3vjyRYzQ3
 ItTBNXxi/bmOSBRTTNxUjknJVTUCg+RndVzGtDIYpws852Kh9mUQXEBSpuS563rOh/hE
 bfDND2E5hCJkaOpuX/tSNFmiHcrXBGanJACUQmkrx5DOn3b2P9kZmXBCR1m7VvrDkv6A
 jKVcgfEuIoysQ3aA0Mo3H3SGEIPWd/6Z/VCs8DchZjZGpV1XFn4R47tG4UWTYddAgCIb
 cA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DdS4LZ7mqGBxPaeGzqFu6xL7PLhOVbvjUXM7la61o/M=;
 b=UaKoEzyP0YLftofejpT3hCcmBFNvTb2bTVz/KZpvn7Gnbz5D+E+C9t4CJaExeJp7yW
 Jys7Tj//qcYVotZFQDyQXXIVfVVZ8EK2EYKtUJbcMp+OuBb3wewkvp72NAKQuYNW9iyh
 +oV7GRkkJmMQKBVzYVWomgGiBW48z442azYVfoNKX+cLFK8MxCiPlDhoI8/3wZozWUtO
 LgMQIf2HxiTi2Pw1H0N/TkRraXMcAl+AUDB7aOaJ2B12E44rekuS17SprXStb7MFjRSq
 i2Lj/Dl4PrxGvUBo71KqNk7nNBNlm8shIGsNcl9s79pp+ED6xVdnxfX5uJNrHnDu+SND
 7sAw==
X-Gm-Message-State: AOAM533ynGRwLFBmks5hXpRYyP071vlVd0HVk2ymWKZnBfsCBnsvJDXt
 S/VQttJ3UVoGX1n9AchEd0uW1LVd5rtYSWj4WL9geg==
X-Google-Smtp-Source: ABdhPJz4MB95vmfbkO8RYAD9atniqUztRKCagWj0vKt6uZa5Ph2V5Tsln22BbnQi2fFneVAxvQrYIjwoAXhjbIjn+NQ=
X-Received: by 2002:a25:fb10:0:b0:64a:d339:3f38 with SMTP id
 j16-20020a25fb10000000b0064ad3393f38mr11111060ybe.234.1652228550563; Tue, 10
 May 2022 17:22:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220510192944.2408515-1-dianders@chromium.org>
 <20220510122726.v3.3.Iba4b9bf6c7a1ee5ea2835ad7bd5eaf84d7688520@changeid>
In-Reply-To: <20220510122726.v3.3.Iba4b9bf6c7a1ee5ea2835ad7bd5eaf84d7688520@changeid>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 11 May 2022 03:22:19 +0300
Message-ID: <CAA8EJpqBnR_-YaNj-hc6fjfeRX-aTBhuzCFKg77QEyANu37cnA@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] drm/bridge: Add devm_drm_bridge_add()
To: Douglas Anderson <dianders@chromium.org>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 dri-devel@lists.freedesktop.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 10 May 2022 at 22:30, Douglas Anderson <dianders@chromium.org> wrote:
>
> This adds a devm managed version of drm_bridge_add(). Like other
> "devm" function listed in drm_bridge.h, this function takes an
> explicit "dev" to use for the lifetime management. A few notes:
> * In general we have a "struct device" for bridges that makes a good
>   candidate for where the lifetime matches exactly what we want.
> * The "bridge->dev->dev" device appears to be the encoder
>   device. That's not the right device to use for lifetime management.
>
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>
> Changes in v3:
> - Patch ("drm/bridge: Add devm_drm_bridge_add()") new for v3.
>
>  drivers/gpu/drm/drm_bridge.c | 23 +++++++++++++++++++++++
>  include/drm/drm_bridge.h     |  1 +
>  2 files changed, 24 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index c96847fc0ebc..e275b4ca344b 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -170,6 +170,29 @@ void drm_bridge_add(struct drm_bridge *bridge)
>  }
>  EXPORT_SYMBOL(drm_bridge_add);
>
> +static void drm_bridge_remove_void(void *bridge)
> +{
> +       drm_bridge_remove(bridge);
> +}
> +
> +/**
> + * devm_drm_bridge_add - devm managed version of drm_bridge_add()
> + *
> + * @dev: device to tie the bridge lifetime to
> + * @bridge: bridge control structure
> + *
> + * This is the managed version of drm_bridge_add() which automatically
> + * calls drm_bridge_remove() when @dev is unbound.
> + *
> + * Return: 0 if no error or negative error code.
> + */
> +int devm_drm_bridge_add(struct device *dev, struct drm_bridge *bridge)
> +{
> +       drm_bridge_add(bridge);
> +       return devm_add_action_or_reset(dev, drm_bridge_remove_void, bridge);
> +}
> +EXPORT_SYMBOL(devm_drm_bridge_add);
> +
>  /**
>   * drm_bridge_remove - remove the given bridge from the global bridge list
>   *
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index f27b4060faa2..42aec8612f37 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -796,6 +796,7 @@ drm_priv_to_bridge(struct drm_private_obj *priv)
>  }
>
>  void drm_bridge_add(struct drm_bridge *bridge);
> +int devm_drm_bridge_add(struct device *dev, struct drm_bridge *bridge);
>  void drm_bridge_remove(struct drm_bridge *bridge);
>  int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
>                       struct drm_bridge *previous,
> --
> 2.36.0.550.gb090851708-goog
>


--
With best wishes
Dmitry
