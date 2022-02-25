Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7314C5165
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 23:17:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1037510EB20;
	Fri, 25 Feb 2022 22:17:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 211A810EB21
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 22:17:42 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id j2so8678969oie.7
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 14:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=dXvo0FUwxGOK+PzYKSVnOxYz4S+No09K3o4P0/XBEQY=;
 b=Zka9dxzwevyuRP7bh7bB+2VLzJcEohGN+IkaQhrqR9tqMLIIhFDAdgjwyUobMemgHG
 HxbUt/MRrIU5ANvMryCf/IOd5w5VhcWy+QIBZrpdrCO4tJhHOIU/JKKO4sbYy5isTFRF
 SvjEbvOQ88lMyrUNYjFcACdeObaqTYceEfTfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=dXvo0FUwxGOK+PzYKSVnOxYz4S+No09K3o4P0/XBEQY=;
 b=5NpVotr4eiIyWcErpKs4ZVtfiQ/6wCFTuddrlpduiHO/tG/UdTb3rUxRWFfuI96g2x
 s2LvLWjP86dOkSuvPEosWB/2sTgSOZFAVksNuc5wl0nS5KULKAVt4wHN1kbFp9HY+V3u
 gdDGJPWSf7AuQT5cOowssm4BkNpGSigvez/VhOYET6WVkpHwJsYdIQKZHCoEHnaTOoOO
 jwSmXSxJ3VM15+CxsPGz8qfa2SOpSUpFljE5u8N36/mAuZExrtMAGHJVeHkzfb4pjUbz
 fi4rzAUWR4345KMmUkY+axO1l9LpTqCuCPKMATzkSzn7wSFv/8wOv7fiLFnEfwkXgd9P
 2how==
X-Gm-Message-State: AOAM532rttJaQbYwP2xac6IDX079ZcG7xwPbEynWdRq2l4V5yi+7CtSV
 EHP1O/mz48LrLQyv5MvB+xfKajl4MrR1HEV3GJlRQw==
X-Google-Smtp-Source: ABdhPJwZkpsXKtTOoOCmoxhBmLUBoDoC7bnujscOdTuslS997FSPo3U4IMVbsNIzko5zK+fYiQ4P/xGtoL+aut7gVPs=
X-Received: by 2002:a05:6808:1a28:b0:2d7:3c61:e0d6 with SMTP id
 bk40-20020a0568081a2800b002d73c61e0d6mr3055013oib.32.1645827461436; Fri, 25
 Feb 2022 14:17:41 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Feb 2022 14:17:41 -0800
MIME-Version: 1.0
In-Reply-To: <1645824192-29670-5-git-send-email-quic_khsieh@quicinc.com>
References: <1645824192-29670-1-git-send-email-quic_khsieh@quicinc.com>
 <1645824192-29670-5-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 25 Feb 2022 14:17:40 -0800
Message-ID: <CAE-0n53s11KHrj-rzRkjV4q775XCoxzZCLK-HRCt=H1++DR-YQ@mail.gmail.com>
Subject: Re: [PATCH v12 4/4] drm/msm/dp: enable widebus feature for display
 port
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
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
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-02-25 13:23:12)
> Widebus feature will transmit two pixel data per pixel clock to interface.
> This feature now is required to be enabled to easy migrant to higher
> resolution applications in future. However since some legacy chipsets
> does not support this feature, this feature is enabled by setting
> wide_bus_en flag to true within msm_dp_desc struct.
>
> changes in v2:
> -- remove compression related code from timing
> -- remove op_info from  struct msm_drm_private
> -- remove unnecessary wide_bus_en variables
> -- pass wide_bus_en into timing configuration by struct msm_dp
>
> Changes in v3:
> -- split patch into 3 patches
> -- enable widebus feature base on chip hardware revision
>
> Changes in v5:
> -- DP_INTF_CONFIG_DATABUS_WIDEN
>
> Changes in v6:
> -- static inline bool msm_dp_wide_bus_enable() in msm_drv.h
>
> Changes in v7:
> -- add Tested-by
>
> Changes in v9:
> -- add wide_bus_en to msm_dp_desc
>
> Changes in v10:
> -- add wide_bus_en boolean to dp_catalog struc to avoid passing it as parameter
>
> Changes in v11:
> -- add const to dp_catalog_hw_revision()
> -- add const to msm_dp_wide_bus_available()
>
> Changes in v12:
> -- dp_catalog_hw_revision(const struct dp_catalog *dp_catalog)
> -- msm_dp_wide_bus_available(const struct msm_dp *dp_display)
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
