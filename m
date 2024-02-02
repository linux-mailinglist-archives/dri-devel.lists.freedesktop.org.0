Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5141E846ECE
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 12:20:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CACF910F023;
	Fri,  2 Feb 2024 11:20:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5347410F023
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 11:20:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7A80962496;
 Fri,  2 Feb 2024 11:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DADD9C433C7;
 Fri,  2 Feb 2024 11:20:23 +0000 (UTC)
Message-ID: <c37e9225-3890-4f4d-b45c-919b907b184b@xs4all.nl>
Date: Fri, 2 Feb 2024 12:20:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/44] drm/connector: hdmi: Add Broadcast RGB property
Content-Language: en-US, nl
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 Samuel Holland <samuel@sholland.org>, Sandy Huang <hjc@rock-chips.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-doc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 David Airlie <airlied@gmail.com>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
 <20231207-kms-hdmi-connector-state-v5-8-6538e19d634d@kernel.org>
 <20240115143308.GA159345@toolbox> <874jerf7ot.fsf@intel.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <874jerf7ot.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/02/2024 12:04, Jani Nikula wrote:
> On Mon, 15 Jan 2024, Sebastian Wick <sebastian.wick@redhat.com> wrote:
>> On Thu, Dec 07, 2023 at 04:49:31PM +0100, Maxime Ripard wrote:
>>> The i915 driver has a property to force the RGB range of an HDMI output.
>>> The vc4 driver then implemented the same property with the same
>>> semantics. KWin has support for it, and a PR for mutter is also there to
>>> support it.
>>>
>>> Both drivers implementing the same property with the same semantics,
>>> plus the userspace having support for it, is proof enough that it's
>>> pretty much a de-facto standard now and we can provide helpers for it.
>>>
>>> Let's plumb it into the newly created HDMI connector.
>>>
>>> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> 
> [snip]
> 
>>> @@ -1655,6 +1678,26 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconnector_property);
>>>  /**
>>>   * DOC: HDMI connector properties
>>>   *
>>> + * Broadcast RGB
>>> + *      Indicates the RGB Quantization Range (Full vs Limited) used.
>>> + *      Infoframes will be generated according to that value.
>>> + *
>>> + *      The value of this property can be one of the following:
>>> + *
>>> + *      Automatic:
>>> + *              RGB Range is selected automatically based on the mode
>>> + *              according to the HDMI specifications.
>>> + *
>>> + *      Full:
>>> + *              Full RGB Range is forced.
>>> + *
>>> + *      Limited 16:235:
>>> + *              Limited RGB Range is forced. Unlike the name suggests,
>>> + *              this works for any number of bits-per-component.
>>> + *
>>> + *      Drivers can set up this property by calling
>>> + *      drm_connector_attach_broadcast_rgb_property().
>>> + *
>>
>> This is a good time to document this in more detail. There might be two
>> different things being affected:
>>
>> 1. The signalling (InfoFrame/SDP/...)
>> 2. The color pipeline processing
>>
>> All values of Broadcast RGB always affect the color pipeline processing
>> such that a full-range input to the CRTC is converted to either full- or
>> limited-range, depending on what the monitor is supposed to accept.
>>
>> When automatic is selected, does that mean that there is no signalling,
>> or that the signalling matches what the monitor is supposed to accept
>> according to the spec? Also, is this really HDMI specific?
> 
> Automatic is based on the mode as described in the specs
> below. Basically certain modes are expected to be broadcast range, and
> others full range.
> 
> I don't remember why we don't use the full range if the display
> indicates it supports selectable quantization range in Video
> Capabilities Data Block. It's quite possible there are displays that
> declare support but don't. Cc: Ville.

I have not seen such displays. Enabling RGB Selectable Quantization Range
is something that a vendor has to do explicitly, so it is reasonable to
expect that it works, otherwise there would be no point to that flag!

Transmitting full range if possible gives a better picture quality and
so is recommended.

> 
> - HDMI 1.4b section 6.6 Video Quantization Ranges
> 
> - HDMI 2.1 section 7.3 Video Quantization Ranges
> 
> - DP 2.1 (and earlier) section 5.1.1.1 Video Colorimetry
> 
> - CTA-861-H (and earlier) section 5.1 Default Encoding Parameters and
>   section 6.4.3 Quantization Range

Note that CTA-861-H deprecated the use of Default Range in the AVI
InfoFrame, instead the source should always signal limited or full range
in the Q field.

Regards,

	Hans

> 
>> When full or limited is selected and the monitor doesn't support the
>> signalling, what happens?
> 
> 1) Limited selected, display expects full, colors seem washed out.
> 
> 2) Full selected, display expects limited, black screen possible.
> 
> We receive the occasional bug report for 1, because there are displays
> that incorrectly expect full when spec says it should be limited. We
> reject the bug reports, because erring the other way can lead to black
> screens.
> 
> 
> BR,
> Jani.
> 
> 
> 

