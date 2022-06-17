Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C9554FE2C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 22:15:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C466112C53;
	Fri, 17 Jun 2022 20:15:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB4D112C41
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 20:15:23 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 111-20020a9d0378000000b0060c2db66d44so3866852otv.6
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 13:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=x4as2ZkeTzWY1neBp0pSqFxYj7FvUKGmqCj9lFfh46Y=;
 b=jL9i7Buk6SOOHObeThBYqPreYlCVl+OpGSR+jNZBMrSfoB1QYntFn3u6z+nJTvigce
 VBwenMjhFopuHqns/67g6yQAunM9l/71QNfBId3EqQ2MflO/F5EKVaC7RRlQ/ADStdG5
 2smcG2mIm1zKF2VFUSfELh3VT3Zvt/s+Ubv68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=x4as2ZkeTzWY1neBp0pSqFxYj7FvUKGmqCj9lFfh46Y=;
 b=Xod2Op0FVDMFvQTMvjqCpp1yzgqoOjoXy2A/w83IJ0V6paZO8B5fn+HcdxQ1wvt936
 61G6ioQCa8p6+rAUuKnkAjLcRwZ3XLniOqKvbdghurEYWUBKMhSSrS+sMgS/ho4e+AJS
 HHqcWT9sX7uN2j/LB6nfysv4Y6i+Z9POqlj8fuYGu/kzyzaj3c+G/zSIsZpIteIV8trc
 GTdE+kFHmJHM0YUAsxrpYg+nM8r+TZXL5H2l6iIR+6mQKKTcfXrz05fsBzZLVgWl8X1W
 Oljp1C3tIIjcvCTaOu3ek1/eTDwT80rFCBHknQdDXNaMZW57Q7VezmYpvqY2yL1IVtky
 pr5A==
X-Gm-Message-State: AJIora8A1jsv13lsKn/NahrNU3MFWBZme7X1jfY+xVNww3zf8lFo6YKG
 Jv4d5L71UqOBXIIEvyaw/oHJkGAj5cv2wF+QlBRvcA==
X-Google-Smtp-Source: AGRyM1u4nMHweik4URlw+DCJbLUl0w+UrlWDIBvKtDehatittlrFKAJ8bL5+y6eZyKP4hA1WsTKrT7WnEl7enizsIq4=
X-Received: by 2002:a9d:6484:0:b0:60b:eb0b:4054 with SMTP id
 g4-20020a9d6484000000b0060beb0b4054mr4702235otl.159.1655496922910; Fri, 17
 Jun 2022 13:15:22 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Jun 2022 13:15:22 -0700
MIME-Version: 1.0
In-Reply-To: <20220617194921.1098725-2-dmitry.baryshkov@linaro.org>
References: <20220617194921.1098725-1-dmitry.baryshkov@linaro.org>
 <20220617194921.1098725-2-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 17 Jun 2022 13:15:22 -0700
Message-ID: <CAE-0n51vDC-a=87hbM_rvxhNNV7KNpCHy3=wH0N5VCEvdrjyuw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm/dp: remove dp_display_en/disable prototypes
 and data argument
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-06-17 12:49:21)
> Remove unused dp_display_en/disable prototypes. While we are at it,
> remove extra 'data' argument that is unused.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 1e34ac2126f6..42ceb4c5796c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -607,9 +607,6 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
>         return 0;
>  };
>
> -static int dp_display_enable(struct dp_display_private *dp, u32 data);
> -static int dp_display_disable(struct dp_display_private *dp, u32 data);
> -

This part looks good.

>  static void dp_display_handle_plugged_change(struct msm_dp *dp_display,
>                 bool plugged)
>  {
> @@ -856,7 +853,7 @@ static int dp_display_set_mode(struct msm_dp *dp_display,
>         return 0;
>  }
>
> -static int dp_display_enable(struct dp_display_private *dp, u32 data)
> +static int dp_display_enable(struct dp_display_private *dp)

This will conflict with Kuogee's patch[1]

>  {
>         int rc = 0;
>         struct msm_dp *dp_display = &dp->dp_display;

[1] https://lore.kernel.org/r/1655411200-7255-1-git-send-email-quic_khsieh@quicinc.com
