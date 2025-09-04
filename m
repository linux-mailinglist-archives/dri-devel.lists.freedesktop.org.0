Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E27B43290
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 08:37:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA46410E979;
	Thu,  4 Sep 2025 06:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="C3T6oAQy";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="DpOUZ/fT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 477F810E979
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 06:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1756967829; x=1788503829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kkpN9KMDd74VuED4g9h4cMoXAQt3UR7LWE3gnTyIkZQ=;
 b=C3T6oAQynPbKMCsbuuskBCGfCbl0TAT1xJvaA8fUZWs57N86YunlCZos
 zBSdUfpHr3q9wKYDeiVTebZB0q1tQaFBSn1SpHD63p6lQGA1CcvXzKyBz
 DiRk88U6pdV/5/sWNJMZdGrERyjgv/KhBVE2BYaIPaNaiYu+GxAPxI7Xe
 LXORbM6sytQX0mk5gJXVZhQoWVlgwtMr4vJYOeOfy3LfUzFHkfiAUFey7
 tGaIp4LqNHg0Uh/8QqjXp+H8O9HQF9MvwztJnZXbd/B+DuxESEWFcRB1P
 8fwFbC4klT9epINFYUQ+lMcAGKj1pKJL2gbEKCWDB0hpR2nx+VvXdP4dO w==;
X-CSE-ConnectionGUID: 9p8QZnA8QQWNINsHY/Q+VQ==
X-CSE-MsgGUID: biZXPoVjT3KkCsQH8tWQtQ==
X-IronPort-AV: E=Sophos;i="6.18,237,1751234400"; d="scan'208";a="46067816"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 04 Sep 2025 08:37:05 +0200
X-CheckPoint: {68B93391-1B-299FBAB0-EF52EDE7}
X-MAIL-CPID: 52B18138E6B4DEB93BDE63A8203E6266_5
X-Control-Analysis: str=0001.0A2D0328.68B93393.002F, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E0794169FDB; Thu,  4 Sep 2025 08:36:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1756967821;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=kkpN9KMDd74VuED4g9h4cMoXAQt3UR7LWE3gnTyIkZQ=;
 b=DpOUZ/fT26CvO8fVeJgmIcJ4c5oQnWe9OOXeTeeswSRHFoh3tLJOXR8/fx1qGyLCPZ2hLZ
 szKvg/xhil1zwPQfEMtIcik45sP/T1Ld2DrWiqqlyah5c8/JySSEMH3xrTKJf9GnlGzM2k
 crfs0GtdUSf+8UjkJWF/CtwInJLPkQHha25k61L3qO3uGVPoJeDxHBkM/6qmH7Ktir2BOt
 R3FmWdFOrPuKs8Qlywz72rfABpHU9LkfBDV8/EBwifItNKL5T7fyLYTivozlQj0N4Q8xMA
 EHFw9m+7UVDXV/649G0nhvtdWs3XmOAdS7sBoXsHyPrIz1ZgSG2Dn2dHfIz+aA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marek Vasut <marek.vasut@mailbox.org>, dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
Date: Thu, 04 Sep 2025 08:36:55 +0200
Message-ID: <3372501.aeNJFYEL58@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250904082224.113d0cd1@fedora>
References: <20250321200625.132494-1-marex@denx.de>
 <838a0c6b-845b-428d-86b3-1480e5b8080f@mailbox.org>
 <20250904082224.113d0cd1@fedora>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
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

Hi,

Am Donnerstag, 4. September 2025, 08:22:24 CEST schrieb Boris Brezillon:
> On Wed, 3 Sep 2025 23:44:59 +0200
> Marek Vasut <marek.vasut@mailbox.org> wrote:
>=20
> > On 3/25/25 3:52 PM, Boris Brezillon wrote:
> >=20
> > Hello Boris,
> >=20
> > sorry for the late reply.
> >=20
> > >>>>>>> Hm, that might be the cause of the fast reset issue (which is a=
 fast
> > >>>>>>> resume more than a fast reset BTW): if you re-assert the reset =
line on
> > >>>>>>> runtime suspend, I guess this causes a full GPU reset, and the =
MCU ends
> > >>>>>>> up in a state where it needs a slow reset (all data sections re=
set to
> > >>>>>>> their initial state). Can you try to move the reset_control_[de=
]assert
> > >>>>>>> to the unplug/init functions? =20
> > >>>>>> Is it correct to assume , that if I remove all reset_control_ass=
ert()
> > >>>>>> calls (and keep only the _deassert() calls), the slow resume pro=
blem
> > >>>>>> should go away too ? =20
> > >>>>>
> > >>>>> Yeah, dropping the _assert()s should do the trick. =20
> > >>>> Hmmm, no, that does not help. I was hoping maybe NXP can chime in =
and
> > >>>> suggest something too ? =20
> > >>>
> > >>> Can you try keep all the clks/regulators/power-domains/... on after
> > >>> init, and see if the fast resume works with that. If it does,
> > >>> re-introduce one resource at a time to find out which one causes the
> > >>> MCU to lose its state. =20
> > >>
> > >> I already tried that too . I spent quite a while until I reached tha=
t L2
> > >> workaround in fact. =20
> > >=20
> > > So, with your RPM suspend/resume being NOPs, it still doesn't work?
> > > Unless the FW is doing something behind our back, I don't really see
> > > why this would fail on your platform, but not on the rk3588. Are you
> > > sure the power domains are kept on at all times. I'm asking, because =
if
> > > you linked all the PDs, the on/off sequence is automatically handled =
by
> > > the RPM core at suspend/resume time. =20
> >=20
> > I revisited this now.
> >=20
> > Can you please test the following patch (also attached) on one of your=
=20
> > devices, and tell me what the status is at the end . The diff sets the=
=20
> > GLB_HALT bit and then clears it again, which I suspect should first hal=
t=20
> > the GPU and (this is what I am unsure about) then again un-halt/resume=
=20
> > the GPU ?
>=20
> It doesn't work like that. What you're describing is like executing
> "shutdown" on your terminal and then typing "boot" on the keyboard
> after your computer has been shut down.
>=20
> >=20
> > "
> > diff --git a/drivers/gpu/drm/panthor/panthor_fw.c=20
> > b/drivers/gpu/drm/panthor/panthor_fw.c
> > index 9bf06e55eaeea..57c0d4fd29aa2 100644
> > --- a/drivers/gpu/drm/panthor/panthor_fw.c
> > +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> > @@ -1087,8 +1087,16 @@ void panthor_fw_pre_reset(struct panthor_device=
=20
> > *ptdev, bool on_hang)
> >   		struct panthor_fw_global_iface *glb_iface =3D=20
> > panthor_fw_get_glb_iface(ptdev);
> >   		u32 status;
> >=20
> > +pr_err("%s[%d] pre-halt status=3D%x\n", __func__, __LINE__,=20
> > gpu_read(ptdev, MCU_STATUS));
> > +
> >   		panthor_fw_update_reqs(glb_iface, req, GLB_HALT, GLB_HALT);
> >   		gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
> > +mdelay(100);
> > +pr_err("%s[%d] likely-halted status=3D%x\n", __func__, __LINE__,=20
> > gpu_read(ptdev, MCU_STATUS));
> > +		panthor_fw_update_reqs(glb_iface, req, 0, GLB_HALT);
> > +mdelay(100);
> > +pr_err("%s[%d] likely-running ? status=3D%x\n", __func__, __LINE__,=20
> > gpu_read(ptdev, MCU_STATUS));
> > +
> >   		if (!gpu_read_poll_timeout(ptdev, MCU_STATUS, status,
> >   					   status =3D=3D MCU_STATUS_HALT, 10,
> >   					   100000)) {
> > "
> >=20
> > In my case, the relevant output looks like this:
> >=20
> > "
> > [    3.326805] panthor_fw_pre_reset[1090] pre-halt status=3D1
> > [    3.432151] panthor_fw_pre_reset[1095] likely-halted status=3D2
> > [    3.542179] panthor_fw_pre_reset[1098] likely-running ? status=3D2
> > "
> >=20
> > That means, the GPU remains halted at the end, even if the "GLB_HALT"=20
> > bit is cleared before the last print. The clearing of GLB_HALT is also=
=20
> > what panthor_fw_post_reset() does.
>=20
> After the halt has been processed by the FW, the memory region where
> you check the halt status again is inert, since the micro-controller
> (MCU) supposed to update those bits is off at this point. The FW
> interface is really just a shared memory region between the CPU and
> MCU, nothing more.
>=20
> >=20
> > I suspect the extra soft reset I did before "un-halted" the GPU and=20
> > allowed it to proceed.
>=20
> Hm, not quite. I mean, you still need to explicitly boot the MCU after
> a reset, which is what the write to MCU_CONTROL [1] does. What the
> soft-reset does though, is reset all GPU blocks, including the MCU.
> This means the MCU starts from a fresh state when you reach [1].
>=20
> If I had to guess, I'd say something is messed up when the GPU is
> halted, and you need a soft-reset to recover from that. Unfortunately,
> I don't know enough about what your FW is doing to help. Maybe
> Arm/Freescale could...
>=20
> >=20
> > I wonder if there is some way to un-halt the GPU using some gpu_write()=
=20
> > direct register access, is there ?
>=20
> That's MCU_CONTROL, yes. And it's done here [1] already.
>=20
> > Maybe the GPU remains halted because=20
> > setting the GLB_HALT stops command stream processing, and the GPU never=
=20
> > samples the clearing of GLB_HALT and therefore remains halted forever ?
>=20
> Exactly that, and that's expected.

=46YI: in a new release of system manager software (starting from lf-6.12.3=
=2D1.0.0),
the GPU reset is reasserted in SM software already [1] and access to GPU
block control has been removed from Cortex-A [2]. Starting from B0 step this
version is required AFAIK.

Best regards
Alexander

[1] https://github.com/nxp-imx/imx-sm/commit/2dcc0409ede82eef54857be50daa58=
8b23b3ba7b
[2] https://github.com/nxp-imx/imx-sm/commit/a3e5da9ea51144f513ac3909fa151f=
a7df394100

=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


