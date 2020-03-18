Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C73A0189F36
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 16:10:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B52E46E90E;
	Wed, 18 Mar 2020 15:10:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 146CF6E90E
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 15:10:05 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id k21so26099780oij.5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 08:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F/BGMEtwW+enZISnKBEE2aNCLDivo2FCgsVc930mcu4=;
 b=eV2T1CT/ZE+JSAVLbf5x8CD171HKIEOWWAZ1huc4UXi9adyyvOOs8kTxsbAUPijfJN
 5OJ/+xhYd8sry1HLUYkkTUvbHcOwfIjvcxlCV/tlYG6pszwmWbyy+WJt514ih4KQDzbS
 7lUuDvVmGBrUW2zL01p9Qsmm1z6Wo9JOZTYug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F/BGMEtwW+enZISnKBEE2aNCLDivo2FCgsVc930mcu4=;
 b=H0WtFqWVjIT9KjUtdVFwxz1B9njZOkdZqfnmIk9iplf1nvSlRiLmvhVuTqZOupg/4d
 zFP1/JR0OYrANhEkS4CKfwLfubmS+gTc+J4NVURMBrgZxv9MIP4YkUxzx+Sr2wjRRpd1
 Co8DagLALvL2dgJqHiIkluhigOtLyHSAi1wbToRIkkmt0hn+E6gdeehatcdpBswgmqfu
 nLltJvGEO98Jat3gILzqMECoilzDPyohRc3wm+SSsJpTh2HU8KDr9JI/tBQ5kyN5S1lF
 QxDXJtF8od6vxYsExjzPXWLmgMiaOl51BXkEIdilt4LFGJOP9IGstXttHEieV8OBoGbN
 4sjQ==
X-Gm-Message-State: ANhLgQ0Cn4iuWcYenh7fNz//V8CLpokWfGNoiS7vvNOy8PrGZgE1zG2/
 uOl/NGc/K6xxqxTOkn7N1AKXb3oVNQ3BXsV1cMrXiw==
X-Google-Smtp-Source: ADFU+vsSyXNmwi7gT4hLlCbw6N/NXRBPr1DuXc0v3CEbcb+1q2sjqOzzH31CSs1RJvgbQVuADNGMSLGhM6zySxja9Ak=
X-Received: by 2002:aca:be08:: with SMTP id o8mr3315945oif.101.1584544204180; 
 Wed, 18 Mar 2020 08:10:04 -0700 (PDT)
MIME-Version: 1.0
References: <9d86bbe4-70cf-273d-4d61-aec06011d441@redhat.com>
In-Reply-To: <9d86bbe4-70cf-273d-4d61-aec06011d441@redhat.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 18 Mar 2020 16:09:53 +0100
Message-ID: <CAKMK7uFo67jkgnDFb5Gs02CCkTVCe11ieqp6jeEZjJUjpF8Ssg@mail.gmail.com>
Subject: Re: Atomic KMS API lacks the ability to set cursor hot-spot
 coordinates
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: =?UTF-8?B?Sm9uYXMgw4VkYWhs?= <jadahl@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 18, 2020 at 3:29 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
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

Fully aware, we simply never had userspace for this. So
- type weston patch
- type kernel patch (iirc this might be some work of moving the
hotspot coordinates from struct drm_plane to drm_plane_state)
- wire up atomic property (it'd just do "CURSOR_HOT_X/Y" and be done
with it, only attached to cursor planes that support it ofc)
- I think all drivers supporting vm cursor hotspot are now atomic, so
would be good to garbage-collect the old legacy infrastructure
completely. legacy cursor ioctl will remap to the atomic call
transparently like we do now already for everything else
- type igt
- get it all reviewed and merged.

0 design reasons for omitting this, simply Not Yet Done (tm).

Cheers, Daniel

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
>
> Regards,
>
> Hans
>
>
>
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
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
