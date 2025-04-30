Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A29FAA50D0
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 17:52:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E1610E320;
	Wed, 30 Apr 2025 15:52:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="JMYuQ06e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B81910E320
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 15:52:05 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2255003f4c6so30465ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 08:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1746028325; x=1746633125;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9LtmMorPZzn1CDLSUkR5sDQj/vapTL2vnbBygv/Tdmw=;
 b=JMYuQ06ey2CNN0YSRsZ7yV+FZtPLAW7irMYZFOqJU1wfz6gGoJ7Y7EGw/GP5HpDjqc
 /h/Jm8ekP+q7K6aX8sKeQfFb0xZr/xZEz3CkXWxe+FoCRQixmgmftvd+oLV/wp3dpXUw
 FFWhCiqZmiUOBOiuTm7jiTsbSxj+KuzsxSa3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746028325; x=1746633125;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9LtmMorPZzn1CDLSUkR5sDQj/vapTL2vnbBygv/Tdmw=;
 b=mAL6+bZU1hG7mNUVS+nqrbYoruDEhKcAb+EGV/24/UksTivva6yTHkExtGTc+8EzAE
 Cdcl19BGu3UNLFACq1PZPXewGfYCQMNQX3bGpREbF7U4nYLYTYrK6d7mZbBtFxL5coV/
 CAWXOvP0SfgJaanhii3N714rB9FqXaQp9HCm9PYuj1H7ctkfm8MfMf4f8n5TrTrQ6AfF
 LbUYF3GrS+knAbxB7BPqIWfOEmHQx9STsyts+dlqMGit0c0IPPzCIlCxTCbhVEFEviEJ
 hURrFrAoabfh0PtxsLOCbcH5cjWAXS8BXRQqtkr4Nwb8Gj/IvqsqzLKtQ2wQWsAUcink
 zsrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMqR7Emo0XQd07TpU0JiCFO6476x2YpbRFpOIT36w56NquF+u4Si4kObuLyq4XRHtlq9NLhi/esOA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+K6onrkHTj8qr812KSGh3rzX4OJlsNsTmwSjAEDssAUWQHk0r
 CsddgSYk0W/Fy7/VxKStOjiZ8BW6mn9aJjjdnsTEAI5DWPX3H72FymLEztqsl0+4k4FU0kSob6M
 =
X-Gm-Gg: ASbGncv0ToyR66unbFlo5W11v3hHT3OjURQpnU2D3lEyoRaEY7UgXmz81yBYXpLllhm
 jjdr3jK8/GNYNcYEjT8Pu58SlY/TI7S7QdW+3HVCcN0KD0fxh535mlwEaAHay1KitU4ANR7x82a
 i34zhFSX8dAvUWycgi9OMzTHFLopkGkAVyTetGL6ol6T6+qEvdwYcKy6rrXYRGSxZCYFYKsUXQY
 vpIdsZvyYkoOr0kKH6yMRdgJv4f8Asm2OXJEf446Xb7NnoLikkPLjqX9T8cxAzmyLgOIOuVle3E
 CAZC33bv8GKICheIoRXZwIJjKb3rIKqfd00baITebJXi96dU5ngT9igscVtVNAUkbMiw0l6WPGg
 DCr6j
X-Google-Smtp-Source: AGHT+IFVlpeP+/pbSlQY1fhcKmP5WeeepaUf+9EZkJIJTL6Bbjmwq76S0HQpW8Ex5LhksZ5mgPoz+g==
X-Received: by 2002:a17:902:d502:b0:22d:e575:9eb2 with SMTP id
 d9443c01a7336-22df358f9acmr60149505ad.34.1746028325067; 
 Wed, 30 Apr 2025 08:52:05 -0700 (PDT)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com.
 [209.85.216.53]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22db4dbd0a9sm123917855ad.78.2025.04.30.08.52.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 08:52:04 -0700 (PDT)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-30155bbbed9so58367a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 08:52:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXuYCz8GJxezmkqjkeD3RhluBi1fD+po3Igr9oVtMyDUloaauHTYUa/uqaM4nTzsD7dCM4iytOGt9g=@lists.freedesktop.org
X-Received: by 2002:a17:90b:17d0:b0:2ee:d371:3227 with SMTP id
 98e67ed59e1d1-30a3330bd2amr6121407a91.17.1746028323966; Wed, 30 Apr 2025
 08:52:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-1-8f91a404d86b@bootlin.com>
 <CAD=FV=VmV5yb0HWWGTiKyyC8+WNPJpM7vE9PQGh5_=KPk6+HCg@mail.gmail.com>
 <20250430123557.3d8b1de4@booty>
In-Reply-To: <20250430123557.3d8b1de4@booty>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 30 Apr 2025 08:51:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UBFhCGOUuwtCtdT75nCu_7EzM-SVY-=6Xh6UxUuxKCMw@mail.gmail.com>
X-Gm-Features: ATxdqUFfYEEYqvpO67K1TXBYapYURxE3d7Z_gt9FzIWHk5tUMzE1QBIfnvJL-xI
Message-ID: <CAD=FV=UBFhCGOUuwtCtdT75nCu_7EzM-SVY-=6Xh6UxUuxKCMw@mail.gmail.com>
Subject: Re: [PATCH v2 01/34] drm: convert many bridge drivers from
 devm_kzalloc() to devm_drm_bridge_alloc() API
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
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>,
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-stm32@st-md-mailman.stormreply.com, Adam Ford <aford173@gmail.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>,
 Aleksandr Mishin <amishin@t-argos.ru>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Benson Leung <bleung@chromium.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Christoph Fritz <chf.fritz@googlemail.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Dharma Balasubiramani <dharma.b@microchip.com>,
 Guenter Roeck <groeck@chromium.org>, 
 Heiko Stuebner <heiko@sntech.de>, Jani Nikula <jani.nikula@intel.com>,
 Janne Grunau <j@jannau.net>, 
 Jerome Brunet <jbrunet@baylibre.com>, Jesse Van Gavere <jesseevg@gmail.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, 
 Manikandan Muralidharan <manikandan.m@microchip.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Phong LE <ple@baylibre.com>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>, Sui Jingfeng <sui.jingfeng@linux.dev>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Vitalii Mordan <mordan@ispras.ru>
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

Hi,

On Wed, Apr 30, 2025 at 3:36=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> Hello Doug,
>
> On Mon, 28 Apr 2025 13:59:50 -0700
> Doug Anderson <dianders@chromium.org> wrote:
>
> [...]
>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org> # parade-ps8640
> > Tested-by: Douglas Anderson <dianders@chromium.org> # parade-ps8640
>
> Thank you for your review!
>
> However I'll be sending v3 with some differences w.r.t. v2, in order to
> fix the 3 bugs reported by Andy Yan plus a similar one I spotted. The
> fix just is replacing PTR_ERR() with ERR_CAST() in the 4 cases where the
> involved function is returning a pointer instead of an int.
>
> Your review/test tags appear global to the whole patch, thus being the
> patch different I think I cannot include your tags in v3.
>
> Let me know if you think I should do differently.
>
> Sorry about that.

It's fine if you want to drop my tag. I didn't have time to review the
whole thing but I felt like I should at least review the drivers I'm
signed up as a reviewer for. That being said, I'm not counting tags or
anything so I'm not offended if they're dropped.

My understanding is that the hashtag at the end is at least a
semi-standard way to say that my tag only applies to a small part of
the patch, so it seems like it would be OK to carry it, though...

-Doug
