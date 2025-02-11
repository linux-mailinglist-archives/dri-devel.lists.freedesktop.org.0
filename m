Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F89AA306A8
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 10:09:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8086610E45A;
	Tue, 11 Feb 2025 09:09:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dBBBif+D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC2B10E45A
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 09:09:20 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3971673E;
 Tue, 11 Feb 2025 10:08:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1739264882;
 bh=9zkYL3P1bgmOqqVTSBM6wM97gg2QF3AGlInImNoJOz0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dBBBif+DMdo23M1FI3mNbYNfMCs18kQZaNdfzoDA7Ab4J+jk5vr25RptRUGfjHBpn
 NLhlGt+tbByowoxHo7qAYnaHOlHDojTJe9sV89NC902OLTYvwt5tyPCVmr7/zdOQfn
 qF2D6UXz+Cubh18YoxmIevKRfDHac5+1mNMMqKrk=
Message-ID: <e894d5be-21ba-4028-816b-e47ce36e03d5@ideasonboard.com>
Date: Tue, 11 Feb 2025 11:09:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/13]drm/bridge: cdns-dsi: Fix the color-shift issue
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Udit Kumar <u-kumar1@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>
References: <20250209121032.32655-1-aradhya.bhatia@linux.dev>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20250209121032.32655-1-aradhya.bhatia@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 09/02/2025 14:10, Aradhya Bhatia wrote:
> Hello all,
> 
> This series provides some crucial fixes and improvements for the Cadence's DSI
> TX (cdns-dsi) controller found commonly in Texas Instruments' J7 family of SoCs,
> as well as in Sitara AM62P and AM62L SoCs.

I tested this on AI-64 with an RPi panel. The image is not quite stable, 
but that's always been the case with AI-64 and this panel, and I think 
it's not related to anything in this series (there's probably more to 
fix with the cdns-dsi...).

I think this series is ready for merging.

Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

> Along with that, this series aims to fix the color-shift issue that has been
> going on with the DSI controller. This controller requires to be enabled before
> the previous entity enables its stream[0]. It's a strict requirement which, if
> not followed, causes the colors to "shift" on the display. The fix happens in
> 2 steps.
> 
>      1. The bridge pre_enable calls have been shifted before the crtc_enable and
>         the bridge post_disable calls have been shifted after the crtc_disable.
>         This has been done as per the definition of bridge pre_enable.
> 
>         "The display pipe (i.e. clocks and timing signals) feeding this bridge
>         will not yet be running when this callback is called".
> 
>         Since CRTC is also a source feeding the bridge, it should not be enabled
>         before the bridges in the pipeline are pre_enabled.
> 
>         The sequence of enable after this patch will look like:
> 
> 	        bridge[n]_pre_enable
> 	        ...
> 	        bridge[1]_pre_enable
> 
> 	        crtc_enable
> 	        encoder_enable
> 
> 	        bridge[1]_enable
> 	        ...
> 	        bridge[n]_enable
> 
>         and vice-versa for the bridge chain disable sequence.
> 
> 
>      2. The cdns-dsi enable / disable sequences have now been moved to pre_enable
>         and post_disable sequences. This is the only way to have cdns-dsi drivers
>         be up and ready before the previous entity is enables its streaming.
> 
> The DSI also spec requires the Clock and Data Lanes be ready before the DSI TX
> enables its stream[0]. A patch has been added to make the code wait for that to
> happen. Going ahead with further DSI (and DSS configuration), while the lanes
> are not ready, has been found to be another reason for shift in colors.
> 
> These patches have been tested with J721E based BeagleboneAI64 along with a
> RaspberryPi 7" DSI panel. The extra patches can be found in the
> "next_dsi-v9_2-tests" branch[1] of my github fork if anyone would like to test
> them.
> 
> Thanks,
> Aradhya
> 
> 
> * Important note about the authorship of patches *
> 
> All but one of the patches have been authored when I owned a "ti.com" based
> email id, i.e. <a-bhatia1@ti.com>. This email id is not in use anymore, and all
> the work done later has been part of my personal work. Since the original
> patches were authored using TI's email id, I have maintained the original
> authorships as they are, as well as their sign offs.
> 
> I have further added another sign off that uses my current (and personal) email
> id, the one that is being used to send this revision, i.e.
> <aradhya.bhatia@linux.dev>.
> 
> 
> * Note on checkpatch warnings in patch 11/13 *
> Patch 11/13 caueses the checkpatch to flare up for 1 warning, and 1 check -
> 
> WARNING: line length of 101 exceeds 100 columns
> #63: FILE: drivers/gpu/drm/drm_atomic_helper.c:1252:
> 
> CHECK: Lines should not end with a '('
> #77: FILE: drivers/gpu/drm/drm_atomic_helper.c:1266:
> 
> This patch is largely duplicating the original code, with minor differences to
> perform different operations. Both these lines of code pre-exist in the file and
> have simply been duplicated. I have decided to keep them as is to maintain the
> uniformity and the originaly intended readability. Should perhaps a fix be
> required, this patch/series is not the right place, and another patch can be
> created to fix this across the whole file.
> 
> 
> [0]: Section 12.6.5.7.3: "Start-up Procedure" [For DSI TX controller]
>       in TDA4VM Technical Reference Manual https://www.ti.com/lit/zip/spruil1
> 
> [1]: https://github.com/aradhya07/linux-ab/tree/next_dsi-v9_2-tests
> 
> 
> Change Log:
>    - Changes in v9:
>      - Fix the oops in 11/13 - where the encoder_bridge_enable _was_ pre_enabling
>        the bridges instead of enabling.
>      - Add the following tags:
>        - Dmitry Baryshkov's R-b in patches 2, 10, 11, and A-b in patch 12.
>        - Jayesh Choudhary's R-b in patch 12.
>        - Tomi Valkeinen's R-b in patches 2, 10, 11, 12.
> 
>    - Changes in v8:
>      - Move the phy de-initialization to bridge post_disable() instead of bridge
>        disable() in patch-3.
>      - Copy the private bridge state (dsi_cfg), in addition to the bridge_state,
>        in patch-9.
>      - Split patch v7:11/12 into three patches, v8:{10,11,12}/13, to separate out
>        different refactorings into different patches, and improve bisectability.
>      - Move patch v7:02/12 down to v8:06/12, to keep the initial patches for
>        fixes only.
>      - Drop patch v7:04/12 as it doesn't become relevant until patch v7:12/12.
>      - Add R-b tags of Dmitry Baryshkov in patch-9 and patch-3, and of
>        Tomi Valkeinen in patch-9.
>     
>    - Changes in v7:
>      - phy_init()/exit() were called from the PM path in v6. Change it back to
>        the bridge enable/disable path in patch-3, so that the phy_init() can go
>        back to being called after D-Phy reset assert.
>      - Reword commit text in patch-5 to explain the need of the fix.
>      - Drop the stray code in patch-10.
>      - Add R-b tag of Dmitry Baryshkov in patch-6.
> 
>    - Changes in v6:
>      - Reword patch 3 to better explain the fixes around phy de-init.
>      - Fix the Lane ready timeout condition in patch 7.
>      - Fix the dsi _bridge_atomic_check() implementation by adding a new
>        bridge state structure in patch 10.
>      - Rework and combine patches v5:11/13 and v5:12/13 to v6:11/12.
>      - Generate the patches of these series using the "patience" algorithm.
>        Note: All patches, except v6:11/12, *do not* differ from their default
>        (greedy) algorithm variants.
>        For patch 11, the patience algorithm significantly improves the readability.
>      - Rename and move the Bridge enable/disable enums from public to private
>        in patch 11.
>      - Add R-b tags of Tomi Valkeinen in patch 6, and Dmitry Baryshkov in patch 2.
> 
>    - Changes in v5:
>      - Fix subject and description in patch 1/13.
>      - Add patch to check the return value of
>        phy_mipi_dphy_get_default_config() (patch: 6/13).
>      - Change the Clk and Data Lane ready timeout from forever to 5s.
>      - Print an error instead of calling WARN_ON_ONCE in patch 7/13.
>      - Drop patch v4-07/11: "drm/bridge: cdns-dsi: Reset the DCS write FIFO".
>        There has been some inconsistencies found with this patch upon further
>        testing. This patch was being used to enable a DSI panel based on ILITEK
>        ILI9881C bridge. This will be debugged separately.
>      - Add patch to move the DSI mode check from _atomic_enable() to
>        _atomic_check() (patch: 10/13).
>      - Split patch v4-10/11 into 2 patches - 11/13 and 12/13.
>        Patch 11/13 separates out the Encoder-Bridge operations into a helper
>        function *without* changing the logic. Patch 12/13 then changes the order
>        of the encoder-bridge operations as was intended in the original patch.
>      - Add detailed comment for patch 13/13.
>      - Add Tomi Valkeinen's R-b in patches 1, 2, 4, 5, 7, 8, 9, 13.
> 
>    - Changes in v4:
>      - Add new patch, "drm/bridge: cdns-dsi: Move to devm_drm_of_get_bridge()",
>        to update to an auto-managed way of finding next bridge in the chain.
>      - Drop patch "drm/bridge: cdns-dsi: Fix the phy_initialized variable" and
>        add "drm/bridge: cdns-dsi: Fix Phy _init() and _exit()" that properly
>        de-initializes the Phy and maintains the initialization state.
>      - Reword patch "drm/bridge: cdns-dsi: Reset the DCS write FIFO" to explain
>        the HW concerns better.
>      - Add R-b tag from Dmitry Baryshkov for patches 1/11 and 8/11.
> 
>    - Changes in v3:
>      - Reword the commit message for patch "drm/bridge: cdns-dsi: Fix OF node
>        pointer".
>      - Add a new helper API to figure out DSI host input pixel format
>        in patch "drm/mipi-dsi: Add helper to find input format".
>      - Use a common function for bridge pre-enable and enable, and bridge disable
>        and post-disable, to avoid code duplication.
>      - Add T-b tag from Dominik Haller in patch 5/10. (Missed to add it in v2).
>      - Add R-b tag from Dmitry Baryshkov for patch 8/10.
> 
>    - Changes in v2:
>      - Drop patch "drm/tidss: Add CRTC mode_fixup"
>      - Split patch "drm/bridge: cdns-dsi: Fix minor bugs" into 4 separate ones
>      - Drop support for early_enable/late_disable APIs and instead re-order the
>        pre_enable / post_disable APIs to be called before / after crtc_enable /
>        crtc_disable.
>      - Drop support for early_enable/late_disable in cdns-dsi and use
>        pre_enable/post_disable APIs instead to do bridge enable/disable.
> 
> 
> Previous versions:
> 
> v1: https://lore.kernel.org/all/20240511153051.1355825-1-a-bhatia1@ti.com/
> v2: https://lore.kernel.org/all/20240530093621.1925863-1-a-bhatia1@ti.com/
> v3: https://lore.kernel.org/all/20240617105311.1587489-1-a-bhatia1@ti.com/
> v4: https://lore.kernel.org/all/20240622110929.3115714-1-a-bhatia1@ti.com/
> v5: https://lore.kernel.org/all/20241019195411.266860-1-aradhya.bhatia@linux.dev/
> v6: https://lore.kernel.org/all/20250111192738.308889-1-aradhya.bhatia@linux.dev/
> v7: https://lore.kernel.org/all/20250114055626.18816-1-aradhya.bhatia@linux.dev/
> v8: https://lore.kernel.org/all/20250126191551.741957-1-aradhya.bhatia@linux.dev/
> 
> Aradhya Bhatia (13):
>    drm/bridge: cdns-dsi: Fix connecting to next bridge
>    drm/bridge: cdns-dsi: Fix phy de-init and flag it so
>    drm/bridge: cdns-dsi: Fix the clock variable for mode_valid()
>    drm/bridge: cdns-dsi: Check return value when getting default PHY
>      config
>    drm/bridge: cdns-dsi: Wait for Clk and Data Lanes to be ready
>    drm/bridge: cdns-dsi: Move to devm_drm_of_get_bridge()
>    drm/mipi-dsi: Add helper to find input format
>    drm/bridge: cdns-dsi: Support atomic bridge APIs
>    drm/bridge: cdns-dsi: Move DSI mode check to _atomic_check()
>    drm/atomic-helper: Refactor crtc & encoder-bridge op loops into
>      separate functions
>    drm/atomic-helper: Separate out bridge pre_enable/post_disable from
>      enable/disable
>    drm/atomic-helper: Re-order bridge chain pre-enable and post-disable
>    drm/bridge: cdns-dsi: Use pre_enable/post_disable to enable/disable
> 
>   .../gpu/drm/bridge/cadence/cdns-dsi-core.c    | 225 ++++++++++++++----
>   .../gpu/drm/bridge/cadence/cdns-dsi-core.h    |   2 -
>   drivers/gpu/drm/drm_atomic_helper.c           | 160 +++++++++++--
>   drivers/gpu/drm/drm_mipi_dsi.c                |  37 +++
>   include/drm/drm_mipi_dsi.h                    |   1 +
>   5 files changed, 349 insertions(+), 76 deletions(-)
> 
> 
> base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04

