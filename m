Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B378439657
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 14:29:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B7EC89DBC;
	Mon, 25 Oct 2021 12:29:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E2A89DBC
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 12:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635164938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ODWAC2kPVBIFuPUdtI4g09Ho4gCD2YMuSiOZS86l4U=;
 b=HnBLBxccEqqNy0TWtouLPnBAf2jDxsCnt+saYXxQeG6axOCv0xuihZ+2ugaLpPwNRgAoTs
 9X66Br8+W9a2jlneFVKZH/FSpjKbT/jzvw4tz1JoPas6sYPHpn1WIZEWAYBrIJIXLUUzW2
 NEp9fhr4Ummos3wOlaXeCsNJ6miMqag=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-Hwe5uYzgNEKVsBlXnvQRcA-1; Mon, 25 Oct 2021 08:28:58 -0400
X-MC-Unique: Hwe5uYzgNEKVsBlXnvQRcA-1
Received: by mail-wm1-f71.google.com with SMTP id
 c128-20020a1c9a86000000b0032cbafd99a2so397168wme.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 05:28:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2ODWAC2kPVBIFuPUdtI4g09Ho4gCD2YMuSiOZS86l4U=;
 b=gAaluKj4ozGSOOaKgo2L1odDBiNfeIS9PA38HnTpx5yne1GD717deayQ/1weAaAn0+
 rVNeXRFA3My8iVzRQMWd4fvd9z3bUjVsKlnuXZof2WEEd8BEtSae04m1rycP3sEidOqk
 sJpYL787Q4SdQ2jEy4l1AKY8OJzpJ2ESUdqtonb8XY8dlugPf9RBUIj+qPALVE2HtR6P
 QLDr8p6qqxE//ouU3qkEdqafR4IKxjEi1Oy3XFE+MKVhgqbrYCN7zFd88G3IEDdxA7EE
 X5yH86djvTq2tZ63GNSmNAukMu2KuU5f0bvNvBbm48TdYto0ASobDPd1NqjGehDzh6Ew
 He7A==
X-Gm-Message-State: AOAM531jKWry2N2dyyJ9bu8Joysrrpcq2eFfXyDHILTB3WD0+OOzP041
 tqH/iZev1GsLR3hQLKpNALwG97b0cmAgiV0NUvf9wiuQu27n+EfGC+dgy0Dwjv1O+EZweZXG24m
 UA5Zqxj1wNyz9iX6ABBdSiANzxHdB
X-Received: by 2002:a5d:62d0:: with SMTP id o16mr23263790wrv.206.1635164936544; 
 Mon, 25 Oct 2021 05:28:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw617Ej0Qgn2OshjIK1/cSPxPzf4Dx4RNMcL9U1rlmQG2vOOyYfwwjD+PbnuD24/smsnfHsBQ==
X-Received: by 2002:a5d:62d0:: with SMTP id o16mr23263752wrv.206.1635164936232; 
 Mon, 25 Oct 2021 05:28:56 -0700 (PDT)
Received: from [192.168.1.128] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id b19sm19153070wmj.9.2021.10.25.05.28.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 05:28:55 -0700 (PDT)
Message-ID: <f3c9f2e5-73f7-e7c9-dc97-8bfa7b294b0b@redhat.com>
Date: Mon, 25 Oct 2021 14:28:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH] drm/aperture: Add param to disable conflicting
 framebuffers removal
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Peter Robinson <pbrobinson@gmail.com>, Neal Gompa <ngompa13@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
References: <20211022144040.3418284-1-javierm@redhat.com>
 <YXMNOfBS5iFenmx8@intel.com>
 <c1d1f245-7bcf-16e5-c3f4-c13550843e02@redhat.com>
 <931230b4-1e73-948d-abaf-f1d62ea58239@daenzer.net>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <931230b4-1e73-948d-abaf-f1d62ea58239@daenzer.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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

Hello Michel,

On 10/25/21 12:45, Michel Dänzer wrote:
> On 2021-10-24 22:32, Javier Martinez Canillas wrote:
>> Hello Ville,
>>
>> On 10/22/21 21:12, Ville Syrjälä wrote:
>>> On Fri, Oct 22, 2021 at 04:40:40PM +0200, Javier Martinez Canillas wrote:
>>>> The simpledrm driver allows to use the frame buffer that was set-up by the
>>>> firmware. This gives early video output before the platform DRM driver is
>>>> probed and takes over.
>>>>
>>>> But it would be useful to have a way to disable this take over by the real
>>>> DRM drivers. For example, there may be bugs in the DRM drivers that could
>>>> cause the display output to not work correctly.
>>>>
>>>> For those cases, it would be good to keep the simpledrm driver instead and
>>>> at least get a working display as set-up by the firmware.
>>>>
>>>> Let's add a drm.remove_fb boolean kernel command line parameter, that when
>>>> set to false will prevent the conflicting framebuffers to being removed.
>>>>
>>>> Since the drivers call drm_aperture_remove_conflicting_framebuffers() very
>>>> early in their probe callback, this will cause the drivers' probe to fail.
>>>
>>> Why is that better than just modprobe.blacklisting those drivers?
>>
>> Because would allow to deny list all native (as Thomas called it) DRM drivers
>> and only allow the simpledrm driver to be probed. This is useful for distros,
>> since could add a "Basic graphics mode" to the boot menu entries, that could
>> boot the kernel passing a "drm.disable_native_drivers=1" cmdline option.
>>
>> That way, if there's any problem with a given DRM driver, the distro may be
>> installed and booted using the simpledrm driver and troubleshoot why a native
>> DRM driver is not working. Or try updating the kernel package, etc.
> 
> For troubleshooting, it'll be helpful if this new parameter can be enabled for the boot via the kernel command line, then disabled again after boot-up. One simple possibility for this would be allowing the parameter to be changed via /sys/module

That's already the case with the current patch, i.e:

$ grep -o drm.* /proc/cmdline 
drm.disable_native_drivers=1

$ cat /proc/fb 
0 simpledrm

$ modprobe virtio_gpu

$ dmesg
[  125.731549] [drm] pci: virtio-vga detected at 0000:00:01.0
[  125.732410] virtio_gpu: probe of virtio0 failed with error -16

$ echo 0 > /sys/module/drm/parameters/disable_native_drivers

$ modprobe virtio_gpu

$ dmesg 
[  187.889136] [drm] pci: virtio-vga detected at 0000:00:01.0
[  187.894578] Console: switching to colour dummy device 80x25
[  187.897090] virtio-pci 0000:00:01.0: vgaarb: deactivate vga console
[  187.899983] [drm] features: -virgl +edid -resource_blob -host_visible
[  187.907176] [drm] number of scanouts: 1
[  187.907714] [drm] number of cap sets: 0
[  187.914108] [drm] Initialized virtio_gpu 0.1.0 0 for virtio0 on minor 1
[  187.930807] Console: switching to colour frame buffer device 128x48
[  187.938737] virtio_gpu virtio0: [drm] fb0: virtio_gpu frame buffer device

$ cat /proc/fb 
0 virtio_gpu

/drm/parameters/<name>, which I suspect doesn't work with the patch as is (due to the 0600 permissions).
> 
> 

I followed the convention used by other drm module parameters, hence the
0600. Do you mean that for this parameter we should be less restrictive ?

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

