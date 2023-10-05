Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A89B07BAEEC
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 00:42:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 956C610E4A5;
	Thu,  5 Oct 2023 22:42:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 763E910E4A5
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 22:42:46 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b9338e4695so18447281fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Oct 2023 15:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696545764; x=1697150564; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J55C2DECva8x20ZCPV5VaEapm9sYZn6cEu2d8qLrjfw=;
 b=Wb7E7geWyPj96DHf/5J8N2F/YQSi1EEQC4ehEfThU8gwjHxlSLGW4NZdrqEY1UYdBh
 MFbnhJ2a+q91M4+mlOZ6Ppw0UnaDE4xKIJqaILIRLqSOdpknOF1AQDe05qxXOQj3V8N8
 Uyw+mbhFtR1+n7T3dZZNh25m/Y2djImjVDpl/Rpm8yEt1pebGnnkQqdzAmkblZcjEK3l
 FpYBDx+BHUgpsAjxcnyleefBz26PlRizNTlp7wRqMcV4GDm4tX1cwgPFFX3ClLbDX6Ec
 IeQ5l1PqAN6DtpVo0bIY7ZBPCT0mc3U8uDghGUNXZCTXEXiA6FqnAY310b54jwLwGkWq
 oV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696545764; x=1697150564;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J55C2DECva8x20ZCPV5VaEapm9sYZn6cEu2d8qLrjfw=;
 b=ToYUd2/pCBwigAmfhVmuITRpRNyAHNgKgEYZWEGN1zmOZuwYdi0L7ahS6EQIcOEzWg
 WhD5OwaYTzudlh+0o/d7RTzd5dgeTm3daBsxKuCw2xLm7BM15MHUCndRvoH9Npm6hFWI
 ra6KRUaM1Iu1aQIuKo7S1SlW0YLXDmEMgStE04dKKmearS2/BYin5PW8d5mkTAckSToV
 RMojMuT0NCooCqsiB1u2JSCmhDwnY1de9BWPgyfrSDE/sHydv0GQ0CxbJwDcglSRvzmo
 RuhHOf4jsY5dbKaD7IZ7nhtQVoG/xd2uxo058yYW/6fWXW1oE+ZXdoc0/J7ShgYCD372
 if3A==
X-Gm-Message-State: AOJu0Yz09ALBPzQwVbpAa68RuXHCV8OcInWO36PIMC8nsYno31tQeyTT
 vQMFqAKveAUdNqn6XC56naTjiQ==
X-Google-Smtp-Source: AGHT+IGEkk1/dB0O8kz/B/IOyEVgYrzdTBNr3I5VSfV7uBhvhWf6AWTlOwegLw3Kr7Ps7P1/Hd7iEA==
X-Received: by 2002:a05:6512:2512:b0:4fb:740a:81ae with SMTP id
 be18-20020a056512251200b004fb740a81aemr6924452lfb.16.1696545764617; 
 Thu, 05 Oct 2023 15:42:44 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 d24-20020ac25458000000b005009b979e3dsm31121lfn.303.2023.10.05.15.42.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Oct 2023 15:42:44 -0700 (PDT)
Message-ID: <77b410f5-93a2-48be-a0d4-2053f280bc8b@linaro.org>
Date: Fri, 6 Oct 2023 01:42:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/msm/dp: Remove error message when downstream port
 not connected
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230906181226.2198441-1-swboyd@chromium.org>
 <20230906181226.2198441-3-swboyd@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230906181226.2198441-3-swboyd@chromium.org>
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
Cc: Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>,
 patches@lists.linux.dev, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/09/2023 21:12, Stephen Boyd wrote:
> Plugging in an Apple dongle without the HDMI cable attached prints out
> an error message in the kernel logs when nothing is actually wrong.
> 
>     no downstream ports connected
> 
> This is because the downstream port for the HDMI connector is not
> connected, so the Apple dongle reports that as a zero sink count device.
> 
> Cc: Vinod Polimera <quic_vpolimer@quicinc.com>
> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_panel.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 97ba41593820..ae778e1a6fd0 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -156,7 +156,6 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
>   	if (drm_dp_is_branch(dp_panel->dpcd)) {
>   		count = drm_dp_read_sink_count(panel->aux);
>   		if (!count) {
> -			DRM_ERROR("no downstream ports connected\n");

Maybe this can be converted to drm_dbg_dp?

>   			panel->link->sink_count = 0;
>   			return -ENOTCONN;
>   		}

-- 
With best wishes
Dmitry

