Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C80A921E3
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 17:46:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C3710EB55;
	Thu, 17 Apr 2025 15:46:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="m52tvd/v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC5810EB55
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 15:46:08 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-39c1ef4acf2so676763f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 08:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744904767; x=1745509567; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=9jF2Ywy9a4a1q4ukuAIcEGtnLsfiX39uzNX7jMdpR5E=;
 b=m52tvd/vOxUSEuuazhiEpnIcHjP+VAkBmDjYbYq+SMOrKAhsPueGZMjASPB1cLN8KP
 9PNvV16Jfd9YO82vZKZ67jR0T6RNTT0Auq/1qXgL2nBlVQwB2nWa9IG9oSgrKa7tWyp4
 3kT+xQqGw30WNfmRH43Fp8LLC+jUCILbur7YAdG0TA43nBryCLUEwQiyU05Kf8aBoZMJ
 EUklMVYzrYb+W+O0orJcBNnO4RQ+xqBsJ4B9A5kvQL0jWjoLYbkrUC5thF2RUDEwNlAq
 rlI96v/heEACpkJBX4e5BVBK6VgqVNcTBuVLJB/3mb08Nq/lseJnPz0OKqWLc/VD+Nri
 VBXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744904767; x=1745509567;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=9jF2Ywy9a4a1q4ukuAIcEGtnLsfiX39uzNX7jMdpR5E=;
 b=oyk3DPHnauBQeFyYNbazEDq/oVExfW8DAw0qsxpceoiNxlrsJSifrLTSW+c57VWJc5
 Iud+JiW9l+z/pp7Av+G3E+sXVSypKONh2MEHlqlFJVX66yWUxBt1mnCDGH1/8+QT/cPS
 PJjJyxedvcpXKInGQTP3+4ab5mMAZ4shlRjUxZrNVTE1raLMetTVJqPMlts1ZNIB349G
 EhQd/dwPWsdDqSWCPQt+j6MxS8aHDm1xf+xJD7sIe6hE9OtrqPXFBeT8esnxUvVuDLzs
 50/paZq1KT7TJS5vUlbm2PJ3akzyJ0he2Mx6N7R16Qmjrrixfdl5jxUnAfeAD60HuN3c
 Ukfw==
X-Gm-Message-State: AOJu0Ywvnn9rMpVy+lidspTXTTSezzajc7caXkeH6ToZopsJZRyiNcsy
 sVmGdgjfwt2pOYqzBzBnQMyft5o54hZxdAsGlqHpLGaa64K7qBfFhJ4Ag1IIkCM=
X-Gm-Gg: ASbGncv5h0z1IB9Yy+/c6HV26qkmAeTAtedQy5nZrxsf5pY5Ihmyv3YU0HkQgXtN9JN
 /U96O1lZmQ5HFdXYoT/ccuQ54LELfWWISS/pQrc4uAhHlGRwQC7R7HE3ieqBLUL2Vyfema/R44+
 bPQunkZ9XBVOgyjEdurB3pam9BFgjv5xRDE4jq27YIHC0mTNPWeADztDKjCRZaRM8Ap10e0bSm9
 yWO0HYd6gM9MuS/+glpKNH1/k7cYewCquJG/GogunCfQk/jXvBZHPD++0buil2/b3SzKuStUyCX
 01Z0SdYUZNTxNmOWXk/zbQYJPLQmJvx7WtCdNUg7gF7ZPBDWOZd2k5mZQ+2zPosaAZ8dkpMsrZK
 WoVOlMNk7+AU8SYU=
X-Google-Smtp-Source: AGHT+IHRa7u02VkiQVcOWbuErq1tBT4tuIRQemO4n8RrVbPAasOmBAb0aJuMUrhX45vEZidLeDC7Aw==
X-Received: by 2002:a05:6000:2503:b0:38f:483f:8319 with SMTP id
 ffacd0b85a97d-39ee5bae695mr5575888f8f.51.1744904766709; 
 Thu, 17 Apr 2025 08:46:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:a7f9:634b:42d:1546?
 ([2a01:e0a:3d9:2080:a7f9:634b:42d:1546])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae979835sm20849959f8f.57.2025.04.17.08.46.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 08:46:06 -0700 (PDT)
Message-ID: <1204ed65-c1c4-4bb9-b99b-262aa7593e19@linaro.org>
Date: Thu, 17 Apr 2025 17:46:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/7] drm/bridge: analogix_dp: drop extra calls to
 analogix_dp_prepare_panel()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
 <20250401-panel-return-void-v1-1-93e1be33dc8d@oss.qualcomm.com>
Content-Language: en-US, fr
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
Organization: Linaro
In-Reply-To: <20250401-panel-return-void-v1-1-93e1be33dc8d@oss.qualcomm.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/04/2025 07:11, Dmitry Baryshkov wrote:
> The analogix_dp_prepare_panel() returns immediately if there is no
> attached panel. Drop several calls to this function which are performed
> when dp->plat_data->panel is NULL.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 22 +---------------------
>   1 file changed, 1 insertion(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 042154e2d8ccd74ac2dc27fe527e810a50e08a09..ab1cfc340aa95bbf13fe021bd33227b565a5458d 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1005,17 +1005,11 @@ static int analogix_dp_get_modes(struct drm_connector *connector)
>   {
>   	struct analogix_dp_device *dp = to_dp(connector);
>   	const struct drm_edid *drm_edid;
> -	int ret, num_modes = 0;
> +	int num_modes = 0;
>   
>   	if (dp->plat_data->panel) {
>   		num_modes += drm_panel_get_modes(dp->plat_data->panel, connector);
>   	} else {
> -		ret = analogix_dp_prepare_panel(dp, true, false);
> -		if (ret) {
> -			DRM_ERROR("Failed to prepare panel (%d)\n", ret);
> -			return 0;
> -		}
> -
>   		drm_edid = drm_edid_read_ddc(connector, &dp->aux.ddc);
>   
>   		drm_edid_connector_update(&dp->connector, drm_edid);
> @@ -1024,10 +1018,6 @@ static int analogix_dp_get_modes(struct drm_connector *connector)
>   			num_modes += drm_edid_connector_add_modes(&dp->connector);
>   			drm_edid_free(drm_edid);
>   		}
> -
> -		ret = analogix_dp_prepare_panel(dp, false, false);
> -		if (ret)
> -			DRM_ERROR("Failed to unprepare panel (%d)\n", ret);
>   	}
>   
>   	if (dp->plat_data->get_modes)
> @@ -1087,19 +1077,9 @@ analogix_dp_detect(struct drm_connector *connector, bool force)
>   	if (dp->plat_data->panel)
>   		return connector_status_connected;
>   
> -	ret = analogix_dp_prepare_panel(dp, true, false);
> -	if (ret) {
> -		DRM_ERROR("Failed to prepare panel (%d)\n", ret);
> -		return connector_status_disconnected;
> -	}
> -
>   	if (!analogix_dp_detect_hpd(dp))
>   		status = connector_status_connected;
>   
> -	ret = analogix_dp_prepare_panel(dp, false, false);
> -	if (ret)
> -		DRM_ERROR("Failed to unprepare panel (%d)\n", ret);
> -
>   	return status;
>   }
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
