Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F183787F8DD
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 09:07:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F2710F4F7;
	Tue, 19 Mar 2024 08:07:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MlokMKex";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 403A310F4F7
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 08:07:14 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-33d90dfe73cso2907456f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 01:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710835632; x=1711440432; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=spYxpIEXYSNCSvAxWfrD34Q6PwS/7IJ3TtTp+AY4irk=;
 b=MlokMKex57JZ2X3q6DJJhc6nsTPn3Pd/PIENUUOGGxMj7VTpWJpWb/2ZzpiKFpUcXz
 f+vgsDou/Mvcd5mrYckT5aljRggYEe6MBUCp1x81RrGn/2X83qOAVTQHK58bQP8aEOYV
 mqUYVMXnjShAXSVPVpsxAs228b6qI4oETinTsXetdyDjM3vmI3+b3A5DHPYoqSeuqIuW
 jH/OpJgOnISt9RZg/nBYpEHDMfMhjdxs8byUsqrmIp9CkxSErcbQVuR8lzaZ+BhWVIb8
 Lwx59sDR1auH4nqszTXz4C9mDRW5bocZs7R8JCZtESJINfGwE5pa+lIh9GeYYLpInRwp
 1Rwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710835632; x=1711440432;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=spYxpIEXYSNCSvAxWfrD34Q6PwS/7IJ3TtTp+AY4irk=;
 b=Ah47AoXEnzN7TE6BfE19gR4IyPfobqBMOShVtifpv5hv+3jIge/em/dic90D/Cy0jL
 8b1ffHgh2BJGVsohEcddy9YfTfuQcPwepZTKPmsH242w+prgmpKXrWzO4fDar5YJGLYb
 kdw3mxDxTLD8qiIE2KIBtinVFjpG0tINBKI8LX6AbuPYmZL0vDBakqzw0N2Dnn0z+kGi
 QBocQny12XT7/5Y+I3gw7kbjThC89FLJxh6qvojQnitG8TqL84NX/dQu4TvwAAkrbuZB
 WEaspKxKkF5jSW2aprOz86FhHjqvfjDKFIprDi/y+X3+auy9fPoDLYJcyd7t6M2AgzLt
 iYCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmlFtwpjD36tH7+8A+JqIuqNvUZMazjyvxWB4l20CHHpU856iLdyhBdPJYUtSRbMYJg0hoSa2lIog9o9rwQ6RIY888GaGsWmcp/FMAcRsI
X-Gm-Message-State: AOJu0Yxxoi9PkGdOZUEmmhYnp5gQKnsvDiNHgtFvZ9uupHpicgo2JxA6
 6x3Ekq7f6nH9lr/D1FaRovHXqmxW14H3+TtU5JW91/Wnd/u7ORRwAvD36TpWCrg=
X-Google-Smtp-Source: AGHT+IFcvq6E9fBSZM2MY1IqdcxNGVVY1riao78wmDDVCMtvpbhSlftq640TPYVM8TuqdrlVOk7mkg==
X-Received: by 2002:adf:e2ca:0:b0:33e:764b:ab17 with SMTP id
 d10-20020adfe2ca000000b0033e764bab17mr1433241wrj.14.1710835632086; 
 Tue, 19 Mar 2024 01:07:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:2fcf:6f16:3b3b:da8e?
 ([2a01:e0a:982:cbb0:2fcf:6f16:3b3b:da8e])
 by smtp.gmail.com with ESMTPSA id
 bu27-20020a056000079b00b0033ecbfc6941sm11461315wrb.110.2024.03.19.01.07.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 01:07:11 -0700 (PDT)
Message-ID: <9907040c-7e25-4aa5-a4be-6f4820e335f1@linaro.org>
Date: Tue, 19 Mar 2024 09:07:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] drm,fbdev: td043mtea1: Convert sprintf() family to
 sysfs_emit() family
Content-Language: en-US, fr
To: Li Zhijian <lizhijian@fujitsu.com>, linux-kernel@vger.kernel.org
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg
 <sam@ravnborg.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-omap@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20240319035555.1577734-1-lizhijian@fujitsu.com>
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
In-Reply-To: <20240319035555.1577734-1-lizhijian@fujitsu.com>
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

Hi,

On 19/03/2024 04:55, Li Zhijian wrote:
> Per filesystems/sysfs.rst, show() should only use sysfs_emit()
> or sysfs_emit_at() when formatting the value to be returned to user space.
> 
> coccinelle complains that there are still a couple of functions that use
> snprintf(). Convert them to sysfs_emit().
> 
> sprintf() and scnprintf() will be converted as well if they have.
> 
> Generally, this patch is generated by
> make coccicheck M=<path/to/file> MODE=patch \
> COCCI=scripts/coccinelle/api/device_attr_show.cocci
> 
> No functional change intended

Please split patches in 2, while the driver targets the same hw, they
are not under the same subsystems.

Neil

> 
> CC: Neil Armstrong <neil.armstrong@linaro.org>
> CC: Jessica Zhang <quic_jesszhan@quicinc.com>
> CC: Sam Ravnborg <sam@ravnborg.org>
> CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> CC: Maxime Ripard <mripard@kernel.org>
> CC: Thomas Zimmermann <tzimmermann@suse.de>
> CC: David Airlie <airlied@gmail.com>
> CC: Daniel Vetter <daniel@ffwll.ch>
> CC: Helge Deller <deller@gmx.de>
> CC: linux-omap@vger.kernel.org
> CC: linux-fbdev@vger.kernel.org
> CC: dri-devel@lists.freedesktop.org
> Signed-off-by: Li Zhijian <lizhijian@fujitsu.com>
> ---
> V2:
>     Fix missing '+' before '=' in drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c
> 
> This is a part of the work "Fix coccicheck device_attr_show warnings"[1]
> Split them per subsystem so that the maintainer can review it easily
> [1] https://lore.kernel.org/lkml/20240116041129.3937800-1-lizhijian@fujitsu.com/
> ---
>   drivers/gpu/drm/panel/panel-tpo-td043mtea1.c        | 13 ++++---------
>   .../omap2/omapfb/displays/panel-tpo-td043mtea1.c    | 12 ++++--------
>   2 files changed, 8 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c b/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
> index cf4609bb9b1d..0983fe47eb5a 100644
> --- a/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
> +++ b/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
> @@ -242,16 +242,11 @@ static ssize_t gamma_show(struct device *dev, struct device_attribute *attr,
>   	struct td043mtea1_panel *lcd = dev_get_drvdata(dev);
>   	ssize_t len = 0;
>   	unsigned int i;
> -	int ret;
>   
> -	for (i = 0; i < ARRAY_SIZE(lcd->gamma); i++) {
> -		ret = snprintf(buf + len, PAGE_SIZE - len, "%u ",
> -			       lcd->gamma[i]);
> -		if (ret < 0)
> -			return ret;
> -		len += ret;
> -	}
> -	buf[len - 1] = '\n';
> +	for (i = 0; i < ARRAY_SIZE(lcd->gamma); i++)
> +		len += sysfs_emit_at(buf, len, "%u ", lcd->gamma[i]);
> +	if (len)
> +		buf[len - 1] = '\n';
>   
>   	return len;
>   }
> diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c
> index 477789cff8e0..3624452e1dd0 100644
> --- a/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c
> +++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c
> @@ -228,14 +228,10 @@ static ssize_t tpo_td043_gamma_show(struct device *dev,
>   	int ret;
>   	int i;
>   
> -	for (i = 0; i < ARRAY_SIZE(ddata->gamma); i++) {
> -		ret = snprintf(buf + len, PAGE_SIZE - len, "%u ",
> -				ddata->gamma[i]);
> -		if (ret < 0)
> -			return ret;
> -		len += ret;
> -	}
> -	buf[len - 1] = '\n';
> +	for (i = 0; i < ARRAY_SIZE(ddata->gamma); i++)
> +		len += sysfs_emit_at(buf, len, "%u ", ddata->gamma[i]);
> +	if (len)
> +		buf[len - 1] = '\n';
>   
>   	return len;
>   }

