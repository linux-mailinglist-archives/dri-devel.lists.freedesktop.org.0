Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6171BA07473
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 12:17:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6220F10ED6E;
	Thu,  9 Jan 2025 11:17:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=sjoerd@collabora.com header.b="WxtasFGf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D654E10ED6E
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 11:17:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1736421472; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=FU5KSMf263TKumyWxFMqLfNE+cFtnJw2a8dV5Kh2qp5JpedheEaovznh0fS4U5LktiWX89afhauEQR8N9h8F/0lgsDWftj7fqAQ7R2w5h18W8hCY4NLeFqxyV8WZqg7YtCmYbUYXyXiG5QhODZ9CXrKVlTRSp4Bjkg2S1stEPfo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1736421472;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=MTgw6gbVtvZdS5LhGt1QizBU8c5RNoZ7cW3EzXYxH7A=; 
 b=MAZnIEhEOymSuKYFA3wL+4r+D/u7nQpnIIgVcFfVTAhsI3KtXySW98jYJTBZ/XREHXZqcJayW9pXtdvf/c0TQFxNY7CbeEadT7vhfC0F4C5W1MY1zlDloCbL1LnB7lB93n1ESFNfPmfdEkDj32MQPzRHi3OCn9CkDa/uue0hSpE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=sjoerd@collabora.com;
 dmarc=pass header.from=<sjoerd@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736421472; 
 s=zohomail; d=collabora.com; i=sjoerd@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=MTgw6gbVtvZdS5LhGt1QizBU8c5RNoZ7cW3EzXYxH7A=;
 b=WxtasFGfhUpiFmmRjWGErQ7dGMIsN2BuA3gSex+y2+dlVrD0jx5rWgUFcC0OpR9f
 1ZvJkb50leCAyqUWv1+5S+mzdw5BiBAmZe6j0lgYPu2KcJ0Cyv2KzlrbxobIAok33Xl
 HLPwQ9SpBvAwtkxaIkCQTdSOLq+rsWzyqJdV/bQo=
Received: by mx.zohomail.com with SMTPS id 1736421470387292.3010936205511;
 Thu, 9 Jan 2025 03:17:50 -0800 (PST)
Message-ID: <4c0561dfe414720c979058802cc2930c9d0c08fb.camel@collabora.com>
Subject: Re: [PATCH v6 6/6] arm64: dts: mediatek: add display support for
 mt8365-evk
From: Sjoerd Simons <sjoerd@collabora.com>
To: Alexandre Mergnat <amergnat@baylibre.com>, Chun-Kuang Hu	
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann	 <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Rob Herring	 <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley	 <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Jitao Shi
 <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>,  Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Simona Vetter
 <simona@ffwll.ch>,  Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Date: Thu, 09 Jan 2025 12:17:44 +0100
In-Reply-To: <20231023-display-support-v6-6-c6af4f34f4d8@baylibre.com>
References: <20231023-display-support-v6-0-c6af4f34f4d8@baylibre.com>
 <20231023-display-support-v6-6-c6af4f34f4d8@baylibre.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3-1 
MIME-Version: 1.0
X-ZohoMailClient: External
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

On Thu, 2025-01-09 at 11:37 +0100, Alexandre Mergnat wrote:
> MIPI DSI:
> - Add "vsys_lcm_reg" regulator support and setup the
> "mt6357_vsim1_reg",
> to power the pannel plugged to the DSI connector.
> - Setup the Display Parallel Interface.
> =C2=A0 - Add the startek kd070fhfid015 pannel support.
>=20
> HDMI:
> - Add HDMI connector support.
> - Add the "ite,it66121" HDMI bridge support, driven by I2C1.
> - Setup the Display Parallel Interface.
>=20
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
> =C2=A0arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 236
> ++++++++++++++++++++++++++++
> =C2=A01 file changed, 236 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> index 7d90112a7e27..70bd49a9d02f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> [...]
> @@ -131,6 +156,88 @@ &cpu3 {
> =C2=A0	sram-supply =3D <&mt6357_vsram_proc_reg>;
> =C2=A0};
> =C2=A0
> +&dither0_out {
> +	remote-endpoint =3D <&dsi0_in>;
> +};
> +
> +&dpi0 {
> +	pinctrl-0 =3D <&dpi_default_pins>;
> +	pinctrl-1 =3D <&dpi_idle_pins>;
> +	pinctrl-names =3D "default", "sleep";

Would be good to document that these pins clash with ethernet support,
similar to what is done in the ethernet node.  Also some notes on what
nodes to enable/disable when selecting either ethernet or hdmi output
would be appreciated :)


--=20
Sjoerd Simons <sjoerd@collabora.com>
Collabora
