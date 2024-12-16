Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D02D9F3193
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 14:33:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C0AB10E67B;
	Mon, 16 Dec 2024 13:33:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
 [209.85.217.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C975E10E67B
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 13:33:32 +0000 (UTC)
Received: by mail-vs1-f49.google.com with SMTP id
 ada2fe7eead31-4affd0fb6adso1040356137.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 05:33:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734356011; x=1734960811;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2YeQ/juaU1aTYjB8NikAS7tXvAIBonFs53JoSLLpdzU=;
 b=UXdjRGMrQ3Ygn7cDse/ZYEvC5IRK/dTT2qkzKpba57SYfc1KTqA21Z+XQZh2yF9+RZ
 GQ3I3UKERyySOF+qBSrpza93GBlP1cuNuhOX4CKIXV2hu2VFxHcL4mgcXBJDTr7FC/KS
 mp4MOc6byquZirTffKx1Faa6rD4fs+lbXnQ+wCEc0SF9u5MVSEBZMGn9R3ypVCp/LOuV
 6WqCsjcAFVONLg9SA2WJ16i96InamabN69t3sKAZwQCUXQhuZFno8Lncki9XwN2ck3kl
 ZosB4cOomqQQBYUpqSSeAebh6Nxe5zB4PK1HK5I10aIZqZKX+2P6l+nOr9RgZ0mHS+Wr
 QoSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFhU6rmooon4uzxqDnT5BO8C6NZNrnvf0NsFOJ3DsSmQFlvlHO3pYAVr7Ox56Aov37MNZ12gfD2Yg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyX/SrP3yehLdL+5u4Rhfp+cVjiU8ovBcLvC7HS+S6lcQM1hJFH
 qvb9mgxyI7ZNxILxPzJRrqv8avWx4tXfjXI0jbAKIF4U7gd7Epi1jNgbVga8
X-Gm-Gg: ASbGncsdFEBIKn0qqqLMKdP8gzr1rzc8OCVA7pMDf/IfMvUQsLDq5EE4xcixelSkX37
 VwGD+avRHy66F+FbbMpk77nqk/RY6STTIbge0Cm+pQHNlIzkaGTAlva/qzf43o07ebTB0186gB0
 fxXYFJfRYEOAoHqKWnQ/L+rBVOe8BtAa7RV1mVZwwe96FtwAzdxFE5tMQ+H/sHlqzHvkdAN2c9E
 LEY+hrcwO6U+lMqYe2ORcmLMj2vMJwnSXsZTv1ScBBSmKO4i3nKLd8ptE5xCmKzGRZoE+iyvA1a
 T4RbIAA58JanQdW5e3o=
X-Google-Smtp-Source: AGHT+IEgvGU5p1BlN7T29eKc/iHNAH09DEBy41MVhQYkXrRbZ1rn/tOpAMYPQJtvBZg5zy6qDILbyw==
X-Received: by 2002:a05:6102:b02:b0:4af:dcbe:4767 with SMTP id
 ada2fe7eead31-4b25d98d34bmr10283150137.10.1734356011125; 
 Mon, 16 Dec 2024 05:33:31 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com.
 [209.85.217.47]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-860ab74b611sm818066241.36.2024.12.16.05.33.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 05:33:30 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id
 ada2fe7eead31-4afe70b41a8so1129062137.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 05:33:30 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW3goZROBXTanfyyGTEEy6NvqY1FuLheiPt1ftsmZdisTfJtMYS90mw2FlK9ilfSFxVH9vbkUxiBl4=@lists.freedesktop.org
X-Received: by 2002:a05:6102:b02:b0:4af:dcbe:4767 with SMTP id
 ada2fe7eead31-4b25d98d34bmr10283091137.10.1734356010555; Mon, 16 Dec 2024
 05:33:30 -0800 (PST)
MIME-Version: 1.0
References: <20241206-rcar-gh-dsi-v3-0-d74c2166fa15@ideasonboard.com>
 <20241206-rcar-gh-dsi-v3-10-d74c2166fa15@ideasonboard.com>
In-Reply-To: <20241206-rcar-gh-dsi-v3-10-d74c2166fa15@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Dec 2024 14:33:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXkXx6+0nJn+uLCAWOXvEYWLJXzLu9J7ksinn_z3bEfHQ@mail.gmail.com>
Message-ID: <CAMuHMdXkXx6+0nJn+uLCAWOXvEYWLJXzLu9J7ksinn_z3bEfHQ@mail.gmail.com>
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

Hi Tomi,

On Fri, Dec 6, 2024 at 10:33=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>
> Add support for the mini DP output on the Gray Hawk board.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks for your patch, which is now commit b1000645dc29701f
("arm64: dts: renesas: gray-hawk-single: Add DisplayPort support")
in renesas-devel/renesas-dts-for-v6.14.

Apparently this patch breaks s2idle on Gray Hawk Single when "[PATCH
v3 06/10] drm/rcar-du: dsi: Add r8a779h0 support" is not present, or
when CONFIG_DRM_RCAR_USE_MIPI_DSI is not enabled. If the DSI driver
is not available, the ti_sn65dsi86.bridge part fails to probe with
-EPROBE_DEFER and "failed to attach dsi host".  Still, the sn65dsi86
driver must do something critical, as resuming from s2idle now hangs.
I haven't identified yet where exactly it hangs.

As a result, s2idle is broken in current renesas-devel, which only
has the DTS changes.  Perhaps I should drop the DTS until the issue
is resolved?

However, I suspect White Hawk has the same issue (if
CONFIG_DRM_RCAR_USE_MIPI_DSI=3Dn), but I cannot verify as my local White
Hawk is currently not available for kernel testing.

Do you have a clue?
Thanks!

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
