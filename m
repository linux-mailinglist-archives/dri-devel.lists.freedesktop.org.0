Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 435573B5918
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 08:23:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5150689DA7;
	Mon, 28 Jun 2021 06:23:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA8DB89D83;
 Mon, 28 Jun 2021 06:23:37 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A375B22358;
 Mon, 28 Jun 2021 06:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624861415; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3f/RQ+o/NN1qA7MbgkBwKBo1UY1pJWjqF+CekEE7tvs=;
 b=jJM/B+QJ0HaTwqIYl1RXnmf+3kS01V89ycXtkk6p6XRsDI0f0fsSYWSMxuQjKP4pqQ0E+1
 s8MITUczcRX2a8uMHRISVlbqGN7L1AmLkau+jzoUaW2yOqZOzt5T1SrWObCQMTd+s9ffpr
 ATR41EBppViL088sYF/EuuEt0QBmJHs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624861415;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3f/RQ+o/NN1qA7MbgkBwKBo1UY1pJWjqF+CekEE7tvs=;
 b=NBW1kkaGRxLiRwOxNiLCHy+jTq7PDtH+lJSbjdqofRosiUym/h3BpEXG8WHWk0LKYIFlQF
 Iy0+1fzHScVjq3CA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 73EFC118DD;
 Mon, 28 Jun 2021 06:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624861415; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3f/RQ+o/NN1qA7MbgkBwKBo1UY1pJWjqF+CekEE7tvs=;
 b=jJM/B+QJ0HaTwqIYl1RXnmf+3kS01V89ycXtkk6p6XRsDI0f0fsSYWSMxuQjKP4pqQ0E+1
 s8MITUczcRX2a8uMHRISVlbqGN7L1AmLkau+jzoUaW2yOqZOzt5T1SrWObCQMTd+s9ffpr
 ATR41EBppViL088sYF/EuuEt0QBmJHs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624861415;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3f/RQ+o/NN1qA7MbgkBwKBo1UY1pJWjqF+CekEE7tvs=;
 b=NBW1kkaGRxLiRwOxNiLCHy+jTq7PDtH+lJSbjdqofRosiUym/h3BpEXG8WHWk0LKYIFlQF
 Iy0+1fzHScVjq3CA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id T4qyGuZq2WDleAAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Mon, 28 Jun 2021 06:23:34 +0000
Subject: Re: [PATCH v4 05/27] drm/armada: Don't set struct
 drm_device.irq_enabled
To: daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, james.qian.wang@arm.com,
 liviu.dudau@arm.com, mihail.atanassov@arm.com, brian.starkey@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, inki.dae@samsung.com,
 jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 krzysztof.kozlowski@canonical.com, xinliang.liu@linaro.org,
 tiantao6@hisilicon.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de, p.zabel@pengutronix.de,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, chunkuang.hu@kernel.org,
 matthias.bgg@gmail.com, bskeggs@redhat.com, tomba@kernel.org,
 hjc@rock-chips.com, heiko@sntech.de, yannick.fertre@foss.st.com,
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, wens@csie.org, jernej.skrabec@gmail.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com, jyri.sarha@iki.fi,
 emma@anholt.net, linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
 michal.simek@xilinx.com, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, linux@armlinux.org.uk,
 kieran.bingham+renesas@ideasonboard.com, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com
References: <20210625082222.3845-1-tzimmermann@suse.de>
 <20210625082222.3845-6-tzimmermann@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <57eb0ca1-e1a3-495e-926e-0d02634f096f@suse.de>
Date: Mon, 28 Jun 2021 08:23:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625082222.3845-6-tzimmermann@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="i2lHLYH7S6KjXfCFaxpWcKmmhZvcPmhxI"
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
Cc: linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--i2lHLYH7S6KjXfCFaxpWcKmmhZvcPmhxI
Content-Type: multipart/mixed; boundary="ZsJWMZ3fKnfvZTQNCUxxACBUzMa2385FX";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, james.qian.wang@arm.com,
 liviu.dudau@arm.com, mihail.atanassov@arm.com, brian.starkey@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, inki.dae@samsung.com,
 jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 krzysztof.kozlowski@canonical.com, xinliang.liu@linaro.org,
 tiantao6@hisilicon.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de, p.zabel@pengutronix.de,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, chunkuang.hu@kernel.org,
 matthias.bgg@gmail.com, bskeggs@redhat.com, tomba@kernel.org,
 hjc@rock-chips.com, heiko@sntech.de, yannick.fertre@foss.st.com,
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, wens@csie.org, jernej.skrabec@gmail.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com, jyri.sarha@iki.fi,
 emma@anholt.net, linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
 michal.simek@xilinx.com, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, linux@armlinux.org.uk,
 kieran.bingham+renesas@ideasonboard.com, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com
Cc: linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Message-ID: <57eb0ca1-e1a3-495e-926e-0d02634f096f@suse.de>
Subject: Re: [PATCH v4 05/27] drm/armada: Don't set struct
 drm_device.irq_enabled
References: <20210625082222.3845-1-tzimmermann@suse.de>
 <20210625082222.3845-6-tzimmermann@suse.de>
In-Reply-To: <20210625082222.3845-6-tzimmermann@suse.de>

--ZsJWMZ3fKnfvZTQNCUxxACBUzMa2385FX
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 25.06.21 um 10:22 schrieb Thomas Zimmermann:
> The field drm_device.irq_enabled is only used by legacy drivers
> with userspace modesetting. Don't set it in armada.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

R-b'ed by Laurent via IRC

> ---
>   drivers/gpu/drm/armada/armada_drv.c | 2 --
>   1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/arma=
da/armada_drv.c
> index dab0a1f0983b..4a64f1b9ec4d 100644
> --- a/drivers/gpu/drm/armada/armada_drv.c
> +++ b/drivers/gpu/drm/armada/armada_drv.c
> @@ -130,8 +130,6 @@ static int armada_drm_bind(struct device *dev)
>   	if (ret)
>   		goto err_comp;
>  =20
> -	priv->drm.irq_enabled =3D true;
> -
>   	drm_mode_config_reset(&priv->drm);
>  =20
>   	ret =3D armada_fbdev_init(&priv->drm);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--ZsJWMZ3fKnfvZTQNCUxxACBUzMa2385FX--

--i2lHLYH7S6KjXfCFaxpWcKmmhZvcPmhxI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDZauUFAwAAAAAACgkQlh/E3EQov+BI
/hAAwo/d/PjJfngTOTApUkdBmvqLyDR9l5V4s4HUVyGrzgf1k3ANJUoqAEBC0li07IImisiMhKK8
8wmGPIQHSU3aRLQy+IbasD12kuSAJXTiFc8KZ41WpXafVHPiumFm5LRhKTGDC9jw1NtbjnRpaJLR
qng3SVUTGFmAcFjzS4rm+eVvFy6d0S667p+A04vRcWLgMkmZJt8l6mM235cyRVKidi1aoejJLVCd
MgfPBD6QopEOl+KU3aggPK0b+iNk5I8vBTiSGosBFFNF1HAr6YjzyYodpHn1xX7Y9aUIPkoEYmIa
nhym33NotP/6vZJIedE3tHo92o1oRWlB6k36FdX4fRJBkcPoGVDOnm3Q7xZXDTV+bAEKGO4xy//z
FUK8NXmy1vNd5aAt7F2cQPNO0vq6pa0Se8GaIGteQqFbd2LfTdHaZHlEmNb6x+NA1r4uMoTKsbHd
XiGVGBFETOR3ElshkxJGL/aACPeELm/CxMYCCHVYOjakNn7MGDJmQyMlJyzPcEEelXCOOuO7HnOY
Meb9ovN73XEjZcxq4KzOS/sc5FpDU/Te6DQpjFKxKwudZaZrLMLuUypbmmlMP1o1G0hepbNe3rey
eFdvCeu1rBsor2Ae6ooTqoc4SdsyqzHnYfAvQuAkeWUBOW3fekUl8r0Viqxkv1BaYBgK4FW4pNLD
bu8=
=AJ6t
-----END PGP SIGNATURE-----

--i2lHLYH7S6KjXfCFaxpWcKmmhZvcPmhxI--
