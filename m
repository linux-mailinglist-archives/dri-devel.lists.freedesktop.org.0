Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 502CF76AE25
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 11:36:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1966310E378;
	Tue,  1 Aug 2023 09:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6359310E383
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 09:36:18 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-314417861b9so4585897f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 02:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690882577; x=1691487377;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=eLYn/Ai9z2gGLmMC7UrWB7JjED0LKn/q81pApdMJnLQ=;
 b=xluXVputPy65JGa4eRUh/XV1kov+R248VtbZVZ80/FbxIf0hltL9RjipTqHUaQcwc0
 ZYbxWD9pTFu/LS1oG6Ntikx3PQaBwE0JA6FkgZEI8EODtwxKIc9/anjXuRb9Bwc4vE0w
 5b24UAoCXcHk406vUgCDlBtlYBiyH1PAOqV7VGu5o1uGAZ0PfFL6bCyBmkiVQMsIRmCj
 wbwbS7B4Yr/ll8p7KUaTZWXmsnBp6R/h/EyJmoKIPJJgCtzMUvkuR7TAfc3qcpxRvMfJ
 +ZLgq1csC22oJJxQblQQz0pYzW8a4M+izQlRacsFciKG9uqJIQ8av4aLEFOYyrad4O/S
 +JWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690882577; x=1691487377;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eLYn/Ai9z2gGLmMC7UrWB7JjED0LKn/q81pApdMJnLQ=;
 b=aKatFD/1P7Pm4SfcgB+NsJMKz9x0YliAty6E2MZFI2f+9yOGD3lWIRQE0IU06tXvlN
 MuhpZqbTEt7fjzUmgfsdkea+Q0XiVdE39UYmDS6MjlVYwJ3xtyKlAKK8WgBfATlL5ei1
 7JoQjWjPA/RB0PXISTN9Zw3vQPHeKK9G87lqQnt8hOiWowqpLYrC086jUaaMoiKRTX82
 DNoILHxR8VRLSbRA56ge9HZb01VXmuWMvrp6uZu+fdO950WZIrxkn6ZP4w2FzI7Nqcf0
 dzE+bBL5yUaW2f2ZRJ+d5rsllKqGQEDj3+xoSq4yx3L4UeiEVTCpcLraLZJFGBGzo2qG
 AVYA==
X-Gm-Message-State: ABy/qLYPxcuhPBvjZPKuK8u+dzctkUCnBiDDF19QKb5BFG9KDI4lmkaK
 CJZiCXKN0PYof30gdTEK+JS7Tg==
X-Google-Smtp-Source: APBJJlGrDJFS+Gs3swcFRbJAzeissdjBe44/P1q0oQ7bJ4YiTCcIpsmnqABtt0cbcpi2VRwMnXE54Q==
X-Received: by 2002:a05:6000:11c5:b0:317:594a:dbde with SMTP id
 i5-20020a05600011c500b00317594adbdemr1778846wrx.20.1690882576749; 
 Tue, 01 Aug 2023 02:36:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b92a:81a9:df6e:1e3?
 ([2a01:e0a:982:cbb0:b92a:81a9:df6e:1e3])
 by smtp.gmail.com with ESMTPSA id
 x1-20020a5d60c1000000b00317afc7949csm1076202wrt.50.2023.08.01.02.36.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Aug 2023 02:36:16 -0700 (PDT)
Message-ID: <743b7abb-127d-49c1-f863-1a7d388b8166@linaro.org>
Date: Tue, 1 Aug 2023 11:36:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm: bridge: dw_hdmi: Fix ELD is not updated issue
Content-Language: en-US
To: Sandor Yu <Sandor.yu@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230726014833.1647244-1-Sandor.yu@nxp.com>
Organization: Linaro Developer Services
In-Reply-To: <20230726014833.1647244-1-Sandor.yu@nxp.com>
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

Hi,

On 26/07/2023 03:48, Sandor Yu wrote:
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
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 21 ++++-----------------
>   1 file changed, 4 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 9a3db5234a0e0..6fa4848591226 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -196,7 +196,6 @@ struct dw_hdmi {
>   
>   	hdmi_codec_plugged_cb plugged_cb;
>   	struct device *codec_dev;
> -	enum drm_connector_status last_connector_result;
>   };
>   
>   #define HDMI_IH_PHY_STAT0_RX_SENSE \
> @@ -235,7 +234,7 @@ int dw_hdmi_set_plugged_cb(struct dw_hdmi *hdmi, hdmi_codec_plugged_cb fn,
>   	mutex_lock(&hdmi->mutex);
>   	hdmi->plugged_cb = fn;
>   	hdmi->codec_dev = codec_dev;
> -	plugged = hdmi->last_connector_result == connector_status_connected;
> +	plugged = hdmi->connector.status == connector_status_connected;

Please use curr_conn instead, connector is not always valid.

>   	handle_plugged_change(hdmi, plugged);
>   	mutex_unlock(&hdmi->mutex);
>   
> @@ -2446,20 +2445,7 @@ static void dw_hdmi_update_phy_mask(struct dw_hdmi *hdmi)
>   
>   static enum drm_connector_status dw_hdmi_detect(struct dw_hdmi *hdmi)
>   {
> -	enum drm_connector_status result;
> -
> -	result = hdmi->phy.ops->read_hpd(hdmi, hdmi->phy.data);
> -
> -	mutex_lock(&hdmi->mutex);
> -	if (result != hdmi->last_connector_result) {
> -		dev_dbg(hdmi->dev, "read_hpd result: %d", result);
> -		handle_plugged_change(hdmi,
> -				      result == connector_status_connected);
> -		hdmi->last_connector_result = result;
> -	}
> -	mutex_unlock(&hdmi->mutex);
> -
> -	return result;
> +	return hdmi->phy.ops->read_hpd(hdmi, hdmi->phy.data);
>   }
>   
>   static struct edid *dw_hdmi_get_edid(struct dw_hdmi *hdmi,
> @@ -2958,6 +2944,7 @@ static void dw_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
>   	hdmi->curr_conn = NULL;
>   	dw_hdmi_update_power(hdmi);
>   	dw_hdmi_update_phy_mask(hdmi);
> +	handle_plugged_change(hdmi, false);
>   	mutex_unlock(&hdmi->mutex);
>   }
>   
> @@ -2976,6 +2963,7 @@ static void dw_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
>   	hdmi->curr_conn = connector;
>   	dw_hdmi_update_power(hdmi);
>   	dw_hdmi_update_phy_mask(hdmi);
> +	handle_plugged_change(hdmi, true);
>   	mutex_unlock(&hdmi->mutex);
>   }
>   
> @@ -3369,7 +3357,6 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
>   	hdmi->rxsense = true;
>   	hdmi->phy_mask = (u8)~(HDMI_PHY_HPD | HDMI_PHY_RX_SENSE);
>   	hdmi->mc_clkdis = 0x7f;
> -	hdmi->last_connector_result = connector_status_disconnected;
>   
>   	mutex_init(&hdmi->mutex);
>   	mutex_init(&hdmi->audio_mutex);

Thanks,
Neil

