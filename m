Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8418519A9
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 17:39:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3909810E7CA;
	Mon, 12 Feb 2024 16:39:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A1010E7CA
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 16:39:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 65BA260FF0;
 Mon, 12 Feb 2024 16:39:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C339C433C7;
 Mon, 12 Feb 2024 16:39:05 +0000 (UTC)
Message-ID: <0b3e31e6-34ae-46e3-a43d-bc4895542d8a@xs4all.nl>
Date: Mon, 12 Feb 2024 17:39:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/44] drm/connector: hdmi: Add Broadcast RGB property
Content-Language: en-US, nl
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>,
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20231207-kms-hdmi-connector-state-v5-8-6538e19d634d@kernel.org>
 <20240115143308.GA159345@toolbox> <20240115143720.GA160656@toolbox>
 <73peztbeeikb3fg6coxu3punxllgtyrmgco34tnxkojtsjbr3s@26bud3sjbcez>
 <Zb0M_2093UwPXK8y@intel.com>
 <hez2m57ogqx3yyqk45tzdkvxvhrbdepgm244i4m2aty2xhf5b5@acqgvmxhmmvr>
 <Zb0aYAapkxQ2kopt@intel.com>
 <zml6j27skvjmbrfyz7agy5waxajv4p4asbemeexelm3wuv4o7j@xkd2wvnxhbuc>
 <20240209203435.GB996172@toolbox>
 <ahfl6f72lpgpsbnrbgvbsh4db4npr2hh36kua2c6krh544hv5r@dndw4hz2mu2g>
 <Zco-DQaXqae7B1jt@intel.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <Zco-DQaXqae7B1jt@intel.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/02/2024 16:49, Ville Syrjälä wrote:
> On Mon, Feb 12, 2024 at 11:01:07AM +0100, Maxime Ripard wrote:
>> On Fri, Feb 09, 2024 at 09:34:35PM +0100, Sebastian Wick wrote:
>>> On Mon, Feb 05, 2024 at 10:39:38AM +0100, Maxime Ripard wrote:
>>>> On Fri, Feb 02, 2024 at 06:37:52PM +0200, Ville Syrjälä wrote:
>>>>> On Fri, Feb 02, 2024 at 04:59:30PM +0100, Maxime Ripard wrote:
>>>>>> On Fri, Feb 02, 2024 at 05:40:47PM +0200, Ville Syrjälä wrote:
>>>>>>> On Fri, Feb 02, 2024 at 02:01:39PM +0100, Maxime Ripard wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> On Mon, Jan 15, 2024 at 03:37:20PM +0100, Sebastian Wick wrote:
>>>>>>>>>>>  /**
>>>>>>>>>>>   * DOC: HDMI connector properties
>>>>>>>>>>>   *
>>>>>>>>>>> + * Broadcast RGB
>>>>>>>>>>> + *      Indicates the RGB Quantization Range (Full vs Limited) used.
>>>>>>>>>>> + *      Infoframes will be generated according to that value.
>>>>>>>>>>> + *
>>>>>>>>>>> + *      The value of this property can be one of the following:
>>>>>>>>>>> + *
>>>>>>>>>>> + *      Automatic:
>>>>>>>>>>> + *              RGB Range is selected automatically based on the mode
>>>>>>>>>>> + *              according to the HDMI specifications.
>>>>>>>>>>> + *
>>>>>>>>>>> + *      Full:
>>>>>>>>>>> + *              Full RGB Range is forced.
>>>>>>>>>>> + *
>>>>>>>>>>> + *      Limited 16:235:
>>>>>>>>>>> + *              Limited RGB Range is forced. Unlike the name suggests,
>>>>>>>>>>> + *              this works for any number of bits-per-component.
>>>>>>>>>>> + *
>>>>>>>>>>> + *      Drivers can set up this property by calling
>>>>>>>>>>> + *      drm_connector_attach_broadcast_rgb_property().
>>>>>>>>>>> + *
>>>>>>>>>>
>>>>>>>>>> This is a good time to document this in more detail. There might be two
>>>>>>>>>> different things being affected:
>>>>>>>>>>
>>>>>>>>>> 1. The signalling (InfoFrame/SDP/...)
>>>>>>>>>> 2. The color pipeline processing
>>>>>>>>>>
>>>>>>>>>> All values of Broadcast RGB always affect the color pipeline processing
>>>>>>>>>> such that a full-range input to the CRTC is converted to either full- or
>>>>>>>>>> limited-range, depending on what the monitor is supposed to accept.
>>>>>>>>>>
>>>>>>>>>> When automatic is selected, does that mean that there is no signalling,
>>>>>>>>>> or that the signalling matches what the monitor is supposed to accept
>>>>>>>>>> according to the spec? Also, is this really HDMI specific?
>>>>>>>>>>
>>>>>>>>>> When full or limited is selected and the monitor doesn't support the
>>>>>>>>>> signalling, what happens?
>>>>>>>>>
>>>>>>>>> Forgot to mention: user-space still has no control over RGB vs YCbCr on
>>>>>>>>> the cable, so is this only affecting RGB? If not, how does it affect
>>>>>>>>> YCbCr?
>>>>>>>>
>>>>>>>> So I dug a bit into both the i915 and vc4 drivers, and it looks like if
>>>>>>>> we're using a YCbCr format, i915 will always use a limited range while
>>>>>>>> vc4 will follow the value of the property.
>>>>>>>
>>>>>>> The property is literally called "Broadcast *RGB*".
>>>>>>> That should explain why it's only affecting RGB.
>>>>>>
>>>>>> Right. And the limited range option is called "Limited 16:235" despite
>>>>>> being usable on bpc > 8 bits. Naming errors occurs, and history happens
>>>>>> to make names inconsistent too, that's fine and not an argument in
>>>>>> itself.
>>>>>>
>>>>>>> Full range YCbCr is a much rarer beast so we've never bothered
>>>>>>> to enable it.
>>>>>>
>>>>>> vc4 supports it.
>>>>>
>>>>> Someone implemented it incorrectly then.
>>>>
>>>> Incorrectly according to what documentation / specification? I'm sorry,
>>>> but I find it super ironic that i915 gets to do its own thing, not
>>>> document any of it, and when people try to clean things up they get told
>>>> that we got it all wrong.
>>>
>>> FWIW, this was an i915 property and if another driver uses the same
>>> property name it must have the same behavior. Yes, it isn't standardized
>>> and yes, it's not documented (hence this effort here) but it's still on
>>> vc4 to make the property compatible.
>>
>> How is it not compatible? It's a superset of what i915 provides, but
>> it's strictly compatible with it.
> 
> No it is not. Eg. what happens if you set the thing to full range for
> RGB (which you must on many broken monitors), and then the kernel
> automagically switches to YCbCr (for whatever reason) but the monitor
> doesn't support full range YCbCr? Answer: you get crap output.

The Broadcast RGB setting is really specific to RGB output. That's where
you need it, since due to messed up standards in the past it is common to
have to override this.

For YCbCr it is not needed since it is always limited range in practice.
If there is ever a need to support full range YCbCr, then a new "Broadcast YCbCr"
setting should be created.

The only place were you see full range YCbCr being used is in combination with
JPEG codecs, since JPEG uses full range YCbCr. But it does not normally occur
on video output interfaces.

Regards,

	Hans

> 
>>
>> I would argue that i915 is the broken one since userspace could force a
>> full range output, but since the driver takes the YUV vs RGB decision
>> itself and only supports limited range for YUV, the driver would
>> effectively ignore that user-space property, without the user-space
>> being able to tell it was ignored in the first place.
>>
>>> Trying to make the property handle YCbCr is very much in the "let's try
>>> to fix the property" territory that I want to avoid, so I'm in favor of
>>> adjusting vc4.
>>
>> Breaking the ABI in the process. For something that is explicitly
>> supported by the spec, the driver, and the hardware. On a property that
>> never said it wasn't meant to be used that way, and with semantics based
>> on a driver that never provided a way to check those restrictions in the
>> first place.
>>
>> And it's not like i915 is going to use that code anyway.
>>
>> Maxime
> 
> 
> 

