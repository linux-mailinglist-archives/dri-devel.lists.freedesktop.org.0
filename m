Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACF69F4C33
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 14:29:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED7C510E1E5;
	Tue, 17 Dec 2024 13:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com
 [209.85.221.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A2410E1E5
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 13:29:19 +0000 (UTC)
Received: by mail-vk1-f174.google.com with SMTP id
 71dfb90a1353d-5160f80e652so1329236e0c.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 05:29:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734442158; x=1735046958;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cmkHaZD6J8lgJAaNNA2tVsqfCUgS7g2I77JqUK/2el8=;
 b=GcNL8wRBqkdiL3zD3/11uJjTbt4rhi79N8Hix+nzgyFCnmGH2vpCaZFBZnBOtnlMMR
 kDN920l81ERvuLM22r9rEcW3fnU+lNhSVsZPaMFAI5HZiv1jnos14zxc7iy4VB57wPID
 CL5hb3m9dgWkKuYDVpDHBpkTqPbFp6DDYA0xZ9AUH5ri68yMdQGNYL0TZ4pGHI1Sv2bL
 yKcbLEZsS+cbaab4bjAtIZy9TT80efoh2Jw3jAYmdXn+GlPR5ja12QV6Yu3BKSS8areo
 1DWCVeJyjCq9V7wL0rYESj5SM5ps5bJSgSgT2VAoZSiyOtg1XTitzhriezbIZvEkanre
 2S6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX79RU+8f5d8nYNfoNqOaA0uMB5CITKFNHDKuH7Rx6aa3SU2osNcPPdr8/XYW5NA09V9buD4PVX3uM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWVz/+mCT1q0yOAGLmWxkbBqdgr5EOgJWb9uB4T5BfQ442WrZn
 EH1SslI/1wmamDqmwjEQdl3BeMqzm0GF6h81EDyuBePkwDswEF2oOvCBdaDd
X-Gm-Gg: ASbGncvQhAg0BjMchMJr/tcXKdj9k7x8AmYZ5TG7FG4TMctKpxIIsuqKigsd5FbtySN
 fY1KZAYki41OJsFsvjJ4jVQp86BwKVT0tOstephJSLYilxHcsKcyd1AI/iSwoqlfhlugWZuAD42
 Zepjm64VKjiCwkJaVt//vWxfignNDgLNPlMoIMoiJV/4fYFMdWzRC7GjpAkojTEV9Yq3qq2zuyh
 0ITQ8ZWD0eHsCq8sSttCFQngnLpaPkSfPW8bbS59+rx16/Pj9PxGwnUT3ilR9IHqkI/8/WM7VuE
 oy6C7VKZ6uHSD2f244Y=
X-Google-Smtp-Source: AGHT+IGpU4CxZ/BaGxzVhpwMJ2QsDNYa2zqSDMVB9ygj4zI+U9ixjnjJvHTESi3cjmBJDp3EQD63DQ==
X-Received: by 2002:a05:6122:1da9:b0:516:1b30:8797 with SMTP id
 71dfb90a1353d-518ca32f2c7mr14012032e0c.11.1734442158067; 
 Tue, 17 Dec 2024 05:29:18 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com.
 [209.85.217.50]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-519e35df9dbsm913510e0c.14.2024.12.17.05.29.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 05:29:17 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id
 ada2fe7eead31-4aff5b3845eso1720024137.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 05:29:17 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXr7MYQpMgFElQdCpo+QO8tJWNT51dNO0koy7q4WujD8I7OiXxg/YCtdL0NmUxVomYGxljaIaAVXUY=@lists.freedesktop.org
X-Received: by 2002:a05:6102:32c7:b0:4b1:130f:9fc0 with SMTP id
 ada2fe7eead31-4b25d9e28a4mr17003299137.16.1734442157476; Tue, 17 Dec 2024
 05:29:17 -0800 (PST)
MIME-Version: 1.0
References: <20241206-rcar-gh-dsi-v3-0-d74c2166fa15@ideasonboard.com>
 <20241206-rcar-gh-dsi-v3-10-d74c2166fa15@ideasonboard.com>
 <CAMuHMdXkXx6+0nJn+uLCAWOXvEYWLJXzLu9J7ksinn_z3bEfHQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXkXx6+0nJn+uLCAWOXvEYWLJXzLu9J7ksinn_z3bEfHQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Dec 2024 14:29:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWx5v24UMV7DabxUcYJUeetGeiWidGurT2vEWRw4BTrNg@mail.gmail.com>
Message-ID: <CAMuHMdWx5v24UMV7DabxUcYJUeetGeiWidGurT2vEWRw4BTrNg@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] arm64: dts: renesas: gray-hawk-single: Add
 DisplayPort support
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 LUU HOAI <hoai.luu.ub@renesas.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-clk@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
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

On Mon, Dec 16, 2024 at 2:33=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> On Fri, Dec 6, 2024 at 10:33=E2=80=AFAM Tomi Valkeinen
> <tomi.valkeinen@ideasonboard.com> wrote:
> > From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >
> > Add support for the mini DP output on the Gray Hawk board.
> >
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Thanks for your patch, which is now commit b1000645dc29701f
> ("arm64: dts: renesas: gray-hawk-single: Add DisplayPort support")
> in renesas-devel/renesas-dts-for-v6.14.
>
> Apparently this patch breaks s2idle on Gray Hawk Single when "[PATCH
> v3 06/10] drm/rcar-du: dsi: Add r8a779h0 support" is not present, or
> when CONFIG_DRM_RCAR_USE_MIPI_DSI is not enabled. If the DSI driver
> is not available, the ti_sn65dsi86.bridge part fails to probe with
> -EPROBE_DEFER and "failed to attach dsi host".  Still, the sn65dsi86
> driver must do something critical, as resuming from s2idle now hangs.
> I haven't identified yet where exactly it hangs.
>
> As a result, s2idle is broken in current renesas-devel, which only
> has the DTS changes.  Perhaps I should drop the DTS until the issue
> is resolved?
>
> However, I suspect White Hawk has the same issue (if
> CONFIG_DRM_RCAR_USE_MIPI_DSI=3Dn), but I cannot verify as my local White
> Hawk is currently not available for kernel testing.

Confirmed on White Hawk by Tomi and me.

When the hang occurs, magic sysrq no longer works. However, the system
still prints "nfs server not responding" once in a while, so I added
calls to various sysrq print functions to rpc_check_timeout().
This revealed that the system is blocked on wait_for_completion()
in dpm_wait_for_superior(), called from device_resume_noirq().
Printing the actual device and parent gives:

    platform fed80000.dsi-encoder: PM: device_resume_noirq
    platform fed80000.dsi-encoder: PM: dpm_wait_for_superior: parent
fed80000.dsi-encoder

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
