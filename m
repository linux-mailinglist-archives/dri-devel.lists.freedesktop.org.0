Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D61A55439B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 09:38:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5065113BEC;
	Wed, 22 Jun 2022 07:38:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB3B0113BED
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 07:38:05 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 477DB5C00FC;
 Wed, 22 Jun 2022 03:38:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 22 Jun 2022 03:38:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1655883485; x=1655969885; bh=Cn6Z2/p9SO
 EAnDYDOhTo2hgXRX/uuhVY54GGM0ULJDw=; b=DA/ngi2a9qaz8ulm8WmNEkiUu2
 RedJpyOR7IZNZOztxMmZDhGdT/qWo3HXsJFLIHoLkMxrpwVFYXruscBQVWZR1RjW
 KmeQBWBDgf8NGjLa0n4XoPuu4wjRBHuOuc2QZ8kxvlG8IKPaRTd7ZUUsgksNYOS2
 Tkrbd+yqsefy+rGUcxgEnjGLA0Vu7eQpZlyywN7VPBo0H+5LVUpe9bhI6Bf0l03D
 06OleAholZGW4cZpCgnzm8KM2WRgeXkZYr4gNOGbptrA0j53mPq5TZ6OCJ6mWc52
 5g6YnE4fqpNecJK5saU1Abf12YIWVsZu9mrms7o1+NLSv+DNi/yxG5fy+uoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1655883485; x=1655969885; bh=Cn6Z2/p9SOEAnDYDOhTo2hgXRX/u
 uhVY54GGM0ULJDw=; b=ubw0mNuagzWqjF49CTycXdreJzpRYvW2/0Y/wkiagD2p
 oIU2fuVhbP8zFGtxmA12S2N0N49e+AmbtocvC4WHR1KErspQS80fdzV4Et+Sr4r3
 Kbn8Oc+XlD3Wn4K/2Z/mgwTzVyz6fXfu4tQ87wgyym5sxpWXHTIODNaHeEp9XB30
 h6AKudFamehCS5bdl7nrTE62WcNbCiBH8L/ZwyNL+lwpd0ux4B/gCo2YD4gW1QTU
 HEt9Zs8DKUJeNsobJ+ksxucnqIbqlvwml+fTpYO0uEjdJcy6RJrWopLpYx6sKXB6
 yUzHJuo5E3Qby1ns7ol6OXCQ3bNnavuxZ3qFe9y/AA==
X-ME-Sender: <xms:3cayYrz2qFL3rz1pPngsL0q2bjsgO6vyqOzRM-r48HWZ6LblKrjVNQ>
 <xme:3cayYjQS5MSHDWA5sjHkauiGDqFFQcn4OgxsonNp3BH-RqKjxYuVC5Z2KKjKh2W_k
 XAXsP-xVG-3oiuWpDc>
X-ME-Received: <xmr:3cayYlXQxpQoCbJpS3WOff6FwhPpJQe4aztqPI-Fan-0IMJK5jU7fZ7iTK-qNki1ssfIUeuFVithMFE9tAQOY_c0mmae5xzM4OZtI-M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefgedguddvgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheeh
 fffhvedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:3cayYlh-EgGxubOScnDIUo9zasxwuuSjD3I895M_XCXCZefkHlW_EQ>
 <xmx:3cayYtCfxhdTnsA0B4FvkRn45dIaReniW5cIMR49KKGvZ7lELhG99w>
 <xmx:3cayYuKHzcdcAwdgneTqwwW3-w3YpD_f3HxxX_NwpDrg2HsPSv0zIQ>
 <xmx:3cayYh14TtKm7JTq5MnkFIWemOh7O5WcKWTtilekvgxV-3kJxyavVg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 03:38:04 -0400 (EDT)
Date: Wed, 22 Jun 2022 09:38:03 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2] drm/sun4i: Add DMA mask and segment size
Message-ID: <20220622073803.34awgg6lm3ps6xmx@houat>
References: <20220620181333.650301-1-jernej.skrabec@gmail.com>
 <45ef3221-8f27-0ae7-8cd9-48575812d797@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hp2rj7odld5eb4tp"
Content-Disposition: inline
In-Reply-To: <45ef3221-8f27-0ae7-8cd9-48575812d797@arm.com>
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
Cc: samuel@sholland.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, wens@csie.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--hp2rj7odld5eb4tp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Robin,

On Tue, Jun 21, 2022 at 01:44:44PM +0100, Robin Murphy wrote:
> On 2022-06-20 19:13, Jernej Skrabec wrote:
> > Kernel occasionally complains that there is mismatch in segment size
> > when trying to render HW decoded videos and rendering them directly with
> > sun4i DRM driver. Following message can be observed on H6 SoC:
> >=20
> > [  184.298308] ------------[ cut here ]------------
> > [  184.298326] DMA-API: sun4i-drm display-engine: mapping sg segment lo=
nger than device claims to support [len=3D6144000] [max=3D65536]
> > [  184.298364] WARNING: CPU: 1 PID: 382 at kernel/dma/debug.c:1162 debu=
g_dma_map_sg+0x2b0/0x350
> > [  184.322997] CPU: 1 PID: 382 Comm: ffmpeg Not tainted 5.19.0-rc1+ #13=
31
> > [  184.329533] Hardware name: Tanix TX6 (DT)
> > [  184.333544] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BT=
YPE=3D--)
> > [  184.340512] pc : debug_dma_map_sg+0x2b0/0x350
> > [  184.344882] lr : debug_dma_map_sg+0x2b0/0x350
> > [  184.349250] sp : ffff800009f33a50
> > [  184.352567] x29: ffff800009f33a50 x28: 0000000000010000 x27: ffff000=
001b86c00
> > [  184.359725] x26: ffffffffffffffff x25: ffff000005d8cc80 x24: 0000000=
000000000
> > [  184.366879] x23: ffff80000939ab18 x22: 0000000000000001 x21: 0000000=
000000001
> > [  184.374031] x20: 0000000000000000 x19: ffff0000018a7410 x18: fffffff=
fffffffff
> > [  184.381186] x17: 0000000000000000 x16: 0000000000000000 x15: fffffff=
fffffffff
> > [  184.388338] x14: 0000000000000001 x13: ffff800009534e86 x12: 6f70707=
573206f74
> > [  184.395493] x11: 20736d69616c6320 x10: 000000000000000a x9 : 0000000=
000010000
> > [  184.402647] x8 : ffff8000093b6d40 x7 : ffff800009f33850 x6 : 0000000=
00000000c
> > [  184.409800] x5 : ffff0000bf997940 x4 : 0000000000000000 x3 : 0000000=
000000027
> > [  184.416953] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000=
003960e80
> > [  184.424106] Call trace:
> > [  184.426556]  debug_dma_map_sg+0x2b0/0x350
> > [  184.430580]  __dma_map_sg_attrs+0xa0/0x110
> > [  184.434687]  dma_map_sgtable+0x28/0x4c
> > [  184.438447]  vb2_dc_dmabuf_ops_map+0x60/0xcc
> > [  184.442729]  __map_dma_buf+0x2c/0xd4
> > [  184.446321]  dma_buf_map_attachment+0xa0/0x130
> > [  184.450777]  drm_gem_prime_import_dev+0x7c/0x18c
> > [  184.455410]  drm_gem_prime_fd_to_handle+0x1b8/0x214
> > [  184.460300]  drm_prime_fd_to_handle_ioctl+0x2c/0x40
> > [  184.465190]  drm_ioctl_kernel+0xc4/0x174
> > [  184.469123]  drm_ioctl+0x204/0x420
> > [  184.472534]  __arm64_sys_ioctl+0xac/0xf0
> > [  184.476474]  invoke_syscall+0x48/0x114
> > [  184.480240]  el0_svc_common.constprop.0+0x44/0xec
> > [  184.484956]  do_el0_svc+0x2c/0xc0
> > [  184.488283]  el0_svc+0x2c/0x84
> > [  184.491354]  el0t_64_sync_handler+0x11c/0x150
> > [  184.495723]  el0t_64_sync+0x18c/0x190
> > [  184.499397] ---[ end trace 0000000000000000 ]---
> >=20
> > Fix that by setting DMA mask and segment size.
> >=20
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> > Changes from v1:
> > - added comment
> > - updated commit message with kernel report
> >=20
> >   drivers/gpu/drm/sun4i/sun4i_drv.c | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/=
sun4i_drv.c
> > index 275f7e4a03ae..f135a6b3cadb 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_drv.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
> > @@ -7,6 +7,7 @@
> >    */
> >   #include <linux/component.h>
> > +#include <linux/dma-mapping.h>
> >   #include <linux/kfifo.h>
> >   #include <linux/module.h>
> >   #include <linux/of_graph.h>
> > @@ -367,6 +368,13 @@ static int sun4i_drv_probe(struct platform_device =
*pdev)
> >   	INIT_KFIFO(list.fifo);
> > +	/*
> > +	 * DE2 and DE3 cores actually supports 40-bit addresses, but
> > +	 * driver does not.
> > +	 */
> > +	dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> > +	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
>=20
> Nit: this one is a number, not a bitmask, so UINT_MAX would be more
> appropriate semantically.

Thanks for the suggestion, I've fixed it while applying

Maxime

--hp2rj7odld5eb4tp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYrLG2wAKCRDj7w1vZxhR
xVqLAP908SepTKlaW7ljl34wwmEyK8rFL3xIkpMke8JZsv1LzQD/VH5C1zsAONBE
tvabgS329bcFnEQzeo2rWq9zDbyuDAM=
=SM9K
-----END PGP SIGNATURE-----

--hp2rj7odld5eb4tp--
