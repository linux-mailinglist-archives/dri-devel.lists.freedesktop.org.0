Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F444505B3
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 14:39:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 501D26E0DD;
	Mon, 15 Nov 2021 13:39:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B796F6E0DD
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 13:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636983572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8OabhRogKKU88EQ/oED192PH0+Y7gbvATCMmsCL5PyM=;
 b=LTVSaek/CjieRr7wG2CgfeQliK/Aeyqq2qU7NErlND9Jj2eFJwwZfi8DTmfFw6QAJrRLyy
 BI8JyHcMxAi4U1o6/5ePQgX5ZfFxihjmsxPh6IA7m2ukd4aLu4wSfFchVg/5CWw+PhnBwE
 JgbtqPhjfJrzsdJ0o+jNAsCmJc2fWiE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-VC-OWiobM42iOIWQCahTlA-1; Mon, 15 Nov 2021 08:39:31 -0500
X-MC-Unique: VC-OWiobM42iOIWQCahTlA-1
Received: by mail-wr1-f71.google.com with SMTP id
 b1-20020a5d6341000000b001901ddd352eso2783709wrw.7
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 05:39:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8OabhRogKKU88EQ/oED192PH0+Y7gbvATCMmsCL5PyM=;
 b=Lnq+Wy5of8LiPcJgiB3nHIjmhMLlmd7s2yGd/QipXITjvP2omNADjYxe52hqzC13/T
 h47R/g8FaNBBja1hCHrUUDAQiIoikR6zezdaKeMHmnvD3HGgMznzRdtJPn1NCXkHTFqx
 NaOS8E5GurV1H/mg5LK/mOf7N7oPVN8f/tsnBhYSvF4eKfM2iFATPZkKYwpDeOYtnq6r
 gIV0UtXXbMhn5Yte/Tts6g+qHgmZ1DdjC0ExbRT59OjOEkMmuXx6bR/YaGSH/TpojoHV
 N+fNKr8SMH2m60VKVwH0vy/qDu52O0mhVM/kzbjZd46ZH9YPEF3bMdllKZFaohE2sUAi
 nYOA==
X-Gm-Message-State: AOAM530TxccZn7tlcFFA1RCByP6Id/VdfWXR8I67ciVjDYjrPCFhj1cJ
 Cacr+5Jz9sssLvBzd8r/TP0A0ZoHHkj3IeJlnT+NWfjuo71+ORdva0EWwvsx6ChkRJQSp6xt0N9
 +Fc1Gd/xRaWG9pMcW2tDgLmf4hyU4
X-Received: by 2002:a05:600c:282:: with SMTP id
 2mr60293018wmk.91.1636983570070; 
 Mon, 15 Nov 2021 05:39:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9lL+TreGvijFGWZi02IHJJjC1iAPNX09M4oBZ7Kcz4kpGDAxbD7G4qyXCoLqgv+hbQ8cNXw==
X-Received: by 2002:a05:600c:282:: with SMTP id
 2mr60292982wmk.91.1636983569839; 
 Mon, 15 Nov 2021 05:39:29 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:cb60:a1c5:8a09:190d?
 ([2a01:e0a:c:37e0:cb60:a1c5:8a09:190d])
 by smtp.gmail.com with ESMTPSA id t9sm15312222wrx.72.2021.11.15.05.39.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 05:39:29 -0800 (PST)
Message-ID: <8f3d5358-b49b-27d3-bbcd-622dbc248faf@redhat.com>
Date: Mon, 15 Nov 2021 14:39:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] drm/fb-helper: Call drm_fb_helper_hotplug_event() when
 releasing drm master
To: Daniel Vetter <daniel@ffwll.ch>
References: <20211108153453.51240-1-jfalempe@redhat.com>
 <YYlJsmrlDH5yW6nf@phenom.ffwll.local>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <YYlJsmrlDH5yW6nf@phenom.ffwll.local>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfalempe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: michel@daenzer.net, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/11/2021 17:00, Daniel Vetter wrote:
> On Mon, Nov 08, 2021 at 04:34:53PM +0100, Jocelyn Falempe wrote:
>> When using Xorg/Logind and an external monitor connected with an MST dock.
>> After disconnecting the external monitor, switching to VT may not work,
>> the (internal) monitor sill display Xorg, and you can't see what you are
>> typing in the VT.
>>
>> This is related to commit e2809c7db818 ("drm/fb_helper: move deferred fb
>> checking into restore mode (v2)")
>>
>> When switching to VT, with Xorg and logind, if there
>> are pending hotplug event (like MST unplugged), the hotplug path
>> may not be fulfilled, because logind may drop the master a bit later.
>> It leads to the console not showing up on the monitor.
>>
>> So when dropping the drm master, call the delayed hotplug function if
>> needed.
>>
>> v2: rewrote the patch by calling the hotplug function after dropping master
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Lastclose console restore is a very gross hack, and generally doesn't work
> well.
> 
> The way this is supposed to work is:
> - userspace drops drm master (because drm master always wins)
> - userspace switches the console back to text mode (which will restore the
>    console)
> 
> I guess we could also do this from dropmaster once more (like from
> lastclose), but that really feels like papering over userspace bugs. And
> given what a massive mess this entire area is already, I'm not eager to
> add more hacks here.
> 
> So ... can't we fix userspace?

I'm investigating if we can fix the userspace (Xorg/logind in this case).

Basically there are 2 ioctl to switch to VT, and the kernel wants to 
have DRM_IOCTL_DROP_MASTER, called before VT_RELDISP.
The issue is that logind monitor /sys/class/tty/tty0/active to drop drm 
master, so it occurs only after Xorg has done VT_RELDISP.

Here are the call stack of both ioctl:

Call stack in Xorg:

ioctl(13, VT_RELDISP, 0x1)        = 0
/usr/lib64/libc.so.6(ioctl+0xb) [0x10739b]
/usr/libexec/Xorg(xf86VTLeave+0x150) [0x9c780]
/usr/libexec/Xorg(WakeupHandler+0xb9) [0x5f969]
/usr/libexec/Xorg(WaitForSomething+0x1ce) [0x1b5aee]
/usr/libexec/Xorg(main+0x4fc) [0x48bbc]
/usr/lib64/libc.so.6(__libc_start_call_main+0x7f) [0x2d55f]
/usr/lib64/libc.so.6(__libc_start_main@@GLIBC_2.34+0x7b) [0x2d60b]
/usr/libexec/Xorg(_start+0x24) [0x49674]

Call stack in logind:

ioctl(33, DRM_IOCTL_DROP_MASTER, 0) = 0
/usr/lib64/libc.so.6(ioctl+0xb) [0x10739b]
/usr/lib/systemd/systemd-logind(session_device_stop+0x4b)
/usr/lib/systemd/systemd-logind(session_device_pause_all+0x67)
/usr/lib/systemd/systemd-logind(seat_set_active.isra.0+0x5d)
/usr/lib/systemd/systemd-logind(seat_read_active_vt.isra.0+0x139)
/usr/lib/systemd/systemd-logind(manager_dispatch_console+0x25)
/usr/lib/systemd/libsystemd-shared-249.so(source_dispatch+0x513)
/usr/lib/systemd/libsystemd-shared-249.so(sd_event_dispatch+0x10c)
/usr/lib/systemd/libsystemd-shared-249.so(sd_event_run+0x117)
/usr/lib/systemd/systemd-logind(main+0x1b12) [0xff02]

We probably have to patch both logind and Xorg, and introduce a new dbus 
message, to fix this in userspace.

Also I didn't see in the kernel documentation, where the order of these 
two ioctl is specified. Maybe we should add a clear statement about this ?

> 
> Ofc if it's a regression then that's different, but then I think we need a
> bit clearer implementation. I'm not clear on why you clear the callback
> (plus the locking looks busted).
> -Daniel

-- 

Jocelyn

