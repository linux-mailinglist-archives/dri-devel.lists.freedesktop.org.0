Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD41F3A793A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 10:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB8A989FC8;
	Tue, 15 Jun 2021 08:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0951089F89;
 Tue, 15 Jun 2021 08:41:42 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id he7so20987538ejc.13;
 Tue, 15 Jun 2021 01:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=tyjV8rdvfElOJQlUqZZd2G6nwEJ8gEH3uJMx3ZAHxkw=;
 b=Vj6fipPTB7OFI1lMUlPXsstPWMS24VJO2AOGcRaWZR2QIYXenoRmZXIKZjyD6ZkshJ
 OhkKrBYjLmUgCTAkcefi2/SqB3CU033MuoNueakS25YLawkek0RoOk1B0/EbNK6JK9mf
 YxmdM22a9FWVulao+BFXmPVY1bRWjncE7szElvgvrXrza1mIllcuLJHcC7mKsT+ry7rD
 bY19fv7zkGDGiAULhMPFI4z6WXB4EFW1SGZYcyIfot4C5eCLnzueYNzCVjTnkPdVLMi0
 OJUL2RM294AMbi3gbmbmXBxkynWD+/OiOzTDVIDhCJtv0PL9a0R7Wzm4clmqoYKhRMPM
 zTDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=tyjV8rdvfElOJQlUqZZd2G6nwEJ8gEH3uJMx3ZAHxkw=;
 b=OuDbBGCGZdjtaUDZaBlVlNkGR+nOK7iZUGV4NSQkW1OSW1Ip63BZwy8d3B/+IRzc+6
 A3xgDoZcZhwcbinHBPhdaNTkqRF3uAHpI8s5ed8gnz2VHLKHIom7aAJ4sdTM8RUXlNKI
 n9N7G2ASa5slVXB3z0za4i5p12GpA5NRxSAPojObocyhl3P2xp7eH7Pn9iOdfzP6i1zw
 Ry78BpGuKZ6aq0lrIgmS4Ly5fzyaCZ6ysBjpFuLdzL8qInFiXKWiBocIII3zLN87RRoR
 FlXTdBaIOS/QM+JVoabSwjqYJd4gn0VIDlNquJK5SfMutcIWmZk/alKUYcC2oKn32cGq
 8eeA==
X-Gm-Message-State: AOAM531eyM9P0ITWU3EMnkbv6Fi8j5dAXxb2KC5Q1B0oc97uNje6F5v0
 MD5bMkhEXKXqf9kvVq7PFOxqsUs0vuk=
X-Google-Smtp-Source: ABdhPJx6fvCfitAZKz/17n+ERh2qpKJpdPTIOyYRD/vlGZh6k3Stj/rzUNCAGQ63i7F8DgtEfYvISg==
X-Received: by 2002:a17:907:6289:: with SMTP id
 nd9mr19292846ejc.384.1623746500769; 
 Tue, 15 Jun 2021 01:41:40 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:f438:4e93:3853:400c?
 ([2a02:908:1252:fb60:f438:4e93:3853:400c])
 by smtp.gmail.com with ESMTPSA id y21sm1121040ejk.72.2021.06.15.01.41.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 01:41:40 -0700 (PDT)
Subject: Re: [Mesa-dev] [PATCH 0/6] dma-buf: Add an API for exporting sync
 files (v12)
To: Jason Ekstrand <jason@jlekstrand.net>, Daniel Stone <daniels@collabora.com>
References: <20210610210925.642582-1-jason@jlekstrand.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <29e9795e-8ec7-282c-c8ec-413eaed2e4d4@gmail.com>
Date: Tue, 15 Jun 2021 10:41:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210610210925.642582-1-jason@jlekstrand.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 wayland-devel@lists.freedesktop.org, mesa-dev@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jason & Daniel,

maybe I should explain once more where the problem with this approach is 
and why I think we need to get that fixed before we can do something 
like this here.

To summarize what this patch here does is that it copies the exclusive 
fence and/or the shared fences into a sync_file. This alone is totally 
unproblematic.

The problem is what this implies. When you need to copy the exclusive 
fence to a sync_file then this means that the driver is at some point 
ignoring the exclusive fence on a buffer object.

When you combine that with complex drivers which use TTM and buffer 
moves underneath you can construct an information leak using this and 
give userspace access to memory which is allocated to the driver, but 
not yet initialized.

This way you can leak things like page tables, passwords, kernel data 
etc... in large amounts to userspace and is an absolutely no-go for 
security.

That's why I'm said we need to get this fixed before we upstream this 
patch set here and especially the driver change which is using that.

Regards,
Christian.

Am 10.06.21 um 23:09 schrieb Jason Ekstrand:
> Modern userspace APIs like Vulkan are built on an explicit
> synchronization model.  This doesn't always play nicely with the
> implicit synchronization used in the kernel and assumed by X11 and
> Wayland.  The client -> compositor half of the synchronization isn't too
> bad, at least on intel, because we can control whether or not i915
> synchronizes on the buffer and whether or not it's considered written.
>
> The harder part is the compositor -> client synchronization when we get
> the buffer back from the compositor.  We're required to be able to
> provide the client with a VkSemaphore and VkFence representing the point
> in time where the window system (compositor and/or display) finished
> using the buffer.  With current APIs, it's very hard to do this in such
> a way that we don't get confused by the Vulkan driver's access of the
> buffer.  In particular, once we tell the kernel that we're rendering to
> the buffer again, any CPU waits on the buffer or GPU dependencies will
> wait on some of the client rendering and not just the compositor.
>
> This new IOCTL solves this problem by allowing us to get a snapshot of
> the implicit synchronization state of a given dma-buf in the form of a
> sync file.  It's effectively the same as a poll() or I915_GEM_WAIT only,
> instead of CPU waiting directly, it encapsulates the wait operation, at
> the current moment in time, in a sync_file so we can check/wait on it
> later.  As long as the Vulkan driver does the sync_file export from the
> dma-buf before we re-introduce it for rendering, it will only contain
> fences from the compositor or display.  This allows to accurately turn
> it into a VkFence or VkSemaphore without any over- synchronization.
>
> This patch series actually contains two new ioctls.  There is the export
> one mentioned above as well as an RFC for an import ioctl which provides
> the other half.  The intention is to land the export ioctl since it seems
> like there's no real disagreement on that one.  The import ioctl, however,
> has a lot of debate around it so it's intended to be RFC-only for now.
>
> Mesa MR: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4037
> IGT tests: https://patchwork.freedesktop.org/series/90490/
>
> v10 (Jason Ekstrand, Daniel Vetter):
>   - Add reviews/acks
>   - Add a patch to rename _rcu to _unlocked
>   - Split things better so import is clearly RFC status
>
> v11 (Daniel Vetter):
>   - Add more CCs to try and get maintainers
>   - Add a patch to document DMA_BUF_IOCTL_SYNC
>   - Generally better docs
>   - Use separate structs for import/export (easier to document)
>   - Fix an issue in the import patch
>
> v12 (Daniel Vetter):
>   - Better docs for DMA_BUF_IOCTL_SYNC
>
> v12 (Christian König):
>   - Drop the rename patch in favor of Christian's series
>   - Add a comment to the commit message for the dma-buf sync_file export
>     ioctl saying why we made it an ioctl on dma-buf
>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Michel Dänzer <michel@daenzer.net>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> Cc: Daniel Stone <daniels@collabora.com>
> Cc: mesa-dev@lists.freedesktop.org
> Cc: wayland-devel@lists.freedesktop.org
> Test-with: 20210524205225.872316-1-jason@jlekstrand.net
>
> Christian König (1):
>    dma-buf: Add dma_fence_array_for_each (v2)
>
> Jason Ekstrand (5):
>    dma-buf: Add dma_resv_get_singleton (v6)
>    dma-buf: Document DMA_BUF_IOCTL_SYNC (v2)
>    dma-buf: Add an API for exporting sync files (v12)
>    RFC: dma-buf: Add an extra fence to dma_resv_get_singleton_unlocked
>    RFC: dma-buf: Add an API for importing sync files (v7)
>
>   Documentation/driver-api/dma-buf.rst |   8 ++
>   drivers/dma-buf/dma-buf.c            | 103 +++++++++++++++++++++++++
>   drivers/dma-buf/dma-fence-array.c    |  27 +++++++
>   drivers/dma-buf/dma-resv.c           | 110 +++++++++++++++++++++++++++
>   include/linux/dma-fence-array.h      |  17 +++++
>   include/linux/dma-resv.h             |   2 +
>   include/uapi/linux/dma-buf.h         | 103 ++++++++++++++++++++++++-
>   7 files changed, 369 insertions(+), 1 deletion(-)
>

