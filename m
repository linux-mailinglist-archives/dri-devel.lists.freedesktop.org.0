Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6E248422D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 14:13:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69FCB10E266;
	Tue,  4 Jan 2022 13:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4145410E266
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 13:13:17 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id 8so32202265pfo.4
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jan 2022 05:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pQb0DIrsgwrY39ZJp4Gbi20DdgFhiCJMM0UBEM1mze8=;
 b=qfMgs3gNP9IhkFZpOxI/W0VlK2Rki6/H+1oKwkREx4rl+Ox2CQxa1vQ0OWLiwYhRbz
 0HkyYqM1u+acg86NMtLrO9w8zD1whdcLZProe33Q+JC69IXoAMqh3Y/pceobavfBVT/j
 eOziwPg0xeIAfisD0qaU85nb5DJYL9NbXMRH+SpPIUYdmkZ/MFRs+ByxJJSCTAlW+ZCl
 PLgk3mnPOlufa/0JYqn9qLnVju+/JYp54ePyepzpBo7aQo2O2V6AMtvU/RYTjcVEurVT
 LUUVYushGPiua20JjEMyNgpe7EmB2+fbZ611lApQdRvoeVGLeIxEPcqLJlaHum7Fg2b6
 ywhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pQb0DIrsgwrY39ZJp4Gbi20DdgFhiCJMM0UBEM1mze8=;
 b=22koiSqBQZh7gOmCLhhsGCKuGP4RjZArpAYfq8/yxbzuO4OPl2GQGOPRo7/1SdPAfx
 G7RL0W0CofcDH+cKWd6sOX4bCukuf7W27bE95KEOZ37b367tIZYvm3l0J1Is0rXguv4v
 J1rg9rsYSNwaK8IGSf/AfSX5wPoEk5LcfZuPhJ+ue4fhH8ffYqpkHgwAd3WSwTsEHZTP
 ZqVG0YQUIc15RCbaaiLu3BBnZOewYnRmwBCiXbLK4FN6Hp5W+FHFn8YRUpwP/4+of00v
 a//QKVeRtatbm4iOF8jr3hOWBbLtS94/00ToXOJTFYbbuRt4s0AEPRQSwZ3hw8gDtxN0
 i08g==
X-Gm-Message-State: AOAM5331W5+6zncBa0hNk5qGDzwCWrSXOoHo3s6iwc53Pyad10H7UlGI
 5hH0RN97VpDMJXUJ1Iv6+XyJaOSsj3fvDic3qJbpFA==
X-Google-Smtp-Source: ABdhPJx+P5Je+IhljrJKeXPje/sQlDLlysR9Jr9VsVBOTdAksyr4JhbGrpRtfGq7ayAtXHn87lvMqSvOTR3amiAJ3v8=
X-Received: by 2002:a63:854a:: with SMTP id u71mr43738870pgd.201.1641301996726; 
 Tue, 04 Jan 2022 05:13:16 -0800 (PST)
MIME-Version: 1.0
References: <20211227092522.21755-1-linmq006@gmail.com>
In-Reply-To: <20211227092522.21755-1-linmq006@gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 4 Jan 2022 14:13:05 +0100
Message-ID: <CAG3jFytHBizw_kxbjgRkv0WcxJE1LsKhO7X98fDGSqCzh2kafA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: Fix free wrong object in
 sii8620_init_rcp_input_dev
To: Miaoqian Lin <linmq006@gmail.com>
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
Cc: Sean Young <sean@mess.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maciej Purski <m.purski@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 27 Dec 2021 at 10:25, Miaoqian Lin <linmq006@gmail.com> wrote:
>
> rc_dev is allocated by rc_allocate_device(), and doesn't assigned to
> ctx->rc_dev before calling  rc_free_device(ctx->rc_dev).
> So it should call rc_free_device(rc_dev);
>
> Fixes: e25f1f7 ("drm/bridge/sii8620: add remote control support")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>  drivers/gpu/drm/bridge/sil-sii8620.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridge/sil-sii8620.c
> index 843265d7f1b1..ec7745c31da0 100644
> --- a/drivers/gpu/drm/bridge/sil-sii8620.c
> +++ b/drivers/gpu/drm/bridge/sil-sii8620.c
> @@ -2120,7 +2120,7 @@ static void sii8620_init_rcp_input_dev(struct sii8620 *ctx)
>         if (ret) {
>                 dev_err(ctx->dev, "Failed to register RC device\n");
>                 ctx->error = ret;
> -               rc_free_device(ctx->rc_dev);
> +               rc_free_device(rc_dev);
>                 return;
>         }
>         ctx->rc_dev = rc_dev;
> --

Reviewed-by: Robert Foss <robert.foss@linaro.org>
