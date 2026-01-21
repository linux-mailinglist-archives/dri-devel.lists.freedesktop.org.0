Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICsBJ5vYcGkOaAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 14:46:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A602957BF7
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 14:46:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B267510E20D;
	Wed, 21 Jan 2026 13:46:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="ASlLWKSa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D47DC10E205;
 Wed, 21 Jan 2026 13:45:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1769003152; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=M/Ti7qJ/lzUocqBJ9oziwBZKK00vakxasXq7pYJePGxHZDUw+StSKaKsHEyr15Y8bSGHQlUQiGK8alm/P0/LcUF3jKbBDm5rKPClIbdboQyP/n84OVJuej5KtbzK3DGzZJiwnk0+7RpXbP1OBEIH4tHLSU4hDVOObPzx6b850ZI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1769003152;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=FCunRDq0/fm6bo4ZBAJq0Hh80vyN/MatVlH6n1QruFk=; 
 b=hj/vjIUpEuPP95i9WDbQgrAZDv7yvhQD8Ct4ZVmDGIXLdWc1yDGPV9oNtJ5RRx4sBS7uEXc9nFKLoUyCZfLw5HLNBGZsYYsVyT2lQKzKp1WN5ze7lPEbQ6D5yVBHlkS+nSakSDTx1lbDmnrFHy55nyY3caGh+d07YLdGvLme/Vc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769003152; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
 bh=FCunRDq0/fm6bo4ZBAJq0Hh80vyN/MatVlH6n1QruFk=;
 b=ASlLWKSaHhKHPGIHuBeWfis7mYBQdr8eOadWncybJPlVzRFquQZ/C8pvSuYB5XCd
 M00j81xbatuaGQX4uXk1XMcx2rdzc4DmFtRRWDB8kuA90MeRyaPLqwRkKA4OXxbsL5v
 ncl83gAhdM7rHSy7LPMnABgjkOYfgOjmn1A1YWyQ=
Received: by mx.zohomail.com with SMTPS id 1769003150849158.2112654467452;
 Wed, 21 Jan 2026 05:45:50 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH v6 00/21] Add new general DRM property "color format"
Date: Wed, 21 Jan 2026 14:45:26 +0100
Message-Id: <20260121-color-format-v6-0-7b81a771cd0b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12QzW7DIBCEX8XiXFwW//vU96iqCAzEqHZI1gS1i
 vzuXbtRleaEZkf7MbM3tlj0dmF9dmNok198OJGoXzI2jOp0tNwb0kwKWYGQLR/CFJC7gLOKvOy
 cIUc30BaMVs5onf/ace8fpB2GmccRrfqDiA4ACtEUXV52Rc2Bzwr9dcnTpMwb0SelA6p8CPOdi
 PZypVzxF8u0WiylmGcf+8wg8f359f6yx9h9toeWBfDN1ugNzdU0hYEfbTxf4zY/BHdw/mQOd//
 TkE0luNNCDG05VLJSfQK29Rn9EgN+79dK5R5n/wOg+X+YVHLBhbGmkdoAkZ6abbBUPQCeL5sqA
 tSFbaUDo8HCM2Bd1x+LaU9LvQEAAA==
X-Change-ID: 20251028-color-format-49fd202b7183
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Werner Sembach <wse@tuxedocomputers.com>, 
 Andri Yngvason <andri@yngvason.is>, Marius Vlad <marius.vlad@collabora.com>
X-Mailer: b4 0.14.3
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,linaro.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,collabora.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nv12:email,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: A602957BF7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

this is a follow-up to
https://lore.kernel.org/all/20250911130739.4936-1-marius.vlad@collabora.com/
which in of itself is a follow-up to
https://lore.kernel.org/dri-devel/20240115160554.720247-1-andri@yngvason.is/ where
a new DRM connector property has been added allowing users to
force a particular color format.

That in turn was actually also a follow-up from Werner Sembach's posted at
https://lore.kernel.org/dri-devel/20210630151018.330354-1-wse@tuxedocomputers.com/

As the number of cooks have reached critical mass, I'm hoping I'll be
the last person to touch this particular series.

We have an implementation in Weston at
https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1825 that
adds support for this property. This patch series has been tested
against that MR on i915 (HDMI, DP), amdgpu (HDMI, DP) and on rockchip
(HDMI).

You can also manually test this with modetest like so, but beware that
this is a non-atomic invocation, so testing YUV420 like this will result
in weird outcomes if only some of the modes support YUV420:

  $ modetest -s 115:1920x1080-60@NV12 -w 115:'color format':4

where 115 is the connector ID and '4' is the enum value for a particular
color format.

General notes on the approach taken by me: instead of silently switching
to a different format than was explicitly requested, or even worse,
outputting something to the sink the sink doesn't support, bubble up an
error to userspace instead. "color format" is a "I want this" type
property, not a "force this" type property, i.e. the kernel will respect
the limits imposed by the hardware.

I'm not sure if my drm_bridge change actually achieves what I want in a
more complex bridge setup. I'd need to either come up with a virtual
bridge to test these scenarios, or spend some time making a flat flex
cable adapter for the DSI-HDMI bridge board I have here. Before I invest
too much time into either of those, I'd like to get some feedback on
this approach however.

Things I've tested:
- HDMI (YCbCr 4:4:4 + YCbCr 4:2:2 (8-bit) + RGB + Auto) on RK3588
- HDMI (YCbCr 4:4:4 + YCbCr 4:2:2 (8-bit) + RGB + Auto) on RK3576
- HDMI + DP (YCbCr 4:4:4, YCbCr 4:2:0, RGB, Auto) on Intel N97 (i915)
  DP-MST is untested, but I expect it to work the same.
- HDMI (YCbCr 4:4:4, YCbCr 4:2:2, YCbCr 4:2:0, RGB, Auto) + DP (YCbCr
  4:4:4, RGB, Auto) on an AMD Radeon RX 550 (amdgpu). DP-MST is
  untested.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Changes in v6:
- Checkpatch fixes
- Add drm_bridge.c kerneldoc fix patch to b4 deps so the kernel docs
  required for every contribution to the subsystem can be built
- dw-hdmi-qp core has gained the atomic_get_output_bus_fmts bridge func,
  which allows it to participate in the drm_bridge chain recursive format
  selection code properly.
- The Rockchip dw-hdmi-qp integration now no longer reimplements the
  color format logic (improperly), but reads the bus format of the first
  bridge as set by the recursive bridge format selection. If the input
  format is FIXED, it'll use the output format. Otherwise, the input
  format is used.
- In the synopsys drivers, YUV422 uses the same bus format as the non-qp
  hdmi encoder driver. Probably correcter this way. The Rockchip vop2
  is_yuv function has been extended to recognise this format as well.
- KUnit tests for drm_bridge chains are now included, which exercise the
  chain's recursive bus format selection.
- On HDMI connectors, the drm_bridge bus format selection will try to target
  the color format that the HDMI layer came up with. This means the AUTO
  logic is not duplicated for HDMI connectors.
- The enum conversion function commit gained a function for converting
  from hdmi_colorspace to drm_color_format, and its author changed as no
  original code remains anyway. Marius is still included as a
  Co-developer.
- Some tests for the HDMI state helper's mode_valid have been written.
  They are incomplete as we lack a test EDID for a 420-also mode that
  would violate the clock constraints on RGB. I hacked one together with
  a hex editor, but it reports a too high of a clock rate, and there's
  no EDID editor I could find which supports these extension blocks.
- The color_format KUnit tests have been more heavily parameterised, the
  auto case absorbed into other tests, and the comments around them
  rewritten.
- Add a few paragraphs of documentation that explain the bridge format
  selection, and how to make use of it in a display driver.
- Link to v5: https://lore.kernel.org/r/20251128-color-format-v5-0-63e82f1db1e1@collabora.com

Changes in v5:
- Rebase onto drm-tip
- Drop DRM_MODE_COLOR_FORMAT_* as an enum
- Unify DRM_COLOR_FORMAT_NONE and DRM_COLOR_FORMAT_AUTO, with AUTO being
  0. This makes conversion and general logic much easier.
- Adjust the drm_color_format enum to not needlessly renumber the
  existing defines, as it doesn't need to correspond to how HDMI numbers
  them.
- Make the DRM-to-HDMI conversion function static inline __pure, because
  the assembly it generates is tiny, and the function is pure.
- Don't accept nothing as the list of supported color formats for
  registration of the property.
- Drop the per-connector variants of the color format registration
  function, as it's not needed.
- drm_hdmi_state_helper: Fix mode_valid rejecting 420-only modes.
- drm_hdmi_state_helper: Only fall back to YUV420 with
  DRM_COLOR_FORMAT_AUTO.
- drm_hdmi_state_helper: Remove redundant AUTO->RGB condition, as the
  conversion already does this.
- Add KUnit tests for hdmi_compute_config.
- drm/bridge: Refactor bus_format_is_color_fmt and add a few more YUV422
  formats.
- Register the color format property in drmm_connector_hdmi_init based
  on the supported HDMI formats passed to it. This means rockchip
  dw_hdmi_qp no longer needs to register it.
- amdgpu: Simplify YUV420 logic
- amdgpu: Don't try to pick YUV444 on YUV420-only modes
- i915: Try to make behaviour more or less the same as that of the drm
  hdmi state helper.
- rockchip dw_hdmi_qp: Set supported HDMI formats
- rockchip dw_hdmi_qp: Set the right VO GRF values depending on color
  format.
- rockchip dw_hdmi_qp: Act on the color format property in this driver,
  rather than in VOP2, by setting the bus_format appropriately.
- rockchip VOP2: Can the BCSH-based implementation. BCSH isn't available
  on all video ports of the hardware, and the code was extremely
  suspect. Instead, plug into the existing YUV-to-RGB/RGB-to-YUV code,
  which can be done now that the HDMI driver sets the bus format.
- A whole bunch of Rockchip VOP2 fixes.
- Link to v4: https://lore.kernel.org/r/20251117-color-format-v4-0-0ded72bd1b00@collabora.com

Changes in v4:
- Rebase onto next-20251117
- Get rid of HDMI_COLORSPACE_AUTO
- Split hdmi_compute_config change into separate patch
- Add missing symbol export for color_format_to_hdmi_colorspace to fix
  builds in certain configurations
- Drop "drm: Pass supported color formats straight onto drm_bridge"
- Make dw-hdmi-qp set the platform data's supported color formats as
  the bridge's supported HDMI color formats
- drm_hdmi_state_helper: pass requested color format to
  hdmi_compute_format_bpc if set.
- drm_bridge: limit the bus formats to those explicitly requested with
  the color format property during the atomic bridge check call,
  specifically in drm_atomic_bridge_chain_select_bus_fmts.
- i915: Remove INTEL_OUTPUT_FORMAT_AUTO, as automatic format selection
  does not need to involve the hardware state
- i915: Deduplicate ntel_output_format_to_drm_color_format code by
  moving it as a static inline __pure function into a shared header
- i915: rework logic in HDMI, DP and DP-MST output config functions to
  remove redundant locals, simplify execution flow, and return an error
  to userspace if an explicit color_format request can't be satisfied.
- i915: assign myself as the author and make the others Co-developers,
  so that they don't get the blame for any of my bugs.
- amdgpu: refactor fill_stream_properties_from_drm_display_mode to
  improve readability and ensure that impossible color format requests
  get bubbled up to userspace as errors
- amdgpu: don't pick YUV444 over RGB.
- amdgpu: assign authorship to myself, with others as Co-developers, as
  logic was modified and the blame should fall on me
- dw_hdmi_qp-rockchip: set the supported color formats platform data
  member
- rockchip: remove drm property registration for rk3066_hdmi and
  inno_hdmi. None of the platforms that use these use vop2 as the
  video output processor.
- Link to v3: https://lore.kernel.org/all/20250911130739.4936-1-marius.vlad@collabora.com/

Changes in v3 by mvlad compared to Andri's v2 series:
- renamed the property to just 'color format'
- the property is added dynamically similar to the Colorspace property
- a key point from previous comments was that drivers should advertise
  the color formats they support and userspace would query EDID and
  perform an intersection from those color formats which users can
  further use. With this patch set each driver that adds this property
  has such list of hard-coded color formats, but fundamentally the idea
  is that driver can query the HW and do that on its own. The
  infrastructure is now in place to allow to do that
- by default the 'AUTO' color format is set. With this patch series that
  has been introduced as a fallback to RGB. Drivers could further
  customize this behavour and could perform additional checks on the sink
  to pick another suitable color format they'd like for AUTO
- drm_bridge bridge code has been improved to allow initialization with
  the same color formats list as the DRM connector property. Similarly, bpc
  pick-up now takes the color format into consideration when deciding
  which bpc to choose from
- The new DRM color format re-uses HDMI_COLORPSACE enum and provides an
  enum translations between the two to avoid touching all other drivers that
  use HDMI_COLORPSACE enum. I believe at this point that this allows the
  least amount of disruption and avoids a massive bike shedding around
  that part
- a rockchip implementation has been by my colleague Derek Foreman
- YUV444 color format has been added in i915
- address comment about "Remove unnecessary SIGNAL_TYPE_HDMI_TYPE_A
  check" where aconnector might be invalid
- Link to v2: https://lore.kernel.org/dri-devel/20240115160554.720247-1-andri@yngvason.is/

---
Andri Yngvason (1):
      drm: Add new general DRM property "color format"

Nicolas Frattaroli (19):
      drm: Add enum conversions between DRM_COLOR_FORMAT and HDMI_COLORSPACE
      drm/bridge: Act on the DRM color format property
      drm/display: hdmi-state-helper: Act on color format DRM property
      drm/display: hdmi-state-helper: Try subsampling in mode_valid
      drm/i915: Implement the "color format" DRM property
      drm/amdgpu: Implement "color format" DRM property
      drm/rockchip: Add YUV422 output mode constants for VOP2
      drm/rockchip: vop2: Fix YUV444 output
      drm/rockchip: vop2: Add RK3576 to the RG swap special case
      drm/rockchip: vop2: Recognise 10/12-bit YUV422 as YUV formats
      drm/rockchip: vop2: Set correct output format for RK3576 YUV422
      drm/bridge: dw-hdmi-qp: Implement atomic_get_output_bus_fmts
      drm/rockchip: dw_hdmi_qp: Implement "color format" DRM property
      drm/rockchip: dw_hdmi_qp: Set supported_formats platdata
      drm/connector: Register color format property on HDMI connectors
      drm/tests: hdmi: Add tests for the color_format property
      drm/tests: hdmi: Add tests for HDMI helper's mode_valid
      drm/tests: bridge: Add KUnit tests for bridge chain format selection
      drm/bridge: Document bridge chain format selection

Werner Sembach (1):
      drm/amd/display: Remove unnecessary SIGNAL_TYPE_HDMI_TYPE_A check

 Documentation/gpu/drm-kms-helpers.rst              |   6 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  88 ++-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  13 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |  64 ++
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  27 +-
 drivers/gpu/drm/drm_atomic_helper.c                |   5 +
 drivers/gpu/drm/drm_atomic_uapi.c                  |  11 +
 drivers/gpu/drm/drm_bridge.c                       | 118 ++-
 drivers/gpu/drm/drm_connector.c                    | 155 ++++
 drivers/gpu/drm/i915/display/intel_connector.c     |  11 +
 drivers/gpu/drm/i915/display/intel_connector.h     |   1 +
 drivers/gpu/drm/i915/display/intel_display_types.h |  15 +
 drivers/gpu/drm/i915/display/intel_dp.c            |  55 +-
 drivers/gpu/drm/i915/display/intel_dp.h            |   4 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |  36 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |  54 +-
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c     | 111 ++-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h        |   4 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |  41 +-
 drivers/gpu/drm/tests/drm_bridge_test.c            | 815 +++++++++++++++++++++
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 300 ++++++++
 include/drm/drm_connector.h                        |  89 ++-
 22 files changed, 1965 insertions(+), 58 deletions(-)
---
base-commit: dc0b90be8d513256a6594095731a702287f29602
change-id: 20251028-color-format-49fd202b7183
prerequisite-change-id: 20251231-drm-bridge-alloc-getput-drm_of_find_bridge-kdoc-fix-fb00c84c525a:v1
prerequisite-patch-id: bbdc03403e29a985540228dfa789dbfa47861e4e

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

