Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B716A50A6
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 02:25:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2952510E47C;
	Tue, 28 Feb 2023 01:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F068E10E47C
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 01:25:27 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id z5so8520289ljc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 17:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KYhTvYPZzEGeLer7Re++n35w5MO/ZTMPUdgfAcWFn1w=;
 b=v42k3Bh9dpaRO9B1/X2b+EafrIJH25nyylYb9uEeTMHwUmeDxzFb2v1wOjsFhQZu2L
 +/lrdJ8bmA008gaVIAql6wsluwF4SQDvXmkILCEWCi4iyxCa5/NMzBJClkHhpAibUT/v
 c3ReZEazhCOQ+93Zy70u2uaWYIrmXbbF6M89ho0LVixs3Z7+moMkvSz3X1x/yuvTqPQa
 QVaJnLuOcvErKkgakWleHuoNCBE1HXjQOEv7JKQ23p8+QuVIaAdKqiwxF0RPO25i/fju
 /Ouvlha2GNxmRQDjrG2t7DI+PY/BqEy+3Q0h93dGKOM8Tz+dlmpsrsmpuo0pY/kEXpAU
 Cs1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KYhTvYPZzEGeLer7Re++n35w5MO/ZTMPUdgfAcWFn1w=;
 b=7caSsiG0blAo62bZPSDtMWtwr8tmn6kB8TdNEqSqVUd4Pmn/SOaYOdXsUQiYvER3q4
 aWoMdGlECDsC9pfPwH6YPgCVG0vCEJJgF09Jmrg1ikg/PTk9+Ni2X8McbLrqwJmjXYsK
 27yg+RXCGzOpWsIg3SF37w8h0LN4jIoStDXFZwAO7PaljAs1FRQuUxSTVQH1bj3An+rd
 fcedlvrnpneO7SH+OillABeDQMi5KSAQz2rhS7B46fuJQApwLR/5UydfAjIbctW6ScS8
 9GaKWPxc0q/sGkZwt3NXsjRmz00OnTw18oCE9NplkEuPovFG7Pjf0IJ0FmWkaRNkTEfn
 UWqQ==
X-Gm-Message-State: AO0yUKUPMqzi8rO4+sS2Gkk/ZrVC9ZVl6QYI/sfPBiiYzMgUt/iC80p0
 SHEguRMSLo684mWmiBlJDVBspg==
X-Google-Smtp-Source: AK7set8HWt0poqpEBnvKA789YwYaRsFJySTc6+Gq7FqVYPdnZoSOcIZFSf8cJ9a6tUbKysL80soD+w==
X-Received: by 2002:a2e:8687:0:b0:295:9f20:bcdf with SMTP id
 l7-20020a2e8687000000b002959f20bcdfmr317412lji.9.1677547526235; 
 Mon, 27 Feb 2023 17:25:26 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 3-20020a2e0503000000b002959aecb63bsm977824ljf.53.2023.02.27.17.25.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 17:25:25 -0800 (PST)
Message-ID: <6d2a2647-9df7-5f32-20be-d54450e058b3@linaro.org>
Date: Tue, 28 Feb 2023 03:25:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [RFT PATCH v2 2/3] drm/msm/dsi: Stop unconditionally powering up
 DSI hosts at modeset
Content-Language: en-GB
To: Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230131141756.RFT.v2.1.I723a3761d57ea60c5dd754c144aed6c3b2ea6f5a@changeid>
 <20230131141756.RFT.v2.2.I4cfeab9d0e07e98ead23dd0736ab4461e6c69002@changeid>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230131141756.RFT.v2.2.I4cfeab9d0e07e98ead23dd0736ab4461e6c69002@changeid>
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
Cc: freedreno@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Vinod Koul <vkoul@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/02/2023 00:18, Douglas Anderson wrote:
> In commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset
> time"), we moved powering up DSI hosts to modeset time. This wasn't
> because it was an elegant design, but there were no better options.
> 
> That commit actually ended up breaking ps8640, and thus was born
> commit ec7981e6c614 ("drm/msm/dsi: don't powerup at modeset time for
> parade-ps8640") as a temporary hack to un-break ps8640 by moving it to
> the old way of doing things. It turns out that ps8640 _really_ doesn't
> like its pre_enable() function to be called after
> dsi_mgr_bridge_power_on(). Specifically (from experimentation, not
> because I have any inside knowledge), it looks like the assertion of
> "RST#" in the ps8640 runtime resume handler seems like it's not
> allowed to happen after dsi_mgr_bridge_power_on()
> 
> Recently, Dave Stevenson's series landed allowing bridges some control
> over pre_enable ordering. The meaty commit for our purposes is commit
> 4fb912e5e190 ("drm/bridge: Introduce pre_enable_prev_first to alter
> bridge init order"). As documented by that series, if a bridge doesn't
> set "pre_enable_prev_first" then we should use the old ordering.
> 
> Now that we have the commit ("drm/bridge: tc358762: Set
> pre_enable_prev_first") we can go back to the old ordering, which also
> allows us to remove the ps8640 special case.
> 
> One last note is that even without reverting commit 7d8e9a90509f
> ("drm/msm/dsi: move DSI host powerup to modeset time"), if you _just_
> revert the ps8640 special case and try it out then it doesn't seem to
> fail anymore. I spent time bisecting / debugging this and it turns out
> to be mostly luck, so we still want this patch to make sure it's
> solid. Specifically the reason it sorta works these days is because
> we implemented wait_hpd_asserted() in ps8640 now, plus the magic of
> "pm_runtime" autosuspend. The fact that we have wait_hpd_asserted()
> implemented means that we actually power the bridge chip up just a wee
> bit earlier and then the bridge happens to stay on because of
> autosuspend and thus ends up powered before dsi_mgr_bridge_power_on().
> 
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

