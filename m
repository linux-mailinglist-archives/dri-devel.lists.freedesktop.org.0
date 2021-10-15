Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C1642E824
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 06:54:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B4D26E21D;
	Fri, 15 Oct 2021 04:54:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299406E210;
 Fri, 15 Oct 2021 04:54:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10137"; a="227743985"
X-IronPort-AV: E=Sophos;i="5.85,374,1624345200"; d="scan'208";a="227743985"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 21:54:51 -0700
X-IronPort-AV: E=Sophos;i="5.85,374,1624345200"; d="scan'208";a="492318583"
Received: from rcaravac-mobl2.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.213.186.99])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 21:54:50 -0700
Date: Thu, 14 Oct 2021 21:54:50 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Andi Shyti <andi@etezian.org>, Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH v5] drm/i915/gt: move remaining debugfs
 interfaces into gt
Message-ID: <20211015045450.ew5n7plkbllshms2@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20211012221738.16029-1-andi@etezian.org>
 <20211014000427.652zp2ahlq7g2cvd@ldmartin-desk2>
 <YWd1tnp2bdHBIWG0@intel.intel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YWd1tnp2bdHBIWG0@intel.intel>
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

On Thu, Oct 14, 2021 at 02:11:34AM +0200, Andi Shyti wrote:
>Hi Lucas,
>
>On Wed, Oct 13, 2021 at 05:04:27PM -0700, Lucas De Marchi wrote:
>> On Wed, Oct 13, 2021 at 12:17:38AM +0200, Andi Shyti wrote:
>> > From: Andi Shyti <andi.shyti@linux.intel.com>
>> >
>> > The following interfaces:
>> >
>> >  i915_wedged
>> >  i915_forcewake_user
>> >
>> > are dependent on gt values. Put them inside gt/ and drop the
>> > "i915_" prefix name. This would be the new structure:
>> >
>> >  dri/0/gt
>> >  |
>> >  +-- forcewake_user
>> >  |
>> >  \-- reset
>> >
>> > For backwards compatibility with existing igt (and the slight
>> > semantic difference between operating on the i915 abi entry
>> > points and the deep gt info):
>> >
>> >  dri/0
>> >  |
>> >  +-- i915_wedged
>> >  |
>> >  \-- i915_forcewake_user
>> >
>> > remain at the top level.
>> >
>> > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>> > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
>> > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>> do you want me to push this?
>
>yes, please.

done, thanks.

Now, about igt: eventually we need to update it to use the gt
debugfs file. Is this something you have already or is it something
we are waiting on multi-gt to land?

Lucas De Marchi

>
>Thanks,
>Andi
