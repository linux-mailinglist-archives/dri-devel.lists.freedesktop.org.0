Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B21156F54E0
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 11:37:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7280B10E24B;
	Wed,  3 May 2023 09:37:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D104110E232;
 Wed,  3 May 2023 09:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683106619; x=1714642619;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=MffWgZiRrbHn3+wIAetXWUaaQo9Vm7loAXSeTnnZ5i0=;
 b=FptxY2L807uYmL1h4tWylyIn+mGZvRfe4AtnVCenftST9ddTp7XZbjvj
 H4sVUbkMkrerOMDJNBgDdWKvpy916SK0R83+C0NkhF9k3toCNwPOMhyXm
 cVolqgMURDbdjuqdzVG1rWEUjDyw4qpD1y7GUSqqpXs1BvAmaXRvMC3SA
 xklscGFZFRSsrb9deRn91KNRupiPmbNdBGk3jiVVz0hhVS5zUr6cjai1h
 ju8wsbAm5mYgpLsVNmfJmM13acEPezc4H4V96ztdgVFNhGYyLe21+HZqA
 FH1lsYf4L0fhaH5M2O79E26hGlaVNoOAeZZM5P/D5lMLZTgU/D/NOl9Pb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="350687520"
X-IronPort-AV: E=Sophos;i="5.99,246,1677571200"; 
 d="scan'208,217";a="350687520"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 02:36:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="1026437806"
X-IronPort-AV: E=Sophos;i="5.99,246,1677571200"; 
 d="scan'208,217";a="1026437806"
Received: from bcurcic-mobl1.ger.corp.intel.com (HELO [10.249.36.167])
 ([10.249.36.167])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 02:36:54 -0700
Content-Type: multipart/alternative;
 boundary="------------vwH6Tjnx2mz1b995oCSxL25w"
Message-ID: <3bf126ea-abec-7e44-c9ac-0ff429e2001a@linux.intel.com>
Date: Wed, 3 May 2023 11:36:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.1
Subject: Re: [Intel-xe] [RFC PATCH 3/4] drm/ttm: Handle -EAGAIN in
 ttm_resource_alloc as -ENOSPC.
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, cgroups@vger.kernel.org,
 intel-xe@lists.freedesktop.org
References: <20230503083500.645848-1-maarten.lankhorst@linux.intel.com>
 <20230503083500.645848-4-maarten.lankhorst@linux.intel.com>
 <888841c4-7bd4-8174-7786-033715c995c6@linux.intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <888841c4-7bd4-8174-7786-033715c995c6@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Zefan Li <lizefan.x@bytedance.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Johannes Weiner <hannes@cmpxchg.org>,
 Tejun Heo <tj@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------vwH6Tjnx2mz1b995oCSxL25w
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2023-05-03 11:11, Thomas Hellström wrote:
> Hi, Maarten
>
> On 5/3/23 10:34, Maarten Lankhorst wrote:
>> This allows the drm cgroup controller to return no space is available..
>>
>> XXX: This is a hopeless simplification that changes behavior, and
>> returns -ENOSPC even if we could evict ourselves from the current
>> cgroup.
>>
>> Ideally, the eviction code becomes cgroup aware, and will force eviction
>> from the current cgroup or its parents.
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>
> Thinking of the shrinker analogy, do non-cgroup aware shrinkers just 
> shrink blindly or do they reject shrinking like this patch when a 
> cgroup limit is reached?

When I made the cgroup controller return -ENOSPC I just hit an infinite 
loop since it sees enough memory is free and tries to allocate memory 
again. Hence the -EAGAIN handling here. It returns -ENOSPC, without the 
infinite looping.

I think there should be 2 code paths:

- OOM, generic case: Handle like we do now. No need for special cgroup 
handling needed right now.

Might change if we implement cgroup memory semantics. See the memory 
section of Documentation/admin-guide/cgroup-v2.rst

It could be useful regardless.

- OOM, cgroup limit reached: Check for each BO if it's valuable to evict to unblock the relevant limit.


              / cg1.0
root - cg1 --  cg1.1
    \         \ cg1.2
     \  cg2

If we hit the cg limit in cg1.0 for only cg1.0, it doesn't make sense to evict from any other cgroup.
If we hit the limit in cg1.0 for the entirety of cg1, it makes sense to evict from any of the cg1 nodes, but not from cg2.

This should be relatively straightforward to implement. We identify which cgroup hit a limit, and then let the shrinker
run only on that cgroup and its childs.

This could be simplified to the OOM generic case, for root/NULL cg.


~Maarten

--------------vwH6Tjnx2mz1b995oCSxL25w
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2023-05-03 11:11, Thomas Hellström
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:888841c4-7bd4-8174-7786-033715c995c6@linux.intel.com">Hi,
      Maarten
      <br>
      <br>
      On 5/3/23 10:34, Maarten Lankhorst wrote:
      <br>
      <blockquote type="cite">This allows the drm cgroup controller to
        return no space is available..
        <br>
        <br>
        XXX: This is a hopeless simplification that changes behavior,
        and
        <br>
        returns -ENOSPC even if we could evict ourselves from the
        current
        <br>
        cgroup.
        <br>
        <br>
        Ideally, the eviction code becomes cgroup aware, and will force
        eviction
        <br>
        from the current cgroup or its parents.
        <br>
        <br>
        Signed-off-by: Maarten Lankhorst
        <a class="moz-txt-link-rfc2396E" href="mailto:maarten.lankhorst@linux.intel.com">&lt;maarten.lankhorst@linux.intel.com&gt;</a>
        <br>
      </blockquote>
      <br>
      Thinking of the shrinker analogy, do non-cgroup aware shrinkers
      just shrink blindly or do they reject shrinking like this patch
      when a cgroup limit is reached?
      <br>
    </blockquote>
    <p>When I made the cgroup controller return -ENOSPC I just hit an
      infinite loop since it sees enough memory is free and tries to
      allocate memory again. Hence the -EAGAIN handling here. It returns
      -ENOSPC, without the infinite looping.</p>
    <p>I think there should be 2 code paths:</p>
    <p>- OOM, generic case: Handle like we do now. No need for special
      cgroup handling needed right now.</p>
    <p>Might change if we implement cgroup memory semantics. See the
      memory section of Documentation/admin-guide/cgroup-v2.rst <br>
    </p>
    <p>It could be useful regardless.<br>
    </p>
    <pre>- OOM, cgroup limit reached: Check for each BO if it's valuable to evict to unblock the relevant limit.


             / cg1.0
root - cg1 --  cg1.1
   \         \ cg1.2
    \  cg2

If we hit the cg limit in cg1.0 for only cg1.0, it doesn't make sense to evict from any other cgroup.
If we hit the limit in cg1.0 for the entirety of cg1, it makes sense to evict from any of the cg1 nodes, but not from cg2.

This should be relatively straightforward to implement. We identify which cgroup hit a limit, and then let the shrinker
run only on that cgroup and its childs.

This could be simplified to the OOM generic case, for root/NULL cg.


~Maarten
</pre>
  </body>
</html>

--------------vwH6Tjnx2mz1b995oCSxL25w--
