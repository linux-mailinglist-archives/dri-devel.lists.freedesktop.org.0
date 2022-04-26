Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 618BA510B1D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 23:18:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6941C10E02B;
	Tue, 26 Apr 2022 21:18:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694BF10E02B
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 21:18:34 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-e656032735so39303fac.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 14:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=UQdTLiFS6s5lb76z4V/zrcCjKl7kNha5dSW7q7Ju4iw=;
 b=i4UpTC9epX2dJK4owogRVosBAzugi615/pZuFaNT0GMn/rXImP/Z1IkC2BP9L9m3KO
 mOisseWijdZbjf0asGuv7vhXCkSH5GH52OL4ryQ5V/9AvT8Iyl7NkSWHt+uM/IKxVuKp
 8mCGvnSETOUjT5zWn1gPpmQuBa/iZlytHc92U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=UQdTLiFS6s5lb76z4V/zrcCjKl7kNha5dSW7q7Ju4iw=;
 b=0WeLAb7KKEh4Hv3ZJzk3glY0Qtgfghvc/6utCVtc84NH1oqvMmFU2zXTqKMLHqhjZz
 1KjFK6P9zjhKnb8g1ED1VaKdTeZCEjGnXvkSG1bnek366+kU4djjKlEVoukQf5Wn0bdj
 mtcp/nqciF6+TsZfFCPSmw1l4ykh55I0jRzku74gXIyDGl1nWy+EeRvWl7MIYuN0j/uj
 6pHzKwp+vW7UleZR/qc2c0uW/2vVpWw1e4ZpobO52Snhpc/HUX6/CTl1C0AyT3/Upt8a
 ewgGffj0s8SwYu7RQSIR6kWT92qjf6UT1Q8ClyjGBAgKRy/y2hmWBeV5abnUGtbLao4H
 LADw==
X-Gm-Message-State: AOAM5320uiai69fq0b+656uvHWanHB4FSx/HXr9yo1nIp0We8GFraDS5
 dwVLv598SmP1dEBhPeSHBB22M+0amSc6jHC4OSDwtg==
X-Google-Smtp-Source: ABdhPJyW17NjxF3rs/I0KgToaqsIbXY3bjCBx58ePbAI217dDz1IltjBckzBntvCJY0CiDdmMaXOV9ldviATzU4d0f8=
X-Received: by 2002:a05:6870:15ca:b0:e9:551:6d1c with SMTP id
 k10-20020a05687015ca00b000e905516d1cmr8599802oad.193.1651007913723; Tue, 26
 Apr 2022 14:18:33 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 Apr 2022 14:18:33 -0700
MIME-Version: 1.0
In-Reply-To: <1651007534-31842-1-git-send-email-quic_khsieh@quicinc.com>
References: <1651007534-31842-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 26 Apr 2022 14:18:33 -0700
Message-ID: <CAE-0n50Hpt92HAZH2JF88LfXzGEJ8sa4cy5RsnKpFmZ5fWSzAg@mail.gmail.com>
Subject: Re: [PATCH v6] drm/msm/dp: remove fail safe mode related code
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-04-26 14:12:14)
> Current DP driver implementation has adding safe mode done at
> dp_hpd_plug_handle() which is expected to be executed under event
> thread context.
>
[...]
>
> Changes in v6:
> --  fix Fixes commit ID
>
> Fixes: 8b2c181e3dcf ("drm/msm/dp: add fail safe mode outside of event_mutex context")
> Reported-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
