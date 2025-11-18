Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 781C4C6A198
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 15:51:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E557210E1A4;
	Tue, 18 Nov 2025 14:50:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="P2J9qMnh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7DA10E1A4
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 14:50:58 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-b72b495aa81so718955266b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 06:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763477457; x=1764082257; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4ODEp5g3hoBFXtgMG8yLHQj2oAfrtxXSdzqfcf/5l9M=;
 b=P2J9qMnhGmA4TmqbSXFKoObFcm3kk1GJZvXBtdsxUDkugventu9bI1OospMAII9IL0
 xjcn9YO04/WgsvttwIRLCKb8ZJXJT4uvU20tOiYclypGUho5CM9Ai05IwkoX5dQhR+ze
 OCkJCWIT1HZz5MaqqmHZcT1HTrXAJw7SJwHZS4DqRak+LzPNdbAvcJS215o/ssUy+bXJ
 aJxhns5mlYtc6alaTUockds3dPecH7BhOF4gjp8ZugaIc/ReRiH+h11rYBJK97YuqL0/
 MKsRf0gtYNfingm5XkxbmV41dIqaxUhuH50tIB+0kCLiZb2oK++J2B8Z7OfCUIR6dQUe
 X1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763477457; x=1764082257;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4ODEp5g3hoBFXtgMG8yLHQj2oAfrtxXSdzqfcf/5l9M=;
 b=TtV5r8hC073gVu07u7mSybi9nJY+VTgaRbAtIACwCm3U7punrDenmwgJ5kHQfTu6C8
 ye/USx2j5T54KLTUOlsPyiF25MFPUUKxiXoS9tghbhloqQa60bVb0GZkipYOvwN3raQR
 CLBClClTzejDDR33u/jiQ64wRRmzueyTozCmcXQ2uTsh1wKVOpQmquqhof19fwqH2g+j
 v20K7c9LmzjJIS55stFAt72qr+6Lyyc75AFLGAX+WMn1/QXSE7h4A9zN5zJBaaN83vPh
 VBzn8UrhYz1C1N6xhGbKz4mU0YhGHRQgkxpHpxIPV0h1Dq8Le3MVvhvRwqD90OB/DRIo
 jsmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDulG7NkmHC08FxdiQkMcocZcnPMqqEqdOPjGeFE69FNxT9IbtBDZ29UwlyBbrnZWEx88EF3QHPc8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6PLIsTLdFKcIOlV2Yy+xZ4TGpc8u72zVkJt17KrZVSsrGCdUp
 YM3Za5Im8/3ICthAgaMUw1QIzOjwwwZJtrLgBdoEC5zV89uuPMEurhU5
X-Gm-Gg: ASbGncsmSvgApIw/C1XoRBNGMFtLtotNe/HhXbYjphTnrz/S7YpQrUsymYr7GmKzzAI
 vXyHuFEjFb8R0k3r2LITAi6Pulj0SRpqsXk9Ttgl6UX6Iykt1ZAgz+3F6dBM30n9hhz9kt/pDGk
 HRCrUvNQ0Q9f+mrjM/HcEH9Y5bY7geZOm/uBEid0N6fW6wVZQYdEzGf49GeA5UXdbjFpXvpRIPa
 VzvIgdV6MeGyfsqBLp4Wygjojp0pBrGP4+4rs24DvGitQqeAey668w9LZS9fCSP9eTcdS2C14/J
 ORDNV2xFC4xgWWgf6PmQ/NAkAFN8iD+jMCcbqZ/iuzV9Qx7jGrCbBKE0IU62tw35FKI5pJ97a+q
 q/lw/oxiNOAPAllsoqZv1lQr8865wv3hYQZtJonyUXSQv0CH28X2dBpA+qeR++JD99AFXlJYHTb
 XiG9fxY2njXtsvAyZ47e84rv5JMPHR47DYo07wjVKNWlOBIi1RqQSCgi9YYU+cl5CQKcNqg0WUL
 KE=
X-Google-Smtp-Source: AGHT+IEbPgDVza8qfJZo3JEw3mI76xfM7nycUKDaL0NKUdHMgMx7hzlIugTLL9c0WovJWHk2SHXoCA==
X-Received: by 2002:a17:907:5c9:b0:b73:5b9a:47c7 with SMTP id
 a640c23a62f3a-b736795d4aemr1818872166b.51.1763477456662; 
 Tue, 18 Nov 2025 06:50:56 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.play.pl.
 [89.66.237.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fd809absm1372003166b.44.2025.11.18.06.50.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Nov 2025 06:50:56 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 01/11] dt-bindings: display: meson-dw-hdmi: Add compatible
 for S4 HDMI controller
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20250110-drm-s4-v1-1-cbc2d5edaae8@amlogic.com>
Date: Tue, 18 Nov 2025 15:50:43 +0100
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <3AC316FA-A633-4B6C-81BA-CCCA290E7F03@gmail.com>
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
 <20250110-drm-s4-v1-1-cbc2d5edaae8@amlogic.com>
To: ao.xu@amlogic.com
X-Mailer: Apple Mail (2.3826.700.81)
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

Ao,

Is there any chance to get this s4 drm hdmi series for current 6.18?

(i tried backport this series to 6.18 but have some issues with reparent =
vpu_0_sel to sysclk_b_sel)
  =20


> Wiadomo=C5=9B=C4=87 napisana przez Ao Xu via B4 Relay =
<devnull+ao.xu.amlogic.com@kernel.org> w dniu 10 sty 2025, o godz. =
06:39:
>=20
> From: Ao Xu <ao.xu@amlogic.com>
>=20
> Add devicetree document for S4 HDMI controller
>=20
> Signed-off-by: Ao Xu <ao.xu@amlogic.com>
> ---
> Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml | =
1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git =
a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml =
b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
> index =
84d68b8cfccc86fd87a6a0fd2b70af12e51eb8a4..6e0a8369eee915fab55af24d450a6c40=
e08def38 100644
> --- =
a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
> +++ =
b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
> @@ -55,6 +55,7 @@ properties:
>           - const: amlogic,meson-gx-dw-hdmi
>       - enum:
>           - amlogic,meson-g12a-dw-hdmi # G12A (S905X2, S905Y2, S905D2)
> +          - amlogic,meson-s4-dw-hdmi # S4 (S905Y4)
>=20
>   reg:
>     maxItems: 1
>=20
> --=20
> 2.43.0
>=20
>=20
>=20
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

