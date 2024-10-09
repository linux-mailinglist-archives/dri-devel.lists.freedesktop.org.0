Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBC3996A20
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 14:34:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED42310E6E7;
	Wed,  9 Oct 2024 12:34:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fVAp84TE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9304310E6E7
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 12:34:00 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-37d2e81e110so1022156f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2024 05:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728477239; x=1729082039; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=QqJk1+ztcnArzea2IKL9aLbLF7mwRX4o+oj2Q3NmaSw=;
 b=fVAp84TEw67Kd4YRAo0w9uzHAY2m8aclCDI12KTx3ZQfm+0Sh+KJwIUwyYdEFIYyWk
 2wqIYrCeNVf34l8/2Oc0U9C3KHgXKeSKL3YbUTLvKWcY35xCz4E0dJ/03CN4iJlSxZH/
 ntG/3Gg+0/ZQHedk/5DEzUN3GC6byIiFPKMDFY39TsL0PJSiN23jTXDiDcyPYzoWwOqS
 bheQhUU0M0UX2MUDM4ciMv3VfsJPTbIG/cDY8igquryf8SCIwhzelJl7OpOOMx1tWoMv
 /DQLd4xFLMKtZmYdyvwCCCYj4NrK5uOdnvotGNsP8QIlmMuUDyaRGkatMzyPWrGJMF0c
 r9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728477239; x=1729082039;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=QqJk1+ztcnArzea2IKL9aLbLF7mwRX4o+oj2Q3NmaSw=;
 b=ASF+pcdUoecKDMCME7C6dnsHjoV4eNlnSE7Y5UJv9fUqfaPMB726maKU7yXty1cjxo
 jDKnHeH2XtXc+kSPuH7vbGdTa0Z4o0q7TBEAxhC7s1by3YsjmsmA7wpg/rTrih/bM6q9
 oOrryCAKEBldSARe5NDBPDii3yPlNN8itwlF/+t88Bd9OH0ALc5+y9AcrATBj2jTpUxg
 YtBllxqUUM3/u2PfZm0ODKFRnn4lhbeFwWH/sc6KzKd/CfKgIEZIselmpJo9jdOzxLqU
 flDHoHpuAxXNqCvlBUtvHcArR/MXqCaSK1f26uXmi1NkNNyZ5c38R6Mc/5BimXffh/+w
 W53w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfrK3iC+0UvhVZggreAn7MUH60+37ahbZDOrtTlr5DqQExP2omq/WJa3hRs/FaA0WdPniLyGEht+U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywml2oJDHQ28KeJfyJnpSd8D8g4LgORGQ5GGS8VmPwdzHhUyc/l
 vjlV791i/DIRDVP0eS0Wtb2C7CX/ozXWRC8VdW5wcEPWs8/QWJaaUybzkelvJ40=
X-Google-Smtp-Source: AGHT+IHiHRyc0hqA8nCVxG9BCXYGM0RO3iv6rgEPI1NshjsqqMc6/tyJGTt0KdD/OHx5zcpyYuJt1Q==
X-Received: by 2002:adf:ee87:0:b0:37c:d179:2f73 with SMTP id
 ffacd0b85a97d-37d3aa58580mr1395456f8f.13.1728477238924; 
 Wed, 09 Oct 2024 05:33:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:767b:a30:4bcb:fcaf?
 ([2a01:e0a:982:cbb0:767b:a30:4bcb:fcaf])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d1698fcacsm10288484f8f.116.2024.10.09.05.33.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 05:33:57 -0700 (PDT)
Message-ID: <192d8bc9-112c-4303-a463-50d28d47cc21@linaro.org>
Date: Wed, 9 Oct 2024 14:33:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 1/3] drm/mipi-dsi: add mipi_dsi_compression_mode_multi
To: kernel test robot <lkp@intel.com>,
 Dzmitry Sankouski <dsankouski@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241006-starqltechn_integration_upstream-v6-1-8336b9cd6c34@gmail.com>
 <202410092245.tfsuUllL-lkp@intel.com>
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
In-Reply-To: <202410092245.tfsuUllL-lkp@intel.com>
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

On 09/10/2024 14:18, kernel test robot wrote:
> Hi Dzmitry,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on 58ca61c1a866bfdaa5e19fb19a2416764f847d75]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Dzmitry-Sankouski/drm-mipi-dsi-add-mipi_dsi_compression_mode_multi/20241007-022151
> base:   58ca61c1a866bfdaa5e19fb19a2416764f847d75
> patch link:    https://lore.kernel.org/r/20241006-starqltechn_integration_upstream-v6-1-8336b9cd6c34%40gmail.com
> patch subject: [PATCH v6 1/3] drm/mipi-dsi: add mipi_dsi_compression_mode_multi
> config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241009/202410092245.tfsuUllL-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241009/202410092245.tfsuUllL-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410092245.tfsuUllL-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> drivers/gpu/drm/drm_mipi_dsi.c:1533: warning: Function parameter or struct member 'ctx' not described in 'mipi_dsi_compression_mode_multi'
>>> drivers/gpu/drm/drm_mipi_dsi.c:1533: warning: Excess function parameter 'dsi' description in 'mipi_dsi_compression_mode_multi'

I missed this, Dmitry, can you send a follow-up patch fixing the kerneldoc ?

Thanks,
Neil

> 
> 
> vim +1533 drivers/gpu/drm/drm_mipi_dsi.c
> 
>    1522	
>    1523	/**
>    1524	 * mipi_dsi_compression_mode_multi() - enable/disable DSC on the peripheral
>    1525	 * @dsi: DSI peripheral device
>    1526	 * @enable: Whether to enable or disable the DSC
>    1527	 *
>    1528	 * Enable or disable Display Stream Compression on the peripheral using the
>    1529	 * default Picture Parameter Set and VESA DSC 1.1 algorithm.
>    1530	 */
>    1531	void mipi_dsi_compression_mode_multi(struct mipi_dsi_multi_context *ctx,
>    1532					     bool enable)
>> 1533	{
>    1534		return mipi_dsi_compression_mode_ext_multi(ctx, enable,
>    1535							   MIPI_DSI_COMPRESSION_DSC, 0);
>    1536	}
>    1537	EXPORT_SYMBOL(mipi_dsi_compression_mode_multi);
>    1538	
> 

