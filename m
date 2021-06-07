Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3738F39E7B0
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 21:42:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 040AF6E9E7;
	Mon,  7 Jun 2021 19:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C366E9EA;
 Mon,  7 Jun 2021 19:42:45 +0000 (UTC)
IronPort-SDR: gHSJP5hLuh/qZra85vAtC00fw/VaxMplwStl0PKKBhBY7Kv0mJmWaiJ436fXTwaljhxd5NP9Bu
 enhOojS4RE3w==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="204719789"
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="204719789"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 12:42:43 -0700
IronPort-SDR: efYcvkrT8rc1LEJ4iyXvZY3JZXqtPzgINKPbnS2KPl3BkAomQeSBVg7hJU0nl3S+pTXHMBiXaW
 y7HB2zSDjKgQ==
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="447608768"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 12:42:42 -0700
Date: Mon, 7 Jun 2021 12:35:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [Intel-gfx] [PATCH 09/13] drm/i915/doc: Include GuC ABI
 documentation
Message-ID: <20210607193546.GA27623@sdutt-i7>
References: <20210607180356.165785-1-matthew.brost@intel.com>
 <20210607180356.165785-10-matthew.brost@intel.com>
 <20210607174550.GA14577@sdutt-i7>
 <46b24580-493d-7bee-09af-5996b886c6d4@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46b24580-493d-7bee-09af-5996b886c6d4@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 07, 2021 at 09:38:58PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 07.06.2021 19:45, Matthew Brost wrote:
> > On Mon, Jun 07, 2021 at 11:03:51AM -0700, Matthew Brost wrote:
> >> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >>
> >> GuC ABI documentation is now ready to be included in i915.rst
> >>
> >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > 
> > Michal - I noticed while putting this series together that there is
> > kernel doc in intel_guc_ct.* but this isn't inclued in i915.rst. Do you
> > think we should add the those here or in a new section (e.g. GuC CTBs)?
> > 
> > Let me know what you think and I can fix this up before this gets
> > merged.
> 
> What's in intel_guc_ct.* is implementation detail, that should be placed
> in separate section, while this patch adds pure ABI definitions that
> deserve its own dedicated section.
> 

Sounds good. Will fix that in the next rev.

> Btw, this patch does not need to be squashed with others, as it is about
> updating .rst only and is not breaking anything. Same for patch 1/13
> that introduces new definitions in new .h file.
> 

Agree. What I said in the cover letter isn't 100% correct as some of
patches probably don't have to be squashed. Next rev I'll go through
patch by patch and figure that part out.

Matt

> Michal
> 
> > 
> > With that, for this patch:
> > 
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > 
> >> ---
> >>  Documentation/gpu/i915.rst | 8 ++++++++
> >>  1 file changed, 8 insertions(+)
> >>
> >> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
> >> index 42ce0196930a..c7846b1d9293 100644
> >> --- a/Documentation/gpu/i915.rst
> >> +++ b/Documentation/gpu/i915.rst
> >> @@ -518,6 +518,14 @@ GuC-based command submission
> >>  .. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> >>     :doc: GuC-based command submission
> >>  
> >> +GuC ABI
> >> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >> +
> >> +.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h
> >> +.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h
> >> +.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
> >> +.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> >> +
> >>  HuC
> >>  ---
> >>  .. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_huc.c
> >> -- 
> >> 2.28.0
> >>
> >> _______________________________________________
> >> Intel-gfx mailing list
> >> Intel-gfx@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> > 
