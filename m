Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A91D3D685E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 23:02:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED686ECCA;
	Mon, 26 Jul 2021 21:01:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9956ECCA
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 21:01:58 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id o20so12484815oiw.12
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 14:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=qmP+nvFdiGyxe0rj0aQYB75xMol5kzYi2IuKWY30b+E=;
 b=HcCfoB6PsDvFiCdKkUBvoH+mjMQf2ALTf9fhKLE/VjZ40hTKVuYuqbLnGBDUxHfxAT
 RHM5WJnd2hxeq1PTA0sGFMwF/UaO8yBbNY4WMZ7M4XFoki+iBfoUq6vM1TyoEawMx/bW
 eI0cTwTUN6xfERJ60Y4fIMo5CzpKfr9eewgqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=qmP+nvFdiGyxe0rj0aQYB75xMol5kzYi2IuKWY30b+E=;
 b=lLC3OmdfGPyL0KMbtxxLXRGjKCAGH+oLam87POSs9cnQpZJKqZyT5lODK/D+LkTPdM
 QvNnZVMB95opo6hIMiBorfgmexKiEnGEr2XpzM4hx8AYxG7P7s27akZNhwm8V26eX3D7
 OGL8Q8XSfkst4gqtKc2ed1ffbTwBrqm+r1/WdosI+bdV4idfb1Y4ri9HuAP5I6epWS/f
 DJ7Hr1vf1xTjcUA4yFCK8hioN26gX7qmfRZzZcMz85zuJ7YAjcdNZH3/wkV+iPubIXVL
 p6Xssagk8Ce7rRXAiYOY9aP6yy0s261Zd36A6a7oLzvwkyf3odA5FtwMRU1IYzVS6/Fv
 CmbQ==
X-Gm-Message-State: AOAM532aZVDqYR2Qb8le4h0sRyIvtoU7w7DhZqhlqoLChfrKM9YfRnZ+
 laOp717BbPJ1/6QxGTgUVr6EoUDT4rlp6MZElaUx6Q==
X-Google-Smtp-Source: ABdhPJy+zOV5H5QT2ONLq6/MZa4bLjvvPnTfl/f+51Qfcb8grTupNAQqi5h8GLKoIRhK4zyX3pBhEOFnFHlKvFHlnMU=
X-Received: by 2002:aca:afd7:: with SMTP id y206mr139164oie.1.1627333317558;
 Mon, 26 Jul 2021 14:01:57 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Jul 2021 17:01:57 -0400
MIME-Version: 1.0
In-Reply-To: <1627059339-12142-1-git-send-email-khsieh@codeaurora.org>
References: <1627059339-12142-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 26 Jul 2021 17:01:57 -0400
Message-ID: <CAE-0n51HF8E7x71Ru4EXoyYePoBNcrngwUE6H7b=tpgXuHdxHQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: signal audio plugged change at dp_pm_resume
To: Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, abhinavk@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-07-23 09:55:39)
> There is a scenario that dp cable is unplugged from DUT during system
> suspended  will cause audio option state does not match real connection
> state. Fix this problem by Signaling audio plugged change with realtime
> connection status at dp_pm_resume() so that audio option will be in
> correct state after system resumed.
>
> Changes in V2:
> -- correct Fixes tag commit id.
>
> Fixes: f591dbb5fb8c ("drm/msm/dp: power off DP phy at suspend")
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 78c5301..2b660e9 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1339,6 +1339,10 @@ static int dp_pm_resume(struct device *dev)
>         else
>                 dp->dp_display.is_connected = false;
>
> +       dp_display_handle_plugged_change(g_dp_display,

Can this be dp_display instead of g_dp_display?

> +                               dp->dp_display.is_connected);
> +
> +
>         mutex_unlock(&dp->event_mutex);
>
>         return 0;
