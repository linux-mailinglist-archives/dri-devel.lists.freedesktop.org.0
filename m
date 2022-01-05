Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2901485C60
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 00:42:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C9510E491;
	Wed,  5 Jan 2022 23:42:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 820B710E491
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jan 2022 23:42:31 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id j185so1289073oif.8
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jan 2022 15:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=BlMu1CysniMOf49rg6aElEJvFhN3Nt4imzu3+q/s+vQ=;
 b=fo8LvVX9fWJ8F1/Q3dncllwCe9UqzI/MeZmQgRdDpS1WQj3biFYa+gTn17ecboXHtd
 cGgag0bpPheib6NMF3GR0WaOe9yY/NmsKfdG57SHyViPdmA8L9E3VxelNtHyacVARr5b
 wUsQyTwnUHfzdhq8K4QcWhqN9OVUe400Yj3hU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=BlMu1CysniMOf49rg6aElEJvFhN3Nt4imzu3+q/s+vQ=;
 b=d3/HBNFPnOSvntnp4rYwdV2RsH1HUTz3M5vEDSK5QE7fpwDc3Y4aJqXlNkL7Ftxj8B
 wiF/F+GYo8w8ZRiHQn4JmnnJ38frziZi1mrUcQhKSA0xK9L3dTHc0DIvxbpGXx6I0LhQ
 6HkS1f7fCfz4s7CreUxgQfwLmW3BTg/FOZSkS65OC01N5vjILG1dKNSzPbvrFYG9XyAa
 Je5AUokHLH02XPfeAPLJGsNLE140q96NZEDfjN6uiIT26dtcpReEHCjvOZYabaj1xJSJ
 ZWsc9oYJUhfb0hipMkDUZEOcS644gIXFYh4PgXhpya2obA5Ts0Eq9rFgVX9Th6B37ulU
 LIkw==
X-Gm-Message-State: AOAM530uZ7NrhWTmwjHGkZk7bHBxJUlCaEz0Tcz9isKdIK+yK3eHQpse
 78hHK+9qALtdXnUPga6UnMaxEyT2R5i8AYKD/n+llQ==
X-Google-Smtp-Source: ABdhPJwkqm4yFPgwfgyjBKBAe2ueIE2xGw328/xMD5T2gGFk60m1dpDSonU5lDiPkZj0Fh8YTBMlICE7176XrlHTnyY=
X-Received: by 2002:a54:4710:: with SMTP id k16mr4333140oik.32.1641426150855; 
 Wed, 05 Jan 2022 15:42:30 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Jan 2022 15:42:30 -0800
MIME-Version: 1.0
In-Reply-To: <20220105232700.444170-2-dmitry.baryshkov@linaro.org>
References: <20220105232700.444170-1-dmitry.baryshkov@linaro.org>
 <20220105232700.444170-2-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 5 Jan 2022 15:42:30 -0800
Message-ID: <CAE-0n51ibtmZWmxjfSVNprJQZjttFSqGJ7Wp8ifO_WnNiozn3w@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/msm: drop dbgname argument from msm_ioremap*()
To: Abhinav Kumar <abhinavk@quicinc.com>,
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

Quoting Dmitry Baryshkov (2022-01-05 15:26:59)
> msm_ioremap() functions take additional argument dbgname which is now
> unused.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
