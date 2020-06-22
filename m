Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BAE203F90
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 20:59:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 716126E8BC;
	Mon, 22 Jun 2020 18:59:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA396E8B7;
 Mon, 22 Jun 2020 18:59:25 +0000 (UTC)
IronPort-SDR: cimKlrIpCjFHxk2g2cnrVL2PUtrOQ/e9E8qqasYEauqSgYHFKQXMX8NF2/zPPyRbRI1OlH2C7i
 Pbz/6dJh/bEw==
X-IronPort-AV: E=McAfee;i="6000,8403,9660"; a="142099491"
X-IronPort-AV: E=Sophos;i="5.75,268,1589266800"; d="scan'208";a="142099491"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2020 11:59:22 -0700
IronPort-SDR: RIVfqPdrAw2prsZLVy6b8ZWHqatBkrv9mSbmXAEOjpHP4UK5HNl2C5SEagNtXT67TwX49va3sZ
 8KsYxiQcai4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,268,1589266800"; d="scan'208";a="278856012"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO intel.com)
 ([10.165.21.211])
 by orsmga006.jf.intel.com with ESMTP; 22 Jun 2020 11:59:22 -0700
Date: Mon, 22 Jun 2020 12:00:43 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Subject: Re: [Intel-gfx] [v1 3/3] Revert "drm/amd/display: Expose connector
 VRR range via debugfs"
Message-ID: <20200622190042.GA18249@intel.com>
References: <20200622142519.16214-1-bhanuprakash.modem@intel.com>
 <20200622142519.16214-4-bhanuprakash.modem@intel.com>
 <f9c32dfa-0a23-45c0-8991-545c071da388@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f9c32dfa-0a23-45c0-8991-545c071da388@amd.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 22, 2020 at 10:57:02AM -0400, Kazlauskas, Nicholas wrote:
> On 2020-06-22 10:25 a.m., Bhanuprakash Modem wrote:
> >As both VRR min and max are already part of drm_display_info,
> >drm can expose this VRR range for each connector.
> >
> >Hence this logic should move to core DRM.
> >
> >This reverts commit 727962f030c23422a01e8b22d0f463815fb15ec4.
> >
> >Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> >Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> >Cc: Harry Wentland <harry.wentland@amd.com>
> >Cc: Alex Deucher <alexander.deucher@amd.com>
> >Cc: Manasi Navare <manasi.d.navare@intel.com>
> >Cc: AMD gfx <amd-gfx@lists.freedesktop.org>
> 
> 
> Looks good to me with Patch 2 part of the series.
> 
> Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> 

Thanks for your review, do we have your r-b on patch 2/3 also?
In that case, how do you think we should merge the patches?
Patch 2/3 will be merged through drm-misc, how about this one?

Manasi

> Thanks,
> Nicholas Kazlauskas
> 
> >---
> >  .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 20 -------------------
> >  1 file changed, 20 deletions(-)
> >
> >diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> >index 076af267b488..71387d2af2ed 100644
> >--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> >+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> >@@ -820,24 +820,6 @@ static int output_bpc_show(struct seq_file *m, void *data)
> >  	return res;
> >  }
> >-/*
> >- * Returns the min and max vrr vfreq through the connector's debugfs file.
> >- * Example usage: cat /sys/kernel/debug/dri/0/DP-1/vrr_range
> >- */
> >-static int vrr_range_show(struct seq_file *m, void *data)
> >-{
> >-	struct drm_connector *connector = m->private;
> >-	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
> >-
> >-	if (connector->status != connector_status_connected)
> >-		return -ENODEV;
> >-
> >-	seq_printf(m, "Min: %u\n", (unsigned int)aconnector->min_vfreq);
> >-	seq_printf(m, "Max: %u\n", (unsigned int)aconnector->max_vfreq);
> >-
> >-	return 0;
> >-}
> >-
> >  #ifdef CONFIG_DRM_AMD_DC_HDCP
> >  /*
> >   * Returns the HDCP capability of the Display (1.4 for now).
> >@@ -1001,7 +983,6 @@ static ssize_t dp_dpcd_data_read(struct file *f, char __user *buf,
> >  DEFINE_SHOW_ATTRIBUTE(dmub_fw_state);
> >  DEFINE_SHOW_ATTRIBUTE(dmub_tracebuffer);
> >  DEFINE_SHOW_ATTRIBUTE(output_bpc);
> >-DEFINE_SHOW_ATTRIBUTE(vrr_range);
> >  #ifdef CONFIG_DRM_AMD_DC_HDCP
> >  DEFINE_SHOW_ATTRIBUTE(hdcp_sink_capability);
> >  #endif
> >@@ -1059,7 +1040,6 @@ static const struct {
> >  		{"phy_settings", &dp_phy_settings_debugfs_fop},
> >  		{"test_pattern", &dp_phy_test_pattern_fops},
> >  		{"output_bpc", &output_bpc_fops},
> >-		{"vrr_range", &vrr_range_fops},
> >  #ifdef CONFIG_DRM_AMD_DC_HDCP
> >  		{"hdcp_sink_capability", &hdcp_sink_capability_fops},
> >  #endif
> >
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
