Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 054077FB860
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 11:45:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5479910E011;
	Tue, 28 Nov 2023 10:45:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D301410E4B8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 10:45:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 4B62FB839A0;
 Tue, 28 Nov 2023 10:45:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 304E3C433C8;
 Tue, 28 Nov 2023 10:45:41 +0000 (UTC)
Message-ID: <50db7366-cd3d-4675-aaad-b857202234de@xs4all.nl>
Date: Tue, 28 Nov 2023 11:45:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/45] drm/connector: Create HDMI Connector
 infrastructure
Content-Language: en-US, nl
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>,
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
References: <20231128-kms-hdmi-connector-state-v4-0-c7602158306e@kernel.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20231128-kms-hdmi-connector-state-v4-0-c7602158306e@kernel.org>
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
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/11/2023 11:24, Maxime Ripard wrote:
> Hi,
> 
> Here's a series that creates some extra infrastructure specifically
> targeted at HDMI controllers.
> 
> The idea behind this series came from a recent discussion on IRC during
> which we discussed infoframes generation of i915 vs everything else.
> 
> Infoframes generation code still requires some decent boilerplate, with
> each driver doing some variation of it.
> 
> In parallel, while working on vc4, we ended up converting a lot of i915
> logic (mostly around format / bpc selection, and scrambler setup) to
> apply on top of a driver that relies only on helpers.
> 
> While currently sitting in the vc4 driver, none of that logic actually
> relies on any driver or hardware-specific behaviour.
> 
> The only missing piece to make it shareable are a bunch of extra
> variables stored in a state (current bpc, format, RGB range selection,
> etc.).
> 
> The initial implementation was relying on some generic subclass of
> drm_connector to address HDMI connectors, with a bunch of helpers that
> will take care of all the "HDMI Spec" related code. Scrambler setup is
> missing at the moment but can easily be plugged in.
> 
> The feedback was that creating a connector subclass like was done for
> writeback would prevent the adoption of those helpers since it couldn't
> be used in all situations (like when the connector driver can implement
> multiple output) and required more churn to cast between the
> drm_connector and its subclass. The decision was thus to provide a set
> of helper and to store the required variables in drm_connector and
> drm_connector_state. This what has been implemented now.
> 
> Hans Verkuil also expressed interest in implementing a mechanism in v4l2
> to retrieve infoframes from HDMI receiver and implementing an
> infoframe-decode tool.

For those who are interested in the InfoFrame parser:

https://git.linuxtv.org/hverkuil/edid-decode.git/log/?h=hverkuil

This is work-in-progress, and will definitely be rebased at times.

It is integrated into edid-decode since I want to be able to check the
InfoFrames against the EDID capabilities. If no EDID is given, then
those checks are skipped.

You can parse the InfoFrames with -I <path-to-if-file>. All known InfoFrames
are parsed, and I am working on adding the checks against the EDID whenever
time permits.

It's quite handy already as a parser, but it is really the checks against the
EDID that will make this really useful.

A related note: exposing InfoFrames is equally useful for the media subsystem
for video receivers (and the odd V4L2 video transmitter driver). I did look
at whether any of this drm code could be generalized, but it is too different
and frankly not worth the effort.

Also, when receiving InfoFrames you don't want to use the hdmi.h functions,
you want to dump the raw unprocessed InfoFrame.

I did a proof-of-concept for the adv7511-v4l2 tx and adv7604 rx drivers here:

https://git.linuxtv.org/hverkuil/media_tree.git/commit/?h=infoframe&id=19c80e21b30e2cafc0669cfae093a0b7a17c6b55

I am using debugfs here as well, but I am not actually certain whether that's
the best approach, esp. for receivers where access to InfoFrames can be very
useful for userspace. Options are e.g. /sys/class/video4linux/<devnode>/infoframes
or perhaps using V4L2 controls. TBD.

Regards,

	Hans

> 
> This series thus leverages the infoframe generation code to expose it
> through debugfs.
> 
> I also used the occasion to unit-test everything but the infoframe
> generation, which can come later once I get a proper understanding of
> what the infoframe are supposed to look like. This required to add some
> extra kunit helpers and infrastructure to have multiple EDIDs and allow
> each test to run with a particular set of capabilities.
> 
> This entire series has been tested on a Pi4, passes all its unittests
> (125 new tests), and has only been build-tested for sunxi and rockchip.
> 
> Let me know what you think,
> Maxime
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
> Changes in v4:
> - Create unit tests for everything but infoframes
> - Fix a number of bugs identified by the unit tests
> - Rename DRM (Dynamic Range and Mastering) infoframe file to HDR_DRM
> - Drop RFC status
> - Link to v3: https://lore.kernel.org/r/20231031-kms-hdmi-connector-state-v3-0-328b0fae43a7@kernel.org
> 
> Changes in v3:
> - Made sure the series work on the RaspberryPi4
> - Handle YUV420 in the char clock rate computation
> - Use the maximum bpc value the connector allows at reset
> - Expose the RGB Limited vs Full Range value in the connector state
>   instead of through a helper
> - Fix Broadcast RGB documentation
> - Add more debug logging
> - Small fixes here and there
> - Link to v2: https://lore.kernel.org/r/20230920-kms-hdmi-connector-state-v2-0-17932daddd7d@kernel.org
> 
> Changes in v2:
> - Change from a subclass to a set of helpers for drm_connector and
>   drm_connector state
> - Don't assume that all drivers support RGB, YUV420 and YUV422 but make
>   them provide a bitfield instead.
> - Don't assume that all drivers support the Broadcast RGB property but
>   make them call the registration helper.
> - Document the Broacast RGB property
> - Convert the inno_hdmi and sun4i_hdmi driver.
> - Link to v1: https://lore.kernel.org/r/20230814-kms-hdmi-connector-state-v1-0-048054df3654@kernel.org
> 
> ---
> Maxime Ripard (45):
>       drm/tests: helpers: Include missing drm_drv header
>       drm/tests: helpers: Add atomic helpers
>       drm/tests: Add helper to create mock plane
>       drm/tests: Add helper to create mock crtc
>       drm/connector: Check drm_connector_init pointers arguments
>       drm/tests: connector: Add tests for drmm_connector_init
>       drm/connector: Introduce an HDMI connector initialization function
>       drm/connector: hdmi: Create an HDMI sub-state
>       drm/connector: hdmi: Add Broadcast RGB property
>       drm/connector: hdmi: Add RGB Quantization Range to the connector state
>       drm/connector: hdmi: Add output BPC to the connector state
>       drm/connector: hdmi: Add support for output format
>       drm/connector: hdmi: Add HDMI compute clock helper
>       drm/connector: hdmi: Calculate TMDS character rate
>       drm/connector: hdmi: Add custom hook to filter TMDS character rate
>       drm/connector: hdmi: Compute bpc and format automatically
>       drm/connector: hdmi: Add Infoframes generation
>       drm/connector: hdmi: Create Infoframe DebugFS entries
>       drm/vc4: hdmi: Create destroy state implementation
>       drm/vc4: hdmi: Switch to HDMI connector
>       drm/vc4: tests: Remove vc4_dummy_plane structure
>       drm/vc4: tests: Convert to plane creation helper
>       drm/rockchip: inno_hdmi: Remove useless mode_fixup
>       drm/rockchip: inno_hdmi: Remove useless copy of drm_display_mode
>       drm/rockchip: inno_hdmi: Switch encoder hooks to atomic
>       drm/rockchip: inno_hdmi: Get rid of mode_set
>       drm/rockchip: inno_hdmi: no need to store vic
>       drm/rockchip: inno_hdmi: Remove unneeded has audio flag
>       drm/rockchip: inno_hdmi: Remove useless input format
>       drm/rockchip: inno_hdmi: Remove useless output format
>       drm/rockchip: inno_hdmi: Remove useless colorimetry
>       drm/rockchip: inno_hdmi: Remove useless enum
>       drm/rockchip: inno_hdmi: Remove tmds rate from structure
>       drm/rockchip: inno_hdmi: Remove useless coeff_csc matrix
>       drm/rockchip: inno_hdmi: Remove useless mode_valid
>       drm/rockchip: inno_hdmi: Move infoframe disable to separate function
>       drm/rockchip: inno_hdmi: Create mask retrieval functions
>       drm/rockchip: inno_hdmi: Switch to infoframe type
>       drm/rockchip: inno_hdmi: Remove unused drm device pointer
>       drm/rockchip: inno_hdmi: Switch to HDMI connector
>       drm/sun4i: hdmi: Convert encoder to atomic
>       drm/sun4i: hdmi: Move mode_set into enable
>       drm/sun4i: hdmi: Switch to container_of_const
>       drm/sun4i: hdmi: Consolidate atomic_check and mode_valid
>       drm/sun4i: hdmi: Switch to HDMI connector
> 
>  Documentation/gpu/kms-properties.csv               |    1 -
>  drivers/gpu/drm/Kconfig                            |    1 +
>  drivers/gpu/drm/drm_atomic.c                       |   11 +
>  drivers/gpu/drm/drm_atomic_state_helper.c          |  659 ++++++++
>  drivers/gpu/drm/drm_atomic_uapi.c                  |    4 +
>  drivers/gpu/drm/drm_connector.c                    |  249 +++
>  drivers/gpu/drm/drm_debugfs.c                      |  110 ++
>  drivers/gpu/drm/rockchip/inno_hdmi.c               |  409 ++---
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  203 ++-
>  drivers/gpu/drm/tests/Makefile                     |    1 +
>  .../gpu/drm/tests/drm_atomic_state_helper_test.c   | 1728 ++++++++++++++++++++
>  drivers/gpu/drm/tests/drm_connector_test.c         | 1345 ++++++++++++++-
>  drivers/gpu/drm/tests/drm_kunit_edid.h             |  482 ++++++
>  drivers/gpu/drm/tests/drm_kunit_helpers.c          |  150 ++
>  drivers/gpu/drm/vc4/tests/vc4_mock.c               |    6 +-
>  drivers/gpu/drm/vc4/tests/vc4_mock.h               |    9 +-
>  drivers/gpu/drm/vc4/tests/vc4_mock_plane.c         |   44 +-
>  drivers/gpu/drm/vc4/vc4_hdmi.c                     |  624 +------
>  drivers/gpu/drm/vc4/vc4_hdmi.h                     |   44 +-
>  drivers/gpu/drm/vc4/vc4_hdmi_phy.c                 |    6 +-
>  include/drm/drm_atomic_state_helper.h              |   12 +
>  include/drm/drm_connector.h                        |  257 +++
>  include/drm/drm_kunit_helpers.h                    |   23 +
>  23 files changed, 5389 insertions(+), 989 deletions(-)
> ---
> base-commit: 815d8b0425ad1164e45953ac3d56a9f6f63792cc
> change-id: 20230814-kms-hdmi-connector-state-616787e67927
> 
> Best regards,

