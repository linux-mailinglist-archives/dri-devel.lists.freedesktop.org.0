Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E69AC7A1C46
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 12:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C4A10E60B;
	Fri, 15 Sep 2023 10:31:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A1910E60B
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 10:31:43 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-31ff7535aa6so258800f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 03:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694773902; x=1695378702; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=Agf+HbcbHZD7R8zO+DTiFyOehM8J1Y2KoCK6tQX8VZs=;
 b=zrcfcX1ZMFESKzQqRVF1A59oIsryKBjc/UlCUX4kvLcmUlp+xkNkDrmfiG5opyAViY
 G+h8FhDNyLKJ7aLz8jYMkyP3R9KcRPHbL4kiq/1b3cmRnLtSOd84ENyFrIhP5HfWl6Or
 7wNfENwH4v4TLhbnSs2SurnKPpPkUcYZ16VF4rTuzNsafOO0Kk2bIbTwZyptODWHxXjV
 suMrBy0RoSU3lwTmNqDlV1jmoNWArE7aYEPb7L7Cfxb+dLOomYIed1DzujLILFVlpzVj
 cefhvl4VIBqCbnZgcpVy3lASR0xQLJ7Lr1XpudaMq+PaXgjkb3O7s7GKrVwl48gHpMac
 rJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694773902; x=1695378702;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Agf+HbcbHZD7R8zO+DTiFyOehM8J1Y2KoCK6tQX8VZs=;
 b=T6lU4ni6gdsJSV9AnZDHxNmLRMY9qy2Jb5XGgiU2YO0VHx+cXKk3GvxrOYbRXte2Gz
 SKGjCYB2+hG9x/nkzsTVI5s6VM749+14FWO626MvwDoQjDr+CQvlvuWnBoqEal9UvCiT
 +a2LZp09gMydEEwM2vpx3JESch5Pn6S6LAYijJAWuXjjNkw9b9vfFzSbGs9EFzRxtmGM
 RXEYWMyoLzq+FHVvkS0qlhTYd4WWJ+fA6zRiEDeu7PjLeh3GEeqL9p43kW9GSsmqVgMR
 5X8pILWukCRmGsYJ4/gW/f8PB8PR/8aIDX/25ct8rdZwUEfBFKxCKDyz8SFpfwa0zwBA
 PhUQ==
X-Gm-Message-State: AOJu0Yz5fG/GnSV1aCMa6L8TRWT2XpXAvB9IWIq/ATEBw+rre0+b6NR+
 PwiTfW3Ad2cAk2WaQaLTt/7V3A==
X-Google-Smtp-Source: AGHT+IGcD10v39BRW6gPlULShLeBhMiqVTJ2qD/BC7UEW5eVxt3+VGococHAIJan0uLcTaznQY78mg==
X-Received: by 2002:a5d:6281:0:b0:317:618a:c72 with SMTP id
 k1-20020a5d6281000000b00317618a0c72mr875204wru.64.1694773902025; 
 Fri, 15 Sep 2023 03:31:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:990a:74e6:266e:2294?
 ([2a01:e0a:982:cbb0:990a:74e6:266e:2294])
 by smtp.gmail.com with ESMTPSA id
 n7-20020adffe07000000b003140f47224csm4046204wrr.15.2023.09.15.03.31.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Sep 2023 03:31:41 -0700 (PDT)
Message-ID: <e20aa74f-3b40-4901-963d-41fa8286244f@linaro.org>
Date: Fri, 15 Sep 2023 12:31:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: add drm_bridge_connector.[ch] files under
 bridge chips
Content-Language: en-US, fr
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
References: <20230914131951.2473844-1-jani.nikula@intel.com>
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
In-Reply-To: <20230914131951.2473844-1-jani.nikula@intel.com>
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
Cc: Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/09/2023 15:19, Jani Nikula wrote:
> Clearly this should be under bridge chips.
> 
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   MAINTAINERS | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 354ac7ef553d..c331f2ea89d7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6909,7 +6909,9 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
>   F:	Documentation/devicetree/bindings/display/bridge/
>   F:	drivers/gpu/drm/bridge/
>   F:	drivers/gpu/drm/drm_bridge.c
> +F:	drivers/gpu/drm/drm_bridge_connector.c
>   F:	include/drm/drm_bridge.h
> +F:	include/drm/drm_bridge_connector.h
>   
>   DRM DRIVERS FOR EXYNOS
>   M:	Inki Dae <inki.dae@samsung.com>

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
