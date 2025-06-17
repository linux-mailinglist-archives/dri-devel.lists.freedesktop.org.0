Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07207ADBDF6
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 02:14:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2014710E465;
	Tue, 17 Jun 2025 00:14:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="DflAxZ+d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54BD10E465
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 00:14:05 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-3138e64b3fcso4623800a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 17:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1750119244; x=1750724044;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/xPzkNisft+m84N4JYez02rZP6098OOb7aM1R5PhuhU=;
 b=DflAxZ+dsFu5yZn/XfVNnRPaiEHIGIDJZmuNSl89LmN7Dx6sn+6FfYM2zHENkXPdLN
 LEZ+X9QOvnUyniscJYMg2Gc5O5Tcqs8xW3p7KTk4ZmCFmEClxpru1v6p/qqOA1Lahxcj
 7b1DKai7zlZYbmXBAySlRMsqQEervYiLBPPtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750119244; x=1750724044;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/xPzkNisft+m84N4JYez02rZP6098OOb7aM1R5PhuhU=;
 b=sIXdsm4pvgq007FpUiQf9M1UYZM8+iXxhJ4BVoSNXdRZ/Xg5ojCK8EqWuaC5nvk942
 /S2Yt1QRnsXmgFbhpC4GsHDlzHim4k6O4l1MaYWz0o76W2zRF48MjOV6pRtT3gq4TaPD
 wFSgJ7AcyyH/mKqUN7ZAn8VwJv9zaXQPpUMkrSES/OS7XtCxAXy7iFINwAsOXfcZRLtX
 w1OjkWbNrW9iqmm+EyNCUPWv+tnyuLoP3sRYddbaRwk20zb78bT/cvu3TbwVPEfXfVbO
 iDfyn2qQJs2TOuMoxj31NPJA5iUL4bh4s9W4LlzlMB5ui+/3PEHcYlSJ6ar5mV+vN5bI
 HTAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTou+9kzZmC1dZyfFF+NCW1KMMOXR29Lqi91Xp5u457BsqvW9lldoGpLRA/OiNoVfUFFdSrUdl6YM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDKrKuYQ7EpQHc4hU2Ts5Q/DXrWQ/WKOSvG5Zvbd38Da/hDRRp
 DLakbKf0pvieFq7T2+Xz5CD+8kkBZ7oa6aRUOGAK6xGzuAy/n7uCJ2FzgWquh0++j6toCEkc2r8
 B6sY=
X-Gm-Gg: ASbGnctkypx43lv88LFz4vfPth+IBpNDn27HjVMghptA8ioBGQ2uAQ7M01+WzrL/nQN
 QzQkpGpu/JPKk2Gi4HC+p3hI1g9pyke06RfG628TKiIfe486K80Wzd0bK8sO368W+UEo9ml+bGO
 ZNp1TIndXkxHYywtTtEK5SXu4rtt7xZLbj9ifSh657O1p/kHcwOJX2knauUnoXZ/wIKHcnqIe7c
 neF0DnEI5dNgKQvxGt1ExICSu7btSU1O7aa5xqd2EUXh2gKIANT5x/SPFaNxZojxCEurdYt9P6j
 vestMaEqDzd+I/ExT7kqbSgXXYFHtabBKMhsyKNmAF9mzAMONVKD1IhnQHXlZokgmYN9AKNxg3N
 asxWNCdV2CvWPkh9zX3elywqbjQ==
X-Google-Smtp-Source: AGHT+IGu+5BmEpT0YyH2A0lv7tRBR+N7DK9UX9xuYwYxhFgLEOgmezE7Pql2qnvUA6jrcrhjIt3hAA==
X-Received: by 2002:a17:90b:274d:b0:311:c939:c848 with SMTP id
 98e67ed59e1d1-313f19d0359mr20147313a91.0.1750119243914; 
 Mon, 16 Jun 2025 17:14:03 -0700 (PDT)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com.
 [209.85.216.43]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-313c1b59ed4sm9314295a91.39.2025.06.16.17.14.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jun 2025 17:14:02 -0700 (PDT)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-31223a4cddeso3739207a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 17:14:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVrqTvq6hXeYGeK4x7egqDeMSr22h8Gjrkz5MzZmhv8/NA0EsDKqtnTgrT5saydtncgRNYZBo2Qq08=@lists.freedesktop.org
X-Received: by 2002:a17:90a:da8f:b0:311:ae39:3dad with SMTP id
 98e67ed59e1d1-313f1d05b32mr18262369a91.30.1750119242065; Mon, 16 Jun 2025
 17:14:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
 <20250218-aux-device-create-helper-v4-3-c3d7dfdea2e6@baylibre.com>
 <CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com>
 <1jmsahcbkv.fsf@starbuckisacylon.baylibre.com>
 <CAD=FV=WzN9Evge-v30NA64Q=QPJR8hkZAhmLXxDekXXFMFrd9g@mail.gmail.com>
In-Reply-To: <CAD=FV=WzN9Evge-v30NA64Q=QPJR8hkZAhmLXxDekXXFMFrd9g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 16 Jun 2025 17:13:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UOucHSqgGE_OfW9MAeLbwqtk1emCiByxJw-LpQnCbDww@mail.gmail.com>
X-Gm-Features: AX0GCFs2ZyAAIENHNjz3BASVq2N7KuTDsUG8ACNS6wvc-Dx4zSZzUpIgLa-Czmw
Message-ID: <CAD=FV=UOucHSqgGE_OfW9MAeLbwqtk1emCiByxJw-LpQnCbDww@mail.gmail.com>
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

On Mon, Jun 9, 2025 at 8:43=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Mon, Jun 9, 2025 at 6:02=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.co=
m> wrote:
> >
> > On Tue 25 Feb 2025 at 08:04, Doug Anderson <dianders@chromium.org> wrot=
e:
> >
> > > Hi,
> > >
> > > On Tue, Feb 18, 2025 at 11:30=E2=80=AFAM Jerome Brunet <jbrunet@bayli=
bre.com> wrote:
> > >>
> > >> The auxiliary device creation of this driver is simple enough to
> > >> use the available auxiliary device creation helper.
> > >>
> > >> Use it and remove some boilerplate code.
> > >>
> > >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > >> ---
> > >>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 49 +++++-------------------=
-----------
> > >>  1 file changed, 7 insertions(+), 42 deletions(-)
> > >
> > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > >
> > > I'll snooze this for a bunch of weeks and check back to see if this
> > > can be landed in drm-misc-next every once in a while. If you notice
> > > that drm-misc-next has the necessary patches before I do then feel
> > > free to poke me and I'll commit it.
> >
> > Hi Doug,
> >
> > FYI, this is safe to take with v6.16-rc1.
> > Please let know in case you prefer a resend.
>
> Thanks for the reminder. Unfortunately, I still need to wait. This
> patch will need to land through drm-misc-next and that doesn't have
> v6.16-rc1 yet.
>
> https://cgit.freedesktop.org/drm/drm-misc/
>
> ...presumably v6.16-rc1 will get merged in before too much longer.
> I'll try to keep an eye on it.

Pushed to drm-misc-next:

[3/8] drm/bridge: ti-sn65dsi86: use the auxiliary device
      commit: 6526b02e10209608464f2645af59b2cc955b5a19
