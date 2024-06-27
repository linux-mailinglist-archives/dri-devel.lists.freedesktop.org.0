Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A6A91AF94
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 21:23:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 494C110EB1F;
	Thu, 27 Jun 2024 19:22:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SCYjsoUD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7B810E29C;
 Thu, 27 Jun 2024 19:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719516172; x=1751052172;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=f0424bSiklUv3dKfLqqht2H9xdsz39cXfte2XnxmcPA=;
 b=SCYjsoUDnAondjggW2PsBlRgp4TztGDFytaSvenLx20MgL0dL7N3oAO3
 ci5mlqnj0+Th92iaWrVc1XXtMdGK/jTpeWg/Mj8IyZHmXIx/Y5w1J3vZM
 W2lAbrQ0mF54mek7JadtITbNRAQZzfjeSf9y86fFw3wocS7HrA12U8KdS
 nj/TY5GPrEMQ0KqyuUY+uekAvHToM0zHQytf0APsievHGQqwpbwRzQj6K
 cXP80F0l2XbjfAvZIBJwUkDrWbwohvHxpHnXb2yp0aSFUzAuPORTwpGfW
 wt/npv48CPo9dp40iOiaF8vZ4clwIO1j21rRv2/yu4RdM4Qc9X4/JlUjK A==;
X-CSE-ConnectionGUID: ARyi1UppQdGm9lSQr390TA==
X-CSE-MsgGUID: TT85tmGFRceWjGmuzYM0pQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="16492921"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208,217";a="16492921"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 12:22:50 -0700
X-CSE-ConnectionGUID: pq4J44+qTXS1I8uuV1pGDw==
X-CSE-MsgGUID: XlOd0v1pQzucK9lB45yTCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208,217";a="48820317"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.245.134])
 ([10.245.245.134])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 12:22:47 -0700
Content-Type: multipart/alternative;
 boundary="------------0JjPK0eQHPffGcoBYNOnkguI"
Message-ID: <6cb7c074-55cb-4825-9f80-5cf07bbd6745@linux.intel.com>
Date: Thu, 27 Jun 2024 21:22:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/6] drm/cgroup: Add memory accounting DRM cgroup
To: Maxime Ripard <mripard@kernel.org>
Cc: intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Friedrich Vock <friedrich.vock@gmx.de>, cgroups@vger.kernel.org,
 linux-mm@kvack.org, linux-doc@vger.kernel.org
References: <20240627154754.74828-1-maarten.lankhorst@linux.intel.com>
 <20240627154754.74828-3-maarten.lankhorst@linux.intel.com>
 <20240627-paper-vicugna-of-fantasy-c549ed@houat>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240627-paper-vicugna-of-fantasy-c549ed@houat>
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

This is a multi-part message in MIME format.
--------------0JjPK0eQHPffGcoBYNOnkguI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hey,

Den 2024-06-27 kl. 19:16, skrev Maxime Ripard:
> Hi,
>
> Thanks for working on this!
>
> On Thu, Jun 27, 2024 at 05:47:21PM GMT, Maarten Lankhorst wrote:
>> The initial version was based roughly on the rdma and misc cgroup
>> controllers, with a lot of the accounting code borrowed from rdma.
>>
>> The current version is a complete rewrite with page counter; it uses
>> the same min/low/max semantics as the memory cgroup as a result.
>>
>> There's a small mismatch as TTM uses u64, and page_counter long pages.
>> In practice it's not a problem. 32-bits systems don't really come with
>>> =4GB cards and as long as we're consistently wrong with units, it's
>> fine. The device page size may not be in the same units as kernel page
>> size, and each region might also have a different page size (VRAM vs GART
>> for example).
>>
>> The interface is simple:
>> - populate drmcgroup_device->regions[..] name and size for each active
>>    region, set num_regions accordingly.
>> - Call drm(m)cg_register_device()
>> - Use drmcg_try_charge to check if you can allocate a chunk of memory,
>>    use drmcg_uncharge when freeing it. This may return an error code,
>>    or -EAGAIN when the cgroup limit is reached. In that case a reference
>>    to the limiting pool is returned.
>> - The limiting cs can be used as compare function for
>>    drmcs_evict_valuable.
>> - After having evicted enough, drop reference to limiting cs with
>>    drmcs_pool_put.
>>
>> This API allows you to limit device resources with cgroups.
>> You can see the supported cards in /sys/fs/cgroup/drm.capacity
>> You need to echo +drm to cgroup.subtree_control, and then you can
>> partition memory.
>>
>> Signed-off-by: Maarten Lankhorst<maarten.lankhorst@linux.intel.com>
>> Co-developed-by: Friedrich Vock<friedrich.vock@gmx.de>
> I'm sorry, I should have wrote minutes on the discussion we had with TJ
> and Tvrtko the other day.
>
> We're all very interested in making this happen, but doing a "DRM"
> cgroup doesn't look like the right path to us.
>
> Indeed, we have a significant number of drivers that won't have a
> dedicated memory but will depend on DMA allocations one way or the
> other, and those pools are shared between multiple frameworks (DRM,
> V4L2, DMA-Buf Heaps, at least).
>
> This was also pointed out by Sima some time ago here:
> https://lore.kernel.org/amd-gfx/YCVOl8%2F87bqRSQei@phenom.ffwll.local/
>
> So we'll want that cgroup subsystem to be cross-framework. We settled on
> a "device" cgroup during the discussion, but I'm sure we'll have plenty
> of bikeshedding.
>
> The other thing we agreed on, based on the feedback TJ got on the last
> iterations of his series was to go for memcg for drivers not using DMA
> allocations.
>
> It's the part where I expect some discussion there too :)
>
> So we went back to a previous version of TJ's work, and I've started to
> work on:
>
>    - Integration of the cgroup in the GEM DMA and GEM VRAM helpers (this
>      works on tidss right now)
>
>    - Integration of all heaps into that cgroup but the system one
>      (working on this at the moment)

Should be similar to what I have then. I think you could use my work to 
continue it.

I made nothing DRM specific except the name, if you renamed it the 
device resource management cgroup and changed the init function 
signature to take a name instead of a drm pointer, nothing would change. 
This is exactly what I'm hoping to accomplish, including reserving memory.

The nice thing is that it should be similar to the memory cgroup 
controller in semantics, so you would have the same memory behavior 
whether you use the device cgroup or memory cgroup.

I'm sad I missed the discussion, but hopefully we can coordinate more 
now that we know we're both working on it. :)

Cheers,

~Maarten

--------------0JjPK0eQHPffGcoBYNOnkguI
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hey,<br>
    </p>
    <div class="moz-cite-prefix">Den 2024-06-27 kl. 19:16, skrev Maxime
      Ripard:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20240627-paper-vicugna-of-fantasy-c549ed@houat">
      <pre class="moz-quote-pre" wrap="">Hi,

Thanks for working on this!

On Thu, Jun 27, 2024 at 05:47:21PM GMT, Maarten Lankhorst wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">The initial version was based roughly on the rdma and misc cgroup
controllers, with a lot of the accounting code borrowed from rdma.

The current version is a complete rewrite with page counter; it uses
the same min/low/max semantics as the memory cgroup as a result.

There's a small mismatch as TTM uses u64, and page_counter long pages.
In practice it's not a problem. 32-bits systems don't really come with
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">=4GB cards and as long as we're consistently wrong with units, it's
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">fine. The device page size may not be in the same units as kernel page
size, and each region might also have a different page size (VRAM vs GART
for example).

The interface is simple:
- populate drmcgroup_device-&gt;regions[..] name and size for each active
  region, set num_regions accordingly.
- Call drm(m)cg_register_device()
- Use drmcg_try_charge to check if you can allocate a chunk of memory,
  use drmcg_uncharge when freeing it. This may return an error code,
  or -EAGAIN when the cgroup limit is reached. In that case a reference
  to the limiting pool is returned.
- The limiting cs can be used as compare function for
  drmcs_evict_valuable.
- After having evicted enough, drop reference to limiting cs with
  drmcs_pool_put.

This API allows you to limit device resources with cgroups.
You can see the supported cards in /sys/fs/cgroup/drm.capacity
You need to echo +drm to cgroup.subtree_control, and then you can
partition memory.

Signed-off-by: Maarten Lankhorst <a class="moz-txt-link-rfc2396E" href="mailto:maarten.lankhorst@linux.intel.com">&lt;maarten.lankhorst@linux.intel.com&gt;</a>
Co-developed-by: Friedrich Vock <a class="moz-txt-link-rfc2396E" href="mailto:friedrich.vock@gmx.de">&lt;friedrich.vock@gmx.de&gt;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I'm sorry, I should have wrote minutes on the discussion we had with TJ
and Tvrtko the other day.

We're all very interested in making this happen, but doing a "DRM"
cgroup doesn't look like the right path to us.

Indeed, we have a significant number of drivers that won't have a
dedicated memory but will depend on DMA allocations one way or the
other, and those pools are shared between multiple frameworks (DRM,
V4L2, DMA-Buf Heaps, at least).

This was also pointed out by Sima some time ago here:
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/amd-gfx/YCVOl8%2F87bqRSQei@phenom.ffwll.local/">https://lore.kernel.org/amd-gfx/YCVOl8%2F87bqRSQei@phenom.ffwll.local/</a>

So we'll want that cgroup subsystem to be cross-framework. We settled on
a "device" cgroup during the discussion, but I'm sure we'll have plenty
of bikeshedding.

The other thing we agreed on, based on the feedback TJ got on the last
iterations of his series was to go for memcg for drivers not using DMA
allocations.

It's the part where I expect some discussion there too :)

So we went back to a previous version of TJ's work, and I've started to
work on:

  - Integration of the cgroup in the GEM DMA and GEM VRAM helpers (this
    works on tidss right now)

  - Integration of all heaps into that cgroup but the system one
    (working on this at the moment)</pre>
    </blockquote>
    <p>Should be similar to what I have then. I think you could use my
      work to continue it.<span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">I made nothing DRM specific except the name, if you renamed it the device resource management cgroup and changed the init function signature to take a name instead of a drm pointer, nothing would change. This is exactly what I'm hoping to accomplish, including reserving memory.</span></p>
    <p><span style="white-space: pre-wrap">The nice thing is that it should be similar to the memory cgroup controller in semantics, so you would have the same memory behavior whether you use the device cgroup or memory cgroup.</span></p>
    <p><span style="white-space: pre-wrap">I'm sad I missed the discussion, but hopefully we can coordinate more now that we know we're both working on it. :)</span></p>
    <p><span style="white-space: pre-wrap">Cheers,</span></p>
    <p><span style="white-space: pre-wrap">~Maarten</span></p>
  </body>
</html>

--------------0JjPK0eQHPffGcoBYNOnkguI--
