Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAB74E69A3
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 21:07:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4962710E1FE;
	Thu, 24 Mar 2022 20:07:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA5610E1FE
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 20:07:44 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id r8so6037038oib.5
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 13:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Cg3NylWZJ/PElbZt4b99/mDNvvoDZp7ffKlCSxaDUYg=;
 b=chW8YydqlNUXwkhifh8g9HI1cQG2scXiQLAtd/9C96Ro0YahW6RUj3JdB3ortjEQ5D
 XYIEzngiMK0LVLardc9TBW9wmke8bxwDrQw81faArJaoCdNc5/aXcNZO7YTasnEXsj1d
 rNu4CXlzwVi1omwO68IOCQInfhnTIfAIjPtgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Cg3NylWZJ/PElbZt4b99/mDNvvoDZp7ffKlCSxaDUYg=;
 b=b4yDxA6jpGE6Ppxh4qWFsDgFHsvNSF9JXbTjSSriiL4hFqK/aZbTtGVsgaODNIPPsX
 iJn+MwVX8F/46lfegF/aXr6i93CNIRB19WaR8zfzgp3JVQFkZJQ4Bo52hB87GcG/Aos4
 0zj04u/fAIepC8A742wP6w2ieJu1FtnGA09xG/YvZFrDqyLMbvwAYa76c7YKAXsPTfEs
 y2ierHiEO2viSdifvb6+UcchPZdLNDIqeYX6KsHaqfJd21wpG+9pOzXsgBry51WUxOHg
 DxCm9ElRLV3VTHHAh+gOGmHY8ekUN2tvDKT3n6XnNYxzn0l07zjipcVygYWEyp1FV521
 Sw8Q==
X-Gm-Message-State: AOAM530TV5keF4A0K/iYlkPkCwk8kRGDeudAvC/gsEcWWLviemwnJVpt
 ZPU+6lJlTOQ4rfzIi5lCcv2K+AghASCdtn3WHvltMQ==
X-Google-Smtp-Source: ABdhPJxLd9283LWH/H+RVJS+GlWfRyT8dqeb5nlwjkad7sBHwIlXo5+tm7x05Z6jNmDfcbRKWPNOiVp0XJG/1vESqBQ=
X-Received: by 2002:aca:a9c8:0:b0:2da:45b6:b796 with SMTP id
 s191-20020acaa9c8000000b002da45b6b796mr3297126oie.193.1648152463729; Thu, 24
 Mar 2022 13:07:43 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Mar 2022 15:07:43 -0500
MIME-Version: 1.0
In-Reply-To: <20220323103546.1772673-2-dmitry.baryshkov@linaro.org>
References: <20220323103546.1772673-1-dmitry.baryshkov@linaro.org>
 <20220323103546.1772673-2-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 24 Mar 2022 15:07:43 -0500
Message-ID: <CAE-0n52bf2VHfC+a58+P88bG2WiwDZrFd0hzAPcSFDNC_RYW8Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/msm/dp: drop dp_mode argument from
 dp_panel_get_modes()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, 
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
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-03-23 03:35:44)
> Since the commit ab205927592b ("drm/msm/dp: remove mode hard-coding in
> case of DP CTS") the function dp_panel_get_modes() doesn't use (or fill)
> the dp_mode argument. Drop it completely.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
