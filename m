Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABF3A43B70
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 11:25:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D460910E612;
	Tue, 25 Feb 2025 10:25:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="P2BEPlwK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 465C910E60B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 10:25:39 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-38f265c6cb0so2642517f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 02:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740479138; x=1741083938; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aFoF7QyNRZ9r7+RHzos7assjg+PgG+3CLatxaRnVuRs=;
 b=P2BEPlwKFYAYM3xZ6ss33+10Nsh28Mw/TYnf1oWjNigNFvJBjAaaR6YDNxrFUKtjk5
 PIpZAf4jd8Y+box5mXuv8/XSZfsAE9Ov4OpF4LnFrKPbjHisP5h2nPoAS1qvR/nJ/XVB
 qpSFpvwqO5KFlSyt+h/UwRgbMO8bwd7Iinzm5cfh/wvjXMiRN7I7/4hNFSgTi98IEgmc
 UwZFqMx3oZ8IRl/sLax/GdxBGhvRbAmU/SF4EDfNsWJ7ofn5Dyd2o3MtYQs34gm7ClKt
 rpAcGtiGIYd9buW9KPfC6O8SXbu4HtcgiiB1/D3Bg8lTMK4YM44yU8X5s55WnfE2hQ+Q
 nH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740479138; x=1741083938;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aFoF7QyNRZ9r7+RHzos7assjg+PgG+3CLatxaRnVuRs=;
 b=PKzdG6cNFrzxEO4XISTKWTYngXdDKSlmnAH25AGLOfWgeZr7DfdUBfW74Kd7q9Umvr
 yDmtJqYd1v6iWcRa9yGwJglvwga9h6+X3aG1Uo1iaicoGmmZ55yyvew+ZP7ZPEvuOGZl
 JDKYY7u66bGU0HsPPoXagaYgCXL1tZmiQbDofwpDE0ShNL9cHaWw6GvMAVOMIljd3FbH
 b/iqB4zCl+czWgj2kpzuMyO4CzVJbJMCOnuu3i6jPfYzfh6yEQNthyw7/Bn3CuFvXl6K
 G0lvClFl3oCApf4dPocOQ7igw6gSs1OBDkaxVOAJaTOoBD6fcH/ilLqkI0CP2oQynRgQ
 Jt8w==
X-Gm-Message-State: AOJu0YxxCGvNr1YoHDRdslpWf/HWh+nzTjeJMRD5u5jGUi1fPmsVQWP9
 xhOpDk5ePnvHX6KPopIVn2Y3Omq6LlbxPpujBeEOUE+2HWo4GSxtlt/wYkLCvoE=
X-Gm-Gg: ASbGncvPYNJWmBld9wiePv6KQojEk281lzlhOqyWcMOozGWWpBV/X/N5EMgig7mXJ3Q
 kq9xm2qBmetoV8RueR5zNs2Tqq/7CIpsWuMhcoPohA/peWrvn+knis7cRk+YaqPeY9e4t0BdGiI
 pCumXqAEUykG9RliNoKbiCfqjE2ZZtSj2Fd28S95EHZOGpWQL3AndPOLvLX9DeOT2Msu8UEeJAV
 IUK1PE8aQU050QmUfAwKz7s7avnbCH133GKsJdgHWIk+S+IqQsRIERpwTsX2Ujj074oR0HDuZK2
 nk1ZydyPZBRrURV4hDErsF3TbW6PTlK/0+Z5BQciaAZYiiA=
X-Google-Smtp-Source: AGHT+IF0UNTzcIoMzLzKcwrilDWc3geeDLz1AHdSa0/z4fJP99oSE9XrnUuGZC+x8acSBmNx8F633Q==
X-Received: by 2002:a5d:6dae:0:b0:38f:4b2c:2464 with SMTP id
 ffacd0b85a97d-38f708626c6mr12904963f8f.55.1740479138118; 
 Tue, 25 Feb 2025 02:25:38 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd86707asm1764378f8f.5.2025.02.25.02.25.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 02:25:37 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Maud Spierings <maudspierings@gocontroll.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
References: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
Subject: Re: (subset) [PATCH 00/14] arm64: dts: freescale: Add support for
 the GOcontroll Moduline Display
Message-Id: <174047913731.2131221.16812340325511859962.b4-ty@linaro.org>
Date: Tue, 25 Feb 2025 11:25:37 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

Hi,

On Mon, 24 Feb 2025 14:50:50 +0100, Maud Spierings wrote:
> Add inital support for 2 variants of the Moduline Display controller.
> This system is powered by the Ka-Ro Electronics tx8p-ml81 COM, which
> features an imx8mp SoC.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[01/14] dt-bindings: display: simple: add BOE AV101HDT-A10 panel
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/761992a4b4deacb519f4a6089936b7fd22b4aa0a
[02/14] dt-bindings: display: simple: Add BOE AV123Z7M-N17 panel
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1a4d1d9f068506f4f334c03514d2e93e21830f19
[07/14] drm/panel: simple: add BOE AV101HDT-A10 panel
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/b554c009da1c3c6cb8c4b5da2ac2f37fb527e927
[08/14] drm/panel: simple: Add BOE AV123Z7M-N17 panel
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d34bd3c7cb84425dd6146a8d07af597b93ad4c4d

-- 
Neil

