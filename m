Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0306B455E8E
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 15:50:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA716E94D;
	Thu, 18 Nov 2021 14:50:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D8B56E96B
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 14:50:26 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id v19so5433073plo.7
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 06:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ny0uL9iKW5aWaMIzk2WLew51qerbE8sN22vaskeI4V8=;
 b=CVplG+fdNbG2kS4vvPdidKwwzJfLSXrSBRzZyc2c5aUsJqBAJfZ0BxY28Kac68yLQR
 zVF4DoR/6LnJBjJv0OWWcFRNmUuuMuEDH5kd/M08w6GDHLhjVKubbEQlHSaEcp41PJOV
 BvkulN5vl+6OoRglwO0AwTBG5RoVcOSfG+/wfwG4TArDNHOO+jc9LKf2LRbavZ1XDnLt
 wOBo+WPL3pxjdqAjVFJ1jNPy01sc3UgXSJwCMHqGJrK9p6UZbJXjb6ia9RqZG5huoE2G
 RCvK3Fq5Rfx3avvORmG+cORE3AXTx+ppPl0zojQQNsziz5xjayaw27EzSebvW0GnofUg
 waug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ny0uL9iKW5aWaMIzk2WLew51qerbE8sN22vaskeI4V8=;
 b=tN6+T0TGyu4nVk1r4NEnibLzP0B+KVp/l/bZtINMsJDTmifSwdbKhTz25nGg+9ywU/
 pPA+4tdgZxVluMZrcoS70OkftaufNcbBVgtaVWgakkcBZ4CptWhyfBLAM5T7NW6pIG1J
 AwceLHmoYLkTKpTj/yv5ro5dLzbePFzHWmxmuXPsbNaMLgnQgIykeY8XBFSdJan9bg2b
 H91vquNPOKkL/8pXzK3W0ySma4m1UoGrcSFFbu/VtS6s9PpGjIOLbxiskmk2io4qWd63
 PjSBhwoyk3vCzjPRHd6Gey+2CnHMLmJ2JVO6Yi6iUWRRqTIzwObHM1UWXb/9FxysP0Ya
 HEAA==
X-Gm-Message-State: AOAM530jKp+NNNj7taysS6VNorU4K0Lx6IMy/65xtwheAOjD4TZbwUDU
 wV2kKJu/r6Aofbstxq5qa+pLui6PQKokw0V9x8XWmw==
X-Google-Smtp-Source: ABdhPJzRsb5q5FxQnLpMJkOXR2yOgtMl+AskZu+DENNDEPdXtzjxW+yvTcKo+AeNsTJuCPBsF5iCtLEFJLiZeUIk1dc=
X-Received: by 2002:a17:903:2443:b0:142:1e92:1d19 with SMTP id
 l3-20020a170903244300b001421e921d19mr66795185pls.24.1637247026000; Thu, 18
 Nov 2021 06:50:26 -0800 (PST)
MIME-Version: 1.0
References: <20211110220050.2854-1-jirivanek1@gmail.com>
In-Reply-To: <20211110220050.2854-1-jirivanek1@gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 18 Nov 2021 15:50:15 +0100
Message-ID: <CAG3jFyvB-Dzd9YDJ7FrAC5avobL7Wfk-91E-DVeYWwfNcQLiLg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge/tc358775: Fix for dual-link LVDS
To: Jiri Vanek <jirivanek1@gmail.com>, Zheng Bin <zhengbin13@huawei.com>, 
 Vinay Simha BN <simhavcs@gmail.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ Zhen & Vinay

This patch looks good in itself, but I would like to see a tested by
tag. At the very least testing for regression in single-link LVDS but
ideally some third party verification of this patch.

On Wed, 10 Nov 2021 at 23:01, Jiri Vanek <jirivanek1@gmail.com> wrote:
>
> Fixed wrong register shift for single/dual link LVDS output.
>
> Signed-off-by: Jiri Vanek <jirivanek1@gmail.com>
> ---
>  drivers/gpu/drm/bridge/tc358775.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
> index 2272adcc5b4a..1d6ec1baeff2 100644
> --- a/drivers/gpu/drm/bridge/tc358775.c
> +++ b/drivers/gpu/drm/bridge/tc358775.c
> @@ -241,7 +241,7 @@ static inline u32 TC358775_LVCFG_PCLKDIV(uint32_t val)
>  }
>
>  #define TC358775_LVCFG_LVDLINK__MASK                         0x00000002
> -#define TC358775_LVCFG_LVDLINK__SHIFT                        0
> +#define TC358775_LVCFG_LVDLINK__SHIFT                        1
>  static inline u32 TC358775_LVCFG_LVDLINK(uint32_t val)
>  {
>         return ((val) << TC358775_LVCFG_LVDLINK__SHIFT) &
> --
> 2.30.2
>
