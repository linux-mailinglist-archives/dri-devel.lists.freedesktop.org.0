Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4D7C0647E
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 14:39:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C67710EA21;
	Fri, 24 Oct 2025 12:39:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oe2YO0L0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12BF710EA21
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 12:39:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C9C0C4537C
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 12:39:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF2E4C116C6
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 12:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761309569;
 bh=aK66e1HazOzWMzd8lgqFFjotERBnHjJTC97qMkubdQc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oe2YO0L0hFECA716hJuMAMCXTbtb9S3MNFEDGT//JvrOLGbJpaw4rvTaXTnRPJPNy
 rDW6mYIAa3zqmK+AY+ZkbRDWV3ACYh0evQbuyTHlEYh4B9gs5UsFVAurUfQX1rCSn5
 B57l9yoYhlJRW/fF4PzgfSyq9r4+YJhB9GdN1uV7agwLArxR3NqIP+LmIVe8ZcKVLf
 WtwrdOVnO/ctCGV1E5nXm7RekLqAi4IScWkUUWNHFuMleM4KBF9i9adIsxEilGFHMh
 hTd+Ich/6l6F9yvdSsvNuertCdYqavx2AKUabJUqyid+nQ8c+xA/h6rUQ7NR1vLWSJ
 yA67BI1w0TiwQ==
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-7a28c7e3577so205055b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 05:39:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWUrnbZHEXeB7IdydDR3tJyU5ZFZhA39BarxFd0fldEILVnfXo181aPVdIFnF0Swr9AL2YEWL9irFU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUwvV7xdd0UI9mP+KesHfx6L5Ov5CsfxD6Nrf/LvjUtY/GFDBl
 A94e/lT9RhUsaWplGQ0TA39Os5DDeJ6t+O7a0R9uxj+7BaEBaMLSXe+0ek3V1ZBArlbZhL9D7Yw
 e1xyK9BxkB4GpbhfHx1jYZiwBpFhe7A==
X-Google-Smtp-Source: AGHT+IEEZDTHYjPPrWU7mEBc+Dc3dKtlrXyd2PgGiTk+MM3/AaJL+7FaNl7MZbg+WzwPdyRBhQ49pl+COQN1GQ0+IoU=
X-Received: by 2002:a17:903:b90:b0:276:d3e:6844 with SMTP id
 d9443c01a7336-290ca1218cbmr307603995ad.33.1761309569048; Fri, 24 Oct 2025
 05:39:29 -0700 (PDT)
MIME-Version: 1.0
References: <20251023-mediatek-drm-hdmi-v2-v11-0-7873ec4a1edf@collabora.com>
In-Reply-To: <20251023-mediatek-drm-hdmi-v2-v11-0-7873ec4a1edf@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 24 Oct 2025 12:39:16 +0000
X-Gmail-Original-Message-ID: <CAAOTY_9f4bgy2z-PJL8kjKt5Es2NAsy8QvA36Rd6SC3x8W6b5g@mail.gmail.com>
X-Gm-Features: AS18NWDks8wZh1-s9gE8rEBkHwxlTBkTzcn0tpVgOhEA_cFmNTtHC15b7iSv-yY
Message-ID: <CAAOTY_9f4bgy2z-PJL8kjKt5Es2NAsy8QvA36Rd6SC3x8W6b5g@mail.gmail.com>
Subject: Re: [PATCH v11 00/11] Add support for MT8195/88 HDMIv2 and DDCv2
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 CK Hu <ck.hu@mediatek.com>, 
 kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Sjoerd Simons <sjoerd@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi, Louis:

Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com> =E6=96=BC 2025=E5=B9=
=B410=E6=9C=8823=E6=97=A5
=E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8810:32=E5=AF=AB=E9=81=93=EF=BC=9A
>
> This is a respin of AngeloGioacchino Del Regno's patch series, that adds
> the support of HDMIv2 and DDCv2 for MT8188 and MT8195 in mediatek-drm.

Apply the whole series to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Changes in v11:
>  - Rebased over next-20251023
>  - Resolved merge issues with next-20251023 for patch 4
>  - Added new "drm/mediatek: mtk_hdmi_common: Defer probe when ddc i2c bus
>    isn't available yet" to fix a probe issue when mtk_hdmi_v2 driver is
>    is enabled and built as module.
>  - Added new reviewed-by trailers
>  - Link to v10: https://lore.kernel.org/r/20250808-mediatek-drm-hdmi-v2-v=
10-0-21ea82eec1f6@collabora.com
>
> Changes in v10:
>  - Rebased over next-20250807
>  - Dropped patches from v9 that have been already merged in a previous
>    merge window (1 to 14)
>  - Resolved merge issues with next-20250807 for patches 3, 4 and 9
>  - Added new "drm/mediatek: mtk_hdmi: Drop redundant clock retrieval in
>    mtk_hdmi_get_cec_dev" patch to fix an issue introduced by a previously
>    merged patch from this series
>  - Deleted mtk_hdmi.c.orig file added by "drm/mediatek: mtk_hdmi: Split d=
river
>    and add common probe function" patch
>  - Fixed in "drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188" patch
>    a bug about EDID reading not properly working in mtk_hdmi_ddc_v2 drive=
r,
>    due to extra byte sent on i2c bus by mtk_ddc_wr_one function when the
>    payload length is equal to 0
>  - Fixed format issues detected by checkpatch in "drm/mediatek: Introduce
>    HDMI/DDC v2 for MT8195/MT8188" patch
>  - Tested on Mediatek Genio 350, 510 and 1200-EVK boards
>  - Link to v9: https://lore.kernel.org/dri-devel/20250415104321.51149-1-a=
ngelogioacchino.delregno@collabora.com/
>
> Changes in v9:
>  - Reordered patch from krzk as first as requested by CK
>
> Changes in v8:
>  - Dropped DPI patches as those have been applied in the previous merge w=
indow
>  - Changed description in mediatek,mt8195-hdmi.yaml as requested by CK
>  - Refactored function mtk_hdmi_v2_hw_gcp_avmute() to include contents
>    of, and delete, mtk_hdmi_v2_hw_reset_av_mute_regs() as requested by CK
>  - Expanded comment before enablement of HDCP reauthentication interrupt
>    to explain that the HW uses this internally as requested by CK
>  - Added comment in mtk_hdmi_v2_hpd_pord_status() explaining why there
>    are three states for cable detection as requested by CK
>  - Moved extra interrupts clearing from ISR to probe function and added
>    comments explaining the reason why those are being cleaned at probe
>    time, as requested by CK.
>  - Added support (and tested on MT8395/8195 and MT8390/8188) for output
>    in both YUV422 and YUV444 colorspaces other than RGB; please note that
>    RGB is still the default, and that the request for using any of the
>    YUV output formats depends on previous component(s) of the display
>    pipeline declaring support for those; should none of them declare any
>    support for YUV formats, only RGB will be available (no errors, the
>    additional ones will be simply ignored).
>
> Changes in v7:
>  - Split more patches as requested by CK
>  - Changed the order of the interlaced variable addition as requested
>  - Cleanups in DDCv2 as requested by CK
>  - Removed comment from
>    drm/mediatek: mtk_hdmi: Move output init to mtk_hdmi_register_audio_dr=
iver()
>    as that was forgotten from reintroduction of print in v5
>  - Some more small nitpicks as pointed out by CK here and there
>
> Changes in v6:
>  - Split the TVD clock enable/disable calls in a different commit
>  - Changed `is_internal_hdmi` to two different variables, one for
>    DPI input clock from HDMI, and one for AFIFO 1T1P output and
>    conversion (mtk_dpi)
>    - Clarified why MT8195/88 HDMI-reserved DPI1 is different
>  - Moved `input_2p_en` bit to platform data to cleanup DPI vs DPINTF
>    - 1T2P enable bit is different between DPI and DPINTF, but usage
>      is actually the same
>  - Cleaned up headers inclusion in mtk_hdmi_v2.c, mtk_hdmi_ddc_v2.c
>    - Removed some unused headers, added missing bitfield.h header
>  - Split some prints cleanup commits as requested by CK
>  - Split the introduction of mtk_hdmi_conf as requested by CK
>  - Split commit to make CEC optional as requested by CK
>  - Reintroduced forgotten no_capture_mute in codec_pdata (mtk_hdmi_common=
)
>  - Reintroduced error print for audio clocks enablement failure (mtk_hdmi=
)
>  - Added cleanup syscon_regmap_lookup_by_phandle commit from Krzysztof K
>
> Changes in v5:
>  - Rebased over next-20250113
>  - Resolved merge issues with next-20250113
>  - Added bitfield.h inclusion in mtk_dpi in commit [02/33] to resolve
>    build issue from 0day CI
>  - Removed .atomic_check callback from mtk_hdmi_v2 as it is now part
>    of drm_bridge_connector as pointed out by Dmitry B
>  - Removed call to pm_runtime_disable() as the driver uses devm
>  - Tested again :-)
>
> Changes in v4:
>  - DDCv2 binding erroneously dropped in v3 is included again (oops!)
>  - Added reference to dai-common.yaml in HDMIv2 binding
>  - Dropped pinctrl entries from HDMIv2 binding
>  - Fixed required list in HDMIv2 binding and changed node name to
>    'hdmi' instead of 'hdmi-tx'
>  - Fixed issue in mtk_hdmi derived from wrong commit splitting action
>    from version 3
>  - Exported necessary symbols and added namespaces for those
>  - Fixed module build for both HDMIv1 and HDMIv2
>  - Other cleanups
>
> Changes in v3:
>  - Added hpd_enable() and hpd_disable() callbacks as suggested by Dmitry =
B
>  - Removed audio mute call in bridge_enable() as suggested by CK
>  - Reworked commonization commits for mtk_hdmi/mtk_hdmi_common and split
>    out debugfs/abist implementation as suggested by CK
>  - Removed .mode_valid() callback as it is now provided by the bridge
>    API in drm_bridge_connector_helper_funcs
>  - A bit of cleanups here and there
>  - Tested again on HW especially for new hpd_enable/disable callbacks.
>
> Changes in v2:
>  - Merged series "Add support for MT8195/8188 and Pattern Generator"
>    and "drm/mediatek: Add support for HDMIv2 and DDCv2 IPs" in one
>    as they are directly related, as requested by CK Hu
>  - More commonization: moved some audio functions to mtk_hdmi_common
>  - Fixed a bug in DDCv2 driver to allow sending a message with len=3D1
>  - Renamed some functions in HDMIv2 to consistently use the prefix
>    mtk_hdmi_v2_ across the driver
>  - Added .mode_valid() callback to HDMIv2
>  - Added .atomic_check() callback to HDMIv2
>  - Reordered drm_bridge_funcs in HDMIv2 driver
>  - Rewritten .edid_read() callback in HDMIv2 to move checking audio
>    availability to bridge_pre_enable() stage, and to stop using the
>    drm_edid_read_ddc() in favor of drm_edid_read()
>  - Added support for API provided HDMI Helpers
>  - Added .tmds_char_rate_valid() callback to HDMIv2 for HDMI helpers
>  - Added .hdmi_{read,write}_infoframe() callback to HDMIv2 for helpers
>  - Added support for Vendor infoframes in HDMIv2
>  - Added missing audio-dai-cells to HDMIv2 binding to fix check error
>  - Added more information to the HDMIv2 binding for clocks and PHY
>  - Added some comments to the HDMIv2 code to clarify why the controller
>    is preconfigured in bridge_pre_enable() instead of bridge_enable()
>  - Added a mention of the differences in HPD between v1 and v2 to the
>    commit introducing the v2 driver (v2 is not using CEC for HPD)
>  - ...and tested again on HW! :-)
>
> This series adds support for the HDMI-TX v2 Encoder and DDCv2, and for
> the direct connection DPI as found in MT8195, MT8188 and their variants.
>
> Tested on Genio 700 EVK:
>  - ABIST ON: ok, pattern generated internally from HDMI is shown on
>    HDMI screen at the correct resolution;
>  - ABIST OFF + DPI Pattern Generator ON: ok, pattern coming from DPI is
>    shown on HDMI screen at the correct resolution;
>  - Can negotiate up to 4k60
>
> and on MT8395 Radxa NIO 12L:
>  - ABIST ON: ok, pattern generated internally from HDMI is shown on
>    HDMI screen at the correct resolution;
>  - ABIST OFF + DPI Pattern Generator ON: ok, pattern coming from DPI is
>    shown on HDMI screen at the correct resolution;
>  - Dual screen usecase validated (DSI + HDMI 3840x2160p 60Hz)
>  - Can negotiate up to 4k60
>
> Please note that this submission does *not* include support for HDCP
> nor for CECv2, as I want this to be upstream before implementing
> additional features which are not strictly required for simple
> HDMI output.
>
> Bonus in this series is the addition of support for the Pattern Generator
> found in the DPI HW: since I needed this for debugging during development=
,
> I had to code in the actual support bits and it looked like a waste of
> time to just remove it.
> I instead decided to clean it up and upstream it, as this will anyway com=
e
> handy for multiple things, of which the most important (imo) are:
>  - Adding support for new SoCs in the future will be less time consuming
>    as this driver already has the pattern generator in;
>  - CI Testing might be able to make use of this to validate that the
>    data that comes out is not garbled (so, to help testing display
>    support in an automated manner).
>
> --
> 2.49.0
>
> ---
> AngeloGioacchino Del Regno (9):
>       drm/mediatek: mtk_hdmi: Improve mtk_hdmi_get_all_clk() flexibility
>       drm/mediatek: mtk_hdmi: Add HDMI IP version configuration to pdata
>       drm/mediatek: mtk_hdmi: Split driver and add common probe function
>       drm/mediatek: mtk_hdmi_common: Make CEC support optional
>       drm/mediatek: mtk_hdmi_common: Assign DDC adapter pointer to bridge
>       drm/mediatek: mtk_hdmi_common: Add OP_HDMI if helper funcs assigned
>       drm/mediatek: mtk_hdmi_common: Add var to enable interlaced modes
>       drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188
>       drm/mediatek: mtk_hdmi_v2: Add debugfs ops and implement ABIST
>
> Louis-Alexis Eyraud (1):
>       drm/mediatek: mtk_hdmi: Drop redundant clock retrieval in mtk_hdmi_=
get_cec_dev
>
> Sjoerd Simons (1):
>       drm/mediatek: mtk_hdmi_common: Defer probe when ddc i2c bus isn't a=
vailable yet
>
>  drivers/gpu/drm/mediatek/Kconfig            |   18 +-
>  drivers/gpu/drm/mediatek/Makefile           |    3 +
>  drivers/gpu/drm/mediatek/mtk_hdmi.c         |  539 +---------
>  drivers/gpu/drm/mediatek/mtk_hdmi_common.c  |  440 ++++++++
>  drivers/gpu/drm/mediatek/mtk_hdmi_common.h  |  198 ++++
>  drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c  |  395 +++++++
>  drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h |  263 +++++
>  drivers/gpu/drm/mediatek/mtk_hdmi_v2.c      | 1521 +++++++++++++++++++++=
++++++
>  8 files changed, 2858 insertions(+), 519 deletions(-)
> ---
> base-commit: a92c761bcac3d5042559107fa7679470727a4bcb
> change-id: 20250806-mediatek-drm-hdmi-v2-cf88f51b8458
>
> Best regards,
> --
> Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
>
