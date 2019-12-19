Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2E9125E95
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 11:10:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE40A89B8F;
	Thu, 19 Dec 2019 10:10:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8603789B8F
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 10:10:49 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id l136so2444365oig.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 02:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8Cr4KDsrSrUXnbU/Gr6Foj6VfqdF5VwH1MBdetl2SOg=;
 b=DAdi4AJAgSRWd7DNciQSFAP3HrKk34OYvC989VkKAT5AYDSuaR2HvJQIl7PfwTtmAa
 aRU/cySx3nfaeflRJijnSNuJRonpNKlwMQvd/U0NQ5MDbIwDVdNDLuDFEUDLuEIxYdk7
 Ur6BC0beoIjLF9tjm7iELb/AGfJD783mQajF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8Cr4KDsrSrUXnbU/Gr6Foj6VfqdF5VwH1MBdetl2SOg=;
 b=pcRPiTsmNSCmzr6Yh2B9C8zsMFyQqh26qiigHuTMOF8dRhfvInzUZql9SpQT3lQokX
 33lInFGr6lj+BEAEAEgrehelGsZ32Mk6kvdWq1+LjaNstN9mZoAk10F49Vq+8zjA3jnq
 Oa0cM14dv04B4kVMAZ+3WEbHDvALLpeotgwfFupKIrCTGG3Bp7CP1IfGPRH0ltX4uIQt
 mKXscUsLAlGZGjfkEKyx5+NlhoHX/FFtfuO7Bs+oMqVVDSnIUwaex+ng7yzo8U4qf5V1
 svuzXtybOZeI75Fv+JlDNbcbUqWoThVT4cnMVjFK9BX7w1v3Rn4VtoVnHWBpaXni6muC
 MNwg==
X-Gm-Message-State: APjAAAWsUduKQgVBZ30ezVNcHMXA21o4ueV/WCbaBzKKLjBSGe02FTb+
 58CIntnE3KKXp9mqLSDpzi22Cl7L5UBxQ9AZwfibkA==
X-Google-Smtp-Source: APXvYqw88arFrE2W1gR829kbJEMlM/aJQNJRHg62vPZaoFm7Qq8s5R4EHDI2vmTd/t7qDH93C3EIOQuCRgYi85tiruM=
X-Received: by 2002:aca:d985:: with SMTP id q127mr1737283oig.132.1576750248829; 
 Thu, 19 Dec 2019 02:10:48 -0800 (PST)
MIME-Version: 1.0
References: <07899bd5-e9a5-cff0-395f-b4fb3f0f7f6c@huawei.com>
 <f867543cf5d0fc3fdd0534749326411bcfc5e363.camel@collabora.com>
 <c2e5f5a5-5839-42a9-2140-903e99e166db@huawei.com>
 <fde72f73-d678-2b77-3950-d465f0afe904@huawei.com>
 <CAKMK7uFr03euoB6rY8z9zmRyznP41vwfdaKApZ_0HfYZT4Hq_w@mail.gmail.com>
 <fcca5732-c7dc-6e1d-dcbe-bfd914a4295b@huawei.com>
In-Reply-To: <fcca5732-c7dc-6e1d-dcbe-bfd914a4295b@huawei.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 19 Dec 2019 11:10:37 +0100
Message-ID: <CAKMK7uE+nfR2hv1ybfv1ZApZbGnnX7ZHfjFCv5K72ZaAmdtfug@mail.gmail.com>
Subject: Re: Warnings in DRM code when removing/unbinding a driver
To: John Garry <john.garry@huawei.com>
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
Cc: dbueso@suse.de, "airlied@linux.ie" <airlied@linux.ie>,
 "Chenfeng \(puck\)" <puck.chen@hisilicon.com>, Linuxarm <linuxarm@huawei.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kongxinwei \(A\)" <kong.kongxinwei@hisilicon.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Ezequiel Garcia <ezequiel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 19, 2019 at 11:03 AM John Garry <john.garry@huawei.com> wrote:
>
> On 19/12/2019 09:54, Daniel Vetter wrote:
> > On Wed, Dec 18, 2019 at 7:08 PM John Garry <john.garry@huawei.com> wrote:
> >>
> >> +
> >>
> >> So the v5.4 kernel does not have this issue.
> >>
> >> I have bisected the initial occurrence to:
> >>
> >> commit 37a48adfba6cf6e87df9ba8b75ab85d514ed86d8
> >> Author: Thomas Zimmermann <tzimmermann@suse.de>
> >> Date:   Fri Sep 6 14:20:53 2019 +0200
> >>
> >>       drm/vram: Add kmap ref-counting to GEM VRAM objects
> >>
> >>       The kmap and kunmap operations of GEM VRAM buffers can now be called
> >>       in interleaving pairs. The first call to drm_gem_vram_kmap() maps the
> >>       buffer's memory to kernel address space and the final call to
> >>       drm_gem_vram_kunmap() unmaps the memory. Intermediate calls to these
> >>       functions increment or decrement a reference counter.
> >>
> >> So this either exposes or creates the issue.
> >
> > Yeah that's just shooting the messenger.
>
> OK, so it exposes it.
>
>   Like I said, for most drivers
> > you can pretty much assume that their unload sequence has been broken
> > since forever. It's not often tested, and especially the hotunbind
> > from a device (as opposed to driver unload) stuff wasn't even possible
> > to get right until just recently.
>
> Do you think it's worth trying to fix this for 5.5 and earlier, or just
> switch to the device-managed interface for 5.6 and forget about 5.5 and
> earlier?

I suspect it's going to be quite some trickery to fix this properly
and everywhere, even for just one driver. Lots of drm drivers
unfortunately use anti-patterns with wrong lifetimes (e.g. you can't
use devm_kmalloc for anything that hangs of a drm_device, like
plane/crtc/connector). Except when it's for a real hotunpluggable
device (usb) we've never bothered backporting these fixes. Too much
broken stuff unfortunately.
-Daniel

>
> Thanks,
> John



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
