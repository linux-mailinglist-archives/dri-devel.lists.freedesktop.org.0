Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9722725D07
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 13:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7445910E010;
	Wed,  7 Jun 2023 11:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1460310E010
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 11:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1686137167; x=1717673167;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UJ0w8BpCjcEmC52cpko3XJO+ZUaO7AuGxzmBlky0Tpw=;
 b=i06toXLpS0Jk3Xw9nS+F5CbPHG5Up3brKcdsg4no/iIzVK6qh8I13YxN
 zJQXPFLpyZHKbaTNScR0BMsSquDRHn5vc7Wu3C+Bd95wf4i+2IVoQ5uVX
 DKnBZQVE8od6XVP92An7FisnkWyHDfZa0LoFglpqUG2eC5+VB0HtNQIih
 O40hCY/ZJxjM+uXk+Cu9QrEnbMf1bugTURkl5FRwEVH0cQ+sKViSONbpA
 C8jUHZ97+07zuhcE5a/GvtyK8zCcYoPaRlYws7HIYOlYafqgzHXnfBwks
 d/snRTdjrMl2Zyp5HOjNbEtz4/ZghR3qnM4/D9WzqOP8Z5WaWSl0ArsSo Q==;
X-IronPort-AV: E=Sophos;i="6.00,223,1681164000"; d="scan'208";a="31328144"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 07 Jun 2023 13:26:04 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Wed, 07 Jun 2023 13:26:04 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Wed, 07 Jun 2023 13:26:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1686137164; x=1717673164;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UJ0w8BpCjcEmC52cpko3XJO+ZUaO7AuGxzmBlky0Tpw=;
 b=CDVbpcpKY9vgTvbEQNWOmI9ItS1j134DEobaOoygqjqkt7h2NVoLl+a0
 EKZkCdgE+HZ4hB8qmnGysAtxBUNmytClP7LcIb8kp9pdt/a/76/WywWoc
 +8eOwS+VJq0H8GuZRf0j2uVOAgibHqbRjzBvgnOGk1Exfy1j1WJftXmfx
 Mxf6H2jfed1qNQacsqm4lQ0mUVIphA0/Hi07uWno1BHSkzdfRMZ4uvlBi
 Si4Ref+vDJEBCwWPloMlNRx61l51XxzOWL1YnunDhdE5sa6KH2jFTO42R
 fx5CCwtPFT5YSWZohOazRHnNUWQd71DgP/YezFsCGNFhGg1Yc8dplJUx5 A==;
X-IronPort-AV: E=Sophos;i="6.00,223,1681164000"; d="scan'208";a="31328143"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 07 Jun 2023 13:26:04 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id DA371280090;
 Wed,  7 Jun 2023 13:26:03 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/1] drm/bridge: Silence error messages upon probe deferral
Date: Wed, 07 Jun 2023 13:26:03 +0200
Message-ID: <12222903.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230606151229.GF7234@pendragon.ideasonboard.com>
References: <20230606144833.776646-1-alexander.stein@ew.tq-group.com>
 <20230606151229.GF7234@pendragon.ideasonboard.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

Am Dienstag, 6. Juni 2023, 17:12:29 CEST schrieb Laurent Pinchart:
> Hi Alexander,
>=20
> Thank you for the patch.
>=20
> On Tue, Jun 06, 2023 at 04:48:33PM +0200, Alexander Stein wrote:
> > When -EPROBE_DEFER is returned do not raise an error, but silently retu=
rn
> > this error instead. Fixes error like this:
> > [drm:drm_bridge_attach] *ERROR* failed to attach bridge
> > /soc@0/bus@30800000/mipi-dsi@30a00000 to encoder None-34: -517
> > [drm:drm_bridge_attach] *ERROR* failed to attach bridge
> > /soc@0/bus@30800000/mipi-dsi@30a00000 to encoder None-34: -517
> >=20
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > dev_err_probe() would be the best, but I am not sure if this function is
> > always used within a driver's probe() call.
> >=20
> >  drivers/gpu/drm/drm_bridge.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > index c3d69af02e79d..07773d6441a1f 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -350,6 +350,7 @@ int drm_bridge_attach(struct drm_encoder *encoder,
> > struct drm_bridge *bridge,>=20
> >  	bridge->encoder =3D NULL;
> >  	list_del(&bridge->chain_node);
> >=20
> > +	if (ret !=3D -EPROBE_DEFER) {
> >=20
> >  #ifdef CONFIG_OF
> > =20
> >  	DRM_ERROR("failed to attach bridge %pOF to encoder %s: %d\n",
> >  =09
> >  		  bridge->of_node, encoder->name, ret);
>=20
> Wrong indentation.

Ah, right. Thanks for pointing out.

> dev_err_probe() could be useful, but this function is likely not called
> from probe paths only :-S

I was afraid this might be the cause. But I'm wondering in which situation=
=20
this can be the case, hence -EPROBE_DEFER could be returned then.

> When not called from a probe path, dropping the message will result in a
> silent error, which would be hard to debug :-(

On the other hand -EPROBE_DEFER is invalid on non-probe path also.
Assuming dev_err_probe is used here, an error will still be raised, -
EPROBE_DEFER should not occur then.

Best regards,
Alexander

> > @@ -357,6 +358,7 @@ int drm_bridge_attach(struct drm_encoder *encoder,
> > struct drm_bridge *bridge,>=20
> >  	DRM_ERROR("failed to attach bridge to encoder %s: %d\n",
> >  =09
> >  		  encoder->name, ret);
> > =20
> >  #endif
> >=20
> > +	}
> >=20
> >  	return ret;
> > =20
> >  }


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


