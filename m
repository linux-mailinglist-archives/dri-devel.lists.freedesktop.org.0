Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0F6B80149
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 16:39:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C5510E84F;
	Wed, 17 Sep 2025 14:39:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="QNN361/X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D1710E84F
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 14:38:59 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-62fa0653cd2so160004a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 07:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1758119935; x=1758724735;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qd805cz0CPvWNZKSd9xPGg5rAj3EJ2zME72oqmiIKWU=;
 b=QNN361/XM2BnKbU+jT7kdcESH9MRKPWbTLd/PQL1lvcIwZGeP1MnVz0RyAz+K0AiJv
 zrrB/EJUowjYjxDWLK3jtR9mlRQPw9QcdqtttmAewmF/25C0tvTU7kM0oRQ6Vw8rvA+0
 uP6v9NYNjqLiKriG9bBJI6yT4zKdE+wdbbnAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758119935; x=1758724735;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qd805cz0CPvWNZKSd9xPGg5rAj3EJ2zME72oqmiIKWU=;
 b=AXJJZB090mMwcRlvW62OCdkyRJJ8a+HqBBMImOWP8O37glACXBExO6D/MQKLQAg3d0
 OmQPt8r/uCCqngkjrMU1B7VFlLyxl0HYEcwXuSXflsRlKi3OZfrJcUypB8FzBz97pHtZ
 hGCz+rfosIlk859YeXNrWFyLXp5jEcsI7Y3tK8nwfTszIcOBKIl6pPRsPxLPwIrYgysS
 vp/NdXohQCMIzbQKBsekzhseUe+OsWzEm40YGaSICCdh7WvGJnmKP9Y63lfZg5QuoS4L
 JVTmThBy4fa2fV1mFgMUY18SYa5lcx78EUzTuHBr1Mvn8gqs5VWdWOuDm2/rQAoP5aIi
 rJQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5bJw14PNqdMQqEJtkeBGryoK0Q4sMUf/+Ly7IXRknIO4yxgeGC57GyzGmheR1P+ZGddiKQkU59rM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDNv3MYjpSKADLSaFEuOfrUU+IakCqkJLghdxGHei9Xu6INamg
 0CNPHapeq/ncam1h4HRtQMMJWhdkaDJePWIMfvq5+ocozRMyV9hDgJGgTOzEeTvSuqVTaconeA1
 HHlQaWg==
X-Gm-Gg: ASbGncvRBhZ++2U8NwYZx1OZIagVMl7IEDRHOlYjJr8b3Texl+0RXnzxZZLyuv7swJd
 2q9blO3RW7IaMDB77EzArNiiD8bIS6WMd3C2W8JkvVGGp1hXFN2s2J4Mv3DrXcN0GFRId3VvP0u
 d/jwZ8KdN0gC0weND1Pv+XG8fmILTE7kXIbC2BB+nAq3+ivyt15F6w/As+vi/0NGhtMIfjOYBeg
 dilUk0xBreUq9fd9uYz/MJ3Yi0L8RD36gYG7vDJcoBcGrD9aBHMrIX9VzjSk0JAE8aG840Wy+76
 TWqCFbPL8OYWx3G6f5mM52FFqCzXn3njEommJ9YIr/rvMhWqVL3NyQE7tjExFjx1A4BIyo75zE9
 8oTRqJ8hXbuYZGUqEKrGhMaHpAR6YhfQK091dWLILeuf8V50SkVidvNYO13W+YA==
X-Google-Smtp-Source: AGHT+IGBnbnDO7tIIKl79k/qaR98m+y70qTlJGcLqHCYrHsTwnwmcm8uuCYsfAcTuQm14VBsrVntiA==
X-Received: by 2002:a17:907:c23:b0:af9:3116:e0f6 with SMTP id
 a640c23a62f3a-b1bbb15ca71mr284270066b.53.1758119934461; 
 Wed, 17 Sep 2025 07:38:54 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com.
 [209.85.218.43]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b136ee12326sm518520766b.51.2025.09.17.07.38.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Sep 2025 07:38:52 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-b07d4d24d09so558684466b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 07:38:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW7YjyMlTCdr9icAkLptg4r2BTBj09MAv01PMf0Y9PKLogaIL39AcndFqu0WV0aQEb086wV5e71pN8=@lists.freedesktop.org
X-Received: by 2002:a17:906:4fca:b0:ae3:8c9b:bd61 with SMTP id
 a640c23a62f3a-b1bb17c9028mr325843366b.12.1758119932480; Wed, 17 Sep 2025
 07:38:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250916142047.3582018-1-ghidoliemanuele@gmail.com>
 <CAD=FV=Uftrv=x6CuG7edLCSAi16Kv=ka7qxPViuLM=BEG8pC3Q@mail.gmail.com>
 <6e886700-24a8-4127-9324-7245b6cbf6b7@gmail.com>
In-Reply-To: <6e886700-24a8-4127-9324-7245b6cbf6b7@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 17 Sep 2025 07:38:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XMT=2UJjtcEk4DDAtFn9KhJ=UX3Vyzabk_shBChbvNuA@mail.gmail.com>
X-Gm-Features: AS18NWCoryMhc5P9VWrIshFnDVMCRDJYhqTFSvF-LnyYKCutmzxh7MsynQqObSo
Message-ID: <CAD=FV=XMT=2UJjtcEk4DDAtFn9KhJ=UX3Vyzabk_shBChbvNuA@mail.gmail.com>
Subject: Re: [PATCH v1] drm/bridge: ti-sn65dsi86: Transition to LP mode on
 every video line
To: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Jayesh Choudhary <j-choudhary@ti.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Tue, Sep 16, 2025 at 8:28=E2=80=AFAM Emanuele Ghidoli
<ghidoliemanuele@gmail.com> wrote:
>
> On 16/09/2025 16:45, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, Sep 16, 2025 at 7:22=E2=80=AFAM Emanuele Ghidoli
> > <ghidoliemanuele@gmail.com> wrote:
> >>
> >> From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> >>
> >> The component datasheet recommends, to reduce power consumption,
> >> transitioning to LP mode on every video line.
> >>
> >> Enable the MIPI_DSI_MODE_VIDEO_NO_HFP and MIPI_DSI_MODE_VIDEO_NO_HBP
> >> flags so that the bridge can enter LP mode during the horizontal front
> >> porch and back porch periods.
> >>
> >> Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> >> ---
> >> Cc: Douglas Anderson <dianders@chromium.org>
> >> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> >> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> >> Cc: Robert Foss <rfoss@kernel.org>
> >> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> >> Cc: Jonas Karlman <jonas@kwiboo.se>
> >> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> >> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >> Cc: Maxime Ripard <mripard@kernel.org>
> >> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >> Cc: David Airlie <airlied@gmail.com>
> >> Cc: Simona Vetter <simona@ffwll.ch>
> >> Cc: Jayesh Choudhary <j-choudhary@ti.com>
> >> Cc: <dri-devel@lists.freedesktop.org>
> >> Cc: <linux-kernel@vger.kernel.org>
> >> ---
> >>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > I put this on a sc7180-trogdor based Chromebook and the display no
> > longer comes up. I don't personally know the MIPI side of the spec too
> > well so I have no idea why that would be.
> >
> > -Doug
>
> Hi Doug,
> thanks for the test.
> According to the datasheet, LP is recommended for the front porch and opt=
ional
> for the back porch.
> Could you please run another test by keeping only MIPI_DSI_MODE_VIDEO_NO_=
HFP
> and removing MIPI_DSI_MODE_VIDEO_NO_HBP?
>
> dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_NO_HFP;

With just MIPI_DSI_MODE_VIDEO_NO_HFP:
-> Display doesn't work

With just MIPI_DSI_MODE_VIDEO_NO_HBP:
-> Display doesn't work

So if I set _either_ flag (or both) then the display doesn't work (it
just comes up black). If I set neither flag then things are still OK.

...and, if it helps, when the screen isn't working I can still force
the color bars to show up with:

i2cset -f -y 2 0x2d 0x3c 0x10

...so I know that the device has probed OK and the eDP side of things is OK=
.

-Doug
