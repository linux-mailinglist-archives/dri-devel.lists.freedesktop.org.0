Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2964AD22EA
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 17:49:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF8310E128;
	Mon,  9 Jun 2025 15:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="lK4J7EbM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E55810E128
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 15:49:19 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-2cc57330163so3329541fac.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 08:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1749484158; x=1750088958;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dJ6X8dIYmppUXPR9jjYjN7eoEUwVzbFBocT4G4uDz9M=;
 b=lK4J7EbMjcJ+OqBV/5XpfT7LzLsprdpPW/D1SGpoMwxDnNWGNbh4MlvEI6Ys3rRcX7
 RRhzYT+lDC39X7ELt4dR36HsFpocl0qzuFc2OjE+mAQYqVs8IkAnrmLOr/F42bJabMFB
 Bm0xi7vbcE5mjqDK1iwdtoaMghiAtEQKaqJrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749484158; x=1750088958;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dJ6X8dIYmppUXPR9jjYjN7eoEUwVzbFBocT4G4uDz9M=;
 b=wJw5WHvKuFsH/Jmxuu5F3XJNkwJE42Bvaa5F2bLPLoohGek1HzvxgxSrdmPI9tuqVJ
 SPh+L9BimsuXsnIH46V21ROQbXniTac3Qpm5Gs7Qrd6TNFvj9M+Pt3rxH2RkyKed8RvS
 B5Wuq2Yc6hioXe8P3mtAVDV19v4ucgYRZSYuMC1QkbrQVWg/6snqshmhlQRrSjECSFrz
 Eqs6kB9aMLj7z/gr6bYA5qEFprb9y0+EBB5/mmp1cYFi/jq7cgQ1icMY3MWufgXdZ42S
 iPq1LazPGvjUP1JqFWBrNU5p8NhrUOFhko09OCL/L7Yd3hB8LaoCMudZSKd6W7VWZ9JD
 ymRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0AS4hirlGTVPeLBhvbwwdBjRVjDgCZcOaGhI122TcFSZ6KSrvPV0p6BlrfVwFsST2UsLcQxV0nWY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaoW6Z3CaKNpaNeZbsHxA2WBXibOikczsSnqR/ruBySjC+zI8U
 zzKkJYzsbCkfvibsvQvA+EnBpu8oWTRmDaiwlPHQdltLZBxE371l+H4uN/ErVNwRAyJG1xHLJFR
 UdXU=
X-Gm-Gg: ASbGncvdH3RekbUK8Pv7fmqQxJLq0paGYBtLyuyvIUVgk1DKgpdnxwsUSB4qPFWwXxS
 a615L9j1LS6R8j0ahXWvrXOiMD2tGjFD0hLrWJwut6RdDLlsnao1J0y/Z1HxaP4l+hpKvJ+SBQV
 KyReIEMiFNYNPPlSzcjkNC4lvQTVLIAE4C6yYx5ubwrsGd8OYqy0rAq/ABQlJBGI/5BjXUa5Uov
 IvmkYKQs3p/VD0Ca7uUmZSYwdROgWvX8uwAH2uOvVnzLlCN/vojZlNDEJRPFS0VGAdXiHSva0KX
 zRLGxQIMaCfEl5IlhE+pj23aTGwwasyzHC3bbj2H6OY9e045DeSMhuLwBvyFWC61VCtI9EW3m9A
 +jeIXjnX4HaWE6ks=
X-Google-Smtp-Source: AGHT+IFSFnH76Cjh+LwYefyaP/TET4+LXF+aQ6eu000RaZEzybPe/Z27imVDmEMT15NUjB/e9aeILQ==
X-Received: by 2002:a05:6870:328f:b0:2d5:23a3:faa7 with SMTP id
 586e51a60fabf-2ea007d2351mr7841069fac.6.1749484157621; 
 Mon, 09 Jun 2025 08:49:17 -0700 (PDT)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com.
 [209.85.210.48]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2ea0734079bsm1958326fac.35.2025.06.09.08.49.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jun 2025 08:49:17 -0700 (PDT)
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-7382a999970so2834724a34.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 08:49:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVGdvOjUvh6g3k/hNu6PMl9PE2WTsV1IMCVmasEYV8coD+xa0ksFcIanFUxgqe9JT4Ixzk84FBuYtY=@lists.freedesktop.org
X-Received: by 2002:a17:90b:4c4e:b0:313:27e5:7ff1 with SMTP id
 98e67ed59e1d1-313472d3204mr17932741a91.1.1749483806734; Mon, 09 Jun 2025
 08:43:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
 <20250218-aux-device-create-helper-v4-3-c3d7dfdea2e6@baylibre.com>
 <CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com>
 <1jmsahcbkv.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jmsahcbkv.fsf@starbuckisacylon.baylibre.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 9 Jun 2025 08:43:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WzN9Evge-v30NA64Q=QPJR8hkZAhmLXxDekXXFMFrd9g@mail.gmail.com>
X-Gm-Features: AX0GCFvkFbIIK7ULGaQhmTqdCQ0r1uM5Yw-QxUNG98qVpJtj4RBGOmfISaSOf8g
Message-ID: <CAD=FV=WzN9Evge-v30NA64Q=QPJR8hkZAhmLXxDekXXFMFrd9g@mail.gmail.com>
Subject: Re: [PATCH v4 3/8] drm/bridge: ti-sn65dsi86: use the auxiliary device
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Ertman <david.m.ertman@intel.com>, 
 Ira Weiny <ira.weiny@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich <dakr@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 platform-driver-x86@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
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

On Mon, Jun 9, 2025 at 6:02=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.com>=
 wrote:
>
> On Tue 25 Feb 2025 at 08:04, Doug Anderson <dianders@chromium.org> wrote:
>
> > Hi,
> >
> > On Tue, Feb 18, 2025 at 11:30=E2=80=AFAM Jerome Brunet <jbrunet@baylibr=
e.com> wrote:
> >>
> >> The auxiliary device creation of this driver is simple enough to
> >> use the available auxiliary device creation helper.
> >>
> >> Use it and remove some boilerplate code.
> >>
> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> >> ---
> >>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 49 +++++---------------------=
---------
> >>  1 file changed, 7 insertions(+), 42 deletions(-)
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > I'll snooze this for a bunch of weeks and check back to see if this
> > can be landed in drm-misc-next every once in a while. If you notice
> > that drm-misc-next has the necessary patches before I do then feel
> > free to poke me and I'll commit it.
>
> Hi Doug,
>
> FYI, this is safe to take with v6.16-rc1.
> Please let know in case you prefer a resend.

Thanks for the reminder. Unfortunately, I still need to wait. This
patch will need to land through drm-misc-next and that doesn't have
v6.16-rc1 yet.

https://cgit.freedesktop.org/drm/drm-misc/

...presumably v6.16-rc1 will get merged in before too much longer.
I'll try to keep an eye on it.

-Doug
