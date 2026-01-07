Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7258CFFCE5
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 20:42:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E9810E5DA;
	Wed,  7 Jan 2026 19:42:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="fOmNBsdQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com
 [91.218.175.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E1310E5DA
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 19:42:47 +0000 (UTC)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
 s=key1; t=1767814965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xRTbJOKwkZYdpEZZY1w1lPpqDpzoRzUFJtgND5Kkiuo=;
 b=fOmNBsdQH3r8E465w1m0/hb7SvFn25larE0IcdL+p1lfYSACDzHb5rx1GxekuQfFPZg0n0
 PacZa6h2gPIF1ZxVPSGMo8o3KJ81ZOAK7ScRXXRrHDVDxAHWgZZ7lhna3gLX7vG6u8LQHe
 n9x5hBQZKAYarCTcs5jQRetHJujtp+aT9f2s/kgAzJSQk3SXMH8zHAHYodXdgdHnwyNnPI
 ZXMyckftmevLGOp1LZw7xy5097Jl+7EQreUBjVLzWtZMsgLARl+VRDT1EE/5r0Ukd6+Njj
 FmOmX3riFNYkP6h1MYdGzFQEIDDUtOkIdavKfqFuoqTgm5TKFVwFKTzh61GQjQ==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Jan 2026 20:42:37 +0100
Message-Id: <DFIM3O2VB0ZR.2D0W676YS74KG@cknow-tech.com>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Sandy
 Huang" <hjc@rock-chips.com>, =?utf-8?q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, "Andy Yan" <andy.yan@rock-chips.com>, "Louis Chauvet"
 <louis.chauvet@bootlin.com>, "Haneen Mohammed" <hamohammed.sa@gmail.com>,
 "Melissa Wen" <melissa.srw@gmail.com>
Cc: "Robert Mader" <robert.mader@collabora.com>, <kernel@collabora.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, "Matt Roper"
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v4 0/4] Introduce BACKGROUND_COLOR DRM CRTC property
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
References: <20251219-rk3588-bgcolor-v4-0-2ff1127ea757@collabora.com>
In-Reply-To: <20251219-rk3588-bgcolor-v4-0-2ff1127ea757@collabora.com>
X-Migadu-Flow: FLOW_OUT
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

On Fri Dec 19, 2025 at 10:46 PM CET, Cristian Ciocaltea wrote:
> Some display controllers can be hardware-configured to present non-black
> colors for pixels which are not covered by any plane (or are exposed
> through transparent regions of higher planes).
> ...
> The subsequent patches add background color support to VKMS and the VOP2
> display controller used in the RK3568, RK3576, and RK3588 Rockchip SoC
> families.

As previously reported against the v3, while I actually tested v4 ...

Cristian provided a helper script which would show a test pattern and
then iterate through setting Red, Green, Blue background color and then
set it back to the original value.

I first tested this on a Rock 5B (RK3588).
Without this patch set, the background color was Black with every
iteration. But with this patch set, I did see a Red, Green and Blue
background color, after which it was set back to Black.

diederik@rock5b:~$ grep -E "^Changing prop|^Read BACKGROUND_COLOR" bgcol-te=
st-bash-user.log
Read BACKGROUND_COLOR prop (ARGB64): 0xffff000000000000
Changing prop value to: 0xffff00000000ffff
Read BACKGROUND_COLOR prop (ARGB64): 0xffff00000000ffff
Changing prop value to 0xffffffff00000000
Read BACKGROUND_COLOR prop (ARGB64): 0xffffffff00000000
Changing prop value to 0xffff0000ffff0000
Read BACKGROUND_COLOR prop (ARGB64): 0xffff0000ffff0000
Changing prop value to 0xffff00000000ffff
Read BACKGROUND_COLOR prop (ARGB64): 0xffff00000000ffff
Changing prop value to: 0xffff000000000000
Read BACKGROUND_COLOR prop (ARGB64): 0xffff000000000000

I then did the same test on a Quartz64-B (RK3566) and that too showed a
Red, Green and Blue background color and then was set back to Black.

diederik@quartz64b:~$ grep -E "^Changing prop|^Read BACKGROUND_COLOR" bgcol=
-test-bash-user-q64b.log
Read BACKGROUND_COLOR prop (ARGB64): 0xffff000000000000
Changing prop value to: 0xffff00000000ffff
Read BACKGROUND_COLOR prop (ARGB64): 0xffff00000000ffff
Changing prop value to 0xffffffff00000000
Read BACKGROUND_COLOR prop (ARGB64): 0xffffffff00000000
Changing prop value to 0xffff0000ffff0000
Read BACKGROUND_COLOR prop (ARGB64): 0xffff0000ffff0000
Changing prop value to 0xffff00000000ffff
Read BACKGROUND_COLOR prop (ARGB64): 0xffff00000000ffff
Changing prop value to: 0xffff000000000000
Read BACKGROUND_COLOR prop (ARGB64): 0xffff000000000000

So this patch set does what it is supposed to do, so feel free to add:

Tested-by: Diederik de Haas <diederik@cknow-tech.com>

Cheers,
  Diederik

>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> Changes in v4:
> - Switched to simple bit-shifting approach when performing the bpc
>   conversion in the vop2 driver, to avoid the expensive division since
>   we shouldn't be concerned anymore about the precision (Chaoyi)
> - Rebased series onto latest drm-misc-next
> - Link to v3: https://lore.kernel.org/r/20251118-rk3588-bgcolor-v3-0-a2cc=
909428ea@collabora.com
>
> Changes in v3:
> - Added new patches:
>   * uapi: Provide DIV_ROUND_CLOSEST()
>   * drm/vkms: Support setting custom background color
> - Improved DRM_ARGB64_{PREP|GET}*() helpers by using a conversion ratio
>   for better color approximation when dealing with less than 16 bits of
>   precision
> - Mentioned the IGT test in the cover letter while documenting the
>   validation results; also dropped references to the now useless
>   modetest wrapper script and its generated report
> - Rebased series onto latest drm-misc-next
> - Link to v2: https://lore.kernel.org/r/20251013-rk3588-bgcolor-v2-0-25cc=
3810ba8c@collabora.com
>
> Changes in v2:
> - Improved uAPI consistency and readability by introducing
>   DRM_ARGB64_PREP*() and DRM_ARGB64_GET*() helper macros
> - Updated several code comment sections
> - Referenced the counterpart Weston support in the cover letter
> - Rebased series onto v6.18-rc1
> - Link to v1: https://lore.kernel.org/r/20250902-rk3588-bgcolor-v1-0-fd97=
df91d89f@collabora.com
>
> ---
> Cristian Ciocaltea (4):
>       uapi: Provide DIV_ROUND_CLOSEST()
>       drm: Add CRTC background color property
>       drm/vkms: Support setting custom background color
>       drm/rockchip: vop2: Support setting custom background color
>
>  drivers/gpu/drm/drm_atomic_state_helper.c    |  1 +
>  drivers/gpu/drm/drm_atomic_uapi.c            |  4 ++
>  drivers/gpu/drm/drm_blend.c                  | 39 ++++++++++++++--
>  drivers/gpu/drm/drm_mode_config.c            |  6 +++
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 13 +++++-
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  4 ++
>  drivers/gpu/drm/vkms/vkms_composer.c         | 10 ++++-
>  drivers/gpu/drm/vkms/vkms_crtc.c             |  3 ++
>  include/drm/drm_blend.h                      |  4 +-
>  include/drm/drm_crtc.h                       | 12 +++++
>  include/drm/drm_mode_config.h                |  5 +++
>  include/linux/math.h                         | 18 +-------
>  include/uapi/drm/drm_mode.h                  | 67 ++++++++++++++++++++++=
++++++
>  include/uapi/linux/const.h                   | 17 +++++++
>  14 files changed, 178 insertions(+), 25 deletions(-)
> ---
> base-commit: 8e7460eac786c72f48c4e04ce9be692b939428ce
> change-id: 20250829-rk3588-bgcolor-c1a7b9a507bc
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

