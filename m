Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AFD5A75E7
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 07:46:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB3D10E1BF;
	Wed, 31 Aug 2022 05:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4842D10E1BF;
 Wed, 31 Aug 2022 05:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661924778; x=1693460778;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0tfRC83rT8v1PuZ5oJZRWhZTCd1/j5y/9UxcShBs03k=;
 b=dKQgmjksW1HupYWE/eINcT1eirzpcbngJm1oXUCjN9x7Gh6tPZN0s+E5
 mrjPlNLMUasld32/o5vHxnKglqByRUBxjvhSTbKIMSC4z6aLYr+Xm5deE
 u6gT8J6yHHL/QD8zvnlXmfYSCT0YliF3JfRcrIj7oiGTJsy3Y+E3LKI7n
 LnOqHb1rk7O+79NP0KVBx4AxqqioqTWM4QfCn7gjUdPWIv7l2wCERtKvz
 yZTdNtMRXRxzl1Nl7fj2mReHw/j3FBsJOz/ERSigO10Pfyc3arDuQ+GGV
 YRvQd+PYP3w+tQbEG6oXNLdmkSUyrbt8KkyaBQGAbDKcxAFnmIn0Ph8/u w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="295381633"
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; d="scan'208";a="295381633"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 22:46:17 -0700
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; d="scan'208";a="588913839"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 22:46:15 -0700
Date: Tue, 30 Aug 2022 22:45:28 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [RFC PATCH v3 09/17] drm/i915: Do not support vm_bind mode in
 execbuf2
Message-ID: <20220831054527.GA10283@nvishwa1-DESK>
References: <20220827194403.6495-1-andi.shyti@linux.intel.com>
 <20220827194403.6495-10-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220827194403.6495-10-andi.shyti@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Ramalingam C <ramalingampc2008@gmail.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi@etezian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 27, 2022 at 09:43:55PM +0200, Andi Shyti wrote:
>From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>
>Do not support the vm in vm_bind_mode in execbuf2 ioctl.
>
>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
>Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>---
> drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 5 +++++
> 1 file changed, 5 insertions(+)
>
>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>index cd75b0ca2555f..f85f10cf9c34b 100644
>--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>@@ -781,6 +781,11 @@ static int eb_select_context(struct i915_execbuffer *eb)
> 	if (unlikely(IS_ERR(ctx)))
> 		return PTR_ERR(ctx);
>
>+	if (ctx->vm->vm_bind_mode) {
>+		i915_gem_context_put(ctx);
>+		return -EOPNOTSUPP;
>+	}
>+
> 	eb->gem_context = ctx;
> 	if (i915_gem_context_has_full_ppgtt(ctx))
> 		eb->invalid_flags |= EXEC_OBJECT_NEEDS_GTT;

This should probably be merged with patch #2 that introduces vm_bind_mode uapi.

Niranjana

>-- 
>2.34.1
>
