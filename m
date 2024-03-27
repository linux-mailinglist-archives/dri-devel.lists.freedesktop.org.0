Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B87CB88DBC2
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 12:01:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62EB10F9FF;
	Wed, 27 Mar 2024 11:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WzxhRIpz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F3F410F791
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 11:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711537278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ijmIYkbtUgLloemb3IYBRxrYfQqt9ANY3s0WCkNZQa8=;
 b=WzxhRIpzqcjrNVV0YL3835ekXSY7LmPJKjXUnHhqZQ0cdQXDcvrZU+XuxmtaFcjNJ5itaU
 g8198cPPZloZiSKSZ4jtEfTT6o7KQfDhf7A+A4dXNqtCqrMDp8ETp1p7RQ0TJAIBumUPTE
 L7RZnSnXtsORQhVg3g95SROw/YsP0hU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-340-8ouXYIl7MXm88bJ_sKvwAg-1; Wed, 27 Mar 2024 07:01:16 -0400
X-MC-Unique: 8ouXYIl7MXm88bJ_sKvwAg-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-a462e4d8c44so309772466b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 04:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711537275; x=1712142075;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ijmIYkbtUgLloemb3IYBRxrYfQqt9ANY3s0WCkNZQa8=;
 b=Oywz64s0t7AEFsf072pT1oRfabkkeqBgC7ufh5KvZXLxRJNrl7roTRPjU5KFFPxKSL
 KDzfNzuetyBxVbXFCeEX+l6hI4bM5yhhhICj86lzs4Jc69+9bzmn2iLJAAWdMQDaGIKO
 P0i947dd5m9/2fHcxMwUYJvjG/bHoZDMcCmxl2Ygv8fioLT3/9UJ2sW/3XwkPJGANVLU
 HO/DBUa3yRFpR7bS6vX9xCKpq1/KZIOHHjWht9Xz+BfEHMf76W65VqiHJpTcuCP7jgvo
 6S35l8WxzaAp4pDQ0y6BTbiKi1MKWNpeiPbBCAcQLmHDSrBKJ8RT7B2TOpcuJrZuQPpG
 RFtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNBYM2GaTBAVjlki5iag26Ob8MFi/+tD3Ni2wAKpRQRjY3a3B+3iUYmzKvAWJUxO4K4KsmVRP70E2KE94AfnwrSzg9Yc/4D5R0Nr4R3F3g
X-Gm-Message-State: AOJu0YwFzS1FA6mhX6JWRb0y76x4vKG89KP6dmI2C9NKC9kIDZ79Pu2S
 Qumhp2n3NRJxgntyVTUIsyNC7/I8sPFVWOidwAwWbljOO2z+Jm5tPZpyo68hqyt/2NEDqe/f5ca
 hRjOkFemp1xNQk8ikdRBA4t6B9ro+YMAkEQGaoLdShynm7sAG43GT8x2VeA/yLpoLXg==
X-Received: by 2002:a17:906:411b:b0:a45:94bf:18e6 with SMTP id
 j27-20020a170906411b00b00a4594bf18e6mr703034ejk.73.1711537275417; 
 Wed, 27 Mar 2024 04:01:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIUiXXgqzuCXG1SnQhqhZWjP4NPbliJw2BfoqBSvCm3uFfuZwCbtt/lNUnL0xkGv7en/Zo2Q==
X-Received: by 2002:a17:906:411b:b0:a45:94bf:18e6 with SMTP id
 j27-20020a170906411b00b00a4594bf18e6mr703015ejk.73.1711537275058; 
 Wed, 27 Mar 2024 04:01:15 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 kv20-20020a17090778d400b00a46cc48ab07sm5296891ejc.221.2024.03.27.04.01.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 04:01:14 -0700 (PDT)
Message-ID: <42e676ec-f44e-4447-aa4e-c5ab70b5bf91@redhat.com>
Date: Wed, 27 Mar 2024 12:01:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: In kernel virtual HID devices (was Future handling of complex RGB
 devices on Linux v3)
To: Benjamin Tissoires <bentiss@kernel.org>,
 Werner Sembach <wse@tuxedocomputers.com>
Cc: Lee Jones <lee@kernel.org>, jikos@kernel.org,
 linux-kernel@vger.kernel.org, Jelle van der Waa <jelle@vdwaa.nl>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, Gregor Riepl <onitake@gmail.com>
References: <b6d79727-ae94-44b1-aa88-069416435c14@redhat.com>
 <a21f6c49-2c05-4496-965c-a7524ed38634@gmail.com>
 <825129ea-d389-4c6c-8a23-39f05572e4b4@redhat.com>
 <adbfdf6c-fb59-4fae-a472-17b04dd8a3f6@tuxedocomputers.com>
 <1fb08a74-62c7-4d0c-ba5d-648e23082dcb@tuxedocomputers.com>
 <aec1d22d-9e59-4dfc-b108-5ba339b0e76a@redhat.com>
 <siebkhaauocqkuox73q2e5p2mbsyc7j4gvpzfvt4c3gvncdpap@oxh5pp4gxpuo>
 <870cca8a-1a1b-4d17-874e-a26c30aca2bf@tuxedocomputers.com>
 <fcf4dd53-f461-4c2e-8fbe-50b50e4e6797@redhat.com>
 <65b24776-ae1a-4290-a1d5-c7637ad0accc@tuxedocomputers.com>
 <vjd5xqgd2gsyz4ubgk6eusuyqdtxpdw6vogc5u537x2a245xcj@m2twppbxea4p>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <vjd5xqgd2gsyz4ubgk6eusuyqdtxpdw6vogc5u537x2a245xcj@m2twppbxea4p>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
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

Hi,

On 3/26/24 4:39 PM, Benjamin Tissoires wrote:
> On Mar 26 2024, Werner Sembach wrote:
>> Hi all,
>>
>> Am 25.03.24 um 19:30 schrieb Hans de Goede:
>>
>> [snip]
>>>>> If the kernel already handles the custom protocol into generic HID, the
>>>>> work for userspace is not too hard because they can deal with a known
>>>>> protocol and can be cross-platform in their implementation.
>>>>>
>>>>> I'm mentioning that cross-platform because SDL used to rely on the
>>>>> input, LEDs, and other Linux peculiarities and eventually fell back on
>>>>> using hidraw only because it's way more easier that way.
>>>>>
>>>>> The other advantage of LampArray is that according to Microsoft's
>>>>> document, new devices are going to support it out of the box, so they'll
>>>>> be supported out of the box directly.
>>>>>
>>>>> Most of the time my stance is "do not add new kernel API, you'll regret
>>>>> it later". So in that case, given that we have a formally approved
>>>>> standard, I would suggest to use it, and consider it your API.
>>>> The only new UAPI would be the use_leds_uapi switch to turn on/off the backwards compatibility.
> 
> I have my reserves with such a kill switch (see below).
> 
>>> Actually we don't even need that. Typically there is a single HID
>>> driver handling both keys and the backlight, so userspace cannot
>>> just unbind the HID driver since then the keys stop working.
> 
> I don't think Werner meant unbinding the HID driver, just a toggle to
> enable/disable the basic HID core processing of LampArray.

Right, what I was trying to say is that unbinding the driver
might be an alternative. I know things like the G15 keyboard
userspace daemons used to do this in the past.

But Werner is right that this won't be an option if the actual
keyboard presses and the LampArray parts are part of a single
HID device.

> 
>>>
>>> But with a virtual LampArray HID device the only functionality
>>> for an in kernel HID driver would be to export a basic keyboard
>>> backlight control interface for simple non per key backlight control
>>> to integrate nicely with e.g. GNOME's backlight control.
>>
>> Don't forget that in the future there will be devices that natively support
>> LampArray in their firmware, so for them it is the same device.
> 
> Yeah, the generic LampArray support will not be able to differentiate
> "emulated" devices from native ones.
> 
>>
>> Regards,
>>
>> Werner
>>
>>> And then when OpenRGB wants to take over it can just unbind the HID
>>> driver from the HID device using existing mechanisms for that.
> 
> Again no, it'll be too unpredicted.
> 
>>>
>>> Hmm, I wonder if that will not also kill hidraw support though ...
>>> I guess getting hidraw support back might require then also manually
>>> binding the default HID input driver.  Bentiss any input on this?
> 
> To be able to talk over hidraw you need a driver to be bound, yes. But I
> had the impression that LampArray would be supported by default in
> hid-input.c, thus making this hard to remove. Having a separate driver
> will work, but as soon as the LampArray device will also export a
> multitouch touchpad, we are screwed and will have to make a choice
> between LampArray and touch...

The idea is to have the actual RGB support in userspace through hidraw,
I believe we all agreed on that higher up in the thread.

Werner would like for there to also be a simpler in kernel support
which treats the per key lighting as if it is a more standard
(e.g. thinkpad x1) style keyboard backlight so that existing desktop
environment integration for that will work for users who do not
install say openrgb.

The question is how do we disable the in kernel basic kbd_backlight support
when openrgb wants to take over and fully control the LEDs ?

Given that driver unbinding is out of the question I think that we are
back to having a sysfs attribute to disable / re-enable the in kernel
basic kbd_backlight support.

Note that the basic kbd_backlight support also allows e.g. GNOME to
set the brightness (not only monitor it) so at a minimum we need to
disable the "write" support when e.g. openrgb has control.

Regards,

Hans



