Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCC86A50A3
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 02:25:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBAF310E4E5;
	Tue, 28 Feb 2023 01:25:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AFE310E4A1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 01:25:05 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id bi9so11143985lfb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 17:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ghYbiuae4Giu+YY0fM4G+aB2s++oD+nzVOPNd25Xma4=;
 b=ZsNE9/X4m10iwSCMrF45bZNPFSRZQ4XC2BhOn+5am/qoDxM1N+MUMpIqxtyahf+Zdf
 Z2QTGpvwr3BkO5dpBpjzXq/jFtiS+bfmDcmyKBdMH9MaleR2/R4QuTKvscdD93fjYVZ2
 XFRIy4bU/FvS39m2fbfxas4tjymDj0EmH+qhvghhmhcuquWYcYZhfLgyHVEaFpIcAatG
 r4iI/3de3AjNEWUXONWJLYbya0WWdON5VXajSU9XNpVv3vi44+ya3zEp9pSuah1Os713
 Qaw6IfL32ckKBryHSL1ZM3+/RFT9zLRjNgbMzTb8WMu/tLiF/Vf1Hr9DYkmhHfO/Ytd+
 OlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ghYbiuae4Giu+YY0fM4G+aB2s++oD+nzVOPNd25Xma4=;
 b=3LoWwHnI9StyRJNeLysFET1VZARyyL/6UBSnTBLQQOER1/mQ5VRX2YEwtcy/ZMuoA4
 Zxy6Vzbsm5z2qCMffy+RDgcPzeGswB1OqWTRXvhT84AP8MyES7GVy2hp3yv4gmCmY/md
 5M9RX2TFLG22ufoD6tqET3iecYakt38IRK/5X1oIK5UhCZZ3/MNaXD5s42UzSUMQxlZS
 hWsSxHslaCjQuusmWZqONbCXqTiDoOuIkljk8U2Uwg9YV7zzH9Sc6d2gH8d7+4E72Lrx
 J2TsS/rKrpXHrc9y6GxPzX1X5DD+Y5YImygSI7ju/Pl02vrz5kzkuWn4smELXyDG25Af
 dkPw==
X-Gm-Message-State: AO0yUKUwiBTvdtyrGMgaJ+I+Mz0fpzQ0a7xOtCNTwNByFYLIsb+gm2RO
 Eg+OVQevROB0Nmfod3wZQhMRoA==
X-Google-Smtp-Source: AK7set9Roec5f/bQctSsNwIs9OaAY+Pi+BG6vxc3tJornTJbXlbPWDeaF84mA+daLoyX75ZJopcF6Q==
X-Received: by 2002:a19:f610:0:b0:4db:5122:2099 with SMTP id
 x16-20020a19f610000000b004db51222099mr128874lfe.32.1677547503901; 
 Mon, 27 Feb 2023 17:25:03 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a056512024a00b004db3890cb4bsm1114243lfo.94.2023.02.27.17.25.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 17:25:03 -0800 (PST)
Message-ID: <259334b9-b255-004a-9772-8b252579a37c@linaro.org>
Date: Tue, 28 Feb 2023 03:25:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [RFT PATCH v2 1/3] drm/bridge: tc358762: Set pre_enable_prev_first
Content-Language: en-GB
To: Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230131141756.RFT.v2.1.I723a3761d57ea60c5dd754c144aed6c3b2ea6f5a@changeid>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230131141756.RFT.v2.1.I723a3761d57ea60c5dd754c144aed6c3b2ea6f5a@changeid>
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
> Set the "pre_enable_prev_first" as provided by commit 4fb912e5e190
> ("drm/bridge: Introduce pre_enable_prev_first to alter bridge init
> order"). This should allow us to revert commit ec7981e6c614
> ("drm/msm/dsi: don't powerup at modeset time for parade-ps8640") and
> commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset
> time").
> 
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

