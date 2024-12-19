Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F33B29F81FD
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 18:35:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE52610ED70;
	Thu, 19 Dec 2024 17:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IANavPCy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9983810ED70
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 17:34:58 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43635796b48so7177075e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 09:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734629697; x=1735234497; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=F9Q4C68e9yW8gyyBPkqZLZg7ZZOGLbvSB7afrJbR9o8=;
 b=IANavPCyiWHD2AqJhgAuI8C3Bb0DLVnKfsBqLSkZYR3jX0Cp65Q+R17s2w9AQvWK2X
 5zHXTDOkN9f6gzO9SDSKsoa7yqNtnbaAmEwWOGTOLN217Flzt8OGZ2GeuE9qIH8FTex0
 Ws4f+uRhkRMJM8pc1K8jlv0EF88LNmaT0sfMRjxyKxAPH5ACe5ZHVj+ZoasuDntzKjbN
 nJImz3MB7SqdzxC7InZTnNyR7ynG+TBqOmFjnuSD77y2pCypYPboO6RdWBGMUuBN14TK
 FXUgbOeXp6ch1J88mbaJV9zykJReeO8coqQIsdldxCkEHUmhApvzYa3auKMg5ISJy/YP
 tkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734629697; x=1735234497;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=F9Q4C68e9yW8gyyBPkqZLZg7ZZOGLbvSB7afrJbR9o8=;
 b=mTLAobQrNc5BvFhJR93F8XsNEcIfFC2kl9Fl3TuUQpkDbIsJmQ0FP5SRinSYF4iAiA
 oVf0WLG2dtFUAfhfhXuTHiRheVJhnEvDcEM95KoIaU4oMT9CPIaFpAKDAX3+1EJu3dX2
 jG4Ou7wyaeMGicftPCWshgGYwgOsG0lfa1mwlJjt81bTzogtgpZWpUq2r9s/IzWPDeuL
 hcoWcO7VGmueii6sKmb3eKdW9tZTZ/xm8aqdpOstJw47UKGiYfUgka6mpHvp/1hjBhnS
 qVXwpIFRV7GDw5b1ltpKMmDc+WLNjlSE5/3djGtesbRTMkxsbqdUitohNSwXN/QxnR+3
 DmDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXojyh6vulK1dLmZRXThqEMNlcxF2Mt8DBEvHWpP1+4X17syF2sTK5CB0qA1NyuTgU9N6qqiyWu+M8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyR3VGYIwAr3e9yB47ozvg/O8gBR9vrN1IokTxb8VX+uYBwFMq2
 8ff7gyPNe0rvzZ77ivAsTrnoSkQK5tOkwI7a08zPc7JRnofUmjuyHla4rjHj7/s=
X-Gm-Gg: ASbGnctttQS/KXmiErMApcCyrYjaO28IlzjPh2xt6sjdjM8mYgOqDOvQlY3Tz8DvOny
 qEt7ncjzkrJ3esb2yqJvORDDRVevwNpjz09Vqp10NElzV7mFac9BSaJ8QbryxgWQ4c2d+4sFqeV
 aLgiGW6IyU8K8wpZh4iASHxHp93ZB6Fn5KKJlaSEMIFEQcWATDtW8IgrtVAGjAdNCpxv024AqCD
 ze1LCgm8lq7OuSkGH1lWiyLwJnTc8HrHglhCS1otZQt6wE8NeuI2sSpCzc663BIn0V2lp0QOAa/
 xAvP2GpONAx0lJ+H/SXxgqMnb6MEmSdAtg==
X-Google-Smtp-Source: AGHT+IFbbqiRcM8kQ1G5cGnyM6An6nfZaiZ5DQIelNPVbDA8s6GSu8GoB7LW1ceTAqEtfl+GEFoXpw==
X-Received: by 2002:a05:600c:4f85:b0:434:ff08:202e with SMTP id
 5b1f17b1804b1-436630c620emr23031305e9.8.1734629697071; 
 Thu, 19 Dec 2024 09:34:57 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:a0fd:4342:76af:7533?
 ([2a01:e0a:982:cbb0:a0fd:4342:76af:7533])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c833280sm2039057f8f.40.2024.12.19.09.34.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Dec 2024 09:34:56 -0800 (PST)
Message-ID: <af005778-0309-4c38-885b-a5b7ee2d0128@linaro.org>
Date: Thu, 19 Dec 2024 18:34:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4] drm/msm/dpu1: don't choke on disabling the writeback
 connector
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Leonard Lausen <leonard@lausen.nl>,
 =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>,
 Johan Hovold <johan+linaro@kernel.org>
References: <20241209-dpu-fix-wb-v4-1-7fe93059f9e0@linaro.org>
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
In-Reply-To: <20241209-dpu-fix-wb-v4-1-7fe93059f9e0@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/12/2024 11:04, Dmitry Baryshkov wrote:
> During suspend/resume process all connectors are explicitly disabled and
> then reenabled. However resume fails because of the connector_status check:
> 
> [dpu error]connector not connected 3
> [drm:drm_mode_config_helper_resume [drm_kms_helper]] *ERROR* Failed to resume (-22)
> 
> It doesn't make sense to check for the Writeback connected status (and
> other drivers don't perform such check), so drop the check.
> 
> It wasn't a problem before the commit 71174f362d67 ("drm/msm/dpu: move
> writeback's atomic_check to dpu_writeback.c"), since encoder's
> atomic_check() is called under a different conditions that the
> connector's atomic_check() (e.g. it is not called if there is no
> connected CRTC or if the corresponding connector is not a part of the
> new state).
> 
> Fixes: 71174f362d67 ("drm/msm/dpu: move writeback's atomic_check to dpu_writeback.c")
> Cc: stable@vger.kernel.org
> Reported-by: Leonard Lausen <leonard@lausen.nl>
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/57
> Tested-by: Leonard Lausen <leonard@lausen.nl> # on sc7180 lazor
> Reported-by: György Kurucz <me@kuruczgy.com>
> Link: https://lore.kernel.org/all/b70a4d1d-f98f-4169-942c-cb9006a42b40@kuruczgy.com/
> Reported-by: Johan Hovold <johan+linaro@kernel.org>
> Link: https://lore.kernel.org/all/ZzyYI8KkWK36FfXf@hovoldconsulting.com/
> Tested-by: György Kurucz <me@kuruczgy.com>
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Leonard Lausen reported an issue with suspend/resume of the sc7180
> devices. Fix the WB atomic check, which caused the issue.
> ---
> Changes in v4:
> - Epanded commit message (Johan)
> - Link to v3: https://lore.kernel.org/r/20241208-dpu-fix-wb-v3-1-a1de69ce4a1b@linaro.org
> 
> Changes in v3:
> - Rebased on top of msm-fixes
> - Link to v2: https://lore.kernel.org/r/20240802-dpu-fix-wb-v2-0-7eac9eb8e895@linaro.org
> 
> Changes in v2:
> - Reworked the writeback to just drop the connector->status check.
> - Expanded commit message for the debugging patch.
> - Link to v1: https://lore.kernel.org/r/20240709-dpu-fix-wb-v1-0-448348bfd4cb@linaro.org
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> index 16f144cbc0c986ee266412223d9e605b01f9fb8c..8ff496082902b1ee713e806140f39b4730ed256a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> @@ -42,9 +42,6 @@ static int dpu_wb_conn_atomic_check(struct drm_connector *connector,
>   	if (!conn_state || !conn_state->connector) {
>   		DPU_ERROR("invalid connector state\n");
>   		return -EINVAL;
> -	} else if (conn_state->connector->status != connector_status_connected) {
> -		DPU_ERROR("connector not connected %d\n", conn_state->connector->status);
> -		return -EINVAL;
>   	}
>   
>   	crtc = conn_state->crtc;
> 
> ---
> base-commit: 86313a9cd152330c634b25d826a281c6a002eb77
> change-id: 20240709-dpu-fix-wb-6cd57e3eb182
> 
> Best regards,

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
