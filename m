Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE78257636
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 11:12:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 331ED89D57;
	Mon, 31 Aug 2020 09:12:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7276F89D64
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 02:24:15 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20200831022413epoutp04d51d35ff1b15293d3b1e7b108b81f373~wORpnUrv61446814468epoutp04T
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 02:24:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20200831022413epoutp04d51d35ff1b15293d3b1e7b108b81f373~wORpnUrv61446814468epoutp04T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598840653;
 bh=sCHnxRr7Ywv2tkn8TTmaRcZLtRgo3KAePB6cyOO2d6U=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=OtjsbxGgZc6fOMVaLO6FalGWDvR5sZSVlPuznYoYsrtnDwHKP+LdW+q+wGY/+Yjd6
 JMlLLlbWbINfXp4UKVP8aC5ox149bz+3bLHv8ygxoUr9MpnaTQypxx7xWmzQD0z4yP
 3PLAgG0GZwtVsXfmZxDvsPban82v+Uo2+EovPieo=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200831022412epcas1p202d1c58378bf1ab3fcb228173905616b~wORpQA70o1618216182epcas1p2Q;
 Mon, 31 Aug 2020 02:24:12 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.152]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4BfvCX0h1nzMqYkV; Mon, 31 Aug
 2020 02:24:08 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 0F.19.19033.34F5C4F5; Mon, 31 Aug 2020 11:24:03 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200831022402epcas1p287bc11e1be7a8a0c1ad29ead7fb9b547~wORfjsNjk0905009050epcas1p2L;
 Mon, 31 Aug 2020 02:24:02 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200831022402epsmtrp2e3cc9eabb0525801c23da29d9744cc63~wORfiim8i3133131331epsmtrp2X;
 Mon, 31 Aug 2020 02:24:02 +0000 (GMT)
X-AuditID: b6c32a36-159ff70000004a59-93-5f4c5f4350b6
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 DD.9A.08382.24F5C4F5; Mon, 31 Aug 2020 11:24:02 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200831022402epsmtip21fda64a38d38a5bcaa6ee60a4b43e700~wORfMSm911349613496epsmtip2G;
 Mon, 31 Aug 2020 02:24:02 +0000 (GMT)
Subject: Re: [PATCH v4 00/78] drm/vc4: Support BCM2711 Display Pipeline
To: Maxime Ripard <maxime@cerno.tech>, Nicolas Saenz Julienne
 <nsaenzjulienne@suse.de>, Eric Anholt <eric@anholt.net>
From: Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <69b21f2a-b229-ed04-3eaf-d65ba6843398@samsung.com>
Date: Mon, 31 Aug 2020 11:36:31 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01TfUxTVxzNbV9fCwF5Kyh3XaLlLWSBBegrFC5OmItfb0IywhaWgKHr4AUq
 pa197eYkARSQD9kUjRM7GWPI3JgwBgwBh6VYROhwbHzIkI8NMHMilEEwoNGM9mHGf+d37jk5
 Ob97r4gvXsAlIrXWyBi0Kg2Ju2MtNwNkQXuUsUrZ/e93oLpPuzE0X1GNoUrbHQEaWnHgqPP4
 IEBtQ3UYapwZEaB/SycFaLD9Eo7K7jUIUfnqc4B+69uHWsxXcDQxeRtD9WNzOCrosAnR85Ef
 MTR9fgrsFtMnHLdw2jFaIKTNU/04PX7nV5xuM08I6cbaYpyeOtXDo5su59Cnn8nogu4nGN1k
 z6KXG7fHeSRm7EpnVKmMQcpoU3Spam1aFBnzrnKPUhEuo4KoSBRBSrWqTCaK3BsbF7RfrVkv
 R0o/UmlM61ScimXJkOhdBp3JyEjTdawximT0qRp9pD6YVWWyJm1acIoucyclk8kV68IPMtL7
 V/7B9SvxR5/2VYJcYI4uASIRJMJgdYG8BLiLxEQrgI/HlgXcsATgZ8MnhdzwGMDSG834C8ej
 BprjOwAs6hnCucEB4PGZaVAC3ETexAF4uToPc2If4mNYWGzhO0V8ogGDf/y8wnce4EQgtDwY
 xZ3Yi/CDw6szLrMnEQ2/Hp52aTDCHw5M33fxW4kE2NuSv6F5CfZenHUFuBEM/MZylefEfMIX
 js1WbuAd8Nr8JVcwJC64QdsFi8sMib1w8WLdBvaGD3uahRyWwOWFDpzDWfC7XhvOmYsAbLYM
 CLiDUGipOcdz7oJPBMAf2kM42g+2Pa0AXPAWuLBSKuDW5QmLToo5yatw8M8JHodfhtWFxfgZ
 QJo31TFvqmDeVMH8f9hXAKsF2xg9m5nGsJRevvm2G4Hr4QeGt4Kz84vBXYAnAl0Aivikj2dn
 e4xS7Jmq+uQYY9ApDSYNw3YBxfqCy/iSrSm69Z+jNSophTw0NBSFUeEKiiJ9Pf8akyrFRJrK
 yGQwjJ4xvPDxRG6SXF6y+vM38rbPH3GjcooHeGsm3BYRf0tz7/BZo9W+32OLe406cumJ2d5F
 W6sOOt5/LxknDzaVKsd9H5R7KF6RxvulJ/WXtH3Yh9rsx3r2hey0avNtVdYb28j6puzc1oX8
 zNGMxMXIt+oibtYUjpSO5HfHJsaJHHdjOiV5dh/7jH/Q7sUjhb+UPfRLPBdae30gqu+qV1NR
 wqOqiBm2Q34ie5L6du2dMPLLpCtJVi9Jp73xujs/55ohafzuUn/96nS/dK46OUlZoa5RCGZf
 jzxkOnr40Klwf57X75ry7IrRmDlb6ts5B7zfrN27ZvjC13xbsFQmfBbAe22p40zW31b5YMLp
 n0iMTVdRgXwDq/oP23gitIEEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRmVeSWpSXmKPExsWy7bCSvK5TvE+8wYwuCYu1vUdZLN7OXcxi
 Mf/IOVaLK1/fs1kcaLzMaLHzyloWi02Pr7FafOy5x2pxedccNouJtzewW8z48Y/R4uIpV4tt
 s5azWdy9d4LFYt2t12wWrXuPsFv8u7aRxeLR1PuMDkIeTe+PsXm8v9HK7jHr/lk2jzvnzrN5
 7Jx1l91j06pONo/73ceZPDYvqffo/2vg0Xr0F4vH5tPVHp83yQXwRHHZpKTmZJalFunbJXBl
 nP36kq3ga1DF71PzGRsYZ9l1MXJwSAiYSLzZ4NHFyMUhJLCbUaKz5SdzFyMnUFxSYtrFo8wQ
 NcIShw8XQ9S8ZZQ4tOgVK0iNsIC7xJLFzSwgtohApcTnObvAepkFNrFItG6QhmjYwShx7foe
 sAY2AS2J/S9usIHY/AKKEld/PGYEsXkF7CQWXX0E1swioCpx4dFTsLioQJjEziWPmSBqBCVO
 znwCtoxTIFVi2f41TBDL1CX+zLsEtVhc4taT+VBxeYntb+cwT2AUnoWkfRaSlllIWmYhaVnA
 yLKKUTK1oDg3PbfYsMAwL7Vcrzgxt7g0L10vOT93EyM48rU0dzBuX/VB7xAjEwfjIUYJDmYl
 Ed4Du7zjhXhTEiurUovy44tKc1KLDzFKc7AoifPeKFwYJySQnliSmp2aWpBaBJNl4uCUamDa
 7rlb/fMNlyP7vyo+Uroy6/0chtPMf2NLp6rfElqet3V3pvk3Wz/HGtVL2favJW58V031f2Xx
 dMHCmRO143/+m2nBo2iUpVfUYFr0w17w7z0rbxXJSwF6PzaWLPv9s0942bm9jccvJEtmTj64
 ptbP/pBTkf0C2bC4l1mZHDnfFecsnMgifDfFdp6ZpfBSr7jFfTkLFsRu5OhIW+d8gPP3oZAl
 sqqMBTK7dV9xO9Q2V539xJe1yiZ7g9XbIyt7zGKuTPhQu8/5pd+HxTM2r/2xx/KAgxn7/p7p
 NVWzfNaIL/RJMEmWu6VTnBGb7yy4tGRTR8BnoQtshT0TFq9dmx921/bGwX0P3t0V/ds6oeeX
 EktxRqKhFnNRcSIA610ce2sDAAA=
X-CMS-MailID: 20200831022402epcas1p287bc11e1be7a8a0c1ad29ead7fb9b547
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200708174241epcas1p41adcd519bbcdebef119ebc9da0d2b26f
References: <CGME20200708174241epcas1p41adcd519bbcdebef119ebc9da0d2b26f@epcas1p4.samsung.com>
 <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
X-Mailman-Approved-At: Mon, 31 Aug 2020 09:12:28 +0000
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On 7/9/20 2:41 AM, Maxime Ripard wrote:
> Hi everyone,
> 
> Here's a (pretty long) series to introduce support in the VC4 DRM driver
> for the display pipeline found in the BCM2711 (and thus the RaspberryPi 4).
> 
> The main differences are that there's two HDMI controllers and that there's
> more pixelvalve now. Those pixelvalve come with a mux in the HVS that still
> have only 3 FIFOs. Both of those differences are breaking a bunch of
> expectations in the driver, so we first need a good bunch of cleanup and
> reworks to introduce support for the new controllers.
> 
> Similarly, the HDMI controller has all its registers shuffled and split in
> multiple controllers now, so we need a bunch of changes to support this as
> well.
> 
> Only the HDMI support is enabled for now (even though the DPI and DSI
> outputs have been tested too).
> 
> Let me know if you have any comments
> Maxime
> 
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: devicetree@vger.kernel.org
> Cc: Kamal Dasu <kdasu.kdev@gmail.com>
> Cc: linux-clk@vger.kernel.org
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> 
> Changes from v3:
>   - Rebased on top of next-20200708
>   - Added a name to the HDMI audio codec component
>   - Only disable the BCM2711 HDMI pixelvalves at boot
>   - Fixed an error in the HVS binding
>   - Fix a framebuffer size condition that was inverted
>   - Changed the channel allocation algorithm using Eric's suggestion
>   - Always write the muxing values instead of updating if needed
>   - Improved a bit the hvs_available_channels comment in the structure
>   - Change atomic_complete_commit code to use for_each_new_crtc_in_state
>   - Change the muxing code to take into account disparities between the
>     BCM2711 and previous SoCs.
>   - Only change the clock rate on BCM2711 during a modeset
>   - Fix a crash at atomic_disable
>   - Use clk_set_min_rate for the core clock too
>   - Add a few defines, and simplify the FIFO level stuff
>   - Reordered the patches according to Eric's reviews
>   - Fixed a regression with VID_CTL setting on RPI3
> 
> Changes from v2:
>   - Rebased on top of next-20200526
>   - Split the firmware clock series away
>   - Removed the stuck pixel (with all the subsequent pixels being shifted
>     by one
>   - Fixed the writeback issue too.
>   - Fix the dual output
>   - Fixed the return value of phy_get_cp_current
>   - Enhanced the comment on the reset delay
>   - Increase the max width and height
>   - Made a proper Kconfig option for the DVP clock driver
>   - Fixed the alsa card name collision
> 
> Changes from v1:
>   - Rebased on top of 5.7-rc1
>   - Run checkpatch
>   - Added audio support
>   - Fixed some HDMI timeouts
>   - Swiched to clk_hw_register_gate_parent_data
>   - Reorder Kconfig symbols in drivers/i2c/busses
>   - Make the firmware clocks a child of the firmware node
>   - Switch DVP clock driver to clk_hw interface
>   - constify raspberrypi_clk_data in raspberrypi_clock_property
>   - Don't mark firmware clocks as IGNORE_UNUSED
>   - Change from reset_ms to reset_us in reset-simple, and add a bit more
>     comments
>   - Remove generic clk patch to test if a NULL pointer is returned
>   - Removed misleading message in the is_prepared renaming patch commit
>     message
>   - Constify HDMI controller variants
>   - Fix a bug in the allocation size of the clk data array
>   - Added a mention in the DT binding conversion patches about the breakage
>   - Merged a few fixes from kbuild
>   - Fixed a few bisection and CEC build issues
>   - Collected Acked-by and Reviewed-by
>   - Change Dave email address to raspberrypi.com
> 
> Dave Stevenson (7):
>   drm/vc4: Add support for the BCM2711 HVS5
>   drm/vc4: plane: Change LBM alignment constraint on LBM
>   drm/vc4: plane: Optimize the LBM allocation size
>   drm/vc4: hdmi: Use reg-names to retrieve the HDMI audio registers
>   drm/vc4: hdmi: Reset audio infoframe on encoder_enable if previously streaming
>   drm/vc4: hdmi: Set the b-frame marker to the match ALSA's default.
>   drm/vc4: hdmi: Add audio-related callbacks
> 
> Maxime Ripard (71):
>   dt-bindings: display: Add support for the BCM2711 HVS
>   drm/vc4: hvs: Boost the core clock during modeset
>   drm/vc4: plane: Create more planes
>   drm/vc4: crtc: Deal with different number of pixel per clock
>   drm/vc4: crtc: Use a shared interrupt
>   drm/vc4: crtc: Move the cob allocation outside of bind
>   drm/vc4: crtc: Rename HVS channel to output
>   drm/vc4: crtc: Use local chan variable
>   drm/vc4: crtc: Enable and disable the PV in atomic_enable / disable
>   drm/vc4: kms: Convert to for_each_new_crtc_state
>   drm/vc4: crtc: Assign output to channel automatically
>   drm/vc4: crtc: Add FIFO depth to vc4_crtc_data
>   drm/vc4: crtc: Add function to compute FIFO level bits
>   drm/vc4: crtc: Rename HDMI encoder type to HDMI0
>   drm/vc4: crtc: Add HDMI1 encoder type
>   drm/vc4: crtc: Disable color management for HVS5
>   drm/vc4: crtc: Turn pixelvalve reset into a function
>   drm/vc4: crtc: Move PV dump to config_pv
>   drm/vc4: crtc: Move HVS init and close to a function
>   drm/vc4: crtc: Move the HVS gamma LUT setup to our init function
>   drm/vc4: hvs: Make sure our channel is reset
>   drm/vc4: crtc: Remove mode_set_nofb
>   drm/vc4: crtc: Remove redundant pixelvalve reset
>   drm/vc4: crtc: Move HVS channel init before the PV initialisation
>   drm/vc4: encoder: Add finer-grained encoder callbacks
>   drm/vc4: crtc: Add a delay after disabling the PixelValve output
>   drm/vc4: crtc: Clear the PixelValve FIFO on disable
>   drm/vc4: crtc: Clear the PixelValve FIFO during configuration
>   drm/vc4: hvs: Make the stop_channel function public
>   drm/vc4: hvs: Introduce a function to get the assigned FIFO
>   drm/vc4: crtc: Move the CRTC disable out
>   drm/vc4: drv: Disable the CRTC at boot time
>   dt-bindings: display: vc4: pv: Add BCM2711 pixel valves
>   drm/vc4: crtc: Add BCM2711 pixelvalves
>   drm/vc4: hdmi: Use debugfs private field
>   drm/vc4: hdmi: Move structure to header
>   drm/vc4: hdmi: rework connectors and encoders
>   drm/vc4: hdmi: Remove DDC argument to connector_init
>   drm/vc4: hdmi: Rename hdmi to vc4_hdmi
>   drm/vc4: hdmi: Move accessors to vc4_hdmi
>   drm/vc4: hdmi: Use local vc4_hdmi directly
>   drm/vc4: hdmi: Add container_of macros for encoders and connectors
>   drm/vc4: hdmi: Pass vc4_hdmi to CEC code
>   drm/vc4: hdmi: Retrieve the vc4_hdmi at unbind using our device
>   drm/vc4: hdmi: Remove vc4_dev hdmi pointer
>   drm/vc4: hdmi: Remove vc4_hdmi_connector
>   drm/vc4: hdmi: Introduce resource init and variant
>   drm/vc4: hdmi: Implement a register layout abstraction
>   drm/vc4: hdmi: Add reset callback
>   drm/vc4: hdmi: Add PHY init and disable function
>   drm/vc4: hdmi: Add PHY RNG enable / disable function
>   drm/vc4: hdmi: Add a CSC setup callback
>   drm/vc4: hdmi: Store the encoder type in the variant structure
>   drm/vc4: hdmi: Deal with multiple debugfs files
>   drm/vc4: hdmi: Move CEC init to its own function
>   drm/vc4: hdmi: Add CEC support flag
>   drm/vc4: hdmi: Remove unused CEC_CLOCK_DIV define
>   drm/vc4: hdmi: Rename drm_encoder pointer in mode_valid
>   drm/vc4: hdmi: Adjust HSM clock rate depending on pixel rate
>   drm/vc4: hdmi: Use clk_set_min_rate instead
>   drm/vc4: hdmi: Deal with multiple ALSA cards
>   drm/vc4: hdmi: Remove register dumps in enable
>   drm/vc4: hdmi: Always recenter the HDMI FIFO
>   drm/vc4: hdmi: Implement finer-grained hooks
>   drm/vc4: hdmi: Do the VID_CTL configuration at once
>   drm/vc4: hdmi: Switch to blank pixels when disabled
>   drm/vc4: hdmi: Support the BCM2711 HDMI controllers
>   dt-bindings: display: vc4: hdmi: Add BCM2711 HDMI controllers bindings
>   dt-bindings: display: vc4: Document BCM2711 VC5
>   drm/vc4: drv: Support BCM2711
>   ARM: dts: bcm2711: Enable the display pipeline
> 
>  Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml        |  109 +++++-
>  Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml         |   18 +-
>  Documentation/devicetree/bindings/display/brcm,bcm2835-pixelvalve0.yaml |    5 +-
>  Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml         |    1 +-
>  arch/arm/boot/dts/bcm2711-rpi-4-b.dts                                   |   46 ++-
>  arch/arm/boot/dts/bcm2711.dtsi                                          |  115 ++++-
>  drivers/gpu/drm/vc4/Makefile                                            |    1 +-
>  drivers/gpu/drm/vc4/vc4_crtc.c                                          |  338 +++++++++++----
>  drivers/gpu/drm/vc4/vc4_drv.c                                           |    5 +-
>  drivers/gpu/drm/vc4/vc4_drv.h                                           |   43 +-
>  drivers/gpu/drm/vc4/vc4_hdmi.c                                          | 1625 +++++++++++++++++++++++++++++++++++++++++++-----------------------------
>  drivers/gpu/drm/vc4/vc4_hdmi.h                                          |  183 ++++++++-
>  drivers/gpu/drm/vc4/vc4_hdmi_phy.c                                      |  520 +++++++++++++++++++++++-
>  drivers/gpu/drm/vc4/vc4_hdmi_regs.h                                     |  442 ++++++++++++++++++++-
>  drivers/gpu/drm/vc4/vc4_hvs.c                                           |  260 +++++++-----
>  drivers/gpu/drm/vc4/vc4_kms.c                                           |  225 +++++++++-
>  drivers/gpu/drm/vc4/vc4_plane.c                                         |  222 +++++++---
>  drivers/gpu/drm/vc4/vc4_regs.h                                          |  177 +++-----
>  drivers/gpu/drm/vc4/vc4_txp.c                                           |    4 +-
>  19 files changed, 3331 insertions(+), 1008 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
>  create mode 100644 drivers/gpu/drm/vc4/vc4_hdmi.h
>  create mode 100644 drivers/gpu/drm/vc4/vc4_hdmi_phy.c
>  create mode 100644 drivers/gpu/drm/vc4/vc4_hdmi_regs.h
> 
> base-commit: 5bdd2824d705fb8d339d6f96e464b907c9a1553d
> 

I tested it for stress test with reboot command repetitively
for verifying this patchset. It is well working.

Tested-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
