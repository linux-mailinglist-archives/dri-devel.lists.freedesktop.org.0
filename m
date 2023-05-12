Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4FD6FFEF7
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 04:33:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C27FE10E611;
	Fri, 12 May 2023 02:33:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CFC110E611
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 02:33:31 +0000 (UTC)
Received: from [192.168.2.193] (109-252-144-198.dynamic.spd-mgts.ru
 [109.252.144.198])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 80068660574C;
 Fri, 12 May 2023 03:33:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1683858806;
 bh=QPRjKnSsSd+hW6g+3RQUwtjoMbBDMKZF34astvPh9W8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BCb3xAg/AC2JGzZowjaB8rdbHD1gvPnoZpy+TVxWrHxezto2SsU8a/T0/jPQekpcT
 tLfa/Jk99tBSsvmpommhiZrv7yZxr/AzDzAq3PyT8xTuloGE/UTu8WOmQOZ8uZjbqK
 kx7zZhCEQZ68RqPp1aUE+QPaw8XUEgc/lztu8MSxl1HJqt3HpIFxQ04Oq0ZFluyKIz
 EyN3vDEjqoh5smFKleMPtHoF8X4SPU/R2mQhN+p6aTsR4O3tMrzOBg6xYa+24EcKIo
 idi/Mf8I4K3wmUZgz5XOH0P0uau3T7IatG1CJJYZehswRULTIfCb15EpPvEIjMFXph
 ymQ0I0WFXUA+A==
Message-ID: <a453d562-7e93-aef3-a533-171f572b6ee3@collabora.com>
Date: Fri, 12 May 2023 05:33:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 0/3] Add sync object UAPI support to VirtIO-GPU driver
To: Gurchetan Singh <gurchetansingh@chromium.org>,
 Rob Clark <robdclark@gmail.com>
References: <20230416115237.798604-1-dmitry.osipenko@collabora.com>
 <141b928d-6165-f282-b8e6-f140cb09333d@collabora.com>
 <CAAfnVBnrUotph4TYJVu9Bohqv3m80t90V34TNhh-Tspxwsj-ZQ@mail.gmail.com>
 <CAF6AEGs4fuq4i8UJdO5hvgHTNhzFMKGZ87+w1oyvL0LAqWio6A@mail.gmail.com>
 <CAAfnVBkLhYVaSG3U_QUZwXLFv-XT=9F2v2pgrCDQQBgNZ3MSWA@mail.gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAAfnVBkLhYVaSG3U_QUZwXLFv-XT=9F2v2pgrCDQQBgNZ3MSWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 David Airlie <airlied@redhat.com>, kernel@collabora.com,
 Emil Velikov <emil.velikov@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/12/23 03:17, Gurchetan Singh wrote:
...
> Can we get one of the Mesa MRs reviewed first?  There's currently no
> virtio-intel MR AFAICT, and the amdgpu one is marked as "Draft:".
> 
> Even for the amdgpu, Pierre suggests the feature "will be marked as
> experimental both in Mesa and virglrenderer" and we can revise as needed.
> The DRM requirements seem to warn against adding an UAPI too hastily...
> 
> You can get the deqp-vk 1.2 tests to pass with the current UAPI, if you
> just change your mesa <--> virglrenderer protocol a little.  Perhaps that
> way is even better, since you plumb the in sync-obj into host-side command
> submission.
> 
> Without inter-context sharing of the fence, this MR really only adds guest
> kernel syntactic sugar.
> 
> Note I'm not against syntactic sugar, but I just want to point out that you
> can likely merge the native context work without any UAPI changes, in case
> it's not clear.
> 
> If this was for the core drm syncobj implementation, and not just
>> driver ioctl parsing and wiring up the core helpers, I would agree
>> with you.
>>
> 
> There are several possible and viable paths to get the features in question
> (VK1.2 syncobjs, and inter-context fence sharing).  There are paths
> entirely without the syncobj, paths that only use the syncobj for the
> inter-context fence sharing case and create host syncobjs for VK1.2, paths
> that also use guest syncobjs in every proxied command submission.
> 
> It's really hard to tell which one is better.  Here's my suggestion:
> 
> 1) Get the native contexts reviewed/merged in Mesa/virglrenderer using the
> current UAPI.  Options for VK1.2 include: pushing down the syncobjs to the
> host, and simulating the syncobj (as already done).  It's fine to mark
> these contexts as "experimental" like msm-experimental.  That will allow
> you to experiment with the protocols, come up with tests, and hopefully
> determine an answer to the host versus guest syncobj question.
> 
> 2) Once you've completed (1), try to add UAPI changes for features that are
> missing or things that are suboptimal with the knowledge gained from doing
> (2).
> 
> WDYT?

Having syncobj support available by DRM driver is a mandatory
requirement for native contexts because userspace (Mesa) relies on sync
objects support presence. In particular, Intel Mesa driver checks
whether DRM driver supports sync objects to decide which features are
available, ANV depends on the syncobj support.

I'm not familiar with a history of Venus and its limitations. Perhaps
the reason it's using host-side syncobjs is to have 1:1 Vulkan API
mapping between guest and host. Not sure if Venus could use guest
syncobjs instead or there are problems with that.

When syncobj was initially added to kernel, it was done from the needs
of supporting Vulkan wait API. For Venus the actual Vulkan driver is on
host side, while for native contexts it's on guest side. Native contexts
don't need syncobj on host side, it will be unnecessary overhead for
every nctx to have it on host. Hence, if there is no good reason for
host-side syncobjs, then why do that?

Native contexts pass deqp synchronization tests, they use sync objects
universally for both GL and VK. Games work, piglit/deqp passing. What
else you're wanting to test? Turnip?

The AMDGPU code has been looked and it looks good. It's a draft for now
because of the missing sync objects UAPI and other virglrender/Qemu
changes required to get KMS working. Maybe it will be acceptable to
merge the Mesa part once kernel will get sync objects supported, will
need to revisit it.

I'm not opening MR for virtio-intel because it has open questions that
need to be resolved first.

-- 
Best regards,
Dmitry

