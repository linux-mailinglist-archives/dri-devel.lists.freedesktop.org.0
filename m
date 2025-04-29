Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 256CFAA05F5
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 10:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 303C610E3AB;
	Tue, 29 Apr 2025 08:40:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lpz3fsuG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D950310E2EB
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 08:40:53 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-30f30200b51so64896271fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 01:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745916052; x=1746520852; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KyAtXWPUARsz+iDauIm3noZwAgvzeeeL/6Xih7T8GDE=;
 b=lpz3fsuGEs5d2EXCZHQv5LMnB6kuj++xNovRgXKdnPtW2cS3G/2/zpDUD3kVfQbaGc
 lERlOn6cP5zMJbvKK4e2kNXiR6F06rayuUXTZOanz5Nq6lNWtLgSwPyWjo0HmBUfhBY0
 vExovgmmJrUO2TKNW4DzM69dy9YpC1R8oxlAFxiiLruuoYMyLFZRAm752+jFJ9ZEUofO
 g34e1UWj0zP0gGROe73xGe5uo52BgjId7H6FDhqjU/bTbJ5IV9XVbYVU25P0GaCEfMcl
 4KpHi2RkSiLfB3++D9xvvMAI3pUAyTGvZ4EKlgP/lrQJZ+55utxsFUhNh5eNlC+++7fW
 ZVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745916052; x=1746520852;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KyAtXWPUARsz+iDauIm3noZwAgvzeeeL/6Xih7T8GDE=;
 b=sDrB7Om06MAPj8Dp72faEOCv71M+sAPIAylMiuESmZ7OeqR1Eyc+Nsp6Rj/9BW4t3A
 GDi5INpGGZ9BxMYDArG48v0FD/nakfuFRhP4KioLZAmN6vKEx/Lnfbp6k+uWe16XCwSB
 LeTslGHcAAP4t97hS0shcSFnMQUPA8p9QKZChItWesA62SaFjKq8X/84QuXoj1IKoGTB
 v5HeZBTlvue/bi4ib/GlZ6sZ9tshz1bz1n9LxAEe/c1x/o1CNzxFMcBHPsVKumtWWpaO
 GCBAFAzlvq/VZt/AfzDeZiBDHa4zhxvnWM3Lywi+zY/fCi8C9ffy9Jgrh8VmRT/1jeEd
 TGlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUo+//p+SxeKanunPwegRxohr+p6pXi9vou9XPCtxmtlGlBr53+o19r/AwCR60jynjkpRavDWmcm/M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoNPaQJBsW565brDc6SczH7oH24oEPCSfycd87iXnaiZrTKWKf
 ZfWBUyWW6RFMbr0fSAu5wAnCsrNX8dBsOaB/u3a1PohAnurWR2nmQN94Jc7p49YLtXu4aUWxSak
 h1UkBf9GU3svWZJL9e5ldAq/OontQKVONqKHM/A==
X-Gm-Gg: ASbGnct7EslIs+pM8XzVf+rTIdYrh8mkVUi5oPevTsJPJkkdcKRmv0cFCtiY+Mi3jk5
 LBwyN0XFZAM8nlxe6xsiIuDLkQX18sz4Fic47TxfDRzXJGYlWjkZnBli9eHcsUCUMsHfTJOtayr
 ORhQvMOly0AoU0vbJpsFEzlg==
X-Google-Smtp-Source: AGHT+IEUiqYB296CVrwZ+xxBw7BC+pTcJa/x+6Bu5GNB2EvNhnBwa7BLSUJNRUMp+Ehtf1mLBoE9JSmzpMhMYJBukms=
X-Received: by 2002:a2e:bc0b:0:b0:30d:894a:a538 with SMTP id
 38308e7fff4ca-31d34b6c243mr8766341fa.21.1745916052135; Tue, 29 Apr 2025
 01:40:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-15-8f91a404d86b@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-15-8f91a404d86b@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Apr 2025 10:40:41 +0200
X-Gm-Features: ATxdqUEhPh2HxY_cKMawBJnfuogL8n7jPhFvg8U9jTR5km8hYrNkb1VPdIYXtGQ
Message-ID: <CACRpkdZt8zem0hFUiq3-Z1feNZHRh3R=Y0cEtK=pVt=bJ9Qf1g@mail.gmail.com>
Subject: Re: [PATCH v2 15/34] drm/mcde: convert to devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Anusha Srivatsa <asrivats@redhat.com>, Paul Kocialkowski <paulk@sys-base.io>, 
 Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-stm32@st-md-mailman.stormreply.com
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

On Thu, Apr 24, 2025 at 9:00=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:

> This is the new API for allocating DRM bridges.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
