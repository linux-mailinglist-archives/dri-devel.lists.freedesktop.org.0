Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FC82C5FC6
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 06:36:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B4CC6E990;
	Fri, 27 Nov 2020 05:36:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBCDC6E949;
 Fri, 27 Nov 2020 05:36:20 +0000 (UTC)
IronPort-SDR: 6V/+OxSYj0lv88ADNlMpX5qZ9elKumBWAJvvsOerOKQViEHYXa1dZ5kcflQ9gQQ3O5wtoMdThZ
 XzigskN+vRHg==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="172509126"
X-IronPort-AV: E=Sophos;i="5.78,373,1599548400"; d="scan'208";a="172509126"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2020 21:36:20 -0800
IronPort-SDR: WiUjSQCdyA8NRLQx1NZPKejw1e8I2ubv33Xc7J0kyWInp4KRZBV07p2/4Gn2dTWrqU8t7xQvt7
 2ptPDgtBv18w==
X-IronPort-AV: E=Sophos;i="5.78,373,1599548400"; d="scan'208";a="547936684"
Received: from kbs1-mobl1.gar.corp.intel.com (HELO [10.215.141.221])
 ([10.215.141.221])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2020 21:36:16 -0800
Subject: Re: [Intel-gfx] [PATCH v6 00/18] HDCP 2.2 and HDCP 1.4 Gen12 DP MST
 support
To: Anshuman Gupta <anshuman.gupta@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20201126073722.19107-1-anshuman.gupta@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <40fd5cf9-b2ba-576f-9e84-252368db8c47@intel.com>
Date: Fri, 27 Nov 2020 11:06:12 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201126073722.19107-1-anshuman.gupta@intel.com>
Content-Language: en-US
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
Cc: jani.nikula@intel.com, seanpaul@chromium.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/26/2020 1:07 PM, Anshuman Gupta wrote:
> This is v6 version to test with IGT https://patchwork.freedesktop.org/series/82987/
> This v6 has added a new patch to series to avoid a crash reported on Chrome-OS
> and has addressed the few cosmetics review comments from Ram.
> It has been also tested manually with above IGT series.
>
> [PATCH v6 12/18] misc/mei/hdcp: Fix AUTH_STREAM_REQ cmd buffer len
> has an Ack from Tomas to merge it via drm-intel.
>
> [PATCH v6 13/18] drm/hdcp: Max MST content streams
> has an Ack from drm-misc maintainer to merge it via drm-intel.
>
> Test-with: 20201126050320.2434-2-karthik.b.s@intel.com

As HDCP over MST set up is not present on CI,

tested this series locally with v4 of the IGT series. 
https://patchwork.freedesktop.org/series/82987/

Tested-by: Karthik B S <karthik.b.s@intel.com>

>
> Anshuman Gupta (18):
>    drm/i915/hdcp: Update CP property in update_pipe
>    drm/i915/hdcp: Get conn while content_type changed
>    drm/i915/hotplug: Handle CP_IRQ for DP-MST
>    drm/i915/hdcp: No HDCP when encoder is't initialized
>    drm/i915/hdcp: DP MST transcoder for link and stream
>    drm/i915/hdcp: Move HDCP enc status timeout to header
>    drm/i915/hdcp: HDCP stream encryption support
>    drm/i915/hdcp: Enable HDCP 1.4 stream encryption
>    drm/i915/hdcp: Enable Gen12 HDCP 1.4 DP MST support
>    drm/i915/hdcp: Pass dig_port to intel_hdcp_init
>    drm/i915/hdcp: Encapsulate hdcp_port_data to dig_port
>    misc/mei/hdcp: Fix AUTH_STREAM_REQ cmd buffer len
>    drm/hdcp: Max MST content streams
>    drm/i915/hdcp: MST streams support in hdcp port_data
>    drm/i915/hdcp: Pass connector to check_2_2_link
>    drm/i915/hdcp: Add HDCP 2.2 stream register
>    drm/i915/hdcp: Support for HDCP 2.2 MST shim callbacks
>    drm/i915/hdcp: Enable HDCP 2.2 MST support
>
>   drivers/gpu/drm/i915/display/intel_ddi.c      |  14 +-
>   drivers/gpu/drm/i915/display/intel_ddi.h      |   6 +-
>   .../drm/i915/display/intel_display_types.h    |  20 +-
>   drivers/gpu/drm/i915/display/intel_dp.c       |  14 +-
>   drivers/gpu/drm/i915/display/intel_dp_hdcp.c  | 186 +++++++++--
>   drivers/gpu/drm/i915/display/intel_dp_mst.c   |   8 +-
>   drivers/gpu/drm/i915/display/intel_hdcp.c     | 303 ++++++++++++++----
>   drivers/gpu/drm/i915/display/intel_hdcp.h     |   8 +-
>   drivers/gpu/drm/i915/display/intel_hdmi.c     |  19 +-
>   drivers/gpu/drm/i915/i915_reg.h               |  31 ++
>   drivers/misc/mei/hdcp/mei_hdcp.c              |   3 +-
>   include/drm/drm_hdcp.h                        |   8 +-
>   12 files changed, 500 insertions(+), 120 deletions(-)
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
