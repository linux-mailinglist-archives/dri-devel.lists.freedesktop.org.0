Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEB43D2C56
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 21:05:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 859276E97A;
	Thu, 22 Jul 2021 19:05:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 175BA6EA7D
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 19:05:32 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 b24-20020a9d60d80000b02904d14e47202cso6295418otk.4
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 12:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=congdFIKNx3UQvjcKCH7cpv7zvqp5GO1L/NygEo3sXY=;
 b=dDIPDFkyDDHfqVGTpIk+wx1GBgHwuS+5k3bX78JBMROdG0Il9Fa6gFRE3N4NL2Qk0f
 SqQZg2RIPA064hM8VFnMY2q+vHBzUFSnc7iN5K2p7p4BJ7A/sYHwrrcq3pXBnJC7CkMX
 6ETr8WW+bTfkdyUukPtX19G0Yed7uhKTttRjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=congdFIKNx3UQvjcKCH7cpv7zvqp5GO1L/NygEo3sXY=;
 b=s8QbmzIby6VDs7bHjbI0+I2bno+BFoHNvs5TNChe22A4fHlAd1eDqHR5QI7cxbiPsE
 GaX41D2s3mNBAreqXlsWXaQdsg9z/0HOQnloJMbTgR/YIayTvCsVjeyTsLtUUaCM4Ibw
 KDC5Q7JJCwlJMW8+o7FIImJQREuDvJ+etCzrXT6+pqrGzwXE8uBYs8H6qgzhlrIqIYaU
 oNIEf2PnIbb4QeUAZivkVr0IoW9D0SQJJg1pimtEPpQaCPY7Ou1EHEMY27tBAnB7m+ys
 CASE8ofNquxXi31u26ZJUdX38aSAwm68sisPQ8MdaazLoaYrS7HMhCSpaRl64P+17f7M
 xdog==
X-Gm-Message-State: AOAM532UIVhWJhniOF0SrSJ61vSmKZ44dRjR8vNAAAyIxlc3iueovBWp
 5Hs+upT+tzhjuZy7RsuCMBe3yJhjmE7JV6TtMW1wEA==
X-Google-Smtp-Source: ABdhPJxszP1Nvb9QVLAphQ4FMRQGZNgHTiAOHsXtE6VBCSK4Mkx8qQEaF06I/qJbcI+d9b6gULejIcgtbhtlsXTT8NA=
X-Received: by 2002:a9d:8c7:: with SMTP id 65mr842433otf.25.1626980731332;
 Thu, 22 Jul 2021 12:05:31 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jul 2021 19:05:30 +0000
MIME-Version: 1.0
In-Reply-To: <1626191647-13901-3-git-send-email-khsieh@codeaurora.org>
References: <1626191647-13901-1-git-send-email-khsieh@codeaurora.org>
 <1626191647-13901-3-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 22 Jul 2021 19:05:30 +0000
Message-ID: <CAE-0n52JWbqwZtSCcLyzpsaFyd8mRLiXxLO-9YDk5xMbj_uQiw@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] drm/msm/dp: reduce link rate if failed at link
 training 1
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

Quoting Kuogee Hsieh (2021-07-13 08:54:02)
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 27fb0f0..92cf331 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1634,6 +1617,24 @@ void dp_ctrl_handle_sink_request(struct dp_ctrl *dp_ctrl)
>         }
>  }
>
> +static bool dp_ctrl_clock_recovery_any_ok(
> +                       const u8 link_status[DP_LINK_STATUS_SIZE],
> +                       int lane_count)
> +{
> +       int lane_cnt;
> +
> +       /*
> +        * only interested in the lane number after reduced
> +        * lane_cnt = 4, then only interested in 2 lanes
> +        * lane_cnt = 2, then only interested in 1 lane
> +        */
> +       lane_cnt = lane_count >> 1;
> +       if (lane_cnt == 0)
> +               return false;
> +
> +       return drm_dp_clock_recovery_ok(link_status, lane_count);

This doesn't work? Because drm_dp_clock_recovery_ok() requires every
lane to be OK whereas this function wants any lane to be OK? It may make
sense to have drm_dp_clock_recovery_ok() return false if lane_count == 0
too.

> +}
> +
>  int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
>  {
>         int rc = 0;
