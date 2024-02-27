Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D14868A87
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 09:10:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39FA510E620;
	Tue, 27 Feb 2024 08:10:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8378210E452
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 08:10:19 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-60908e5fb9eso17509427b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 00:10:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709021418; x=1709626218;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZHKgvHCfQA0dLHWrUBiWkZ5daaE/U0GQuV+47oRC1J8=;
 b=G0Uv4bsWqMu67oJaQkrE6aU6Rfpz+CpiI20Eqy8A4qGHD+eBeu3/AgLCn7PjMuCKA3
 Jq0dVfb0mwS2qw+UYzVywYlNtGiP22c6+6ajSD6ljwEPMOKBrvsO7y963VJLGG5wqYH5
 KBUWxYmLcsCSzmeOPJeLJqMRo/3FbxPj/0uFzmiNowI4NeExnF7FIRykoi9DJjFOPBvn
 8S0l8ciDn3wJW6xr8tEsmz5dHDUrSLuYVoNi1cfl8zyBQ2Ga+ESNnPUSskzQMpyT2BGm
 zWN/4f5dsolhOCgkTilHiRXhBw7qMjqYUVUeLxBXGu8+qZkc5qbWXvJ9+7f6jpdapLfi
 XURw==
X-Gm-Message-State: AOJu0YzlHHbyJKczj+hfR0IVfFwjaeJAx//BeHg4a3zaEcs5hy+eXr4W
 hEVVXsfTuFTULDjcLOVW0NdcVgVXu9pLnM4muN52k0F80o2V4DZUfzu6H6p2R0M=
X-Google-Smtp-Source: AGHT+IH4sY98wkNehPHg+zkcUpMxLqCFza5M1/OB64D+bvz8Trb4XVLyEfHUJUS9jFtCbN2MLgXx5A==
X-Received: by 2002:a81:994c:0:b0:609:151f:cc1c with SMTP id
 q73-20020a81994c000000b00609151fcc1cmr1320667ywg.1.1709021416339; 
 Tue, 27 Feb 2024 00:10:16 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com.
 [209.85.128.174]) by smtp.gmail.com with ESMTPSA id
 o11-20020a81de4b000000b006040d34e58csm1602372ywl.74.2024.02.27.00.10.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 00:10:16 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-608d490a64aso28895947b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 00:10:15 -0800 (PST)
X-Received: by 2002:a25:2e12:0:b0:dcc:58ed:6ecc with SMTP id
 u18-20020a252e12000000b00dcc58ed6eccmr1247229ybu.41.1709021415817; Tue, 27
 Feb 2024 00:10:15 -0800 (PST)
MIME-Version: 1.0
References: <20240227034539.193573-1-aford173@gmail.com>
 <20240227034539.193573-4-aford173@gmail.com>
In-Reply-To: <20240227034539.193573-4-aford173@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Feb 2024 09:10:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUS2gMAZ=L-aj8GOti_cEsnrv6qz6aDLmj5-TOD3JKs7w@mail.gmail.com>
Message-ID: <CAMuHMdUS2gMAZ=L-aj8GOti_cEsnrv6qz6aDLmj5-TOD3JKs7w@mail.gmail.com>
Subject: Re: [PATCH 3/6] arm64: dts: renesas: r8a774e1: Enable GPU
To: Adam Ford <aford173@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 aford@beaconembedded.com, Frank Binns <frank.binns@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
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

On Tue, Feb 27, 2024 at 4:46=E2=80=AFAM Adam Ford <aford173@gmail.com> wrot=
e:
> The GPU on the RZ/G2H is a Rogue GX6650 which uses firmware
> rogue_4.46.6.62_v1.fw available from Imagination.
>
> When enumerated, it appears as:
>  powervr fd000000.gpu: [drm] loaded firmware powervr/rogue_4.46.6.62_v1.f=
w
>  powervr fd000000.gpu: [drm] FW version v1.0 (build 6513336 OS)
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
