Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B62D7F0D6B
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 09:23:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C93B10E167;
	Mon, 20 Nov 2023 08:23:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4777B10E167
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 08:23:30 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-32fadd4ad09so3052119f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 00:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700468608; x=1701073408; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=zDpNOA1ZQ6fgVY3fGVzzlkHvI60okoLt3vVAIeD7m/A=;
 b=XpjZS3AqOwEd3GJwGyxJ2GN4MrIDy3bmDAvbSvwx4HZDcWcYXG/v65L3Z3Ogn4tWaL
 2T4VP+Awz4fPRvQ9Oa3duablMbJv18AuacB0PStwG3R/0xA6q+4hfR9riTr0beEHVm17
 1s2VToWz6lA6deakef7974uEjSRa48uvIRv0WxaCFWB97/C9/mCHmcT2TWUyhBDT34+I
 CWNYitVNGYpy5Mo5K73f7VRi9ODsTBy6KcrF7m44Wog3HcSWULhVksQ2nD8MJvtRopV7
 lJSd2x3RQdMZWPu3W6j0RAWDABZvxZofsZRLcTj1SQsjOpjldmC8Uv9VtyRG2qCUg72Z
 KYcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700468608; x=1701073408;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=zDpNOA1ZQ6fgVY3fGVzzlkHvI60okoLt3vVAIeD7m/A=;
 b=IXd2MDSRAErIo92ObKmz338LgK2DFCX7lZedQ2Qr+Oc8UF7lYDYWBHuzdXvxmVoWRE
 hmz4LriMr+IeuTSWWPWPAildKz4R+L+YbHmV3rWUB7mjXbrBMxJTFI1HuXLE2N/Rx4JD
 P3uW0kxd0Snc2LkuViqqlmOcRwx4YpXObpnOsfqSqNDTmv0o74RsXCG7KHb1Ac88QOxr
 nfyaXtutL1cw+zjxkc7PAF2f4HThPrxY8qwRqHxvutsArCtGVWX4ei3/fGWTiXx0aCYR
 3WxUMkyw3iPn87w8AAve6h8vIssUcsTayVB4wTBshVaDlowvLtwBtTUv9ldNUXMUFIfc
 YAEw==
X-Gm-Message-State: AOJu0YwtnWtavxbYDh4cFgDEhljrejrd66+4q3ZdwB4/LkURFiIhOWej
 yNwNKuDS4IZEE0R4uPeG7lcXGw==
X-Google-Smtp-Source: AGHT+IFH+4hs9Z8rfoBt29ysYtj7bV3eaXTJxK7DQ6vcgHZMWl1u+nSsUp7PR9zPmvR/iRVE1l3B9w==
X-Received: by 2002:a05:6000:1209:b0:331:6945:dc33 with SMTP id
 e9-20020a056000120900b003316945dc33mr3959236wrx.58.1700468608620; 
 Mon, 20 Nov 2023 00:23:28 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:f04:f84b:d87d:1d06?
 ([2a01:e0a:982:cbb0:f04:f84b:d87d:1d06])
 by smtp.gmail.com with ESMTPSA id
 s11-20020adfe00b000000b0032ddc3b88e9sm10487286wrh.0.2023.11.20.00.23.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Nov 2023 00:23:28 -0800 (PST)
Message-ID: <58d71614-4be0-4b78-8169-d7e6399734b3@linaro.org>
Date: Mon, 20 Nov 2023 09:23:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 8/8] drm/bridge: it66121: Allow link this driver as a lib
Content-Language: en-US, fr
To: Sui Jingfeng <sui.jingfeng@linux.dev>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231114150130.497915-1-sui.jingfeng@linux.dev>
 <20231114150130.497915-9-sui.jingfeng@linux.dev>
 <CAA8EJprQq3aDhzE+yKGZ2-nsuHWcptzMvApsyOi9D63PgeiZ3w@mail.gmail.com>
 <1b59d647-c345-4260-b07b-22abb70ae17a@linux.dev>
 <CAA8EJppY2+ymX0kLY+cuR=SV1Po2J24r=NQecmb3ZhSE9NHG7Q@mail.gmail.com>
 <7b85d057-3d66-435a-a657-dd69067b6bef@linux.dev>
 <b9eacd91-8d6f-4265-931e-bc31cadd54d4@linux.dev>
 <CAA8EJpo1KhzTpaSqjbOuQvNKw4WGaqrtNBtNfdNLn28eZVgwhw@mail.gmail.com>
 <cf27d25a-3e51-4292-af63-37e5bc585d88@linux.dev>
 <CAA8EJprm6FL9_ZOr5uBXNXLBt=scs=FY2o6ZEv5r576iEM5KRw@mail.gmail.com>
 <aa4dd247-0eb1-4cda-9284-98da981bd3e1@linux.dev>
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
In-Reply-To: <aa4dd247-0eb1-4cda-9284-98da981bd3e1@linux.dev>
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phong LE <ple@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/11/2023 18:14, Sui Jingfeng wrote:
> Hi,
> 
> On 2023/11/17 17:03, Dmitry Baryshkov wrote:
>> On Fri, 17 Nov 2023 at 06:24, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>>> Hi,
>>>
>>> On 2023/11/16 23:23, Dmitry Baryshkov wrote:
>>>>>>> Then you will need some way (fwnode?) to
>>>>>>> discover the bridge chain. And at the last point you will get into the
>>>>>>> device data and/or properties business.
>>>>>>>
>>>>>> No, leave that chance to a more better programmer and forgive me please,
>>>>>> too difficult, I'm afraid of not able to solve. Thanks a lot for the
>>>>>> trust!
>>>>   From my point of view: no.
>>>
>>> I respect the fact that the community prefer generic mechanisms.
>>> If our approach is not what the community want, can I switch back
>>> to my previous solution? I can reduce the duplication of our
>>> localized it66121 driver to a minimal, rewrite it until it meets
>>> the community's requirement. I know our device looks weird and
>>> our approach is not elegant. But at the very least, we could not
>>> mess the community's design up by localize. Otherwise, I don't know
>>> what is the better approach to solve such a problem.
>>>
>>> Can I switch back or any other ideas?
>> I keep on repeating: create the i2c device from your root device
>> driver, which parses BIOS data.
>>
> This is not my own problems, currently it66121 (but not only) display bridge driver
> don't works on X86 either. What we are trying to do is to provide a generic, non-platform
> dependent solution. It is not only relevant to my driver. In fact, this series made
> no assumption which hardware/display controller will be the user.
> 
> I have investigated before respin this patch, there are other hardwares which
> ship the it66121 display bridge. For example, the Fresco Logic FL2000dx USB 3.0
> to VGA display adapter[1][2]. Even the windows have a driver.
> 
> [1] https://github.com/FrescoLogic/FL2000
> [2] https://oemdrivers.com/graphics-fresco-logic-fl2000

Switching to fwnodes, registering an i2c bus and generating fwnode data matching the
interconnect architecture is the way.

DRM Bridge transition to fwnode only should be done first, this will open bridge
to any architecture and device description (DT or ACPI).

Neil

> 

