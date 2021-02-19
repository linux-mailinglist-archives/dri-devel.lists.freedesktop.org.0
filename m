Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A4B31F746
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 11:24:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B26A76EACC;
	Fri, 19 Feb 2021 10:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D046EAD0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 10:24:35 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id x20so1632159oie.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 02:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zs4u75y6/pPIiJjru/rBZ0AGNnM/AMTweaNcPfG5Uco=;
 b=VaynWPt8Sn0QqhaAAuNCum4FvZ3pjuHHW6BVh5wk4grF9xJXp7eM4xNUNvDaQwaoyt
 T8+6t3mLyozl/ZzsxfKuVA7BZJSsWrlR8yY8nrVSggG6fSbx2mVmZhfEZQ7IZszy8z99
 YSjhGl/YZgt485sLWxyle1RvyVJczrBInxu08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zs4u75y6/pPIiJjru/rBZ0AGNnM/AMTweaNcPfG5Uco=;
 b=ZHdeNHz8j5ZrDS2k1U3Ik3DlVpyJG2WpodF/thqHDj5bI1agkbMxSMmJnQefl6/7o9
 IZuNok4dA34ebbvwxmepLm2UhVfQVevyc/rTyGvNDnJCWLGQl9Ulbhe3GBGfW2QOmCsV
 1E5Ho+E5fru5DfWPFQh2N0XHReQeb/vkNGhiyWafPtmZheKJfey7a4ZwoYaU5ARzeXzk
 U/D2RF1N8byEpzgTtKdpRkWU4xIuGlGwH/wQKmTfvcmRQCAobqSZZhm0iqGhzV6+GElf
 sWOAQJBsXhfe1LzA3HgPef2g9H3o8OX+wKPyCNVw9jdFKgsNhxmhhIBgM0vrofhSW2JH
 u3lA==
X-Gm-Message-State: AOAM531yTolSUMPKXGYOrxgDz3J7ZkFsvNOQ5psWbO2vwah2kLyAJxhY
 JfdosPA7DKt4l5WLKK4/TvFb/UF49rFKaZuLSaEpvw==
X-Google-Smtp-Source: ABdhPJwSg6phQ7A8TDtt0jTtQj1Zi1O1sBWsA8dhmXqH8DJUEfsdC5DXOEn1pJ06QXu0VyF7NEOIbRqVz+k5j7rIXUs=
X-Received: by 2002:a05:6808:b1a:: with SMTP id
 s26mr6018705oij.128.1613730275149; 
 Fri, 19 Feb 2021 02:24:35 -0800 (PST)
MIME-Version: 1.0
References: <YAbpxbTifiupYJML@phenom.ffwll.local>
 <c4f911dc-99a9-387c-21d1-a3ca2cfd78da@amd.com>
 <CAKMK7uFKMgKAQSCgunjStuUTbuiwdR3zjwtn_Ms1XJjO0ML2EA@mail.gmail.com>
 <755e7c8a-5bd7-6414-8141-249a1ba5a865@amd.com>
 <YAfyPEB2gpMnW/PP@phenom.ffwll.local>
 <8ea4b2d7-d5f3-3708-724d-c70520603283@amd.com>
 <CAKMK7uE11MonjPB3dmy6u=b029am1p2KqJ57DgLUGu-9QgtebA@mail.gmail.com>
 <75e782f1-4cb9-9210-87d2-e7d2a76782f1@amd.com>
 <CAKMK7uH=ycuBQ5qbujA8kwcrExAC4YAM26W-7wJjE7RS4zPiHw@mail.gmail.com>
 <6152bf16-6086-17f5-4157-c9be0ef84155@amd.com>
 <YCJa2HraImprr4Ew@phenom.ffwll.local>
 <871a02d8-e776-dd37-bd25-3169f8167923@amd.com>
In-Reply-To: <871a02d8-e776-dd37-bd25-3169f8167923@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 19 Feb 2021 11:24:23 +0100
Message-ID: <CAKMK7uEKERRmQRfngkO_1yfi6kHJjarJncFm3eZ1Uxcf9pNWGg@mail.gmail.com>
Subject: Re: [PATCH v4 00/14] RFC Support hot device unplug in amdgpu
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Qiang Yu <yuq825@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>, Alex Deucher <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 18, 2021 at 9:03 PM Andrey Grodzovsky
<Andrey.Grodzovsky@amd.com> wrote:
>
> Looked a bit into it, I want to export sync_object to FD and import  from that FD
> such that I will wait on the imported sync object handle from one thread while
> signaling the exported sync object handle from another (post device unplug) ?
>
> My problem is how to create a sync object with a non signaled 'fake' fence ?
> I only see API that creates it with already signaled fence (or none) -
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_syncobj.c#L56
>
> P.S I expect the kernel to crash since unlike with dma_bufs we don't hold
> drm device reference here on export.

Well maybe there's no crash. I think if you go through all your
dma_fence that you have and force-complete them, then I think external
callers wont go into the driver anymore. But there's still pointers
potentially pointing at your device struct and all that, but should
work. Still needs some audit ofc.

Wrt how you get such a free-standing fence, that's amdgpu specific. Roughly
- submit cs
- get the fence for that (either sync_file, but I don't think amdgpu
supports that, or maybe through drm_syncobj)
- hotunplug
- wait on that fence somehow (drm_syncobj has direct uapi for this,
same for sync_file I think)

Cheers, Daniel

>
> Andrey
>
> On 2/9/21 4:50 AM, Daniel Vetter wrote:
> > Yeah in the end we'd need 2 hw devices for testing full fence
> > functionality. A useful intermediate step would be to just export the
> > fence (either as sync_file, which I think amdgpu doesn't support because
> > no android egl support in mesa) or drm_syncobj (which you can do as
> > standalone fd too iirc), and then just using the fence a bit from
> > userspace (like wait on it or get its status) after the device is
> > unplugged.



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
