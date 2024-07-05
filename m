Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9AB928655
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 12:04:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C649710E9C7;
	Fri,  5 Jul 2024 10:04:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZUqoyMTo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C6C10E9C7
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 10:04:31 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-424acf3226fso10586975e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2024 03:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720173870; x=1720778670; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=UbCAcXarF28AQprPLdMta3JF6IOVP+8+qFcSHwrGOMo=;
 b=ZUqoyMTo+TsCZ2EC/97Lb52V1glqcBLwQ+g3yzBVBtZGtYQRETsq9b78+S9wCWOosw
 cWjXbCKz0ojFyGcmxLVsWGybN87Xn4ujmORLPok40ZS3KIjCNcCI02X6l6pP0N70Lex9
 llenzAUx33VcDNfjlsdb+J4By3mpiMowDpxXQHGmhF0MzZbxXglPwIznQTwgT/qrt3/4
 C0Rd9eB/iiwUUUb6cNgG/9QjlPJMmBdZwFBkTPh3iQRNRjcVB0/kOpL83+fQr45EwOsf
 kaALt8mR6nlefTklzbrhJFpUHpQArzuGRZ46FU2Uzg/hsV3anf5VlbS/wu406zoD2WW6
 ptLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720173870; x=1720778670;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=UbCAcXarF28AQprPLdMta3JF6IOVP+8+qFcSHwrGOMo=;
 b=d7XBw8DbbdSqQGSX5tYIjuH+dRD5+Oqnvw93wjMPAGCKv5WZpeXiYMROOiPwI7wUn6
 0dy8uM8mtKuuViOeCBWLUD0s5C9//9aEahhBLE8M4LFwkKvJ/Azjy4IChemSxNKMIBx1
 QweFgVnARD+SF3E5yoddp/5O0+86/jfsb7FGbgmGV3PobQdX6xIczwPA+L1ZllXuedcb
 4lHasIKSnWDDdmIp4auxO8D2JUheEBLpF+sTakFQIItPD2nZm8hTYcKgdS9ljVLIMXiT
 IZRdbyVKcvdXYd4IxfwgDk8hVtpMCzIVqCrpp4ZvgcUBSNv2ftHIQAIVxhS+BSRE8sET
 uU2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnreYahKgpjZvYfa6RCKW8eajez0K8MKfAx0Im1B197lxQMouS01hZ4vlXoVdVwpG5wTPvzezpifnmNRXxblF7Aot3SojOdoKT30UKYB0W
X-Gm-Message-State: AOJu0YwuPJ4lt6YLXXKhqm+0yP40hjn2AN3jEkeMkupA+RMOugYw1HQz
 hpYgnohtbOZN86cNvBsZcYd+9NNyV22VBSUSTI6ZljqGNLgQeAgfD+q2lBudpt8=
X-Google-Smtp-Source: AGHT+IHbi2e7o5MJ57LqdFk1YRbNnDm6GdtbR0DxY6a9utZXNSBkFzBn5q73IFqENACWFO9t82KPoQ==
X-Received: by 2002:a05:600c:5116:b0:425:6851:8172 with SMTP id
 5b1f17b1804b1-4264a3d8045mr31874165e9.3.1720173869478; 
 Fri, 05 Jul 2024 03:04:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:9a73:20dd:5505:b164?
 ([2a01:e0a:982:cbb0:9a73:20dd:5505:b164])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a1d510bsm55867875e9.3.2024.07.05.03.04.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jul 2024 03:04:29 -0700 (PDT)
Message-ID: <78384e57-4139-47c9-ae5a-480c0d6b9daa@linaro.org>
Date: Fri, 5 Jul 2024 12:04:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 5/6] drm/sti: hdmi: drop driver owner assignment
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240330203831.87003-1-krzysztof.kozlowski@linaro.org>
 <20240330205722.93801-1-krzysztof.kozlowski@linaro.org>
 <20240527144700.GC713992@gnbcxd0016.gnb.st.com>
 <77b4e4ad-2b1e-4b6d-bc3b-0c7b339bc295@linaro.org>
 <f207b481-f530-4f54-a482-218908869050@linaro.org>
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
In-Reply-To: <f207b481-f530-4f54-a482-218908869050@linaro.org>
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

On 05/07/2024 11:59, Krzysztof Kozlowski wrote:
> On 04/06/2024 15:18, Krzysztof Kozlowski wrote:
>> On 27/05/2024 16:47, Alain Volmat wrote:
>>> Hi Krzysztof,
>>>
>>> thanks for your patch, sorry for the delay.
>>>
>>> On Sat, Mar 30, 2024 at 09:57:21PM +0100, Krzysztof Kozlowski wrote:
>>>> Core in platform_driver_register() already sets the .owner, so driver
>>>> does not need to.  Whatever is set here will be anyway overwritten by
>>>> main driver calling platform_driver_register().
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> ---
>>>>
>>>> I forgot two drivers.
>>>>   drivers/gpu/drm/sti/sti_hdmi.c | 1 -
>>>>   1 file changed, 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
>>>> index 500936d5743c..b0d84440a87b 100644
>>>> --- a/drivers/gpu/drm/sti/sti_hdmi.c
>>>> +++ b/drivers/gpu/drm/sti/sti_hdmi.c
>>>> @@ -1485,7 +1485,6 @@ static void sti_hdmi_remove(struct platform_device *pdev)
>>>>   struct platform_driver sti_hdmi_driver = {
>>>>   	.driver = {
>>>>   		.name = "sti-hdmi",
>>>> -		.owner = THIS_MODULE,
>>>>   		.of_match_table = hdmi_of_match,
>>>>   	},
>>>>   	.probe = sti_hdmi_probe,
>>>> -- 
>>>> 2.34.1
>>>>
>>>
>>> Acked-by: Alain Volmat <alain.volmat@foss.st.com>
>>
>> What does this ack mean? You are the maintainer, so what is supposed to
>> happen now? If maintainer does not take patches, then the DRM STI looks
>> orphaned.
> 
> +Cc Neil, Dmitry,
> 
> I pinged and pinged and wanted some sort of clarification here but one
> month passed and nothing was clarified.
> 
> I could be understanding the DRM process wrong, but if no one picks up
> trivial cleanups for 1.5 months, then to me subsystem is orphaned. I
> will send respective MAINTAINERS update.

Let's do that, if Alain doesn't take his own patches that were reviewed
then it should either be orphaned  or moved to drm-misc.

Neil

> 
> Best regards,
> Krzysztof
> 

