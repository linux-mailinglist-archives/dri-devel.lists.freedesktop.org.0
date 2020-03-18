Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B29C189E0F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 15:39:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD2C6E909;
	Wed, 18 Mar 2020 14:39:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 689 seconds by postgrey-1.36 at gabe;
 Wed, 18 Mar 2020 14:39:42 UTC
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A591C6E909
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 14:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584542381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XRM8NdcIdGtf/SL52VHf2bgCF9o0LkDOwhyQ8u8kC9s=;
 b=QOCwsmwSOyPEEpnzVOF0e+IiLsp8cxDCktcgex3utDC28AUS1NGKtcPjMkkwSo6PBRONM5
 bL5aaKXIX6pzBIXNPL4VzSDvq3HPpeYIxaKQG62BokDXGAdtg4xBSoWVKPQXZMbQCEGEki
 Bp3wP1fhMbvA9N1nIfFediQxpereyCo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-9Wu5TekhPMCfVhIMV6gLIA-1; Wed, 18 Mar 2020 10:39:35 -0400
X-MC-Unique: 9Wu5TekhPMCfVhIMV6gLIA-1
Received: by mail-wr1-f72.google.com with SMTP id t10so6141608wrp.15
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 07:39:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XRM8NdcIdGtf/SL52VHf2bgCF9o0LkDOwhyQ8u8kC9s=;
 b=VyxI7fdLYRDy3YtEOt0JuvFIapkbtPovVcx9onyNhtmkNt1hMWSCOS/MXQFQm8FSrH
 YVSfFjsBq9BRz9fTv34fYz0k+DmCpYV7/21fWup8CBvYjC4MD60O0FjCC6SN24WknPtr
 q7v5uF5LNhj97kwYzJK0b9tMvp5vMy6aA1dijaAfGTIt/tuK/EpGy5KXBMMlfhVzd8YG
 tIRNWv8aOLw+krIwl9+GB9dqcbY3PUGbPvfAk5NugR6lzfmWqz29ozTgxQcYYQO1yJfI
 QHXTMB1+OYWlMl73100U/Xr7lY2H3bukMl1IxotVoXYfnhiR4WhI0eACs8i4dzMecAeH
 0vug==
X-Gm-Message-State: ANhLgQ09Qim6xJXw5Ft+EngDlByv2O3mv716oJORL8C51ddk2ooXdtlD
 lp/BkGCMg66Ce5HCL4xhnGIh8+TxVJ5mb7IV3sPE+jC+YXjWvmi9jTx/EldiQG/Ibd7QLZGaf1A
 AM+kbI5lGDLKfyGIDISz5V1MXKf25
X-Received: by 2002:a5d:640e:: with SMTP id z14mr6446551wru.204.1584542374308; 
 Wed, 18 Mar 2020 07:39:34 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vs6/kcZs3B7qyZ+68fC83VKurz68SU5FrjwEUllAUZfoH4tV37VL+U1IHBAM+/zVtEHmyR+Jw==
X-Received: by 2002:a5d:640e:: with SMTP id z14mr6446500wru.204.1584542373590; 
 Wed, 18 Mar 2020 07:39:33 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
 by smtp.gmail.com with ESMTPSA id b5sm9381285wrj.1.2020.03.18.07.39.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Mar 2020 07:39:33 -0700 (PDT)
Subject: Re: Atomic KMS API lacks the ability to set cursor hot-spot
 coordinates
From: Hans de Goede <hdegoede@redhat.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <9d86bbe4-70cf-273d-4d61-aec06011d441@redhat.com>
Message-ID: <b49a3d23-ddb2-c237-7e48-8b5fd8f3b38e@redhat.com>
Date: Wed, 18 Mar 2020 15:39:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <9d86bbe4-70cf-273d-4d61-aec06011d441@redhat.com>
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
Cc: =?UTF-8?Q?Jonas_=c3=85dahl?= <jadahl@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 3/18/20 3:28 PM, Hans de Goede wrote:
> Hi All,
> 
> I'm not sure if $subject was a conscious design decision, or an oversight,
> but that does not really matter.
> 
> ATM the Atomic KMS API lacks the ability to set cursor hot-spot
> coordinates. Mutter (and Weston) have tried to emulate this by shifting
> the coordinates for where to draw the cursor by the hotspot-coordinates
> and always using 0x0 for the hotspot.
> 
> But this breaks the so called "seamless mouse mode" for virtual-machines
> and there really is no way to fix this but to allow passing the proper
> hotspot coordinates to the virtual gfx-card.
> 
> Seamless-mode consists of 2 parts:
> 
> 1) Letting the VM-viewer window-system draw the cursor as it normally
> would draw it.
> 
> 2) Giving absolute coordinates of the mouse to the VM by e.g. emulating
> an USB drawing tablet. These coordinates come from translating the
> coordinates where the VM-viewer window-system is drawing the cursor
> to an absolute position using the top left corner of the view as 0x0
> and the bottom right corner as max-abs-x,max-abs-y.
> 
> 2) Means that any coordinates the window-system inside the VM passes to

This should be: "1) Means that ..."

> the VM's gfx-card for where to draw the cursor are basically totally
> ignored to avoid lag / flicker (and to not have to grab the cursor /
> confine it to the VM-viewer window and to not have to warp the
> pointer).
> 
> This means that the offset added to the coordinates by e.g. mutter to
> emulate the hotspot are ignored. For Seamless mouse mode to keep working
> properly the window-system inside the VM need to pass the VM's gfx-card
> the correct hotspot when setting the cursor. Which currently is not
> possible when restricting oneself to the atomic APIs.
> 
> Also see: https://gitlab.gnome.org/GNOME/mutter/issues/1094
> Where this is currently being tracked from the mutter side. Mutter
> internally has both atomic and legacy paths. The plan for now is to
> push the hotspot-emulation by shifting coordinates thing into the
> atomic path, fixing seamless mouse mode when running in legacy mode,
> combined with blacklisting vboxvideo, vmwgfx, qxl and cirrus from
> using atomic mode.
> 
> This is of course a workaround, eventually we would like to see
> the atomic API extended to allow passing the cursor hot spot.
> 
> I'm not really familiar enough with the atomic API to come up with
> an API design for this, but if there are suggestions on how this
> should look like from the uAPI side then I can take a shot at
> implementing this (and hooking it up in mutter's atomic code
> paths to test it).

Correction, I misunderstood the mutter devs that mutter already
has support for atomic, this support is in the works, but not yet
there yet. The internal mutter API has been reworked to closer
resemble the atomic APIs and that introduced the hotspot emulation
and broke seamless mouse mode in VMs.

Mutter does eventually want to switch to using the atomic APIs
and then this will become a real problem. This does mean that
testing any UAPI extension we come up with for this will be
harder then I thought.

Regards,

Hans


> p.s.
> 
> Before people start discussing how the VM / VM-viewer is broken here and
> the VM needs to be fixed. Seamless mouse mode exists for at least a
> decade and has worked fine during this entire decade. It also works
> fine when using the legacy (non atomic) DRM_IOCTL_MODE_CURSOR2 ioctl;
> 
> Also this problem reproduces with 2 completely independent VM code-bases,
> it has been seen on both qemu-kvm VMs and on VirtualBox VMs and I would
> not be surprised if other hypervisors are also affected.
> 
> And on the API consumer side this problem has been triggered by both
> mutter and Weston.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
