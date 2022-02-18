Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B334BB705
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 11:39:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0E9710F2DF;
	Fri, 18 Feb 2022 10:38:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7034210F2E0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 10:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645180731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BB3RvaNyELHc5+cbc7+hBFpImVt+dcbvRUKC71NhhxA=;
 b=HI5YskYZA93PlBOywea2cgXOu0zC9iztARNh//bqI2Tji9DPcoESpxTnt79EUbdQhu00cG
 U1RCCNSVBbVWkuMdNq50g5DHV4Tu8cuniJPj8XErOl8PfQI7YRBowaf7Lhd7YrgCKG0kkS
 RCryavCCz5BUnISBIcEhUngg1K0slvQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-98hFoh0DM-qiv7Sr1je0Uw-1; Fri, 18 Feb 2022 05:38:50 -0500
X-MC-Unique: 98hFoh0DM-qiv7Sr1je0Uw-1
Received: by mail-ej1-f69.google.com with SMTP id
 gn20-20020a1709070d1400b006cf1fcb4c8dso2870021ejc.12
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 02:38:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BB3RvaNyELHc5+cbc7+hBFpImVt+dcbvRUKC71NhhxA=;
 b=E31n14z+wMzqwobCx4XS5Qr7MDAdJZSo3AoeRPa0B4dcAKc/KmQgutWp/cm++IbIkk
 2CLEZZwXGJGs+TQoPlEWV+bMcwqPo0eArHECb6W9avadW0LC0JY+DKttegNuNkKgPYuA
 BVrZspPZ4DSUAP/EbEWi2MrVzygD5ooIuW2N46iDvdpVHGEidyUEYbqj9hKM8o6QGcWF
 nKlv6fpV4T2HNhpQS+QMXVZmL3AzEZUbzJfrUidjFscFRcBZZlotHUT08Zmr+obGGtxe
 CFdZ9KhuJgwKONYAWBw3as8dz4tnYnBYBlj6/yYXYz0R0jlKaPAeIVn2Plo9a3nFbqTw
 UZlA==
X-Gm-Message-State: AOAM531IFZzrjJMu1IA0tO3QR1T3MajJThRTpn96nLQC+CvzDqkNe1nR
 WpvHrygkxCf5fzzqtZK8//VTsnimGrbe4clcT6gkt91N6tP2Fkcmj+6yPxl9t7E9+jivT5hwIdt
 S8hBFmv/WeW+xnKS36RKsXhmEaUbo
X-Received: by 2002:aa7:c7c4:0:b0:407:52cc:3b32 with SMTP id
 o4-20020aa7c7c4000000b0040752cc3b32mr7361687eds.397.1645180728888; 
 Fri, 18 Feb 2022 02:38:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykfGhd50F9wQIvpfwSV02IuVtosrF0JYSvVlOA9FaeEpZTbChuHWqvZILt6ivHs5QKeNBX5w==
X-Received: by 2002:aa7:c7c4:0:b0:407:52cc:3b32 with SMTP id
 o4-20020aa7c7c4000000b0040752cc3b32mr7361656eds.397.1645180728579; 
 Fri, 18 Feb 2022 02:38:48 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id t4sm4835504edd.7.2022.02.18.02.38.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 02:38:48 -0800 (PST)
Message-ID: <d3f0cc20-d226-ee42-cc98-b469949cec9e@redhat.com>
Date: Fri, 18 Feb 2022 11:38:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [Intel-gfx] [PATCH v8 1/3] gpu: drm: separate panel orientation
 property creating and value setting
To: Emil Velikov <emil.l.velikov@gmail.com>, Simon Ser <contact@emersion.fr>
References: <20220208084234.1684930-1-hsinyi@chromium.org>
 <CACvgo53u01BK_D0ZssV+gCepjxSz23Nr5Dy1qXeaAoJuu6VCFQ@mail.gmail.com>
 <KW6DNh6IRRgVJx9DfOFBnEqc4a0x-AnDXEbMxwpfEbk8dOn_KGVzAfo-slJWq-4nWW728Uc-OVpFh2w4fDE4-bxfkDuz1hFILRVvbcuXqaw=@emersion.fr>
 <CACvgo532-pC+7DLFCo=DWTX-OnJEJvSoTmQnt3_qLhiT4cqEMg@mail.gmail.com>
 <GYG6EVT1MqtmfKiPpMhDG9mpuATnmwVDq2PuE_dpDat5oQW_t1tUfm39lSWHj32D5r7mrog27sL4dkgdMYQ5BN830TfVOrgQ4Ts8LcO8Hcs=@emersion.fr>
 <CACvgo52+o9_ETC+1RKzqKkyw3ZJ28RjH0BqC9DfmNAKqByud8Q@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CACvgo52+o9_ETC+1RKzqKkyw3ZJ28RjH0BqC9DfmNAKqByud8Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 LAKML <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Sorry for jumping in in the middle of the thread I did
not notice this thread before.

On 2/16/22 13:00, Emil Velikov wrote:
> On Tue, 15 Feb 2022 at 16:37, Simon Ser <contact@emersion.fr> wrote:
>>
>> On Tuesday, February 15th, 2022 at 15:38, Emil Velikov <emil.l.velikov@gmail.com> wrote:
>>
>>> On Tue, 15 Feb 2022 at 13:55, Simon Ser <contact@emersion.fr> wrote:
>>>>
>>>> On Tuesday, February 15th, 2022 at 13:04, Emil Velikov <emil.l.velikov@gmail.com> wrote:
>>>>
>>>>> Greetings everyone,
>>>>>
>>>>> Padron for joining in so late o/
>>>>>
>>>>> On Tue, 8 Feb 2022 at 08:42, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>>>>>>
>>>>>> drm_dev_register() sets connector->registration_state to
>>>>>> DRM_CONNECTOR_REGISTERED and dev->registered to true. If
>>>>>> drm_connector_set_panel_orientation() is first called after
>>>>>> drm_dev_register(), it will fail several checks and results in following
>>>>>> warning.
>>>>>>
>>>>>> Add a function to create panel orientation property and set default value
>>>>>> to UNKNOWN, so drivers can call this function to init the property earlier
>>>>>> , and let the panel set the real value later.
>>>>>>
>>>>>
>>>>> The warning illustrates a genuine race condition, where userspace will
>>>>> read the old/invalid property value/state. So this patch masks away
>>>>> the WARNING without addressing the actual issue.
>>>>> Instead can we fix the respective drivers, so that no properties are
>>>>> created after drm_dev_register()?
>>>>>
>>>>> Longer version:
>>>>> As we look into drm_dev_register() it's in charge of creating the
>>>>> dev/sysfs nodes (et al). Note that connectors cannot disappear at
>>>>> runtime.
>>>>> For panel orientation, we are creating an immutable connector
>>>>> properly, meaning that as soon as drm_dev_register() is called we must
>>>>> ensure that the property is available (if applicable) and set to the
>>>>> correct value.
>>>>
>>>> Unfortunately we can't quite do this. To apply the panel orientation quirks we
>>>> need to grab the EDID of the eDP connector, and this happened too late in my
>>>> testing.
>>>>
>>>> What we can do is create the prop early during module load, and update it when
>>>> we read the EDID (at the place where we create it right now). User-space will
>>>> receive a hotplug event after the EDID is read, so will be able to pick up the
>>>> new value if any.
>>>
>>> Didn't quite get that, are you saying that a GETPROPERTY for the EDID,
>>> the ioctl blocks or that we get an empty EDID?
>>
>> I'm not referring to GETPROPERTY, I'm referring to the driver getting the EDID
>> from the sink (here, the eDP panel). In my experimentations with amdgpu I
>> noticed that the driver module load finished before the EDID was available to
>> the driver. Maybe other drivers behave differently and probe connectors when
>> loaded, not sure.
>>
> I see thanks.
> 
>>> The EDID hotplug even thing is neat - sounds like it also signals on
>>> panel orientation, correct?
>>> On such an event, which properties userspace should be re-fetching -
>>> everything or guess randomly?
>>>
>>> Looking through the documentation, I cannot see a clear answer :-\
>>
>> User-space should re-fetch *all* properties. In practice some user-space may
>> only be fetching some properties, but that should get fixed in user-space.
>>
>> Also the kernel can indicate that only a single connector changed via the
>> "CONNECTOR" uevent prop, or even a single connector property via "PROPERTY".
>> See [1] for a user-space implementation. But all of this is purely an optional
>> optimization. Re-fetching all properties is a bit slower (especially if some
>> drmModeGetConnector calls force-probe connectors) but works perfectly fine

What I'm reading in the above is that it is being considered to allow
changing the panel-orientation value after the connector has been made
available to userspace; and let userspace know about this through a uevent.

I believe that this is a bad idea, it is important to keep in mind here
what userspace (e.g. plymouth) uses this prorty for. This property is
used to rotate the image being rendered / shown on the framebuffer to
adjust for the panel orientation.

So now lets assume we apply the correct upside-down orientation later
on a device with an upside-down mounted LCD panel. Then on boot the
following could happen:

1. amdgpu exports a connector for the LCD panel to userspace without
setting panel-orient=upside-down
2. plymouth sees this and renders its splash normally, but since the
panel is upside-down it will now actually show upside-down
3. amdgpu adjusts the panel-orient prop to upside-down, sends out
uevents
4. Lets assume plymouth handles this well (i) and now adjust its
rendering and renders the next frame of the bootsplash 180° rotated
to compensate for the panel being upside down. Then from now on
the user will see the splash normally

So this means that the user will briefly see the bootsplash rendered
upside down which IMHO is not acceptable behavior. Also see my footnote
about how I seriously doubt plymouth will see the panel-orient change
at all.

I'm also a bit unsure about:

a) How you can register the panel connector with userspace before
reading the edid, don't you need the edid to give the physical size +
modeline to userspace, which you cannot just leave out ?

I guess the initial modeline is inherited from the video-bios, but
what about the physical size? Note that you cannot just change the
physical size later either, that gets used to determine the hidpi
scaling factor in the bootsplash, and changing that after the initial
bootsplash dislay will also look ugly

b) Why you need the edid for the panel-orientation property at all,
typically the edid prom is part of the panel and the panel does not
know that it is mounted e.g. upside down at all, that is a property
of the system as a whole not of the panel as a standalone unit so
in my experience getting panel-orient info is something which comes
from the firmware /video-bios not from edid ?

Regards,

Hans



i) I don't think plymouth will handle this well though, since it tries to
skip unchanged connectors and I believe it only checks the crtc routing +
preferred modeline to determine "unchanged".

