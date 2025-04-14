Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBA1A878EF
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 09:37:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20FD010E4B2;
	Mon, 14 Apr 2025 07:37:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fHw5lI/3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4AD10E4B2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 07:37:25 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so31848255e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 00:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744616244; x=1745221044; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=epOflPPMn5sd54LuK8TeD9jvB1zpkeDQerq12nfOF1Q=;
 b=fHw5lI/3HFOvDHIETMeULs89/vhGhRp7OesajTBOkLOLMQNRIdgk4w2RpQGWkq/jnG
 s/vLTdotYzou2zT03t+pIxTgZ1q4pNbcOPnTkx+mxoVmEaGYmkvMkUoyy6RUT+w+aRtZ
 yYfss88q5mHulBezfUGyULD2KBy01T6oMgv6INIo/cTopTTBfTAEBSJnyvwkzK4yGKFl
 FDt25Fs0v7DcoFOd7No6mOf7jkXqPLV3rZfRUAr6ZHJcj/hY2JCEKcfD2gY+ZoaiHV03
 sQQb11Ijfdw5ieIvnIpToYTIDpMHHmwsER9odQirb64tfyn9Vfroiug6xbSEqCz5YnOq
 4hUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744616244; x=1745221044;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=epOflPPMn5sd54LuK8TeD9jvB1zpkeDQerq12nfOF1Q=;
 b=desU87002TyUnotyE8zXTfgP0CDwqN22m4Hrsicj+/hdhwG+tEyc3rFw2VAOiP4YHL
 LsnYylyFpQSRjPUtpekn8J+JD4aaCFtOI0ctH8AcDP998Jg9fsZ6TuaSLdbjqwx+/S2S
 KhHqn01uYqLhghWvkwMRQ9u6Vi6iec/wYJIMubCpve0mT9P7UVq4/s7s2pxC6nAxB7s0
 Ez97v2twVjrt38spycpcMN52Tt7wesxTShSs36s8rTeCMsY1WPVFEvVPyBOQIEFeE1MU
 S2w0WBBvJFZPCGk6X8zbnWvXdFRpXKqQhWaJivE4y5STQGb014wmkjBz4aEEMpFGQR8Q
 lZZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDALPFSU/qeTFfzeRlnsDqoUDlXoVdzugQuEfS64gEYmMAAZzv0q0dhuWofm+C1wHu2nRVbJT12Ro=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxk8KgAkf+yajfO3jr/zvkIXx7c5h40TA195Jjhm27cqcMduAsD
 4p8YVNxQYdbDET1D6Btmrnusc65hxcssQ0YigbKTWoDvbZ9nAddPtVcJB44TbpI=
X-Gm-Gg: ASbGncs3SHfcES0BJn7oJmFMTz29bWtsy+LnnybJCvXNmtLTfAnHCdRWWTvh0L8x3EP
 lHWQ3feigCABdGwRxX6dF69wvk+1TPSDVJ19LPY/CLr89LI0D2GrFb+vW32qlCfuS3RDOLCcDFE
 bv3GSuDTwV+swxFXN2rxQdPip/SfogwSTjRgonFdOgR+YRSbodE0inid/5GKbnvxeplMAlsch3H
 pNPhkzVB6EdDatnO7nbrBqIlqoXjMYxq0X/nQFUAVHzrEQaWS/QMTfXd6mAG8hX4LPQvAG7527A
 A2p0LFg38DdglIRe8a7G3bP7FVZ58dLkgDsYzntdzslwfXJdzqxaAhnsNUnM9aJC5RgaKnzrz6n
 dM5n7Z7KdZuSbaZYRrw==
X-Google-Smtp-Source: AGHT+IE30Q2IBg8vdQdMaK+lkm0TuOWEMeFPr4luM2VRd6nAtjAYz/RxT1+55R50LGFAcEjPktU29w==
X-Received: by 2002:a05:600c:384b:b0:43d:609:b305 with SMTP id
 5b1f17b1804b1-43f3a95aee6mr100167945e9.17.1744616244198; 
 Mon, 14 Apr 2025 00:37:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:bf8a:3473:5c13:9743?
 ([2a01:e0a:3d9:2080:bf8a:3473:5c13:9743])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae964048sm10193831f8f.2.2025.04.14.00.37.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 00:37:23 -0700 (PDT)
Message-ID: <07c6f893-1e46-4f18-95be-5519f1fe9c80@linaro.org>
Date: Mon, 14 Apr 2025 09:37:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/bridge: dw-hdmi: Avoid including uapi headers
To: Andy Yan <andyshrk@163.com>, lumag@kernel.org
Cc: cristian.ciocaltea@collabora.com, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 heiko@sntech.de, Andy Yan <andy.yan@rock-chips.com>
References: <20250314075754.539221-1-andyshrk@163.com>
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
In-Reply-To: <20250314075754.539221-1-andyshrk@163.com>
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

On 14/03/2025 08:57, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> It is not recommended for drivers to include UAPI header
> directly.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 0890add5f707..306e09a24a1c 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -22,8 +22,8 @@
>   
>   #include <media/cec-notifier.h>
>   
> -#include <uapi/linux/media-bus-format.h>
> -#include <uapi/linux/videodev2.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/videodev2.h>
>   
>   #include <drm/bridge/dw_hdmi.h>
>   #include <drm/display/drm_hdmi_helper.h>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
