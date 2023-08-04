Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7201A76FBDA
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 10:23:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07BB710E013;
	Fri,  4 Aug 2023 08:23:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3FAE10E013
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 08:22:58 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3fbea14706eso17665535e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 01:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691137377; x=1691742177;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=gqxlgcpfhwpFaXOSuUXztrVkPV/filJ7HPI5vUJFn3E=;
 b=la56hkmB5KE/vOZuUxcRaQmvZ9MPF1D/ZT7jq21xwwgHzFLMD4dPW5/wJdduQftQwQ
 NMa883gmLxCK3Lya0Fb1kEgjoxoAb5MehiBui6PLmTFKp4gD8hhFUIWi2K1HcGEea1Cr
 vXkv6la4FfyMKuPogb6rVlOJqZdHZaIFRxqVMHDWs/tdOgVsLZe0ZmXERhgVDQreNyhp
 8R5xi2VL809H4dHkjecL0tCJCTtYKs7af13o8yoncFirEPjET66BiNeALHjgit16amwL
 e9B4WL7jZSs/paDR8b1lIAvUMgvgfABlMUFoYYwji/kzjOQ87Y52KPQGv/XLli4dPEz6
 qZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691137377; x=1691742177;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gqxlgcpfhwpFaXOSuUXztrVkPV/filJ7HPI5vUJFn3E=;
 b=T8gUMDKrsiVgWc7R7H3ojKtWFqpHVMdLRXdV2DvYJZBKghq+kuPjXgC0tmKu0bwWu3
 YyeJE0m0/Iq+kSBTvGqA9T1ZK2dBiSxS421+pXGZFLbxRxa5FV1O4CmdIesfMXPHJfiB
 Yo7R1kN77EXemT5W/PAtflGFG2y34KT8MV1vJkL7IHeZCllTXh2lAiAM+71K3AseJ1is
 Rnm7RCn1Ep9CZK4lEFNTj+yrDCBpzE41N3HmktohOuzuM9lk2Qcgacz3POeA5K4Mlemj
 1/IcS7MlfLOcyrD60SB/IK7XVFM5yJg6qXqZBRBU3w8wq9F/T3q9yhxu9Q2wQs7qe37X
 icLw==
X-Gm-Message-State: AOJu0YxP9CfzMuIewZnlQ2M52gVAQb/TO0hzQAwReoz6yUYJMiq7S4hO
 eomCTZM31DcECC0FYXxJUKg9WQ==
X-Google-Smtp-Source: AGHT+IG2FD99zjQl1RKbp122WjUmU7duUYTnuzjwbWYiAUstk12U3P1aLTLGGMkCF2ZwFb7pd/4o2A==
X-Received: by 2002:a7b:c7cc:0:b0:3fb:ffa8:6d78 with SMTP id
 z12-20020a7bc7cc000000b003fbffa86d78mr945295wmk.36.1691137377113; 
 Fri, 04 Aug 2023 01:22:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b526:9083:f5a6:4af1?
 ([2a01:e0a:982:cbb0:b526:9083:f5a6:4af1])
 by smtp.gmail.com with ESMTPSA id
 h6-20020a5d6e06000000b0031435731dfasm1884500wrz.35.2023.08.04.01.22.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Aug 2023 01:22:56 -0700 (PDT)
Message-ID: <4912be5e-99c8-588c-9fb4-0d8a404c4b62@linaro.org>
Date: Fri, 4 Aug 2023 10:22:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2] drm: bridge: dw_hdmi: Fix ELD is not updated issue
Content-Language: en-US
To: Sandor Yu <Sandor.yu@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230804061145.2824843-1-Sandor.yu@nxp.com>
Organization: Linaro Developer Services
In-Reply-To: <20230804061145.2824843-1-Sandor.yu@nxp.com>
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
Reply-To: neil.armstrong@linaro.org
Cc: the.cheaterman@gmail.com, rfoss@kernel.org, jonas@kwiboo.se,
 cychiang@chromium.org, shengjiu.wang@nxp.com, adrian.larumbe@collabora.com,
 jernej.skrabec@gmail.com, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, treding@nvidia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/08/2023 08:11, Sandor Yu wrote:
> The ELD (EDID-Like Data) is not updated when the HDMI cable
> is plugged into different HDMI monitors.
> This is because the EDID is not updated in the HDMI HPD function.
> As a result, the ELD data remains unchanged and may not reflect
> the capabilities of the newly connected HDMI sink device.
> 
> To address this issue, the handle_plugged_change function should move to
> the bridge_atomic_enable and bridge_atomic_disable functions.
> Make sure the EDID is properly updated before updating ELD.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> 
> ---
> v2:
>    - Add the variable of last_connector_result back to driver.
>      It will only be used to initialize audio codec jack status when audio codec driver probe.
> 
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 12 +++---------
>   1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index aa51c61a78c7..963050de42c3 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2463,15 +2463,7 @@ static enum drm_connector_status dw_hdmi_detect(struct dw_hdmi *hdmi)
>   	enum drm_connector_status result;
>   
>   	result = hdmi->phy.ops->read_hpd(hdmi, hdmi->phy.data);
> -
> -	mutex_lock(&hdmi->mutex);
> -	if (result != hdmi->last_connector_result) {
> -		dev_dbg(hdmi->dev, "read_hpd result: %d", result);
> -		handle_plugged_change(hdmi,
> -				      result == connector_status_connected);
> -		hdmi->last_connector_result = result;
> -	}
> -	mutex_unlock(&hdmi->mutex);
> +	hdmi->last_connector_result = result;
>   
>   	return result;
>   }
> @@ -2971,6 +2963,7 @@ static void dw_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
>   	hdmi->curr_conn = NULL;
>   	dw_hdmi_update_power(hdmi);
>   	dw_hdmi_update_phy_mask(hdmi);
> +	handle_plugged_change(hdmi, false);
>   	mutex_unlock(&hdmi->mutex);
>   }
>   
> @@ -2989,6 +2982,7 @@ static void dw_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
>   	hdmi->curr_conn = connector;
>   	dw_hdmi_update_power(hdmi);
>   	dw_hdmi_update_phy_mask(hdmi);
> +	handle_plugged_change(hdmi, true);
>   	mutex_unlock(&hdmi->mutex);
>   }
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
