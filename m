Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C63688A45E
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 15:25:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B31210E171;
	Mon, 25 Mar 2024 14:25:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eEKHEei4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3678310E315
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 14:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711376724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P7f00HUXp3zd1m3YJGt//Yz1Nl22MNuXdWxqtATqspc=;
 b=eEKHEei4dBOkb2tvsYDK9jIx/DSWrGPPsan04m8zZ7guWvahmnkk3xmQUonXy91qm1fA+m
 jgqOMQ4xTqTk0tspt4vJHfKhExUpVtNfdnQg1UzlkmlBQG/sP7/d/WqKxVGiE3vmV+M7Vc
 kJT/gMMey9AiI+jOj5FqqtNHOwTPg7s=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-tRqelrjIMRinlWsKWwxXUQ-1; Mon, 25 Mar 2024 10:25:22 -0400
X-MC-Unique: tRqelrjIMRinlWsKWwxXUQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-5684345c0ebso5842024a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 07:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711376721; x=1711981521;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P7f00HUXp3zd1m3YJGt//Yz1Nl22MNuXdWxqtATqspc=;
 b=NkKD83ApG0mR6NJ6rBRJasg4Rk3o9Nq793mQmiOgBh0RWaNylLV6PP7mCmBKjRXugQ
 kpPkOdvxTlx5flrpKjtWrr00VefCVi2Bp7RZXW5wsP6vvckZqQ9UJt+Sgfx+cft4eadO
 R5r6g5x/TI08EtP7rEJQzKgcxwLvzzl+qHyq7xwY3V+CRrB1uIIuZAun53PucI2Gj0qQ
 Md6e7eSDqIeergqeiX3Y3Bbgmz2eTlRDL+a3dCbQtyDmggn94Tex+D/6JrTkTjpHjh5J
 vPmxyzapOkeoLk0uTbdKL+UGNwUgvgLHo9xCn7Br5jo9g9x8u/Hemi8q4TfxXdPweA8g
 wrWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOMI/184jPTCFNBArvOrX1596GJPTuXGmzK5gl7nXulUaLnzIpEFQaSjY4Ye55J3HF7O36iHeOORLgykIAOQSA/D39XY3mNxQVY82PDZZu
X-Gm-Message-State: AOJu0YxhLMX3MK9tuj4se8Fbj/lTRHjIkKaRmeZ/zS+evjJvRG3fc67R
 v5zoPth+OZrC2l31cJgPhZGa/YsHhm7hw11bruMMETjwWdb5xSB/mIiAaLo7aF0e1Aqmb5dmVhS
 fcwEdd5ioncQw1MSAIamO7QJgKVycQsybJpXej21eRcpVC0LdWI1WwL6xEWvpoGRwTw==
X-Received: by 2002:a50:9f46:0:b0:568:9f77:9c0 with SMTP id
 b64-20020a509f46000000b005689f7709c0mr5343909edf.4.1711376720824; 
 Mon, 25 Mar 2024 07:25:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExhsFatz36wq0gHQ23Z8oZAyiiQ9qppOFaIfR20MLP2ncbc0znQUTkcsy/vu+vh23j886d9A==
X-Received: by 2002:a50:9f46:0:b0:568:9f77:9c0 with SMTP id
 b64-20020a509f46000000b005689f7709c0mr5343885edf.4.1711376720363; 
 Mon, 25 Mar 2024 07:25:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 w14-20020aa7cb4e000000b0056729e902f7sm3013149edt.56.2024.03.25.07.25.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 07:25:19 -0700 (PDT)
Message-ID: <aec1d22d-9e59-4dfc-b108-5ba339b0e76a@redhat.com>
Date: Mon, 25 Mar 2024 15:25:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: In kernel virtual HID devices (was Future handling of complex RGB
 devices on Linux v3)
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: Lee Jones <lee@kernel.org>, jikos@kernel.org,
 linux-kernel@vger.kernel.org, Jelle van der Waa <jelle@vdwaa.nl>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, Gregor Riepl <onitake@gmail.com>,
 Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>
References: <0cdb78b1-7763-4bb6-9582-d70577781e61@tuxedocomputers.com>
 <7228f2c6-fbdd-4e19-b703-103b8535d77d@redhat.com>
 <730bead8-6e1d-4d21-90d2-4ee73155887a@tuxedocomputers.com>
 <952409e1-2f0e-4d7a-a7a9-3b78f2eafec7@redhat.com>
 <9851a06d-956e-4b57-be63-e10ff1fce8b4@tuxedocomputers.com>
 <1bc6d6f0-a13d-4148-80cb-9c13dec7ed32@redhat.com>
 <b70b2ea8-abfd-4d41-b336-3e34e5bdb8c6@tuxedocomputers.com>
 <477d30ee-247e-47e6-bc74-515fd87fdc13@redhat.com>
 <e21a7d87-3059-4a51-af04-1062dac977d2@tuxedocomputers.com>
 <247b5dcd-fda8-45a7-9896-eabc46568281@tuxedocomputers.com>
 <ZdZ2kMASawJ9wdZj@duo.ucw.cz>
 <b6d79727-ae94-44b1-aa88-069416435c14@redhat.com>
 <a21f6c49-2c05-4496-965c-a7524ed38634@gmail.com>
 <825129ea-d389-4c6c-8a23-39f05572e4b4@redhat.com>
 <adbfdf6c-fb59-4fae-a472-17b04dd8a3f6@tuxedocomputers.com>
 <1fb08a74-62c7-4d0c-ba5d-648e23082dcb@tuxedocomputers.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <1fb08a74-62c7-4d0c-ba5d-648e23082dcb@tuxedocomputers.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
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

+Cc: Bentiss, Jiri

Hi Werner,

On 3/20/24 12:16 PM, Werner Sembach wrote:
> Hi Hans and the others,
> 
> Am 22.02.24 um 14:14 schrieb Werner Sembach:
>> Hi,
>>
>> Thanks everyone for the exhaustive feedback. And at least this thread is a good comprehesive reference for the future ^^.
>>
>> To recap the hopefully final UAPI for complex RGB lighting devices:
>>
>> - By default there is a singular /sys/class/leds/* entry that treats the device as if it was a single zone RGB keyboard backlight with no special effects.
>>
>> - There is an accompanying misc device with the sysfs attributes "name", "device_type",  "firmware_version_string", "serial_number" for device identification and "use_leds_uapi" that defaults to 1.
>>
>>     - If set to 0 the /sys/class/leds/* entry disappears. The driver should keep the last state the backlight was in active if possible.
>>
>>     - If set 1 it appears again. The driver should bring it back to a static 1 zone setting while avoiding flicker if possible.
>>
>> - If the device is not controllable by for example hidraw, the misc device might also implement additional ioctls or sysfs attributes to allow a more complex low level control for the keyboard backlight. This is will be a highly vendor specific UAPI.
> So in the OpenRGB issue thread https://learn.microsoft.com/en-us/windows-hardware/design/component-guidelines/dynamic-lighting-devices aka HID LampArray was mentioned. I did dismiss it because I thought that is only relevant for firmware, but I now stumbled upon the Virtual HID Framework (VHF) https://learn.microsoft.com/en-us/windows-hardware/drivers/hid/virtual-hid-framework--vhf- and now I wonder if an equivalent exists for Linux? A quick search did not yield any results for me.

Oh, interesting. I did not know about the HID LampArray API.

About your question about virtual HID devices, there is uHID,
but as the name suggests this allows userspace to emulate a HID
device.

In your case you want to do the emulation in kernel so that you
can translate the proprietary WMI calls to something HID LampArray
compatible.

I guess you could do this by defining your own HID transport driver,
like how e.g. the i2c-hid code defines 1 i2c-hid parent + 1 HID
"client" for each device which talks HID over i2c in the machine.

Bentiss, Jiri, do you have any input on this. Would something like
that be acceptable to you (just based on the concept at least) ?

Regards,

Hans


