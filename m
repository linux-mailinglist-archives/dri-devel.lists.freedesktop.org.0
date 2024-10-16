Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 809AD9A0597
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 11:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075D510E6DE;
	Wed, 16 Oct 2024 09:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="L0Recti1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F60910E6DE
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 09:33:47 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-37d50fad249so4173086f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 02:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729071226; x=1729676026; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=KirE5L2OVZE231EVGmAxTP+Pf8UuLBXAEGkZ2gtRDZw=;
 b=L0Recti1Pb57Mx/SnfF5YPs25ZFplpFSVH8y19hjBWEYjv2/IpUYKzxXA7th6r0toC
 aqU6n2RfrKgIa9FdMva+QzPUzvEbdfhDM9LImMgtDG+wrN+4GWCAAC1XtQOA9/d3/Olu
 qN/iGTd+1G7G+LpqR7HFMafAcUI90xB5XpwpYTZPbTuFyqor09x3Lz8auRyas2PmepJQ
 5/yZt1d3SUZJlEo5LY4y3b0ZdZrwJrccnGxttWxDClgtccVyYLalwr6X17q+44K7TgvQ
 A/RODB6gHuwfJQEc5H+5LYrlASs0Q31FxENbkgQWYtSydPqMTavAyA32n1zEuiqbwOe6
 g1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729071226; x=1729676026;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=KirE5L2OVZE231EVGmAxTP+Pf8UuLBXAEGkZ2gtRDZw=;
 b=pGY6TCN9RN9ws6gOSy8CUGSNaClhKWpXbFtrHPmLUcCJWbTTqKla5S9CL6I3acMK9L
 1RYmkxxVKo4lT7QrXaiGnLbc6p+BqeweuZzCOEA7RpIOIqBQ44qdgRWL1gMG/5RODmUD
 4GOJMradhNl/LO6XANa2qUtRjJ6sZUbOlePGylUA8oZBd7BQiNRmS43D7ubfm0fdbudp
 F9qVU8EpL/hwgorI5MK/4fhml+VTmanmagyuc9rezIJshWEV0Jskn4ccF5In7Hms0YOn
 aNYXn5EZPcuwiX1xpDeeFJ/6PebDo/jZbNGS1me5JuUABNcFl6s2lh7HBCOJyrmrrxP4
 c9Hg==
X-Gm-Message-State: AOJu0YxbQnwQpnI1Sa4i4Pb2v5OOygdyVuIZagHczrQxtlxUcVuC51Pu
 paC+wYgARBnH2zViVCfdPZ2NxozU1BUHj5UCPnIEPixTxNgAJrmxKRrpjbUE3NY=
X-Google-Smtp-Source: AGHT+IGY9RUvkG9+qhw7jTJ35R6cS04jCGJyLaCgHEmiZyNZyhr4HEf3w4khRH596wwRiHwzf8fUgg==
X-Received: by 2002:adf:cd03:0:b0:37d:4ab2:9cdc with SMTP id
 ffacd0b85a97d-37d86bb47aemr2112372f8f.13.1729071225757; 
 Wed, 16 Oct 2024 02:33:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:fd09:f78e:726a:6fa2?
 ([2a01:e0a:982:cbb0:fd09:f78e:726a:6fa2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d7fc40a14sm3806605f8f.103.2024.10.16.02.33.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Oct 2024 02:33:45 -0700 (PDT)
Message-ID: <96f6d392-faaf-4949-b692-3b40ae738104@linaro.org>
Date: Wed, 16 Oct 2024 11:33:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/6] drm/panel: panel-orisetech-otm8009a: Include
 <linux/mod_devicetable.h>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Jessica Zhang <quic_jesszhan@quicinc.com>
References: <20241011144632.90434-1-tzimmermann@suse.de>
 <20241011144632.90434-4-tzimmermann@suse.de>
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
In-Reply-To: <20241011144632.90434-4-tzimmermann@suse.de>
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

On 11/10/2024 16:41, Thomas Zimmermann wrote:
> Include <linux/mod_devicetable.h> directly to get struct of_device_id.
> Avoids the proxy include via <linux/backlight.h>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/panel/panel-orisetech-otm8009a.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
> index a9b5dad70bc1..87bbb25d119a 100644
> --- a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
> +++ b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
> @@ -9,6 +9,7 @@
>   #include <linux/backlight.h>
>   #include <linux/delay.h>
>   #include <linux/gpio/consumer.h>
> +#include <linux/mod_devicetable.h>
>   #include <linux/module.h>
>   #include <linux/regulator/consumer.h>
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
