Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6139349D6
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 10:25:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC60E10E08F;
	Thu, 18 Jul 2024 08:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Rl/UXerj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B87C10E5DA
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 08:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721291124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F1svtcDGv9GPXqhPvf/wZn92njhXKe/iKQ0fD18vtZo=;
 b=Rl/UXerj0dFycX7GVRJBwxYnffGq8IlskHZwTwj3SQTtr0Op2L2PSF0WqqEx6YzFpXIiXo
 +ZdbNNigbHl5f9zTC8TrbjmLHd/kYIYllKaHcSKnGdhO6FYk7yaPr0cp7//DTLjGvHRgYM
 fYHIT+d707ODogZFQlgPD+5BWKws/5w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-sHovsqPlNoK6jU-p2GCZyA-1; Thu, 18 Jul 2024 04:25:23 -0400
X-MC-Unique: sHovsqPlNoK6jU-p2GCZyA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-427b7a2052bso399715e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 01:25:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721291121; x=1721895921;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F1svtcDGv9GPXqhPvf/wZn92njhXKe/iKQ0fD18vtZo=;
 b=bTAvJvuZVtRsi9GQIKxucpY43TAy4mYqS/xW0MC7zTEjjRwfNBmqm3CmsNoGRZlLff
 9OAEpsNI3a0reDTOE2aoxTm/9t9r86NZIqBFUYHY76mH0U/Z9rlcS1ip5bAlZomsk3uB
 zwcqxfb8ZMfuDFAYM8v1jWdnlgAK1dc17862uZ8llEDqiWTdmkA52w+YIGSAgUmhH7d+
 RUUQg0L2mNh9ptN4jSH6u3tG4hkOqlB0rzNQ9n3AgX7OUSKhUoz8uBWFOZC0A0GquQNY
 +WHf2jybs6F9eQJAXO9tZslrnlTIZKre2An69DvcGLtVGse+Tk8z6Uhk0g9aaOKD7/38
 0bxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWj5OxmO0kzMCv977gy+/t6uhOFYlsPZnIJ64gSCXTEfGG6EvcCpnZ0hn9bLt11KU/4EehHVBianZ9wVBf5wiDB7KyTLq6tajjrT4zlm9ti
X-Gm-Message-State: AOJu0YwFZL8Rix+2knAbLfxLPgyumx+n1b/wGIf4fvTKR05dN2ZkSUEc
 2Py7q9bWmUypKumN9whfWe7PyK5VK8UbNSHP9yR2BLsg51OLOnfT59TeMF8sOtuitIx/hxl5fss
 xmOVA1BQ+Lo1NboQre9DQX41uv5yTM33NIWjHoHpDL4xE0A7xt5ep005N5cVSMl4UVg==
X-Received: by 2002:a05:600c:4455:b0:426:5d4d:d759 with SMTP id
 5b1f17b1804b1-427c2d01fa0mr35302145e9.24.1721291121598; 
 Thu, 18 Jul 2024 01:25:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDQmOs05h3TMeUCsJAeQ6XUVxagcN1TKeIjWXjqi79nkjJ+F5PJFWZ0k0Ne+JuEETUnDjJMg==
X-Received: by 2002:a05:600c:4455:b0:426:5d4d:d759 with SMTP id
 5b1f17b1804b1-427c2d01fa0mr35301835e9.24.1721291121154; 
 Thu, 18 Jul 2024 01:25:21 -0700 (PDT)
Received: from [172.18.228.53] (ip-185-104-138-47.ptr.icomera.net.
 [185.104.138.47]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a43034sm2201335e9.3.2024.07.18.01.25.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 01:25:20 -0700 (PDT)
Message-ID: <6db5abf9-cbdd-4ec0-b669-5df23de6c2ad@redhat.com>
Date: Thu, 18 Jul 2024 10:25:18 +0200
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
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <51f68b3b-dd21-44ef-8ec8-05bea5db6e55@t-8ch.de>
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

On 6/24/24 6:15 PM, Thomas Weißschuh wrote:
> Hi Hans!
> 
> thanks for your feedback!
> 
> On 2024-06-24 11:11:40+0000, Hans de Goede wrote:
>> On 6/23/24 10:51 AM, Thomas Weißschuh wrote:
>>> The value of "min_input_signal" returned from ATIF on a Framework AMD 13
>>> is "12". This leads to a fairly bright minimum display backlight.
>>>
>>> Add a generic quirk infrastructure for backlight configuration to
>>> override the settings provided by the firmware.
>>> Also add amdgpu as a user of that infrastructure and a quirk for the
>>> Framework 13 matte panel.
>>> Most likely this will also work for the glossy panel, but I can't test
>>> that.
>>>
>>> One solution would be a fixed firmware version, but given that the
>>> problem exists since the release of the hardware, it has been known for
>>> a month that the hardware can go lower and there was no acknowledgment
>>> from Framework in any way, I'd like to explore this alternative
>>> way forward.
>>
>> There are many panels where the brightness can go lower then the advertised
>> minimum brightness by the firmware (e.g. VBT for i915). For most users
>> the minimum brightness is fine, especially since going lower often may lead
>> to an unreadable screen when indoors (not in the full sun) during daylight
>> hours. And some users get confused by the unreadable screen and find it
>> hard to recover things from this state.
> 
> There are a fair amount of complaints on the Framework forums about this.
> And that specific panel is actually readable even at 0% PWM.

If a lot of Framework users are complaining about this, then maybe Framework
should fix their VBT in a BIOS update ?  That seems like a better solution
then quirking this in the kernel.

> 
>> So IMHO we should not be overriding the minimum brightness from the firmware
>> using quirks because:
>>
>> a) This is going to be an endless game of whack-a-mole
> 
> Indeed, but IMO it is better to maintain the list in the kernel than
> forcing all users to resort to random forum advise and fiddle with
> lowlevel system configuration.

One of the problem is that what is an acceptable minimum brightness
value is subjective. One person's "still too bright" is another
person's "barely readable"

>> b) The new value may be too low for certain users / use-cases
> 
> The various userspace wrappers already are applying a safety
> threshold to not go to "0".
> At least gnome-settings-daemon and brightnessctl do not go below 1% of
> brightness_max. They already have to deal with panels that can go
> completely dark.

Right, something which was added because the minimum brightness value
on VBTs often is broken. Either it is missing or (subjectively) it is
too high.


>> With that said I realize that there are also many users who want to have
>> a lower minimum brightness value for use in the evening, since they find
>> the available minimum value still too bright. I know some people want this
>> for e.g. various ThinkPad models too.
> 
> From my experience with ThinkPads, the default brightness range there
> was fine for me. But on the Framework 13 AMD it is not.
> 
>> So rather then quirking this, with the above mentioned disadvantages I believe
>> that it would be better to extend the existing video=eDP-1:.... kernel
>> commandline parsing to allow overriding the minimum brightness in a driver
>> agnostic way.
> 
> I'm not a fan. It seems much too complicated for most users.

Wanting lower minimum brightness really is mostly a power-user thing
and what is the right value is somewhat subjective and this is an often
heard complained. I really believe that the kernel should NOT get in
the business of adding quirks for this. OTOH given that this is an often
heard complaint having some generic mechanism to override the VBT value
would be good to have.

As for this being too complicated, I fully agree that ideally things
should just work 100% OOTB, which is why I believe that a firmware fix
from Framework would be good. But when things do not work 100% adding
a kernel cmdline option is something which is regularly asked from users /
found in support questions on fora so I don't think this is overly
complicated. I agree it is not ideal but IMHO it is workable.

E.g. on Fedora it would simply be a question of users having to run:

sudo grubby --update-kernel=ALL --args="video=eDP-1:min-brightness=1"

will add the passed in argument to all currently installed (and
future) kernels.

> Some more background to the Framework 13 AMD case:
> The same panel on the Intel variant already goes darker.
> The last responses we got from Framework didn't indicate that the high
> minimum brightness was intentional [0], [1].
> Coincidentally the "12" returned from ATIF matches
> AMDGPU_DM_DEFAULT_MIN_BACKLIGHT, so maybe the firmware is just not set
> up completely.

Right, so I think this should be investigated closer and then get
framework to issue a BIOS fix, not add a quirk mechanism to the kernel.

IIRC the amdgpu driver will use AMDGPU_DM_DEFAULT_MIN_BACKLIGHT when
that setting is 0 in the VBT.

> 
>> The minimum brightness override set this way will still need hooking up
>> in each driver separately but by using the video=eDP-1:... mechanism
>> we can document how to do this in driver independent manner. since
>> I know there have been multiple requests for something like this in
>> the past I believe that having a single uniform way for users to do this
>> will be good.
>>
>> Alternatively we could have each driver have a driver specific module-
>> parameter for this. Either way I think we need some way for users to
>> override this as a config/setting tweak rather then use quirks for this.
> 
> This also seems much too complicated for normal users.

I agree that having a uniform way is better then having per driver
module options.

Regards,

Hans

