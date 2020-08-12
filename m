Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 209C3242DF6
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 19:19:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF0086E942;
	Wed, 12 Aug 2020 17:19:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3089B6E940
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 17:19:40 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f3424410000>; Wed, 12 Aug 2020 10:17:53 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 12 Aug 2020 10:19:39 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 12 Aug 2020 10:19:39 -0700
Received: from [172.20.40.57] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 12 Aug
 2020 17:19:39 +0000
Subject: Re: [git pull] drm for 5.8-rc1
To: Karol Herbst <kherbst@redhat.com>
References: <CAPM=9txGww+omvateOTizZRV9_wLdAbq6uAz3DRa_S6bn1jQuQ@mail.gmail.com>
 <CAPj87rOrUHBZZR3cw+iqUMtZL1ZQyjd=RoM2yHt5oUeRO5uDTA@mail.gmail.com>
 <5ffa32db-4383-80f6-c0cf-a9bb12e729aa@nvidia.com>
 <a3d331e9-d17e-9135-68c7-8e3e10df184d@nvidia.com>
 <CAKMK7uG8x4dHrRnzK9FFrJbtWsdLk+TTObK9r-nSncKowHVe3A@mail.gmail.com>
 <CAPM=9twK34VyR2kwiR1jzxqys1Bng2Vt8FY6aQTvCe2GL0Zopg@mail.gmail.com>
 <261cd7c9-6853-3d5f-3a3e-86b65c9dba71@nvidia.com>
 <CACO55ttJwjh2HZsygwqA7HUeF5UMuP0=Y9RyZU=UJsf-gWGagA@mail.gmail.com>
 <ad64c242-95f3-d346-87f3-a9ac149dc3a2@nvidia.com>
 <CACO55tt81q3VwpEmz9wxeUzWGPLXA1XPj8ZgxhuELUBPDpX1PA@mail.gmail.com>
 <CACO55ts2AHgDNZKBvoU8NZf26V8BJDGkKiapY=1xaUQ1DrC8SA@mail.gmail.com>
 <CACO55tvF0dOQ=myUpccmfHc+hCVQZoXQnCA0iHeXQo3B=UaD0Q@mail.gmail.com>
 <CAKb7UviVa32hWv+y+_kwbZzkJAxKcWr1RPCgkGt-mi=uayUKyw@mail.gmail.com>
 <0e882aa7-d0ea-19b0-a13d-4f7bc0d384aa@nvidia.com>
 <CACO55ttP_J8riS_PhCG+-Br+AvsYKRTLg_+wn2pXF9kgXkmjeQ@mail.gmail.com>
X-Nvconfidentiality: public
From: James Jones <jajones@nvidia.com>
Message-ID: <785eb70c-d9e7-dbdf-b044-337618fcea1a@nvidia.com>
Date: Wed, 12 Aug 2020 10:19:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACO55ttP_J8riS_PhCG+-Br+AvsYKRTLg_+wn2pXF9kgXkmjeQ@mail.gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1597252673; bh=yuijPWNjwcibu6hKpIN6Ivj94FWFR2PULoOE8EirIVU=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=P+wkvrMKenkOsMErFrZM6c5ycoixQ83ja8yDCAqqpRzgPLKvu9oBc0vtTpxLEhUw3
 39LhkhcINRoD5pCKZSuUBc6vPioVj7stcGRsmF4WTqlVQNsvnpoxXj1weOX5P0uUCV
 I9oHPTMfWQ36yQFKOmKFMYgNOAvESRbdN2tBW/WX7kqOd8sMsXnJ2/E5Ybi1LvFUtV
 FV3XuyTShJQsVKrxtAqCVb2SsoK2VEvAetfjH9cXD7W/31slMH0uwK6ShIbJBcAnTp
 eZ6ghemYdw3S4te/XcnBwpoRLUEkZVI6Z95mAcM5Nnl/6N1JP2tDsrLaFbIpAUF8iU
 frydiTX9mxHQg==
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
Cc: Thierry Reding <treding@nvidia.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/12/20 10:10 AM, Karol Herbst wrote:
> On Wed, Aug 12, 2020 at 7:03 PM James Jones <jajones@nvidia.com> wrote:
>>
>> On 8/12/20 5:37 AM, Ilia Mirkin wrote:
>>> On Wed, Aug 12, 2020 at 8:24 AM Karol Herbst <kherbst@redhat.com> wrote:
>>>>
>>>> On Wed, Aug 12, 2020 at 12:43 PM Karol Herbst <kherbst@redhat.com> wrote:
>>>>>
>>>>> On Wed, Aug 12, 2020 at 12:27 PM Karol Herbst <kherbst@redhat.com> wrote:
>>>>>>
>>>>>> On Wed, Aug 12, 2020 at 2:19 AM James Jones <jajones@nvidia.com> wrote:
>>>>>>>
>>>>>>> Sorry for the slow reply here as well.  I've been in the process of
>>>>>>> rebasing and reworking the userspace patches.  I'm not clear my changes
>>>>>>> will address the Jetson Nano issue, but if you'd like to try them, the
>>>>>>> latest userspace changes are available here:
>>>>>>>
>>>>>>>      https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/3724
>>>>>>>
>>>>>>> And the tegra-drm kernel patches are here:
>>>>>>>
>>>>>>>
>>>>>>> https://patchwork.ozlabs.org/project/linux-tegra/patch/20191217005205.2573-1-jajones@nvidia.com/
>>>>>>>
>>>>>>> Those + the kernel changes addressed in this thread are everything I had
>>>>>>> outstanding.
>>>>>>>
>>>>>>
>>>>>> I don't know if that's caused by your changes or not, but now the
>>>>>> assert I hit is a different one pointing out that
>>>>>> nvc0_miptree_select_best_modifier fails in a certain case and returns
>>>>>> MOD_INVALID... anyway, it seems like with your patches applied it's
>>>>>> now way easier to debug and figure out what's going wrong, so maybe I
>>>>>> can figure it out now :)
>>>>>>
>>>>>
>>>>> collected some information which might help to track it down.
>>>>>
>>>>> src/gallium/frontends/dri/dri2.c:648 is the assert hit: assert(*zsbuf)
>>>>>
>>>>> templ is {reference = {count = 0}, width0 = 300, height0 = 300, depth0
>>>>> = 1, array_size = 1, format = PIPE_FORMAT_Z24X8_UNORM, target =
>>>>> PIPE_TEXTURE_2D, last_level = 0, nr_samples = 0, nr_storage_samples =
>>>>> 0, usage = 0, bind = 1, flags = 0, next = 0x0, screen = 0x0}
>>>>>
>>>>> inside tegra_screen_resource_create modifier says
>>>>> DRM_FORMAT_MOD_INVALID as template->bind is 1
>>>>>
>>>>> and nvc0_miptree_select_best_modifier returns DRM_FORMAT_MOD_INVALID,
>>>>> so the call just returns NULL leading to the assert.
>>>>>
>>>>> Btw, this is on Xorg-1.20.8-1.fc32.aarch64 with glxgears.
>>>>>
>>>>
>>>> So I digged a bit deeper and here is what tripps it of:
>>>>
>>>> when the context gets made current, the normal framebuffer validation
>>>> and render buffer allocation is done, but we end up inside
>>>> tegra_screen_resource_create at some point with PIPE_BIND_SCANOUT set
>>>> in template->bind. Now the tegra driver forces the
>>>> DRM_FORMAT_MOD_LINEAR modifier and calls into
>>>> resource_create_with_modifiers.
>>>>
>>>> If it wouldn't do that, nouveau would allocate a tiled buffer, with
>>>> that it's linear and we at some point end up with an assert about a
>>>> depth_stencil buffer being there even though it shouldn't. If I always
>>>> use DRM_FORMAT_MOD_INVALID in tegra_screen_resource_create, things
>>>> just work.
>>>>
>>>> That's kind of the cause I pinpointed the issue down to. But I have no
>>>> idea what's supposed to happen and what the actual bug is.
>>>
>>> Yeah, the bug with tegra has always been "trying to render to linear
>>> color + tiled depth", which the hardware plain doesn't support. (And
>>> linear depth isn't a thing.)
>>>
>>> Question is whether what it's doing necessary. PIPE_BIND_SCANOUT
>>> (/linear) requirements are needed for DRI2 to work (well, maybe not in
>>> theory, but at least in practice the nouveau ddx expects linear
>>> buffers). However tegra operates on a more DRI3-like basis, so with
>>> "client" allocations, tiled should work OK as long as there's
>>> something in tegra to copy it to linear when necessary?
>>
>> I can confirm the above: Our hardware can't render to linear depth
>> buffers, nor can it mix linear color buffers with block linear depth
>> buffers.
>>
>> I think there's a misunderstanding on expected behavior of
>> resource_create_with_modifiers() here too:
>> tegra_screen_resource_create() is passing DRM_FORMAT_MOD_INVALID as the
>> only modifier in non-scanout cases.  Previously, I believe nouveau may
>> have treated that as "no modifiers specified.  Fall back to internal
>> layout selection logic", but in my patches I "fixed" it to match other
>> drivers' behavior, in that allocation will fail if that is the only
>> modifier in the list, since it is equivalent to passing in a list
>> containing only unsupported modifiers.  To get fallback behavior,
>> tegra_screen_resource_create() should pass in (NULL, 0) for (modifiers,
>> count), or just call resource_create() on the underlying screen instead.

...and in merging my code with Alyssa's new panfrost format modifier 
support, I see panfrost does the opposite of this and treats a format 
modifier list of only INVALID as "don't care".  I modeled the new 
nouveau behavior on the Iris driver.  Now I'm not sure which is correct :-(

Thanks,
-James

>> Beyond that, I can only offer my thoughts based on analysis of the code
>> referenced here so far:
>>
>> While I've learned from the origins of this thread applications/things
>> external to Mesa in general shouldn't be querying format modifiers of
>> buffers created without format modifiers, tegra is a Mesa internal
>> component that already has some intimate knowledge of how the nouveau
>> driver it sits on top of works.  Nouveau will always be able to
>> construct and return a valid format modifier for unorm single sampled
>> color buffers (and hopefully, anything that can scan out going forward),
>> both before and after my patches I believe, regardless of how they were
>> allocated.  After my patches, it should even work for things that can't
>> scan out in theory.  Hence, looking at this without knowledge of what
>> motivated the original changes, it seems like
>> tegra_screen_resource_create should just naively forward the
>> resource_create() call, relying on nouveau to select a layout and
>> provide a valid modifier when queried for import.  As Karol notes, this
>> works fine for at least this simple test case, and it's what nouveau
>> itself would be doing with an equivalent callstack, excepting the
>> modifier query, so I find it hard to believe it breaks some application
>> behavior.  It'll also end up being equivalent (in end result, not quite
>> semantically) to what dri3_alloc_render_buffer() was doing prior to the
>> patch mentioned that broke things for Karol, so certainly for the DRI3
>> usage it's the right behavior.
>>
>> Ilia, what in the nouveau DDX (As in Xfree86 DDX?) assumes linear
>> buffers?  It sounds like you don't think it will interact poorly with
>> this path regardless?  Thierry, do you recall what motivated the
>> force-linear code here?
>>
>> As to why this works for Thierry and not Karol, that's confusing.  Are
>> you both using the same X11 DDX (modesetting I assume?) and X server
>> versions?  Could it be a difference in client-side DRI library code somehow?
>>
> 
> it's X. 1.20.99.1 works, 1.20.8 is broken.
> 
>> Thanks,
>> -James
>>
>>>     -ilia
>>>
>>
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
