Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C725623FD2
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 11:33:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A5410E6C3;
	Thu, 10 Nov 2022 10:33:34 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E19210E6C2;
 Thu, 10 Nov 2022 10:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668076409; x=1699612409;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=YSvhicu50FBRmCK+HlYyGrIkn7XAdKoXc+4FrqrLxbU=;
 b=ks1Dr/r94hEZcS8avfRPcgp3J2GpTTsMMVVLvafOkFgIJFzONc8H1jPf
 19431EDtY2JSOkPAanJAbzMFI0bDGov6QA+wiLErJ4bPtk/svfqp5NhNF
 F7Q46AAQFITRsU8RrByvFg8zppRCDa14r9ktbyKXhsCPnbXfeiUuxHt9Z
 D295lunvi3T/9aSwrPBdh6Fovyl34g258p/Le8uYUrpWS1nG+8lgx/dkE
 edF8w+bgPPoCjeO9PLiA38x1h2wjHiLpm2yPOzhzgjYhD1yO6wm97YDg8
 eVuEanpKUZTq/2nISDTxqq53dfTlvWGXUAWTIvwAHoDn0Mah0ZYQSRY8g Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="312409883"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; d="scan'208";a="312409883"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 02:33:28 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="670311514"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; d="scan'208";a="670311514"
Received: from psikora-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.17.110])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 02:33:26 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, John Harrison
 <john.c.harrison@intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, Intel-GFX@Lists.FreeDesktop.Org
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/gt: Add GT oriented dmesg output
In-Reply-To: <02454937-4213-c558-590f-e1e7c83083e3@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221104172525.569913-1-John.C.Harrison@Intel.com>
 <20221104172525.569913-2-John.C.Harrison@Intel.com>
 <6a4d1ac0-a1a0-e1d4-7d83-54b43d226371@intel.com>
 <fabaf9ee-f3fc-c18f-56b3-6d073618da41@linux.intel.com>
 <82055e8f-9bee-2b03-3dce-dcf66c30c903@linux.intel.com>
 <2583bccd-82fd-967a-aec9-e6d3837dbbed@intel.com>
 <1ad6bce7-9626-afa6-d73e-6d8f7a9c4d2a@linux.intel.com>
 <c9742b0f-546f-cccc-021a-7bad68410838@intel.com>
 <ad19d7ce-4102-4f8f-903d-7390b004b2e9@linux.intel.com>
 <67d18d17-8a01-32a1-1ff6-099c708ab290@intel.com>
 <02454937-4213-c558-590f-e1e7c83083e3@intel.com>
Date: Thu, 10 Nov 2022 12:33:24 +0200
Message-ID: <87wn835caz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: DRI-Devel@Lists.FreeDesktop.Org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 09 Nov 2022, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> Instead of merging this patch now, oriented on GT only, I would rather
> wait until we discuss and plan solution for the all sub-components.
>
> Once that's done (with agreement on naming and output) we can start
> converting exiting messages.
>
> My proposal would be:
>  - use wrappers per component
>  - use lower case names
>  - don't add colon
>
> #define i915_xxx(_i915, _fmt, ...) \
> 	drm_xxx(&(_i915)->drm, _fmt, ##__VA_ARGS__)
>
> #define gt_xxx(_gt, _fmt, ...) \
> 	i915_xxx((_gt)->i915, "GT%u " _fmt, (_gt)->info.id, ..
>
> #define guc_xxx(_guc, _fmt, ...) \
> 	gt_xxx(guc_to_gt(_guc), "GuC " _fmt, ..
>
> #define ct_xxx(_ct, _fmt, ...) \
> 	guc_xxx(ct_to_guc(_ct), "CTB " _fmt, ..
>
> where
> 	xxx = { err, warn, notice, info, dbg }
>
> and then for calls like:
>
> 	i915_err(i915, "Foo failed (%pe)\n", ERR_PTR(err));
> 	  gt_err(gt,   "Foo failed (%pe)\n", ERR_PTR(err));
> 	 guc_err(guc,  "Foo failed (%pe)\n", ERR_PTR(err));
> 	  ct_err(ct,   "Foo failed (%pe)\n", ERR_PTR(err));
>
> the output would look like:
>
> [ ] i915 0000:00:02.0: [drm] *ERROR* Foo failed (-EIO)
> [ ] i915 0000:00:02.0: [drm] *ERROR* GT0 Foo failed (-EIO)
> [ ] i915 0000:00:02.0: [drm] *ERROR* GT0 GuC Foo failed (-EIO)
> [ ] i915 0000:00:02.0: [drm] *ERROR* GT0 GuC CTB Foo failed (-EIO)
>
> Would that work for all of you?

I think we borderline have too many wrappers already. I've basically
blocked the i915_* variants early on in favour of just using the drm_*
calls directly - which, themselves, are also wrappers on dev_*.

In general, there's aversion in the kernel to adding wrappers that hide
what's actually going on. WYSIWYG.

So I wasn't thrilled to see the GT_* wrappers either.

And indeed part of it is that anything you do sets an example for the
next developer coming along. You add wrappers for this, and sure enough
someone's going to cargo cult and add wrappers for some other
component. We didn't even have to merge this to see that idea pop up.

The thing with logging is that it's not just one wrapper. It's info,
notice, warn, err, multiplied by the "once" variants, with some
duplicated by the "ratelimited" variants. (And yeah, C sucks at this.)

Arguably the display code could use logging wrappers for connectors,
encoders and crtcs, too. Not just i915, but across drm. See:

git grep "\[\(CONNECTOR\|ENCODER\|CRTC\)"

But we've opted not to.

This is just my educated guess, but what I think is more likely to
happen is adding a "debug name" member to the relevant structs that you
could use like:

	drm_dbg_kms(connector->dev, "%s foo\n", connector->dbg_id);

---

I'm not going to block this patchset, but I also really *really* don't
want to see a cargo culted copy of this for other components. Which kind
of makes me anxious.

So what if you looked again what you could do to make using the drm_*
logging variants easier?


BR,
Jani.



-- 
Jani Nikula, Intel Open Source Graphics Center
