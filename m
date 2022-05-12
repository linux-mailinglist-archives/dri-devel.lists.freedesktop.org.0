Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB01252473D
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 09:44:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3493010F230;
	Thu, 12 May 2022 07:44:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF68F10F230
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 07:44:56 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id DB9CC2B059AE;
 Thu, 12 May 2022 03:44:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 12 May 2022 03:44:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1652341490; x=
 1652348690; bh=F/3C1V38ahUzifyHzEs+CWDQJfKIOWf16zUshCZyYK4=; b=f
 oyo14B5q77HWBztYyB6jy0JiEQ9Ii/BiEb6AG0JsU2fDxdZqUcK68yNGAC7EoaS0
 MLdiGoW2wTpmdb51vgwhwQiNWtPftgTIU60n5uuzPE360fUVgjTUAya9IPqnwNKb
 BnviiRI1bsbrEa+UsHZFVi+kJ9LICkw7R3oWYCMgAfhrwml2d5eev3yTn9skCxBg
 VH8/RSJY4M5b81xtpsc+F9ey0/umPWOxbsk7XMP+7d9G9PDaBbhhl/f5taTsz5RB
 6dmN6bGq0hhSJ7jW2s6IqG39WvMgsRgpCq0P2vXnglINSYJVGREHl0DALEPDRllK
 ioGt2OrO1hw7MXf06E+fg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1652341490; x=1652348690; bh=F/3C1V38ahUzi
 fyHzEs+CWDQJfKIOWf16zUshCZyYK4=; b=PwYCoCpllwsaeQDZ/UbNYqufIcU3D
 ZUWgY8F7k7Saqv2O6zyjaOoYF5xcDIWEnLSGiwdoo9z8lCBMr/tHJh5b0zfeFWE6
 /Z2RCJLc+r2pnrvNhImcW02ht7w/mv4bgobAnb9k0gXLDcWXAQYuz3K1z9POKN/y
 S/eqJzDh+501oGPp9exuG3dzomL2dp5vuGlGULmmWXC8cqRqYHf4z9q8S2BE/UHo
 6LyF8q2ZC7+aDXKLXASdRi94nP7is08wABRLovnl/szz04ritVADLELl1cAAm1+2
 90qcou1rCuxePxCOn11vTIOW78qBQGe0KsUAxnEyD9NN9GYZScntiuXrg==
X-ME-Sender: <xms:8bp8YqcK-fdwBudEcm5H1P_35GB8Y7LkLxZ4zJkH7TKJFPY--ts9wQ>
 <xme:8bp8YkOvhUAnmlQU_F1xaAbi92HOEjaEU2MhKVss9NVtJC1EMVj_Hk3wd-nXqt7XK
 R68JXUE9Mg8QkPMOf4>
X-ME-Received: <xmr:8bp8Yrgphjel3L9AUZeENPZqw0iDm42eTLMqQ_jugzMVv5Ex1vLAqdXFGcdo-J9RZVw2IZo3EkihHmK8LVQqL50inCCR6S8SR81EWos>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeeigdduvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepheejffefgefgieevjedvfffgvdfghedtgfdvueejvdejgfffvdeuteei
 vedufedvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordht
 vggthh
X-ME-Proxy: <xmx:8bp8Yn9_Hnhd8voI202NNd_FlS4bmUHGt3SBFFkI5a5B-1Sfmlps8Q>
 <xmx:8bp8Ymsn4HLY6Dqe7h0m9lGhr8Ulxluora9B7319zC42M3vRgIlJhg>
 <xmx:8bp8YuGGZe5sCyNbypDOt_k8OycLAKInPJrliLcAmGL5wufwJB_p0w>
 <xmx:8rp8Yu2wRlaVZOp8yBGYU65RItWFtHlRMmFrvZtBCrOu7SA0hzrdwpMFxjs>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 May 2022 03:44:48 -0400 (EDT)
Date: Thu, 12 May 2022 09:44:46 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Guillaume Ranquet <granquet@baylibre.com>
Subject: Re: [PATCH v9 18/22] drm/mediatek: Add mt8195 Embedded DisplayPort
 driver
Message-ID: <20220512074446.ihilbbnbuwesxbbg@houat>
References: <20220327223927.20848-1-granquet@baylibre.com>
 <20220327223927.20848-19-granquet@baylibre.com>
 <20220429083933.q3w75q3zuyyuvo4w@houat>
 <CABnWg9tzhZjrdKT4chkDrY-uH8BMUoxyNLUSwfuG6Sv1J+8ddg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CABnWg9tzhZjrdKT4chkDrY-uH8BMUoxyNLUSwfuG6Sv1J+8ddg@mail.gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
 kernel test robot <lkp@intel.com>, deller@gmx.de, kishon@ti.com,
 chunkuang.hu@kernel.org, jitao.shi@mediatek.com, tzimmermann@suse.de,
 Markus Schneider-Pargmann <msp@baylibre.com>, chunfeng.yun@mediatek.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, krzk+dt@kernel.org,
 markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, May 11, 2022 at 05:59:13AM -0700, Guillaume Ranquet wrote:
> >> +#include <drm/drm_atomic_helper.h>
> >> +#include <drm/drm_bridge.h>
> >> +#include <drm/drm_crtc.h>
> >> +#include <drm/dp/drm_dp_helper.h>
> >> +#include <drm/drm_edid.h>
> >> +#include <drm/drm_of.h>
> >> +#include <drm/drm_panel.h>
> >> +#include <drm/drm_print.h>
> >> +#include <drm/drm_probe_helper.h>
> >> +#include <linux/arm-smccc.h>
> >> +#include <linux/clk.h>
> >> +#include <linux/delay.h>
> >> +#include <linux/errno.h>
> >> +#include <linux/kernel.h>
> >> +#include <linux/mfd/syscon.h>
> >> +#include <linux/nvmem-consumer.h>
> >> +#include <linux/of.h>
> >> +#include <linux/of_irq.h>
> >> +#include <linux/of_platform.h>
> >> +#include <linux/phy/phy.h>
> >> +#include <linux/platform_device.h>
> >> +#include <linux/pm_runtime.h>
> >> +#include <linux/regmap.h>
> >> +#include <sound/hdmi-codec.h>
> >> +#include <video/videomode.h>
> >> +
> >> +#include "mtk_dp_reg.h"
> >> +
> >> +#define MTK_DP_AUX_WAIT_REPLY_COUNT 20
> >> +#define MTK_DP_CHECK_SINK_CAP_TIMEOUT_COUNT 3
> >> +
> >> +//TODO: platform/device data or dts?
> >
> >DTS :)
>=20
> It's probably going to be a platform_data struct for v10...
> If I have time, I'll change it to a dts property for v10.

I can't really imagine a case where we would need platform_data
nowadays. If you have a device tree, then it should be part of the
binding.

What issue would you like to address by using a platform_data?

> >> +static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge =
*bridge)
> >> +{
> >> +	return connector_status_connected;
> >> +}
> >
> >I'm not quite sure what's going on there. You seem to have some support
> >for HPD interrupts above, but you always report the display as
> >connected?
> >
> >I'd assume that either you don't have HPD support and then always report
> >it as connected, or you have HPD support and report the current status
> >in detect, but that combination seems weird.
>=20
> The HPD logic needs more work, some things have been broken when I split
> the driver into three patches eDP - DP - Audio
> The assumption at first was that eDP didn't need any HPD handling... but =
it
> seems I was wrong and the eDP driver needs to be reworked.

That can be made into a patch of its own if you prefer.

You first introduce the driver without status reporting (always
returning connected or unknown), and then add the needed bits for HPD.

However, that first patch shouldn't contain the interrupt plumbing and
so on, it's just confusing.

> >> +static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
> >> +				    struct drm_connector *connector)
> >> +{
> >> +	struct mtk_dp *mtk_dp =3D mtk_dp_from_bridge(bridge);
> >> +	bool enabled =3D mtk_dp->enabled;
> >> +	struct edid *new_edid =3D NULL;
> >> +
> >> +	if (!enabled)
> >> +		drm_bridge_chain_pre_enable(bridge);
> >> +
> >> +	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D0);
> >> +	usleep_range(2000, 5000);
> >> +
> >> +	if (mtk_dp_plug_state(mtk_dp))
> >> +		new_edid =3D drm_get_edid(connector, &mtk_dp->aux.ddc);
> >> +
> >> +	if (!enabled)
> >> +		drm_bridge_chain_post_disable(bridge);
> >
> >Are you sure we can't get a mode set while get_edid is called?
> >
> >If we can, then you could end up disabling the device while it's being
> >powered on.
>=20
> I'm a bit unsure, I need to spend more time in the drm stack to make sure.
> I'll get back to you when I have a definitive answer.

So, it looks like it's ok.

get_edid is your implementation of get_modes, which is called by
drm_helper_probe_single_connector_modes

https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_probe_he=
lper.c#L416

This is the standard implemantion of fill_modes, which is called
whenever the get_connector ioctl is called (or similar paths, like
drm_client_modeset_probe)

drm_helper_probe_single_connector_modes is under the assumption that the
mode_config.mutex is held though, and that the big lock. So it should be
serialized there.

Just for future proofing though, it would be better to use refcounting
there. Would runtime_pm work for you there?

> >> +static void mtk_dp_parse_drm_mode_timings(struct mtk_dp *mtk_dp,
> >> +					  struct drm_display_mode *mode)
> >> +{
> >> +	struct mtk_dp_timings *timings =3D &mtk_dp->info.timings;
> >> +
> >> +	drm_display_mode_to_videomode(mode, &timings->vm);
> >> +	timings->frame_rate =3D mode->clock * 1000 / mode->htotal / mode->vt=
otal;
> >
> >drm_mode_vrefresh()
> >
> >> +	timings->htotal =3D mode->htotal;
> >> +	timings->vtotal =3D mode->vtotal;
> >> +}
> >
> >It's not really clear to me why you need to duplicate drm_display_mode
> >here?
> >
> It's saved to be re-used in mtk_dp_set_msa().
> It's not ideal, I'll check if I can get the mode directly from mtk_dp_set=
_msa()

Yeah, it looks like mtk_dp_set_msa() uses fairly straightforward values,
this will be just as easy with drm_display_mode.

Maxime
