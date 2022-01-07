Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5051B486E82
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 01:16:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63FDC10E6BC;
	Fri,  7 Jan 2022 00:16:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 177E210E683
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 00:16:09 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id x188so22862oix.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jan 2022 16:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=mE1P4O+5lb7Aj+m/u0inLsIsF4f3Obpma9YFsBVI+mk=;
 b=R+c4v+KB6lM8fqhf7qCx4POmsHZ85uFetKficsf+q36Un+SUnj9mAYdkTsUDRSUEum
 3ileYQjfrtriixrocxGrjGqEiu4uGATHnNupNBiTJoL0O/xhscZlTHbAyUz5ryn23sC8
 TDxs9J8GCQtY1X4V4fVgCPSWDG3oMtNcHwmRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=mE1P4O+5lb7Aj+m/u0inLsIsF4f3Obpma9YFsBVI+mk=;
 b=zO6bj4yuS35oL4Il85o/SVjxtWJ/nFN4FLDCG0wuPVxPNtCOjurKmSsKXus3+cqsLh
 7AyLhL3PbIOanXe/uJkdu7On4lpttUJWnRkIfXDpyPl0m+7vEqsW9Er7AZG4omkl7vXl
 +tMEqIa3Nu6m8phdsGVVMOLzPA0T3eFr5+nDdrUsgcUFuiZ2WCyytoziGuWMJuX9/el0
 cS9sr6tieaw8SvmdAcxrC9OMu64/d5TR9H6ozwrQvpmMQJy08R5CZW6pYtdGd3IiwdTv
 r09TdKPGdywfRi7s2JnP+P2tlJvmDFdsNWBg6q7OYT/BpQ65+l4JbTGaL3JLe0rKDi2R
 BbfQ==
X-Gm-Message-State: AOAM531TA/rsKk9izhsetWKU4TTC+/5vYPjihA1hRBKm0StAYwYL3LBG
 mr3b6Eii6hDxhWtVWgm8YEKZ0MlROqsEKanFEWuAyg==
X-Google-Smtp-Source: ABdhPJxYOfr7WP2LZzJN/EUDtSmVISjJlgmRyG+L1riCyACt9jPXB4g4etKquIwp2+r5rnPWy0RDAAxc2R9ayyc2n28=
X-Received: by 2002:aca:4382:: with SMTP id q124mr8016650oia.64.1641514568306; 
 Thu, 06 Jan 2022 16:16:08 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Jan 2022 16:16:07 -0800
MIME-Version: 1.0
In-Reply-To: <1641489296-16215-1-git-send-email-quic_khsieh@quicinc.com>
References: <1641489296-16215-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 6 Jan 2022 16:16:07 -0800
Message-ID: <CAE-0n52-SL6jPVtn_wEPtY1FQ4EUZ2PhiQ=agXcnA0AHPV9TQQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm/dp: add support of tps4 (training pattern 4)
 for HBR3
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
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
 linux-kernel@vger.kernel.org, Kuogee Hsieh <khsieh@codeaurora.org>,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-01-06 09:14:56)
> @@ -1189,12 +1190,20 @@ static int dp_ctrl_link_train_2(struct dp_ctrl_private *ctrl,
>
>         *training_step = DP_TRAINING_2;
>
> -       if (drm_dp_tps3_supported(ctrl->panel->dpcd))
> +       if (drm_dp_tps4_supported(ctrl->panel->dpcd)) {
> +               pattern = DP_TRAINING_PATTERN_4;
> +               state_ctrl_bit = 4;
> +       }
> +       else if (drm_dp_tps3_supported(ctrl->panel->dpcd)) {

also

	} else if (...) {
