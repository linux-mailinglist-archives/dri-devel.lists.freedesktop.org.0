Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3071B5A9245
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 10:42:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44C8410E5B4;
	Thu,  1 Sep 2022 08:42:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F0210E653
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Sep 2022 08:42:26 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id w8so14321332lft.12
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Sep 2022 01:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=RvfIkWc0bW8B7wnGaAcM/Ac2S5bgNnC3+MvXeeZ8fuk=;
 b=eRLDtnk9qCQJEwuChBabwNsXau6eGMaipUQ3wrr1P5QJyAo8ubW3G8T/7Eg1I7JCKg
 6BB9O/e6efJTNIr3w4O4xEcNnSTIQChDAXVannRrAX6lhl6/Pti++etEz5rDUMR9GkxQ
 2ATUNY4AmrdsgN8abNyz4E0ecc+koIWTb1top4tFJPoc9BiOOwhKDpdNvwHe84vTdoV7
 Oofn8CwOKXVEfP45iB7dZ0hkyzodUaOnwGpt5Y0ms6BXqj+WsHQWunY7sb8Kg+yro58t
 acqvNAoM1/QfXNaNrmniEjQkPj+N2KmqH8/A7OBN8WlvH9i9IC1N8FYr/f/YZuYaCuhY
 WCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=RvfIkWc0bW8B7wnGaAcM/Ac2S5bgNnC3+MvXeeZ8fuk=;
 b=FrRFfpmp7HlAwDQQSxoZAzCXZPK++fxNrqJhRwyn6mNkaX5ZZM3AiuiFTmUlR0vHFY
 9JSgnWU+6HFUAd1T422Z2H/R8ikJf0nxElq5ygIWq/W8iaacVC+6Rrhdxg4Xkwn0NP+H
 8CSHVzdHxsSEX9f4AJF/yZgs/nV3QyQxRueJG2mE+f0f6Ihb3Jo2WvuPX5D/vwflkv+Z
 KbKm2nuY1yjRIK8HgshQMTf81/BcPpV1jsah6P4PGtll57joVlaMOPMtJqrPQsLMnptf
 7Q/cP6QI01wBSk6Sc9dNPDy5T/EsX1ASiX2FXuYpXZLP/vwazLHipyt6PwG9G+xiv9K7
 Rt3w==
X-Gm-Message-State: ACgBeo2CHGd1QUZLfkkHg653dCIyhBKG7wCt9aa4g2mgd6HN2Y1Mhemw
 bKd3IsngiPLsDca6z3eWG2XELA==
X-Google-Smtp-Source: AA6agR7hAot1/XTvtAntt8TEbAoNfzNE+fTLSxY8/82G5LZY2RV30hpblCF1wuPvOUz0eoWcoxq2Ng==
X-Received: by 2002:a05:6512:12c5:b0:48c:df54:a41a with SMTP id
 p5-20020a05651212c500b0048cdf54a41amr9799353lfg.464.1662021744393; 
 Thu, 01 Sep 2022 01:42:24 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 i3-20020a2ea223000000b00262fa7bae79sm1992830ljm.81.2022.09.01.01.42.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Sep 2022 01:42:22 -0700 (PDT)
Message-ID: <23615048-dae5-d972-9b10-ff1356c0a02f@linaro.org>
Date: Thu, 1 Sep 2022 11:42:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] drm/msm/dsi: Set panel orientation when directly connected
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20220706191442.1150634-1-swboyd@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220706191442.1150634-1-swboyd@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Douglas Anderson <dianders@chromium.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev, Hsin-Yi Wang <hsinyi@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/07/2022 22:14, Stephen Boyd wrote:
> Set the panel orientation in drm when the panel is directly connected,
> i.e. we're not using an external bridge. The external bridge case is
> already handled by the panel bridge code, so we only update the path we
> take when the panel is directly connected/internal. This silences a
> warning splat coming from __drm_mode_object_add() on Wormdingler boards.
> 
> Cc: Hsin-Yi Wang <hsinyi@chromium.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
> 
> This relies on commit 5e41b01a7808 ("drm/panel: Add an API to allow drm
> to set orientation from panel") which is in drm-misc

With the msm/dsi being switched to DRM_PANEL_BRIDGE this is no longer 
relevant. Dropping this from the queue.

-- 
With best wishes
Dmitry

