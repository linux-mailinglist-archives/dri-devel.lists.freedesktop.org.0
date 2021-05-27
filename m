Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9095B392D76
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 14:02:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB86D6EE9D;
	Thu, 27 May 2021 12:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D45C6EE9D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 12:02:48 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id f22so3517561pgb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 05:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xE6in5hhsnp6u5Cu3tkemYP5oUutyvqnXG55EoeXM+A=;
 b=oEg4OpkN79QCfx6I3fhWoOaz8izmcbQ8iUTQXQ9y5hps/jcvkEkL/wGMvyGtSxPdKZ
 jsPRtftTu8E+5XA2wO2KN1KFGI51nu1cruiuv/YNrcuVhFOBgcL42BNgUEP3QqlpUftn
 4TSNHuNgW1w5wKZO4TSF/JceE3aYNrfzXGSRjJOg1ppr2GHxLl0BMgzN+gnlaX0EpXHL
 223lY8Ji00BDu0zk/ry7r3yPXaEQHw/0PXs4zDu+50Re8hfuW/l5P4Yj/8eZsZ16s764
 9iv6ihbqi4Rh//EmyxNn7rd8po7Ihd/jlqc4nbW4wE0O9iYNwXU6ffbANYPfRUtHV0LI
 wtPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xE6in5hhsnp6u5Cu3tkemYP5oUutyvqnXG55EoeXM+A=;
 b=joxVs1rkslffGxrfbVb/swPpPNpQHDK7amEk+2wi+hpNGOCtTu0NcOLIbXnc/GiajJ
 BxUamWGgQoZtsitEP/g5MMW0Z4y8FrX7uLoizKHpqi51o++zMxcHtdxkLwmk5lHceXAp
 OBK9EEiK9ZZA0N1azHVp0RGQZzjCHrtHqzVJZ0Npp0Nt1K6CBtW4vY6Ty3DDcL68Ki65
 WYOM67f/VFvDCELfOCbUjrtp71yCltMV8ABBu14DFSSOo47yo07pKG1hTp97dypHmQx6
 GCT6HeSm6mnBL062MDgbSxWK9GbVhVpcEjCMNV1J8qIOE/TzlyLqNezyAbsyvsTBNL9f
 zkpw==
X-Gm-Message-State: AOAM531J7Za8IQNaxq/D35ClKwUlSIdQ6toE7a1iF2hbO1LEw4aT0V53
 4dRzItwpB0NfRZNWc3Y49T/bVXUm24fS2kLXRBoGIA==
X-Google-Smtp-Source: ABdhPJz14LtgueALHp9Qs/WHGKbTcvnAZEyrOujiZ5w3ccVqpJCAgCHK5ddSJKZd2xVd9JgcEJKXoYvzHfu9YPp925Q=
X-Received: by 2002:a63:7703:: with SMTP id s3mr3421133pgc.339.1622116968501; 
 Thu, 27 May 2021 05:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <1621852953-51325-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1621852953-51325-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 27 May 2021 14:02:37 +0200
Message-ID: <CAG3jFytM9tOQ6tW7_GQhBNsk33BwyvjNSGiXeOn5mrB5GT_yVw@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: cdns-mhdp8546: Fix inconsistent indenting
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed & pushed to drm-misc-next.

On Mon, 24 May 2021 at 12:43, Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Eliminate the follow smatch warning:
>
> drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:2143
> cdns_mhdp_bridge_atomic_reset() warn: inconsistent indenting.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index 0cd8f40..82619db 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> @@ -2140,7 +2140,7 @@ static void cdns_mhdp_detach(struct drm_bridge *bridge)
>         if (!cdns_mhdp_state)
>                 return NULL;
>
> -        __drm_atomic_helper_bridge_reset(bridge, &cdns_mhdp_state->base);
> +       __drm_atomic_helper_bridge_reset(bridge, &cdns_mhdp_state->base);
>
>         return &cdns_mhdp_state->base;
>  }
> --
> 1.8.3.1
>
