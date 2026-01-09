Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77382D0BE00
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 19:39:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BBE410E929;
	Fri,  9 Jan 2026 18:39:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
 [209.85.217.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B287810E929
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 18:39:33 +0000 (UTC)
Received: by mail-vs1-f47.google.com with SMTP id
 ada2fe7eead31-5eea31b5c48so1268426137.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 10:39:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767983973; x=1768588773;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DI2vaQ4j4Y7F+Kqlo0E9lSJxr88gYTxnhRjrPcAUZdM=;
 b=K40IdJ14YuTb1nN4S9i+e0jNPHikq5qYHrRUiSUT2A6+1Dgqok8RYje+CBnwquHfw/
 SUoxrTM8JWAC39JpImPOBAoGHMGCk/QQhrDmbfk+5PhExvf59s5kKSGpXGf1M7NaHRfF
 94MchTXjOvPfyyD1RvZd7YTLxMcu7FG4Jm1JEbc8RotVdIYmodzqg7LmBlkKpJavXxa5
 lmYslxDBAElZC75wMMgGNwYhFs1/DXO0UczjGWCDsLBul6CWSLyVMoN+oadTkTuy2Ota
 Ua2yOfGvf1nniO4Srx8Xn2s/rKNoyrOuLYWuaOc0mgjvcAB7MWrTn3mxVXSI8PjYZOWd
 668w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvjGMDyp+NWR7PUySKL+c5/HLuks/TT5pIdHLL9eXI4CpEebNZOGv3fFzFFZJuxWgucH1baSqMLUQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzi9IRVL/KC/vguduf7dnFu8taz8gA8V1QriBU3Xq019vKWrUCG
 iIYTOTutCHhgjtXCgZEc1n5h4hUrx48X1kF4UFna1u1YIyvJ2TN4fu2Rni8+P6/9
X-Gm-Gg: AY/fxX4kLrjhJca2Hpj+yd6UsTpEUvEJ3ic6/W0N2WmSKI+kyC86Giq/1GH9pPxAkz7
 3yX9PgEBgYBA+H5pwJzBRXZXsDgdjje4EtYweFCbnZtTOrLIjNhnLpYZnamaNCqpMmmEk8NSilc
 3xVac3rKwgUlbRuRc/k/W1abZwrs+dkq+Lx9dLdNEO5I373vNrRUHfXFPCIe+lNFAAQ/c7JyWHa
 OYXmCCxRyCMf5zHyWWq4ObhS5ufGpWivFGJI+BVIeV4uPqwOisOsNGnSr7yRSpIDsXqORWVxm2I
 M8iDrqBRoq0VPnHpoz14UlnNy1DK0m4ilsYwdcS/eekDPZBvRuaVilSar5uQhX/MKPQ4xFA4w7c
 gkKRD8sLnunM1UEWLZOc/CpwUHWaOl4pNwuVdDM39UN9f7D87csPrcCrf3bwVhhNlro53WrJlRb
 0lwl30TdnTHKGtRJGNOzBiHyiE4gE05iDXxy9f+QttlxdBM1ZK
X-Google-Smtp-Source: AGHT+IEufF8slryxXMz8AKDcS0PZ0M59XE+C24JYbxN1RglXwYQ+h5bRVcIoi5JSIt/yQjr7n9qFYg==
X-Received: by 2002:a05:6102:6050:b0:5ed:d33:a65d with SMTP id
 ada2fe7eead31-5ed0d33ae20mr4292015137.34.1767983972693; 
 Fri, 09 Jan 2026 10:39:32 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com.
 [209.85.217.53]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5ee9d013b3csm5750099137.5.2026.01.09.10.39.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jan 2026 10:39:31 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id
 ada2fe7eead31-5eeaae0289bso1020818137.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 10:39:31 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXMleiGIqjFR+oEHScVFSIo8itxnq7Q56ja57Ae5sxgLhxfe7Nsea+GxapOhtTQE0vUmHj2qJ9OXz4=@lists.freedesktop.org
X-Received: by 2002:a05:6102:26cb:b0:5e5:5ed7:60ae with SMTP id
 ada2fe7eead31-5ecb6900d02mr4442716137.31.1767983970833; Fri, 09 Jan 2026
 10:39:30 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <679042b205b9596b79463b89c31d9e3f74cd0e63.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <679042b205b9596b79463b89c31d9e3f74cd0e63.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 19:39:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUt=yQwGw3sgQ9gBhOEa6TWW59srEE69dyzr+Fq6j+=Yw@mail.gmail.com>
X-Gm-Features: AZwV_Qj05tdYznd7IbXD-D9LpPaUhjdHWee49H2zOy9lEKLzWfR8oEQJBva10AA
Message-ID: <CAMuHMdUt=yQwGw3sgQ9gBhOEa6TWW59srEE69dyzr+Fq6j+=Yw@mail.gmail.com>
Subject: Re: [PATCH 08/22] clk: renesas: r9a09g047: Add support for LCDC{0, 1}
 clocks and resets
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
 biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 26 Nov 2025 at 15:09, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add LCDC{0,1} clocks and resets entries to the r9a09g047 CPG driver.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
