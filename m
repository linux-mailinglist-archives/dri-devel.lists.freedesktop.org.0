Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEC67F0D45
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 09:16:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7729410E23C;
	Mon, 20 Nov 2023 08:16:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D22F410E140
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 08:16:18 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-507bd64814fso5663122e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 00:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700468177; x=1701072977; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=l5sTEAmTtbhoCMXLFmbz+riipdvwXdm2iXG8qiQt4WA=;
 b=hGwtwWvDNErBHMu1juALCPtXzVYngf5NMtXnvBZMmeJDkz/DLN9pbyRG3aySHb58x4
 CmQX2Fv3vRclW/qME5xhxGoUbEPBtanEUIhJYq+ukPZrVDHcP5GMqNLM3gaiAwrrzSzX
 wjKiZ9HrnVzLp95ISxZmaKsLK9fMGQ2COpaPwCv5WfQTgcqbWf2TgXL5HaIYT+8SVeF7
 peH4ZlHfTWUrhl06qDJcCCwhulXyt0zB0m820qrdI1Mqi4nU6AcGpWbAQ25OsHLWXbBg
 4Wb94ndupWA0wPpt8cOmZMyHJeB4POlzMG4nhWnJpTHgNhOf8oqxKt4j5h2L3kKpe/hc
 7AAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700468177; x=1701072977;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=l5sTEAmTtbhoCMXLFmbz+riipdvwXdm2iXG8qiQt4WA=;
 b=GyxVoQ21xVx2EVLX/b8jZ7mvfuvTviAe/+Br6XaM2h4baE+P6Z1dtUMM9NeKcbU7/x
 on4j5H/no6aCJM2XIXx9Gc2cdHfFsTmrdeOk7zyecOW5uMbuPLzRgFJ5IXcO7mkLxYHq
 eCLe+1K0hXZ7eVSTF8XwisFdasmeYtUgqeBoRQ6pcRVoOXA/OQUz64TFnyLdKs318aUp
 5QSqO4kuWnU1KKESAfIQsO17gMtKLhhltjRSAI0ij1nKZGj99EDTT06paUwBvkd8rxoi
 xDERz2NUtcgzIFp4hwiNsYb2cADjMZr8ICy/W2Rstu19FVT2Cq6inteqvflcBaoHNVtS
 LFhA==
X-Gm-Message-State: AOJu0YyIX1G4kUEWhRCwx2QTJGSSr1e+5Xy0MeMzzPKpXTEUEKkAvcSu
 cWgiT9qRGE3DlM5U7Wzychhp2Q==
X-Google-Smtp-Source: AGHT+IF/PYPeGH6vKFaVERL8d59d/q4hV3dx20a+d1LHqXStUFNJsezbcXcTnBZ/CEp3k6/bUuSyhA==
X-Received: by 2002:ac2:5619:0:b0:509:8dee:71e with SMTP id
 v25-20020ac25619000000b005098dee071emr4495922lfd.0.1700468176735; 
 Mon, 20 Nov 2023 00:16:16 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:f04:f84b:d87d:1d06?
 ([2a01:e0a:982:cbb0:f04:f84b:d87d:1d06])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a05600002a900b00332cb5185edsm290587wry.14.2023.11.20.00.16.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Nov 2023 00:16:16 -0800 (PST)
Message-ID: <58b10e6e-87cd-4157-8541-0cbfeb263422@linaro.org>
Date: Mon, 20 Nov 2023 09:16:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 11/20] drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:
 remove I2C_CLASS_DDC support
Content-Language: en-US, fr
To: Heiner Kallweit <hkallweit1@gmail.com>, Wolfram Sang <wsa@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>
References: <20231119112826.5115-1-hkallweit1@gmail.com>
 <20231119112826.5115-12-hkallweit1@gmail.com>
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
In-Reply-To: <20231119112826.5115-12-hkallweit1@gmail.com>
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
Cc: Maxime Ripard <mripard@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-i2c@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/11/2023 12:28, Heiner Kallweit wrote:
> After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
> olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
> Class-based device auto-detection is a legacy mechanism and shouldn't
> be used in new code. So we can remove this class completely now.
> 
> Preferably this series should be applied via the i2c tree.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> 
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c |    1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 52d91a0df..aca5bb086 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -515,7 +515,6 @@ static struct i2c_adapter *dw_hdmi_i2c_adapter(struct dw_hdmi *hdmi)
>   	init_completion(&i2c->cmp);
>   
>   	adap = &i2c->adap;
> -	adap->class = I2C_CLASS_DDC;
>   	adap->owner = THIS_MODULE;
>   	adap->dev.parent = hdmi->dev;
>   	adap->algo = &dw_hdmi_algorithm;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
