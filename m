Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D733F3A48E3
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 20:53:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C60088FE5;
	Fri, 11 Jun 2021 18:53:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ECE06F3C2;
 Fri, 11 Jun 2021 18:53:21 +0000 (UTC)
IronPort-SDR: v26zDjJ9i2nnE++Ux4+IGF5V6sB/0LRFpU4rs35l8UWNPAxXiBpW+AOJ3cv5MD9g6mhpSL+dMu
 VP9O6MvUlTxQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10012"; a="227015926"
X-IronPort-AV: E=Sophos;i="5.83,267,1616482800"; d="scan'208";a="227015926"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2021 11:53:20 -0700
IronPort-SDR: 0ergZJs+cx4v9w39ZHbNEGR/LdWdU9OlOX1KdpkIB7dCsBmPY9gtTn0XHPVe22oGNxfYMkDHKs
 GXXw9xlgqgkQ==
X-IronPort-AV: E=Sophos;i="5.83,267,1616482800"; d="scan'208";a="414543350"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2021 11:53:20 -0700
Date: Fri, 11 Jun 2021 11:46:27 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 00/13] Update firmware to v62.0.0
Message-ID: <20210611184627.GA29357@sdutt-i7>
References: <20210610043649.144416-1-matthew.brost@intel.com>
 <dce71640-7648-d321-c3e1-24e98a6276e9@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dce71640-7648-d321-c3e1-24e98a6276e9@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, daniele.ceraolospurio@intel.com,
 john.c.harrison@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 10, 2021 at 03:35:57PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 10.06.2021 06:36, Matthew Brost wrote:
> > As part of enabling GuC submission [1] we need to update to the latest
> > and greatest firmware. This series does that. This is a destructive
> > change. e.g. Without all the patches in this series it will break the
> 
> not really 'all'
> 

Yea, typo. I updated the comment below to say 'most' but missed this one.

> > i915 driver. As such, after we review most of these patches they will
> > squashed into a single patch for merging.
> 
> I assume final series will looks as follows:
> 
> 1                      = hxg
> 2+3+5+6+7+8+4+10+11+13 = ctb/ads/fw
> 12                     = log
> 9                      = rst
>

Seems right to me.
 
> > 
> > v2: Address comments, looking for remaning RBs so patches can be
> 
> typo
>

Not seeing the typo.
 
> and likely series should be generated with -v 2 option too
>

Didn't know about -v2 option. Will use going forward.

Matt
 
> 
> > squashed and sent for CI
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > 
> > [1] https://patchwork.freedesktop.org/series/89844/i
> > 
> > John Harrison (3):
> >   drm/i915/guc: Support per context scheduling policies
> >   drm/i915/guc: Unified GuC log
> >   drm/i915/guc: Update firmware to v62.0.0
> > 
> > Michal Wajdeczko (10):
> >   drm/i915/guc: Introduce unified HXG messages
> >   drm/i915/guc: Update MMIO based communication
> >   drm/i915/guc: Update CTB response status definition
> >   drm/i915/guc: Add flag for mark broken CTB
> >   drm/i915/guc: New definition of the CTB descriptor
> >   drm/i915/guc: New definition of the CTB registration action
> >   drm/i915/guc: New CTB based communication
> >   drm/i915/doc: Include GuC ABI documentation
> >   drm/i915/guc: Kill guc_clients.ct_pool
> >   drm/i915/guc: Kill ads.client_info
> > 
> >  Documentation/gpu/i915.rst                    |   8 +
> >  .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  | 107 ++++++
> >  .../gt/uc/abi/guc_communication_ctb_abi.h     | 128 +++++--
> >  .../gt/uc/abi/guc_communication_mmio_abi.h    |  65 ++--
> >  .../gpu/drm/i915/gt/uc/abi/guc_messages_abi.h | 213 +++++++++++
> >  drivers/gpu/drm/i915/gt/uc/intel_guc.c        | 107 ++++--
> >  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  45 +--
> >  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 356 +++++++++---------
> >  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     |   6 +-
> >  drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  75 +---
> >  drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    |  29 +-
> >  drivers/gpu/drm/i915/gt/uc/intel_guc_log.h    |   6 +-
> >  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  26 +-
> >  13 files changed, 750 insertions(+), 421 deletions(-)
> > 
