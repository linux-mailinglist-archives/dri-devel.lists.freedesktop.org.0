Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EE4A44595
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 17:13:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBFD410E743;
	Tue, 25 Feb 2025 16:13:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Xq4CtuMg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F0710E743
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 16:13:11 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-aaecf50578eso1136126466b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 08:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1740499989; x=1741104789;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lwUSC8OCkUHVVAACMeGE7Ik1ANgp9jf6fyVgqusnzdY=;
 b=Xq4CtuMgG8w5xhwaAzvv22DHY2JaLtz69WkZQOLIpVKjsfIRqiMq8SQvZLjaqRwxVT
 7Vj0v2w0LebUwFFVlblt+GyU5E6eIViZvrb5pKRhK04Rw5/TLfCnDWd/D1Zc6vS4QRYV
 VfBxDt3on4d+TFXEqViX4EXewiwWleCeX4mNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740499989; x=1741104789;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lwUSC8OCkUHVVAACMeGE7Ik1ANgp9jf6fyVgqusnzdY=;
 b=jZ+5H0ChlLlcu8tYic0tGkaBJ7+CCn0Hfi5ZaTBfFx5ud+4VG8CWN6FyrlRHLRxw9k
 6lj4Z7VQsO8VxfcYFXriiakpSmaBFfR+aPfymYiAagxWwPtZoj9TajICroaP9BDWu8FV
 ApGbx7KQ3QhPv36ni8MzzWxPsq6QOWdJ5j0SyfRCRTxjGTHBaUle+GbOuYcQSXvWNiYB
 8z7F834f6PGYCB1PZK7t0+3HETqwUEyMYoFqujwBrmAvsD7jjbQ02p/X5GptiPYFwRwG
 XU2NR/VMAM0zT/kR09ZZVB7Vi3Y5HyAkVhJiJu/iuwWf4kFz8trysYbxn3YkkH6dFsbO
 ZZaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7dR97pfZFHZa03gDHlobuoJ29Q7Kt0z0TCj00QxmCWlPVxl/Rj578EX01vgH8Meps6J+00FtcvJU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfIe1kRy5gJ2rIm+Bi7lsbl+toyLmcUWrI/1cm6HLIWFaw9aE0
 d4XXMv+W2PH1/VuL2I3D9viDunGUpS0c1jVxlYnGyiDU8L2SgjFgpvICAvR2XHyJ702uWqnfGgs
 FZGvL
X-Gm-Gg: ASbGncvR+/xTRp+C7euzTUtowKsEzKfvIA4dSOP0RL9MYzOxMDDS8Fn51nC8hP2y42S
 WMxipj7I/M99sxEXB0XpsFN1nsr1Ftuprt1u5bOTVBRSMrF5WalLUmA3MRhDiM+9ZnxhMpKjSa+
 2vExw6p4PJQYZ72fUf0tRD2bHgDqECwTPcxG1ioINKXKPNO7WUH9N5a9mDLlKUUZPPmqYaYDtsf
 r0HGpk7HqDKH9vW4L5/0Eqv2MvVdp+s57Z2XQu1jYJ5WZGz7YWeCH1qH8mo5oc+Q6AqjZ0HcLhF
 GrYZHpX0083SBa9DLAVO1nPOr3VmwH4A1wHMjDmUsJ1Vco8USWFMGtX8YYpSdCzUaA==
X-Google-Smtp-Source: AGHT+IF369YEmmy3HVP56DXmTHD7jXsOKZt68IPn/I7YJ/ZGCPpHy/zYIDHCXc3IuulXQRIj9tUh2Q==
X-Received: by 2002:a17:906:3598:b0:abe:e814:ecb4 with SMTP id
 a640c23a62f3a-abee814f108mr92580066b.4.1740499989475; 
 Tue, 25 Feb 2025 08:13:09 -0800 (PST)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com.
 [209.85.218.41]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abed2054d73sm163432366b.145.2025.02.25.08.13.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 08:13:09 -0800 (PST)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-aaf3c3c104fso994022066b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 08:13:09 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWwdfvxJDQtgOqL/eH3ih/B3Xac7m1gk89/2wO7WHWCmfzrlvZyXOUE0mgDKSwjs7whdOp/MaZ6dP0=@lists.freedesktop.org
X-Received: by 2002:a05:6512:1241:b0:547:6723:93b6 with SMTP id
 2adb3069b0e04-5483909d1d1mr6678553e87.0.1740499509419; Tue, 25 Feb 2025
 08:05:09 -0800 (PST)
MIME-Version: 1.0
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
 <20250218-aux-device-create-helper-v4-3-c3d7dfdea2e6@baylibre.com>
In-Reply-To: <20250218-aux-device-create-helper-v4-3-c3d7dfdea2e6@baylibre.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 25 Feb 2025 08:04:57 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com>
X-Gm-Features: AWEUYZm3vRrajChqqVao9eJTA9wadMF2aiVVZGdKkNeW96YTlQauMsPFnVVKvC0
Message-ID: <CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com>
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

On Tue, Feb 18, 2025 at 11:30=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.co=
m> wrote:
>
> The auxiliary device creation of this driver is simple enough to
> use the available auxiliary device creation helper.
>
> Use it and remove some boilerplate code.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 49 +++++------------------------=
------
>  1 file changed, 7 insertions(+), 42 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'll snooze this for a bunch of weeks and check back to see if this
can be landed in drm-misc-next every once in a while. If you notice
that drm-misc-next has the necessary patches before I do then feel
free to poke me and I'll commit it.

-Doug
