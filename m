Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 219225B612F
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 20:40:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD6C10E158;
	Mon, 12 Sep 2022 18:40:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2320810E181
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 18:39:55 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id q21so16398149lfo.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 11:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=rBnJnt9s2rBQ5GOGLgcOmWi4AblijZUFNNPxpAcR8p4=;
 b=J9+bQLzRFi1I3i88LXpTbLRCgdIQBftNKkAd1h6SwYtLkKr2xyJy8y9zZ+N5jtJcT3
 kWWLrDtZQ8Hre+9JIpCbWoV256aSDJFajhYwBlvv9U4SK2tsPwUTckEidDelcn06Tg0R
 Ev6kh9Yc3xYhLAFKWPyAImkb8MCJbZOgPLNQpxRu4T5oYw2IN5Sq8xgjeaojnh7uT6Z6
 TCWxL0ah2r1gIvmh7sIJ9lZw5Gdq/nce1nXDE8kWKBQBGbwsWF09qoKCZy1X99mdkzyo
 GmUC1uaNXGpYV3IMCCOdgUnoVsPJwI84BCYhGGJnMWpI2fuZsEKgC2JRo4jSGpTWJXe6
 6ocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=rBnJnt9s2rBQ5GOGLgcOmWi4AblijZUFNNPxpAcR8p4=;
 b=Vgypr8Fq9XR7+hktu4p90ILgs0pytoHp6tGC1mIwzeomNlFfHGnM8/Pe5+uBwpkHAO
 okH3B0OqtZievS0NcUjLrsWiAAa/T+RD9IZJv8eUh3VL+306iKY08AUh1N54wXm7+Qg4
 KHZ+aBjNJF5KtUHfxJhhEA0sQbd9zsl0iQUdJs1xmmOdeB5PxRFvt9wSQpf8ie9pxVIq
 KnqbjAuBF2pP41OHTqlFkZUxDM/vdABP+mFCmgLCKZi2ljpWsf8W19YwHj5qBcYKq5xk
 Bqm4nbxG+e2094G98LsD6a+NQXyQUDIs2kwSc0sHTD0rzJitkC+6r8afvAdr6vuep5gP
 MEiQ==
X-Gm-Message-State: ACgBeo2ZUdhNrtT1Ob17w9/ACKinBxRDVaNVxpielKdKK8DY9HM/biR/
 wq6uSLN8q+UxY1n5PzOevCdspg==
X-Google-Smtp-Source: AA6agR4LiOmbWOuOJGJC8fm/foifEisyJZxwjrlZUaQk4zMBMjnfO6L3aFriO6IIG/ht918aPzdqtg==
X-Received: by 2002:a05:6512:ac3:b0:498:f076:6281 with SMTP id
 n3-20020a0565120ac300b00498f0766281mr6829018lfu.68.1663007993481; 
 Mon, 12 Sep 2022 11:39:53 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 d4-20020ac25444000000b00494a2a0f6cfsm1205964lfn.183.2022.09.12.11.39.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 11:39:53 -0700 (PDT)
Message-ID: <0f381285-860f-aaa2-2ae7-834608d0b4e8@linaro.org>
Date: Mon, 12 Sep 2022 21:39:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v5 1/3] drm/msm/dp: cleared DP_DOWNSPREAD_CTRL register
 before start link training
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
 agross@kernel.org, bjorn.andersson@linaro.org
References: <1662999830-13916-1-git-send-email-quic_khsieh@quicinc.com>
 <1662999830-13916-2-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1662999830-13916-2-git-send-email-quic_khsieh@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/09/2022 19:23, Kuogee Hsieh wrote:
> DOWNSPREAD_CTRL (0x107) shall be cleared to 0 upon power-on reset or an
> upstream device disconnect. This patch will enforce this rule by always
> cleared DOWNSPREAD_CTRL register to 0 before start link training. At rare
> case that DP MSA timing parameters may be mis-interpreted by the sink
> which causes audio sampling rate be calculated wrongly and cause audio
> did not work at sink if DOWNSPREAD_CTRL register is not cleared to 0.
> 
> Changes in v2:
> 1) fix spelling at commit text
> 2) merge ssc variable into encoding[0]
> 
> Changes in v3:
> -- correct spelling of DOWNSPREAD_CTRL
> -- replace err with len of ssize_t
> 
> Changes in v4:
> -- split into 2 patches
> 
> Fixes: 154b5a7da0fd ("drm/msm/dp: add displayPort driver support")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_ctrl.c | 13 +++++--------
>   1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index ab6aa13..2c74c59 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1245,8 +1245,7 @@ static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
>   {
>   	int ret = 0;
>   	const u8 *dpcd = ctrl->panel->dpcd;
> -	u8 encoding = DP_SET_ANSI_8B10B;
> -	u8 ssc;
> +	u8 encoding[] = { 0, DP_SET_ANSI_8B10B };
>   	u8 assr;
>   	struct dp_link_info link_info = {0};
>   
> @@ -1258,13 +1257,11 @@ static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
>   
>   	dp_aux_link_configure(ctrl->aux, &link_info);
>   
> -	if (drm_dp_max_downspread(dpcd)) {
> -		ssc = DP_SPREAD_AMP_0_5;
> -		drm_dp_dpcd_write(ctrl->aux, DP_DOWNSPREAD_CTRL, &ssc, 1);
> -	}
> +	if (drm_dp_max_downspread(dpcd))
> +		encoding[0] |= DP_SPREAD_AMP_0_5;

It would be simpler to call drm_dp_dpcd_write(ssc, DP_DOWNSPREAD_CTRL, 
1) unconditionally here. You won't have to change the 
encoding/DP_MAIN_LINK_CHANNEL_CODING_SET/etc.

>   
> -	drm_dp_dpcd_write(ctrl->aux, DP_MAIN_LINK_CHANNEL_CODING_SET,
> -				&encoding, 1);
> +	/* config DOWNSPREAD_CTRL and MAIN_LINK_CHANNEL_CODING_SET */
> +	drm_dp_dpcd_write(ctrl->aux, DP_DOWNSPREAD_CTRL, encoding, 2);
>   
>   	if (drm_dp_alternate_scrambler_reset_cap(dpcd)) {
>   		assr = DP_ALTERNATE_SCRAMBLER_RESET_ENABLE;

-- 
With best wishes
Dmitry

