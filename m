Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB369A376F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 09:42:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AFDD10E8BD;
	Fri, 18 Oct 2024 07:41:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="eHURhya2";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="KYUiEjmD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC7010E8BD
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 07:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1729237318; x=1760773318;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GTYHCV2IcBd0xtopUr2yV5NfEZy3fDfq239jjxc9ssQ=;
 b=eHURhya2ivLojoUeGL/ug3o5YYrH1NT6GZKd88AhslD4Ix2qQekRvCP1
 hxorsTQ12sbmNg89HON876/kJIaXZCFn2LowV68UPGWB8vdziXkus/TeH
 THFMwNB/PyTO8pI4IpBbUeoU20i+oEpKgaqToZkkROURmgajY4wcPlli6
 MZIeRJuCNDX93CqgRoIC0H9MtcWOPn8Aecz14Am+x1ufTq3WfxT43MrYz
 4cho7+9kZv86mkHEgdJSPJYb9P7t24X5J7lk3tpTVELIvVDSbdHFegwdP
 gj9EK7N4COMtnAz5IEEe93TKM03Ah3aklVak7G18DpQL67OEia6cBD9P0 g==;
X-CSE-ConnectionGUID: JDvEIM/JTvyg9kRHgFH8Lw==
X-CSE-MsgGUID: gsg2AY9iT3K8jCMjjxfJ4A==
X-IronPort-AV: E=Sophos;i="6.11,213,1725314400"; d="scan'208";a="39535090"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 18 Oct 2024 09:41:56 +0200
X-CheckPoint: {67121144-16-BD84CFBF-E7C15A70}
X-MAIL-CPID: DDF101AC2D2D066EB06111F8D38943D0_3
X-Control-Analysis: str=0001.0A682F26.67121144.007E, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8F7D0170261; Fri, 18 Oct 2024 09:41:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1729237311;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=GTYHCV2IcBd0xtopUr2yV5NfEZy3fDfq239jjxc9ssQ=;
 b=KYUiEjmDXQTfDhwZj94YwgGMTYGbP9sNMRgGLlLz2pZKVVWcWcdJsxm3YDZToP3e3Ixf2L
 5rnnT7+vcdaLhO0T4vJM/k09aurI98KVdRQPQ0gikv955efXVM/0ItgV56F9r3ys+FcLeZ
 Iit3G+pr6lbsIJjXXxOL1beiKYTbkLvZS2KcVXFt5kgRhTNoyVGeCJJbl//8lJCsq/3vbd
 Kk4mHYHIQLmjLl1eKmlgbXJrepGYOLVZtsP2iQuyrpCgbVl8Gw+KxBTVmH4vVh70It1rZq
 M/mTDM8ko+BczKgC9EkGYu6u6bu9QmZnEN35BUzKUWjAKF4XGyobPmSfkVcRMA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 marex@denx.de, stefan@agner.ch, dmitry.baryshkov@linaro.org,
 Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH 3/5] arm64: dts: imx8mp-msc-sm2s-ep1: Add HDMI connector
Date: Fri, 18 Oct 2024 09:41:50 +0200
Message-ID: <15311928.tv2OnDr8pf@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20241018064813.2750016-4-victor.liu@nxp.com>
References: <20241018064813.2750016-1-victor.liu@nxp.com>
 <20241018064813.2750016-4-victor.liu@nxp.com>
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

Am Freitag, 18. Oktober 2024, 08:48:11 CEST schrieb Liu Ying:
> Add a HDMI connector to connect with i.MX8MP HDMI TX output.
> This is a preparation for making the i.MX8MP LCDIF driver use
> drm_bridge_connector which requires the DRM_BRIDGE_ATTACH_NO_CONNECTOR
> flag.  With that flag, the DW HDMI bridge core driver would
> try to attach the next bridge which is the HDMI connector.
>=20
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Looks similar to imx8mp-tqma8mpql-mba8mpxl.dts, so:
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  .../dts/freescale/imx8mp-msc-sm2s-ep1.dts     | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dts b/arch=
/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dts
> index 83194ea7cb81..b776646a258a 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dts
> @@ -15,6 +15,17 @@ / {
>  		     "avnet,sm2s-imx8mp-14N0600E", "avnet,sm2s-imx8mp",
>  		     "fsl,imx8mp";
> =20
> +	hdmi-connector {
> +		compatible =3D "hdmi-connector";
> +		type =3D "a";
> +
> +		port {
> +			hdmi_in: endpoint {
> +				remote-endpoint =3D <&hdmi_tx_out>;
> +			};
> +		};
> +	};
> +
>  	reg_vcc_3v3_audio: 3v3-audio-regulator {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "VCC_3V3_AUD";
> @@ -54,6 +65,14 @@ &hdmi_tx {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_hdmi>;
>  	status =3D "okay";
> +
> +	ports {
> +		port@1 {
> +			hdmi_tx_out: endpoint {
> +				remote-endpoint =3D <&hdmi_in>;
> +			};
> +		};
> +	};
>  };
> =20
>  &hdmi_tx_phy {
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


