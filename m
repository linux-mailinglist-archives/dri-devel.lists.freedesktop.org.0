Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DBC37251B
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 06:30:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5988A6EA80;
	Tue,  4 May 2021 04:30:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87ACA6EA80
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 04:30:45 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 92-20020a9d02e50000b029028fcc3d2c9eso7189565otl.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 May 2021 21:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=uW8f+s6xq4qAcq3HteqNyRrQN93bF04v9vZ/QplP8pc=;
 b=n07xEkrQlpcNFHZtxrsbxZDJwL4UA2XXfU57czlJaBZdhz5dhG2P0aX3piaOhtfaYk
 mZxQDWRyM2Q0bBkDd/Sf5YcxIjE3igvPrYlfaQW0PbFon2KVErZwDxLzOcJX8R6hlWnp
 hvflSpdfnmEV0kTYIFbtFLVmseavbB/WvPUTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=uW8f+s6xq4qAcq3HteqNyRrQN93bF04v9vZ/QplP8pc=;
 b=XpA6gsy82oMopej6sirjpPDSnRFNIqy81l4jlWLd8keHM8i4+oPpqY7TsZ2SfKZRc9
 Vu1nOfmNuOCO4OIkXi+bbVjjubaAjNNpa8A5bggFx9XI/2g2vPudf8ZN2v+OSbvCSrX9
 0owFg9P8JcZmWwi3WQgN0d4YO1UX79lPKXo6endNmyAe+WrefMhFfhY2Ehz+KKxKBd2B
 1p2rbIVJzcrRXKurF7S5KEtGLqCYPR3QJuAWcd5XxxvZB2OvM+pGr3Ugs9lL3jmM8dvU
 1IPzp2uNrcvTrUcSpNXQEqaORWLRj80p7xoNRUzeGSdGZ/LLxUqv6w9bLbJZbKmeCRFV
 FEnA==
X-Gm-Message-State: AOAM532sXS5eSclGA9MdPvbb6JlwL9kXNl3LCWt8lPLleyiceRHv8doJ
 VFsRS2OqwWJEKrAhVqsrR+I4j8sTnLQcgXtTClznhw==
X-Google-Smtp-Source: ABdhPJwq6mdnfPJ4VcbDYA3afNLoRfzA/g9YDHhjK7Sh6BJt5OqOsgrHpb7zBzgoWlk7yUMrL73oVH49hU1RgHE5DN0=
X-Received: by 2002:a9d:222a:: with SMTP id o39mr16982065ota.246.1620102644899; 
 Mon, 03 May 2021 21:30:44 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 3 May 2021 21:30:44 -0700
MIME-Version: 1.0
In-Reply-To: <1619048258-8717-2-git-send-email-khsieh@codeaurora.org>
References: <1619048258-8717-1-git-send-email-khsieh@codeaurora.org>
 <1619048258-8717-2-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 3 May 2021 21:30:44 -0700
Message-ID: <CAE-0n53_CMed87hPgBFjN_dmRrPkfG3ZBjHCni2+2kxp_QfFpw@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] drm/msm/dp: check sink_count before update
 is_connected status
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 abhinavk@codeaurora.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-04-21 16:37:35)
> Link status is different from display connected status in the case
> of something like an Apple dongle where the type-c plug can be
> connected, and therefore the link is connected, but no sink is
> connected until an HDMI cable is plugged into the dongle.
> The sink_count of DPCD of dongle will increase to 1 once an HDMI
> cable is plugged into the dongle so that display connected status
> will become true. This checking also apply at pm_resume.
>
> Changes in v4:
> -- none
>
> Fixes: 94e58e2d06e3 ("drm/msm/dp: reset dp controller only at boot up and pm_resume")
> Reported-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Tested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 5a39da6..0ba71c7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -586,10 +586,8 @@ static int dp_connect_pending_timeout(struct dp_display_private *dp, u32 data)
>         mutex_lock(&dp->event_mutex);
>
>         state = dp->hpd_state;
> -       if (state == ST_CONNECT_PENDING) {
> -               dp_display_enable(dp, 0);
> +       if (state == ST_CONNECT_PENDING)
>                 dp->hpd_state = ST_CONNECTED;
> -       }

This part has been there since commit 8ede2ecc3e5e ("drm/msm/dp: Add DP
compliance tests on Snapdragon Chipsets") so we should add that tag here
too, like

Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on
Snapdragon Chipsets")

It would also be nice if this hunk was explained. It doesn't make sense
to me that a timeout would enable the display so maybe that can be
called out in the commit text about why we remove the call here.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
