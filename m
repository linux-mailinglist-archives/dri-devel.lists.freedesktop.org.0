Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0569848EB6
	for <lists+dri-devel@lfdr.de>; Sun,  4 Feb 2024 15:54:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9622310E09F;
	Sun,  4 Feb 2024 14:54:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X/Uvb6r5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D678D10E09F
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Feb 2024 14:54:25 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-6da6b0eb2d4so2311265b3a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Feb 2024 06:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707058465; x=1707663265; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pgWoWhZI6Jt4ifeI2jAQa8yY6PW0nUJE61HeVZboEZ8=;
 b=X/Uvb6r5XQvzZ0n4Q3Xr7k/U6twyPns2KsOksXjxoDs2LTsdwKoHsDQxAsDnq/JApy
 NpTIekYI9fKgQtC06xSBhOHuQ2wNEUAC3+b/zEq62L+ZMDDyn1KcCM/wZVJdH4HvBCTn
 R0MifeTouxvJUiTXZBlFkFI1DNCvMABy95mYSQ9ILuAu6T2O3+rXzV2LmuonK47QDGNC
 2cXMSslS0PpObisP89WyIj0S2z4My4sTR+SX67y4MYYGsDbZPD4k/W4wsQRS/tcZ6Ieb
 ED7olJzis60iDJ7fVlzNWZkeLTnnr23xT1fgUDto+sOx2n5e5IPQp4HbX83UeK20xoO8
 f0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707058465; x=1707663265;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pgWoWhZI6Jt4ifeI2jAQa8yY6PW0nUJE61HeVZboEZ8=;
 b=SVs4+0mPx6jRg+yE8xpYw9kbL0hLxp+KT+akNcRZkh0uCuR+wOqavMqp7goBofW/LT
 DE4Msu1gwEiGnjTGzxwbIoxdaAZMDneLwG6la097emj8be9YNEgESDZs+zacjve/MerS
 ZJzdYHvMwVNNb8XoJCsc0Gg9vjfQEvrvUgpAWA98oiyJHOSjmOg6GnXZEWt4DeUPNVgr
 Mh8EAPwNTq4V3FdkXffFzhnqljOhLImRJ6afxgn7OY1aO5kPExTQMrw5H7UDhuym56xB
 7ilTWhMB4R8G9ZTPKAO0w4SbRlrPPoOvHNcixJMCgRjad4EC4/DsFsF9voY7r6jZaSLz
 Hmgw==
X-Gm-Message-State: AOJu0Ywu3iJ8/v+HttwQkP32FLZfm39ATe4/VNGvOVRYauJy+Dcqd8oh
 pekKyfTOLHHZdfa9/I+yPaOVeWVSRrlbVtf6ewoJ1g0r8dXRaXkrOOyM757IbUssnF5uAORraS2
 AgrK//YYg9BI1+jQGkVA7SAAeGtc=
X-Google-Smtp-Source: AGHT+IGSX8kX5MA8ZbTQDoQMsW8S27tIoZz4dXskIGi/iCXvA3jGKdesaVZqnt2TBMScGsd6VoU8nD7JHy3LffXnc2s=
X-Received: by 2002:a62:ce86:0:b0:6e0:3769:eb92 with SMTP id
 y128-20020a62ce86000000b006e03769eb92mr1260042pfg.25.1707058465268; Sun, 04
 Feb 2024 06:54:25 -0800 (PST)
MIME-Version: 1.0
References: <20240203165307.7806-1-aford173@gmail.com>
 <20240203165307.7806-7-aford173@gmail.com>
 <20240204120033.GA4656@francesco-nb>
In-Reply-To: <20240204120033.GA4656@francesco-nb>
From: Adam Ford <aford173@gmail.com>
Date: Sun, 4 Feb 2024 08:54:13 -0600
Message-ID: <CAHCN7xKGMNpiTxy_7vMKd+rSsS6aya7N+duVVwFNKnpG0M0gBQ@mail.gmail.com>
Subject: Re: [PATCH V8 06/12] arm64: dts: imx8mp: add HDMI irqsteer
To: Francesco Dolcini <francesco@dolcini.it>
Cc: linux-arm-kernel@lists.infradead.org, marex@denx.de, 
 alexander.stein@ew.tq-group.com, frieder.schrempf@kontron.de, 
 Lucas Stach <l.stach@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 NXP Linux Team <linux-imx@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Liu Ying <victor.liu@nxp.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org
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

On Sun, Feb 4, 2024 at 6:00=E2=80=AFAM Francesco Dolcini <francesco@dolcini=
.it> wrote:
>
> On Sat, Feb 03, 2024 at 10:52:46AM -0600, Adam Ford wrote:
> > From: Lucas Stach <l.stach@pengutronix.de>
> >
> > The HDMI irqsteer is a secondary interrupt controller within the HDMI
> > subsystem that maps all HDMI peripheral IRQs into a single upstream
> > IRQ line.
> >
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
>
> This is missing your signed-off-by, and in other patches of this series

Opps.  I thought I caught all those.

> your signed-off-by is not the last, as it should be.
>
> Please have a look and fix this and the other instances.
>

OK.  I have some work to do on some other portions, so I'll clean up that t=
oo.

adam
> Thanks for this work!

Thanks for the feedback.

adam
>
> Francesco
>
