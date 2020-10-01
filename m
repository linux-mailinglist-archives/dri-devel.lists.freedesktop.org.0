Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE8328022B
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 17:08:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 571616E218;
	Thu,  1 Oct 2020 15:08:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C4A6E218;
 Thu,  1 Oct 2020 15:08:45 +0000 (UTC)
IronPort-SDR: OeTaIzw5fdhQ4LpsHRJxqkjlicHTEob3UsIWyRn0aWgnnrbYO6W11tz/rSa/LQjj/40UhB81Cy
 qktfH1Wl5vlg==
X-IronPort-AV: E=McAfee;i="6000,8403,9760"; a="150385958"
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="150385958"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2020 08:08:22 -0700
IronPort-SDR: O74dZO2eJgRDJLthE9jBgpEVhqwkllD59i4GnCHCxutJccngda6LcTYLp6JKVj8dIEg/+jV4fu
 l6hOT1x/4JaQ==
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="504034506"
Received: from lraichel-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.36.225])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2020 08:08:17 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: manual merge of the akpm tree with the drm-intel tree
In-Reply-To: <CAKMK7uFfBLsZ=wetii4bc+BTiKObD5DJ7B-kDO4am6AhBY+AhQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20201001203917.43d46a3d@canb.auug.org.au>
 <20201001135350.GA14869@lst.de>
 <CAKMK7uFfBLsZ=wetii4bc+BTiKObD5DJ7B-kDO4am6AhBY+AhQ@mail.gmail.com>
Date: Thu, 01 Oct 2020 18:08:36 +0300
Message-ID: <87h7rem1aj.fsf@intel.com>
MIME-Version: 1.0
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Chris Wilson <chris@chris-wilson.co.uk>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 01 Oct 2020, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> On Thu, Oct 1, 2020 at 3:53 PM Christoph Hellwig <hch@lst.de> wrote:
>>
>> On Thu, Oct 01, 2020 at 08:39:17PM +1000, Stephen Rothwell wrote:
>> > Hi all,
>> >
>> > Today's linux-next merge of the akpm tree got a conflict in:
>> >
>> >   drivers/gpu/drm/i915/gem/i915_gem_pages.c
>> >
>> > between commit:
>> >
>> >   4caf017ee937 ("drm/i915/gem: Avoid implicit vmap for highmem on x86-32")
>> >   ba2ebf605d5f ("drm/i915/gem: Prevent using pgprot_writecombine() if PAT is not supported")
>
> Uh these patches shouldn't be in linux-next because they're for 5.11,
> not the 5.10 merge window that will open soon. Joonas?

I don't know anything else, but both are tagged Cc: stable.

BR,
Jani.

>
>> > from the drm-intel tree and patch:
>> >
>> >   "drm/i915: use vmap in i915_gem_object_map"
>> >
>> > from the akpm tree.
>> >
>> > I fixed it up (I just dropped the changes in the former commits) and
>>
>> Sigh.  The solution is a bit more complicated, but I just redid my
>> patches to not depend on the above ones.  I can revert back to the old
>> version, though.  Andrew, let me know what works for you.
>
> Imo ignore, rebasing onto linux-next without those intel patches was
> the right thing for the 5.10 merge window.
> -Daniel

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
