Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 900BE735F3E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 23:31:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E1D710E0BC;
	Mon, 19 Jun 2023 21:31:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 581A410E0BC
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 21:31:38 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4f76b6db73fso6032402e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 14:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687210296; x=1689802296;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f1ZeuxsB8oGr5ZysvA7I6ilQgKE4t1aMJoeGOZLlwFE=;
 b=nm4+MB9o3U/kIZoPOHMaKCJUFijhwqH5+cAlqo+NLW+ue79UNRMJonQdcJvAEm8D9r
 qkzFt+lkTHDPjC1GPOykj26t+g/EFMkchGwhKGmWhWxGz2j2fKqSII99fY0+m5pzsE+v
 Anulja34SFjCiY05Aj+VzGz3h1xr0hkA5mIBaIEwrwLU7WwYNiHbi0VnPAJf0LTUAr/a
 a8wPBeWbY7JQYmCFjeajj4JdbcIf+x5of4xGCfIE+pZ3a95hvucqd3RaD5lL7eNFn/SI
 D70nbX5m/ynTyjez02xGTy6Th8+at/WGOxRroeNBG3aJbvKs+pF/G2nC/1+aovkQ3BJ4
 NgbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687210296; x=1689802296;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f1ZeuxsB8oGr5ZysvA7I6ilQgKE4t1aMJoeGOZLlwFE=;
 b=Gdd1Ymd/3qgHxrlruWRimtmpH1S9MLx/ZoLaDelDlES5GiuvqM0G/kDP15cFYLS4ld
 uf3LlsOhUiLE8Zr56c2Oz5riugyrqsJaDQTWnKaqX+AQ+7GLua2DVWUwLCIhVbkjF/jR
 RxgoJOOhtnnI/P9lJH7a18KeqEH2NrkKGCqewJGffMCATO6zx9zCgMgziQLGAPyNuZXE
 iYagjyywM2tdUh1agi7EjRq6fEoelfkT4cGp5xrzVN51rO7XkxdzkdPFJCiZoO76y+7T
 k68cWdCBGmlpnA+YUhZPzaGmGn5Qu+uEYP0Zm0Jh10CI5oGb8dOcSl3YK8WrD1pbcdO7
 1lKw==
X-Gm-Message-State: AC+VfDzquujjb3X/KreADs1qT4/Jg5d30gwwqbS2Fxr+1Lc87LKO8I92
 cCtuwVECtTZnjl0mVmXFNJcO7Q==
X-Google-Smtp-Source: ACHHUZ5ypeU7kMXXHXw02oRqVFN67BNNlJ6Qns5dyNdSNA/BBiVnABX459A58aIpDcfOfmm4+Np1yQ==
X-Received: by 2002:a05:6512:286:b0:4f6:55:7d73 with SMTP id
 j6-20020a056512028600b004f600557d73mr4013419lfp.25.1687210296511; 
 Mon, 19 Jun 2023 14:31:36 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 w24-20020ac24438000000b004f27471e0aesm89199lfl.79.2023.06.19.14.31.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 14:31:36 -0700 (PDT)
Message-ID: <a7efb345-a72d-4707-a880-9e4b8b0eec91@linaro.org>
Date: Tue, 20 Jun 2023 00:31:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 2/2] drm/msm/dpu: remove struct drm_dsc_config from
 struct msm_display_info
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1686694742-20862-1-git-send-email-quic_khsieh@quicinc.com>
 <1686694742-20862-3-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1686694742-20862-3-git-send-email-quic_khsieh@quicinc.com>
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

On 14/06/2023 01:19, Kuogee Hsieh wrote:
> ince struct drm_dsc_config is stored at atomic_enable() instead
> of display setup time during boot up, saving struct drm_dsc_config
> at struct msm_display_info is not necessary. Lets drop the dsc member
> from struct msm_display_info.

With the 'S' in 'Since' brought back in place:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 2 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 2 --
>   3 files changed, 6 deletions(-)
> 
-- 
With best wishes
Dmitry

