Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD995938E79
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 13:53:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D03A10E114;
	Mon, 22 Jul 2024 11:53:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ijqyC+bM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B13BA10E114
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 11:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721649202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O+uxYEy71BTLlKxVksIrikvEA78NJ0VV65h60HjI7v0=;
 b=ijqyC+bMl8/Jh9ckC6X8+FUzym4v6quN7XCb0YhXxv+b+9FCl1aNlwfPrGovijzvHAw4ur
 yLg81LuhpbyGRUOYlxWnnIk92IY6ykk4tNBn0Z+EP7LlyZy7/qqmcKgy8+rdZFMzC4wRGB
 B/T5r1fCCRHjxTomtxiDd9KduGBAGt4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-P_vvQuehOQKN0cLUx0Gtjw-1; Mon, 22 Jul 2024 07:53:21 -0400
X-MC-Unique: P_vvQuehOQKN0cLUx0Gtjw-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-a7a636c71daso40745966b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 04:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721649200; x=1722254000;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O+uxYEy71BTLlKxVksIrikvEA78NJ0VV65h60HjI7v0=;
 b=bihXvY8bHqm1C8u5iFL5MdA4ci5WSDvEdD8N5piG4ixgES+OeIzo9XqWxFjbOf1sNV
 //y+CPa8VozhWbU2LK2N4CJpm9BN/jFSh8LJMbO55t1pCm/wQE/PO4+DRLJxuy1UTtwB
 qm/Juh5RCB5Z/C+lqoxo6wPnKeygviq1qG+HXnAccP1xGaoyFHsLVn+H/2AFroJFKJMN
 +L7Ob3J7utQYOlXnLJkALh3E7yGz0V1JOvATN+UN8PEXwMBiBfzdPqJ0Cch8eni53hyh
 V1kk/JQh1Hqxh/ciK5B/tXbUl2txZRqPzSNwHTcjW0F3oyC/UJhDT/0NEhe/kCYeNl/I
 ifOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZIL7qQ/m++qaETd1Z352xdFu6dF1jTE578tCbg6JWGY7bHLrIC+1lzGvpdUcRIsRQq1FtcbuGZEX1vgP6XSLbut154GphZuLf8HokPYQV
X-Gm-Message-State: AOJu0YzrgUjCRFMx5+z6vHeXw4S9T39CK8Pl/CPWS0L/tlL6cOpsU9Ff
 tWb3Bort8sDi3D1XlFjsD9pZMLqYfAM7bnrRbXgXIqVs6MlSQyXUdU5Pp0VjJJ3qMNNRb6+EV4w
 PHy74228sQPEFPjwkKTmbIE9HaZABtIE9UCqNiLFqaZI4HFSqARl30vFg/ckORjcGZQ==
X-Received: by 2002:a50:8751:0:b0:5a1:a08a:e08 with SMTP id
 4fb4d7f45d1cf-5a478f6b6cdmr5059201a12.11.1721649200524; 
 Mon, 22 Jul 2024 04:53:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWLFS9risa/qC+0rtPi8Ua2sKubIVvp+XpXJo0PB3iyqeJXiq2MRmWL7gMq+Z4dZvNFf+BCw==
X-Received: by 2002:a50:8751:0:b0:5a1:a08a:e08 with SMTP id
 4fb4d7f45d1cf-5a478f6b6cdmr5059183a12.11.1721649200087; 
 Mon, 22 Jul 2024 04:53:20 -0700 (PDT)
Received: from [192.168.2.168] (business-90-187-152-45.pool2.vodafone-ip.de.
 [90.187.152.45]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a30c2f87d1sm6059698a12.70.2024.07.22.04.53.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 04:53:19 -0700 (PDT)
Message-ID: <d1d57a98-dcba-43d0-aa90-016c4f85a32f@redhat.com>
Date: Mon, 22 Jul 2024 13:53:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] drm: backlight quirk infrastructure and lower
 minimum for Framework AMD 13
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Matt Hartley <matt.hartley@gmail.com>, Kieran Levin <ktl@framework.net>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dustin Howett <dustin@howett.net>
References: <20240623-amdgpu-min-backlight-quirk-v2-0-cecf7f49da9b@weissschuh.net>
 <e61010e4-cb49-44d6-8f0d-044a193d29b2@redhat.com>
 <51f68b3b-dd21-44ef-8ec8-05bea5db6e55@t-8ch.de>
 <6db5abf9-cbdd-4ec0-b669-5df23de6c2ad@redhat.com>
 <a050aad4-d195-42e6-8a84-02170a4f9835@t-8ch.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <a050aad4-d195-42e6-8a84-02170a4f9835@t-8ch.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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

Hi Thomas,

On 7/20/24 9:31 AM, Thomas Weißschuh wrote:
> Hi Hans,
> 
> On 2024-07-18 10:25:18+0000, Hans de Goede wrote:
>> On 6/24/24 6:15 PM, Thomas Weißschuh wrote:
>>> On 2024-06-24 11:11:40+0000, Hans de Goede wrote:
>>>> On 6/23/24 10:51 AM, Thomas Weißschuh wrote:
>>>>> The value of "min_input_signal" returned from ATIF on a Framework AMD 13
>>>>> is "12". This leads to a fairly bright minimum display backlight.
>>>>>
>>>>> Add a generic quirk infrastructure for backlight configuration to
>>>>> override the settings provided by the firmware.
>>>>> Also add amdgpu as a user of that infrastructure and a quirk for the
>>>>> Framework 13 matte panel.
>>>>> Most likely this will also work for the glossy panel, but I can't test
>>>>> that.
>>>>>
>>>>> One solution would be a fixed firmware version, but given that the
>>>>> problem exists since the release of the hardware, it has been known for
>>>>> a month that the hardware can go lower and there was no acknowledgment
>>>>> from Framework in any way, I'd like to explore this alternative
>>>>> way forward.
>>>>
>>>> There are many panels where the brightness can go lower then the advertised
>>>> minimum brightness by the firmware (e.g. VBT for i915). For most users
>>>> the minimum brightness is fine, especially since going lower often may lead
>>>> to an unreadable screen when indoors (not in the full sun) during daylight
>>>> hours. And some users get confused by the unreadable screen and find it
>>>> hard to recover things from this state.
>>>
>>> There are a fair amount of complaints on the Framework forums about this.
>>> And that specific panel is actually readable even at 0% PWM.
>>
>> If a lot of Framework users are complaining about this, then maybe Framework
>> should fix their VBT in a BIOS update ?  That seems like a better solution
>> then quirking this in the kernel.
> 
> Framework has now stated that they will update the VBT for their 13' device. [0]
> It won't happen for the 16' one as its out of spec there, although it
> has been reported to work.
> 
> <snip>
> 
>>> From my experience with ThinkPads, the default brightness range there
>>> was fine for me. But on the Framework 13 AMD it is not.
>>>
>>>> So rather then quirking this, with the above mentioned disadvantages I believe
>>>> that it would be better to extend the existing video=eDP-1:.... kernel
>>>> commandline parsing to allow overriding the minimum brightness in a driver
>>>> agnostic way.
>>>
>>> I'm not a fan. It seems much too complicated for most users.
>>
>> Wanting lower minimum brightness really is mostly a power-user thing
>> and what is the right value is somewhat subjective and this is an often
>> heard complained. I really believe that the kernel should NOT get in
>> the business of adding quirks for this. OTOH given that this is an often
>> heard complaint having some generic mechanism to override the VBT value
>> would be good to have.
>>
>> As for this being too complicated, I fully agree that ideally things
>> should just work 100% OOTB, which is why I believe that a firmware fix
>> from Framework would be good. But when things do not work 100% adding
>> a kernel cmdline option is something which is regularly asked from users /
>> found in support questions on fora so I don't think this is overly
>> complicated. I agree it is not ideal but IMHO it is workable.
>>
>> E.g. on Fedora it would simply be a question of users having to run:
>>
>> sudo grubby --update-kernel=ALL --args="video=eDP-1:min-brightness=1"
>>
>> will add the passed in argument to all currently installed (and
>> future) kernels.
> 
> Thanks for taking the time for your explanations.
> I came around to agree with your proposal for a cmdline override.
> 
> What to you think about:
> 
> void drm_connector_get_cmdline_backlight_overrides(struct drm_connector *connector,
> 						   struct drm_backlight_override *overrides);
> 
> struct drm_backlight_override would look like
> struct drm_panel_backlight_quirk from this patch.

I'm not entirely convinced that we need the struct drm_backlight_override
abstraction right away. Maybe we can start with just a
drm_connector_get_cmdline_min_brightness_override() which just returns an int?

If you prefer to keep the struct drm_backlight_override that is fine too,
we can see what others think when you submit a new version for review.


>>> Some more background to the Framework 13 AMD case:
>>> The same panel on the Intel variant already goes darker.
>>> The last responses we got from Framework didn't indicate that the high
>>> minimum brightness was intentional [0], [1].
>>> Coincidentally the "12" returned from ATIF matches
>>> AMDGPU_DM_DEFAULT_MIN_BACKLIGHT, so maybe the firmware is just not set
>>> up completely.
>>
>> Right, so I think this should be investigated closer and then get
>> framework to issue a BIOS fix, not add a quirk mechanism to the kernel.
>>
>> IIRC the amdgpu driver will use AMDGPU_DM_DEFAULT_MIN_BACKLIGHT when
>> that setting is 0 in the VBT.
> 
> This is not my reading of the code.
> To me it seems "0" will be accepted, which is also why the second "fix"
> from [1] works.

I have not looked at that code i quite a while, so you're probably right.

Regards,

Hans

