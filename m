Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CECCDB58116
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 17:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2372610E2F4;
	Mon, 15 Sep 2025 15:44:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="eCxGMUj1";
	dkim=pass (1024-bit key; unprotected) header.d=amazonses.com header.i=@amazonses.com header.b="kZiEdtQO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 424 seconds by postgrey-1.36 at gabe;
 Mon, 15 Sep 2025 15:44:13 UTC
Received: from a7-32.smtp-out.eu-west-1.amazonses.com
 (a7-32.smtp-out.eu-west-1.amazonses.com [54.240.7.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5752C10E2F4
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 15:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=bc7lryepznv65m6r2ewkpoafjt4fiq42; d=collabora.com; t=1757950627;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=XwZDH+uh8waWq2YDQQpYgJ4QmH8sqmIHnek7vnSaYHE=;
 b=eCxGMUj1QBrVkqGD3Bh180G6qO7xt22V3Z1Ng1LdhTAjg1adSUMR2HtcKeB75/XF
 YH6CQCLR4h/ansxI7juCmUVt5SpNhGYG5En3mbK9+QCY4D1/KSifgpjP8fke8rfz08r
 by5kUy4/HwuZMLivZBLS8cPzZbsv/3wUMFoNqiFQbzQwGvtvooqHDlMPelU6MXa8Fn4
 44QMr71ZlRbojjL8EDkeNs2M7KQc1uup/CHF0k6Zl7gLsDGOmvP8fTkM65ujPLwKxOu
 XdY2FULB/SyUk+BblNaTA61845wqXTzP6dpO+2GzMve5PhrrYqBPtwOnrm5h/2lqw6f
 RmZUOZPbKg==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=ihchhvubuqgjsxyuhssfvqohv7z3u4hn; d=amazonses.com; t=1757950627;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
 bh=XwZDH+uh8waWq2YDQQpYgJ4QmH8sqmIHnek7vnSaYHE=;
 b=kZiEdtQODGKCeQLDpP6WjJUzFb7aVfiz1bkVFdKs9MmxvLWYZLs1JsRvmvZbWczx
 Lvxa0aOewhw6uEkHklyZjayeuP3SUsPHHeGjTXvdMPNjdBy8sOlmzMC1d0q7rcljdch
 ccFUwo5qa4XOcg8nAeA7GoZhx87omjcMzkyFs4UY=
Message-ID: <010201994e05ce63-85ad5afd-fc09-48fc-bd6e-f3716c8ba09f-000000@eu-west-1.amazonses.com>
Date: Mon, 15 Sep 2025 15:37:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/uapi: Indroduce a VRR Range Control Interface
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, 
 Chuanyu Tseng <Chuanyu.Tseng@amd.com>
Cc: harry.wentland@amd.com, Mario.Limonciello@amd.com, xaver.hugl@gmail.com, 
 victoria@system76.com, seanpaul@google.com, Sunpeng.Li@amd.com, 
 dri-devel@lists.freedesktop.org
References: <20250912073305.209777-1-Chuanyu.Tseng@amd.com>
 <010201993e2cb26f-089ce007-9e30-4b79-b487-c16c360309fd-000000@eu-west-1.amazonses.com>
 <d8694d69-62b3-4418-9fcb-d37c1daa1f9f@mailbox.org>
Content-Language: en-CA
From: Derek Foreman <derek.foreman@collabora.com>
In-Reply-To: <d8694d69-62b3-4418-9fcb-d37c1daa1f9f@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2025.09.15-54.240.7.32
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

On 9/15/25 5:01 AM, Michel Dänzer wrote:
> On 12.09.25 15:45, Derek Foreman wrote:
>> On 9/12/25 2:33 AM, Chuanyu Tseng wrote:
>>> Introduce a DRM interface for DRM clients to further restrict the
>>> VRR Range within the panel supported VRR range on a per-commit
>>> basis.
>>>
>>> The goal is to give DRM client the ability to do frame-doubling/
>>> ramping themselves, or to set lower static refresh rates for power
>>> savings.
>> I'm interested in limiting the range of VRR to enable HDMI's QMS/CinemaVRR features - ie: switching to a fixed rate for media playback without incurring screen blackouts/resyncs/"bonks" during the switch.
>>
>> I could see using an interface such as this to do the frame rate limiting, by setting the lower and upper bounds both to a media file's framerate. However for that use case it's not precise enough, as video may have a rate like 23.9760239... FPS.
>>
>> Would it be better to expose the limits as a numerator/denominator pair so a rate can be something like 24000/1001fps?
> I was thinking the properties could allow directly specifying the minimum and maximum number of total scanlines per refresh cycle, based on the assumption the driver needs to program something along those lines.

Surprisingly, this would also not be precise enough for exact media 
playback, as the exact intended framerate might not result in an integer 
number of scan lines. When that happens a QMS/CinemaVRR capable HDMI 
source is expected to periodically post a frame with a single extra scan 
line to minimize the error.

But I don't really know if these new properties are intended to express 
such a faux-constant rate (where the short term average rate is constant 
but frame to frame may be +1) , or if another new not-quite-orthogonal 
property would be required instead. Would I need a separate property for 
that?

>
>>> This is done through 2 new CRTC properties, along with a client
>>> cap. See the docstrings in patch for details.
> Not sure why a client cap would be needed for this. Not sure even a DRM_CAP is needed, the properties could simply be added only if the driver supports them.
>
>
>>> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
>>> index 272d6254ea47..dc4b50ff5fe0 100644
>>> --- a/drivers/gpu/drm/drm_connector.c
>>> +++ b/drivers/gpu/drm/drm_connector.c
>>> @@ -2866,6 +2866,31 @@ int drm_connector_attach_hdr_output_metadata_property(struct drm_connector *conn
>>>    }
>>>    EXPORT_SYMBOL(drm_connector_attach_hdr_output_metadata_property);
>>>    +/**
>>> + * drm_connector_attach_vrr_range_control_property - attach "VRR_RANGE_CONTROL_MIN" and
>>> + * "VRR_RANGE_CONTROL_MAX" property
>>> + *
>>> + * @connector: connector to attach the property on.
>>> + *
>>> + * This is used to allow the userspace to send VRR range control min and max value to the
>>> + * driver.
>>> + *
>>> + * Returns:
>>> + * Zero on success, negative errno on failure.
>>> + */
>>> +int drm_connector_attach_vrr_range_control_property(struct drm_connector *connector)
>>> +{
>>> +    struct drm_device *dev = connector->dev;
>>> +    struct drm_property *prop_min = dev->mode_config.prop_vrr_range_control_min;
>>> +    struct drm_property *prop_max = dev->mode_config.prop_vrr_range_control_max;
>>> +
>>> +    drm_object_attach_property(&connector->base, prop_min, 0);
>>> +    drm_object_attach_property(&connector->base, prop_max, 0);
>>> +
>>> +    return 0;
>>> +}
>>> +EXPORT_SYMBOL(drm_connector_attach_vrr_range_control_property);
> To me it would make more sense for these to be CRTC properties, same as VRR_ENABLED.
>
>
>>> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
>>> index 25f376869b3a..1f74284208c6 100644
>>> --- a/drivers/gpu/drm/drm_mode_config.c
>>> +++ b/drivers/gpu/drm/drm_mode_config.c
>>> @@ -340,6 +340,20 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
>>>            return -ENOMEM;
>>>        dev->mode_config.prop_vrr_enabled = prop;
>>>    +    prop = drm_property_create_range(dev,
>>> +            DRM_MODE_PROP_ATOMIC | DRM_MODE_PROP_RANGE,
>>> +            "VRR-RANGE-CONTROL-MIN", 0, UINT_MAX);
>>> +    if (!prop)
>>> +        return -ENOMEM;
>>> +    dev->mode_config.prop_vrr_range_control_min = prop;
>>> +
>>> +    prop = drm_property_create_range(dev,
>>> +            DRM_MODE_PROP_ATOMIC | DRM_MODE_PROP_RANGE,
>>> +            "VRR-RANGE-CONTROL-MAX", 0, UINT_MAX);
>>> +    if (!prop)
>>> +        return -ENOMEM;
>>> +    dev->mode_config.prop_vrr_range_control_max = prop;
> Property names use underscores, not dashes.
>
>
