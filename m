Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2050D7F6F07
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 09:59:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E2AE10E196;
	Fri, 24 Nov 2023 08:59:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A41510E196
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 08:59:11 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40839652b97so11125215e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 00:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700816350; x=1701421150; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=yNqJMxRTGvnEbCK0XZ3LOOul2fJNuzup45SG/m7ppc4=;
 b=KRT5IofEI7SvvOhGVcwBOwgBTIqi8CAtv2HM/nbFmhpm4YMX1Y3DjWNClBnYf/xNSK
 ibV3DYS8/nhcthPyq9DRUm8OErEhym4Xoj25FFvz6Bd81VzvjZHBiaNbE/QhuC/YI4ZB
 HVxt4xucTSJozPfVn0DrZhGTa9AOfdS7N5WYWAzPJTaPXFpH58N/T1aEzCaID+uDm3Q5
 9tzv+J7N2WpJ9z5kLMquEg4L3SYVxY82hmxWMbqLCAUuAT2Km4jMB+Xx9VBIH9sHtlpl
 v+KLIwvazu821cCmoz2/PGTqmcKZN0MiqOSHFSMc6e164nVsjDMe8hsZTRwi0sfDtGsu
 lV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700816350; x=1701421150;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=yNqJMxRTGvnEbCK0XZ3LOOul2fJNuzup45SG/m7ppc4=;
 b=A8b7Rr62nr9G9q9DDIyGTKBUhhEHIJ4GPHuq/So5Mi/rA8u4BA1xfHT6QgKKyl+Da4
 hR2/3o580ng59oyRYvxMwo0SufZ5U6tuYlyvVD+rxDieDA3i4E3rLaauGpptwTQW3RJy
 rkAkN9KKCadtBRGFo5JzSgdvrLT1tgAjfYrDSC7gYt30/uhtk1Vk+OOMzv417V5kfRTI
 BS4EotDSkCc4JYBFTdvkcm8TTdKKG2noXQ2e5HjrcLYhp2XpGVztcOpk9uyeQrQQdtb0
 CQq/z/mKWON6zQmjxXV08xQDKjngbWYC8n+LAfCPk5LM7SLWuHUwdN7Hwgx+mUBw8YRU
 YbyQ==
X-Gm-Message-State: AOJu0Yyo+cWp5C16a/HtG9cGtQUWWeLN8kkctWZ/b4YUNQjkqUawFTrK
 9iC32hxn0sW8poYsWgbN7FrHiQ==
X-Google-Smtp-Source: AGHT+IE+WGAbjdqPchseLbjHCBwIhcJmv857+lYNTnlyvxkbsuzTKkLV2SWWD+wTZfwtER2TEv0sAw==
X-Received: by 2002:a5d:51c5:0:b0:332:ca67:b6a1 with SMTP id
 n5-20020a5d51c5000000b00332ca67b6a1mr1459067wrv.0.1700816349954; 
 Fri, 24 Nov 2023 00:59:09 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4611:6dae:b5a3:b6a4?
 ([2a01:e0a:982:cbb0:4611:6dae:b5a3:b6a4])
 by smtp.gmail.com with ESMTPSA id
 a4-20020adfeec4000000b003196b1bb528sm3749226wrp.64.2023.11.24.00.59.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Nov 2023 00:59:09 -0800 (PST)
Message-ID: <525f213c-6a4a-48fb-b29f-55fd49ec3c25@linaro.org>
Date: Fri, 24 Nov 2023 09:59:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 2/2] drm/bridge: imx: add driver for HDMI TX Parallel
 Video Interface
Content-Language: en-US, fr
To: Lucas Stach <l.stach@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
References: <20230928125536.1782715-1-l.stach@pengutronix.de>
 <20230928125536.1782715-2-l.stach@pengutronix.de>
 <CAOMZO5CYX8ihTQ87zi3maARWzz+PmLKYBBJGVn69Xig2nAwqug@mail.gmail.com>
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
In-Reply-To: <CAOMZO5CYX8ihTQ87zi3maARWzz+PmLKYBBJGVn69Xig2nAwqug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 patchwork-lst@pengutronix.de, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/11/2023 18:34, Fabio Estevam wrote:
> Hi Lucas,
> 
> On Thu, Sep 28, 2023 at 9:56 AM Lucas Stach <l.stach@pengutronix.de> wrote:
>>
>> This IP block is found in the HDMI subsystem of the i.MX8MP SoC. It has a
>> full timing generator and can switch between different video sources. On
>> the i.MX8MP however the only supported source is the LCDIF. The block
>> just needs to be powered up and told about the polarity of the video
>> sync signals to act in bypass mode.
>>
>> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
>> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com> (v2)
>> Tested-by: Marek Vasut <marex@denx.de> (v1)
>> Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> (v2)
>> Tested-by: Richard Leitner <richard.leitner@skidata.com> (v2)
>> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> (v2)
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com> (v3)
> 
> Tested-by: Fabio Estevam <festevam@gmail.com>
> 
> Could someone apply this series, please?

I can, but it seems there's some fixes needed in the bindings.

Lucas, do you plan to send a v5 with the fixes ?

Neil
