Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3468242CF63
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 02:04:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A4356EBB7;
	Thu, 14 Oct 2021 00:04:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B166E887;
 Thu, 14 Oct 2021 00:04:30 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="226336838"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="226336838"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 17:04:27 -0700
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="487138048"
Received: from melhebea-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.50.4])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 17:04:25 -0700
Date: Wed, 13 Oct 2021 17:04:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Andi Shyti <andi@etezian.org>
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v5] drm/i915/gt: move remaining debugfs
 interfaces into gt
Message-ID: <20211014000427.652zp2ahlq7g2cvd@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20211012221738.16029-1-andi@etezian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20211012221738.16029-1-andi@etezian.org>
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

On Wed, Oct 13, 2021 at 12:17:38AM +0200, Andi Shyti wrote:
>From: Andi Shyti <andi.shyti@linux.intel.com>
>
>The following interfaces:
>
>  i915_wedged
>  i915_forcewake_user
>
>are dependent on gt values. Put them inside gt/ and drop the
>"i915_" prefix name. This would be the new structure:
>
>  dri/0/gt
>  |
>  +-- forcewake_user
>  |
>  \-- reset
>
>For backwards compatibility with existing igt (and the slight
>semantic difference between operating on the i915 abi entry
>points and the deep gt info):
>
>  dri/0
>  |
>  +-- i915_wedged
>  |
>  \-- i915_forcewake_user
>
>remain at the top level.
>
>Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>Cc: Chris Wilson <chris@chris-wilson.co.uk>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

do you want me to push this?

Lucas De Marchi
