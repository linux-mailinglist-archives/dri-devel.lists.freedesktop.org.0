Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 949C23D2CB1
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 21:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 987ED6ECBB;
	Thu, 22 Jul 2021 19:23:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9100A6ECAE
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 19:23:30 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 r14-20020a4ad4ce0000b029024b4146e2f5so984237oos.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 12:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Tukn/VFkq/zbIvAQBZJ2D2pBDgI6O7uP6V5gIA4z0Cs=;
 b=izcRIsj/EbWJh2UlEyRKj40y1KJNwWt0Q2c1z272aeGQMkliR2QZrhh6QNUdoR5Es9
 V7pk9F6usbRo2am9EmW+nMLQuE1okDufGPdBXN7H1h4O/JeHfh9UN2viQ0WoQufBZdph
 iaC04st/zMeCrBtvGKAC1cuw8RO+Evjuza5s8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Tukn/VFkq/zbIvAQBZJ2D2pBDgI6O7uP6V5gIA4z0Cs=;
 b=qGobTCvB83mHdY+gHdSZ4igH/h95P6Io0KkwRSwf06Iil8YCIsOYlEAnEEHhBmLzO2
 /dOkOB1BBZRsKXUP3ERpydUrJLg+saesTxX0MuFgHQN8//MjV00PUWPxFp05Tgx7/iwK
 yqzsXmRX5M7EOeyiZ0WfPAXegTLGZ777FYBgA0oBhxHrUm1m6L0O3wAP7JGs2jBN9LpN
 +Yfa4Wp5g+vkSjmXNzS5E8UrfWBAzDLO0VWBFpP3/Si1yYEoEv3OLnYwwQPzFzZZ3EJv
 3hhBDZUhtlpz7VvuRNwkXbl8zzMFZNuZ7n3OdvoqQbSInACkK9Qoy9qZA/jYEUXTvQOe
 9vsQ==
X-Gm-Message-State: AOAM532/la2/XKcTUUVVe7uLhOvwkHvsBI3idnI1KlI0Sx4cA/8Crw7L
 k9HiaAs25thQLETXQjSWqN+ir8bh0uUYQ3OVqXICAg==
X-Google-Smtp-Source: ABdhPJwOn1Wqvg6925aBRm1hyQfmTcQevAAVZRd+qWgj03ySy8FvBlagvUplNKj1BkW0pcDmQUOYtYNffSKp8cW+XBM=
X-Received: by 2002:a4a:9783:: with SMTP id w3mr646286ooi.80.1626981809874;
 Thu, 22 Jul 2021 12:23:29 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jul 2021 19:23:29 +0000
MIME-Version: 1.0
In-Reply-To: <1626191647-13901-6-git-send-email-khsieh@codeaurora.org>
References: <1626191647-13901-1-git-send-email-khsieh@codeaurora.org>
 <1626191647-13901-6-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 22 Jul 2021 19:23:29 +0000
Message-ID: <CAE-0n539r5zQx7zX9bECspKUAypQ8VucgeMNTmqAjHOCemVmOg@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] drm/msm/dp: return correct edid checksum after
 corrupted edid checksum read
To: Kuogee Hsieh <khsieh@codeaurora.org>, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 bjorn.andersson@linaro.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-07-13 08:54:05)
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 88196f7..0fdb551 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -303,7 +303,12 @@ void dp_panel_handle_sink_request(struct dp_panel *dp_panel)
>         panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
>
>         if (panel->link->sink_request & DP_TEST_LINK_EDID_READ) {
> -               u8 checksum = dp_panel_get_edid_checksum(dp_panel->edid);
> +               u8 checksum;
> +
> +               if (dp_panel->edid)
> +                       checksum = dp_panel_get_edid_checksum(dp_panel->edid);
> +               else
> +                       checksum = dp_panel->connector->real_edid_checksum;

Is there any reason why we can't use connector->real_edid_checksum all
the time?

>
>                 dp_link_send_edid_checksum(panel->link, checksum);
>                 dp_link_send_test_response(panel->link);
