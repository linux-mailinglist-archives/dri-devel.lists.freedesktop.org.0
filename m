Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 409D381C63D
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 09:10:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868A410E769;
	Fri, 22 Dec 2023 08:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E6010E770
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 08:09:59 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40c41b43e1eso19515175e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 00:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703232597; x=1703837397; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=1xKprI4ApsnVR9gU4stlnL3C1P3r+mVPb82XFlyptG8=;
 b=wgbbcD1WsoQCATs1DUBpU+3XrZkXYk6B6KceoID/KndCT6JAmM+3eXipRDsWkKg9TP
 O4b5D8Yne9HgohKTRgGpV2XD9VAjgnfwCaTL/SvCC32LD4+riYfU4AHuleIouqZQfXJm
 K4p2c8eWJR4Mjs9hImPqFQ83gCgIBllM+aYtNMMvP1OOQThm4THubz3KFN4aFWPbel2c
 9Lv7gYGzU7xuSsirMF/XOlfTcHYfMh6ZQr6tLMeNzunK8DLPf38nN4IPSwv2vrbHgBA1
 diUxiFhObwHC77TZJf+2j/YN2qsv20JTWZG/f33tx86g6w+SWQ+PerVn57ySZYQOJLXz
 NMlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703232597; x=1703837397;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=1xKprI4ApsnVR9gU4stlnL3C1P3r+mVPb82XFlyptG8=;
 b=NnKJsxQiqm+SHcRt3R3QQADlqPtsrZNS4bbZGR0Nmtxn1VZ9cZ1HuQOXY+Z2ML/QFe
 vfjs2q2h92fef42KWKPMqCW9M0FcUGr1cbNE1DduPw7WhdeSufJ8f7CC9PYNn9Mk/THF
 c9347ULgWm3ZnpJyDNSaFL+Ni1/jSOYTBoZL5OK5YH+gi8SyxZXjsnl5Eyb0XjWM8Lq+
 HeOYX/1dQ14eXA2MucrPsmF+nuPSCBLCcUgTpeTXwkz+H4HNUrHMD1/96Q+F5cnuBkpf
 mdecqRvwWQNffP34Zjcuc8tiWS+W8d4pHF/x3b75ihSlu0kqkp0JqnNtLAzuVI3A/033
 4NNA==
X-Gm-Message-State: AOJu0Yz+CYu/p7in0aXvtCtE5soDoPs2GD1nINJD/RxT+GrUUCSVowvB
 awYGvT2dvhGtMRoWP4sMEQQfZDUgnCmMSX2ztJ0nFZaowZuYQKZ1
X-Google-Smtp-Source: AGHT+IHHMSDStnxJOEA7UcW0fad8FbjbUhf65pjge9pIp05plYDNFPaDWwJ71tgyyO96Qj5in/wXaQ==
X-Received: by 2002:a05:600c:1615:b0:40c:6e31:9248 with SMTP id
 m21-20020a05600c161500b0040c6e319248mr465566wmn.4.1703232597453; 
 Fri, 22 Dec 2023 00:09:57 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:6d8d:fe46:4f99:9799?
 ([2a01:e0a:982:cbb0:6d8d:fe46:4f99:9799])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a05600c471000b0040c4886f254sm13725924wmo.13.2023.12.22.00.09.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Dec 2023 00:09:56 -0800 (PST)
Message-ID: <dcad8756-c723-4dc9-91db-a386a1b2824a@linaro.org>
Date: Fri, 22 Dec 2023 09:09:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/2] drm/bridge: start moving towards struct drm_edid
Content-Language: en-US, fr
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <cover.1698312534.git.jani.nikula@intel.com>
 <87jzqksg8g.fsf@intel.com> <87frzytml3.fsf@intel.com>
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
In-Reply-To: <87frzytml3.fsf@intel.com>
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

On 19/12/2023 13:15, Jani Nikula wrote:
> On Tue, 14 Nov 2023, Jani Nikula <jani.nikula@intel.com> wrote:
>> On Thu, 26 Oct 2023, Jani Nikula <jani.nikula@intel.com> wrote:
>>> This is just the first two patches of a lengthy series that I'm not
>>> really sure how to proceed with. Basically the series converts all of
>>> drm/bridge to the new struct drm_edid infrastructure. It's safer than
>>> struct edid, because it contains meta information about the allocated
>>> size of the EDID, instead of relying on the size (number of extensions)
>>> originating from outside of the kernel.
>>>
>>> The rest is at [1]. The commit messages are lacking, and I don't really
>>> have the toolchain to even build test most of it. But I think this is
>>> where drm/bridge should go. Among all of drm, I think bridge has the
>>> most uses of struct edid that do not originate from the drm_get_edid()
>>> family of functions, which means the validity checks are somewhat
>>> inconsistent, and having the meta information is more crucial.
>>>
>>> Bridge maintainers, please instruct how to best proceed with this.
>>
>> Ping.
> 
> Ping.

Sorry for the delay, I would have preferred changing the get_edid to return
a drm_edid, but I understand the task is too high, could you instead use
@get_drm_edid instead of @edid_read ?

And perhaps convert one very common bridge to this so we can validate
the change in CI.

Neil

> 
>>
>> The two patches posted here could be merged, to add something to build
>> the later commits on gradually.
>>
>> BR,
>> Jani.
>>
>>>
>>>
>>> Thanks,
>>> Jani.
>>>
>>>
>>>
>>> [1] https://gitlab.freedesktop.org/jani/linux/-/commits/drm-edid-bridge
>>>
>>>
>>>
>>> Jani Nikula (2):
>>>    drm/bridge: add ->edid_read hook and drm_bridge_edid_read()
>>>    drm/bridge: switch to drm_bridge_read_edid()
>>>
>>>   drivers/gpu/drm/drm_bridge.c           | 46 +++++++++++++++++++++++++-
>>>   drivers/gpu/drm/drm_bridge_connector.c | 16 ++++-----
>>>   include/drm/drm_bridge.h               | 33 ++++++++++++++++++
>>>   3 files changed, 86 insertions(+), 9 deletions(-)
> 

