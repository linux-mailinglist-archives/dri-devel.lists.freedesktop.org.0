Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 157A17A0028
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 11:35:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA9910E55F;
	Thu, 14 Sep 2023 09:35:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C8F10E55D
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 09:35:12 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-402c46c49f4so7500075e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 02:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694684111; x=1695288911; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=9FhJ1sGy4y/+Z8ONjEMe3hVaXvemdIm5qy9GzLVsayY=;
 b=cC/VjlxGgrcirhoWZFEpOStMzJzPWUhi37xLIO3Ap5Fnh9Nr6I77qWRVD4HUDSKEVF
 9wAKij7/TR0bNXVJspP4RUzWcATzZ9IoBH4mS9+1/Nwy9+C+TresqBhKlVs5QvfL25hG
 ovuwMEUv9aESWUueodUHSPVbosSKksBaQAr9behKYZUooF2bD/xMbHpIzlTC65ss/4H8
 u1IQb7yZqrWzjqFpdvb7zJ52Sh2Ytc+t1RTfO18bEdR1s6/e8cB1lt3b9vLEunvMWdTD
 Nl6ELu25WsHVNxCUHixBEu6G1rzms/qv8ILp7T0K3mBCu4LrQJGPbMat4MKJnGArfWV6
 WoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694684111; x=1695288911;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=9FhJ1sGy4y/+Z8ONjEMe3hVaXvemdIm5qy9GzLVsayY=;
 b=v68OOjvF22R+NnTNNzugFoecXYzvhInlZfI3je3ebNyOOxmBWoLFvDFtaOxG23WP2K
 U0btffRxL7xCoHNTU7FgJ988cWw9+7O8nFHFKX7m9hRn/Tvau71DtngR7oh5IS+KSwuV
 4dScONhCuhkpo/z2B7d9uRXcuGN+132b/XpebsNcw0RL+SXW3NFGtwYjhT/LgBC1C7jt
 UdD+WQsT8M9WFG/l5hlfbodQ6PVQf8Z3WQN1W0yXTnMAoYtfFvR0TYf7AA7iI+qS1Ps6
 JQOpwjDh4w/St8fqNJzV17FYJ2lPTb/I7FW6FjLC64vJUOlSDt2Pbj0P8xDe69BGMXg3
 1Lig==
X-Gm-Message-State: AOJu0YwxfL01Ok1TQidAK5aL8oEVA4EXCj2qMe579ZmGvuPLqHMABeXB
 OyYgUKOJw9xe1CY/ZTr4tqGQxQ==
X-Google-Smtp-Source: AGHT+IGxZUBhVQk9FHgk8XyNGCBShSep3s1GV5P7zurW0xt7n4dCC6T7+On9o/QMDO8ZQ0pqqVNsAQ==
X-Received: by 2002:a7b:c40d:0:b0:402:cc5c:c98 with SMTP id
 k13-20020a7bc40d000000b00402cc5c0c98mr4212236wmi.13.1694684110764; 
 Thu, 14 Sep 2023 02:35:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c61:ffb9:3ed9:c494?
 ([2a01:e0a:982:cbb0:c61:ffb9:3ed9:c494])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a1c7c0e000000b003fe2b081661sm4375014wmc.30.2023.09.14.02.35.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Sep 2023 02:35:10 -0700 (PDT)
Message-ID: <26e47780-d32d-42db-8fa7-71fed472ca29@linaro.org>
Date: Thu, 14 Sep 2023 11:35:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [RFC PATCH v1 01/12] Revert "drm/sysfs: Link DRM connectors to
 corresponding Type-C connectors"
Content-Language: en-US, fr
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <ZPh0Ps9UJ3HLzdeR@kuha.fi.intel.com>
 <CAA8EJpratbBybgk8woD3maA=J_HuQis44Unq0n+c_UvaFs__AA@mail.gmail.com>
 <ZPiAwOf00RREiYPr@kuha.fi.intel.com>
 <6b6bacee-f7b6-4cfe-be3d-24bda44bfbcf@linaro.org>
 <ZQBGD8CY5OVKYX63@kuha.fi.intel.com>
 <a97a33f4-71f3-4610-a59e-0c2d5ae86670@linaro.org>
 <ZQGAfnKt9HMB7j6H@kuha.fi.intel.com>
 <CAA8EJpqaipCT66x698R6dKDTSMk-D2iNHv8NSnMzPy-X_jFJ1Q@mail.gmail.com>
 <ZQG1zMbjWNLtx8lk@kuha.fi.intel.com>
 <CAA8EJprSH1jTa74c2P91SEC84eM8w=ACC4o2xM8t9eShvC9UeQ@mail.gmail.com>
 <ZQLRuNkNBghjKRca@kuha.fi.intel.com>
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
In-Reply-To: <ZQLRuNkNBghjKRca@kuha.fi.intel.com>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Janne Grunau <j@jannau.net>, Robert Foss <rfoss@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andy Gross <agross@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Won Chung <wonchung@google.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/09/2023 11:26, Heikki Krogerus wrote:
> Hi Dmitry,
> 
> On Wed, Sep 13, 2023 at 04:47:12PM +0300, Dmitry Baryshkov wrote:
>> On Wed, 13 Sept 2023 at 16:15, Heikki Krogerus
>> <heikki.krogerus@linux.intel.com> wrote:
>>>
>>> On Wed, Sep 13, 2023 at 01:26:14PM +0300, Dmitry Baryshkov wrote:
>>>> Hi Heikki,
>>>>
>>>> On Wed, 13 Sept 2023 at 12:27, Heikki Krogerus
>>>> <heikki.krogerus@linux.intel.com> wrote:
>>>>> On Tue, Sep 12, 2023 at 08:39:45PM +0300, Dmitry Baryshkov wrote:
>>>>>> On 12/09/2023 14:05, Heikki Krogerus wrote:
>>>>>>> On Tue, Sep 12, 2023 at 12:15:10AM +0300, Dmitry Baryshkov wrote:
>>>>>>>> On 06/09/2023 16:38, Heikki Krogerus wrote:
>>>>>>>>> On Wed, Sep 06, 2023 at 03:48:35PM +0300, Dmitry Baryshkov wrote:
>>>>>>>>>> On Wed, 6 Sept 2023 at 15:44, Heikki Krogerus
>>>>>>>>>> <heikki.krogerus@linux.intel.com> wrote:
>>>>>>>>>>>
>>>>>>>>>>> On Tue, Sep 05, 2023 at 01:56:59PM +0300, Dmitry Baryshkov wrote:
>>>>>>>>>>>> Hi Heikki,
>>>>>>>>>>>>
>>>>>>>>>>>> On Tue, 5 Sept 2023 at 11:50, Heikki Krogerus
>>>>>>>>>>>> <heikki.krogerus@linux.intel.com> wrote:
>>>>>>>>>>>>>
>>>>>>>>>>>>> Hi Dmitry,
>>>>>>>>>>>>>
>>>>>>>>>>>>> On Mon, Sep 04, 2023 at 12:41:39AM +0300, Dmitry Baryshkov wrote:
>>>>>>>>>>>>>> The kdev->fwnode pointer is never set in drm_sysfs_connector_add(), so
>>>>>>>>>>>>>> dev_fwnode() checks never succeed, making the respective commit NOP.
>>>>>>>>>>>>>
>>>>>>>>>>>>> That's not true. The dev->fwnode is assigned when the device is
>>>>>>>>>>>>> created on ACPI platforms automatically. If the drm_connector fwnode
>>>>>>>>>>>>> member is assigned before the device is registered, then that fwnode
>>>>>>>>>>>>> is assigned also to the device - see drm_connector_acpi_find_companion().
>>>>>>>>>>>>>
>>>>>>>>>>>>> But please note that even if drm_connector does not have anything in
>>>>>>>>>>>>> its fwnode member, the device may still be assigned fwnode, just based
>>>>>>>>>>>>> on some other logic (maybe in drivers/acpi/acpi_video.c?).
>>>>>>>>>>>>>
>>>>>>>>>>>>>> And if drm_sysfs_connector_add() is modified to set kdev->fwnode, it
>>>>>>>>>>>>>> breaks drivers already using components (as it was pointed at [1]),
>>>>>>>>>>>>>> resulting in a deadlock. Lockdep trace is provided below.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Granted these two issues, it seems impractical to fix this commit in any
>>>>>>>>>>>>>> sane way. Revert it instead.
>>>>>>>>>>>>>
>>>>>>>>>>>>> I think there is already user space stuff that relies on these links,
>>>>>>>>>>>>> so I'm not sure you can just remove them like that. If the component
>>>>>>>>>>>>> framework is not the correct tool here, then I think you need to
>>>>>>>>>>>>> suggest some other way of creating them.
>>>>>>>>>>>>
>>>>>>>>>>>> The issue (that was pointed out during review) is that having a
>>>>>>>>>>>> component code in the framework code can lead to lockups. With the
>>>>>>>>>>>> patch #2 in place (which is the only logical way to set kdev->fwnode
>>>>>>>>>>>> for non-ACPI systems) probing of drivers which use components and set
>>>>>>>>>>>> drm_connector::fwnode breaks immediately.
>>>>>>>>>>>>
>>>>>>>>>>>> Can we move the component part to the respective drivers? With the
>>>>>>>>>>>> patch 2 in place, connector->fwnode will be copied to the created
>>>>>>>>>>>> kdev's fwnode pointer.
>>>>>>>>>>>>
>>>>>>>>>>>> Another option might be to make this drm_sysfs component registration optional.
>>>>>>>>>>>
>>>>>>>>>>> You don't need to use the component framework at all if there is
>>>>>>>>>>> a better way of determining the connection between the DP and its
>>>>>>>>>>> Type-C connector (I'm assuming that that's what this series is about).
>>>>>>>>>>> You just need the symlinks, not the component.
>>>>>>>>>>
>>>>>>>>>> The problem is that right now this component registration has become
>>>>>>>>>> mandatory. And if I set the kdev->fwnode manually (like in the patch
>>>>>>>>>> 2), the kernel hangs inside the component code.
>>>>>>>>>> That's why I proposed to move the components to the place where they
>>>>>>>>>> are really necessary, e.g. i915 and amd drivers.
>>>>>>>>>
>>>>>>>>> So why can't we replace the component with the method you are
>>>>>>>>> proposing in this series of finding out the Type-C port also with
>>>>>>>>> i915, AMD, or whatever driver and platform (that's the only thing that
>>>>>>>>> component is used for)?
>>>>>>>>
>>>>>>>> The drm/msm driver uses drm_bridge for the pipeline (including the last DP
>>>>>>>> entry) and the drm_bridge_connector to create the connector. I think that
>>>>>>>> enabling i915 and AMD drivers to use drm_bridge fells out of scope for this
>>>>>>>> series.
>>>>>>>>
>>>>>>>>
>>>>>>>>> Determining the connection between a DP and its Type-C connector is
>>>>>>>>> starting to get really important, so ideally we have a common solution
>>>>>>>>> for that.
>>>>>>>>
>>>>>>>> Yes. This is what we have been discussing with Simon for quite some time on
>>>>>>>> #dri-devel.
>>>>>>>>
>>>>>>>> Unfortunately I think the solution that got merged was pretty much hastened
>>>>>>>> in instead of being well-thought. For example, it is also not always
>>>>>>>> possible to provide the drm_connector / typec_connector links (as you can
>>>>>>>> see from the patch7. Sometimes we can only express that this is a Type-C DP
>>>>>>>> connector, but we can not easily point it to the particular USB-C port.
>>>>>>>>
>>>>>>>> So, I'm not sure, how can we proceed here. Currently merged patch breaks
>>>>>>>> drm/msm if we even try to use it by setting kdef->fwnode to
>>>>>>>> drm_connector->fwnode. The pointed out `drivers/usb/typec/port-mapper.c` is
>>>>>>>> an ACPI-only thing, which is not expected to work in a non-ACPI cases.
>>>>>>>
>>>>>>> You really have to always supply not only the Type-C ports and partners,
>>>>>>> but also the alt modes. You need them, firstly to keep things sane
>>>>>>> inside kernel, but more importantly, so they are always exposed to the
>>>>>>> user space, AND, always the same way. We have ABIs for all this stuff,
>>>>>>> including the DP alt mode. Use them. No shortcuts.
>>>>>>>
>>>>>>> So here's what you need to do. UCSI does not seem to bring you
>>>>>>> anything useful, so just disable it for now. You don't need it. Your
>>>>>>> port driver is clearly drivers/soc/qcom/pmic_glink_altmode.c, so
>>>>>>> that's where you need to register all these components - the ports,
>>>>>>> partners and alt modes. You have all the needed information there.
>>>>>>
>>>>>> To make things even more complicate, UCSI is necessary for the USB part of
>>>>>> the story. It handles vbus and direction.
>>>>>>
>>>>>>> Only after you've done that we can start to look at how should the
>>>>>>> connection between the DPs and their USB Type-C connectors be handled.
>>>>>>
>>>>>> But sure enough, I can add typec port registration to the altmode driver.
>>>>>> This will solve the 'port not existing' part of the story.
>>>>>>
>>>>>> I'd like to hear your opinion on:
>>>>>>
>>>>>> - components. Using them breaks drm/msm. How can we proceed?
>>>>>
>>>>> I don't think replacing the components is going to be a problem once
>>>>> you have described everything properly in you DT. I'm fairly certain now
>>>>> that that is the main problem here. You don't have this connection
>>>>> described in your DT as it should.
>>>>
>>>> We have. See https://lore.kernel.org/linux-arm-msm/20230817145940.9887-1-dmitry.baryshkov@linaro.org/
>>>> (for non-PMIC-GLINK platform)
>>>> Or arch/arm64/boot/dts/qcom/sm8350-hdk.dts, which already has a full
>>>> description of USB-C connector and signal flow.
>>>>
>>>> In fact, thanks to this representation I can properly set
>>>> 'connector->fwnode' to point to the OF node corresponding to the
>>>> connector's drm_bridge. I can even propagate it to the kdef->fwnode /
>>>> kdev->of_node in drm_sysfs_connector_add(). But then a component_add()
>>>> call looks the kernel up.
>>>>
>>>> And to add on top of that, here is another reason why I think that
>>>> this sysfs links ABI/implementation was not well thought. The
>>>> typec_connector_ops are added to all fwnode-enabled connector devices.
>>>> It doesn't even bother checking that the device is really the DP
>>>> connector and that the device on the other side of fwnode link is a
>>>> typec port device. The symlink is named 'typec_connector', so one can
>>>> not easily extend this ABI to support SlimPort aka MyDP (which uses
>>>> micro-USB-B connectors instead of USB-C). Neither can we extend it to
>>>> represent MHL connections (again, micro-USB-B).
>>>>
>>>>>> - PATH property usage. This way we make USB-C DisplayPort behave like the
>>>>>> MST ports.
>>>>>
>>>>> That looks to me like an attempt to exploit a feature that is not
>>>>> designed for this purposes at all. Just drop all that.
>>>>
>>>> But why? From the docs: 'Connector path property to identify how this
>>>> sink is physically connected.'
>>>>
>>>> So far we have been using it for MST only. But the description above
>>>> also suits properly for the 'connected to the Type-C port0 device'
>>>> kind of data. Then the userspace can use this property to change the
>>>> representation of the controller. Or to rename it as it does for
>>>> DP-MST connectors. Or just add the USB-C icon in the UI.
>>>>
>>>> Having this data in sysfs only requires userspace first to map the
>>>> connector to the device under sysfs (which is not trivial since Xorg
>>>> renames DP-MST connectors), then to look for the symlink value. Quite
>>>> complicated compared to checking the DRM property.
>>>>
>>>> Moreover, once we get to the SlimPort / MyDP / MHL, we can extend the
>>>> schema to support 'microusb:something' values for this property.
>>>>
>>>>> The connection has to be first described in your DT, and the way you
>>>>> usually describe connections in DT is by using the device graph (OF
>>>>> graph). It seems that you have everything needed for that - the USB
>>>>> Type-C connectors have their own OF nodes (what you register as
>>>>> drm_bridges are in fact USB Type-C connectors), and presumable you
>>>>> also have OF nodes for all your video ports (DisplayPorts) - so
>>>>> applying the graph between the two really should not be a problem. The
>>>>> DP is endpoint for the USB Type-C connector, and vice versa.
>>>>
>>>> Not quite. There is no direct connection between the USB Type-C
>>>> connector and DP controller. The USB-C connector has three ports.
>>>>
>>>> port@0 goes to theHS-USB controller. This is simple.
>>>>
>>>> port@1 goes to the USB+DP PHY. All retimers and SS line muxes are
>>>> included in between. And it is the USB+DP PHY that is connected to the
>>>> DP and USB-SS controllers.
>>>>
>>>> port@2 goes to SBU lines mux (e.g. fsa4480).
>>>>
>>>>> After you have everything needed in your DT, the problem here isn't
>>>>> actually much of a problem at all. We will have options how to move
>>>>> forward after that.
>>>>
>>>> Could you please describe what is missing there?
>>>
>>> We are not after the direct connections here, we are after the final
>>> endpoints. So you are missing description of the logical connection
>>> between your DP and Type-C connector.
>>
>> Adding Krzysztof, as one of DT maintainers, to the CC list.
>>
>> >From what I understand, DT describes hardware. There is no description
>> for the 'logical' connections.
>>
>>>
>>> I understand that the idea is to build the graph to describe only the
>>> physical connections, but with just the physical connections you are
>>> doomed to write separate software solution for almost every single
>>> platform, even though the final endpoints are always the same (DP to
>>> Type-C). You just can not generalise the components (muxes, phys,
>>> retimers, etc.) behind USB Type-C connectors (or anything else for
>>> that matter), it's not possible. The components and their order vary
>>> on almost every single platform. On some platforms the stack of parts
>>> after the connector is also incredibly complex.
>>
>> Yes. And this is why we have a chain of DRM bridges, going from the DP
>> controller to the final drm_bridge at the Type-C port manager. When
>> there is the altmode event, it gets sent via this chain using the
>> normal DRM HPD event.
> 
> We will not have drm bridges between the thunderbolt controller and
> the connector, but you still need to be able to show the connector to
> the user when DisplayPort is tunneled over thunderbolt. DP alt mode is
> only one way of getting DisplayPort through USB Type-C. You just can't
> make any assumptions with USB Type-C.
> 
> The drm bridge chain could only solve the port/connector relationship
> problem from a single angle, but we need a common solution. The
> problem is after all completely generic. It is not DisplayPort
> specific or even USB Type-C specific problem. Those are just two of
> the many possible last endpoints for these connections that need to be
> aware of each other.
> 
> So we really have to have a common way of getting this straight from
> the hardware description somehow.
> 
> To me the obvious solution would be to just have a port in the graph
> that points directly the last endpoint regardless of what you have in
> between. But if that's not an option, then so be it. Then there just
> needs to be some other way of getting that information from DT.

The DT must describe the HW interconnection, this is what we do, but
we're allowed to parse it as we want and ignore the bridges/endpoint
between the connector node and the display node, all this is implementation.

We added intermediate bridge because they are part the displayport signal
chain, and they may need to react to the display enable/disable/check
if there's some limitations or init sequence in the retimer for example.

Neil

> 
> Maybe DT could use similar physical location object/attribute like
> ACPI - the DP would have matching physical location with its connector?
> 
>>> Having the logical final endpoint connection described in your DT/ACPI
>>> on top of the physical connections costs very little, but at the same
>>> time it's usually the only thing that the software needs (like in this
>>> case).
>>
>> Maybe there is some misunderstanding here. We have this connection. We
>> have connector->fwnode and connector->of_node pointing to the correct
>> device - the last bridge in the chain. Each TCPM driver knows the
>> relationship between the in-built drm_bridge and the Type-C port. The
>> DP host controller port can be terminated with other endpoints, e.g.
>> eDP panel. Or there can be a non-DP host, which is then connected
>> through a series of bridges to the eDP or external DP port. This is
>> what anx78xx bridge does: it converts the HDMI link into an external
>> DP (SlimPort) connection. Bridge chains permit this to be handled in a
>> seamless way.
>>
>> What you are asking for looks like a step backwards to me: it requires
>> the host to know that there is a USB-C connector.
>>
>>> So, either you add one more port to your graph for the DP to Type-C
>>> connection, or, if that's not an option, then you need to describe
>>> that connection in some other way. Named references work also quite
>>> well in my experience.
>>
>> Named references were considered and frowned upon by DT maintainers.
> 
> thanks,
> 

