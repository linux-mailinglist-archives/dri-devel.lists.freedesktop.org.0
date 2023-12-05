Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB47804C5D
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 09:30:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D0510E4AA;
	Tue,  5 Dec 2023 08:30:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF72E10E4AA
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 08:30:16 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40c09ba723eso24906885e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 00:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701765015; x=1702369815; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=+UITyNimW6NjgxBsrNVLcSnT1CZu1dSK21apn8J0ImE=;
 b=gaaUK4bFLlGvUoquc6IDjrzBIjNZSdtUL717I6XMI0PsCXzF5/IekOmHpO6nQdTzlC
 2VSVB0xUHxFViZ+MA5sI40kUwCj+mnp5+AbXHA32BleYAWnNQLVipM/KmNN0Iy5hShvp
 LLwFKPmTTAmXTtTzxqgW8KttyTtRpTcHDHafwmbimHnQTQ6zRDLXbjPU2cb1lRRV13v5
 oomJqPupYYXytCYTYQ8Y3cBt2h6UhkLYy2hrzll94hp5H8RppyD4myCP5E2kKSllFXUz
 7QESHuH+Z9G0T2Z24hjgjl4+/2lzVrygz9VjkaN0BrA4apF+UC+gYHpM8p74d0a/+no3
 DVHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701765015; x=1702369815;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=+UITyNimW6NjgxBsrNVLcSnT1CZu1dSK21apn8J0ImE=;
 b=lqWfzp3NRxHPOzBOHiIHJ8+wjrXX+j3upQNjvZ8stoQSOcxdmQzhvv/8ZgiU9JdIxX
 TfDbJ3CU/E03ZmUxlzWmUz20tp0CfRvMiLe0Krjj5glpAtKdgq1a1ldXiisEv8dvSW1b
 Awy26PEEXdQmYovGffxdDez3XIRK/n/LsbN3tMByiYhRsTip9KaS8foxgcZ0Tbz7Z0ht
 4831xceGdPrdmv3E99wwiOjcZ5K5M/f37VWXIxwbpqNxNL85gcL4E0jAJmNxRvufrJM8
 bSHDEjo8geQeOsmLQvw2HAex1rLPPzlzxkrJapW4NlDf8J52qFhHQR1sxpqpHQmCnkcW
 rOgQ==
X-Gm-Message-State: AOJu0Yz9p4EpnszUVsGcvHSOA9feGMzp1kqvnvEEATHpolWvSQxp/Ca/
 AjPE6TiwnHFiat/XK60DsqaZJQ==
X-Google-Smtp-Source: AGHT+IFazNlMJO2Phi4FOM2GZeBYIngyJd8JRcCm2L6tpEGnKSzGpmSVmHySB7ZAlkWUhw8FTawI1w==
X-Received: by 2002:a1c:770d:0:b0:40a:5c71:2c3e with SMTP id
 t13-20020a1c770d000000b0040a5c712c3emr216278wmi.19.1701765015146; 
 Tue, 05 Dec 2023 00:30:15 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4518:5e57:ff13:b4bb?
 ([2a01:e0a:982:cbb0:4518:5e57:ff13:b4bb])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a05600c4ed000b0040b47c53610sm17866225wmq.14.2023.12.05.00.30.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 00:30:14 -0800 (PST)
Message-ID: <9845c9ea-9121-436f-8185-95119a461127@linaro.org>
Date: Tue, 5 Dec 2023 09:30:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/bridge: nxp-ptn3460: fix i2c_master_send() error
 checking
Content-Language: en-US, fr
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <0cdc2dce-ca89-451a-9774-1482ab2f4762@moroto.mountain>
 <75c11af4-3f5e-4909-a3d3-8feea947d4ea@linaro.org>
 <bb28e859-215d-4279-bc7e-f601352d06df@suswa.mountain>
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
In-Reply-To: <bb28e859-215d-4279-bc7e-f601352d06df@suswa.mountain>
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
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/12/2023 17:59, Dan Carpenter wrote:
> On Mon, Dec 04, 2023 at 02:53:05PM +0100, Neil Armstrong wrote:
>> On 04/12/2023 13:29, Dan Carpenter wrote:
>>> The i2c_master_send/recv() functions return negative error codes or the
>>> number of bytes that were able to be sent/received.  This code has
>>> two problems.  1)  Instead of checking if all the bytes were sent or
>>> received, it checks that at least one byte was sent or received.
>>> 2) If there was a partial send/receive then we should return a negative
>>> error code but this code returns success.
>>>
>>> Fixes: a9fe713d7d45 ("drm/bridge: Add PTN3460 bridge driver")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>>> ---
>>> This is from static analysis and code review.  It's always a concern
>>> when you add stricter error handling that something will break.
>>>
>>>    drivers/gpu/drm/bridge/nxp-ptn3460.c | 10 +++++-----
>>>    1 file changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
>>> index d81920227a8a..9b7eb8c669c1 100644
>>> --- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
>>> +++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
>>> @@ -56,13 +56,13 @@ static int ptn3460_read_bytes(struct ptn3460_bridge *ptn_bridge, char addr,
>>>    	ret = i2c_master_send(ptn_bridge->client, &addr, 1);
>>>    	if (ret <= 0) {
>>>    		DRM_ERROR("Failed to send i2c command, ret=%d\n", ret);
>>> -		return ret;
>>> +		return ret ?: -EIO;
>>>    	}
>>>    	ret = i2c_master_recv(ptn_bridge->client, buf, len);
>>> -	if (ret <= 0) {
>>> +	if (ret != len) {
>>
>> This is impossible, i2c_transfer_buffer_flags() returns len as-is if no error, so
>> ret can only be negative or equal to len. The original code is right.
> 
> It works, but it's not "right".  The <= 0 could be changed to < 0.  The
> "len" variable is EDID_LENGTH (128).

So indeed, switching to < 0 is the most reasonable, no need to change the ret value in this case.

Neil

> 
> regards,
> dan carpenter
> 

