Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3ED8577C9
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 09:38:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D8F10E42C;
	Fri, 16 Feb 2024 08:38:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="i5x/9QOJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2A010E42C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 08:38:28 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-511acd26c2bso2543281e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 00:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708072703; x=1708677503; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=Ngo+x1ISyMh3dIrNdqAUb75XtmSi0d4XUY9AETqB4qI=;
 b=i5x/9QOJDWAy7Nyy4YsHwTDlV8Fx4+kkYISfcHyEWsmMThuwGPQkiRZ0g6/GOm6tkX
 rL+CwvDcSdKdhQFzzbeTobRYhh++rHjBaNrliB5HhxfsLQu7SpdInzOjjLI/wZKRMdDS
 29jXFFNj7os2ksV2KOeWz4E/nzb2JNqP6HkNTsC+LF0DxdNLrD7pkQS7UrUBzosldx1p
 68dfwPmyozj3rdKfKKzafDe5RA0yShH+IeqXuTBrLdA+1rz3Lk9uXKL7hv6vZjkBmr1o
 ToEhiWRaDu1UDko7aLKZobUgquBys5gbgQ2CO92specI6KIrZFDAx6TPhp+JC63I1fit
 zANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708072703; x=1708677503;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Ngo+x1ISyMh3dIrNdqAUb75XtmSi0d4XUY9AETqB4qI=;
 b=MwCPDnl7gnNWI6OySikouizLNaBh/eVkOFs53rfW7J3fxCN9pEtt6kFF1jfjec4RXT
 xPpmD5u3kzrsv8fJ2mldS+N8bn0L6tfMSUS0mP4sRkM1APVW1Mx70JXe8ZHy/M3JJ7ei
 BLSgW0wXIIGnzvuCNyLbz2qIfY8vQisGZ2T0J6aDHYcO7p/x7Ts8GPckDboWsmfyPJ/w
 mhjgY5Bp9TS9z1uM9L369QTpGzn2nVI1xYOH47C9cx0yRewNOVbvfnEJsvMUNVGWn9+X
 2F6VDPbEYRvMbL1MDnDzmsE56HJVBfrLaUBMDIcPsQsOKmXlj6Kzl7hJ1o/GNyOFsTFy
 4+OA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/f3TH9m79vBA5pUGbOrjJZmURkrYoa2Fk7XsTlPi2umUHXkLESKfTn0aMGvq6iZa8iymZZ4tqG5ZxY2iP7rqp96Wh/k31532o40ZxYY+X
X-Gm-Message-State: AOJu0YyDGhooPYXZ0RCxXS1M2riX3JjtVD9X8Gd7IlKRyGnr0AJ/v/Gj
 tz45iRJ4KBiF9loOiHuW1if1YoOOOPoBaEttayFIo04YnTxmfGUdcOpz6bUwfQg=
X-Google-Smtp-Source: AGHT+IG0IqZfjgZJS4CNZqd7PPymI1uvvJj8A/XLg3FGcA9awMv4M/Z6g5sqhsU4QXf+mbUJCQvbLA==
X-Received: by 2002:a05:6512:4019:b0:512:8a9b:a960 with SMTP id
 br25-20020a056512401900b005128a9ba960mr2914808lfb.4.1708072703342; 
 Fri, 16 Feb 2024 00:38:23 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:814e:29c1:3729:78fa?
 ([2a01:e0a:982:cbb0:814e:29c1:3729:78fa])
 by smtp.gmail.com with ESMTPSA id
 ay33-20020a05600c1e2100b004124be777a7sm768741wmb.7.2024.02.16.00.38.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Feb 2024 00:38:22 -0800 (PST)
Message-ID: <6acd8776-cc59-496a-ad80-47613a8283a3@linaro.org>
Date: Fri, 16 Feb 2024 09:38:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/dp: Don't attempt AUX transfers when eDP panels are
 not powered
Content-Language: en-US, fr
To: Doug Anderson <dianders@chromium.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Johan Hovold <johan+linaro@kernel.org>
Cc: Jani Nikula <jani.nikula@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, dri-devel@lists.freedesktop.org,
 eizan@chromium.org, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Imre Deak <imre.deak@intel.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 linux-kernel@vger.kernel.org
References: <20240202141109.1.I24277520ac754ea538c9b14578edc94e1df11b48@changeid>
 <CAJMQK-it9YMod4rHKnACq4O-iaGieK2SN4x5vQ018CghsA631A@mail.gmail.com>
 <CAD=FV=VfuFrK1cSKA0maMzT5dxzKEzADqrd69fZKXuAGrU2rmA@mail.gmail.com>
 <87sf1u58k0.fsf@intel.com>
 <CAD=FV=XQdLm3PcjEd_g_dBJ9QO8zAJtj5nrXS9=cjC80+-Jbfg@mail.gmail.com>
 <cbcd981f-bd5d-477e-8482-d3414be17057@linaro.org>
 <CAD=FV=UtakQZ6OEKwERW5gNeAfS88EqkuQAHkrQoN=SicDG1JA@mail.gmail.com>
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
In-Reply-To: <CAD=FV=UtakQZ6OEKwERW5gNeAfS88EqkuQAHkrQoN=SicDG1JA@mail.gmail.com>
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

+ Bjorn
+ Konrad
+ Johan

On 15/02/2024 18:08, Doug Anderson wrote:
> Hi,
> 
> On Thu, Feb 15, 2024 at 8:53 AM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
>>
>> Hi Doug,
>>
>> On 15/02/2024 16:08, Doug Anderson wrote:
>>> Hi,
>>>
>>> On Thu, Feb 15, 2024 at 2:24 AM Jani Nikula <jani.nikula@intel.com> wrote:
>>>>
>>>> On Wed, 14 Feb 2024, Doug Anderson <dianders@chromium.org> wrote:
>>>>> Hi,
>>>>>
>>>>> On Tue, Feb 13, 2024 at 10:25 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>>>>>>
>>>>>> On Wed, Feb 14, 2024 at 2:23 PM Douglas Anderson <dianders@chromium.org> wrote:
>>>>>>>
>>>>>>> If an eDP panel is not powered on then any attempts to talk to it over
>>>>>>> the DP AUX channel will timeout. Unfortunately these attempts may be
>>>>>>> quite slow. Userspace can initiate these attempts either via a
>>>>>>> /dev/drm_dp_auxN device or via the created i2c device.
>>>>>>>
>>>>>>> Making the DP AUX drivers timeout faster is a difficult proposition.
>>>>>>> In theory we could just poll the panel's HPD line in the AUX transfer
>>>>>>> function and immediately return an error there. However, this is
>>>>>>> easier said than done. For one thing, there's no hard requirement to
>>>>>>> hook the HPD line up for eDP panels and it's OK to just delay a fixed
>>>>>>> amount. For another thing, the HPD line may not be fast to probe. On
>>>>>>> parade-ps8640 we need to wait for the bridge chip's firmware to boot
>>>>>>> before we can get the HPD line and this is a slow process.
>>>>>>>
>>>>>>> The fact that the transfers are taking so long to timeout is causing
>>>>>>> real problems. The open source fwupd daemon sometimes scans DP busses
>>>>>>> looking for devices whose firmware need updating. If it happens to
>>>>>>> scan while a panel is turned off this scan can take a long time. The
>>>>>>> fwupd daemon could try to be smarter and only scan when eDP panels are
>>>>>>> turned on, but we can also improve the behavior in the kernel.
>>>>>>>
>>>>>>> Let's let eDP panels drivers specify that a panel is turned off and
>>>>>>> then modify the common AUX transfer code not to attempt a transfer in
>>>>>>> this case.
>>>>>>>
>>>>>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>>>>>>> ---
>>>>>>
>>>>>> Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>
>>>>>
>>>>> Thanks for the review!
>>>>>
>>>>> Given that this touches core DRM code and that I never got
>>>>> confirmation that Jani's concerns were addressed with my previous
>>>>> response, I'm still going to wait a little while before applying. I'm
>>>>> on vacation for most of next week, but if there are no further replies
>>>>> between now and then I'll plan to apply this to "drm-misc-next" the
>>>>> week of Feb 26th. If someone else wants to apply this before I do then
>>>>> I certainly won't object. Jani: if you feel this needs more discussion
>>>>> or otherwise object to this patch landing then please yell. Likewise
>>>>> if anyone else in the community wants to throw in their opinion, feel
>>>>> free.
>>>>
>>>> Sorry for dropping the ball after my initial response. I simply have not
>>>> had the time to look into this.
>>>>
>>>> It would be great to get, say, drm-misc maintainer ack on this before
>>>> merging. It's not fair for me to stall this any longer, I'll trust their
>>>> judgement.
>>>>
>>>> Reasonable?
>>>
>>> I'd be more than happy for one of the drm-misc maintainers to Ack.
>>> I'll move Maxime, Thomas, and Maarten to the "To:" line to see if that
>>> helps get through their filters.
>>
>> I'll like some test reports to be sure it doesn't break anything,
>> then I'll be happy to give my ack !
> 
> Sounds good. I know Eizan (CCed, but also a ChromeOS person) was going
> to poke at it a bit and seemed willing to provide a Tested-by. I'll
> let him chime in.
> 
> ...but perhaps some better evidence that it's not breaking hardware is
> that we actually landed this into one (but not all) ChromeOS kernel
> trees [1] and it's rolled out to at least "beta" channel without
> anyone screaming. Normally we like things to land upstream before
> picking, but in this case we needed to land another patch to gather
> in-field data [2] that would have made the problem even worse.
> 
> The kernel tree we landed on was the v5.15 tree, which is currently
> serving all Qualcomm sc7180-based Chromebooks, all Mediatek 8173
> Chromebooks and all Mediatek 8186 Chromebooks. There are also a pile
> of x86 Chromebooks running our v5.15 kernel. This code shouldn't
> affect them because (unless I'm mistaken) they don't use the two
> affected panel drivers. In any case, I haven't heard any screams from
> them either. Given my landing plans of "the week of the 26th", this
> still gives another 1.5 weeks for any screams to reach my ears.
> 
> ...or are you looking for non-ChromeOS test reports? I'm not sure how
> to encourage those. I suppose sometimes folks at Red Hat end up
> stumbling over similar panel problems to those of us in ChromeOS.
> Maybe +Javier would be interested in providing a Tested-by?

Bjorn, Konrad, Johan,

Could one of you somehow try this on the X13s or other Laptop using eDP ?

Thanks,
Neil

> 
> [1] https://crrev.com/c/5277322
> [2] https://crrev.com/c/5277736

