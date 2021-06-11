Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 184DB3A48DD
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 20:51:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43B056E079;
	Fri, 11 Jun 2021 18:51:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C466E079;
 Fri, 11 Jun 2021 18:51:29 +0000 (UTC)
IronPort-SDR: +njSahdCVEAramr3RLJ++gft1FNucQVzt6t5USGvJhEOBq8/DDPhz6sGq9k/SYfOBfiV39459j
 nRCBqQ4IiHlA==
X-IronPort-AV: E=McAfee;i="6200,9189,10012"; a="227015662"
X-IronPort-AV: E=Sophos;i="5.83,267,1616482800"; d="scan'208";a="227015662"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2021 11:51:29 -0700
IronPort-SDR: WaXp1YLD7gTcqLiHgYWGPlGHxmlqye2vb4Y4fBOV6xBhYWNeA61zufE1ccincLQYJoeab1Ffdm
 5wyihTaGoQ+g==
X-IronPort-AV: E=Sophos;i="5.83,267,1616482800"; d="scan'208";a="414543071"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2021 11:51:29 -0700
Date: Fri, 11 Jun 2021 11:44:35 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 00/13] Update firmware to v62.0.0
Message-ID: <20210611184435.GA29202@sdutt-i7>
References: <20210607180356.165785-1-matthew.brost@intel.com>
 <f270bb24-d9d3-c65e-0944-5d7dcb4f3b30@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f270bb24-d9d3-c65e-0944-5d7dcb4f3b30@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, john.c.harrison@intel.com,
 dri-devel@lists.freedesktop.org, Michal.Wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 07, 2021 at 03:19:11PM -0700, Daniele Ceraolo Spurio wrote:
> 
> 
> On 6/7/2021 11:03 AM, Matthew Brost wrote:
> > As part of enabling GuC submission [1] we need to update to the latest
> > and greatest firmware. This series does that. This is a destructive
> > change. e.g. Without all the patches in this series it will break the
> > i915 driver. As such, after we review all of these patches they will
> > squashed into a single patch for merging.
> 
> Can you resubmit with an added HAX patch for enable_guc=2 after the first
> round of review? none of the machines in CI seems to have attempted to load
> the guc, not even cfl-guc and kbl-guc. If all the reviews are good maybe
> just resubmit the squashed patch and the enablement with a CI tag, so we can
> merge once we get the results.
> 

Done on trybot, results looks good.
https://patchwork.freedesktop.org/series/91341/

Matt

> Daniele
> 
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > 
> > [1] https://patchwork.freedesktop.org/series/89844/
> > 
> > John Harrison (3):
> >    drm/i915/guc: Support per context scheduling policies
> >    drm/i915/guc: Unified GuC log
> >    drm/i915/guc: Update firmware to v62.0.0
> > 
> > Michal Wajdeczko (10):
> >    drm/i915/guc: Introduce unified HXG messages
> >    drm/i915/guc: Update MMIO based communication
> >    drm/i915/guc: Update CTB response status definition
> >    drm/i915/guc: Add flag for mark broken CTB
> >    drm/i915/guc: New definition of the CTB descriptor
> >    drm/i915/guc: New definition of the CTB registration action
> >    drm/i915/guc: New CTB based communication
> >    drm/i915/doc: Include GuC ABI documentation
> >    drm/i915/guc: Kill guc_clients.ct_pool
> >    drm/i915/guc: Kill ads.client_info
> > 
> >   Documentation/gpu/i915.rst                    |   8 +
> >   .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  | 107 ++++++
> >   .../gt/uc/abi/guc_communication_ctb_abi.h     | 130 +++++--
> >   .../gt/uc/abi/guc_communication_mmio_abi.h    |  63 ++--
> >   .../gpu/drm/i915/gt/uc/abi/guc_messages_abi.h | 213 +++++++++++
> >   drivers/gpu/drm/i915/gt/uc/intel_guc.c        | 107 ++++--
> >   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  45 +--
> >   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 355 +++++++++---------
> >   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     |   6 +-
> >   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  75 +---
> >   drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    |  29 +-
> >   drivers/gpu/drm/i915/gt/uc/intel_guc_log.h    |   6 +-
> >   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  26 +-
> >   13 files changed, 750 insertions(+), 420 deletions(-)
> > 
> 
