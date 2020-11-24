Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B00F2C2359
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 11:57:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 428D86E210;
	Tue, 24 Nov 2020 10:57:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CEEF6E210;
 Tue, 24 Nov 2020 10:57:50 +0000 (UTC)
IronPort-SDR: 5HQ7ECG9N8rCyncbxay9rYM0vjFO7nh1lN9iz8VPN1/JKCbxaPOnft/dwW8NdQTuUBFdN271r+
 L/nViX9HHuHQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9814"; a="169361945"
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; 
 d="scan'208,217";a="169361945"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 02:57:47 -0800
IronPort-SDR: NbsIMSlPR29ZQyJP/8o7pMuAkoGEi7FxwTf2+/8JdLOffg39ABcjgHcsKLrDn0h3L07gEtr2LW
 uMzTKiZPWRcQ==
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; 
 d="scan'208,217";a="370377457"
Received: from kbs1-mobl1.gar.corp.intel.com (HELO [10.251.77.86])
 ([10.251.77.86])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 02:57:45 -0800
Subject: Re: [Intel-gfx] [PATCH v5 00/17] HDCP 2.2 and HDCP 1.4 Gen12 DP MST
 support
To: Anshuman Gupta <anshuman.gupta@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20201111062051.11529-1-anshuman.gupta@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <967f47ba-cb87-2094-8167-b3501292c47e@intel.com>
Date: Tue, 24 Nov 2020 16:27:27 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201111062051.11529-1-anshuman.gupta@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0194626906=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0194626906==
Content-Type: multipart/alternative;
 boundary="------------D765DBF6ACE55710C77F9D5D"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------D765DBF6ACE55710C77F9D5D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/2020 11:50 AM, Anshuman Gupta wrote:
> This is v5 version to test with IGT https://patchwork.freedesktop.org/series/82987/
> This has addressed the review comments from Ram.
> It has been also tested manually with above IGT series.

As we currently do not have a setup for HDCP over DP MST on CI,

I've tested this series on local set up with the above IGT series.

Tested-by: Karthik B S <karthik.b.s@intel.com>

>
> [PATCH v5 11/17] misc/mei/hdcp: Fix AUTH_STREAM_REQ cmd buffer len
> has an Ack from Tomas to merge it via drm-intel.
>
> [PATCH v5 12/17] drm/hdcp: Max MST content streams
> has an Ack from drm-misc maintainer to merge it via drm-intel.
>
> Test-with: 20201103082628.9287-2-karthik.b.s@intel.com
>
> Anshuman Gupta (17):
>    drm/i915/hdcp: Update CP property in update_pipe
>    drm/i915/hdcp: Get conn while content_type changed
>    drm/i915/hotplug: Handle CP_IRQ for DP-MST
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
>   drivers/gpu/drm/i915/display/intel_dp_hdcp.c  | 182 +++++++++--
>   drivers/gpu/drm/i915/display/intel_dp_mst.c   |  12 +-
>   drivers/gpu/drm/i915/display/intel_hdcp.c     | 294 ++++++++++++++----
>   drivers/gpu/drm/i915/display/intel_hdcp.h     |   8 +-
>   drivers/gpu/drm/i915/display/intel_hdmi.c     |  19 +-
>   drivers/gpu/drm/i915/i915_reg.h               |  31 ++
>   drivers/misc/mei/hdcp/mei_hdcp.c              |   3 +-
>   include/drm/drm_hdcp.h                        |   8 +-
>   12 files changed, 489 insertions(+), 122 deletions(-)
>


--------------D765DBF6ACE55710C77F9D5D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 11/11/2020 11:50 AM, Anshuman Gupta
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20201111062051.11529-1-anshuman.gupta@intel.com">
      <pre class="moz-quote-pre" wrap="">This is v5 version to test with IGT <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/series/82987/">https://patchwork.freedesktop.org/series/82987/</a>
This has addressed the review comments from Ram.
It has been also tested manually with above IGT series.</pre>
    </blockquote>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt">As we
      currently do
      not have a setup for HDCP over DP MST on CI,</p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt">I've
      tested this
      series on local set up with the above IGT series.</p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt"> </p>
    <p style="margin:0in;font-family:Calibri;font-size:11.0pt">Tested-by:
      Karthik B
      S <a class="moz-txt-link-rfc2396E" href="mailto:karthik.b.s@intel.com">&lt;karthik.b.s@intel.com&gt;</a></p>
    <blockquote type="cite"
      cite="mid:20201111062051.11529-1-anshuman.gupta@intel.com">
      <pre class="moz-quote-pre" wrap="">

[PATCH v5 11/17] misc/mei/hdcp: Fix AUTH_STREAM_REQ cmd buffer len
has an Ack from Tomas to merge it via drm-intel.

[PATCH v5 12/17] drm/hdcp: Max MST content streams
has an Ack from drm-misc maintainer to merge it via drm-intel.

Test-with: <a class="moz-txt-link-abbreviated" href="mailto:20201103082628.9287-2-karthik.b.s@intel.com">20201103082628.9287-2-karthik.b.s@intel.com</a>

Anshuman Gupta (17):
  drm/i915/hdcp: Update CP property in update_pipe
  drm/i915/hdcp: Get conn while content_type changed
  drm/i915/hotplug: Handle CP_IRQ for DP-MST
  drm/i915/hdcp: DP MST transcoder for link and stream
  drm/i915/hdcp: Move HDCP enc status timeout to header
  drm/i915/hdcp: HDCP stream encryption support
  drm/i915/hdcp: Enable HDCP 1.4 stream encryption
  drm/i915/hdcp: Enable Gen12 HDCP 1.4 DP MST support
  drm/i915/hdcp: Pass dig_port to intel_hdcp_init
  drm/i915/hdcp: Encapsulate hdcp_port_data to dig_port
  misc/mei/hdcp: Fix AUTH_STREAM_REQ cmd buffer len
  drm/hdcp: Max MST content streams
  drm/i915/hdcp: MST streams support in hdcp port_data
  drm/i915/hdcp: Pass connector to check_2_2_link
  drm/i915/hdcp: Add HDCP 2.2 stream register
  drm/i915/hdcp: Support for HDCP 2.2 MST shim callbacks
  drm/i915/hdcp: Enable HDCP 2.2 MST support

 drivers/gpu/drm/i915/display/intel_ddi.c      |  14 +-
 drivers/gpu/drm/i915/display/intel_ddi.h      |   6 +-
 .../drm/i915/display/intel_display_types.h    |  20 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |  14 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c  | 182 +++++++++--
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  12 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c     | 294 ++++++++++++++----
 drivers/gpu/drm/i915/display/intel_hdcp.h     |   8 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  19 +-
 drivers/gpu/drm/i915/i915_reg.h               |  31 ++
 drivers/misc/mei/hdcp/mei_hdcp.c              |   3 +-
 include/drm/drm_hdcp.h                        |   8 +-
 12 files changed, 489 insertions(+), 122 deletions(-)

</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------D765DBF6ACE55710C77F9D5D--

--===============0194626906==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0194626906==--
