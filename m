Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EB08275F0
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 18:01:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78CF910E277;
	Mon,  8 Jan 2024 17:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75EA710E28B
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 17:01:01 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40e4cb25288so896585e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jan 2024 09:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704733260; x=1705338060; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=s/Y2vYp6gB9Znfbu2ZOhJlWg1I1BWp1WtqJTxc5SyKc=;
 b=pT/xJ0qxJQl15ZWhX9F9Cao8xuZTAV9UGmO+MBtanceIHCrZmtxUHt9/pMLNvl4Tav
 Co4Xs/JJ90OkTtMuv8RY2hDR/3JjiMXxJfQ/llpkBjlQITRhHEe8DnHezBzPqA0fh8Zj
 NNEDKImOxC8jANRZqbkyo/PxryE8VDrTDfwhEJ09NOxCjDL6XxxIo0zcDpyhism2fmSa
 jCAHqnR3lpbze7euORZOnXiv8By/hMRAtC4fd8WCvcnHm4FoMW95oCBSdcjDBE1nYPbO
 ZFIw78tlrT7Z6FixZGRATuudALiqZhMHMcao+1Z2gpujd68C+oTrXhOE/0TzysgeNaAH
 vFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704733260; x=1705338060;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=s/Y2vYp6gB9Znfbu2ZOhJlWg1I1BWp1WtqJTxc5SyKc=;
 b=ck1gugcR4U+4xxHSuaMBsQzXiG8RGxF2hbk9u8Upd0ZaY9iP8DOOG7V8KersbcPTgW
 FGuqoiAtGzBhSWO5FN9eJWtqTTerH/9xrzUc2U1dQCryhNKK2AoOCN7dsSNqDfjeFzJO
 WOhBPnOgN3rhKgpPLB0RBY1zIQ53zo++BhOCaT45HPI3NQoa0GEdRDX+mgqBpXtpZz23
 7/wugnbDNydR7NKUKQR/ZnG4H+iUNKya9QMpNi9ZJZEpdGkgEapbM12D5i9oGRYFsHue
 BGdsV2wklYRC8YeNkVAn/i19H6uNNobPOqFS1kYOWXU0eRbL6qbgXTwQaiPBRUiRfMv6
 cyqw==
X-Gm-Message-State: AOJu0YxbSllNeAj4JklkujX3bkwkA9IXYagvRzrx0nihM+5UcNlo6J7m
 tvKDtAe1L9bB1l766W2IYUWAREKSvoHQgQ==
X-Google-Smtp-Source: AGHT+IERCdhc4OOVGqYapIIs0fAiE052T5BDqBE7jsbS3MUxqUf3701o8AwngTf7yV4P+KPQOSkpig==
X-Received: by 2002:a05:600c:22d4:b0:40e:4ac4:37ef with SMTP id
 20-20020a05600c22d400b0040e4ac437efmr331548wmg.33.1704733259774; 
 Mon, 08 Jan 2024 09:00:59 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:32b:5e85:79f9:3fde?
 ([2a01:e0a:982:cbb0:32b:5e85:79f9:3fde])
 by smtp.gmail.com with ESMTPSA id
 g18-20020adff3d2000000b00336aac53e75sm113208wrp.97.2024.01.08.09.00.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 09:00:59 -0800 (PST)
Message-ID: <392efc30-be36-419a-8cda-00d4256097c4@linaro.org>
Date: Mon, 8 Jan 2024 18:00:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/1] drm: bridge: dw_hdmi: Set DRM bridge type
Content-Language: en-US, fr
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20240108152514.533414-1-alexander.stein@ew.tq-group.com>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <20240108152514.533414-1-alexander.stein@ew.tq-group.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/01/2024 16:25, Alexander Stein wrote:
> The bridge type was set to default (Unknown). Set proper bridge type.
> With this fixed, debugfs output imx8mp looks proper.
> $ cat /sys/kernel/debug/dri/1/encoder-0/bridges
> bridge[0]: imx_hdmi_pvi_bridge_funcs [imx8mp_hdmi_pvi]
>          type: [0] Unknown
>          OF: /soc@0/bus@32c00000/display-bridge@32fc4000:fsl,imx8mp-hdmi-pvi
>          ops: [0x0]
> bridge[1]: dw_hdmi_bridge_funcs [dw_hdmi]
>          type: [11] HDMI-A
>          OF: /soc@0/bus@32c00000/hdmi@32fd8000:fsl,imx8mp-hdmi
>          ops: [0x7] detect edid hpd
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> For the record, the output before is:
> $ cat /sys/kernel/debug/dri/1/encoder-0/bridges
> bridge[0]: imx_hdmi_pvi_bridge_funcs [imx8mp_hdmi_pvi]
>          type: [0] Unknown
>          OF: /soc@0/bus@32c00000/display-bridge@32fc4000:fsl,imx8mp-hdmi-pvi
>          ops: [0x0]
> bridge[1]: dw_hdmi_bridge_funcs [dw_hdmi]
>          type: [0] Unknown
>          OF: /soc@0/bus@32c00000/hdmi@32fd8000:fsl,imx8mp-hdmi
>          ops: [0x7] detect edid hpd
> 
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index aca5bb0866f88..455bc15d90cc1 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -3541,6 +3541,7 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
>   	hdmi->bridge.interlace_allowed = true;
>   	hdmi->bridge.ddc = hdmi->ddc;
>   	hdmi->bridge.of_node = pdev->dev.of_node;
> +	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
>   
>   	memset(&pdevinfo, 0, sizeof(pdevinfo));
>   	pdevinfo.parent = dev;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
