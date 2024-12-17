Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6989F45AC
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 09:06:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E7A610E0D6;
	Tue, 17 Dec 2024 08:06:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X+vowBXn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24CD310E0D6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 08:06:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6566AA41D95;
 Tue, 17 Dec 2024 08:04:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0607FC4CED3;
 Tue, 17 Dec 2024 08:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734422800;
 bh=lezp6EOr1sTrbOd8jVW8DSk++wf4bf36AnptRA4PyH8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X+vowBXnjBaLUcuH3ZNTlxuYXFlQoFs+HB+3snpwxM1GcMu32ovTLikNU/IGawtnc
 r3cwON5Peqm4GfLiMitiu+BtPNNxdYI8go7HgZO2CYqt9dw1OWu9tKL71pWVzzY++4
 vZB2IcRIxWiznIJeOfvJzgWru5L9OGuWaUBz711FfpLvLU7lx3S95Jfwz57W8GzpM+
 28k3ygSVqpUKOCM03xWFzm7svkTDrNjht5c0paP7Y5FDr0ng6aTkQiUpTA3uN2vL2a
 swxqAfXJIO6wbed7cknFYAUCK3x/CJxvG2mIu2B1jqCZ4tLzKzFUY2JSUaoWL/DohT
 OvNixEsVkwTJg==
Date: Tue, 17 Dec 2024 09:06:37 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Sandor Yu <Sandor.yu@nxp.com>
Cc: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 festevam@gmail.com, 
 vkoul@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, 
 kernel@pengutronix.de, linux-imx@nxp.com, oliver.brown@nxp.com, 
 alexander.stein@ew.tq-group.com, sam@ravnborg.org
Subject: Re: [PATCH v20 5/9] drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
Message-ID: <20241217-judicious-stereotyped-centipede-5ddb27@houat>
References: <cover.1734340233.git.Sandor.yu@nxp.com>
 <fbd12029fab1f60e2ba4fad75ef650298a59cb15.1734340233.git.Sandor.yu@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="f3jzfinrd3s3htcj"
Content-Disposition: inline
In-Reply-To: <fbd12029fab1f60e2ba4fad75ef650298a59cb15.1734340233.git.Sandor.yu@nxp.com>
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


--f3jzfinrd3s3htcj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v20 5/9] drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
MIME-Version: 1.0

Hi,

On Tue, Dec 17, 2024 at 02:51:47PM +0800, Sandor Yu wrote:
> +static ssize_t firmware_version_show(struct device *dev,
> +				     struct device_attribute *attr, char *buf);
> +static struct device_attribute firmware_version = __ATTR_RO(firmware_version);
> +
> +ssize_t firmware_version_show(struct device *dev,
> +			      struct device_attribute *attr, char *buf)
> +{
> +	struct cdns_mhdp8501_device *mhdp = dev_get_drvdata(dev);
> +
> +	u32 version = readl(mhdp->base.regs + VER_L) | readl(mhdp->base.regs + VER_H) << 8;
> +	u32 lib_version = readl(mhdp->base.regs + VER_LIB_L_ADDR) |
> +			  readl(mhdp->base.regs + VER_LIB_H_ADDR) << 8;
> +
> +	return sprintf(buf, "FW version %d, Lib version %d\n", version, lib_version);
> +}
> +
> +static void cdns_mhdp8501_create_device_files(struct cdns_mhdp8501_device *mhdp)
> +{
> +	if (device_create_file(mhdp->dev, &firmware_version)) {
> +		DRM_ERROR("Unable to create firmware_version sysfs\n");
> +		device_remove_file(mhdp->dev, &firmware_version);
> +	}
> +}

sysfs files are part of the uABI, and need to be stable and documented.

For these kind of things, you should use debugfs.

Maxime

--f3jzfinrd3s3htcj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ2ExDQAKCRAnX84Zoj2+
dnc4AYCqAZF9d60JM6qP2gOgYAn6lAKF42a7J9At1vpspnjLkxWeo82wwxsVUN3q
dX1sPvsBf0FnUgCipeCjavvQGCADOKKD3bokWMMWhfpqBINEp3TxubYkPBBuPx7Q
x5ViCYwzhw==
=BgFt
-----END PGP SIGNATURE-----

--f3jzfinrd3s3htcj--
