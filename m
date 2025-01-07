Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FC3A03C9C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 11:38:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B67710E300;
	Tue,  7 Jan 2025 10:38:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RRvboWzl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C9A410E300
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 10:38:19 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-303489e8775so172167941fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 02:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736246237; x=1736851037; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xje32BOdw7wAqN9VcKNPAq9+7Mpm31xiFrYaEG4gc8o=;
 b=RRvboWzl0drg/zbXWsACqRxFhQJZwcRe40C98ZYMZqNHxrIriVtZpPMU9K2VZEeCae
 +BNmMIiiINliysxOXnjzINiyrYYK+AfG4ZmFmjRG3CWK+qh8iQXl+uKK7kLlbSYSE7R/
 YdsosnOq7zLKJ26lIZZOruJ8fxrLe9XRmRSYW8aryCS0kYvGMtMjNxO0zmpTE3QkAlJO
 HoivWKwxcA231KxghB89IkCZ8HAfMZF/1Ztkt/uWJdzHxMJocLQN6xTPEci7kTXCXELs
 VoB0uidBqacWK/jQ3MSRqoIixdQaLgNiSfxn9EVrZF63ApmRaX1KtjnrZ3TGyBQtEyWi
 HImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736246237; x=1736851037;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xje32BOdw7wAqN9VcKNPAq9+7Mpm31xiFrYaEG4gc8o=;
 b=UkdyV26RL8SvTM0LK5gf9TMvy92IoJ2V8Yo04Ccm1qGM7Cqs5vBpc0r3D5Vq4C6ICx
 pPUxUtaxoZnZWP11WTrI0v8/XEgwFMqhY/fgS8Fap4GyA/EMFeBCK3PZ//CFUIYIGhro
 +SE6uLdNmJTGRhI1z0tvsglimGEXanTQTdhXMv0AQIXDMhd9mwR65OS7/4AXjRN5LWck
 CkEB01x7cOLU4drbIvW5mHRNPs2D93jkEeDM4ydrDMRTYRS/+wSSb1P4Qn1rzUCy1gKj
 9Y82Wq4elxy1DOOKPZUhgl2bAYjp9/2e/zh/zj14lZFGvVfcSFeRVbnuyqLN6hQyHAmO
 RNnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWRqxsNopg2hsh1Gw2vTaGlhQg0LZZO2rHHSco3S1mxxQqNLpeCEzkKW35YoMsxtGzYNOiDgSbr4A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkODI0Z1hKbP7pp2ozQA2A8zATB9Wi2L4baJcUjL5bPsuCSK8M
 feOd2yM0hSgkSNtv4OQuEjJENgJ0au3yxkIaXpOGP/yuNpuFcTUmKVWvdccMsnmfRwVe433lUS8
 My87W4TOdhyiGVy9yuYBy8c9ABY0=
X-Gm-Gg: ASbGncv91IYbUiLN2zhhDAZ1YkcUgosvFk5rRaj/ujWgeJjmeIWHLz8Ab1l5bnGkBg/
 G3xz860O0sglmsqec8rGqjBq+IaA/qkV8vH9MLgEEV22YQiiZZvPZeeccHuBOXzNLUJaDSw==
X-Google-Smtp-Source: AGHT+IHS3njRhHL7YfFO0iWHF22sHLsH5C52QKY9UxYlGlYE//joyWAtO538qgeg1ERJpfJproNazJyxMl4X57hOWEc=
X-Received: by 2002:a05:6512:1110:b0:540:75d3:95c0 with SMTP id
 2adb3069b0e04-5422956b7cfmr16752741e87.47.1736246237133; Tue, 07 Jan 2025
 02:37:17 -0800 (PST)
MIME-Version: 1.0
References: <20250107094943.518474-1-alexander.stein@ew.tq-group.com>
 <20250107094943.518474-2-alexander.stein@ew.tq-group.com>
In-Reply-To: <20250107094943.518474-2-alexander.stein@ew.tq-group.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 7 Jan 2025 07:37:05 -0300
X-Gm-Features: AbW1kvZdLxR4RaObsuUJc1Glb-jI0wjh8lFemgvwEzpoXOeKA2MO9ZmwnSRVm90
Message-ID: <CAOMZO5Csc+cOmOaRofWZW7Z9HL6d2NjMhZUdcomuyS_rtZwz0w@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: imx7s: Move csi-mux to below root
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Jan 7, 2025 at 6:50=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> fsl,imx-iomuxc-gpr.yaml only contains the mux-controller but the actual
> video-mux is not part of it. So move it below root node.
> Fixes the dtbs_check warning:
> arch/arm/boot/dts/nxp/imx/imx7s-mba7.dtb: iomuxc-gpr@30340000: 'csi-mux' =
does not match any of the regexes: 'pinctrl-[0-9]+'
>   from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-g=
pr.yaml#
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
