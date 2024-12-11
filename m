Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9390F9EC726
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 09:27:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C11BA10EA9B;
	Wed, 11 Dec 2024 08:27:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F6F10EA9B
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 08:27:38 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id
 a1e0cc1a2514c-85b92397fe2so1181188241.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 00:27:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733905655; x=1734510455;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C/Dej2kYyG3z1bxICL2ZGhKcyvgd9hc7ze7odnxVC8k=;
 b=Eog849xQ2jgNtJ49SUxxIqQ9mwjWHQ51PsOxE0wQ90FNiq8rmwkhf86NAO76c5Dvb3
 BOxLQ52kO//nNm+/9dSSmuZZUbFXs4lktaWIKi8wRsqQmSTRYEba8yxvdVsVZ0BSxE4o
 vhe43rODceKMATJcGUN081Hc09G2hRf0tTjSHpBBDNlmXO3LsmvlXs7iryy3Q4xTzO3/
 xnxLkIVdyq5gXpmJysWO4Tb6YuR1FtoMqaMzUiZ7JWKsOthIS8YeQTMZdQMpngXqnab5
 8bthk4rnZHfj/sIRV0vGtB5JIRoDsyJuf+va9dybfr80v9eYfApVYTyA0fXwNk5Opxkv
 hkUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVmRQL8H7sm+h5TY1Y2evHgDGgLX1d+662JHNUAYAtyHsz+LTvYQFKKhLmCXxLNyVDWwKNpINGcLw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzyq9tECWVoI/0rlJZwykQ19Rjui2Qv5DCEZnh5SA2M1Q4hfJBo
 XdgulYH5MPmciBI2ipFtIi48WXT9w4mq0kCA4tkzCQ617XOBrWuUSmS9+n6v
X-Gm-Gg: ASbGncsjX1Z7EOTbF3JZAXO5Vcm796TQe3HeBYcyTWwmtrbFGiOCTyMINT7rx4nBI/F
 uHF2T00pQy65HuWadBkOacTGl2v3gSYwEqQXBDyaBb4/108ZO8l5zYzJ8tnWVtwBOPHNqY+mLnF
 KjxuJZ9e35BL9zMZvD5JnG8Jlsp2nyCWSamJcTsTnmx/GcCT42ZpE0jPWPG1Imm4FdVief1LX+C
 Rs6p778sX61Q0OuA0oLsdphjhsXsuN5oqWDGt3IoO2bRh/LgUy4O18zbZO9mQdquAicb9fbpFnK
 Ip232wRdEqAesQpj
X-Google-Smtp-Source: AGHT+IFA8V4i6fmJ8kHf/pK+YuLh28R6CCedMNtvvSRJiJkJYbOEJ+gx39+7P8gptSwjAbL8GeBeVQ==
X-Received: by 2002:a05:6102:c90:b0:4af:aae2:7582 with SMTP id
 ada2fe7eead31-4b128f671f7mr1734763137.2.1733905655511; 
 Wed, 11 Dec 2024 00:27:35 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com.
 [209.85.222.50]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-515eae16d52sm1014490e0c.2.2024.12.11.00.27.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 00:27:34 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id
 a1e0cc1a2514c-85c559ed230so814530241.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 00:27:34 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVvmOFTT8gFT3AhaibP5F1mgqAB3h6xklaEhAqms2cKnmXO4DuXMdLLJ7QohYXJGk3dg84T9KwCGvg=@lists.freedesktop.org
X-Received: by 2002:a05:6102:41a7:b0:4b1:16f8:efc4 with SMTP id
 ada2fe7eead31-4b128fd7418mr1958963137.12.1733905653978; Wed, 11 Dec 2024
 00:27:33 -0800 (PST)
MIME-Version: 1.0
References: <7a68a0e3f927e26edca6040067fb653eb06efb79.1733840089.git.geert+renesas@glider.be>
 <CAD=FV=XpRt_ivSDz0Lzc=A+z3KFrXkVYTn716TD1kZMAyoGQ_A@mail.gmail.com>
In-Reply-To: <CAD=FV=XpRt_ivSDz0Lzc=A+z3KFrXkVYTn716TD1kZMAyoGQ_A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Dec 2024 09:27:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXhEcr-XDpD_RHHU4sxVNS7=iUWUNEwdEwS4pEGYzP39w@mail.gmail.com>
Message-ID: <CAMuHMdXhEcr-XDpD_RHHU4sxVNS7=iUWUNEwdEwS4pEGYzP39w@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: Fix multiple instances
To: Doug Anderson <dianders@chromium.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Linus Walleij <linus.walleij@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Greg KH <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
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

Hi Doug,

On Tue, Dec 10, 2024 at 6:09=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
> On Tue, Dec 10, 2024 at 6:19=E2=80=AFAM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > Each bridge instance creates up to four auxiliary devices with differen=
t
> > names.  However, their IDs are always zero, causing duplicate filename
> > errors when a system has multiple bridges:
> >
> >     sysfs: cannot create duplicate filename '/bus/auxiliary/devices/ti_=
sn65dsi86.gpio.0'
> >
> > Fix this by using a unique instance ID per bridge instance.  The
> > instance ID is derived from the I2C adapter number and the bridge's I2C
> > address, to support multiple instances on the same bus.
> >
> > Fixes: bf73537f411b0d4f ("drm/bridge: ti-sn65dsi86: Break GPIO and MIPI=
-to-eDP bridge into sub-drivers")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > On the White Hawk development board:
> >
> >     /sys/bus/auxiliary/devices/
> >     |-- ti_sn65dsi86.aux.1068
> >     |-- ti_sn65dsi86.aux.4140
> >     |-- ti_sn65dsi86.bridge.1068
> >     |-- ti_sn65dsi86.bridge.4140
> >     |-- ti_sn65dsi86.gpio.1068
> >     |-- ti_sn65dsi86.gpio.4140
> >     |-- ti_sn65dsi86.pwm.1068
> >     `-- ti_sn65dsi86.pwm.4140
> >
> > Discussion after v1:
> >   - https://lore.kernel.org/8c2df6a903f87d4932586b25f1d3bd548fe8e6d1.17=
29180470.git.geert+renesas@glider.be
> >
> > Notes:
> >   - While the bridge supports only two possible I2C addresses, I2C
> >     translators may be present, increasing the address space.  Hence th=
e
> >     instance ID calculation assumes 10-bit addressing.  Perhaps it make=
s
> >     sense to introduce a global I2C helper function for this?
> >
> >   - I think this is the simplest solution.  If/when the auxiliary bus
> >     receives support =C3=A0 la PLATFORM_DEVID_AUTO, the driver can be
> >     updated.
> >
> > v2:
> >   - Use I2C adapter/address instead of ida_alloc().
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 ++
> >  1 file changed, 2 insertions(+)
>
> While I agree with Laurent that having a more automatic solution would
> be nice, this is small and fixes a real problem. I'd be of the opinion
> that we should land it.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks!

> If I personally end up being the person to land it, I'll likely wait
> until January since I'll be on vacation soon for the holidays and I
> don't want to check something that's slightly controversial in and
> then disappear. If someone else feels it's ready to land before then I
> have no objections.

There is no need to hurry. The only board I have that needs this has
another issue in its second display pipeline, which will require a
new driver no one is working on yet.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
