Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFgoBN32rmnZKgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 17:35:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 614C823CCCF
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 17:35:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A850510E561;
	Mon,  9 Mar 2026 16:35:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF3610E561
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 16:35:36 +0000 (UTC)
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.103.14])
 by APP-05 (Coremail) with SMTP id zQCowACnOQ3B9q5pY3H5CQ--.47818S2;
 Tue, 10 Mar 2026 00:35:14 +0800 (CST)
Message-ID: <301a33fc27bd01bb50d57779c2f9eb51a4fafaa5.camel@iscas.ac.cn>
Subject: Re: [PATCH v7 3/8] drm: verisilicon: add a driver for Verisilicon
 display controllers
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Andrzej Hajda	
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman	 <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring	 <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley	 <conor+dt@kernel.org>, Drew
 Fustini <fustini@kernel.org>, Guo Ren	 <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Dmitry Baryshkov
 <lumag@kernel.org>,  Michal Wilczynski <m.wilczynski@samsung.com>, Han Gao
 <gaohan@iscas.ac.cn>, Yao Zi <ziyao@disroot.org>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Tue, 10 Mar 2026 00:35:13 +0800
In-Reply-To: <DGY9GWWLXGNX.265MMEXXCG8YA@bootlin.com>
References: <20260129023922.1527729-1-zhengxingda@iscas.ac.cn>
 <20260129023922.1527729-4-zhengxingda@iscas.ac.cn>
 <DGY9GWWLXGNX.265MMEXXCG8YA@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-CM-TRANSID: zQCowACnOQ3B9q5pY3H5CQ--.47818S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw45CF17Xr45Xr4UuF4fGrg_yoWxKryfpF
 s2qay5KFs8XFWfu3yUZr4jyFyYv3yDGFs0grWUZryFvF9agF9rWr4DAr1DuF18CF4UCF1a
 yr1Utr4S9rn8AFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvGb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r
 4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xK
 xwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
 W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
 1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
 IIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
 6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
 73UjIFyTuYvjxUkl19UUUUU
X-Originating-IP: [112.94.103.14]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
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
X-Rspamd-Queue-Id: 614C823CCCF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[27];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_RECIPIENTS(0.00)[m:luca.ceresoli@bootlin.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:fustini@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:p.zabel@pengutronix.de,m:lumag@kernel.org,m:m.wilczynski@samsung.com,m:gaohan@iscas.ac.cn,m:ziyao@disroot.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[bootlin.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,redhat.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[zhengxingda@iscas.ac.cn,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[zhengxingda@iscas.ac.cn,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	NEURAL_HAM(-0.00)[-0.909];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:email,icenowy.me:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,iscas.ac.cn:mid,iscas.ac.cn:email,suse.de:email,bootlin.com:url]
X-Rspamd-Action: no action

=E5=9C=A8 2026-03-09=E4=B8=80=E7=9A=84 13:47 +0100=EF=BC=8CLuca Ceresoli=E5=
=86=99=E9=81=93=EF=BC=9A
> Hello Icenowy Zheng,
>=20
> On Thu Jan 29, 2026 at 3:39 AM CET, Icenowy Zheng wrote:
> > From: Icenowy Zheng <uwu@icenowy.me>
> >=20
> > This is a from-scratch driver targeting Verisilicon DC-series
> > display
> > controllers, which feature self-identification functionality like
> > their
> > GC-series GPUs.
> >=20
> > Only DC8200 is being supported now, and only the main framebuffer
> > is set
> > up (as the DRM primary plane). Support for more DC models and more
> > features is my further targets.
> >=20
> > As the display controller is delivered to SoC vendors as a whole
> > part,
> > this driver does not use component framework and extra bridges
> > inside a
> > SoC is expected to be implemented as dedicated bridges (this driver
> > properly supports bridge chaining).
> >=20
> > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > Tested-by: Han Gao <gaohan@iscas.ac.cn>
> > Tested-by: Michal Wilczynski <m.wilczynski@samsung.com>
> > Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> I have reviewed the bridge part of this patch and have a few remarks,
> see
> below.
>=20
> [...]
>=20
> > +++ b/drivers/gpu/drm/verisilicon/vs_bridge.c
> > @@ -0,0 +1,371 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
> > + */
> > +
> > +#include <linux/of.h>
> > +#include <linux/regmap.h>
> > +
> > +#include <uapi/linux/media-bus-format.h>
> > +
> > +#include <drm/drm_atomic.h>
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_bridge_connector.h>
> > +#include <drm/drm_connector.h>
> > +#include <drm/drm_encoder.h>
> > +#include <drm/drm_of.h>
> > +#include <drm/drm_print.h>
> > +#include <drm/drm_simple_kms_helper.h>
> > +
> > +#include "vs_bridge.h"
> > +#include "vs_bridge_regs.h"
> > +#include "vs_crtc.h"
> > +#include "vs_dc.h"
> > +
> > +static int vs_bridge_attach(struct drm_bridge *bridge,
> > +			=C2=A0=C2=A0=C2=A0 struct drm_encoder *encoder,
> > +			=C2=A0=C2=A0=C2=A0 enum drm_bridge_attach_flags flags)
> > +{
> > +	struct vs_bridge *vbridge =3D
> > drm_bridge_to_vs_bridge(bridge);
> > +
> > +	return drm_bridge_attach(encoder, vbridge->next_bridge,
> > +				 bridge, flags);
> > +}
> > +
> > +struct vsdc_dp_format {
> > +	u32 linux_fmt;
> > +	bool is_yuv;
> > +	u32 vsdc_fmt;
> > +};
>=20
> Moving the bool after the two 'u32's would be better for packing and
> spatial locality (especially in case more fields are added in the
> future).

Yes this seems to sound right, but doing such rework sounds quite big
and unnecessary after it's applied...

>=20
> > +
> > +static struct vsdc_dp_format vsdc_dp_supported_fmts[] =3D {
> > +	/* default to RGB888 */
> > +	{ MEDIA_BUS_FMT_FIXED, false,
> > VSDC_DISP_DP_CONFIG_FMT_RGB888 },
> > +	{ MEDIA_BUS_FMT_RGB888_1X24, false,
> > VSDC_DISP_DP_CONFIG_FMT_RGB888 },
> > +	{ MEDIA_BUS_FMT_RGB565_1X16, false,
> > VSDC_DISP_DP_CONFIG_FMT_RGB565 },
> > +	{ MEDIA_BUS_FMT_RGB666_1X18, false,
> > VSDC_DISP_DP_CONFIG_FMT_RGB666 },
> > +	{ MEDIA_BUS_FMT_RGB101010_1X30,
> > +	=C2=A0 false, VSDC_DISP_DP_CONFIG_FMT_RGB101010 },
>=20
> You can put up to 100 chars per line and avoid the newline here to
> make
> this table more readable. Same below.

Ah I prefer to keep 80 CPL when I can, and the `coding-style.rst`
document still suggests 80.

>=20
> > +	{ MEDIA_BUS_FMT_UYVY8_1X16, true,
> > VSDC_DISP_DP_CONFIG_YUV_FMT_UYVY8 },
> > +	{ MEDIA_BUS_FMT_UYVY10_1X20, true,
> > VSDC_DISP_DP_CONFIG_YUV_FMT_UYVY10 },
> > +	{ MEDIA_BUS_FMT_YUV8_1X24, true,
> > VSDC_DISP_DP_CONFIG_YUV_FMT_YUV8 },
> > +	{ MEDIA_BUS_FMT_YUV10_1X30, true,
> > VSDC_DISP_DP_CONFIG_YUV_FMT_YUV10 },
> > +	{ MEDIA_BUS_FMT_UYYVYY8_0_5X24,
> > +	=C2=A0 true, VSDC_DISP_DP_CONFIG_YUV_FMT_UYYVYY8 },
> > +	{ MEDIA_BUS_FMT_UYYVYY10_0_5X30,
> > +	=C2=A0 true, VSDC_DISP_DP_CONFIG_YUV_FMT_UYYVYY10 },
> > +};
> > +
>=20
> [...]
>=20
> > +struct vs_bridge *vs_bridge_init(struct drm_device *drm_dev,
> > +				 struct vs_crtc *crtc)
> > +{
> > +	unsigned int output =3D crtc->id;
> > +	struct vs_bridge *bridge;
>=20
> In common practice a variable named 'bridge' is used to point to a
> 'struct
> drm_bridge', so it feels weird when it is used for another type. Can
> you
> rename to 'vbridge' or 'vsbridge' or similar, to clarify it's the
> "Verisilicon bridge"?

This sounds right.

BTW where is such kind of common practice documented?

>=20
> This is after all what you did in vs_bridge_attach() above, where the
> ambiguity of the 'bridge' name used for a driver-specific struct is
> evident.
>=20
> > +	struct drm_bridge *next;
> > +	enum vs_bridge_output_interface intf;
> > +	const struct drm_bridge_funcs *bridge_funcs;
> > +	int ret, enctype;
> > +
> > +	intf =3D vs_bridge_detect_output_interface(drm_dev->dev-
> > >of_node,
> > +						 output);
> > +	if (intf =3D=3D -ENODEV) {
> > +		drm_dbg(drm_dev, "Skipping output %u\n", output);
> > +		return NULL;
> > +	}
> > +
> > +	next =3D devm_drm_of_get_bridge(drm_dev->dev, drm_dev->dev-
> > >of_node,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 output, intf);
> > +	if (IS_ERR(next)) {
> > +		ret =3D PTR_ERR(next);
> > +		if (ret !=3D -EPROBE_DEFER)
> > +			drm_err(drm_dev,
> > +				"Cannot get downstream bridge of
> > output %u\n",
> > +				output);
>=20
> 100 chars per line are allowed, so this could fit on a single line
> being
> nicer to read. This applies to a lot places in this driver, of
> logging
> calls in particular. I understand this would be annoying to change on
> an
> already reviewed patch and at v7 so up to you, but it would be good
> to keep
> it in mind for the future.
>=20
> > +		return ERR_PTR(ret);
> > +	}
> > +
> > +	if (intf =3D=3D VSDC_OUTPUT_INTERFACE_DPI)
> > +		bridge_funcs =3D &vs_dpi_bridge_funcs;
> > +	else
> > +		bridge_funcs =3D &vs_dp_bridge_funcs;
> > +
> > +	bridge =3D devm_drm_bridge_alloc(drm_dev->dev, struct
> > vs_bridge, base,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bridge_funcs);
>=20
> The 'struct drm_bridge' field embedded in a driver-specific struct is
> conventionally called 'bridge', so renaming it from 'base' to
> 'bridge'
> would make it more consistent with other drivers. That would go in
> sync
> with the coding convention I mentioned above: 'bridge' for struct
> drm_bridge, <XYZ>bridge or just <XYZZ> for a custom driver struct
> embedding
> a bridge.

Ah, all subclasses in this driver call the base class `base`, and I
still wonder how such convention is documented.

>=20
> > +	if (IS_ERR(bridge))
> > +		return ERR_PTR(PTR_ERR(bridge));
> > +
> > +	bridge->crtc =3D crtc;
> > +	bridge->intf =3D intf;
> > +	bridge->next_bridge =3D next;
>=20
> There is now a next_bridge field in struct drm_bridge, which handles
> the
> bridge lifetime in a safer way and more simply [0], so you could use
> it:

Glad to hear such a field exists now. Will more code about next_bridge
lifetime management being shared?

Thanks,
Icenowy

>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bridge->base.next_bridge =3D next;
>=20
> Or, after the renames I suggested above:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vbridge->bridge.next_bridge =3D next=
;
>=20
> [0]
> https://elixir.bootlin.com/linux/v7.0-rc2/source/include/drm/drm_bridge.h=
#L1269-L1278
>=20
> Luca
>=20
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

