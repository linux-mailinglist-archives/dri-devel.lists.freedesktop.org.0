Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D50E58C8D35
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 22:13:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB7E10E1FC;
	Fri, 17 May 2024 20:13:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BV5VtqjL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C4010E012;
 Fri, 17 May 2024 20:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715976822; x=1747512822;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=5wKBrcdczmHPfZj8S0BGZQ6u/wBVVC3XDcK9iGPmAWo=;
 b=BV5VtqjLwYCK86ObmhEkxPyctoCcoKORjV2l19yzx8N+2PEMp2935DKU
 J7KHDw4z3lAU0iM0v6x9wzTUo6DEsmmP5T7RKKHm5TGdVdnxjiWucQ5cV
 KrAuJl3ivC7IWNat2HOalvGXEdaeqaiodKNBJ+HH54pM9NBhAaDfYBmjq
 qyQnpGbP+zIEcvT6wxjVPgRfDU4bFW3W1YPwCOVlpeuwF1qswek1YHi1A
 UWoS3IslGKRNWzPwpfPTAmQjtpaWOmdRBB8FgmDhi4TY/v4YxDm2cYEKn
 pkR+aT9BrdoUkX6MguS8qEPB2zcYd/534rYeMiwCrEM9ZDVOO5amXFAds A==;
X-CSE-ConnectionGUID: C8hmlKihSb+mYAGacfTMoA==
X-CSE-MsgGUID: Zj5KU4cNSgqzVFwK3FmTww==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12363804"
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208,217";a="12363804"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 13:13:41 -0700
X-CSE-ConnectionGUID: oPK53i7QQJmhn9BlroilhA==
X-CSE-MsgGUID: aku/v5+uQfGvnW2B/E7SLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208,217";a="36415436"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.50.245])
 ([10.246.50.245])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 13:13:40 -0700
Content-Type: multipart/alternative;
 boundary="------------06ldtsheeGALd0N0OoEGB5p7"
Message-ID: <b78fea46-2db1-45f9-9d7a-e257bc242c91@linux.intel.com>
Date: Fri, 17 May 2024 22:13:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/i915: Don't treat FLR resets as errors
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>
References: <20240517112550.251955-1-andi.shyti@linux.intel.com>
 <20240517112550.251955-3-andi.shyti@linux.intel.com>
 <e2a23879-c69e-4b57-a0a0-4c1ac81d9403@linux.intel.com>
 <ZkexSOO9MYt7Y9-8@ashyti-mobl2.lan>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <ZkexSOO9MYt7Y9-8@ashyti-mobl2.lan>
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
--------------06ldtsheeGALd0N0OoEGB5p7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andi,

On 5/17/2024 9:34 PM, Andi Shyti wrote:
> Hi Nirmoy,
>
> On Fri, May 17, 2024 at 04:00:02PM +0200, Nirmoy Das wrote:
>> On 5/17/2024 1:25 PM, Andi Shyti wrote:
>>> If we timeout while waiting for an FLR reset, there is nothing we
>>> can do and i915 doesn't have any control on it. In any case the
>>> system is still perfectly usable
>> If a FLR reset fails then we will have a dead GPU, I don't think the GPU is
>> usable without a cold reboot.
> fact is that the GPU keeps going and even though the timeout has
> expired, the system moves to the next phase.
The current test might look like it is has passed, but if you look into 
the subsequent tests you can see a dead GPU:

<7>[  369.168121] pci 0000:00:02.0: [drm:intel_uncore_fini_mmio [i915]] Triggering Driver-FLR
*<3>[ 372.170189] pci 0000:00:02.0: [drm] *ERROR* Driver-FLR-teardown 
wait completion failed! -110*
*<7>[ 372.437630] [IGT] i915_selftest: finished subtest requests, SUCCESS*
<7>[  372.438356] [IGT] i915_selftest: starting dynamic subtest migrate
<5>[  373.110580] Setting dangerous option live_selftests - tainting kernel
<3>[  373.183499] i915 0000:00:02.0: Unable to change power state from D0 to D0, device inaccessible
<3>[  373.246921] i915 0000:00:02.0: [drm] *ERROR* Unrecognized display IP version 1023.255; disabling display.
<7>[  373.247130] i915 0000:00:02.0: [drm:intel_step_init [i915]] Using future steppings
<7>[  373.247716] i915 0000:00:02.0: [drm:intel_step_init [i915]] Using future steppings
<7>[  373.248263] i915 0000:00:02.0: [drm:intel_step_init [i915]] Using future display steppings
<7>[  373.251843] i915 0000:00:02.0: [drm:intel_gt_common_init_early [i915]] WOPCM: 2048K
<7>[  373.252505] i915 0000:00:02.0: [drm:intel_uc_init_early [i915]] GT0: enable_guc=3 (guc:yes submission:yes huc:no slpc:yes)
<7>[  373.253140] i915 0000:00:02.0: [drm:intel_gt_probe_all [i915]] GT0: Setting up Primary GT
<7>[  373.253556] i915 0000:00:02.0: [drm:intel_gt_probe_all [i915]] GT1: Setting up Standalone Media GT
<7>[  373.253941] i915 0000:00:02.0: [drm:intel_gt_common_init_early [i915]] WOPCM: 2048K
<7>[  373.254365] i915 0000:00:02.0: [drm:intel_uc_init_early [i915]] GT1: enable_guc=3 (guc:yes submission:yes huc:yes slpc:yes)
*<3>[ 375.256235] i915 0000:00:02.0: [drm] *ERROR* Device is 
non-operational; MMIO access returns 0xFFFFFFFF!*
<3>[  375.259089] i915 0000:00:02.0: Device initialization failed (-5)
<3>[  375.260521] i915 0000:00:02.0: probe with driver i915 failed with error -5
<7>[  375.392209] [IGT] i915_selftest: finished subtest migrate, FAIL

https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14724/bat-arls-3/dmesg0.txt

>
>> This is a serious issue and should be report as an error.  I think we need
>> to create a HW ticket to understand
>>
>> why is FLR reset fails.
> Maybe it takes longer and longer to reset. We've been sending
> several patches in the latest years to fix the timings.

HW spec says 3 sec but we can try increasing it bit higher to try it out.


Regards,

Nirmoy

>
> Andi
--------------06ldtsheeGALd0N0OoEGB5p7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Andi,<br>
    </p>
    <div class="moz-cite-prefix">On 5/17/2024 9:34 PM, Andi Shyti wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:ZkexSOO9MYt7Y9-8@ashyti-mobl2.lan">
      <pre class="moz-quote-pre" wrap="">Hi Nirmoy,

On Fri, May 17, 2024 at 04:00:02PM +0200, Nirmoy Das wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 5/17/2024 1:25 PM, Andi Shyti wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">If we timeout while waiting for an FLR reset, there is nothing we
can do and i915 doesn't have any control on it. In any case the
system is still perfectly usable
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
If a FLR reset fails then we will have a dead GPU, I don't think the GPU is
usable without a cold reboot.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
fact is that the GPU keeps going and even though the timeout has
expired, the system moves to the next phase.</pre>
    </blockquote>
    The current test might look like it is has passed, but if you look
    into the subsequent tests you can see a dead GPU:<br>
    <pre
style="color: rgb(255, 255, 255); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; overflow-wrap: break-word; white-space: pre-wrap;">&lt;7&gt;[  369.168121] pci 0000:00:02.0: [drm:intel_uncore_fini_mmio [i915]] Triggering Driver-FLR
<b>&lt;3&gt;[  372.170189] pci 0000:00:02.0: [drm] *ERROR* Driver-FLR-teardown wait completion failed! -110</b>
<b>&lt;7&gt;[  372.437630] [IGT] i915_selftest: finished subtest requests, SUCCESS</b>
&lt;7&gt;[  372.438356] [IGT] i915_selftest: starting dynamic subtest migrate
&lt;5&gt;[  373.110580] Setting dangerous option live_selftests - tainting kernel
&lt;3&gt;[  373.183499] i915 0000:00:02.0: Unable to change power state from D0 to D0, device inaccessible
&lt;3&gt;[  373.246921] i915 0000:00:02.0: [drm] *ERROR* Unrecognized display IP version 1023.255; disabling display.
&lt;7&gt;[  373.247130] i915 0000:00:02.0: [drm:intel_step_init [i915]] Using future steppings
&lt;7&gt;[  373.247716] i915 0000:00:02.0: [drm:intel_step_init [i915]] Using future steppings
&lt;7&gt;[  373.248263] i915 0000:00:02.0: [drm:intel_step_init [i915]] Using future display steppings
&lt;7&gt;[  373.251843] i915 0000:00:02.0: [drm:intel_gt_common_init_early [i915]] WOPCM: 2048K
&lt;7&gt;[  373.252505] i915 0000:00:02.0: [drm:intel_uc_init_early [i915]] GT0: enable_guc=3 (guc:yes submission:yes huc:no slpc:yes)
&lt;7&gt;[  373.253140] i915 0000:00:02.0: [drm:intel_gt_probe_all [i915]] GT0: Setting up Primary GT
&lt;7&gt;[  373.253556] i915 0000:00:02.0: [drm:intel_gt_probe_all [i915]] GT1: Setting up Standalone Media GT
&lt;7&gt;[  373.253941] i915 0000:00:02.0: [drm:intel_gt_common_init_early [i915]] WOPCM: 2048K
&lt;7&gt;[  373.254365] i915 0000:00:02.0: [drm:intel_uc_init_early [i915]] GT1: enable_guc=3 (guc:yes submission:yes huc:yes slpc:yes)
<b>&lt;3&gt;[  375.256235] i915 0000:00:02.0: [drm] *ERROR* Device is non-operational; MMIO access returns 0xFFFFFFFF!</b>
&lt;3&gt;[  375.259089] i915 0000:00:02.0: Device initialization failed (-5)
&lt;3&gt;[  375.260521] i915 0000:00:02.0: probe with driver i915 failed with error -5
&lt;7&gt;[  375.392209] [IGT] i915_selftest: finished subtest migrate, FAIL

<a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14724/bat-arls-3/dmesg0.txt">https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14724/bat-arls-3/dmesg0.txt</a>
</pre>
    <blockquote type="cite" cite="mid:ZkexSOO9MYt7Y9-8@ashyti-mobl2.lan">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">This is a serious issue and should be report as an error.  I think we need
to create a HW ticket to understand

why is FLR reset fails.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Maybe it takes longer and longer to reset. We've been sending
several patches in the latest years to fix the timings.</pre>
    </blockquote>
    <p>HW spec says 3 sec but we can try increasing it bit higher to try
      it out.</p>
    <p><br>
    </p>
    <p>Regards,</p>
    <p>Nirmoy<br>
    </p>
    <blockquote type="cite" cite="mid:ZkexSOO9MYt7Y9-8@ashyti-mobl2.lan">
      <pre class="moz-quote-pre" wrap="">

Andi
</pre>
    </blockquote>
  </body>
</html>

--------------06ldtsheeGALd0N0OoEGB5p7--
