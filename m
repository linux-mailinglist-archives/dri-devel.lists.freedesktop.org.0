Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8E76A509F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 02:24:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D82410E496;
	Tue, 28 Feb 2023 01:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D1D010E496
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 01:24:40 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id n2so11062841lfb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 17:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PcrqrMKYHlTbwqvBZH5ZNssesiULNdaHzpxnh4fJ5Rc=;
 b=Z87/gWbPjVw05P38iuzO1z4TzK1DYOILnNc+4eFra/elbdJBtd2McBcw47eDPi7DQA
 YQEdCMZ1lCVkdo5agu+ThXn5jdRpGQjFj14OB3NVzcA8EU6QfId5I8lFG9l+PvwFQBwD
 UlDsIcBQhBqBx39604zw7E4H0MWLT4m/xnU2ytitWiJlG43gU38vvrdQiw70MGxVqgB6
 mebFWxHGppFxQqdhxGFt29e9Hs5fLK641gGhjpMFOtx95I5tXGi62xO3R4uGXo4KBNVO
 jMeKLLU9GNxglCSfUmg7bUv74e63Kk9HX7TQxlZLfYJDHO038KuPcqHfBK7dcquiCFG8
 HmGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PcrqrMKYHlTbwqvBZH5ZNssesiULNdaHzpxnh4fJ5Rc=;
 b=m7wi4aph8c2jeFRXrZ95TjrZCL3dduCrUXGTP8xM1P1IF6jBZqtQcWAta3EGrOmVS/
 gDv298wlGZ+2Ccjw5Vbke1ZWUSa9LF4huRrIcS4+HK34aUUDns11dTX3mPUCipGhXJIa
 Jq0lotq/nrIIPk4XZi6Kg4mw9crO1x6wnClRtdQLGopVMhpfMMhNHJOvh+HfwoRzojWG
 rRs6GlYzqEVY+NhW2rWtFBloWLe6ZEUII5D9t7LvvlbCou0LmYk9LiSLWdo8mI/Y2ZVk
 xxYj3uBt4TFjsbVr0cgd8KzO4LEx1fxSpVT6iYQU8cRGAVuaPB2+SvPtnM0I3ldgbEit
 GwtQ==
X-Gm-Message-State: AO0yUKUlBbwNZIYD6+0NIbeXUkg5psQEh7SnT/vN05w7cWHiIXf0K108
 JWbF1bYLL0B2beHdwpxe65lmgBniXZp3dO1S
X-Google-Smtp-Source: AK7set/Kx6HE5jmVscWS6bhEWHw+skaMn4w3s9H/dmiSzjuqCvY+voJX/YRNgLPCWJFWajytYp4weQ==
X-Received: by 2002:ac2:4437:0:b0:4dd:a66d:b6de with SMTP id
 w23-20020ac24437000000b004dda66db6demr198602lfl.65.1677547478645; 
 Mon, 27 Feb 2023 17:24:38 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 d8-20020ac24c88000000b004ceb053c3ebsm1113101lfl.179.2023.02.27.17.24.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 17:24:38 -0800 (PST)
Message-ID: <e077d60d-5881-1ccc-a17a-fbe64392e29d@linaro.org>
Date: Tue, 28 Feb 2023 03:24:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [RFT PATCH v2 1/3] drm/bridge: tc358762: Set pre_enable_prev_first
To: Doug Anderson <dianders@chromium.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20230131141756.RFT.v2.1.I723a3761d57ea60c5dd754c144aed6c3b2ea6f5a@changeid>
 <CAPY8ntAUhVB6UtQTeHAcxNW950Ou+NcEoGwk3JnVWLay89_0Nw@mail.gmail.com>
 <CAD=FV=UNx7ivymvpGKcuyvvepvo-T2B2aREJy2GyawTHCnazsw@mail.gmail.com>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAD=FV=UNx7ivymvpGKcuyvvepvo-T2B2aREJy2GyawTHCnazsw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Sean Paul <sean@poorly.run>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Vinod Koul <vkoul@kernel.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, freedreno@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/02/2023 02:26, Doug Anderson wrote:
> Hi,
> 
> On Wed, Feb 1, 2023 at 1:51 AM Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
>>
>> On Tue, 31 Jan 2023 at 22:22, Douglas Anderson <dianders@chromium.org> wrote:
>>>
>>> Set the "pre_enable_prev_first" as provided by commit 4fb912e5e190
>>> ("drm/bridge: Introduce pre_enable_prev_first to alter bridge init
>>> order"). This should allow us to revert commit ec7981e6c614
>>> ("drm/msm/dsi: don't powerup at modeset time for parade-ps8640") and
>>> commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset
>>> time").
>>
>> I see no reference in the TC358762 datasheet to requiring the DSI
>> interface to be in any particular state.
>> However, setting this flag does mean that the DSI host doesn't need to
>> power up and down for each host_transfer request from
>> tc358762_pre_enable/tc358762_init, so on that basis I'm good with it.
>>
>> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>>
>>> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
>>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>>> ---
>>>
>>> (no changes since v1)
>>>
>>>   drivers/gpu/drm/bridge/tc358762.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
>>> index 0b6a28436885..77f7f7f54757 100644
>>> --- a/drivers/gpu/drm/bridge/tc358762.c
>>> +++ b/drivers/gpu/drm/bridge/tc358762.c
>>> @@ -229,6 +229,7 @@ static int tc358762_probe(struct mipi_dsi_device *dsi)
>>>          ctx->bridge.funcs = &tc358762_bridge_funcs;
>>>          ctx->bridge.type = DRM_MODE_CONNECTOR_DPI;
>>>          ctx->bridge.of_node = dev->of_node;
>>> +       ctx->bridge.pre_enable_prev_first = true;
>>>
>>>          drm_bridge_add(&ctx->bridge);
> 
> Abhinav asked what the plan was for landing this [1]. Since this isn't
> urgent, I guess the plan is to land patch #1 in drm-misc-next. Then we
> sit and wait until it percolates into mainline and, once it does, then
> patch #2 and #3 can land.
> 
> Since I have Dave's review I can commit this to drm-misc-next myself.
> My plan will be to wait until Thursday or Friday of this week (to give
> people a bit of time to object) and then land patch #1. Then I'll
> snooze things for a while and poke Abhinav and Dmitry to land patch #2
> / #3 when I notice it in mainline. If, at any point, someone comes out
> of the woodwork and yells that this is breaking them then, worst case,
> we can revert.

This plan sounds good to me.

> 
> [1] https://lore.kernel.org/r/1f204585-88e2-abae-1216-92f739ac9e91@quicinc.com/

-- 
With best wishes
Dmitry

