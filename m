Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62941B35904
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 11:34:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E2D010E61D;
	Tue, 26 Aug 2025 09:34:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CzPArZ0K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE3E210E61D;
 Tue, 26 Aug 2025 09:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756200875; x=1787736875;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=jn7qa7RNIH/4d26C/PqCPQiPmid6vOiIwfSpUFTDhnk=;
 b=CzPArZ0KMci1FX3VgDNIkCdq7U+g2u8rUVWQzOlAt5Nvk594dJ2b8W+2
 GU9cJz3ZDUk7oIOeDxbqfaqhIoNIJd88v7nGA92LFEnc/YJW4b06OLrqX
 fub6oP6I9rNIr8FtW5RdQrAZXWlPidOuuIxW3Btqa1XZ/JguNWv0R9TO5
 FifzAgZnrQidIfSOnqITgg3t32Ti53klE7UiLGiASw9MHuJ6j//6tAqza
 5iTSt0wGbNkne4Krvl5SsBCgFx/Zs2mEYSFJHVRtVp/aQ1K5Qn8wufvHP
 r7N59Vl55b/zGgHDn20+zfmcDtW7sWCQXoPYY+miDBO7KLcCsQ4KmW8xy w==;
X-CSE-ConnectionGUID: YgvkMANPThmzSG4LooEa6A==
X-CSE-MsgGUID: N+zdFAA8S8WcI57STzI5Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="57446926"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208,217";a="57446926"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 02:34:34 -0700
X-CSE-ConnectionGUID: Sx/CBdi/TXiEl7Cy/B07uA==
X-CSE-MsgGUID: fjCwonFBRLqP7e0asviZrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
 d="scan'208,217";a="169928433"
Received: from aiddamse-mobl3.gar.corp.intel.com (HELO [10.247.150.174])
 ([10.247.150.174])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 02:34:30 -0700
Content-Type: multipart/alternative;
 boundary="------------sEuNln2CBYIFqGhsuKXbmgW2"
Message-ID: <ec613c23-1c0a-417c-92c1-df47fd09d3d7@linux.intel.com>
Date: Tue, 26 Aug 2025 15:04:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v5 5/5] drm/xe/RAS: send multicast event on occurrence of an
 error
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Michael J <michael.j.ruhl@intel.com>, Riana Tauro <riana.tauro@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>
References: <20250730064956.1385855-1-aravind.iddamsetty@linux.intel.com>
 <20250730064956.1385855-6-aravind.iddamsetty@linux.intel.com>
 <aJ-uRzbCxXmiQhlH@intel.com>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <aJ-uRzbCxXmiQhlH@intel.com>
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

This is a multi-part message in MIME format.
--------------sEuNln2CBYIFqGhsuKXbmgW2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 16-08-2025 03:31, Rodrigo Vivi wrote:
> On Wed, Jul 30, 2025 at 12:19:56PM +0530, Aravind Iddamsetty wrote:
>> Whenever a correctable or an uncorrectable error happens an event is sent
>> to the corresponding listeners of these groups.
>>
>> v2: Rebase
>> v3: protect with CONFIG_NET define.
>>
>> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com> #v2
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_hw_error.c | 41 ++++++++++++++++++++++++++++++++
>>  1 file changed, 41 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
>> index bdd9c88674b2..e6e2e6250b70 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -2,6 +2,8 @@
>>  /*
>>   * Copyright © 2023 Intel Corporation
>>   */
>> +#include <net/genetlink.h>
>> +#include <uapi/drm/drm_netlink.h>
>>  
>>  #include "xe_gt_printk.h"
>>  #include "xe_hw_error.h"
>> @@ -776,6 +778,43 @@ xe_soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>>  				(HARDWARE_ERROR_MAX << 1) + 1);
>>  }
>>  
>> +#ifdef CONFIG_NET
>> +static void
>> +generate_netlink_event(struct xe_device *xe, const enum hardware_error hw_err)
>> +{
>> +	struct sk_buff *msg;
>> +	void *hdr;
>> +
>> +	if (!xe->drm.drm_genl_family)
>> +		return;
>> +
>> +	msg = nlmsg_new(NLMSG_DEFAULT_SIZE, GFP_ATOMIC);
>> +	if (!msg) {
>> +		drm_dbg_driver(&xe->drm, "couldn't allocate memory for error multicast event\n");
>> +		return;
>> +	}
>> +
>> +	hdr = genlmsg_put(msg, 0, 0, xe->drm.drm_genl_family, 0, DRM_RAS_CMD_ERROR_EVENT);
> this is something that could be wrapped up in the drm_ras
are you  referring to entire generate_netlink_event function? because I
thought driver might want to pass in custom info as part of event
may be like the error ID that was reported by HW.
Thanks,
Aravind.
>
>> +	if (!hdr) {
>> +		drm_dbg_driver(&xe->drm, "mutlicast msg buffer is small\n");
>> +		nlmsg_free(msg);
>> +		return;
>> +	}
>> +
>> +	genlmsg_end(msg, hdr);
>> +
>> +	genlmsg_multicast(xe->drm.drm_genl_family, msg, 0,
>> +			  hw_err ?
>> +			  DRM_GENL_MCAST_UNCORR_ERR
>> +			  : DRM_GENL_MCAST_CORR_ERR,
>> +			  GFP_ATOMIC);
>> +}
>> +#else
>> +static void
>> +generate_netlink_event(struct xe_device *xe, const enum hardware_error hw_err)
>> +{}
>> +#endif
>> +
>>  static void
>>  xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>>  {
>> @@ -837,6 +876,8 @@ xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_er
>>  	}
>>  
>>  	xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(hw_err), errsrc);
>> +
>> +	generate_netlink_event(tile_to_xe(tile), hw_err);
>>  unlock:
>>  	spin_unlock_irqrestore(&tile_to_xe(tile)->irq.lock, flags);
>>  }
>> -- 
>> 2.25.1
>>
--------------sEuNln2CBYIFqGhsuKXbmgW2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 16-08-2025 03:31, Rodrigo Vivi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aJ-uRzbCxXmiQhlH@intel.com">
      <pre wrap="" class="moz-quote-pre">On Wed, Jul 30, 2025 at 12:19:56PM +0530, Aravind Iddamsetty wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Whenever a correctable or an uncorrectable error happens an event is sent
to the corresponding listeners of these groups.

v2: Rebase
v3: protect with CONFIG_NET define.

Reviewed-by: Michael J. Ruhl <a class="moz-txt-link-rfc2396E" href="mailto:michael.j.ruhl@intel.com">&lt;michael.j.ruhl@intel.com&gt;</a> #v2
Signed-off-by: Aravind Iddamsetty <a class="moz-txt-link-rfc2396E" href="mailto:aravind.iddamsetty@linux.intel.com">&lt;aravind.iddamsetty@linux.intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_hw_error.c | 41 ++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index bdd9c88674b2..e6e2e6250b70 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -2,6 +2,8 @@
 /*
  * Copyright © 2023 Intel Corporation
  */
+#include &lt;net/genetlink.h&gt;
+#include &lt;uapi/drm/drm_netlink.h&gt;
 
 #include "xe_gt_printk.h"
 #include "xe_hw_error.h"
@@ -776,6 +778,43 @@ xe_soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 				(HARDWARE_ERROR_MAX &lt;&lt; 1) + 1);
 }
 
+#ifdef CONFIG_NET
+static void
+generate_netlink_event(struct xe_device *xe, const enum hardware_error hw_err)
+{
+	struct sk_buff *msg;
+	void *hdr;
+
+	if (!xe-&gt;drm.drm_genl_family)
+		return;
+
+	msg = nlmsg_new(NLMSG_DEFAULT_SIZE, GFP_ATOMIC);
+	if (!msg) {
+		drm_dbg_driver(&amp;xe-&gt;drm, "couldn't allocate memory for error multicast event\n");
+		return;
+	}
+
+	hdr = genlmsg_put(msg, 0, 0, xe-&gt;drm.drm_genl_family, 0, DRM_RAS_CMD_ERROR_EVENT);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
this is something that could be wrapped up in the drm_ras</pre>
    </blockquote>
    are you  referring to entire <span style="white-space: pre-wrap">generate_netlink_event function? because I thought driver might want to pass in custom info as part of event</span><br>
    <span style="white-space: pre-wrap">may be like the error ID that was reported by HW.</span><br>
    <span style="white-space: pre-wrap">
</span><span style="white-space: pre-wrap">Thanks,</span><br>
    <span style="white-space: pre-wrap">Aravind.</span>
    <blockquote type="cite" cite="mid:aJ-uRzbCxXmiQhlH@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	if (!hdr) {
+		drm_dbg_driver(&amp;xe-&gt;drm, "mutlicast msg buffer is small\n");
+		nlmsg_free(msg);
+		return;
+	}
+
+	genlmsg_end(msg, hdr);
+
+	genlmsg_multicast(xe-&gt;drm.drm_genl_family, msg, 0,
+			  hw_err ?
+			  DRM_GENL_MCAST_UNCORR_ERR
+			  : DRM_GENL_MCAST_CORR_ERR,
+			  GFP_ATOMIC);
+}
+#else
+static void
+generate_netlink_event(struct xe_device *xe, const enum hardware_error hw_err)
+{}
+#endif
+
 static void
 xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 {
@@ -837,6 +876,8 @@ xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_er
 	}
 
 	xe_mmio_write32(&amp;tile-&gt;mmio, DEV_ERR_STAT_REG(hw_err), errsrc);
+
+	generate_netlink_event(tile_to_xe(tile), hw_err);
 unlock:
 	spin_unlock_irqrestore(&amp;tile_to_xe(tile)-&gt;irq.lock, flags);
 }
-- 
2.25.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------sEuNln2CBYIFqGhsuKXbmgW2--
