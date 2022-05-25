Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2406533A27
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 11:44:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E7510F5EF;
	Wed, 25 May 2022 09:44:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 064F910F663
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 09:44:44 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id B141D2B05006;
 Wed, 25 May 2022 05:44:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 25 May 2022 05:44:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1653471878; x=1653479078; bh=ys3iQzhNHF
 k+i8WtIf+H8WQ46WfOZFCztCK2dX/C9P0=; b=N/JRB+WnexRIZ9dX5PcEm/8f/H
 cPBsMsbDuSTmVpILRSXnNlFoPgXwTnB9sG5c2CBpqvmmZti7TCvET1ygVyPq4fwA
 fQ5OKTgoJNLZ2M0ZTBEABVgD9xQIGnhTbnxt6XkIAVCIzuLJXBs7WAGfC96irWbw
 lr6953LnsKHvebopgcw5k3L/zNh8kVTad2/799qbT1ZNmy0HBuUmu2c1k8Ro/kCY
 bvMC07VkU0pJwn8wysn6o8m1M2Ne1dICZCA2GfRKAkRG+uRlxyGobz3yN2r1jOok
 pxntt2LaG8S5EYl12Kr5IDS1ImVsXzQyl8d4WYDx7OYzrJX/5YAypClUA6hQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1653471878; x=1653479078; bh=ys3iQzhNHFk+i8WtIf+H8WQ46WfO
 ZFCztCK2dX/C9P0=; b=XJwcQJysHomLv8q3I/a024YNpcHuA7CVVSfdAKLSNh3e
 yCo6zETnKg3Mmiy6LoUaiq2nQu9FmR/S85oMTwF7btYoM842Xj+nV71rUSMChwSf
 dqf2GI+aNWNs5ombF58vGOinb8gsdVPNIx+xirIXrd2MM5HTFxrTtiWm/87u7xJG
 g2dLVRdU0LdTz2v5YPgzkl1T0mdMsa+3PlpXoMfDj0mFo5gdyV+0rNllM1Gs6YzH
 v42Dafl6F/jY8Nx/xQNz9BWuJQwjez2vm5rfwevvrJNdAG3j0FQLxK/8UQJ0nJ0c
 WDUETgLd5XsVCXp/jcUW6Bu92Nyy4tEdyF1vOAVWKg==
X-ME-Sender: <xms:hfqNYq_j5GFf5Uz1mDgmLdV70fLnuq6aSKWevLqyWIawg4NmhGrHQg>
 <xme:hfqNYqtHTkLzDuf9wZyjFbHZAlnHbcr-0YckTlhEp7Xi4YnN4O9Rj5_Rgh6byONs6
 vUf5M6n4txqCdpV9vw>
X-ME-Received: <xmr:hfqNYgB-vOJM3N79sWpwTBKgf_FqXdlgWKqgCm2OFJA94fiDo67jizwJV9YM_HUjfM0eagMIdOKEsmwTFs1RY076g0I827v4G1dOjck>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrjeehgddukecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepgfeuuedtfefgveevheejfeeghedvjeejfeehkeffudetuedtgfeiieeiffeu
 tdffnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:hfqNYicSWVCNxtPjO2OP-dTZTG5RnA-8HT0mTEUaKkDRVcwql_I2Ug>
 <xmx:hfqNYvOIcwaM76cNjFwwp5PA3zMSONCG2MMRXEw6yETvTmp88gEfoQ>
 <xmx:hfqNYsk9JgcQt1Fcfw7pvS3BYvWH_sfA1sMh1fLYGKJSYXOJnHLW1A>
 <xmx:hvqNYpW3xzQCmkMOuNOuoVddp28C1T8FymU-PtWuCJdZO9MFWihypK9P9TQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 May 2022 05:44:36 -0400 (EDT)
Date: Wed, 25 May 2022 11:44:34 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Guillaume Ranquet <granquet@baylibre.com>
Subject: Re: [PATCH v9 18/22] drm/mediatek: Add mt8195 Embedded DisplayPort
 driver
Message-ID: <20220525094434.7qhycnobrmgiihuf@houat>
References: <20220327223927.20848-1-granquet@baylibre.com>
 <20220327223927.20848-19-granquet@baylibre.com>
 <20220429083933.q3w75q3zuyyuvo4w@houat>
 <CABnWg9tzhZjrdKT4chkDrY-uH8BMUoxyNLUSwfuG6Sv1J+8ddg@mail.gmail.com>
 <20220512074446.ihilbbnbuwesxbbg@houat>
 <CABnWg9tHRc_7VZ1z6NeMEDfQvxam_xOimBnM=hzBUqkhzPOSCA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="frqxb4oy2hxaw6mk"
Content-Disposition: inline
In-Reply-To: <CABnWg9tHRc_7VZ1z6NeMEDfQvxam_xOimBnM=hzBUqkhzPOSCA@mail.gmail.com>
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


--frqxb4oy2hxaw6mk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 19, 2022 at 09:26:59AM -0700, Guillaume Ranquet wrote:
> On Thu, 12 May 2022 09:44, Maxime Ripard <maxime@cerno.tech> wrote:
> >Hi,
> >
> >On Wed, May 11, 2022 at 05:59:13AM -0700, Guillaume Ranquet wrote:
> >> >> +#include <drm/drm_atomic_helper.h>
> >> >> +#include <drm/drm_bridge.h>
> >> >> +#include <drm/drm_crtc.h>
> >> >> +#include <drm/dp/drm_dp_helper.h>
> >> >> +#include <drm/drm_edid.h>
> >> >> +#include <drm/drm_of.h>
> >> >> +#include <drm/drm_panel.h>
> >> >> +#include <drm/drm_print.h>
> >> >> +#include <drm/drm_probe_helper.h>
> >> >> +#include <linux/arm-smccc.h>
> >> >> +#include <linux/clk.h>
> >> >> +#include <linux/delay.h>
> >> >> +#include <linux/errno.h>
> >> >> +#include <linux/kernel.h>
> >> >> +#include <linux/mfd/syscon.h>
> >> >> +#include <linux/nvmem-consumer.h>
> >> >> +#include <linux/of.h>
> >> >> +#include <linux/of_irq.h>
> >> >> +#include <linux/of_platform.h>
> >> >> +#include <linux/phy/phy.h>
> >> >> +#include <linux/platform_device.h>
> >> >> +#include <linux/pm_runtime.h>
> >> >> +#include <linux/regmap.h>
> >> >> +#include <sound/hdmi-codec.h>
> >> >> +#include <video/videomode.h>
> >> >> +
> >> >> +#include "mtk_dp_reg.h"
> >> >> +
> >> >> +#define MTK_DP_AUX_WAIT_REPLY_COUNT 20
> >> >> +#define MTK_DP_CHECK_SINK_CAP_TIMEOUT_COUNT 3
> >> >> +
> >> >> +//TODO: platform/device data or dts?
> >> >
> >> >DTS :)
> >>
> >> It's probably going to be a platform_data struct for v10...
> >> If I have time, I'll change it to a dts property for v10.
> >
> >I can't really imagine a case where we would need platform_data
> >nowadays. If you have a device tree, then it should be part of the
> >binding.
> >
> >What issue would you like to address by using a platform_data?
> >
>=20
> Ok, I'll migrate to dt then. I didn't realize platform_data were deprecia=
ted.
>=20
> Angelo wants the MAX_LINRATE and MAX_LANES defines to be configurable.
> I imagined platform_data would be more appropriate as (per my understandi=
ng) the
> limitation is associated with a specific SoC.

The entire device tree is nothing but a collection of data associated to
a specific SoC though :)

> >> >> +static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
> >> >> +				    struct drm_connector *connector)
> >> >> +{
> >> >> +	struct mtk_dp *mtk_dp =3D mtk_dp_from_bridge(bridge);
> >> >> +	bool enabled =3D mtk_dp->enabled;
> >> >> +	struct edid *new_edid =3D NULL;
> >> >> +
> >> >> +	if (!enabled)
> >> >> +		drm_bridge_chain_pre_enable(bridge);
> >> >> +
> >> >> +	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D0);
> >> >> +	usleep_range(2000, 5000);
> >> >> +
> >> >> +	if (mtk_dp_plug_state(mtk_dp))
> >> >> +		new_edid =3D drm_get_edid(connector, &mtk_dp->aux.ddc);
> >> >> +
> >> >> +	if (!enabled)
> >> >> +		drm_bridge_chain_post_disable(bridge);
> >> >
> >> >Are you sure we can't get a mode set while get_edid is called?
> >> >
> >> >If we can, then you could end up disabling the device while it's being
> >> >powered on.
> >>
> >> I'm a bit unsure, I need to spend more time in the drm stack to make s=
ure.
> >> I'll get back to you when I have a definitive answer.
> >
> >So, it looks like it's ok.
> >
> >get_edid is your implementation of get_modes, which is called by
> >drm_helper_probe_single_connector_modes
> >
> >https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_probe=
_helper.c#L416
> >
> >This is the standard implemantion of fill_modes, which is called
> >whenever the get_connector ioctl is called (or similar paths, like
> >drm_client_modeset_probe)
> >
> >drm_helper_probe_single_connector_modes is under the assumption that the
> >mode_config.mutex is held though, and that the big lock. So it should be
> >serialized there.
> >
> >Just for future proofing though, it would be better to use refcounting
> >there. Would runtime_pm work for you there?
> >
>=20
> Thx for looking into this for me.
> Not sure runtime_pm works here as it would only refcount if compiled
> with CONFIG_PM?

It should be enabled in most configurations these days, and you can
always depend on it in your Kconfig option.

> I'd rather use the enabled field as a refcounter instead of a boolean.

It's a bit more ad-hoc, but that would work too. Make sure to use a lock
or atomic operations though

Maxime

--frqxb4oy2hxaw6mk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYo36ggAKCRDj7w1vZxhR
xZ8uAQD4p9FP6n4HWaV/eeMy9XLCytn17FejCmxsGJ+BVRXkngEA7rKJQeM++TcT
7XF+Ij2881A16a/1Cfs+sVBCS9T7/Ao=
=cDEf
-----END PGP SIGNATURE-----

--frqxb4oy2hxaw6mk--
