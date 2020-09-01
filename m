Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AF5258964
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 09:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D032E6E81B;
	Tue,  1 Sep 2020 07:39:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2627B6E7DD;
 Tue,  1 Sep 2020 07:39:42 +0000 (UTC)
IronPort-SDR: tXAkrnRvmvJ/ycrsVzPidayTIVJU4CKWTBQ6x/txOltKQc54FXLi9Z0lGQR/DVTcwRYUAxrqtG
 0Mc7bKFMK5JA==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="136642297"
X-IronPort-AV: E=Sophos;i="5.76,378,1592895600"; d="scan'208";a="136642297"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 00:39:41 -0700
IronPort-SDR: cpqu5oJjtHe/5eym1UYD6o0g7AXVpPuyD46nPTnRfnkitIhEIr7HkVpX4oUDLQ9GbHMDlCvBJb
 jIWt7AsFJfKQ==
X-IronPort-AV: E=Sophos;i="5.76,378,1592895600"; d="scan'208";a="477095293"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.154])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 00:39:37 -0700
Date: Tue, 1 Sep 2020 13:09:33 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v8 00/17] drm/i915: Add support for HDCP 1.4 over MST
Message-ID: <20200901073933.GA31122@intel.com>
References: <20200818153910.27894-1-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200818153910.27894-1-sean@poorly.run>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: anshuman.gupta@intel.com, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, Sean Paul <seanpaul@chromium.org>,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com, juston.li@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-08-18 at 11:38:48 -0400, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Only one functional change, reversed the hdcp_1x/2x_present bits in the
> QUERY_STREAM_ENCRYPTION_STATUS parsing with a comment explaining my
> confusion.
> 
> Other than that, lots of rebasing, the most notable being the
> s/intel_dig_port/dig_port/ rename. 
> 
> Every patch now has a Reviewed-by tag now, I've done build tests on each
> patch and tested the set as a whole. Hopefully we can get this landed.

Thanks for the change. Merged into dinq.

Ram
> 
> Sean
> 
> Sean Paul (17):
>   drm/i915: Fix sha_text population code
>   drm/i915: Clear the repeater bit on HDCP disable
>   drm/i915: WARN if HDCP signalling is enabled upon disable
>   drm/i915: Intercept Aksv writes in the aux hooks
>   drm/i915: Use the cpu_transcoder in intel_hdcp to toggle HDCP
>     signalling
>   drm/i915: Factor out hdcp->value assignments
>   drm/i915: Protect workers against disappearing connectors
>   drm/i915: Clean up intel_hdcp_disable
>   drm/i915: Don't fully disable HDCP on a port if multiple pipes are
>     using it
>   drm/i915: Support DP MST in enc_to_dig_port() function
>   drm/i915: Use ddi_update_pipe in intel_dp_mst
>   drm/i915: Factor out HDCP shim functions from dp for use by dp_mst
>   drm/i915: Plumb port through hdcp init
>   drm/i915: Add connector to hdcp_shim->check_link()
>   drm/mst: Add support for QUERY_STREAM_ENCRYPTION_STATUS MST sideband
>     message
>   drm/i915: Print HDCP version info for all connectors
>   drm/i915: Add HDCP 1.4 support for MST connectors
> 
>  drivers/gpu/drm/drm_dp_mst_topology.c         | 150 ++++
>  drivers/gpu/drm/i915/Makefile                 |   1 +
>  drivers/gpu/drm/i915/display/intel_ddi.c      |  29 +-
>  drivers/gpu/drm/i915/display/intel_ddi.h      |   2 +
>  .../drm/i915/display/intel_display_debugfs.c  |  21 +-
>  .../drm/i915/display/intel_display_types.h    |  30 +-
>  drivers/gpu/drm/i915/display/intel_dp.c       | 646 +---------------
>  drivers/gpu/drm/i915/display/intel_dp.h       |   9 +
>  drivers/gpu/drm/i915/display/intel_dp_hdcp.c  | 703 ++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |  19 +
>  drivers/gpu/drm/i915/display/intel_hdcp.c     | 217 ++++--
>  drivers/gpu/drm/i915/display/intel_hdcp.h     |   2 +-
>  drivers/gpu/drm/i915/display/intel_hdmi.c     |  30 +-
>  .../drm/selftests/test-drm_dp_mst_helper.c    |  17 +
>  include/drm/drm_dp_helper.h                   |   3 +
>  include/drm/drm_dp_mst_helper.h               |  44 ++
>  include/drm/drm_hdcp.h                        |   3 +
>  17 files changed, 1202 insertions(+), 724 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> 
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
