Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC1E4CC7C1
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 22:16:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D3A10E780;
	Thu,  3 Mar 2022 21:16:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03EE610E780
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 21:16:29 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 j7-20020a4ad6c7000000b0031c690e4123so7210791oot.11
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 13:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=b9LkDSalYnfbbApSpe3SAwrawk5gyyAOB8WRwBR0Y/4=;
 b=Om8PjTsgYQBPn8NSNUOMRV/o0qDRvTWv+21nczSZSqtYT1II1THl/sirbaOHq59EoD
 8oC9UczjjJGype9msfKydyEGmLPS5mOFh4O+qYFjBR9vpF1g7fGyMYCuhm9fUw81IhQk
 qEg5U793sxIMvzIHOHNC6MFlKe/7PeiS6VM/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=b9LkDSalYnfbbApSpe3SAwrawk5gyyAOB8WRwBR0Y/4=;
 b=5LpCPrOE4XNSGpA7px7Xj42vasgvpWeMw4XzTeAYZbgextWdk6Rl35ZCLyiU1o8nVR
 6B9gChNc+J/xiweziEwsSx2ZPxLGHhj7VswsGOGBjwQVQT8VsJiFnKvRjF1UCimvE9Wk
 MdqHOk//R8uH6aZu7Dj3rkbSm2c44CVmtE5todTHYw6PtKEVycXuE94AdzqZbXH+HzWN
 ML/tuizerF5gUqH/J2cb6hOeWbjFTVbJTvEXl5UrezS4rGdwreZOqXfsPodahZVrTnYE
 1tE73ksVhTYBZpXSN4zg8iyqqg7hZu+yJiihHf6v2G2AzG6KbfxtX5ZIo+s1jpJEYvIX
 jB4w==
X-Gm-Message-State: AOAM531r76PkUJVx0VJ1NWbrsohQDz3wGC5zkZctQiy3V8yBuRs7H8I3
 1/92e0hprWOGGygvm9oUSRAwZdabQ1le+WY7hwPddg==
X-Google-Smtp-Source: ABdhPJyA6ybPAMYhh82KSFMBxr72uT1gRalCTbSK02jkxBO6UIRxSOj0S1+FwINbQlxVAgTyYWMW/UCHAaXj/JjSH5U=
X-Received: by 2002:a05:6870:14cf:b0:d9:a9ce:92a9 with SMTP id
 l15-20020a05687014cf00b000d9a9ce92a9mr5606543oab.64.1646342188296; Thu, 03
 Mar 2022 13:16:28 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 13:16:27 -0800
MIME-Version: 1.0
In-Reply-To: <20220222062246.242577-2-dmitry.baryshkov@linaro.org>
References: <20220222062246.242577-1-dmitry.baryshkov@linaro.org>
 <20220222062246.242577-2-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 3 Mar 2022 13:16:27 -0800
Message-ID: <CAE-0n52ZvcshSzGDsSrCzBkT95BidDOBpsPwu2x_5sjW9d55Zg@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/msm/dpu: document INTF_EDP/INTF_DP difference
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
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
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-02-21 22:22:43)
> Based on the discussions on the mailing list, document enum
> dpu_intf_type and it's controversial fields: INTF_DP and INTF_EDP.
>
> INTF_EDP is used for older eDP interface found on msm8x74/msm8x84
> INTF_DP is used for both eDP and DP interfaces handled by the msm/dp
> driver. The DPU driver does not make a difference between them.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
