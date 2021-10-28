Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB5443DB0D
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 08:21:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C3DB89B84;
	Thu, 28 Oct 2021 06:21:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C650089B84
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 06:21:14 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 w12-20020a056830410c00b0054e7ceecd88so7219471ott.2
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 23:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Mc9LKQAQoslOGm6o+pVM9AhRB1ZUOOEE/5oefVUl9Lc=;
 b=ispJvbrsPNohrDzzQOfGiAya2Gz/DXYBgvobMGSF8M38h1V5YLwF3zJvQ5mUvZWXwx
 dNEfCluGOMa///Ra8ket00k+BpYhjPld4QIjQuSaWuENr4YoQZ+SqqB8Z+bJu4ro7cMI
 wJxalHJpVDA7mjndkAe3QO2kjHgd/v7TFYCuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Mc9LKQAQoslOGm6o+pVM9AhRB1ZUOOEE/5oefVUl9Lc=;
 b=y8wN7ahGav2Pv3zCHh8tC5QT++IWtiMZgscyTy4pR3InPzGmaglByUv2s2JcDU4I0R
 toDx9BskS71MrKoXJC4tk0NBtHXBK0McMEMy00iFiH3JeUDTgQfUOugrfz6SYfi7SocR
 zJYs4F1aa7ZkF7hoh7Qg9IEpKyEoV+r+6LOA0TAuCJ7qP2zdBjDfmqxs3vJiyUOn+ek+
 oDWcylavgb6xPpeMPmXWQv8lsyxBUw8utW8xels/8USgOFfonI6moXWC2Bm/XMp08326
 RA7IUXBpgouslPIyQJByNzVzRpLKZwUe0q9/GZEmVABzGp0qC97kItO47eIgQykJXmLF
 dKZw==
X-Gm-Message-State: AOAM530BLFP56YV6L/4FRxLUmiXw/WuduM0kE2ZU9g/5tuAnhybFVq8G
 bn7tzlAW/d6UrXgrpxEHN6rpaHQflD+J6vEJL0BopA==
X-Google-Smtp-Source: ABdhPJwXQHqI3ICCqimmpImWWFhlxNmRD9J4BKAimAk2nP8JakuCfq++JC5QTUaAhvBLQQixIagkH4fHHMXy87/FcEE=
X-Received: by 2002:a9d:7655:: with SMTP id o21mr1891665otl.126.1635402074047; 
 Wed, 27 Oct 2021 23:21:14 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 Oct 2021 23:21:13 -0700
MIME-Version: 1.0
In-Reply-To: <1635386088-18089-3-git-send-email-quic_sbillaka@quicinc.com>
References: <1635386088-18089-1-git-send-email-quic_sbillaka@quicinc.com>
 <1635386088-18089-3-git-send-email-quic_sbillaka@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 27 Oct 2021 23:21:13 -0700
Message-ID: <CAE-0n53gO-NtWosw8kjTkjv7eUPt+VH2rzAvDAYYwpGK+jJ=nw@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] drm/msm/dp: Add DP controllers for sc7280
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, seanpaul@chromium.org, kalyan_t@codeaurora.org, 
 abhinavk@codeaurora.org, dianders@chromium.org, khsieh@codeaurora.org, 
 mkrishn@codeaurora.org, sbillaka@codeaurora.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Sankeerth Billakanti (2021-10-27 18:54:44)
> The eDP controller on SC7280 is similar to the eDP/DP controllers
> supported by the current driver implementation.
>
> SC7280 supports one EDP and one DP controller which can operate
> concurrently.
>
> This change adds the support for eDP and DP controller on sc7280.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
>
> changes in v3:
>     - Split into patches according to function (Dmitry Baryshkov)
>     - Use DP_CONTROLLER_1 for eDP controller intf (Dmitry Baryshkov)
>     - Use DP_CONTROLLER_0 for sc7280-dp (Dmitry Baryshkov)
>     - Add macro in drm_helper.h for checking ssc capability (Stephen Boyd)
>     - Use existing macro to check assr capability (Stephen Boyd)
>     - Add comment for HPD_INIT_SETUP delay (Stephen Boyd)
>
> changes in v2:
>     - Don't initialize variables to 0 (Stephen Boyd)
>     - Use const for read-only dpcd (Stephen Boyd)
>     - Remove zero pixel clock check (Stephen Boyd)
>     - Sort compatible strings alphabetically (Stephen Boyd)
>     - Use pwm_bl.c for backlight instead of gpio (Stephen Boyd)
>     - Change return type for functions returning always 0 (Matthias Kaehlcke)
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
