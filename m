Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 687C718B963
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 15:30:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69AF76EA13;
	Thu, 19 Mar 2020 14:30:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FFD86EA13
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 14:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584628209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WaqjRjsQ/PsqTyHg3vWBXZsHVSYzVqWjsqZ4MuZIZlU=;
 b=AMvNqHJRYQo0apQcTnwajZukf+VG79nUwBWUJZEFo0/BJp5348smfA9dvsotwV3zqXscXf
 6rDibzIMHsOq7BHXpxM/NXTyZay+S0i4LlDABmurXzK7ahYg1t1LHZ8kaqjnRazF31Snug
 QTj2+MkB/Kan6Jax2dxlAfk2dTFYo1o=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-VInKbHKhNumjB4UvDFQkTA-1; Thu, 19 Mar 2020 10:30:06 -0400
X-MC-Unique: VInKbHKhNumjB4UvDFQkTA-1
Received: by mail-wr1-f71.google.com with SMTP id t4so1100723wrr.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 07:30:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WaqjRjsQ/PsqTyHg3vWBXZsHVSYzVqWjsqZ4MuZIZlU=;
 b=FGTSw1iODC+8mSoGFu+vzGJg+3L9DtHIMh2vf1cHzqWm0osEhrJb0fiTKgI5A8PIUS
 CroSe6vh34S/T6b8eg9bxnyMSF8xziRlxD4UJzQS45vrYpdLzkEepcCa+cFvN2WZMiv/
 l+6eq6S+Sl2P/WdJeSJUL/cKkssxELk2DBPv6bf4YvnwIxLD3E+zX2Gu9YA3LCkFOqXy
 SyWTCHt68ED70/evaX1lgwfjbHdWMwkYCLNPYK6KLD1o3lzAi99JHpXWnwBDCbyh0mSM
 97l2xip4NYXZYAUetzIuMFIG47SEKQrNFq8GCIxpZss60QTlvxr5Mq0KQcNfwKMON+Um
 WDCg==
X-Gm-Message-State: ANhLgQ1XL+ABWHiMuiDC6Byd/iu/12Lcwa4xaXBDSz+d/g3Zyr0lhUri
 dKNg1DyxwtdbgKIg3IZ+huDdbV8pWpVb6pSB5it0tGcj7Xpa4fgrNhsMinQYRFEv+/b+eWlfT2c
 y02NWlWHBMQvtet16Q77a21JBWKzY
X-Received: by 2002:a5d:5342:: with SMTP id t2mr4737557wrv.104.1584628205134; 
 Thu, 19 Mar 2020 07:30:05 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtQEMFt8QTc/uengGjzXV1dZVK/RD/L9QBhYZXScA6LHyQnPt6rDCCDquQIWTfxPEfIEcyZWg==
X-Received: by 2002:a5d:5342:: with SMTP id t2mr4737527wrv.104.1584628204801; 
 Thu, 19 Mar 2020 07:30:04 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
 by smtp.gmail.com with ESMTPSA id 133sm3495274wmd.5.2020.03.19.07.30.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Mar 2020 07:30:04 -0700 (PDT)
Subject: Re: Atomic KMS API lacks the ability to set cursor hot-spot
 coordinates
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <9d86bbe4-70cf-273d-4d61-aec06011d441@redhat.com>
 <20200319120028.56d3427a@eldfell.localdomain>
 <8b9c1aac-3398-ab97-a065-014359d40220@redhat.com>
 <20200319145842.4b7db322@eldfell.localdomain>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <c8c75790-9b56-9f7f-98d6-1dd2410d70b2@redhat.com>
Date: Thu, 19 Mar 2020 15:30:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200319145842.4b7db322@eldfell.localdomain>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: =?UTF-8?Q?Jonas_=c3=85dahl?= <jadahl@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 3/19/20 1:58 PM, Pekka Paalanen wrote:
> On Thu, 19 Mar 2020 12:49:27 +0100
> Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> Hi,
>>
>> On 3/19/20 11:00 AM, Pekka Paalanen wrote:
>>> On Wed, 18 Mar 2020 15:28:02 +0100
>>> Hans de Goede <hdegoede@redhat.com> wrote:
>>>    
>>>> ATM the Atomic KMS API lacks the ability to set cursor hot-spot
>>>> coordinates. Mutter (and Weston) have tried to emulate this by shifting
>>>> the coordinates for where to draw the cursor by the hotspot-coordinates
>>>> and always using 0x0 for the hotspot.
>>>>
>>>> But this breaks the so called "seamless mouse mode" for virtual-machines
>>>> and there really is no way to fix this but to allow passing the proper
>>>> hotspot coordinates to the virtual gfx-card.
>>>>
>>>> Seamless-mode consists of 2 parts:
>>>>
>>>> 1) Letting the VM-viewer window-system draw the cursor as it normally
>>>> would draw it.
>>>>
>>>> 2) Giving absolute coordinates of the mouse to the VM by e.g. emulating
>>>> an USB drawing tablet. These coordinates come from translating the
>>>> coordinates where the VM-viewer window-system is drawing the cursor
>>>> to an absolute position using the top left corner of the view as 0x0
>>>> and the bottom right corner as max-abs-x,max-abs-y.
>>>
>>> Hi,
>>>
>>> is the VM-viewer then hiding or autonomously moving what the display
>>> server inside VM has put on the KMS cursor plane?
>>
>> Yes and no, it is not the VM-viewer which is hiding what the
>> display-server inside the VM has put on the KMS cursor plane,
>> the VM-viewer negotiates seamless mouse mode with the hypervisor
>> and then the hypervisor just ignores the cursor-plane except for
>> sending "sprite" changes to the VM-viewer.
> 
> Hi,
> 
> I don't think I understand what you're saying, but I assume that I was
> right in that the VM cursor plane content will not be shown always
> exactly in the very position the compositor inside the VM puts it.

Right, when seamless mouse mode is enabled the VM's cursor plane will
not be shown *at all*, instead the VM-viewer's window-system's
cursor plane is shown.

Sprite changes (normal cursor, caret, window-resize cursor, etc.)
are forwarded from the VM-s cursor-plane to the VM-viewer
which then requests that as cursor to the window-system under
which the VM-viewer is running.

> Maybe the example further below explain the issue I envision.
> 
>>> If so, sounds like hilarity would ensue with Weston.
>>>
>>> Weston does not actually know what a cursor is. Weston will happily put
>>> any arbitrary non-cursor content onto the KMS cursor plane if it happens
>>> to fit. It's just that usually there is a small surface top-most that
>>> ends up on the cursor plane, and that surface accidentally happens to
>>> be a cursor by Wayland protocol.
>>>
>>> It's not difficult to get e.g. weston-simple-shm window to be shown on
>>> the KMS cursor plane: just hide the real cursor from the client.
>>>
>>> No, it's not an oversight. It is called "making maximal use of the
>>> available KMS resources" by using KMS planes as much as possible to
>>> avoid compositing by rendering with Pixman or OpenGL.
>>
>> Yes it sounds like this will break with Weston, note that it already
>> is broken in Weston, if you run e.g. Fedora 32 beta + its Weston
>> package inside a VirtualBox VM then start gnome-terminal (so
>> that you get a caret cursor instead of the default one) and try to
>> select text. This will result in the wrong text being displayed
>> because Weston does not relay cursor hotspot info to the GPU,
>> also see:
>> https://gitlab.gnome.org/GNOME/mutter/issues/1094
>>
>> Where the symptoms of this are described in more detail
>> (they are identical for Weston and mutter).
> 
> Right, that's the problem with the hotspot.

Ack.

>> Fixing this will require the discussed KMS atomic API changes
>> and also changes on the Weston and mutter side to pass through
>> the hotspot info.
> 
> The problem I am referring to is that to the user looking at the
> VM-viewer, suddenly an arbitrary application window (e.g.
> weston-simple-shm) starts to act as if it was the cursor, when there is
> no real cursor shown. You have a random window unexpectedly moving
> around, as if you had started dragging it around with your mouse.

Correct.
> The only way to fix that is to stop Weston from putting non-cursor
> content on the cursor plane.

Correct.

> It sounds like your VM-viewer makes the assumption that the pointer
> input device it delivers to the VM is the one that will control the KMS
> cursor plane position inside the VM. Is that right?

Correct.

> What if the desktop inside the VM is controlled by a remote, e.g. VNC?
> Then the input events to the VM are completely unrelated to the
> expected motion of the cursor. Do you just tell the users to stop using
> the seamless mode in that case?

A VNC viewer (which is not using seamless mode itself) has the same issue
of a mismatch between the cursor position of the window-system it is a client
of and the cursor position of the window system inside the VM.

A VNC viewer typically works around this by changing the window-system
cursor to transparent and drawing its own cursor, the transparent sprite
or disabling of the cursor-plane will get forwarded to the window-system
under which the VM-viewer runs so this will work fine.

A real problem though is the absolute input mode, when e.g. the VNC
viewer is not using something like seamless mouse mode it will want
to do the usual (nasty) tricks of confining the pointer to the window
and warping it to the center after each pointer move so that mouse
can be moved "endlessly' inside the window. This requires relative
input, so emulating a mouse instead of say a drawing tablet, which
breaks seamless mode.

So although the way the cursor is drawn typically does not require
disabling seamless mode, the input problems do require disabling
seamless mode.

In my experience (I have worked on VDI (spice) a couple of years),
running a VM-viewer inside a VM is something which not a lot of
people do. I guess the fact that this works quite poorly might
be one of the reasons people do not do this.

But all VMs I'm familiar with allow disabling seamless mode for
compatibility with corner cases like this. This does lead to a
seriously degraded user-experience though. For just using an
office suit or browser inside a VM seamless mode really is a
lot more pleasant for the user.  I still remember when seamless
mode first got introduced, in the beginning it used to not
always work and fixing the fallback to the confine + warp tricks
then always was a serious itch which I tried to scratch quickly.
Breaking seamless mode also is a good way to quickly accumulate
a lot of bug reports from end users in my experience.

> What if display servers stop using the cursor plane completely, because
> people may hit a case where a VM-viewer makes the wrong assumption about
> which input device is associated to which cursor plane inside the VM?

The confine + warp trick is typically the default mode and only
if the guest indicates through e.g. a guest-agent process that
seamless mode is supported then seamless mode is enabled.

IOW the VM is careful to not enable it when it might not work.

OTOH most distros now ship with the necessary agents installed
by default, so e.g. a F32 beta install will automatically use
seamless mode under QEMU/KVM (spice display protocol) or
VirtualBox.  If a user uses say F32 + a vnc-viewer inside it
which needs to do confine + warp tricks then the user will have
to disable seamless mode manually. In my prior experience
working on VDI this is usually something which users are
understanding of and not a problem.

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
