Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66134829E8D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 17:25:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB89610E77E;
	Wed, 10 Jan 2024 16:25:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A3AC10E77E
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 16:25:31 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40e5521dab6so10457565e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 08:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704903929; x=1705508729; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:from:content-language:subject:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=15bYShZuIS4+CSxAUIJl+wAlVTxXL5pj1PzzN1HPXTY=;
 b=iteOvhIgjhVnPuJlSq0ckDohhGmr5Mfn83mcGG8W8eqoM1AXhSgcEzznCzdpXLhVyI
 RMVbHYCxp6DCB47VofhNBpgzVsbQtMDU9xPP3m4F9L4L12JNpVEyOkTrcVqOkn9/dTEW
 geaC0gr3JQb92TsHSfcA1/tuEbqyytl+ko7PFqL78JeI7+v659BF2+MDl2Z9DKKbYkpV
 39NGMv4km+47WpsXIxhVDzltzTPkLEIliZGbfgeJcxdmrNdwobdk1TlmR4TWJTlFWuzF
 o/JWmSL9D3AMlEOqEwn5Yr40xNvow1TLyrBX5xSvRDhIGwWNJB2GbC95ixwbFYzSvfPb
 bs0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704903929; x=1705508729;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:from:content-language:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=15bYShZuIS4+CSxAUIJl+wAlVTxXL5pj1PzzN1HPXTY=;
 b=ERcojkVlrJTfxKz7dzlSyR+2mPAcOWPo23G7mHTBy3bAEVPU+Wup0Ucr3wy+3CujzQ
 EHK1VSgo517e41RiUf46WRM3hba6Ha2tYLW4+iR8CbpH3oOWo3GOLHfwUPBexM07IEVi
 vG/CivZB2EoMZ+VSi8bbXkTuJ5Qkckk7nTVXaAohmeSFLlErdXtBYN8IhJrlJFBxRhKI
 iuCwvze77HCRL/8OvCILEj861EfAVy/QjLUcB7E6YRlCwmGm/Pfb6vIBCrYGC79aaYIg
 cCaXHRbu1nQI3ZSxkMxC6oF1974D9qln305RBCvXjzqpoBnwlhtisrp4yMG6Rw9IrJHt
 MKnQ==
X-Gm-Message-State: AOJu0YyIXwaSM8+8rwue3ylyvY07cvdigm7aLMqLwQwtnq7JOii+TWcM
 5+Ksc2/r7kYKBaDwOz9M/ZKKvnpqpuwYcQ==
X-Google-Smtp-Source: AGHT+IE9PekVK0Th6y6bMR8dNTYSBDVpdQ3lSyTVffa/xd/PVDY0KvfpkbBq+lP11myDdjPGXoiZqw==
X-Received: by 2002:a05:600c:3eca:b0:40d:763d:c7fe with SMTP id
 ek10-20020a05600c3eca00b0040d763dc7femr742455wmb.121.1704903929423; 
 Wed, 10 Jan 2024 08:25:29 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5dee:51de:9349:2adf?
 ([2a01:e0a:982:cbb0:5dee:51de:9349:2adf])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a05600c154f00b0040e3b12052bsm2752200wmg.5.2024.01.10.08.25.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 08:25:29 -0800 (PST)
Message-ID: <39a224f2-b245-4766-88f6-3af856ae7acb@linaro.org>
Date: Wed, 10 Jan 2024 17:25:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/etnaviv: Expose a few more chipspecs to userspace
Content-Language: en-US, fr
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
References: <20240110153704.1364073-1-tomeu@tomeuvizoso.net>
 <170490387684.1887297.10058632363349793019.b4-ty@linaro.org>
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
In-Reply-To: <170490387684.1887297.10058632363349793019.b4-ty@linaro.org>
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
Cc: Christian Gmeiner <cgmeiner@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, etnaviv@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/01/2024 17:24, Neil Armstrong wrote:
> Hi,
> 
> On Wed, 10 Jan 2024 16:37:00 +0100, Tomeu Vizoso wrote:
>> These ones will be needed to make use fo the NN and TP units in the NPUs
>> based on Vivante IP.
>>
>>
> 
> Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.9/arm64-dt)
> 
> [1/2] drm/etnaviv: Expose a few more chipspecs to userspace
>        (no commit info)
> [2/2] arm64: dts: amlogic: meson-g12-common: Set the rates of the clocks for the NPU
>        https://git.kernel.org/amlogic/c/507b3e756ffcb174d383dd05df5084aed9bb6d14

To be clear, I only applied patch 2.

Neil

> 
> These changes has been applied on the intermediate git tree [1].
> 
> The v6.9/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
> for inclusion in their intermediate git branches in order to be sent to Linus during
> the next merge window, or sooner if it's a set of fixes.
> 
> In the cases of fixes, those will be merged in the current release candidate
> kernel and as soon they appear on the Linux master branch they will be
> backported to the previous Stable and Long-Stable kernels [2].
> 
> The intermediate git branches are merged daily in the linux-next tree [3],
> people are encouraged testing these pre-release kernels and report issues on the
> relevant mailing-lists.
> 
> If problems are discovered on those changes, please submit a signed-off-by revert
> patch followed by a corrective changeset.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> 

