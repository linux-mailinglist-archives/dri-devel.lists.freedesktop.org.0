Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 078B6B15055
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 17:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6898C10E025;
	Tue, 29 Jul 2025 15:43:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="OLdVQMxD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 935AD10E025
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 15:43:13 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-24009eeb2a7so23276865ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 08:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753803792; x=1754408592;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vSpJIgrdIeIOJjhVwTw0EcGlPuzf6kCVL4Vd0HFeqjc=;
 b=OLdVQMxD7VrKGxGptjGfRWlvH0odGZr07ZPazDqNUaFXqTvsAVJXGBPV8JH0vwmHcu
 qf4sYYzcdPdG5SH7K4BRUhMEJnbDAsPcpw40WsONsVHO+9LuxJ5ktVh1RGtGiqleYT6O
 9fUdB6z5bw5zoyG6DCKnl0MdSUK0eY7lPzgos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753803792; x=1754408592;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vSpJIgrdIeIOJjhVwTw0EcGlPuzf6kCVL4Vd0HFeqjc=;
 b=i5m+oEjHE8GmzuJwRhkexQ9QOfgEBCDl6aiFh6w112xyveArNi9oA5D8NaiLHHt7l/
 zHUBY7Q1mVelH1oJ4M62kpSQDQDyFzotZySxwBXc4TsNB6rqgIexpCpshm1bzlrjctW6
 EUUG0pK95a5s8ojXfWpiPngQ6cp0dfO26F/WFZwqQCc/J0xIIICzOU1gcc1XMeHGGqFw
 Xi0DF9jEZ4Pc8bTQlzDipW2m1ubF0cbIJnEfULqxbVf0oZootrP8y5LA2gADOmDOA1M/
 mn0Zgx/9EMsiN9u30Gz0ainWHkEw0xqD1TW22FlR3KOb7BpeC6gAGirf3FMqTIBNNVT8
 iWwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVF6ZUQzC72WCvmS/APH/rRLFOPRlDMWM8puHs6jy7Kim2lIG2ZoZz5dRJtQxOn6Gsaan2OM1BbLRE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXLG0EvciOMTJlCf2e4S+JlLjLxFQKki0/TK/Rd8f4CqK0O8lz
 vzAnniA8F1P2EweyFc0+Tlnjlz2MiFHm56yz2TDBddLtATMk/JGnKeW9WXXrjlXHaWIHPUsJqzc
 bI3M=
X-Gm-Gg: ASbGncvxfRDgp4mCMJtelhnePRFc50dYtBEM4MsUp3ytHxrDtu23NuNqy6g9hOPe8Dt
 Cyk49djK9L/ZcROtxa0VSqB4XNXPLsJk0zQLg911C1lPgJ7p4xwR49/2pIP53rgVD0kjySwqYGs
 6YGNfOWPzFnSYG6V/OS4J3lq4Tfp8mz4R9FJeLGW9hH8xy50cJ/3WaSdAtcS/4jQRs6S6EWw2D3
 i2sADXpp6gzlLBmRUXB+opfxo8xstQblKuC8NZSPo3+r4kggHDiIhxiQMXtj4nKSvzFUXjsIwBK
 UETFPC+oAs6c4vIbk6kFhEfx6OE98YtK14FU6WTVyFROxpz8etJylo0ZKfDExhgbkHTHecddGqD
 E12bj2xcf95uQwRm7YMhMveSQpcoasjausjKZoGayeLxe1ri//jbPDJDJTifkcv8gmN2MYpzQ
X-Google-Smtp-Source: AGHT+IHUSdp+CjP1S2HPCImDiIDf1ThQ1K1gtVx5Ct5QZl1gv3KmxdXYl65GcWqCL33VSWbGV4oTlQ==
X-Received: by 2002:a17:903:1547:b0:240:3c64:8626 with SMTP id
 d9443c01a7336-2403c648808mr104159205ad.5.1753803791880; 
 Tue, 29 Jul 2025 08:43:11 -0700 (PDT)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com.
 [209.85.216.52]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2402ea85da7sm48102565ad.37.2025.07.29.08.43.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 08:43:10 -0700 (PDT)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-31ca042d3b8so4838259a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 08:43:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCViPZqWmx+Xxg1Y1FeFoDG7deVO9XETDjI7UNmRCDW8S9ASOG8sdwp8/tdW2PQ1AgGamVYcxhMMusY=@lists.freedesktop.org
X-Received: by 2002:a17:90b:4e8d:b0:31f:2558:46cb with SMTP id
 98e67ed59e1d1-31f25584712mr6855560a91.16.1753803789967; Tue, 29 Jul 2025
 08:43:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250722015313.561966-1-me@brighamcampbell.com>
In-Reply-To: <20250722015313.561966-1-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 29 Jul 2025 08:42:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vpk+sWt6n5+OFrOSa9bUf=5xbcGH6TA2D58HnDcrzArw@mail.gmail.com>
X-Gm-Features: Ac12FXy2DrlKwozrm4Lh8eKlO3PrClRoMybwweQhMtq-dXfeG8sVqMiOcJ65aGQ
Message-ID: <CAD=FV=Vpk+sWt6n5+OFrOSa9bUf=5xbcGH6TA2D58HnDcrzArw@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] drm: Fix bug in panel driver,
 update MIPI support macros
To: Brigham Campbell <me@brighamcampbell.com>
Cc: tejasvipin76@gmail.com, diogo.ivo@tecnico.ulisboa.pt, 
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
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

On Mon, Jul 21, 2025 at 6:53=E2=80=AFPM Brigham Campbell <me@brighamcampbel=
l.com> wrote:
>
> This series removes the unintuitive mipi_dsi_generic_write_seq() macro
> and related mipi_dsi_generic_write_chatty() method from the drm
> subsystem. This is in accordance with a TODO item from Douglas Anderson
> in the drm subsystem documentation. Tejas Vipin (among others) has
> largely spearheaded this effort up until now, converting MIPI panel
> drivers one at a time.
>
> The second patch of the series removes the last remaining references to
> mipi_dsi_generic_write_seq() in the jdi-lpm102a188a driver and updates
> the driver to use the undeprecated _multi variants of MIPI functions. It
> fixes a bug in the driver's unprepare function and cleans up duplicated
> code using the new mipi_dsi_dual* macros introduced in the first patch.
>
> changes to v6:
>  - Fix various style and kerneldoc issues in patch 1/4
>  - Fix typo mpi_dsi_dual... -> mipi_dsi_dual...
>  - Fix incorrectly named "data" and "len" variables
>  - Make _seq argument of mipi_dsi_dual_dcs_write_seq_multi macro
>    variadic
>  - Remove duplicate definition of mipi_dsi_dual_dcs_write_seq_multi
>    macro from novatek display driver
>
> changes to v5:
>  - Rework mipi_dsi_dual to explicitly not support passing macros into
>    _func and add "dual" variants of the generic and dcs write macros.
>  - Make jdi-lpm102a188a use the new
>    mipi_dsi_dual_generic_write_seq_multi macro.
>  - Make local struct variable in jdi-lpm102a188a conform to reverse
>    christmas tree order.
>
> changes to v4:
>  - Fix whitespace (I forgot to run checkpatch. Thanks for your patience
>    as I familiarize myself with the kernel development process)
>  - Initialize mipi_dsi_multi_context struct
>
> changes to v3:
>  - Define new mipi_dsi_dual macro in drm_mipi_dsi.h to reduce code
>    duplication.
>  - Fix bug in lpm102a188a panel driver's unprepare function which causes
>    it to return a nonsensical value.
>  - Make lpm102a188a panel driver's unprepare function send "display off"
>    and "enter sleep mode" commands to both serial interfaces regardless
>    of whether an error occurred when sending the last command.
>
> changes to v2:
>  - Remove all usages of deprecated MIPI functions from jdi-lpm102a188a
>    driver instead of just mipi_dsi_generic_write_seq().
>  - Update TODO item in drm documentation instead of removing it
>    entirely.
>
> Brigham Campbell (4):
>   drm: Create mipi_dsi_dual* macros
>   drm/panel: jdi-lpm102a188a: Fix bug and clean up driver
>   drm: Remove unused MIPI write seq and chatty functions
>   drm: docs: Update task from drm TODO list
>
>  Documentation/gpu/todo.rst                    |  22 +-
>  drivers/gpu/drm/drm_mipi_dsi.c                |  82 +-
>  drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 196 ++---
>  drivers/gpu/drm/panel/panel-novatek-nt36523.c | 804 +++++++++---------
>  include/drm/drm_mipi_dsi.h                    | 118 ++-
>  5 files changed, 614 insertions(+), 608 deletions(-)

Pushed all 4 to drm-misc-next. Technically one of them has a minor
bugfix as mentioned in the commit message, but it's VERY minor (I
didn't even think it needed a Fixes tag) so I didn't worry about
trying to get it into drm-misc-fixes...

[1/4] drm: Create mipi_dsi_dual* macros
      commit: d94a2a00d2b8878678607c2969fee3b4e59126cb
[2/4] drm/panel: jdi-lpm102a188a: Fix bug and clean up driver
      commit: a6adf47d30cccaf3c1936ac9de94948c140e17dd
[3/4] drm: Remove unused MIPI write seq and chatty functions
      commit: 79b6bb18f849818140dd351f6e76a097efe99e9f
[4/4] drm: docs: Update task from drm TODO list
      commit: 85c23f28905cf20a86ceec3cfd7a0a5572c9eb13

-Doug
