Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 686CC18B28A
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 12:49:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD35C6EA04;
	Thu, 19 Mar 2020 11:49:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C70A26EA05
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 11:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584618578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SkxUdWK4aRjg8K9rJvgdkZIlNkGeNrD+jU6DC6pelKA=;
 b=g0Qu37ctG5gaN4SYEnbQzvQNL0pyrZCwYFhLG/rUm6N7jqO8zHbmhbnOic9up4/qEVOm9x
 iD6ij7CpO8Lv3HeRmhCcQgTmlB0a37E3n1OxixnIQRnYQ4YTdw5lQgm0dxm+/21We1iK/F
 5pz8wxiEc2a9Nb6uC1SXdB6kK6AODdc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-l9k8q2CjOMaLDRpwpQgwJQ-1; Thu, 19 Mar 2020 07:49:31 -0400
X-MC-Unique: l9k8q2CjOMaLDRpwpQgwJQ-1
Received: by mail-wr1-f72.google.com with SMTP id q18so886783wrw.5
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 04:49:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SkxUdWK4aRjg8K9rJvgdkZIlNkGeNrD+jU6DC6pelKA=;
 b=Ou26fTNIJSN4QlHgxVzQu/T3JjRVFJmiDUhmbLt8CbYzCp9iwRsSHgVjVEXJfaLGQE
 2S20BAywZkC9RJOeggD6Y0TgZNDzrysupFkCGmK249T2aA9Rqt1aoIW2busP0Ctil7wB
 qAMYUpRNdkU7aUFjCQzm4x7zcLwGvxwqQXuln2IzDHjCCJTkNusWj68ttSyum4EZaayP
 xZ76D4vM7UmE0X87LQWuKlNNIOBqu5XamihsiYr9rFYDxY7WTcaNk4Bgiv3R99sJOMEs
 1vfhgW0QT0seSbG/QKlzBLkLHCwd4Q6Hj74AbPO+OLGbe1NIs68zcPKRiTEnNFl6JnvF
 Zk8g==
X-Gm-Message-State: ANhLgQ113tiTAEIx2XkoqVoXeFvIo11Iz0ia0S7YVHTp+SluazY5n1Ro
 6xn4xNlQW+PTfQPPFJoS66G/D3iwWniz2yRMVMfh5BtS3eODMukGrQ8l4B6xcb3afopncxcVEVi
 NS0Diyvla6ABukaYGMae2FNvu0Vyy
X-Received: by 2002:adf:cd8f:: with SMTP id q15mr970139wrj.119.1584618569834; 
 Thu, 19 Mar 2020 04:49:29 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuvXTtdxYqHmYkMv81wpZZpM+qa8fvl0JPIucBBdX25rDhXGnTPpaMHsath43Qw1RpsaQqhMQ==
X-Received: by 2002:adf:cd8f:: with SMTP id q15mr970090wrj.119.1584618569424; 
 Thu, 19 Mar 2020 04:49:29 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
 by smtp.gmail.com with ESMTPSA id u17sm3166959wrm.43.2020.03.19.04.49.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Mar 2020 04:49:28 -0700 (PDT)
Subject: Re: Atomic KMS API lacks the ability to set cursor hot-spot
 coordinates
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <9d86bbe4-70cf-273d-4d61-aec06011d441@redhat.com>
 <20200319120028.56d3427a@eldfell.localdomain>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <8b9c1aac-3398-ab97-a065-014359d40220@redhat.com>
Date: Thu, 19 Mar 2020 12:49:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200319120028.56d3427a@eldfell.localdomain>
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

On 3/19/20 11:00 AM, Pekka Paalanen wrote:
> On Wed, 18 Mar 2020 15:28:02 +0100
> Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> ATM the Atomic KMS API lacks the ability to set cursor hot-spot
>> coordinates. Mutter (and Weston) have tried to emulate this by shifting
>> the coordinates for where to draw the cursor by the hotspot-coordinates
>> and always using 0x0 for the hotspot.
>>
>> But this breaks the so called "seamless mouse mode" for virtual-machines
>> and there really is no way to fix this but to allow passing the proper
>> hotspot coordinates to the virtual gfx-card.
>>
>> Seamless-mode consists of 2 parts:
>>
>> 1) Letting the VM-viewer window-system draw the cursor as it normally
>> would draw it.
>>
>> 2) Giving absolute coordinates of the mouse to the VM by e.g. emulating
>> an USB drawing tablet. These coordinates come from translating the
>> coordinates where the VM-viewer window-system is drawing the cursor
>> to an absolute position using the top left corner of the view as 0x0
>> and the bottom right corner as max-abs-x,max-abs-y.
> 
> Hi,
> 
> is the VM-viewer then hiding or autonomously moving what the display
> server inside VM has put on the KMS cursor plane?

Yes and no, it is not the VM-viewer which is hiding what the
display-server inside the VM has put on the KMS cursor plane,
the VM-viewer negotiates seamless mouse mode with the hypervisor
and then the hypervisor just ignores the cursor-plane except for
sending "sprite" changes to the VM-viewer.

> If so, sounds like hilarity would ensue with Weston.
> 
> Weston does not actually know what a cursor is. Weston will happily put
> any arbitrary non-cursor content onto the KMS cursor plane if it happens
> to fit. It's just that usually there is a small surface top-most that
> ends up on the cursor plane, and that surface accidentally happens to
> be a cursor by Wayland protocol.
> 
> It's not difficult to get e.g. weston-simple-shm window to be shown on
> the KMS cursor plane: just hide the real cursor from the client.
> 
> No, it's not an oversight. It is called "making maximal use of the
> available KMS resources" by using KMS planes as much as possible to
> avoid compositing by rendering with Pixman or OpenGL.

Yes it sounds like this will break with Weston, note that it already
is broken in Weston, if you run e.g. Fedora 32 beta + its Weston
package inside a VirtualBox VM then start gnome-terminal (so
that you get a caret cursor instead of the default one) and try to
select text. This will result in the wrong text being displayed
because Weston does not relay cursor hotspot info to the GPU,
also see:
https://gitlab.gnome.org/GNOME/mutter/issues/1094

Where the symptoms of this are described in more detail
(they are identical for Weston and mutter).

Fixing this will require the discussed KMS atomic API changes
and also changes on the Weston and mutter side to pass through
the hotspot info.

Mutter used to do this, but mutter's internal API-s have been
reworked to closer match the atomic KMS API and as part of this
passing the hotspot coords was dropped, this is being fixed
for the legacy KMS API code-paths now (which atm are the only
code paths, atomic support has no landed yet):
https://gitlab.gnome.org/GNOME/mutter/merge_requests/1136

Regards,

Hans



>> 1) Means that any coordinates the window-system inside the VM passes to
>> the VM's gfx-card for where to draw the cursor are basically totally
>> ignored to avoid lag / flicker (and to not have to grab the cursor /
>> confine it to the VM-viewer window and to not have to warp the
>> pointer).
>>
>> This means that the offset added to the coordinates by e.g. mutter to
>> emulate the hotspot are ignored. For Seamless mouse mode to keep working
>> properly the window-system inside the VM need to pass the VM's gfx-card
>> the correct hotspot when setting the cursor. Which currently is not
>> possible when restricting oneself to the atomic APIs.
>>
>> Also see: https://gitlab.gnome.org/GNOME/mutter/issues/1094
>> Where this is currently being tracked from the mutter side. Mutter
>> internally has both atomic and legacy paths. The plan for now is to
>> push the hotspot-emulation by shifting coordinates thing into the
>> atomic path, fixing seamless mouse mode when running in legacy mode,
>> combined with blacklisting vboxvideo, vmwgfx, qxl and cirrus from
>> using atomic mode.
>>
>> This is of course a workaround, eventually we would like to see
>> the atomic API extended to allow passing the cursor hot spot.
>>
>> I'm not really familiar enough with the atomic API to come up with
>> an API design for this, but if there are suggestions on how this
>> should look like from the uAPI side then I can take a shot at
>> implementing this (and hooking it up in mutter's atomic code
>> paths to test it).
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>> p.s.
>>
>> Before people start discussing how the VM / VM-viewer is broken here and
>> the VM needs to be fixed. Seamless mouse mode exists for at least a
>> decade and has worked fine during this entire decade. It also works
>> fine when using the legacy (non atomic) DRM_IOCTL_MODE_CURSOR2 ioctl;
>>
>> Also this problem reproduces with 2 completely independent VM code-bases,
>> it has been seen on both qemu-kvm VMs and on VirtualBox VMs and I would
>> not be surprised if other hypervisors are also affected.
>>
>> And on the API consumer side this problem has been triggered by both
>> mutter and Weston.
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
