Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB130C1EF04
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 09:18:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20FF010E91F;
	Thu, 30 Oct 2025 08:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ydZT1OYS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A39410E92A
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 08:18:47 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-47112a73785so5456815e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 01:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761812326; x=1762417126; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=n22jjnKTjPV+2WeoUAlwQeRGh9RPW9Sz0+Vh4tXt1qE=;
 b=ydZT1OYSJNxfkthNrsThNmPQg2ZWR+2dgrsk7s1eWZ29yqyYts9gSTFbKnweRJHaWe
 ruSfSY9twOLFaHV2AmDk7kh01YNVOtd/rkeXll4XnbVgRP4YzIClIgm9HhDS4YT3HHnJ
 rhn966mXyQLDZ3nqJHjPYawfum+hJPKy6qkHHwqLAWAIJr6TLUWqthlIdL7Ok/lAacd+
 /xfmTXizX9nJLDKmjJ5USDjVwaDfV7RGcoGOd6AVCVKtQryFky7sZq4vceKO5fCbfAkk
 hiIDrMUUWlaY39Z5yPunPbEMeKHoggc/eyYzg+rrjkPr7o6iyGqjMGOpvVCQysO98KgY
 cp9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761812326; x=1762417126;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=n22jjnKTjPV+2WeoUAlwQeRGh9RPW9Sz0+Vh4tXt1qE=;
 b=BuU8ZuR+Md3mevs8mlXStXmpnB5OpcIxl+wTRqqKev99NXbORQmvIqlMMoqfgGmAHn
 NiltXluZ4yRLIN8OV2k7yZjQJWIwR+VA1qK7RkleLVp5LEp7JenjZQRaqf3/OsvcVGsX
 +cJ+Kmmfc/pFwjyDNq8XKL9ABBShxHNRI5OqrU4qiNsgdSv4d4W19xpX2s27ogBPsWg9
 3No5hMi9oqkmwGT6cqXbM2xmBi34idsbQ5b7xhSKKzmAnxJMQyC4bo+UexE7AZKV+TlI
 S2J1wMy4wk4iF59PDpeqm70eHk8F4wD/C/ReDw/p7UNFIIWo/Si9YFj/nJhhCVmIYdyu
 F8Kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDvBnqmQha2IGaIC+mPIKdzDvKyWFAaCrY6rsHK19YMa90xJjcjrqP/rMqh1d9VcqG5rtZbQDVvVw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydYRajHRHdiBRubET00nImMOhBwOkq5g5pEPLaHSXU0gsNV3VD
 iopJ4xhNWPb/SaAYiJUiVFcLalP8/rfKOgTJgvWskoIaAdYkIeDu895mP2QC3MW803s=
X-Gm-Gg: ASbGncupyDnfRhnbF/1Dx+z9tzSJ7CEJyXjaimQ/eeZ/TNZFkdl/97H1d0KiRMt9fRb
 D0tngnOqFeGOKJlHLF2zdwaoNDm0sNTipZchOmScRyGPQGUOHvWi7GkrnZIecHuaI6frVMPSl1n
 gF0DPcb1TeOoLjnB7/YqaGN6Nnn2Lz86JyIuHs9OrgoDM5zmH67wiFVcW2bQOS3GT5cTYUVht2D
 e2IzmJ4xiwReX91ROOPgGR9br+8P6s2SeYe5I41Hdy+dbHX5HYKvIZfytFmyqcVBk1XUlI9ipQs
 YPzrPGjXyTUoS/uaYfDj0aZMoTsvI0JvuJhYnvRGkmGFKSeJIC789+A5GEbIorubc5N/6Xe/HWB
 sxkXLx2FH6mhvF+F84UWdUtK2oJMjeIbQ/zGSu7PZhZ/JtNBc3g3cQOk0o1I1whVxn8bTQVuinE
 RTEP/p/MCocLAC7Nja/vAe1ig+aLPT0R2w+V/emj5Xax8dnjQc7hBV
X-Google-Smtp-Source: AGHT+IEPEKlS1MXFKcHH4eUEEpj3CY6CH7IIM3l1El1nu+O9i5LhtMn2UPjpukubmdgPWNokkI299Q==
X-Received: by 2002:a05:600c:45c5:b0:46e:376c:b1f0 with SMTP id
 5b1f17b1804b1-4771e316cf4mr54045975e9.7.1761812325510; 
 Thu, 30 Oct 2025 01:18:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:3e45:b3e1:4bfc:5477?
 ([2a01:e0a:cad:2140:3e45:b3e1:4bfc:5477])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952db964sm30787325f8f.33.2025.10.30.01.18.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 01:18:45 -0700 (PDT)
Message-ID: <dc589c50-aa4c-4bbb-b481-b3a66fcba095@linaro.org>
Date: Thu, 30 Oct 2025 09:18:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] mailmap: Update Jessica Zhang's email address
To: Jessica Zhang <jesszhan0024@gmail.com>, lumag@kernel.org,
 robin.clark@oss.qualcomm.com
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20251029-mailmap-fix-v1-1-8534ffa12ed3@gmail.com>
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
In-Reply-To: <20251029-mailmap-fix-v1-1-8534ffa12ed3@gmail.com>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/30/25 07:31, Jessica Zhang wrote:
> Update mailmap to point to my current address
> 
> Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Jessica Zhang <jesszhan0024@gmail.com>
> ---
>   .mailmap | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/.mailmap b/.mailmap
> index b77cd34cf852..1c57bd649f04 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -352,7 +352,9 @@ Jesper Dangaard Brouer <hawk@kernel.org> <hawk@comx.dk>
>   Jesper Dangaard Brouer <hawk@kernel.org> <jbrouer@redhat.com>
>   Jesper Dangaard Brouer <hawk@kernel.org> <jdb@comx.dk>
>   Jesper Dangaard Brouer <hawk@kernel.org> <netoptimizer@brouer.com>
> -Jessica Zhang <quic_jesszhan@quicinc.com> <jesszhan@codeaurora.org>
> +Jessica Zhang <jesszhan0024@gmail.com> <jesszhan@codeaurora.org>
> +Jessica Zhang <jesszhan0024@gmail.com> <quic_jesszhan@quicinc.com>
> +Jessica Zhang <jesszhan0024@gmail.com> <jessica.zhang@oss.qualcomm.com>
>   Jilai Wang <quic_jilaiw@quicinc.com> <jilaiw@codeaurora.org>
>   Jiri Kosina <jikos@kernel.org> <jikos@jikos.cz>
>   Jiri Kosina <jikos@kernel.org> <jkosina@suse.cz>
> 
> ---
> base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63
> change-id: 20251028-mailmap-fix-50434c548816
> 
> Best regards,
> --
> Jessica Zhang <jesszhan0024@gmail.com>
> 

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
