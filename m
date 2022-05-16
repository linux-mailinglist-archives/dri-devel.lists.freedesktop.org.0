Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E35527ECC
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 09:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F6A211250F;
	Mon, 16 May 2022 07:47:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04ADD10FE7C;
 Mon, 16 May 2022 07:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652687270; x=1684223270;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=SIhYFzm2FFD27O3PChvRlLGYBQfPM9Ojq71ndlPxLxQ=;
 b=INVg9sY1+gUBxGw5/HaLjDlDu9LVtdAKHRdDAzTQVIvg4VotnCcZPC2s
 EPhHu7QT1A/9ucVNn9Xj2Mf58ciQTgxCkYXIydhdK1hYbim6wR5VsAJ5q
 lk/RiLqk8HAz15n1myk84HKdzDG1vnh2nxf/be5bW9uIMOkbyhMj003wj
 sEOlJweeT/74v/FrIejY8DiMUbBDsxuUgP/ZcqNfsd1MWKXicKYCPPuuZ
 dAH5AZje4uKv6IPVtBrZRqtgVn1wBqiXbc4/4EHPsccXO19EucDT2wUQO
 UJgfbTCO9Apg6l7DML9gRRf19bOWlTekCVlS2txCnfu0XdOA3BSUdaFIQ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="357167622"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; 
 d="scan'208,217";a="357167622"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 00:47:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; 
 d="scan'208,217";a="672235349"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga002.fm.intel.com with ESMTP; 16 May 2022 00:47:48 -0700
Received: from [10.249.144.170] (unknown [10.249.144.170])
 by linux.intel.com (Postfix) with ESMTP id B9C74580AFE;
 Mon, 16 May 2022 00:47:44 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------tAeg05Edtp7XePSR0Kz8qz4o"
Message-ID: <dc3d7dad-7aac-5ad0-73dd-73a5de320ef9@intel.com>
Date: Mon, 16 May 2022 10:47:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3] uapi/drm/i915: Document memory residency and Flat-CCS
 capability of obj
Content-Language: en-US
To: Jordan Justen <jordan.l.justen@intel.com>,
 Ramalingam C <ramalingam.c@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
References: <20220502141508.2327-1-ramalingam.c@intel.com>
 <08039c07-a32e-7725-bc98-db49eefb3e86@intel.com>
 <165247597144.852381.16262736277926454494@jljusten-skl>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <165247597144.852381.16262736277926454494@jljusten-skl>
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
Cc: Tony Ye <tony.ye@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Nanley Chery <nanley.g.chery@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Kenneth Graunke <kenneth@whitecape.org>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, mesa-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------tAeg05Edtp7XePSR0Kz8qz4o
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/05/2022 00:06, Jordan Justen wrote:
> On 2022-05-13 05:31:00, Lionel Landwerlin wrote:
>> On 02/05/2022 17:15, Ramalingam C wrote:
>>> Capture the impact of memory region preference list of the objects, on
>>> their memory residency and Flat-CCS capability.
>>>
>>> v2:
>>>     Fix the Flat-CCS capability of an obj with {lmem, smem} preference
>>>     list [Thomas]
>>> v3:
>>>     Reworded the doc [Matt]
>>>
>>> Signed-off-by: Ramalingam C<ramalingam.c@intel.com>
>>> cc: Matthew Auld<matthew.auld@intel.com>
>>> cc: Thomas Hellstrom<thomas.hellstrom@linux.intel.com>
>>> cc: Daniel Vetter<daniel.vetter@ffwll.ch>
>>> cc: Jon Bloomfield<jon.bloomfield@intel.com>
>>> cc: Lionel Landwerlin<lionel.g.landwerlin@intel.com>
>>> cc: Kenneth Graunke<kenneth@whitecape.org>
>>> cc:mesa-dev@lists.freedesktop.org
>>> cc: Jordan Justen<jordan.l.justen@intel.com>
>>> cc: Tony Ye<tony.ye@intel.com>
>>> Reviewed-by: Matthew Auld<matthew.auld@intel.com>
>>> ---
>>>    include/uapi/drm/i915_drm.h | 16 ++++++++++++++++
>>>    1 file changed, 16 insertions(+)
>>>
>>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>>> index a2def7b27009..b7e1c2fe08dc 100644
>>> --- a/include/uapi/drm/i915_drm.h
>>> +++ b/include/uapi/drm/i915_drm.h
>>> @@ -3443,6 +3443,22 @@ struct drm_i915_gem_create_ext {
>>>     * At which point we get the object handle in &drm_i915_gem_create_ext.handle,
>>>     * along with the final object size in &drm_i915_gem_create_ext.size, which
>>>     * should account for any rounding up, if required.
>>> + *
>>> + * Note that userspace has no means of knowing the current backing region
>>> + * for objects where @num_regions is larger than one. The kernel will only
>>> + * ensure that the priority order of the @regions array is honoured, either
>>> + * when initially placing the object, or when moving memory around due to
>>> + * memory pressure
>>> + *
>>> + * On Flat-CCS capable HW, compression is supported for the objects residing
>>> + * in I915_MEMORY_CLASS_DEVICE. When such objects (compressed) has other
>>> + * memory class in @regions and migrated (by I915, due to memory
>>> + * constrain) to the non I915_MEMORY_CLASS_DEVICE region, then I915 needs to
>>> + * decompress the content. But I915 dosen't have the required information to
>>> + * decompress the userspace compressed objects.
>>> + *
>>> + * So I915 supports Flat-CCS, only on the objects which can reside only on
>>> + * I915_MEMORY_CLASS_DEVICE regions.
>> I think it's fine to assume Flat-CSS surface will always be in lmem.
>>
>> I see no issue for the Anv Vulkan driver.
>>
>> Maybe Nanley or Ken can speak for the Iris GL driver?
>>
> Acked-by: Jordan Justen<jordan.l.justen@intel.com>
>
> I think Nanley has accounted for this on iris with:
>
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/42a865730ef72574e179b56a314f30fdccc6cba8
>
> -Jordan

Thanks Jordan,


We might want to through in an additional : assert((|flags 
&||BO_ALLOC_SMEM) == 0); in the CCS case
|

|
|

|-Lionel
|

--------------tAeg05Edtp7XePSR0Kz8qz4o
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 14/05/2022 00:06, Jordan Justen
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:165247597144.852381.16262736277926454494@jljusten-skl">
      <pre class="moz-quote-pre" wrap="">On 2022-05-13 05:31:00, Lionel Landwerlin wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 02/05/2022 17:15, Ramalingam C wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Capture the impact of memory region preference list of the objects, on
their memory residency and Flat-CCS capability.

v2:
   Fix the Flat-CCS capability of an obj with {lmem, smem} preference
   list [Thomas]
v3:
   Reworded the doc [Matt]

Signed-off-by: Ramalingam C <a class="moz-txt-link-rfc2396E" href="mailto:ramalingam.c@intel.com">&lt;ramalingam.c@intel.com&gt;</a>
cc: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
cc: Thomas Hellstrom <a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com">&lt;thomas.hellstrom@linux.intel.com&gt;</a>
cc: Daniel Vetter <a class="moz-txt-link-rfc2396E" href="mailto:daniel.vetter@ffwll.ch">&lt;daniel.vetter@ffwll.ch&gt;</a>
cc: Jon Bloomfield <a class="moz-txt-link-rfc2396E" href="mailto:jon.bloomfield@intel.com">&lt;jon.bloomfield@intel.com&gt;</a>
cc: Lionel Landwerlin <a class="moz-txt-link-rfc2396E" href="mailto:lionel.g.landwerlin@intel.com">&lt;lionel.g.landwerlin@intel.com&gt;</a>
cc: Kenneth Graunke <a class="moz-txt-link-rfc2396E" href="mailto:kenneth@whitecape.org">&lt;kenneth@whitecape.org&gt;</a>
cc: <a class="moz-txt-link-abbreviated" href="mailto:mesa-dev@lists.freedesktop.org">mesa-dev@lists.freedesktop.org</a>
cc: Jordan Justen <a class="moz-txt-link-rfc2396E" href="mailto:jordan.l.justen@intel.com">&lt;jordan.l.justen@intel.com&gt;</a>
cc: Tony Ye <a class="moz-txt-link-rfc2396E" href="mailto:tony.ye@intel.com">&lt;tony.ye@intel.com&gt;</a>
Reviewed-by: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
---
  include/uapi/drm/i915_drm.h | 16 ++++++++++++++++
  1 file changed, 16 insertions(+)

diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index a2def7b27009..b7e1c2fe08dc 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -3443,6 +3443,22 @@ struct drm_i915_gem_create_ext {
   * At which point we get the object handle in &amp;drm_i915_gem_create_ext.handle,
   * along with the final object size in &amp;drm_i915_gem_create_ext.size, which
   * should account for any rounding up, if required.
+ *
+ * Note that userspace has no means of knowing the current backing region
+ * for objects where @num_regions is larger than one. The kernel will only
+ * ensure that the priority order of the @regions array is honoured, either
+ * when initially placing the object, or when moving memory around due to
+ * memory pressure
+ *
+ * On Flat-CCS capable HW, compression is supported for the objects residing
+ * in I915_MEMORY_CLASS_DEVICE. When such objects (compressed) has other
+ * memory class in @regions and migrated (by I915, due to memory
+ * constrain) to the non I915_MEMORY_CLASS_DEVICE region, then I915 needs to
+ * decompress the content. But I915 dosen't have the required information to
+ * decompress the userspace compressed objects.
+ *
+ * So I915 supports Flat-CCS, only on the objects which can reside only on
+ * I915_MEMORY_CLASS_DEVICE regions.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
I think it's fine to assume Flat-CSS surface will always be in lmem.

I see no issue for the Anv Vulkan driver.

Maybe Nanley or Ken can speak for the Iris GL driver?

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Acked-by: Jordan Justen <a class="moz-txt-link-rfc2396E" href="mailto:jordan.l.justen@intel.com">&lt;jordan.l.justen@intel.com&gt;</a>

I think Nanley has accounted for this on iris with:

<a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/mesa/mesa/-/commit/42a865730ef72574e179b56a314f30fdccc6cba8">https://gitlab.freedesktop.org/mesa/mesa/-/commit/42a865730ef72574e179b56a314f30fdccc6cba8</a>

-Jordan
</pre>
    </blockquote>
    <p>Thanks Jordan,</p>
    <p><br>
    </p>
    <p>We might want to through in an additional : assert((<code>flags
        &amp;</code><code> BO_ALLOC_SMEM) == 0); in the CCS case<br>
      </code></p>
    <p><code><br>
      </code></p>
    <p><code>-Lionel<br>
      </code></p>
  </body>
</html>

--------------tAeg05Edtp7XePSR0Kz8qz4o--
