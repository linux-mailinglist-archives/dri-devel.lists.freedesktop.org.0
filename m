Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F4BC78F03
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 13:07:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7BF110E0CE;
	Fri, 21 Nov 2025 12:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="r3gfstet";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7964F10E0CE
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 12:07:42 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21C836A6;
 Fri, 21 Nov 2025 13:05:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1763726735;
 bh=CSz7DcU4vC7vNNXvv0S58mDvdmc6kNxg9oj2/N9Le9w=;
 h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
 b=r3gfstetiWyxxWsWJLuaKMQ9+9p/YTqnYLcM8ayzbl/6E5VzSm8aUnjTIPaG0Lexv
 cOKWkxiYEH6ew1uqyQsVVSKe19jv2HotgCFeFEuqybsBenH9sVjUwshke8i19zBTVh
 yrWC4scl8vEQhpxTltQwMeyNF6x+4o4hfqMxOWq8=
Message-ID: <22985633-f20c-4f36-96d1-ce01fe6cf6df@ideasonboard.com>
Date: Fri, 21 Nov 2025 14:07:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v9 0/6] MHDP8546 fixes related to
 DRM_BRIDGE_ATTACH_NO_CONNECTOR usecase
To: Harikrishna Shenoy <h-shenoy@ti.com>
References: <20251120121416.660781-1-h-shenoy@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 andrzej.hajda@intel.com, andy.yan@rock-chips.com, aradhya.bhatia@linux.dev,
 devarsht@ti.com, dianders@chromium.org, dri-devel@lists.freedesktop.org,
 javierm@redhat.com, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, linux@treblig.org, luca.ceresoli@bootlin.com,
 lumag@kernel.org, lyude@redhat.com, maarten.lankhorst@linux.intel.com,
 mordan@ispras.ru, mripard@kernel.org, neil.armstrong@linaro.org,
 rfoss@kernel.org, s-jain1@ti.com, simona@ffwll.ch, tzimmermann@suse.de,
 u-kumar1@ti.com
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20251120121416.660781-1-h-shenoy@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi,

On 20/11/2025 14:14, Harikrishna Shenoy wrote:
> With the DRM_BRIDGE_ATTACH_NO_CONNECTOR framework, the connector is 
> no longer initialized in  bridge_attach() when the display controller 
> sets the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag. 
> This causes a null pointer dereference in cdns_mhdp_modeset_retry_fn() 
> when trying to access &conn->dev->mode_config.mutex. 
> Observed on a board where EDID read failed. 
> (log: https://gist.github.com/Jayesh2000/233f87f9becdf1e66f1da6fd53f77429)
> 
> Patch 1 adds a connector_ptr which takes care of both 
> DRM_BRIDGE_ATTACH_NO_CONNECTOR and !DRM_BRIDGE_ATTACH_NO_CONNECTOR 
> case by setting the pointer in appropriate hooks and checking for pointer 
> validity before accessing the connector.
> Patch 2 adds mode validation hook to bridge fucntions.
> Patch 3 fixes HDCP to work with both DRM_BRIDGE_ATTACH_NO_CONNECTOR 
> and !DRM_BRIDGE_ATTACH_NO_CONNECTOR case by moving HDCP state handling 
> into the bridge atomic check inline with the 
> DRM_BRIDGE_ATTACH_NO_CONNECTOR model.
> Patches 4,5 do necessary cleanup and alignment for using
> connector pointer.
> 
> The rationale behind the sequence of commits is we can cleanly 
> switch to drm_connector pointer after removal of connector helper 
> code blocks, which are anyways not touch after 
> DRM_BRIDGE_ATTACH_NO_CONNECTOR has been enabled in driver.
> 
> The last patch make smaller adjustment: lowering the log level for
> noisy DPCD transfer errors.
> 
> v8 patch link:
> <https://lore.kernel.org/all/20251014094527.3916421-1-h-shenoy@ti.com/>
> 
> Changelog v8-v9:
> -Move the patch 6 in v8 related to HDCP to patch 3 and add fixes tag.
> -Update to connector_ptr in HDCP code in patch 1.
> -Rebased on next-20251114.

Don't base on linux-next, except in some quite special circumstances.
Base on latest major version from Linus, or -rc from Linus, or
drm-misc-next. Usually drm-misc-next is a safe choice for DRM patches.

And if you make changes to a series, it's not a "resend" but a new version.

 Tomi

> 
> v7 patch link:
> <https://lore.kernel.org/all/20250929083936.1575685-1-h-shenoy@ti.com/>
> 
> Changelog v7-v8:
> -Move patches with firxes tag to top of series with appropriate changes
> to them.
> -Add R/B tag to patch 
> https://lore.kernel.org/all/ae3snoap64r252sbqhsshsadxfmlqdfn6b4o5fgfcmxppglkqf@2lsstfsghzwb/
> 
> v6 patch link:
> <https://lore.kernel.org/all/20250909090824.1655537-1-h-shenoy@ti.com/>
> 
> Changelog v6-v7:
> -Update cover letter to explain the series.
> -Add R/B tag in PATCH 1 and drop fixes tag as suggested.
> -Drop fixes tag in PATCH 2.
> -Update the commit messages for clear understanding of changes done in patches.
> 
> v5 patch link:
> <https://lore.kernel.org/all/20250811075904.1613519-1-h-shenoy@ti.com/>
> 
> Changelog v5 -> v6:
> -Update cover letter to clarify the series in better way.
> -Add Reviewed-by tag to relevant patches.
>  
> v4 patch link: 
> <https://lore.kernel.org/all/20250624054448.192801-1-j-choudhary@ti.com>
> 
> Changelog v4->v5:
> - Handle HDCP state in bridge atomic check instead of connector 
> atomic check
>  
> v3 patch link:
> <https://lore.kernel.org/all/20250529142517.188786-1-j-choudhary@ti.com/>
> 
> Changelog v3->v4:
> - Fix kernel test robot build warning:
>   <https://lore.kernel.org/all/202505300201.2s6r12yc-lkp@intel.com/>
> 
> v2 patch link:
> <https://lore.kernel.org/all/20250521073237.366463-1-j-choudhary@ti.com/>
> 
> Changelog v2->v3:
> - Add mode_valid in drm_bridge_funcs to a separate patch
> - Remove "if (mhdp->connector.dev)" conditions that were missed in v2
> - Split out the move of drm_atomic_get_new_connector_for_encoder()
>   to a separate patch
> - Drop "R-by" considering the changes in v2[1/3]
> - Add Fixes tag to first 4 patches:
>   commit c932ced6b585 ("drm/tidss: Update encoder/bridge chain connect model")
>   This added DBANC flag in tidss while attaching bridge to the encoder
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
> [0]: https://lore.kernel.org/all/20240530091757.433106-1-j-choudhary@ti.com/
> 
> Harikrishna Shenoy (1):
>   drm/bridge: cadence: cdns-mhdp8546-core: Handle HDCP state in bridge
>     atomic check
> 
> Jayesh Choudhary (5):
>   drm/bridge: cadence: cdns-mhdp8546-core: Set the mhdp connector
>     earlier in atomic_enable()
>   drm/bridge: cadence: cdns-mhdp8546-core: Add mode_valid hook to
>     drm_bridge_funcs
>   drm/bridge: cadence: cdns-mhdp8546-core: Remove legacy support for
>     connector initialisation in bridge
>   drm/bridge: cadence: cdns-mhdp8546*: Change drm_connector from
>     structure to pointer
>   drm/bridge: cadence: cdns-mhdp8546-core: Reduce log level for DPCD
>     read/write
> 
>  .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 258 +++++-------------
>  .../drm/bridge/cadence/cdns-mhdp8546-core.h   |   2 +-
>  .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   |   8 +-
>  3 files changed, 72 insertions(+), 196 deletions(-)
> 

