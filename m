Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE03B022F9
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 19:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CBC010E2D1;
	Fri, 11 Jul 2025 17:44:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Jhal1+Be";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02A4110E3AF
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 17:44:51 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-32f2947ab0bso16935901fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 10:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752255889; x=1752860689; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u+ZM5SO8L4rZ2xYIS3dtWrMrDyHsyXlquIkrSDaXE+w=;
 b=Jhal1+BeUCQBBPSSrVMI6FH3NAjuyXhPQq6PHAMWKeXpOhJrXbviXPsG7FjD3M8kWS
 em8I8nVR/Q6v8Q5+Yzi/58MlI0QIMm1YXAmhZQR72WD9TalCx6DZq+xEXuoUsIMFjB9T
 uBia/amJ1JWX1zKvhTOoVOwA32BlN1QL4HqCszbh8AQWpj5fo3VjAIM1JY9XCmK7RucF
 Guf/gsMTzdCQDO/S71ig1+mPYiDvtuOBKwHprhE1r4qheDyRM8RNxnCWIfioF4WDA9qS
 9jT3O80uqw75DaiEQbEmnkU3jkaQwdMosv9AJD0nFsX5YJprqULp7ZpdQCSU+UUNIejl
 eAAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752255889; x=1752860689;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u+ZM5SO8L4rZ2xYIS3dtWrMrDyHsyXlquIkrSDaXE+w=;
 b=WZ7MROiW9I4MXwvObvrV6TLLdOoaFc1V1IRVAiqsLVVwU2MO60wjYEAsJqVyI3bwZa
 PM3poxiJo1t6vl2+yqBeKiqhGdv6oJwwy/J4ROEP//GTD+HFdqQRhmczrlt01LTkBH5l
 WGNx1VitALDm6r9YQt1rF5Qr/LaQrSLK7hKZ7pbwihn3fDjfTj66h+t3c7Eg386c+Erp
 vM126DUxWFqLkP0Me1Fz16GqzRmKOfDFbogzrdwSrRkL55CuLSq2aErWmfPmnkBuHpM0
 bhdzCX9RMeC91AmJQvK53UjuHsfCVwMo3FtRynic4oADz0SIrNEGqSI0Pr2sjyjOkoaF
 vybg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/qDUv+CrGzM6neEnwlZ6askWmpWJww23AuDe1JXSWJEkHSzqs3s4EsZ5UvND1nMP7sexeQou4Zos=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzq3xcvlaO+lmPiaOtUZTzdlNxPvUzvnpju++dl5RokL2yJHJ8i
 WZgjSapa553AS9LuZr6vxKa2+2SO3VSLCiHaeRY7lOnpsOVrkVw3s1a+CdL8qnjZEp+pzmIJs+B
 G4HsRCgJ53aVu/9ibj6Nqt00cJ0k+QxYpGYDy/1NKcg==
X-Gm-Gg: ASbGnctbi1jlIM2kcoLm+Xn1M8sNxKSqpifyHejATKyWvfOt4Itn3qsIDwHrbEJjWYM
 GxHWL+j3Y5jZiB4p1Q5EizVrupW9I8mrmxFHOZLw6cqfYrvSw5SUU4zx1GvFip78TEFkFspxD/P
 U8Z5QunU9sEQ2GCGvFZKVd9N/obHjycVyDc/2wveCkFCFXP4uMEXs/VI2GonMQm6n7Ob3atmF36
 zAuKWE=
X-Google-Smtp-Source: AGHT+IH6ZOzBfHIgYUwgOc3NHyt2gji+Em8NzLEp8xFU4pLvltizLDn2SrTtw5BwtYgzrpRFDHd1anYmDStmm3/BYxA=
X-Received: by 2002:a2e:ae05:0:b0:32b:75f0:cfa4 with SMTP id
 38308e7fff4ca-3305343ffbdmr14799021fa.25.1752255889239; Fri, 11 Jul 2025
 10:44:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
 <20250710-drm-clk-round-rate-v1-5-601b9ea384c3@redhat.com>
In-Reply-To: <20250710-drm-clk-round-rate-v1-5-601b9ea384c3@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 19:44:38 +0200
X-Gm-Features: Ac12FXxUNTUQvVOGg3MoOkpShRe7WywXW6kbpP4WvN3P-CcJwwv5gR7MoObTWCg
Message-ID: <CACRpkda3R+2hhzvd+snkTGrRb-gZ8OUvzAhFE5Cg6yXfZ+E4nQ@mail.gmail.com>
Subject: Re: [PATCH 5/9] drm/pl111: convert from round_rate() to
 determine_rate()
To: Brian Masney <bmasney@redhat.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Stephen Boyd <sboyd@kernel.org>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev
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

On Thu, Jul 10, 2025 at 7:43=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:

> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
