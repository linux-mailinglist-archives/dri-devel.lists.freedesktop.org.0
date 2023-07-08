Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 442CA74BA6C
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 02:07:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F5310E62E;
	Sat,  8 Jul 2023 00:07:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F7310E62E
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jul 2023 00:07:24 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f4b2bc1565so4008181e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 17:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688774843; x=1691366843;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CLt63cNfTOHwnk/8YjxdfGjECIo1obJeTRgBrDNQw4g=;
 b=TsMiWw57CK/WW1zqiQCs0o34jJvhwKzckDpp5bJRVvuXb8/gcLg2g2BuMsMiIS3u8H
 XtsNZvF2SiMjNifAvdpoZI1pAOleYRqddKVHMMzc6MPYaAzbRIsREnEt7ifoMeYld2hH
 nNt7pzmP1rd/P5ovrP7fiVZjBoRDBBgihyjvmCML0ajc+Ve4EgtnR1AEa1J6i0HBWewg
 UwdZF8QrJ8LxP7tXJLlA4mb5kVlx1/q8SIaoDkqJU4LBqqbZyvCWQtdHZw3zdfUtYDtm
 XiOe6xC3gdG1glErYbzWuL9yQ4yOl8kNj+cSR/mmZh0h1xKhzOY0g/Wm1HCCPQSkRPOG
 Q34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688774843; x=1691366843;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CLt63cNfTOHwnk/8YjxdfGjECIo1obJeTRgBrDNQw4g=;
 b=jB/LtQm480hHD0RL6+Tbrh1e4TzYI+VUaatqc7RU+SHCFCC1XA1FQ4zvklpVVGv7Bl
 A4d+Ktu7tpPtmr/iQ1sD5h59e/Hw8hi84puJ0CllqMghh1iST5RIBIK6/TG4pq/gfqPx
 N8T4s94vZrL/eSPu7X9h+PwXn3GDAL9Gs3lD20FpgyFFP+7ULJAEPvdD095eDo4WUg9s
 P3jsOwdO5hskCYenvQ6k6+H5YExlPaRLBOvC/S5ZC4cu1Jk21QHKg1PduK8/SEfwe5+q
 pB49PhehKsNmQIZQ595ONHiMM2VoPkN32O1JdWW8/a5LWN8kGGGM41Q8k0zWblqD0kah
 qFdg==
X-Gm-Message-State: ABy/qLZHmtjaYa4BxWJlo/pjoq5miGgE26nGG0ZLa6hMR43lcFO4LBhp
 wng/S43UO++l0ZP1TG1vX5ZpGfL90OOqiXlNBb8=
X-Google-Smtp-Source: APBJJlFiIH+YImiq0+UkzUR5N2zGiuktwPtPxkgVv/DDbfGw9WFNLBhG0plZ3szl2fD8O+goMG8VJQ==
X-Received: by 2002:a05:6512:1310:b0:4f1:3d7d:409e with SMTP id
 x16-20020a056512131000b004f13d7d409emr5608203lfu.0.1688774842857; 
 Fri, 07 Jul 2023 17:07:22 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 eo25-20020a056512481900b004fb85ffc82csm853085lfb.10.2023.07.07.17.07.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 17:07:22 -0700 (PDT)
Message-ID: <a9cb7147-613e-8b1a-14c5-bbac6bb24a1a@linaro.org>
Date: Sat, 8 Jul 2023 03:07:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 3/5] drm/msm/dp: delete EV_HPD_INIT_SETUP
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1688773943-3887-1-git-send-email-quic_khsieh@quicinc.com>
 <1688773943-3887-4-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1688773943-3887-4-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/07/2023 02:52, Kuogee Hsieh wrote:
> EV_HPD_INIT_SETUP flag is used to trigger the initialization of external
> DP host controller. Since external DP host controller initialization had
> been incorporated into pm_runtime_resume(), this flag become obsolete.
> Lets get rid of it.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 12 ------------
>   1 file changed, 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 2c5706a..44580c2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -55,7 +55,6 @@ enum {
>   enum {
>   	EV_NO_EVENT,
>   	/* hpd events */
> -	EV_HPD_INIT_SETUP,
>   	EV_HPD_PLUG_INT,
>   	EV_IRQ_HPD_INT,
>   	EV_HPD_UNPLUG_INT,
> @@ -1119,9 +1118,6 @@ static int hpd_event_thread(void *data)
>   		spin_unlock_irqrestore(&dp_priv->event_lock, flag);
>   
>   		switch (todo->event_id) {
> -		case EV_HPD_INIT_SETUP:
> -			dp_display_host_init(dp_priv);
> -			break;
>   		case EV_HPD_PLUG_INT:
>   			dp_hpd_plug_handle(dp_priv, todo->data);
>   			break;
> @@ -1483,15 +1479,7 @@ void __exit msm_dp_unregister(void)
>   
>   void msm_dp_irq_postinstall(struct msm_dp *dp_display)
>   {
> -	struct dp_display_private *dp;
> -
> -	if (!dp_display)
> -		return;
> -
> -	dp = container_of(dp_display, struct dp_display_private, dp_display);
>   
> -	if (!dp_display->is_edp)
> -		dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 0);
>   }

Why do you keep an empty function?

>   
>   bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)

-- 
With best wishes
Dmitry

