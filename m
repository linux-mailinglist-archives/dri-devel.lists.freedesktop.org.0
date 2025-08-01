Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A3BB18004
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 12:14:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FD4C10E00B;
	Fri,  1 Aug 2025 10:14:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="eFDqVWMy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 831 seconds by postgrey-1.36 at gabe;
 Fri, 01 Aug 2025 10:14:28 UTC
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D9410E00B
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 10:14:28 +0000 (UTC)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 571A0DSU3658055;
 Fri, 1 Aug 2025 05:00:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1754042413;
 bh=+lzQCpjIL2kcZnGoBLiwLI0Nk+m2bExltKA9pYuYIjk=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=eFDqVWMyD6zx7hTm3kiZuQ4iDHRZk8jSS/9XbvnroVbU3Z3Ia0loMGnvnIkbHOV+S
 GAsBy2oBt0wpwLgWD5TJLY11K0PlgOXa/kLsb6NE214pmS3adwhXhnPz/ODOE21fhN
 VCPuRxRvbZYwgehkoBvkvDd1nCfIgNv5P0xceouo=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 571A0CGs4013498
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Fri, 1 Aug 2025 05:00:12 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 1
 Aug 2025 05:00:11 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 1 Aug 2025 05:00:11 -0500
Received: from [172.24.235.208] (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 571A05OW211294;
 Fri, 1 Aug 2025 05:00:05 -0500
Content-Type: multipart/alternative;
 boundary="------------rAHobDLEDGD5qPhF0fO4q3uU"
Message-ID: <86e6d551-59ac-410e-a34f-3351e7c8b9e1@ti.com>
Date: Fri, 1 Aug 2025 15:30:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] MHDP8546 fixes related to DBANC usecase
To: Jayesh Choudhary <j-choudhary@ti.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <mripard@kernel.org>,
 <lumag@kernel.org>, <dianders@chromium.org>,
 <dri-devel@lists.freedesktop.org>, <tomi.valkeinen@ideasonboard.com>
CC: <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <lyude@redhat.com>,
 <luca.ceresoli@bootlin.com>, <viro@zeniv.linux.org.uk>,
 <andy.yan@rock-chips.com>, <linux@treblig.org>, <javierm@redhat.com>,
 <linux-kernel@vger.kernel.org>, <devarsht@ti.com>
References: <20250624054448.192801-1-j-choudhary@ti.com>
Content-Language: en-US
From: Harikrishna Shenoy <a0512644@ti.com>
In-Reply-To: <20250624054448.192801-1-j-choudhary@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

--------------rAHobDLEDGD5qPhF0fO4q3uU
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 6/24/25 11:14, Jayesh Choudhary wrote:
> With the introduction of DBANC framework, the connector is no longer
> initialised in bridge_attach if that flag is set by the display
> controller.
>
> This series does some cleanup for legacy !(DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> usecase and adds fixes for DRM_BRIDGE_ATTACH_NO_CONNECTOR usecase.
>
> v3 patch link:
> <https://lore.kernel.org/all/20250529142517.188786-1-j-choudhary@ti.com/>

For the series

Reviewed-by: Harikrishna Shenoy<h-shenoy@ti.com>

Tested-by: Harikrishna Shenoy<h-shenoy@ti.com>

> Changelog v3->v4:
> - Fix kernel test robot build warning:
>    <https://lore.kernel.org/all/202505300201.2s6r12yc-lkp@intel.com/>
>
> v2 patch link:
> <https://lore.kernel.org/all/20250521073237.366463-1-j-choudhary@ti.com/>
>
> Changelog v2->v3:
> - Add mode_valid in drm_bridge_funcs to a separate patch
> - Remove "if (mhdp->connector.dev)" conditions that were missed in v2
> - Split out the move of drm_atomic_get_new_connector_for_encoder()
>    to a separate patch
> - Drop "R-by" considering the changes in v2[1/3]
> - Add Fixes tag to first 4 patches:
>    commit c932ced6b585 ("drm/tidss: Update encoder/bridge chain connect model")
>    This added DBANC flag in tidss while attaching bridge to the encoder
> - Drop RFC prefix
>
> v1 patch link:
> <https://lore.kernel.org/all/20250116111636.157641-1-j-choudhary@ti.com/>
>
> Changelog v1->v2:
> - Remove !DRM_BRIDGE_ATTACH_NO_CONNECTOR entirely
> - Add mode_valid in drm_bridge_funcs[0]
> - Fix NULL POINTER differently since we cannot access atomic_state
> - Reduce log level in cdns_mhdp_transfer call
>
> [0]:https://lore.kernel.org/all/20240530091757.433106-1-j-choudhary@ti.com/
>
> Jayesh Choudhary (5):
>    drm/bridge: cadence: cdns-mhdp8546-core: Remove legacy support for
>      connector initialisation in bridge
>    drm/bridge: cadence: cdns-mhdp8546*: Change drm_connector from
>      structure to pointer
>    drm/bridge: cadence: cdns-mhdp8546-core: Set the mhdp connector
>      earlier in atomic_enable()
>    drm/bridge: cadence: cdns-mhdp8546-core: Add mode_valid hook to
>      drm_bridge_funcs
>    drm/bridge: cadence: cdns-mhdp8546-core: Reduce log level for DPCD
>      read/write
>
>   .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 235 ++++--------------
>   .../drm/bridge/cadence/cdns-mhdp8546-core.h   |   2 +-
>   .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   |   8 +-
>   3 files changed, 49 insertions(+), 196 deletions(-)
>
--------------rAHobDLEDGD5qPhF0fO4q3uU
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 6/24/25 11:14, Jayesh Choudhary
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250624054448.192801-1-j-choudhary@ti.com">
      <pre wrap="" class="moz-quote-pre">With the introduction of DBANC framework, the connector is no longer
initialised in bridge_attach if that flag is set by the display
controller.

This series does some cleanup for legacy !(DRM_BRIDGE_ATTACH_NO_CONNECTOR)
usecase and adds fixes for DRM_BRIDGE_ATTACH_NO_CONNECTOR usecase.

v3 patch link:
<a class="moz-txt-link-rfc2396E" href="https://lore.kernel.org/all/20250529142517.188786-1-j-choudhary@ti.com/">&lt;https://lore.kernel.org/all/20250529142517.188786-1-j-choudhary@ti.com/&gt;</a>
</pre>
    </blockquote>
    <pre id="b"
style="font-size: 13px; font-family: monospace; background: rgb(255, 255, 255); color: rgb(0, 0, 51); white-space: pre-wrap; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">For the series

Reviewed-by: Harikrishna Shenoy <a class="moz-txt-link-rfc2396E" href="mailto:h-shenoy@ti.com">&lt;h-shenoy@ti.com&gt;</a>

Tested-by: Harikrishna Shenoy <a class="moz-txt-link-rfc2396E" href="mailto:h-shenoy@ti.com">&lt;h-shenoy@ti.com&gt;</a>

</pre>
    <blockquote type="cite"
      cite="mid:20250624054448.192801-1-j-choudhary@ti.com">
      <pre wrap="" class="moz-quote-pre">
Changelog v3-&gt;v4:
- Fix kernel test robot build warning:
  <a class="moz-txt-link-rfc2396E" href="https://lore.kernel.org/all/202505300201.2s6r12yc-lkp@intel.com/">&lt;https://lore.kernel.org/all/202505300201.2s6r12yc-lkp@intel.com/&gt;</a>

v2 patch link:
<a class="moz-txt-link-rfc2396E" href="https://lore.kernel.org/all/20250521073237.366463-1-j-choudhary@ti.com/">&lt;https://lore.kernel.org/all/20250521073237.366463-1-j-choudhary@ti.com/&gt;</a>

Changelog v2-&gt;v3:
- Add mode_valid in drm_bridge_funcs to a separate patch
- Remove "if (mhdp-&gt;connector.dev)" conditions that were missed in v2
- Split out the move of drm_atomic_get_new_connector_for_encoder()
  to a separate patch
- Drop "R-by" considering the changes in v2[1/3]
- Add Fixes tag to first 4 patches:
  commit c932ced6b585 ("drm/tidss: Update encoder/bridge chain connect model")
  This added DBANC flag in tidss while attaching bridge to the encoder
- Drop RFC prefix

v1 patch link:
<a class="moz-txt-link-rfc2396E" href="https://lore.kernel.org/all/20250116111636.157641-1-j-choudhary@ti.com/">&lt;https://lore.kernel.org/all/20250116111636.157641-1-j-choudhary@ti.com/&gt;</a>

Changelog v1-&gt;v2:
- Remove !DRM_BRIDGE_ATTACH_NO_CONNECTOR entirely
- Add mode_valid in drm_bridge_funcs[0]
- Fix NULL POINTER differently since we cannot access atomic_state
- Reduce log level in cdns_mhdp_transfer call

[0]: <a class="moz-txt-link-freetext" href="https://lore.kernel.org/all/20240530091757.433106-1-j-choudhary@ti.com/">https://lore.kernel.org/all/20240530091757.433106-1-j-choudhary@ti.com/</a>

Jayesh Choudhary (5):
  drm/bridge: cadence: cdns-mhdp8546-core: Remove legacy support for
    connector initialisation in bridge
  drm/bridge: cadence: cdns-mhdp8546*: Change drm_connector from
    structure to pointer
  drm/bridge: cadence: cdns-mhdp8546-core: Set the mhdp connector
    earlier in atomic_enable()
  drm/bridge: cadence: cdns-mhdp8546-core: Add mode_valid hook to
    drm_bridge_funcs
  drm/bridge: cadence: cdns-mhdp8546-core: Reduce log level for DPCD
    read/write

 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 235 ++++--------------
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |   2 +-
 .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   |   8 +-
 3 files changed, 49 insertions(+), 196 deletions(-)

</pre>
    </blockquote>
  </body>
</html>

--------------rAHobDLEDGD5qPhF0fO4q3uU--
