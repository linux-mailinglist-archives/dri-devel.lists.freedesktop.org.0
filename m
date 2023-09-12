Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7B279D7C3
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 19:39:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0458910E0EA;
	Tue, 12 Sep 2023 17:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 546A210E0EA
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 17:39:49 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50091b91a83so9706958e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 10:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694540387; x=1695145187; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qfWN69mP00ualtZXK+0LNWzFxGf625lUtnnMX/7yIhI=;
 b=jPcQa3XwKDAQtpz/MM0lVUEHtWpQFtVX7W3XzWAXJqgAVbRVyjz1pJbdKlRTtW5mxJ
 SbxyOXHT47eJ+iIo5eh/Gqc1yhJf1f/Ju7Twooq8d3WCG+9uUEGvY1YiidiY/aNJNugH
 D43gX6/ODadkyJF9PJj/fv9o01YN3VS8gxc3IqoUBXTqfiIr8tbjJ8JAKBOsTIpWFM8F
 tEmLvY4P/KGMyLn+OTmusFERKAwBzQdRKAH7s4uROvf6wqSF3ITT/D3A1o08OMHhDkZM
 KNklEJjqwGS8Fv4TvU/oCtKbqL3vsrDY1LxfT6v2A4CzIzQ6uJ2gWC1ji8p/Z/c4S1I8
 N6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694540387; x=1695145187;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qfWN69mP00ualtZXK+0LNWzFxGf625lUtnnMX/7yIhI=;
 b=AkUxoUCYz7TQYMV2r13JM9JXu6ysn8kDP/FuxxXayFS329qLxSPb0pMlHP3cTOKeuH
 ih9Uu1xi6Q4ltIKVzAXpgEvIXbTPnYhTLxyXbBG2R8cmhofgRnzi6vCNrmuAs4b09PEA
 RhZdZoQwXMa9HOTgEFXVcVcqPwgUTqy7GB/RhvexSI5Q07wUSKjdunKYxYKB3Qbon7Z4
 LluBlUuC7ihhVIgt/rahggKQ8Gak16EGRuzAifLodsLEROhfR3bCA7WFcSF3RCa2BM2/
 cAKzWD2Us5RyDHqq0JLON22IrHpno/3NTv+gtOBoBGnlE9aYnZe61CvqZ1cKKVdGCIUj
 WPmQ==
X-Gm-Message-State: AOJu0YzElGnaoDDOe9xBhi43dWqbUsTD528QqW9lzGUM13I1ipH8pzIa
 IFHKxm8klchfp14j1pcibH/+7g==
X-Google-Smtp-Source: AGHT+IEQaseG2rf4Y8KarQ54blJ2LOjJc85S2m6s1jkQf4/FdTFjuHmSSpQAwZkzERZ3HZ5LfTcEjw==
X-Received: by 2002:a05:6512:3698:b0:501:bf30:714c with SMTP id
 d24-20020a056512369800b00501bf30714cmr163908lfs.24.1694540387403; 
 Tue, 12 Sep 2023 10:39:47 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u6-20020ac24c26000000b005008757cd6csm1828256lfq.241.2023.09.12.10.39.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Sep 2023 10:39:46 -0700 (PDT)
Message-ID: <a97a33f4-71f3-4610-a59e-0c2d5ae86670@linaro.org>
Date: Tue, 12 Sep 2023 20:39:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 01/12] Revert "drm/sysfs: Link DRM connectors to
 corresponding Type-C connectors"
Content-Language: en-GB
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
References: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
 <20230903214150.2877023-2-dmitry.baryshkov@linaro.org>
 <ZPbrtAlO2Y+bjDhf@kuha.fi.intel.com>
 <CAA8EJpqUg2-k7LLBL38RHU1sThkXB54ca68xEMd1yMnHQcQ++w@mail.gmail.com>
 <ZPh0Ps9UJ3HLzdeR@kuha.fi.intel.com>
 <CAA8EJpratbBybgk8woD3maA=J_HuQis44Unq0n+c_UvaFs__AA@mail.gmail.com>
 <ZPiAwOf00RREiYPr@kuha.fi.intel.com>
 <6b6bacee-f7b6-4cfe-be3d-24bda44bfbcf@linaro.org>
 <ZQBGD8CY5OVKYX63@kuha.fi.intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <ZQBGD8CY5OVKYX63@kuha.fi.intel.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Janne Grunau <j@jannau.net>,
 Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andy Gross <agross@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Won Chung <wonchung@google.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/09/2023 14:05, Heikki Krogerus wrote:
> On Tue, Sep 12, 2023 at 12:15:10AM +0300, Dmitry Baryshkov wrote:
>> On 06/09/2023 16:38, Heikki Krogerus wrote:
>>> On Wed, Sep 06, 2023 at 03:48:35PM +0300, Dmitry Baryshkov wrote:
>>>> On Wed, 6 Sept 2023 at 15:44, Heikki Krogerus
>>>> <heikki.krogerus@linux.intel.com> wrote:
>>>>>
>>>>> On Tue, Sep 05, 2023 at 01:56:59PM +0300, Dmitry Baryshkov wrote:
>>>>>> Hi Heikki,
>>>>>>
>>>>>> On Tue, 5 Sept 2023 at 11:50, Heikki Krogerus
>>>>>> <heikki.krogerus@linux.intel.com> wrote:
>>>>>>>
>>>>>>> Hi Dmitry,
>>>>>>>
>>>>>>> On Mon, Sep 04, 2023 at 12:41:39AM +0300, Dmitry Baryshkov wrote:
>>>>>>>> The kdev->fwnode pointer is never set in drm_sysfs_connector_add(), so
>>>>>>>> dev_fwnode() checks never succeed, making the respective commit NOP.
>>>>>>>
>>>>>>> That's not true. The dev->fwnode is assigned when the device is
>>>>>>> created on ACPI platforms automatically. If the drm_connector fwnode
>>>>>>> member is assigned before the device is registered, then that fwnode
>>>>>>> is assigned also to the device - see drm_connector_acpi_find_companion().
>>>>>>>
>>>>>>> But please note that even if drm_connector does not have anything in
>>>>>>> its fwnode member, the device may still be assigned fwnode, just based
>>>>>>> on some other logic (maybe in drivers/acpi/acpi_video.c?).
>>>>>>>
>>>>>>>> And if drm_sysfs_connector_add() is modified to set kdev->fwnode, it
>>>>>>>> breaks drivers already using components (as it was pointed at [1]),
>>>>>>>> resulting in a deadlock. Lockdep trace is provided below.
>>>>>>>>
>>>>>>>> Granted these two issues, it seems impractical to fix this commit in any
>>>>>>>> sane way. Revert it instead.
>>>>>>>
>>>>>>> I think there is already user space stuff that relies on these links,
>>>>>>> so I'm not sure you can just remove them like that. If the component
>>>>>>> framework is not the correct tool here, then I think you need to
>>>>>>> suggest some other way of creating them.
>>>>>>
>>>>>> The issue (that was pointed out during review) is that having a
>>>>>> component code in the framework code can lead to lockups. With the
>>>>>> patch #2 in place (which is the only logical way to set kdev->fwnode
>>>>>> for non-ACPI systems) probing of drivers which use components and set
>>>>>> drm_connector::fwnode breaks immediately.
>>>>>>
>>>>>> Can we move the component part to the respective drivers? With the
>>>>>> patch 2 in place, connector->fwnode will be copied to the created
>>>>>> kdev's fwnode pointer.
>>>>>>
>>>>>> Another option might be to make this drm_sysfs component registration optional.
>>>>>
>>>>> You don't need to use the component framework at all if there is
>>>>> a better way of determining the connection between the DP and its
>>>>> Type-C connector (I'm assuming that that's what this series is about).
>>>>> You just need the symlinks, not the component.
>>>>
>>>> The problem is that right now this component registration has become
>>>> mandatory. And if I set the kdev->fwnode manually (like in the patch
>>>> 2), the kernel hangs inside the component code.
>>>> That's why I proposed to move the components to the place where they
>>>> are really necessary, e.g. i915 and amd drivers.
>>>
>>> So why can't we replace the component with the method you are
>>> proposing in this series of finding out the Type-C port also with
>>> i915, AMD, or whatever driver and platform (that's the only thing that
>>> component is used for)?
>>
>> The drm/msm driver uses drm_bridge for the pipeline (including the last DP
>> entry) and the drm_bridge_connector to create the connector. I think that
>> enabling i915 and AMD drivers to use drm_bridge fells out of scope for this
>> series.
>>
>>
>>> Determining the connection between a DP and its Type-C connector is
>>> starting to get really important, so ideally we have a common solution
>>> for that.
>>
>> Yes. This is what we have been discussing with Simon for quite some time on
>> #dri-devel.
>>
>> Unfortunately I think the solution that got merged was pretty much hastened
>> in instead of being well-thought. For example, it is also not always
>> possible to provide the drm_connector / typec_connector links (as you can
>> see from the patch7. Sometimes we can only express that this is a Type-C DP
>> connector, but we can not easily point it to the particular USB-C port.
>>
>> So, I'm not sure, how can we proceed here. Currently merged patch breaks
>> drm/msm if we even try to use it by setting kdef->fwnode to
>> drm_connector->fwnode. The pointed out `drivers/usb/typec/port-mapper.c` is
>> an ACPI-only thing, which is not expected to work in a non-ACPI cases.
> 
> You really have to always supply not only the Type-C ports and partners,
> but also the alt modes. You need them, firstly to keep things sane
> inside kernel, but more importantly, so they are always exposed to the
> user space, AND, always the same way. We have ABIs for all this stuff,
> including the DP alt mode. Use them. No shortcuts.
> 
> So here's what you need to do. UCSI does not seem to bring you
> anything useful, so just disable it for now. You don't need it. Your
> port driver is clearly drivers/soc/qcom/pmic_glink_altmode.c, so
> that's where you need to register all these components - the ports,
> partners and alt modes. You have all the needed information there.

To make things even more complicate, UCSI is necessary for the USB part 
of the story. It handles vbus and direction.

> Only after you've done that we can start to look at how should the
> connection between the DPs and their USB Type-C connectors be handled.

But sure enough, I can add typec port registration to the altmode 
driver. This will solve the 'port not existing' part of the story.

I'd like to hear your opinion on:

- components. Using them breaks drm/msm. How can we proceed?

- PATH property usage. This way we make USB-C DisplayPort behave like 
the MST ports.

-- 
With best wishes
Dmitry

