Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 281D2A64912
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 11:12:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB4F10E0C4;
	Mon, 17 Mar 2025 10:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nzvXQ//P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 486D210E0C4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 10:12:06 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so7586815e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 03:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742206325; x=1742811125; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=Unak19FFUAPatD54I/+J4+Z4vCj2oJP7uUeW6FKDhls=;
 b=nzvXQ//PcH2QA7zzYZuWEA6g1hBBXXvHfZiR4PajxjNeNtmXewAbJK7Y3erzrlH0Oz
 UkKaI/coAEl4NMKT4m35Cp/n4sbmrTRzHEetYcp0jIZTlJx4iYujIN53ieY6SN5rgdo2
 mTbNsncZPN4NNdZMx6ru0IkMxdmEUuI45cMlgMqmbHmU7aiaUsIHdOAlUayUsR3jMP69
 xouQ1vT2fRkmO5imcfQVkijgv5H2UstPvmJcsq1aA8qyFDuKpVeJUt12Ax1dz5JrXqFr
 E7LEZ/UAR6Lll6gylbdKgrU3gLXCUxieBF4V9gUgsmjv0hb98KqBOHcXA2bfLhaEUBwl
 lt8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742206325; x=1742811125;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Unak19FFUAPatD54I/+J4+Z4vCj2oJP7uUeW6FKDhls=;
 b=D7kAJpe4BlV9fyJw9WoRLyisAetRvnhOzNVTGnxjpIYs/GyAbG7g+aWzHvYLKNmvPL
 FsLE5ujkE+rH9RUw3cjU8L5gFfFJKD0gAPuElTAySW6Snkh7rXPie0nPhg2V/ATMUVpY
 vrLEWZ+FzkncI0rlDL/8yuPG3ItWr/Fy6GRb9c6utSzpw8vTvchkxFvJrm0HhzoZy56e
 hPqLCFOU8+UbYOEPoHPIIUx15brRuMiB1k7mbiPmyoOhyv9XG76nVxpNpUJ6bAv1NPgW
 Dtz5iNt9UjaHEd1O2n1Z0EVGe4o7mtqBT++YuDLXGgK/7OGsdeXD5ZJkE3SFRwc6S7l7
 d0Zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlxTrCGsc4MWUY20oq5JDzVWqCpSxWyBZcEii0gus4I3w9NsTU+uV26X+ttQYZLO8w6SIcaF5eVYw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzD10dGsauGCKsqwqlmajfzeQwYF/Hl1719hv0Z+hibWs+maWRp
 208Jh4eN1BwnhtUs7u87Cp7bchkdd/m52eYQYW4pESRl6HApYmHc6VhiaDV+EZk=
X-Gm-Gg: ASbGncsUFYzcSZoOn8mrBLHD+pu8ltPZowDDwl8aNJYIQSoGgaSYxf7NDKRYI+EYDt1
 vDt6l7wSX+CvaOQSiOsXJ76VpcIafL3Ux2EgnRhbUCljt6Q01SxmipnraoHDwc1FtkxA04xP2KP
 JQ9FsKhAelKlH/GidCe+0qYrmUIYwewGBGJIuc+mgTlSnxCjw7YUyhAr867tMpDMkLlCxMjktoz
 ZfZ/YPk97GnEDh8kwKKYkyQK2zJhRNrDhDySps4e/QSN5pG3fpHA2YluRZSfZ7RXYlsvQ24j3fi
 MXpaJ03uTsHfbvvfc3pDtGf4c6FuCBGTIDWz9L+356j1FnkNt6cTG+DfA90RfVYvlwZZn7u140h
 JCYi94JWc32ZIPrvOFpGHIA==
X-Google-Smtp-Source: AGHT+IF9c9Mh2aIPNg9XfrvDpqYWQukEAmGtKi2uLzyWlmrgt/ypKChDbDRK5Er/GjQEgaiU1/Yvkg==
X-Received: by 2002:a05:600c:4e86:b0:43c:e7ae:4bcf with SMTP id
 5b1f17b1804b1-43d1ebf9d44mr128205195e9.0.1742206324974; 
 Mon, 17 Mar 2025 03:12:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:55a6:4776:6e68:e626?
 ([2a01:e0a:3d9:2080:55a6:4776:6e68:e626])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d200faebbsm99470565e9.30.2025.03.17.03.12.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 03:12:04 -0700 (PDT)
Message-ID: <3c688493-02db-461d-b07c-34f2f4477f01@linaro.org>
Date: Mon, 17 Mar 2025 11:12:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 2/2] drm/panel/panel-simple: Use the new allocation in
 place of devm_kzalloc()
To: Anusha Srivatsa <asrivats@redhat.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250312-drm-panel-v1-0-e99cd69f6136@redhat.com>
 <20250312-drm-panel-v1-2-e99cd69f6136@redhat.com>
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
In-Reply-To: <20250312-drm-panel-v1-2-e99cd69f6136@redhat.com>
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

On 13/03/2025 01:54, Anusha Srivatsa wrote:
> Start using the new helper that does the refcounted
> allocations.
> 
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 232b03c1a259eb15e423b9d452d28e2ff95c70f8..d7530c3533af34f83ce8c6d6067e7f293f2d4bf1 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -579,7 +579,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>   	u32 bus_flags;
>   	int err;
>   
> -	panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
> +	panel = devm_drm_panel_alloc(dev, struct panel_simple, base, &panel_simple_funcs);
>   	if (!panel)
>   		return -ENOMEM;
>   
> @@ -694,8 +694,6 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>   	pm_runtime_set_autosuspend_delay(dev, 1000);
>   	pm_runtime_use_autosuspend(dev);
>   
> -	drm_panel_init(&panel->base, dev, &panel_simple_funcs, connector_type);

As pointed by the helpers review, you're loosing the connector_type info here.

> -
>   	err = drm_panel_of_backlight(&panel->base);
>   	if (err) {
>   		dev_err_probe(dev, err, "Could not find backlight\n");
> 

Thanks !
Neil
