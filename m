Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3A9CDD9D6
	for <lists+dri-devel@lfdr.de>; Thu, 25 Dec 2025 10:47:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F3D11B174;
	Thu, 25 Dec 2025 09:47:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lor0oDN7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D870011B174
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Dec 2025 09:47:22 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2a0a33d0585so61255805ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Dec 2025 01:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766656042; x=1767260842; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CJbqjKEBanMRME2GndVRpSufrs8pVvgREEbvcdz3cEc=;
 b=lor0oDN7alSOfoeHBXfQWc4RFzSFvcL7mRO0IH9LTQelAuR4/gAreUIolzU9XepcTn
 YUqazXrxd77lkfQzXbi85Q09H8yKO57yycvmTFsdElEej4PLUL5Zw1ppOv229NE+rGU3
 m28i4e5B99T9McnwU+HswgBBKUagoaiQMy0sUXYSELN0MRAiOvXijUckYIg/vyuqAJ/U
 ZZz++wm2ALLZlfGLFgs/tIaXfH72Y1eAi4x/QGvml0mVPBzJ+S0x8XnXLxy6D/WvOfgb
 SY5klBw8ttkn5hHXhB02q5cgO8MHlwubVBe64mCF7WU4jkkMOHkLMhhdvJ1n7YtUsjfQ
 piVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766656042; x=1767260842;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CJbqjKEBanMRME2GndVRpSufrs8pVvgREEbvcdz3cEc=;
 b=GWcBcQpFKPnN8OBKDD/bN1nZ0SfajQPvqX2WwXapmSnZbtitr55q9O+JWwoUH15zuC
 /k0Tvy7notf8grQZgg3FuhjbwqohQhD+9JBFCvIEFfyMRTohxdxSG0imB8GjEFDEvN1b
 NgnQ8sUg8MbnSBD7KiotP/ZCiRcPuBszPCr1Nfw5kLuSWDQETTGIsBH47YIzUujlEpwA
 e/bRQiHSNp/vAmFLQ4xazHUwksR8IUkekkbLgLYXe1JV/jBIwPuiTXhOobr3N9/Dc/9s
 Qx7O/KIrfLPy91DWQvNMs3N3zZ8B4OWI6w9zpz33BCHJ+889NRqhBfIVq+6nopyxC2RY
 ALkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoEw8pHxBwCbWQqQWq4MO8BhsYheOHp53aM4kaZZM3E2Lj71FmaoQKDld4iyZl6qwQxmT8yA/V3GI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw770TLPy5BItt5vmKGlVINTSwzDMF1AZX/eQedSFs7jBa2iLLa
 PlKlHMiQI+m0geG7P971pcV9Xdu3Ll6rpRMHNTkJtCotjtYWBvk7OaAK
X-Gm-Gg: AY/fxX6Al2ACyp+P4B552C8alBtW1mAtetCI8jG8Ps5aHsmjBZF/9VTQiNdl8lSCOLT
 RC8ZTOreSbLq96p37EGxnuJaEqfTSp2WZLjYiXChrIEhL/HSNuputbbCcMHGxK6s9W7VnZGDj/O
 EnKkHiwK+B9aTUoP1gbaDHGwEDj2lAv4I+w5plezoSk6TfRE/dxiAG+uJ0g2lRBCLMyF9Hygu8r
 5q56F/FnWk1aZQWEoHaktZMmLpzNPDAF43h3zBEopYcNE2l84YVauGHkqFSLdqnUOehdz3G163w
 MrgVPXBV1TqWm5JF2f8NXQp0qnxODJ7evSaEA/Uij2XRNJg+wTSmORbLZBwTPcQhzYasl6AkL6M
 MmcNLMeJnHNV15v0BjcrNgkEwXww2WGAaXmApsRFealXslX2Qxx8qGI3/yceVLVGbl2vnVquC2I
 ojV3bm/tVG4LXnZcd6vRK7bkLk/3FybxouMuZTw4hDY7BbvUGcMfsrxMXV24X8X3evyw2i2c7cl
 NlM7gapw+7CliTIgg==
X-Google-Smtp-Source: AGHT+IGqeIuBv9OWXNokteJpQ08DeKnV3oR28EBjTWNiLAcYj7iu6vP4q7amwT6MeNCYNytD88Eu2A==
X-Received: by 2002:a17:903:3b86:b0:295:5945:2930 with SMTP id
 d9443c01a7336-2a2f2205161mr202892715ad.2.1766656041808; 
 Thu, 25 Dec 2025 01:47:21 -0800 (PST)
Received: from smtpclient.apple (125x103x213x40.ap125.ftth.ucom.ne.jp.
 [125.103.213.40]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3c83961sm177814725ad.38.2025.12.25.01.47.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Dec 2025 01:47:21 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH v4 7/9] riscv: dts: thead: lichee-pi-4a: enable HDMI
From: "Han Gao (Revy)" <rabenda.cn@gmail.com>
In-Reply-To: <20251224161205.1132149-8-zhengxingda@iscas.ac.cn>
Date: Thu, 25 Dec 2025 17:47:04 +0800
Cc: "Han Gao (Revy)" <rabenda.cn@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>, Yao Zi <ziyao@disroot.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Icenowy Zheng <uwu@icenowy.me>
Content-Transfer-Encoding: quoted-printable
Message-Id: <EEB07B95-C9D7-4B8B-9FAD-105A0287CC6F@gmail.com>
References: <20251224161205.1132149-1-zhengxingda@iscas.ac.cn>
 <20251224161205.1132149-8-zhengxingda@iscas.ac.cn>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
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



> On Dec 25, 2025, at 00:12, Icenowy Zheng <zhengxingda@iscas.ac.cn> =
wrote:
>=20
> Lichee Pi 4A board features a HDMI Type-A connector connected to the
> HDMI TX controller of TH1520 SoC.
>=20
> Add a device tree node describing the connector, connect it to the =
HDMI
> controller, and enable everything on this display pipeline.
>=20
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
> Changes in v4:
> - Rebased on top of v6.19-rc1.
>=20
> No changes in v2, v3.
>=20
> .../boot/dts/thead/th1520-lichee-pi-4a.dts    | 25 +++++++++++++++++++
> 1 file changed, 25 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts =
b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> index c58c2085ca92a..7cb7d28683bce 100644
> --- a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> +++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> @@ -29,6 +29,17 @@ chosen {
> stdout-path =3D "serial0:115200n8";
> };
>=20
> + hdmi-connector {
> + compatible =3D "hdmi-connector";
> + type =3D "a";
> +
> + port {
> + hdmi_con_in: endpoint {
> + remote-endpoint =3D <&hdmi_out_con>;
> + };
> + };
> + };
> +
> thermal-zones {
> cpu-thermal {
> polling-delay =3D <1000>;
> @@ -121,6 +132,20 @@ rx-pins {
> };
> };
>=20
> +&dpu {
> + status =3D "okay";
> +};
> +
> +&hdmi {
> + status =3D "okay";
> +};
> +
> +&hdmi_out_port {
> + hdmi_out_con: endpoint {
> + remote-endpoint =3D <&hdmi_con_in>;
> + };
> +};
> +
> &uart0 {
> pinctrl-names =3D "default";
> pinctrl-0 =3D <&uart0_pins>;
> --=20
> 2.52.0
>=20
Tested-by: Han Gao <gaohan@iscas.ac.cn>=
