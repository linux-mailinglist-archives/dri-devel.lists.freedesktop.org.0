Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BA8881542
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 17:09:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC87910FB4A;
	Wed, 20 Mar 2024 16:09:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="l6jQFvLH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6996A10FB4A
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 16:09:48 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4140aadfe2eso30151915e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 09:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710950986; x=1711555786; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=Un+llHAoMrdFl+P+AaI+WdI4X8MRX2yHvC9/wPwSiTw=;
 b=l6jQFvLHL55M/9AID38LZ3sY036dJlIPLj1XSqiuHXkjGIJTK9hQuRz4dR4/+AssRQ
 oAnFcSqbO6NweH3barGsRXzzhB1caE90HI7v8cw21LyjBgDlE+knSs2qQGolgISxGIWO
 +YI5ozy+3hEl+3kDd2RXMaBLWB9AVsv+/j9O5OY2y4vFSZc+DYqdTvaIU+dfUhJjm1S+
 Pa7Y6qfpMcwGk3ByCxIydLcTEdW/oTbJHBAtkJ0dHGGDhaui+niA8anFLfZOhEza6Y3O
 lfb78GrTd1DUKc7rNmXoNDWxKpOopWjv/HGqclucYwztIOEcMrYOykPeUYVuttk3+WvW
 JqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710950986; x=1711555786;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Un+llHAoMrdFl+P+AaI+WdI4X8MRX2yHvC9/wPwSiTw=;
 b=l4ntrzGQQgw6WxdFL8z3OD8n+oDptnF8q1vJDf3+RYomo5L6tYEAsRy9VslE/o8oS0
 cieL/vwIXjyiUNjFnOH+y6Mgx8gGUPUvALXWnML3x6+ATZB1uXnwE8MikLmXiX1tpfkV
 2oYKCPEbCzDDkKTX87R5lCYhwufrdNtHaUtw9FRnVfl1xO4QjcgTYKoqaHRUdtVdZ62v
 r6IEUvO9A340eoA1IzdiMfZt5ej1JY9nJ9McZupAbthbMcj7N7VtbGLzdCJWfXvIJwoi
 fOW8J+z2a8giay5cw17eGglJJctiU6ac6oPaWllycJ6wpUNkQIYaWCd5KStYx8iEdtvP
 vGeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJUl+rHo/J41aPj6QLlKPMd1kQAX/GmQsVDQOeXKfupKWWSajA0fnwxt7N+GHHvjPPxKWoo3+mx1MAJzoDgHLBjGM+qnjxuUczNQtuYjmd
X-Gm-Message-State: AOJu0YzXd/D5wqk5pCOAqcAz8BDij+sPFGEUJcY3N/uAZ3Lc9g6YJuJk
 fI4ewZRllsH25dtOYWZ1pWZ/blI8I21CV/VLBN1aDVVjwK1/6b0GnXGWn9oJJPo=
X-Google-Smtp-Source: AGHT+IGwlgkNcQfHchLSVvAQXtFi8Dw1HoghSxCI8lwBRMqbAhnbx+HiiUQX1ndX7cQHgHU8Q0sWhg==
X-Received: by 2002:a05:600c:3c86:b0:414:286:fd1f with SMTP id
 bg6-20020a05600c3c8600b004140286fd1fmr9845788wmb.11.1710950986293; 
 Wed, 20 Mar 2024 09:09:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:13bb:18cc:75cc:ae59?
 ([2a01:e0a:982:cbb0:13bb:18cc:75cc:ae59])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a05600c0a5500b004146f728906sm686840wmq.7.2024.03.20.09.09.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 09:09:45 -0700 (PDT)
Message-ID: <dbdc34a0-bead-491e-a0fb-2f74416b7366@linaro.org>
Date: Wed, 20 Mar 2024 17:09:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: atna33xc20: Fix unbalanced regulator in the
 case HPD doesn't assert
To: Doug Anderson <dianders@chromium.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240313-homestarpanel-regulator-v1-1-b8e3a336da12@chromium.org>
 <098d8dda-75fe-45b8-ad36-a21ed44c4555@quicinc.com>
 <CAD=FV=WE4Y1Nk8UL+z7fLsU=zr-Y_2vQe0xuBSbg8_1CLRQjYQ@mail.gmail.com>
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
Organization: Linaro Developer Services
In-Reply-To: <CAD=FV=WE4Y1Nk8UL+z7fLsU=zr-Y_2vQe0xuBSbg8_1CLRQjYQ@mail.gmail.com>
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

On 20/03/2024 16:33, Doug Anderson wrote:
> Hi,
> 
> On Thu, Mar 14, 2024 at 3:32 PM Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>
>> On 3/13/2024 2:12 PM, Douglas Anderson via B4 Relay wrote:
>>> From: Douglas Anderson <dianders@chromium.org>
>>>
>>> When the atna33xc20 driver was first written the resume code never
>>> returned an error. If there was a problem waiting for HPD it just
>>> printed a warning and moved on. This changed in response to review
>>> feedback [1] on a future patch but I accidentally didn't account for
>>> rolling back the regulator enable in the error cases. Do so now.
>>>
>>> [1] https://lore.kernel.org/all/5f3cf3a6-1cc2-63e4-f76b-4ee686764705@linaro.org/
>>>
>>> Fixes: 3b5765df375c ("drm/panel: atna33xc20: Take advantage of wait_hpd_asserted() in struct drm_dp_aux")
>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>>> ---
>>>    drivers/gpu/drm/panel/panel-samsung-atna33xc20.c | 22 +++++++++++++---------
>>>    1 file changed, 13 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
>>> index 76c2a8f6718c..9c336c71562b 100644
>>> --- a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
>>> +++ b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
>>> @@ -109,19 +109,17 @@ static int atana33xc20_resume(struct device *dev)
>>>                if (hpd_asserted < 0)
>>>                        ret = hpd_asserted;
>>>
>>> -             if (ret)
>>> +             if (ret) {
>>>                        dev_warn(dev, "Error waiting for HPD GPIO: %d\n", ret);
>>> -
>>> -             return ret;
>>> -     }
>>> -
>>> -     if (p->aux->wait_hpd_asserted) {
>>> +                     goto error;
>>> +             }
>>> +     } else if (p->aux->wait_hpd_asserted) {
>>
>> Hi Doug,
>>
>> Acked-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> 
> Pushed with Jessica's Ack to drm-misc-next.
> 
> 5e842d55bad7 drm/panel: atna33xc20: Fix unbalanced regulator in the
> case HPD doesn't assert
> 
> I chose drm-misc-next instead of drm-misc-fixes because this isn't
> super urgent and the patch would have to be modified on drm-misc-fixes
> because we don't have commit 8df1ddb5bf11 ("drm/dp: Don't attempt AUX
> transfers when eDP panels are not powered") there.

Thx I wasn't really sure where to push this so I waited v6.9-rc1 to decide!
