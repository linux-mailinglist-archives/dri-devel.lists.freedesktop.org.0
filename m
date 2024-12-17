Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7849F4C96
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 14:42:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26C4310E275;
	Tue, 17 Dec 2024 13:42:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
 [209.85.217.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BF5A10E275
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 13:42:24 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id
 ada2fe7eead31-4b24bc0cc65so3099782137.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 05:42:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734442941; x=1735047741;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=55x747loPYs9UKeI6ysGYmeJmLBuEdA1brrJreZX3rI=;
 b=ZY3+PnG6HB9D1U1AFsnYXyFDmJ26dESKZFOpN9iTiqMGOMy2U5nSHj18E+h7uif0Hh
 MBbUghCzJg8uye5/XzyoIE0uhg/ebZo5QA65Td9m/hxPJX7fitdW0r7jEeIM0C1MDASr
 l17lo1BFfEOI4UPuKuzfiDKWNL2iIoRhrqyYa1YQG93sPzKJZ5K5ooFXvmF3UMDwfFOv
 zz1eBFeHmMlSUrU3aPNAkwb52yErMS7j0ob6DX4UEkgWBkaSRLw8a8KM0oFla0O0IuZ0
 Gp1dZw9FSWVrl8gDp30OPdiYoJUoAR4I254rfmdE2VdmgUPqC7kXNooSH2/widx1v7ry
 pAow==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJqbwwxxF5GA5ol/9aQAbe/oHrck3CcxhOY8qNhhBZUpwZrkFdD3n7J7JghIL26WKF6zr2ZKUmsEg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxyBJb7qKkZbWaJgQ+NymlCr7ho8ro2h1VnHkkoZSOZMy0gRDUx
 k+bWOTTvm0B6dqztU2pmfZmO6qq6LW2chK/1POllKwGdOGQHeRI1QO17hxtT
X-Gm-Gg: ASbGncuB4dHGtr+GJNSCH/xCf4KokNdf+/a4Dl1SjRZP/fvTfqqzq4/5QJeDBwvUx2+
 nLfCOPJNgWzcwp8jum+4q2gPHJ8x4jTTz/SljH9TV2m7N3Ox+q/ztWOISr+ePRvkXB2V7Bu5wOj
 Vv9ZjmUIJuEAT/CBiAoNNyXNWLE1NPk+rAPdnW5uy8ocNQMbZacNXnPKMNeOb1TubuVz1trtQT2
 OQUyJjmFjjl1pa2stPmCFnYTvuklkAp43KvvcRmSzPPbwMiOtfHLwYTHRMEWsxuamN08uVKNQQu
 sxS6kFVxtY4+MSi3jDE=
X-Google-Smtp-Source: AGHT+IGbx6s0uBBMUpdwpkHaxsa3Ck5QZAHwynUwaj3LTzYuI64dq4i/ff92JzQrc5ElbrpmP/oZlQ==
X-Received: by 2002:a05:6102:148c:b0:4b1:102a:5834 with SMTP id
 ada2fe7eead31-4b25ddc652dmr16130509137.21.1734442941062; 
 Tue, 17 Dec 2024 05:42:21 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com.
 [209.85.222.47]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-4b27024d0e7sm1106737137.13.2024.12.17.05.42.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 05:42:20 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id
 a1e0cc1a2514c-85c5a913cffso2620941241.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 05:42:20 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV8UP9mdB55amDKOAGE6YMGN6UB04UkQw4vTX9EoGMIk5RQxtyjy/8vWWMASPxvVFMdTQ67zmDvJTE=@lists.freedesktop.org
X-Received: by 2002:a05:6102:1591:b0:4af:597b:ef with SMTP id
 ada2fe7eead31-4b25dca388dmr15489033137.8.1734442939984; Tue, 17 Dec 2024
 05:42:19 -0800 (PST)
MIME-Version: 1.0
References: <20241206-rcar-gh-dsi-v3-0-d74c2166fa15@ideasonboard.com>
 <20241206-rcar-gh-dsi-v3-10-d74c2166fa15@ideasonboard.com>
 <CAMuHMdXkXx6+0nJn+uLCAWOXvEYWLJXzLu9J7ksinn_z3bEfHQ@mail.gmail.com>
 <CAMuHMdWx5v24UMV7DabxUcYJUeetGeiWidGurT2vEWRw4BTrNg@mail.gmail.com>
In-Reply-To: <CAMuHMdWx5v24UMV7DabxUcYJUeetGeiWidGurT2vEWRw4BTrNg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Dec 2024 14:42:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX+baSFtX-U-w4CBSqMsceDS+RoQY55qs=SmyydK6BLVA@mail.gmail.com>
Message-ID: <CAMuHMdX+baSFtX-U-w4CBSqMsceDS+RoQY55qs=SmyydK6BLVA@mail.gmail.com>
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
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Saravana Kannan <saravanak@google.com>
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

CC Saravana

On Tue, Dec 17, 2024 at 2:29=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> On Mon, Dec 16, 2024 at 2:33=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Fri, Dec 6, 2024 at 10:33=E2=80=AFAM Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote:
> > > From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > >
> > > Add support for the mini DP output on the Gray Hawk board.
> > >
> > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.co=
m>
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.=
com>
> > > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Thanks for your patch, which is now commit b1000645dc29701f
> > ("arm64: dts: renesas: gray-hawk-single: Add DisplayPort support")
> > in renesas-devel/renesas-dts-for-v6.14.
> >
> > Apparently this patch breaks s2idle on Gray Hawk Single when "[PATCH
> > v3 06/10] drm/rcar-du: dsi: Add r8a779h0 support" is not present, or
> > when CONFIG_DRM_RCAR_USE_MIPI_DSI is not enabled. If the DSI driver
> > is not available, the ti_sn65dsi86.bridge part fails to probe with
> > -EPROBE_DEFER and "failed to attach dsi host".  Still, the sn65dsi86
> > driver must do something critical, as resuming from s2idle now hangs.
> > I haven't identified yet where exactly it hangs.
> >
> > As a result, s2idle is broken in current renesas-devel, which only
> > has the DTS changes.  Perhaps I should drop the DTS until the issue
> > is resolved?
> >
> > However, I suspect White Hawk has the same issue (if
> > CONFIG_DRM_RCAR_USE_MIPI_DSI=3Dn), but I cannot verify as my local Whit=
e
> > Hawk is currently not available for kernel testing.
>
> Confirmed on White Hawk by Tomi and me.
>
> When the hang occurs, magic sysrq no longer works. However, the system
> still prints "nfs server not responding" once in a while, so I added
> calls to various sysrq print functions to rpc_check_timeout().
> This revealed that the system is blocked on wait_for_completion()
> in dpm_wait_for_superior(), called from device_resume_noirq().
> Printing the actual device and parent gives:
>
>     platform fed80000.dsi-encoder: PM: device_resume_noirq
>     platform fed80000.dsi-encoder: PM: dpm_wait_for_superior: parent fed8=
0000.dsi-encoder

So it's waiting for itself, i.e. deadlock :-(

When the DSI driver is available:

    rcar-mipi-dsi fed80000.dsi-encoder: PM: device_resume_noirq:627
    rcar-mipi-dsi fed80000.dsi-encoder: PM: dpm_wait_for_superior:280
    rcar-mipi-dsi fed80000.dsi-encoder: PM: dpm_wait_for_superior:296:
parent fed80000.dsi-encoder

still waiting for itself, but it does continue!
Note that the fed80000.dsi-encoder block is now bound, and
"rcar-mipi-dsi" is printed instead of "platform".

fw_devlink issue?

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
