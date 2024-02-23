Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CEA861010
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 12:03:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C580B10EBAC;
	Fri, 23 Feb 2024 11:03:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qrCt3bcv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76DBB10EBB6
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 11:03:14 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-512be9194b7so213514e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 03:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708686192; x=1709290992; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:from:content-language:subject:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=/RpTYiyFTL0cV1HIXamxy5oNLm7jD4YHf0G0C+wgOA8=;
 b=qrCt3bcvUTPMTM5QZrpG9pW4PI3G1Qs+3UzmoA5lgDa9GnYg38bEjInsgHvBYYOlMc
 EE8IfRheWtayEhVf5+Ahd4LB+ke44cvETtEv60wdRoAXg0ORemxnf3X+vqgx+uBVlzsv
 IPqyi/sVX05sYVETrORSIFGp6wL+lN5HBVN2V3PwNWYMKmZqOnYrlDDfVCWi3cXsCcZD
 vbRkrSz3/XlQii+G0mEunWb3GD/3pK4cESmfWNsG8JWfYMLMlSWHq8aiS3qtjVpJLHzw
 2M9Xe6Pk3u1LDiI//02mGNblffHTC+0Uoaz1rMJW0zTDkT1br+RECXBG02Nit0FpPc5X
 By2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708686192; x=1709290992;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:from:content-language:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=/RpTYiyFTL0cV1HIXamxy5oNLm7jD4YHf0G0C+wgOA8=;
 b=HZuz+bPZiOeIyX4CNexWIZF4V1zT4H25ahPlxSwDTJ/zdJIrW/FtOScFqY0CnVVC6A
 IXE64IHQT/Njg2oHCiklkBcqHM5fjTJxVbUgyv/lYkrstnxB3HO+yeVXjeo6asW6q5Ni
 RKGh3K4dFAKKdvEeUcPRm0/Ccg6CQhxvRHe5i4gWh+sfcl7pYWKyyLDHLnz5+Pc4/+Mc
 ULfqhMqqwhvW29awtUjLMVSYdFya5cPVewxrQzNm3Y7XAZiP+uSaOey3xvyzjphpV/AG
 uuZXLRESDiOGKqBxClhHwUqAMs945Snjzg4xcOMiYHEq+q063yTCInqVYJ/OZ3nyI15Q
 DaSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpB8gR6J/SeD5VDhw4vBhS/4+H6f5bZU7fG558WULlSKwr+9aBTfom+tK1KPNJ/5zDfuvpPf95OC82U//artr6BJrQ+vR0NDvXv/Ybm/W8
X-Gm-Message-State: AOJu0YwIbN2A6hbW+EW9feFv9XbP0NRoCIPzggVWaXSjIg7TlLHH0wxf
 z4p6bbmfRcDFrFQ7Mzl5L9pBBUWLJlq6oqi3p1PN6kco7XjRKMbFBOiEa/jXS4w=
X-Google-Smtp-Source: AGHT+IFT9W3nGYiyOdEzCSKGOnZ74IabhMCjp6QTcpJbx2fT9JJlPrAlcV6NNwKGl1ykqb6VM2pP6w==
X-Received: by 2002:a05:6512:3f5:b0:512:ab9e:3521 with SMTP id
 n21-20020a05651203f500b00512ab9e3521mr952191lfq.11.1708686192169; 
 Fri, 23 Feb 2024 03:03:12 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:58e3:6b80:c446:11f4?
 ([2a01:e0a:982:cbb0:58e3:6b80:c446:11f4])
 by smtp.gmail.com with ESMTPSA id
 jj26-20020a05600c6a1a00b0041294a6fc03sm1541476wmb.9.2024.02.23.03.03.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Feb 2024 03:03:11 -0800 (PST)
Message-ID: <3c4246b6-431a-442e-8ace-3b0d0e67743f@linaro.org>
Date: Fri, 23 Feb 2024 12:03:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] soc: qcom: pmic_glink_altmode: fix drm bridge
 use-after-free
Content-Language: en-US, fr
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
Cc: Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
References: <20240217150228.5788-1-johan+linaro@kernel.org>
 <170868613914.4029284.5549880672870201262.b4-ty@linaro.org>
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
In-Reply-To: <170868613914.4029284.5549880672870201262.b4-ty@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/02/2024 12:02, Neil Armstrong wrote:
> Hi,
> 
> On Sat, 17 Feb 2024 16:02:22 +0100, Johan Hovold wrote:
>> Starting with 6.8-rc1 the internal display sometimes fails to come up on
>> machines like the Lenovo ThinkPad X13s and the logs indicate that this
>> is due to a regression in the DRM subsystem [1].
>>
>> This series fixes a race in the pmic_glink_altmode driver which was
>> exposed / triggered by the transparent DRM bridges rework that went into
>> 6.8-rc1 and that manifested itself as a bridge failing to attach and
>> sometimes triggering a NULL-pointer dereference.
>>
>> [...]
> 
> Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)
> 
> [1/6] drm/bridge: aux-hpd: fix OF node leaks
>        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=9ee485bdda68d6d3f5728cbe3150eb9013d7d22b
> [2/6] drm/bridge: aux-hpd: separate allocation and registration
>        (no commit info)
> [3/6] soc: qcom: pmic_glink_altmode: fix drm bridge use-after-free
>        (no commit info)
> [4/6] soc: qcom: pmic_glink: Fix boot when QRTR=m
>        (no commit info)
> [5/6] phy: qcom-qmp-combo: fix drm bridge registration
>        (no commit info)
> [6/6] phy: qcom-qmp-combo: fix type-c switch registration
>        (no commit info)
> 

To clarify, I only applied patch 1 to drm-misc-fixes

Thanks,
Neil
