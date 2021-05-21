Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CBF38D1BA
	for <lists+dri-devel@lfdr.de>; Sat, 22 May 2021 00:58:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5754B89CDB;
	Fri, 21 May 2021 22:58:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C377E89690
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 22:58:24 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 d25-20020a0568300459b02902f886f7dd43so19475094otc.6
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 15:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=WWt/k9Je81/trW2ess0PPge81hA65LJflgpCeG95+Ro=;
 b=SHnMgnsQJTouHaGQqt9wUdT3Zp6Q/2DQMhh/lSL8MYm5uRkqyz9bPZjceu/fZmZUaC
 /bi+E7zLw635BjJ7M9yaoZqTwGwgqP8qmim5ZbMQ9pxM9LwhTtCN2JFbe0kP1e6NP67y
 ojzYKDjY2t7pxLukiK31Sb29vOfYJlay0n+Nk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=WWt/k9Je81/trW2ess0PPge81hA65LJflgpCeG95+Ro=;
 b=XSDV7JAVvZZNMf2NPU1X/gAH7CjxlIrBkELG1LHKnn0ilfUt51+UeKje9iaqBYeQvJ
 IRGJRt/wUC6MZiZk2B7ZMYrJgUjEGq4BQSAM1EuAEKRFKIpwlqBEGjXzZIuUa6ZxxnaI
 4PG0dNpXHKf9pNdlRhliEHvs2uwLwgnRraG08tw3AL9Xl+1TrSgXXzUm6QwsNCQBGo+J
 /5KgbnuJTuoubEyrcMRoPt1NFsiTYi6pywCHBcqrygCK9mA49UU4a3kGyMAG5Leehno5
 sulo+lOvP0n3PpKhT+0C91awxkHaW28R4mxSDIEnocmDgeYxu/W2RAxeCzlNt1gFuB+U
 rwvw==
X-Gm-Message-State: AOAM531NT2SS3KqXo5TGhmPCba+Jtj0Mwc2jebPH4MXOzwSngV9q/rED
 sOOaHW6OLxJk8NozTMrUOzHWLyy/LVJHONyvkC+OGA==
X-Google-Smtp-Source: ABdhPJwO86MrFBCtOIipE84r+ZTQINMq6JbXFOgjgA7d8nzGf6JSBROtp+5gY0cJjmLE/r/p5TiM2xjvF8dIa/zGIQI=
X-Received: by 2002:a9d:1ea9:: with SMTP id n38mr10482377otn.233.1621637903832; 
 Fri, 21 May 2021 15:58:23 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 21 May 2021 15:58:23 -0700
MIME-Version: 1.0
In-Reply-To: <20210520120248.3464013-28-lee.jones@linaro.org>
References: <20210520120248.3464013-1-lee.jones@linaro.org>
 <20210520120248.3464013-28-lee.jones@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Fri, 21 May 2021 15:58:23 -0700
Message-ID: <CAE-0n53gjZKSByr+ny_Mp4MJtkwejJW2RLj0jp1D7fZtbeOvJg@mail.gmail.com>
Subject: Re: [PATCH 27/38] drm/msm/dp/dp_catalog: Correctly document param
 'dp_catalog'
To: lee.jones@linaro.org
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Chandan Uddaraju <chandanu@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Lee Jones (2021-05-20 05:02:37)
> Fixes the following W=1 kernel build warning(s):
>
>  drivers/gpu/drm/msm/dp/dp_catalog.c:206: warning: Function parameter or member 'dp_catalog' not described in 'dp_catalog_aux_reset'
>  drivers/gpu/drm/msm/dp/dp_catalog.c:206: warning: Excess function parameter 'aux' description in 'dp_catalog_aux_reset'
>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Chandan Uddaraju <chandanu@codeaurora.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
