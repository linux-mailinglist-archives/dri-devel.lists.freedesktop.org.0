Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0B47A95B2
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 18:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B7BF10E11E;
	Thu, 21 Sep 2023 16:29:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A60F10E11E
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 16:29:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9916461F31;
 Thu, 21 Sep 2023 16:29:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FFB5C61188;
 Thu, 21 Sep 2023 16:29:31 +0000 (UTC)
Message-ID: <f6bf0ef2-7a2a-4456-825f-a34ba8c8886f@xs4all.nl>
Date: Thu, 21 Sep 2023 18:29:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 00/37] drm/connector: Create HDMI Connector
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
References: <20230920-kms-hdmi-connector-state-v2-0-17932daddd7d@kernel.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20230920-kms-hdmi-connector-state-v2-0-17932daddd7d@kernel.org>
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

On 20/09/2023 16:35, Maxime Ripard wrote:
> Hi,
> 
> Here's a series that creates a subclass of drm_connector specifically
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

I'd love to get started on that, but...

> 
> This series thus leverages the infoframe generation code to expose it
> through debugfs.
> 
> This entire series is only build-tested at the moment. Let me know what
> you think,

...trying this series on my RPi4 gives me this during boot:

[    2.361239] vc4-drm gpu: bound fe400000.hvs (ops 0xffff800080cac6f8)
[    2.367834] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000090
[    2.376748] Mem abort info:
[    2.379570]   ESR = 0x0000000096000044
[    2.383367]   EC = 0x25: DABT (current EL), IL = 32 bits
[    2.388748]   SET = 0, FnV = 0
[    2.391835]   EA = 0, S1PTW = 0
[    2.395011]   FSC = 0x04: level 0 translation fault
[    2.399951] Data abort info:
[    2.402864]   ISV = 0, ISS = 0x00000044, ISS2 = 0x00000000
[    2.408420]   CM = 0, WnR = 1, TnD = 0, TagAccess = 0
[    2.413536]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    2.418916] [0000000000000090] user address but active_mm is swapper
[    2.425353] Internal error: Oops: 0000000096000044 [#1] PREEMPT SMP
[    2.431700] Modules linked in:
[    2.434791] CPU: 2 PID: 55 Comm: kworker/u8:3 Not tainted 6.6.0-rc1-hdmi-dbg #245
[    2.442372] Hardware name: Raspberry Pi 4 Model B Rev 1.4 (DT)
[    2.448278] Workqueue: events_unbound deferred_probe_work_func
[    2.454193] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    2.461245] pc : drm_connector_attach_max_bpc_property+0x48/0x90
[    2.467332] lr : drm_connector_attach_max_bpc_property+0x3c/0x90
[    2.473415] sp : ffff800081d038b0
[    2.476766] x29: ffff800081d038b0 x28: 0000000000000000 x27: ffff0001041968c0
[    2.483999] x26: 0000000000000000 x25: ffff00010339d558 x24: ffff000103399000
[    2.491231] x23: ffff800080caa3e8 x22: ffff800080e96a20 x21: 000000000000000c
[    2.498463] x20: 000000000000000c x19: ffff00010339d558 x18: ffffffffffffffff
[    2.505694] x17: ffff0001008e7650 x16: ffff800080d55500 x15: ffffffffffffffff
[    2.512926] x14: ffff000105dda209 x13: 0000000000000006 x12: 0000000000000001
[    2.520158] x11: 0101010101010101 x10: ffff00027effe219 x9 : 0000000000000001
[    2.527389] x8 : ffff000105db8ad4 x7 : 00000000c0c0c0c0 x6 : 00000000c0c0c0c0
[    2.534620] x5 : 0000000000000000 x4 : ffff00010339d728 x3 : ffff00010339d728
[    2.541852] x2 : 000000000000000c x1 : 0000000000000000 x0 : 0000000000000000
[    2.549083] Call trace:
[    2.551554]  drm_connector_attach_max_bpc_property+0x48/0x90
[    2.557285]  drmm_connector_hdmi_init+0x114/0x14c
[    2.562048]  vc4_hdmi_bind+0x320/0xa40
[    2.565842]  component_bind_all+0x114/0x23c
[    2.570077]  vc4_drm_bind+0x148/0x2c0
[    2.573784]  try_to_bring_up_aggregate_device+0x168/0x1d4
[    2.579253]  __component_add+0xa4/0x16c
[    2.583136]  component_add+0x14/0x20
[    2.586754]  vc4_hdmi_dev_probe+0x1c/0x28
[    2.590815]  platform_probe+0x68/0xc4
[    2.594522]  really_probe+0x148/0x2b0
[    2.598228]  __driver_probe_device+0x78/0x12c
[    2.602638]  driver_probe_device+0xd8/0x15c
[    2.606873]  __device_attach_driver+0xb8/0x134
[    2.611372]  bus_for_each_drv+0x80/0xdc
[    2.615254]  __device_attach+0x9c/0x188
[    2.619136]  device_initial_probe+0x14/0x20
[    2.623371]  bus_probe_device+0xac/0xb0
[    2.627253]  deferred_probe_work_func+0x88/0xc0
[    2.631839]  process_one_work+0x138/0x244
[    2.635899]  worker_thread+0x320/0x438
[    2.639692]  kthread+0x10c/0x110
[    2.642957]  ret_from_fork+0x10/0x20
[    2.646576] Code: 94005f8d 12001e94 f9427e61 52800000 (39024034)
[    2.652745] ---[ end trace 0000000000000000 ]---

Regards,

	Hans


> Maxime
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
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
> Maxime Ripard (37):
>       drm/connector: Introduce an HDMI connector
>       drm/connector: hdmi: Create a custom state
>       drm/connector: hdmi: Add Broadcast RGB property
>       drm/connector: hdmi: Add helper to get the RGB range
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
>  Documentation/gpu/kms-properties.csv      |   1 -
>  drivers/gpu/drm/Kconfig                   |   1 +
>  drivers/gpu/drm/drm_atomic.c              |  10 +
>  drivers/gpu/drm/drm_atomic_state_helper.c | 634 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_atomic_uapi.c         |   4 +
>  drivers/gpu/drm/drm_connector.c           | 196 +++++++++
>  drivers/gpu/drm/drm_debugfs.c             | 110 ++++++
>  drivers/gpu/drm/rockchip/inno_hdmi.c      | 409 +++++++------------
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c    | 203 +++++-----
>  drivers/gpu/drm/vc4/vc4_hdmi.c            | 624 ++++-------------------------
>  drivers/gpu/drm/vc4/vc4_hdmi.h            |  44 +--
>  drivers/gpu/drm/vc4/vc4_hdmi_phy.c        |   6 +-
>  include/drm/drm_atomic_state_helper.h     |  15 +
>  include/drm/drm_connector.h               | 245 ++++++++++++
>  14 files changed, 1557 insertions(+), 945 deletions(-)
> ---
> base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
> change-id: 20230814-kms-hdmi-connector-state-616787e67927
> 
> Best regards,

