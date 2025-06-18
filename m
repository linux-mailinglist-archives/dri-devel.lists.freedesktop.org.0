Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F30DAADE616
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 10:52:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC8810E7B2;
	Wed, 18 Jun 2025 08:52:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ai/3P3mI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9755710E7B8
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 08:52:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EF86E442A1;
 Wed, 18 Jun 2025 08:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1750236722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l4hm8DAzRZ2eqN+qHSZp27aNSEI1HsmdDE6YkIdlTp8=;
 b=ai/3P3mImKWBMJZSbUDwdB30HFMvQRAe8D3SDHtU4rPOSz9mySfOiOnuZTKMShOqNxQrU+
 sez8fNnTeATEU7PS0dbMp6n8wsbMxwEu5COspteTyNNoCu6u/8gJQLmxsLnFz2FanBQ/Ea
 BhVpX91+RXMXOp0/za7Dj43U8TE4hTQUx6+QlArCDCVVpTme2v2/4AzJkqngnRaqiEnF8a
 Zny+fiPyNkDLpaS5ehHb7YG0iGEOQVRlge7I0EDAXCC8nNStfSo86/OZtEkN3D3QlzapZR
 8C/kxWkBr+CE8Dd7a7+7q8ZV5bXsWElk9HgnuS7Vu68IqZeLcgJEYM4ejeK5TA==
Date: Wed, 18 Jun 2025 10:51:58 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, Maxime Ripard
 <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Jessica
 Zhang <quic_jesszhan@quicinc.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: drm/panel/panel-simple v6.16-rc1 WARNING regression
Message-ID: <20250618105158.06e42668@booty>
In-Reply-To: <CAN9Xe3RFEXZuWTZB5E1tJdjXc9o_hB1ArgA5SvqbDUBkwYea8w@mail.gmail.com>
References: <20250612081834.GA248237@francesco-nb>
 <CAN9Xe3RFEXZuWTZB5E1tJdjXc9o_hB1ArgA5SvqbDUBkwYea8w@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfetudeugfehheeliefhjeejuddvledtuddttdevledthfehgeeugfetheekgfffnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtoheprghsrhhivhgrthhssehrvgguhhgrthdrtghomhdprhgtphhtthhopehfrhgrnhgtvghstghoseguohhltghinhhirdhithdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtt
 hhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtohepqhhuihgtpghjvghsshiihhgrnhesqhhuihgtihhntgdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com
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

Hello Anusha, Francesco,

On Tue, 17 Jun 2025 11:17:20 -0500
Anusha Srivatsa <asrivats@redhat.com> wrote:

> On Thu, Jun 12, 2025 at 3:24=E2=80=AFAM Francesco Dolcini <francesco@dolc=
ini.it>
> wrote:
>=20
> > Hello all,
> >
> > Commit de04bb0089a9 ("drm/panel/panel-simple: Use the new allocation in
> > place of devm_kzalloc()")
> > from 6.16-rc1 introduced a regression with this warning during probe
> > with panel dpi described in the DT.
> >
> > A revert solves the issue.
> >
> > The issue is that connector_type is set to DRM_MODE_CONNECTOR_DPI in
> > panel_dpi_probe() that after that change is called after
> > devm_drm_panel_alloc().
> >
> > I am not sure if there are other implication for this change in the call
> > ordering, apart the one that triggers this warning.
> >
> > [   12.089274] ------------[ cut here ]------------
> > [   12.089303] WARNING: CPU: 0 PID: 96 at
> > drivers/gpu/drm/bridge/panel.c:377 devm_drm_of_get_bridge+0xac/0xb8
> > [   12.130808] Modules linked in: v4l2_jpeg pwm_imx27(+) imx_vdoa
> > gpu_sched panel_simple imx6_media(C) imx_media_common
> > (C) videobuf2_dma_contig pwm_bl gpio_keys v4l2_mem2mem fuse ipv6 autofs4
> > [   12.147774] CPU: 0 UID: 0 PID: 96 Comm: kworker/u8:3 Tainted: G
> >  C          6.16.0-rc1+ #1 PREEMPT
> > [   12.157446] Tainted: [C]=3DCRAP
> > [   12.160418] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tre=
e)
> > [   12.166953] Workqueue: events_unbound deferred_probe_work_func
> > [   12.172805] Call trace:
> > [   12.172815]  unwind_backtrace from show_stack+0x10/0x14
> > [   12.180598]  show_stack from dump_stack_lvl+0x68/0x74
> > [   12.185674]  dump_stack_lvl from __warn+0x7c/0xe0
> > [   12.190407]  __warn from warn_slowpath_fmt+0x1b8/0x1c0
> > [   12.195567]  warn_slowpath_fmt from devm_drm_of_get_bridge+0xac/0xb8
> > [   12.201949]  devm_drm_of_get_bridge from imx_pd_probe+0x58/0x164
> > [   12.207976]  imx_pd_probe from platform_probe+0x5c/0xb0
> > [   12.213220]  platform_probe from really_probe+0xd0/0x3a4
> > [   12.218551]  really_probe from __driver_probe_device+0x8c/0x1d4
> > [   12.224486]  __driver_probe_device from driver_probe_device+0x30/0xc0
> > [   12.230942]  driver_probe_device from __device_attach_driver+0x98/0x=
10c
> > [   12.237572]  __device_attach_driver from bus_for_each_drv+0x90/0xe4
> > [   12.243854]  bus_for_each_drv from __device_attach+0xa8/0x1c8
> > [   12.249614]  __device_attach from bus_probe_device+0x88/0x8c
> > [   12.255285]  bus_probe_device from deferred_probe_work_func+0x8c/0xcc
> > [   12.261739]  deferred_probe_work_func from process_one_work+0x154/0x=
2dc
> > [   12.268371]  process_one_work from worker_thread+0x250/0x3f0
> > [   12.274043]  worker_thread from kthread+0x12c/0x24c
> > [   12.278940]  kthread from ret_from_fork+0x14/0x28
> > [   12.283660] Exception stack(0xd0be9fb0 to 0xd0be9ff8)
> > [   12.288720] 9fa0:                                     00000000 00000=
000
> > 00000000 00000000
> > [   12.296906] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000=
000
> > 00000000 00000000
> > [   12.305089] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000=
000
> > [   12.312050] ---[ end trace 0000000000000000 ]---
> >
> > #regzbot ^introduced: de04bb0089a96cc00d13b12cbf66a088befe3057
> >
> > Any advise?
> >
> > Hey Francesco! =20
>=20
> This mail reached my spam and I hadn't realised till today. Thanks for
> bringing this to attention.
>
> Thinking out loud here: If we called dpi_probe() before allocating the
> panel using devm_drm_panel_alloc()
> then we would have the connector type. But  dpi_probe() needs the panel to
> be allocated....

Reading the panel-simple.c code, the handling of the panel_dsi
descriptor feels a bit hacky, and the recent change to
devm_drm_panel_alloc() breaks it easily. Perhaps it would be cleaner to
assess the whole descriptor before ding any allocation/init.

You're right tat panel_dpi_probe() needs the panel, but it's only at the
very end, to assign the descriptor:

  panel->desc =3D desc;

I think a good fix would be to clean it up by having:

 * panel_dpi_probe() not take a panel pointer but rather returning a
   filled descriptor
 * panel_simple_probe() call panel_dpi_probe() early [before
   devm_drm_panel_alloc()] and get the filled descriptor
 * call devm_drm_panel_alloc() with that descriptor in the panel-dsi
   case, or with the good old descriptor otherwise

As a good side effect, it would get rid of a case where
devm_drm_panel_alloc() is called with a Unknown connector type.

Anusha, does it look like a good plan?

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
