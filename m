Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54539574791
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 10:50:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC10A38CC;
	Thu, 14 Jul 2022 08:50:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFFA3A38C4;
 Thu, 14 Jul 2022 08:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657788640; x=1689324640;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+nkwAyhBBbTdcIq1r+Hu2NumNZeEfZRU9U/lzgfMfTI=;
 b=XovSQXpOZcj7uwp0B48ic02wrAcmoV7KTZIOdiw7ZDkok/Gzt4tvdo4n
 e+4BtzD3V9oqFJ/Ak76Gn4fUWXJT+Z5y2wGtlO/wKElr6PJlAH07HSj1J
 hlRsgm+7ghtUvigO+ByLOyuEfTqf3Z0YmeqJKZjaazVMR2WrnmNeq2s3+
 KKu6Rp8xayHaB5Ly8kyiRPOhqMRD6fGtQ7jvOx2qa77AwPZzyN29FVr2Q
 iaVpVoRCTeQbt1BDR+CvQbCmPZ8sZsE91GqK8ql6gqDC4WO2j8k557kbF
 jmB4IASaXlRefKPVgPRFK6Fhb1LcWE/5VmhILzMdxsdvbZNkPe+H6O8c/ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="371768512"
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="371768512"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2022 01:50:40 -0700
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="653784267"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO maurocar-mobl2)
 ([10.252.36.101])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2022 01:50:37 -0700
Date: Thu, 14 Jul 2022 10:50:34 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 01/39] drm/i915/gvt: Fix kernel-doc for
 intel_gvt_switch_mmio()
Message-ID: <20220714105034.0b370a6a@maurocar-mobl2>
In-Reply-To: <Ys9Am6jkPiVnA+uW@intel.com>
References: <cover.1657699522.git.mchehab@kernel.org>
 <72db6b58c1f223e326f84978267ba064eaf67ff0.1657699522.git.mchehab@kernel.org>
 <Ys8/JP3ITMKF1aHp@intel.com> <Ys9Am6jkPiVnA+uW@intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 Jul 2022 18:00:59 -0400
Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:

> On Wed, Jul 13, 2022 at 05:54:44PM -0400, Rodrigo Vivi wrote:
> > On Wed, Jul 13, 2022 at 09:11:49AM +0100, Mauro Carvalho Chehab wrote:  
> > > From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> > > 
> > > Fix the following W=1 kernel warnings:
> > > 
> > > drivers/gpu/drm/i915/gvt/mmio_context.c:560: warning: expecting
> > > prototype for intel_gvt_switch_render_mmio(). Prototype was for
> > > intel_gvt_switch_mmio() instead.
> > > 
> > > Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> > > Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> > > Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>  
> > 
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>  
> 
> I actually changed my mind after seeing that in most cases you use "()"
> for the functions and you didn't use for this case...

The documentation build system handles both ways equally, and there's
no consensus kernel-wide about what would be the preferred way[1].

Also, at the html (or pdf) output, they'll all look the same. So, no
difference in practice at the produced documentation.

[1] The current count (using drm-tip 2022y-07m-12d-21h-47m-27s) as basis,
    is:

	$ git ls-files|xargs grep -Pzo "\/\*\*\n \* [_a-zA-Z0-9]+ -" |wc -l
	36680
	$ git ls-files|xargs grep -Pzo "\/\*\*\n \* [_a-zA-Z0-9]+\s*\(\) -" |wc -l
	12068

    So, 48748 documented functions, being ~25% with parenthesis, 
    and ~75% without it.

    Under drivers/gpu, the numbers are:

	$ git ls-files|grep drivers/gpu/|xargs grep -Pzo "\/\*\*\n \* [_a-zA-Z0-9]+\s*\(\) -" |wc -l
	480
	mchehab@sal /new_devel/v4l/tmp $ git ls-files|grep drivers/gpu/|xargs grep -Pzo "\/\*\*\n \* [_a-zA-Z0-9]+ -" |wc -l
	4046

> which one should we pick for consistency?

Yeah, it is nicer to use the same way everywhere. Btw, on media, I was
enforcing one way at the beginning, but I ended giving up doing that
as it was too many efforts for too little. Nowadays, half of media
function declarations have parenthesis, half doesn't.

Anyway, this is what we have at i915 driver, before this series:

	$ grep -Pzo "\/\*\*\n \* [_a-zA-Z0-9]+\s*\(\) -" $(find drivers/gpu/drm/i915 -type f)|wc -l
	53
	$ grep -Pzo "\/\*\*\n \* [_a-zA-Z0-9]+ -" $(find drivers/gpu/drm/i915 -type f)|wc -l
	542

This series include 3 functions with "()" (on patches 1 and 3, both
authored by Jiapeng, and 11 functions without it on my own patches.

I'll change those two patches to remove the "()" for consistency.

I guess I'll add a patch at the end changing the other 53 functions
to drop "()".

Regards,
Mauro
