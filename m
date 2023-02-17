Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC05269A6B7
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 09:18:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B8910EEFA;
	Fri, 17 Feb 2023 08:18:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DED210EEFA
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 08:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1676621909; x=1708157909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FjGA5EgNa4NYOuHwjtG2x3GPMclXf8S24b/yy7KMZGM=;
 b=kSQy9/WNxWzdiCnvPHRnYXmaW8veRWmVJwudaDVXxsvMtEmhMcKdQ71h
 PdDDNfod3VAaL77bpo2vSTPbk7lXaFX4f031pQN0Kyf5sxSDIrNKg0rE2
 cbf7JD8KDWZ+Gk/MLUq9GkxUDbSS8GaqHR+9DBqV8TbynYJSmWQtpYJc0
 q1lPJy4B0XSrQS8Z5AeiDNK1XwhegKiMLcl8lJ+4LrevUlDofyZBWKX4W
 n2qlGV9a4Iy53oGbmbwlhv2zJOnbkQzNWnE1OpEjlH2iLdeJQH3MhYy7M
 8kM85J/iecFhwKOuUFCSY9P24IDKqMD4P7psFYiEnmW5jjqNbvj+93jYZ Q==;
X-IronPort-AV: E=Sophos;i="5.97,304,1669071600"; d="scan'208";a="29148279"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 17 Feb 2023 09:18:25 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Fri, 17 Feb 2023 09:18:26 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Fri, 17 Feb 2023 09:18:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1676621906; x=1708157906;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FjGA5EgNa4NYOuHwjtG2x3GPMclXf8S24b/yy7KMZGM=;
 b=UjsfVGJ1VaKZwlcqrObDgkBGxR9tOwzlStTRa58KQ2Zfhauj780BDWQa
 livcGZk9glmf6FXHT2fovqzrd2Y6A73VMw9Huvik6Kr04aBfzxIII2Tyq
 3AOb789By1KAwKEnql+FptnEeZKWZeinWNZhctdBCFNHXmCl1hbqC+U20
 F/RfY9V6FnAjpGzaCgP8/BrDGcrF+5euzsbWIDW0IMATSeyHr5xPAENLs
 m02f0bGpDXApzvbZnRVnU6s/foeDOAU+SGNgDM+cXKAZzpvTB2sUurYJh
 Y6dIGp/0VzHYs4X0q/ttyQuYDOKFO0BQZI2K9CnnSj2M+MhUWCkCqfvz8 Q==;
X-IronPort-AV: E=Sophos;i="5.97,304,1669071600"; d="scan'208";a="29148255"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 17 Feb 2023 09:18:04 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 346C5280056;
 Fri, 17 Feb 2023 09:18:03 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v4 0/6] drm: lcdif: Add i.MX93 LCDIF support
Date: Fri, 17 Feb 2023 09:18:00 +0100
Message-ID: <13207614.uLZWGnKmhe@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230217065407.2259731-1-victor.liu@nxp.com>
References: <20230217065407.2259731-1-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: marex@denx.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 krzysztof.kozlowski@linaro.org, robh+dt@kernel.org, linux-imx@nxp.com,
 krzysztof.kozlowski+dt@linaro.org, kernel@pengutronix.de,
 LW@karo-electronics.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Liu,

Am Freitag, 17. Februar 2023, 07:54:01 CET schrieb Liu Ying:
> Hi,
>=20
> This patch set aims to add i.MX93 LCDIF display controller support
> in the existing LCDIF DRM driver.  The LCDIF embedded in i.MX93 SoC
> is essentially the same to those embedded in i.MX8mp SoC.  Through
> internal bridges, i.MX93 LCDIF may drive a MIPI DSI display or a LVDS
> display or a parallel display.
>=20
> Patch 1/6 adds device tree binding support for i.MX93 LCDIF in the
> existing fsl,lcdif.yaml.
>=20
> Patch 2/6 drops lcdif->bridge NULL pointer check as a cleanup patch.
>=20
> Patch 3/6~5/6 prepare for adding i.MX93 LCDIF support step by step.
>=20
> Patch 6/6 adds i.MX93 LCDIF compatible string as the last step of
> adding i.MX93 LCDIF support.

Thanks for the series. I could test this on my TQMa93xxLA/MBa93xxCA with a=
=20
single LVDS display attached, so no DSI or parallel display. Hence I could =
not=20
test the bus format and flags checks, but they look okay.
So you can add
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
to the whole series as well.

One thing I noticed is that, sometimes it seems that before probing lcdif m=
y=20
system completely freezes. Adding some debug output it seems that's during=
=20
powering up the IMX93_MEDIABLK_PD_LCDIF power domain there is some race=20
condition. But adding more more detailed output made the problem go away.
Did you notice something similar? It might be a red hering though.

Best regards,
Alexander

>=20
> v3->v4:
> * Improve warning message when ignoring invalid LCDIF OF endpoint ids in
>   patch 5/6. (Alexander)
> * Use 'new_{c,p}state' instead of 'new_{crtc,plane}_state' in patch 3/6.
>   (Alexander)
> * Simplify lcdif_crtc_reset() by calling lcdif_crtc_atomic_destroy_state()
>   in patch 3/6. (Alexander)
> * Add '!crtc->state' check in lcdif_crtc_atomic_duplicate_state() in patch
> 3/6. (Alexander)
> * Collect Alexander's R-b tags on patch 1/6, 2/6 and 6/6.
>=20
> v2->v3:
> * Fix a trivial typo in patch 6/6's commit message.
>=20
> v1->v2:
> * Add Krzysztof's A-b and Marek's R-b tags on patch 1/6.
> * Split patch 2/2 in v1 into patch 2/6~6/6 in v2. (Marek, Alexander)
> * Drop '!remote ||' from lcdif_attach_bridge(). (Lothar)
> * Add comment on the 'base' member of lcdif_crtc_state structure to
>   note it should always be the first member. (Lothar)
> * Drop unneeded 'bridges' member from lcdif_drm_private structure.
> * Drop a comment about bridge input bus format from
> lcdif_crtc_atomic_check().
>=20
> Liu Ying (6):
>   dt-bindings: lcdif: Add i.MX93 LCDIF support
>   drm: lcdif: Drop unnecessary NULL pointer check on lcdif->bridge
>   drm: lcdif: Determine bus format and flags in ->atomic_check()
>   drm: lcdif: Check consistent bus format and flags across first bridges
>   drm: lcdif: Add multiple encoders and first bridges support
>   drm: lcdif: Add i.MX93 LCDIF compatible string
>=20
>  .../bindings/display/fsl,lcdif.yaml           |   7 +-
>  drivers/gpu/drm/mxsfb/lcdif_drv.c             |  71 ++++++-
>  drivers/gpu/drm/mxsfb/lcdif_drv.h             |   5 +-
>  drivers/gpu/drm/mxsfb/lcdif_kms.c             | 198 ++++++++++++------
>  4 files changed, 206 insertions(+), 75 deletions(-)


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


