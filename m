Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DB2671654
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 09:31:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E97110E10D;
	Wed, 18 Jan 2023 08:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A50B110E6AF
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 08:31:42 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so905485wms.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 00:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=2FDgSbulMxqh8bJCVvaKW6jduWu4I6+VrLpKYgPu86A=;
 b=lldRZHujADSvC2AzvlNq0hQC5y9ycNBfDEJjxeEznE/3M2qN9Nej62QhA//wDdMT2O
 Q8ih3gKAHHMTa7iJ8CopXleFmX8NrkMNAJvnt37bGcp+siGLC9ZjAmhlrFONM/g9tojN
 pfyuWZ1+ul6XMqEpEMlzDFpvxgpjhEtbQ8AhQTe0/zwtHEA0i7cglGI9rHPR/2d2adVr
 lLW8PacGnIPVyDbXhwka4BjTqIo/3hTb4iXk15XNKtf2SHIEScDxb35zGgpv42mdat/j
 TppeWXtgEFpsZGFFWBeFRhCySyz7jQq5TBs8kPCGQdtsqrcnR28+hrDrYbQUcD1HnkA7
 S2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2FDgSbulMxqh8bJCVvaKW6jduWu4I6+VrLpKYgPu86A=;
 b=ge0QN1FLJbJIYSbIv8RLJgJ2su/V2Fonkgzk18Z1Mpf+ZJWtzriUmPzCNil1heLlkX
 t0z4Oq9y0igD5V2KV6S4h/NU+wBwFlNMCYbmBGufODNUrhcXatxE6Nmko3ed48HPirCG
 vU10Rv4UpQ4C+7i6AcvECd32qXX2PkrlzYY0oKf36hEnxYSfbeNuKyd/rWq6muqGg7+N
 tbaLRkkvZbstKbmZ92N5ompYhdbo+UXPyXmyCSQVvS/eBwOx57CxqJNgsZbjqoC2h0aO
 ekygPLTwQ8ZBrmJLqzkIo+84HqWV9r6zW81dF5e0vBJ384dip2Mq7UcZ3/y7eFU1zeeh
 juQg==
X-Gm-Message-State: AFqh2kqp5WkOfq1zatI9qKQ4AfDCn0x2DEy4pIWsxFh1iG4fijtkO+xz
 i2i71A8WxMj/vvNjveACf0TL5A==
X-Google-Smtp-Source: AMrXdXsYZXZXzEMu4ruHeIipH+Z/JwznqeLXjYAqXwewSWN7F0LEUaDnAz3t1/0DCzIKdpuRrHHxog==
X-Received: by 2002:a05:600c:d2:b0:3da:f475:6480 with SMTP id
 u18-20020a05600c00d200b003daf4756480mr5797426wmm.7.1674030701147; 
 Wed, 18 Jan 2023 00:31:41 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:37dc:5071:959c:93e4?
 ([2a01:e0a:982:cbb0:37dc:5071:959c:93e4])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a05600c491800b003d9e74dd9b2sm1253741wmp.9.2023.01.18.00.31.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 00:31:40 -0800 (PST)
Message-ID: <8058263f-28c1-d47d-9880-342e6f378980@linaro.org>
Date: Wed, 18 Jan 2023 09:31:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 12/13] drm/bridge: lt9611: stop filtering modes via the
 table
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20230118081658.2198520-1-dmitry.baryshkov@linaro.org>
 <20230118081658.2198520-13-dmitry.baryshkov@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230118081658.2198520-13-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/01/2023 09:16, Dmitry Baryshkov wrote:
> The lt9611 bridge can support different modes, it makes no sense to list
> them in the table. Drop the table and check the number of interfaces
> using the fixed value.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/bridge/lontium-lt9611.c | 49 ++++++-------------------
>   1 file changed, 12 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index 82af1f954cc6..c2cd36d926a0 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -84,24 +84,6 @@ static const struct regmap_config lt9611_regmap_config = {
>   	.num_ranges = ARRAY_SIZE(lt9611_ranges),
>   };
>   
> -struct lt9611_mode {
> -	u16 hdisplay;
> -	u16 vdisplay;
> -	u8 vrefresh;
> -	u8 lanes;
> -	u8 intfs;
> -};
> -
> -static struct lt9611_mode lt9611_modes[] = {
> -	{ 3840, 2160, 30, 4, 2 }, /* 3840x2160 24bit 30Hz 4Lane 2ports */
> -	{ 1920, 1080, 60, 4, 1 }, /* 1080P 24bit 60Hz 4lane 1port */
> -	{ 1920, 1080, 30, 3, 1 }, /* 1080P 24bit 30Hz 3lane 1port */
> -	{ 1920, 1080, 24, 3, 1 },
> -	{ 720, 480, 60, 4, 1 },
> -	{ 720, 576, 50, 2, 1 },
> -	{ 640, 480, 60, 2, 1 },
> -};
> -
>   static struct lt9611 *bridge_to_lt9611(struct drm_bridge *bridge)
>   {
>   	return container_of(bridge, struct lt9611, bridge);
> @@ -603,21 +585,6 @@ static int lt9611_regulator_enable(struct lt9611 *lt9611)
>   	return 0;
>   }
>   
> -static struct lt9611_mode *lt9611_find_mode(const struct drm_display_mode *mode)
> -{
> -	int i;
> -
> -	for (i = 0; i < ARRAY_SIZE(lt9611_modes); i++) {
> -		if (lt9611_modes[i].hdisplay == mode->hdisplay &&
> -		    lt9611_modes[i].vdisplay == mode->vdisplay &&
> -		    lt9611_modes[i].vrefresh == drm_mode_vrefresh(mode)) {
> -			return &lt9611_modes[i];
> -		}
> -	}
> -
> -	return NULL;
> -}
> -
>   static enum drm_connector_status lt9611_bridge_detect(struct drm_bridge *bridge)
>   {
>   	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
> @@ -832,12 +799,20 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
>   						     const struct drm_display_info *info,
>   						     const struct drm_display_mode *mode)
>   {
> -	struct lt9611_mode *lt9611_mode = lt9611_find_mode(mode);
>   	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
>   
> -	if (!lt9611_mode)
> -		return MODE_BAD;
> -	else if (lt9611_mode->intfs > 1 && !lt9611->dsi1)
> +	if (mode->hdisplay > 3840)
> +		return MODE_BAD_HVALUE;
> +
> +	if (mode->vdisplay > 2160)
> +		return MODE_BAD_VVALUE;
> +
> +	if (mode->hdisplay == 3840 &&
> +	    mode->vdisplay == 2160 &&
> +	    drm_mode_vrefresh(mode) > 30)
> +		return MODE_CLOCK_HIGH;
> +
> +	if (mode->hdisplay > 2000 && !lt9611->dsi1_node)
>   		return MODE_PANEL;
>   	else
>   		return MODE_OK;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
