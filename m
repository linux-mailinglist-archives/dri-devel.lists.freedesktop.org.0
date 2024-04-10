Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED14389E8C5
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 06:22:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2125F10EC8E;
	Wed, 10 Apr 2024 04:22:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WWG6esB5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5884310EC8E
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 04:22:43 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-34641b7c49aso717828f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 21:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712722961; x=1713327761; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=50/EoYp4xiPcQjk7THZgfgs+ueFYqdmiSEQ2Y/A5NR4=;
 b=WWG6esB5puX3//NuVqS2AKXLkgk6J8awUj6xxOCN9rUiFDt0RWJUyp0YggYBc6uQid
 Gx1cQHeABU39xjjF52KvFfX5SlghHVd98dbcxDPQ5FxKS3DwgVdPGkRlaI0+HFmeTorC
 6ws4DMIoOZqeHOerBehIUDPf2dwVvriThhPES+9S/8/pwPTBlWo3dPvn2odQxf2BC1Gg
 DgoyH9MTIIE4eEKDf4qstx5w/T4XZRu9igUyAp6igDVhrdeVG2/+fn8fDpdD1nSJL339
 zvhEwU2OlzwArhGQ55CH85qu9q+s93DEUp9vCQ7s+C8THpw/XZLl5nAdLaSBpKf+wKgb
 MaMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712722961; x=1713327761;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=50/EoYp4xiPcQjk7THZgfgs+ueFYqdmiSEQ2Y/A5NR4=;
 b=S1i6sGf+oUmfhxo4kjv9lmvb02XR+AAehbNf90XTXlJ/6OQRarzyZUK15dfganOBBH
 gpE1oMRY0vhoyIuRuCBPVG34GcDnYpbhpR9Em4xMBCHGxsH0e3C4fuGIP9AqZLonak+p
 +xSMRH6vK6oFFmZoBRkuTOzVnumwx75gvLadUyIajvn4Xe6gy6cVCP2obbxHfBAxNNZr
 EhCMxRM2w24/tM2Q0tvKAugr3xyegUwHsTnRMYcNpKDGgxjc/rpH37GWstMqO1oY0pfI
 4yW5m9NSvspgP8hAqs29RwnVuuO9NqoVuHgtRLQC2H96v2sAOalVZtdXuGgAOjw/d7LB
 G6Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjUBXu+aXBBYwF12Apy9SztQEPTdBclogamGNCPVSMgUVNaK2yWWrHHVR7EHGq1iP8xhEnujzwYM0BhUEiqTmoNjBY4SCTDgi2r0AgQpxP
X-Gm-Message-State: AOJu0Yzf3ZJjddRWLh6ACzF++0miv3QOeCvtdJXyZ10MDRjsv48H9rdA
 gpJ+B2NFC2w3Muf7ZXg7e2L3qX0tqIE1k0lj2WqDVsHm+aLi5hMc
X-Google-Smtp-Source: AGHT+IHhKHEr3v3LDAgyhKHwIE9KipXbIkSHGprCwjFscoVbk1+9ZU+3a0NumbkHPHLpvO0f/FlwAg==
X-Received: by 2002:adf:fc4b:0:b0:343:7d3c:ddcd with SMTP id
 e11-20020adffc4b000000b003437d3cddcdmr964972wrs.1.1712722961051; 
 Tue, 09 Apr 2024 21:22:41 -0700 (PDT)
Received: from smtpclient.apple ([167.99.200.149])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a5d638d000000b00343ad4bca7dsm12898554wru.85.2024.04.09.21.22.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Apr 2024 21:22:40 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH 1/2] dt-bindings: panel-simple-dsi: add New Khadas TS050
 panel bindings
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20240409082641.359627-1-jacobe.zang@wesion.com>
Date: Wed, 10 Apr 2024 08:22:25 +0400
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, quic_jesszhan@quicinc.com,
 sam@ravnborg.org, nick@khadas.com, thierry.reding@gmail.com,
 dri-devel@lists.freedesktop.org, devicetree <devicetree@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 AML <linux-amlogic@lists.infradead.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <3CCAF214-09FE-4580-99CD-AB95E78FFB8F@gmail.com>
References: <20240409082641.359627-1-jacobe.zang@wesion.com>
To: Jacobe Zang <jacobe.zang@wesion.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
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

> On 9 Apr 2024, at 12:26=E2=80=AFPM, Jacobe Zang =
<jacobe.zang@wesion.com> wrote:
>=20
> This add the bindings for the New Khadas TS050 1080x1920 5" LCD DSI =
panel
> designed to work with the Khadas VIM3 and VIM3L Single Board =
Computers.
>=20
> Signed-off-by: Jacobe Zang <jacobe.zang@wesion.com>
> ---
> .../devicetree/bindings/display/panel/panel-simple-dsi.yaml     | 2 ++
> 1 file changed, 2 insertions(+)
>=20
> diff --git =
a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml =
b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> index f9160d7bac3ca..e194309f31b72 100644
> --- =
a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> +++ =
b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> @@ -36,6 +36,8 @@ properties:
>       - jdi,fhd-r63452
>         # Khadas TS050 5" 1080x1920 LCD panel
>       - khadas,ts050
> +        # Khadas NEW TS050 5" 1080x1920 LCD panel
> +      - khadas,newts050

Products are only new until they are old. At some future point there =
will
inevitably be a third iteration requiring a =E2=80=98new new=E2=80=99 =
name. IMHO it would
be better to use something like khadas,ts050v2.

CH.

>         # Kingdisplay KD097D04 9.7" 1536x2048 TFT LCD panel
>       - kingdisplay,kd097d04
>         # LG ACX467AKM-7 4.95" 1080=C3=971920 LCD Panel
> --=20
> 2.34.1
>=20
>=20
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

