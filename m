Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CEC36DD33
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 18:38:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF2AB6EBA0;
	Wed, 28 Apr 2021 16:38:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A256EBA0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 16:38:54 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id o21so19005027qtp.7
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 09:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ouf+5ZvIPbhOgiylW2yryEkXKmUKnkmHbAua9prhku0=;
 b=OqgDSWd0iwEYtrbB/lTWLSzGXqCXPeg8wHFOtfFXOKuVb9Lh/xMAhwgSkqipouV8PI
 4FONKugSbjATl2gMXT0mpO9v19lDf6J46Pfi+5MyjUpJYceeV9KnWXlFAnk+IYC5cDLv
 Ljni0gGHvU3IbxcjFaToo/+d7k+7c8D+AbLTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ouf+5ZvIPbhOgiylW2yryEkXKmUKnkmHbAua9prhku0=;
 b=ELCYwkR4eWKCPV/jI0hHNy6rgfS1Alevtr5foa7fqWX7H32q8DkypaUDsE9eIUQ8TY
 IYKmm9Ve6SnRy5/Rur4+Vdt0av2/ClN6+sKVkaRafR/EJIkg1AArwFWI/wQOvZTSnIMg
 G62fuqS0OQ6493AzPVRfluQ5YytTbKw90LSXdhEYigwW4FOTl4u1JQHzTsiIhBan5nNs
 b3fDCkm/KqXEPiXyYTqVy2BPwM8nZBaf7qTM9iy70DQ4kU9ySMQAwhQniK9bNzt7gxlQ
 SJR7Gud2lFEaaYedR8Cvi6s9mJMsgPgw+k9cEaA/fVtpTXS8Por6418qzzRh5nzNmS2z
 Ea2A==
X-Gm-Message-State: AOAM533DlmTSIKUdde4FqIHr/n0Ek7p5e6G/vUdOQPmp56PdmGPFoQ+d
 Q/ARwkrhI76piL28pU4eQuqHZwOQ+12CLQ==
X-Google-Smtp-Source: ABdhPJx8p8jHEuMAV2TTG7CDYtlIWppfHTl2fIHtUt9C+WR7Uz3AjukKP7f2XLyRvCePIXtZ7wmwcQ==
X-Received: by 2002:ac8:535a:: with SMTP id d26mr10094987qto.260.1619627932909; 
 Wed, 28 Apr 2021 09:38:52 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175])
 by smtp.gmail.com with ESMTPSA id 185sm152844qko.99.2021.04.28.09.38.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 09:38:51 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id j6so6984690ybh.11
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 09:38:51 -0700 (PDT)
X-Received: by 2002:a25:6c0a:: with SMTP id h10mr40506121ybc.167.1619627930452; 
 Wed, 28 Apr 2021 09:38:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210423165906.2504169-1-dianders@chromium.org>
 <20210423095743.v5.16.Icb581b0273d95cc33ca38676c61ae6d7d2e75357@changeid>
In-Reply-To: <20210423095743.v5.16.Icb581b0273d95cc33ca38676c61ae6d7d2e75357@changeid>
From: Sean Paul <seanpaul@chromium.org>
Date: Wed, 28 Apr 2021 12:38:12 -0400
X-Gmail-Original-Message-ID: <CAOw6vbJOOEi9zyRnSMDL=qLMQPXU1uPwQ-K435_1uipcyqyUJQ@mail.gmail.com>
Message-ID: <CAOw6vbJOOEi9zyRnSMDL=qLMQPXU1uPwQ-K435_1uipcyqyUJQ@mail.gmail.com>
Subject: Re: [PATCH v5 16/20] drm/panel: panel-simple: Remove extra call:
 drm_connector_update_edid_property()
To: Douglas Anderson <dianders@chromium.org>
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
Cc: robdclark@chromium.org, Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Wolfram Sang <wsa@kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Steev Klimaszewski <steev@kali.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 23, 2021 at 1:00 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> As of commit 5186421cbfe2 ("drm: Introduce epoch counter to
> drm_connector") the drm_get_edid() function calls
> drm_connector_update_edid_property() for us. There's no reason for us
> to call it again.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Sean Paul <seanpaul@chromium.org>

> ---
> As Laurent pointed out [1] this is actually a pretty common
> problem. His suggestion to do this more broadly is a good idea but
> this series is probably a bit ambitious already so I would suggest
> that be taken up separately.
>
> [1] https://lore.kernel.org/r/YGphgcESWsozCi1y@pendragon.ideasonboard.com
>
> (no changes since v1)
>
>  drivers/gpu/drm/panel/panel-simple.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index bd208abcbf07..4de33c929a59 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -512,7 +512,6 @@ static int panel_simple_get_modes(struct drm_panel *panel,
>         if (p->ddc) {
>                 struct edid *edid = drm_get_edid(connector, p->ddc);
>
> -               drm_connector_update_edid_property(connector, edid);
>                 if (edid) {
>                         num += drm_add_edid_modes(connector, edid);
>                         kfree(edid);
> --
> 2.31.1.498.g6c1eba8ee3d-goog
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
