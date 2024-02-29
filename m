Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FBC86C8BB
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 13:05:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B55F610E196;
	Thu, 29 Feb 2024 12:05:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=xs4all.nl header.i=@xs4all.nl header.b="PU6HuHjb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36ECF10E1CE
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 12:05:36 +0000 (UTC)
X-KPN-MessageId: bf691190-d6fa-11ee-89f4-005056abbe64
Received: from smtp.kpnmail.nl (unknown [10.31.155.37])
 by ewsoutbound.so.kpn.org (Halon) with ESMTPS
 id bf691190-d6fa-11ee-89f4-005056abbe64;
 Thu, 29 Feb 2024 13:04:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=xs4all01;
 h=content-type:from:to:subject:mime-version:date:message-id;
 bh=5gY9ETaPN8fYwsPOKJ/zT/pq9ka6LdbSh5Qwez/7vzY=;
 b=PU6HuHjbP9rQgtDxHizifNcJwn9WfZ+9w7cxzkBt2w3vi0Wef/h0uoTo7PJGCqe6f4p/d2lZSiK/a
 ipoXzQmjNgonehvWRTBpC3EDiGDI5LGK9HLIoYR/0IxkZlK53FQ3yiHSHPWihh+peew3F1wg57Liu6
 Y1jhEUIDMfqszR7rRWSwo6N/LxQog3ei5t0BRoFpu16zZXHVu7RaW52WIhvD0QTdzl/PHhgORTfVY/
 QhkoLCF2HBlYFmnmw2mg+xP43cHG8Yhtx8eijL6/6VnuOX+VOl99xI8iVeT+zo7gknOlYRJ5m9s6Wt
 a8caDvFX8lz7RjpH+VVV21jTe88foSg==
X-KPN-MID: 33|fGtkrYOMrwEEHKP0/6nXIOMvDXcyJf1j+AZnAAxz+NB1vb7BNxbuV8M2B8NdqEc
 iDii44uWqKXp+38rW60r7tWq85piD/0bQtb6elQLslwc=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|kSzAliLvQLFYVXm/AN4nAUpl5hu2Uv2QSxQ9flPYflXvgAXT8LRoaloYZftoZhO
 4konr+GxFQoEw007/sPx2hw==
X-Originating-IP: 173.38.220.58
Received: from [10.47.75.249] (unknown [173.38.220.58])
 by smtp.xs4all.nl (Halon) with ESMTPSA
 id d7320872-d6fa-11ee-a202-005056ab1411;
 Thu, 29 Feb 2024 13:05:34 +0100 (CET)
Message-ID: <e6c16850-50cf-442c-a854-15134e416954@xs4all.nl>
Date: Thu, 29 Feb 2024 13:05:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] media: v4l2-subdev: Add a pad variant of
 .query_dv_timings()
Content-Language: en-US
To: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>
Cc: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org,
 daniel@ffwll.ch, dinguyen@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 maarten.lankhorst@linux.intel.com, mchehab@kernel.org, mripard@kernel.org,
 robh+dt@kernel.org, tzimmermann@suse.de, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, chromeos-krk-upstreaming@google.com,
 ribalda@chromium.org
References: <20240221160215.484151-1-panikiel@google.com>
 <20240221160215.484151-2-panikiel@google.com>
 <ce262cda-84ba-4d8f-a916-76488c94066d@xs4all.nl>
 <CAM5zL5qrMNfyiXMOJHUzLySm_U2U8kbD=D_Cyn0WjkvpikiYpQ@mail.gmail.com>
 <03f65fbc-9cf8-4347-8277-e53cb01b00a5@xs4all.nl>
 <CAM5zL5r5JtA2HojaYZkSfUvoMTSNWALQM8HVuuXq-Znu7+TvGw@mail.gmail.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <CAM5zL5r5JtA2HojaYZkSfUvoMTSNWALQM8HVuuXq-Znu7+TvGw@mail.gmail.com>
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

On 2/29/24 12:33, Paweł Anikiel wrote:
> On Thu, Feb 29, 2024 at 9:02 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> On 28/02/2024 16:34, Paweł Anikiel wrote:
>>> On Wed, Feb 28, 2024 at 12:25 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>>>
>>>> Hi Paweł,
>>>>
>>>> On 21/02/2024 17:02, Paweł Anikiel wrote:
>>>>> Currently, .query_dv_timings() is defined as a video callback without
>>>>> a pad argument. This is a problem if the subdevice can have different
>>>>> dv timings for each pad (e.g. a DisplayPort receiver with multiple
>>>>> virtual channels).
>>>>>
>>>>> To solve this, add a pad variant of this callback which includes
>>>>> the pad number as an argument.
>>>>
>>>> So now we have two query_dv_timings ops: one for video ops, and one
>>>> for pad ops. That's not very maintainable. I would suggest switching
>>>> all current users of the video op over to the pad op.
>>>
>>> I agree it would be better if there was only one. However, I have some concerns:
>>> 1. Isn't there a problem with backwards compatibility? For example, an
>>> out-of-tree driver is likely to use this callback, which would break.
>>> I'm asking because I'm not familiar with how such API changes are
>>> handled.
>>
>> It's out of tree, so they will just have to adapt. That's how life is if
>> you are not part of the mainline kernel.
>>
>>> 2. If I do switch all current users to the pad op, I can't test those
>>> changes. Isn't that a problem?
>>
>> I can test one or two drivers, but in general I don't expect this to be
>> a problem.
>>
>>> 3. Would I need to get ACK from all the driver maintainers?
>>
>> CC the patches to the maintainers. Generally you will get back Acks from
>> some but not all maintainers, but that's OK. For changes affecting multiple
>> drivers you never reach 100% on that. I can review the remainder. The DV
>> Timings API is my expert area, so that shouldn't be a problem.
>>
>> A quick grep gives me these subdev drivers that implement it:
>>
>> adv748x, adv7604, adv7842, tc358743, tda1997x, tvp7002, gs1662.
>>
>> And these bridge drivers that call the subdevs:
>>
>> cobalt, rcar-vin, vpif_capture.
>>
>> The bridge drivers can use the following pad when calling query_dv_timings:
>>
>> cobalt: ADV76XX_PAD_HDMI_PORT_A
>> rcar_vin: vin->parallel.sink_pad
>> vpif_capture: 0
>>
>> The converted subdev drivers should check if the pad is an input pad.
>> Ideally it should check if the pad is equal to the current input pad
>> since most devices can only query the timings for the currently selected
>> input pad. But some older drivers predate the pad concept and they
>> ignore the pad value.
> 
> Thank you for the helpful info. I will switch all these drivers to the
> pad op, then. Would you like me to prepare a separate patchset, or
> should I include the changes in this one?

I think I prefer a separate patchset for this.

Regards,

	Hans
