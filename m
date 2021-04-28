Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 725AC36DD0E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 18:33:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D7E56E3BB;
	Wed, 28 Apr 2021 16:33:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A08E6E3BB
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 16:33:29 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id d12so9044711qtr.4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 09:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+bqujsD1CEh1BMsQ6Vfhu0Dtl9EKMPvmnj/WQm5NOQY=;
 b=X5QjYOktKo0SOMzzXCGGEhJ1B+vtKaNQV8NPxuiFMVZI1s8N5Hsv83Svtsg50rgxqV
 Wme5k2pnWmXoL95EzEKY4g5itbI+wPpjl1gJvv8E9H6g6iahugJUDWBiswRZjV0HuMRk
 UKmaoLRN5K1bRs4417u9LHMJfv8sfU53FKwfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+bqujsD1CEh1BMsQ6Vfhu0Dtl9EKMPvmnj/WQm5NOQY=;
 b=LPty30a1xSfPIQDxL2mptXHrP+5UyqWVYThnu11gKjmg1Dctb27+9dl0qyYnT2Z3Do
 J7le9W25NAY4RDmHpXr0Lr2+4vAzH4AdRBKfZmEKJgeHfzNeZ9P8FN/mNc7NZRsjsCCn
 9aK0OoxRykjJmx9UIAt1N5+Zcsks0Jd/D8wVX+KG/TERynLy3X+vI9W2Qhqn1wMh3U99
 iLlP6KEWmTgzGK/lJ6EBqiPPknRXhjLCHU+TRvyWwppiXXC5oFvlRTukeZCLICe74GVn
 bDi8Y+7qmu+ur8ZAOP0vIqPqRFoPJzw4TggCIAXeo0dnMyn8Pqd3VWdTzu1dxWsFMW47
 Zxvw==
X-Gm-Message-State: AOAM532GNaslhISFwiwRlg5+7PcRkFC7x05sciOGOdSc93boLj90PEZq
 h0YMRRHzrXDepXHYJwxiuEtTmrR2GbIF6w==
X-Google-Smtp-Source: ABdhPJx+Fxp+GMfwV5VEgi4hXfeVP3CuyKBJ13nRqAKQzvut6mYJt7PEutJoHkqNYi5WKLcrzpDYUg==
X-Received: by 2002:ac8:6792:: with SMTP id b18mr12183829qtp.366.1619627608215; 
 Wed, 28 Apr 2021 09:33:28 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com.
 [209.85.219.179])
 by smtp.gmail.com with ESMTPSA id l16sm151760qkg.91.2021.04.28.09.33.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 09:33:27 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id g38so74674800ybi.12
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 09:33:26 -0700 (PDT)
X-Received: by 2002:a25:382:: with SMTP id 124mr19702977ybd.25.1619627606430; 
 Wed, 28 Apr 2021 09:33:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210423165906.2504169-1-dianders@chromium.org>
 <20210423095743.v5.1.I9e6af2529d6c61e5daf86a15a1211121c5223b9a@changeid>
In-Reply-To: <20210423095743.v5.1.I9e6af2529d6c61e5daf86a15a1211121c5223b9a@changeid>
From: Sean Paul <seanpaul@chromium.org>
Date: Wed, 28 Apr 2021 12:32:48 -0400
X-Gmail-Original-Message-ID: <CAOw6vb+wgVZVf_uRZCXhHoa+y-dJmd4u4JX2wHjO0jiB5bfujw@mail.gmail.com>
Message-ID: <CAOw6vb+wgVZVf_uRZCXhHoa+y-dJmd4u4JX2wHjO0jiB5bfujw@mail.gmail.com>
Subject: Re: [PATCH v5 01/20] drm/panel: panel-simple: Add missing
 pm_runtime_disable() calls
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

On Fri, Apr 23, 2021 at 12:59 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> In commit 3235b0f20a0a ("drm/panel: panel-simple: Use runtime pm to
> avoid excessive unprepare / prepare") we started using pm_runtime, but
> my patch neglected to add the proper pm_runtime_disable(). Doh! Add
> them now.
>
> Fixes: 3235b0f20a0a ("drm/panel: panel-simple: Use runtime pm to avoid excessive unprepare / prepare")
> Reported-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Sean Paul <seanpaul@chromium.org>

> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v5:
> - Missing pm_runtime_disable() patch new for v5.
>
>  drivers/gpu/drm/panel/panel-simple.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 6b22872b3281..9746eda6f675 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -797,12 +797,14 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>
>         err = drm_panel_of_backlight(&panel->base);
>         if (err)
> -               goto free_ddc;
> +               goto disable_pm_runtime;
>
>         drm_panel_add(&panel->base);
>
>         return 0;
>
> +disable_pm_runtime:
> +       pm_runtime_disable(dev);
>  free_ddc:
>         if (panel->ddc)
>                 put_device(&panel->ddc->dev);
> @@ -818,6 +820,7 @@ static int panel_simple_remove(struct device *dev)
>         drm_panel_disable(&panel->base);
>         drm_panel_unprepare(&panel->base);
>
> +       pm_runtime_disable(dev);
>         if (panel->ddc)
>                 put_device(&panel->ddc->dev);
>
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
