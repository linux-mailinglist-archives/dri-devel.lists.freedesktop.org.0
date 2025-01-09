Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF13A073B0
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 11:49:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B06610ED5C;
	Thu,  9 Jan 2025 10:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="fsSNmHPI";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="kIxlrJyl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F364D10ED5C
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 10:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1736419763; x=1767955763;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tVp/68k41NkFcAhuu7KioYy3MSHOTjh5xj32/pjsGg4=;
 b=fsSNmHPIZ+txES3MSl2AclDcDQZa+ZrnyOQgJNwrtgVn3rbg4M0hR0Ey
 fzSynPq6trDbezhlVUHLbj8eeg7C6jH3LWU9arOTUPcPRs4KHggC4lHMG
 s4AiDoOiqwKOI0ef3ppnojWmkjFtPEIGBcwYHdN3rQZqbvohk5YWu0uBv
 +9XAHy50amB2Xp907LAZvZOpRyZ2nenX7pzcJuFPxumSv/huSF99STnQ+
 k69nePDH30dYINODVRPr72Scu/DqNyt3CEsLU3LF12iqrrbzYsKedNR74
 jX9Y7zw9GkOA3peqJJuQ7T/QC6HcQ+XT33ZkvEbTKRfEhx/qSqePHItq+ Q==;
X-CSE-ConnectionGUID: fA/fH8SWQ86/Mj4HifBiqw==
X-CSE-MsgGUID: X6CWfte9SgCHKg57VIV8lw==
X-IronPort-AV: E=Sophos;i="6.12,301,1728943200"; d="scan'208";a="40947954"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 09 Jan 2025 11:49:20 +0100
X-CheckPoint: {677FA9B0-28-C6D8D88D-F91F9E6B}
X-MAIL-CPID: 18EC4340A80C5DF26CABB0818066624A_2
X-Control-Analysis: str=0001.0A682F29.677FA9B1.0063, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5A721168153; Thu,  9 Jan 2025 11:49:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1736419756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tVp/68k41NkFcAhuu7KioYy3MSHOTjh5xj32/pjsGg4=;
 b=kIxlrJylsUFKd9k4Ug86GqQ8f1FamKE6IjXoic8MT26rz0nZAbIK7svuRMcr3ki5JDpbus
 NetzVPx9ArCf5zpUoAIrw654dEfrLbkpVbzDlAB/xBo2yN73oIJ5/fJ99j0kW6wsZcZ4Vl
 MLYHMAYphVJZxFvfon/b0XxLJxRjAFYOhO5RuRf4V2XzLtOAT0mLBzPAU2qBnuthDicWFh
 eNvHZEjxTvJ2XUaAp2tCDJfy0Jh8tAvcYUqvNnECT3Kn/LtrMm4MdNIvFVloCsqYk6cmNn
 2pOc/pEdvKQCm0e+u0iXvV6F65J6rLYvCJ3yowc5taUUNwZm1FhqzoRB3uNadg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 3/3] drm: bridge: ti-sn65dsi83: Add error recovery
 mechanism
Date: Thu, 09 Jan 2025 11:49:13 +0100
Message-ID: <15398572.tv2OnDr8pf@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250108184442.64f38fbc@bootlin.com>
References: <20250108101907.410456-1-herve.codina@bootlin.com>
 <115787605.nniJfEyVGO@steina-w> <20250108184442.64f38fbc@bootlin.com>
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

Hi Herve,

Am Mittwoch, 8. Januar 2025, 18:44:42 CET schrieb Herve Codina:
> Hi Alexander,
>=20
> On Wed, 08 Jan 2025 11:54:49 +0100
> Alexander Stein <alexander.stein@ew.tq-group.com> wrote:
>=20
> [...]
> > >  #include <drm/drm_atomic_helper.h>
> > >  #include <drm/drm_bridge.h>
> > > +#include <drm/drm_drv.h> /* DRM_MODESET_LOCK_ALL_BEGIN() needs drm_d=
rv_uses_atomic_modeset() */ =20
> >=20
> > Shouldn't this include be added to include/drm/drm_modeset_lock.h inste=
ad?
>=20
> Yes indeed. I will change that in the next iteration.
>=20
> >=20
> > >  #include <drm/drm_mipi_dsi.h>
> > >  #include <drm/drm_of.h>
> > >  #include <drm/drm_panel.h>
> > > @@ -147,6 +150,9 @@ struct sn65dsi83 {
> > >  	struct regulator		*vcc;
> > >  	bool				lvds_dual_link;
> > >  	bool				lvds_dual_link_even_odd_swap;
> > > +	bool				use_irq;
> > > +	struct delayed_work		monitor_work;
> > > +	struct work_struct		reset_work; =20
> >=20
> > Can you please rebase? You are missing commit d2b8c6d549570
> > ("drm/bridge: ti-sn65dsi83: Add ti,lvds-vod-swing optional properties")
>=20
> Sure, I will rebase.
>=20
> [...]
> > > +static void sn65dsi83_handle_errors(struct sn65dsi83 *ctx)
> > > +{
> > > +	unsigned int irq_stat;
> > > +	int ret;
> > > +
> > > +	/*
> > > +	 * Schedule a reset in case of:
> > > +	 *  - the bridge doesn't answer
> > > +	 *  - the bridge signals an error
> > > +	 */
> > > +
> > > +	ret =3D regmap_read(ctx->regmap, REG_IRQ_STAT, &irq_stat);
> > > +	if (ret || irq_stat)
> > > +		schedule_work(&ctx->reset_work); =20
> >=20
> > Shouldn't you clear the error bits as well?
>=20
> Thanks for pointing that.
>=20
> I can clear the error bit but further more, I probably need to simply
> disable the interrupt.
>=20
> In some cases, we observed i2c access failure. In that cases clearing err=
or
> bits is simply not possible.
>=20
> To avoid some possible interrupt storms (the chip detect a failure, set i=
ts
> interrupt line but could be not accessible anymore), the best thing to do
> is to disable the interrupt line here, let the reset work to do its job
> performing a full reset of the device and re-enabling the interrupt line
> when needed, probably in sn65dsi83_atomic_enable().
>=20
> What do you think about that?

As I read the datasheet this is a active-high level interrupt, so as
long as some enabled IRQs are pending the signal will stay high.
There are 3 notes in section 9.1.3. IRQ usage that in various situations
IRQ bits may be set/pending and have to be cleared.
At least clear the interrupts before enabling it again to be on the
safe side.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


