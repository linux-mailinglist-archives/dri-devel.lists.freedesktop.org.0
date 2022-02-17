Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A414F4BA9E9
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 20:36:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F1B10E733;
	Thu, 17 Feb 2022 19:36:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2905C10E206
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 19:36:37 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 a7-20020a9d5c87000000b005ad1467cb59so464313oti.5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 11:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=H+l6hsd+n/fdXKs16VSP4q/PbtQuMzGtJT4cgvfkyLM=;
 b=TFS6wlpWxxfiSvxGIJT5wKWz8pYgNIlYtyrOibWyZ+S/iJaoGCQre53jIw5wLhCoob
 DMY/KuX/4BN7wh9Zi9o7iO0x06vdpsMf7L29hiurIB4sWLyndkE68bUK7GewspaLaqDi
 0ZSe0caSnelzPSVH1HIECXuzTI4WwvijpBa00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=H+l6hsd+n/fdXKs16VSP4q/PbtQuMzGtJT4cgvfkyLM=;
 b=K2sZrzWPtJ+/4iCejzo4FDx0OkvFX6am7f/2OzUd9cc0WYecF62WSOVg4LhyEVAzPr
 tFVnLWYfT8b92UuXo99q99qjNTs5Vyqge2Ili8VRhp89fK+V6ImvdCUrY78mxojTyrfM
 aHhGNcPGo+Kw/hXxOWWOLTEFPA4B5agSYx7J+vFp0V74Z80hANFf9g9PwNP5rCqfXv3e
 qMNmcXVw6ru350DJmCXKxySTLWpozQ6ej4hidupp1T+YpaJkxumHmKaf5oZCGUzD4/dS
 0vo9NZLv9t1dX6Ps6OeJJLFGCcErkSMONryhywulNBSYcL5RambO1cg0A/5u1e+JKzwv
 tSkw==
X-Gm-Message-State: AOAM533cldhIAautZWeDOzxFMw2uPGM09rIsmp7jz2s4Q4wSsBDf6rma
 Uo8JnlWhGx52/fEX/mSxNVRXzK4ub7tW4hgEJOD9cg==
X-Google-Smtp-Source: ABdhPJzCvdEu8Ryr/y4DCzdw3lIqkwqkZu7z2hNcjMQo26YSTG5Hasgkw13cOP+fiQjDeEpiazhD4HoKhTitptumMTA=
X-Received: by 2002:a9d:7687:0:b0:59e:da8c:5d32 with SMTP id
 j7-20020a9d7687000000b0059eda8c5d32mr1419683otl.77.1645126596435; Thu, 17 Feb
 2022 11:36:36 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Feb 2022 11:36:35 -0800
MIME-Version: 1.0
In-Reply-To: <1645122930-23863-4-git-send-email-quic_khsieh@quicinc.com>
References: <1645122930-23863-1-git-send-email-quic_khsieh@quicinc.com>
 <1645122930-23863-4-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 17 Feb 2022 11:36:35 -0800
Message-ID: <CAE-0n52cz6JibgsJ4MWsdGhAjxHa6en+JbyKjKHVwQDnM8-5Og@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] drm/msm/dp: replace DRM_DEBUG_DP marco with
 drm_dbg_dp
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

Quoting Kuogee Hsieh (2022-02-17 10:35:30)
> Since DRM_DEBUG_DP is deprecated in favor of drm_dbg_dp(NULL, ...),
> this patch replace all DRM_DEBUG_DP with drm_dbg_dp().
>
> Changes in v4:
> -- replace (strucr drm_dev *)NULL with drm_dev

Why can't the platform device be used?
