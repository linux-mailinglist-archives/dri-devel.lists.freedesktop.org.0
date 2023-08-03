Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8B676EE02
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 17:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD64410E617;
	Thu,  3 Aug 2023 15:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE6A10E617
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 15:24:56 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-267fabc8465so552646a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 08:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691076296; x=1691681096;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7MELmtBLgpIAkH6zLFGWNZFur2jT4X5kL3K/Q5XACUw=;
 b=fLEW2On2ibR7NJze1K1StpP+uCIy4SCRk99kGtsdBM4AeX7woMF89USR0LtYaQywdy
 gfYIwI7j/gPKaRzcetqCkIDsEz6rlvXE1bGsR9jzk/IUs9w2xTq9kV+hWT2Dt8Oe8pCQ
 NnVTmraSueK5MeHK5Lq+A5kX/TTR5eXCcM4wKCeYvSz7dLbvhwdt0YQeSb1t9lSlxfX0
 Z8WPJPG/2dgkQuQyCadoSfcWrq84FFbctWjsMkpzjBM0ViPUkQcP0LzAiQeguP/fAZgx
 n9UjCk023dTLt6i1urA7wMpUBV54jmfMbjZ1v9U0S6kkduL5LleUS67bGDh42gahYk9+
 jI3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691076296; x=1691681096;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7MELmtBLgpIAkH6zLFGWNZFur2jT4X5kL3K/Q5XACUw=;
 b=lCCPiDpJnQW9CYwCj13fAk24Ab5eTI7Lqq5VmIBs86/CFwZQaySDWoGFYdt9jOXC3n
 Iv3/o/3Km43wJQP7kaipEMy0/liN4S2JjF2DIXsMYJbgy3m2uhx8pfF6HEZeHUtkh3F/
 8zYzwrxDxyQREizhk5FX5P9S1JHNwO6Vt4/q806Kz0mNMypop9oax5JsQ4jYwATcU7Iu
 FwSXSywedHNMvMZG+NqanR1xfhJiMgY1bwq/K/odw1smeqcXcit9pMB/oBu7bCuj0knw
 74eLcR3R8jo4pQsLBCwX6/7tTj45miVuKqnA8rM0Rj7YYxMgi9XiqvsUtu8HMTWdfZkI
 P8dQ==
X-Gm-Message-State: ABy/qLbfzlBNbsQtexDyKSRYbsPoeBrCDabNKWecgfyJvqRJm9xBUk4p
 jMu4cJjwZoDcCWcROKJC/09GZe8hkKJoGYrO9dA=
X-Google-Smtp-Source: APBJJlEDFvWynE4bzo0k1bR5I+gwvO4FHoNNjxDtXRQs6uvAG6+JXvipcu+b8B9Evyz9YMMhFPvUnJG2YB1HNumOlnM=
X-Received: by 2002:a17:90b:4f81:b0:268:17aa:8b78 with SMTP id
 qe1-20020a17090b4f8100b0026817aa8b78mr16376582pjb.20.1691076295517; Thu, 03
 Aug 2023 08:24:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230803144227.2187749-1-nogikh@google.com>
In-Reply-To: <20230803144227.2187749-1-nogikh@google.com>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 3 Aug 2023 10:24:44 -0500
Message-ID: <CAHCN7x+8Qq6w0eRC0NwBfhgS7XH7fmmPr9xwhR54rWFNY37Ugg@mail.gmail.com>
Subject: Re: drivers/gpu/drm/bridge/samsung-dsim.c link error
To: Aleksandr Nogikh <nogikh@google.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 syzkaller@googlegroups.com, jagan@amarulasolutions.com, dvyukov@google.com,
 m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 3, 2023 at 9:42=E2=80=AFAM Aleksandr Nogikh <nogikh@google.com>=
 wrote:
>
> Hello,
>
> We've been seing the following linker error on arm64 syzbot instances:
>
> ld.lld: error: undefined symbol: phy_mipi_dphy_get_default_config_for_hsc=
lk
> >>> referenced by samsung-dsim.c:731 (drivers/gpu/drm/bridge/samsung-dsim=
.c:731)
> >>>               drivers/gpu/drm/bridge/samsung-dsim.o:(samsung_dsim_ini=
t) in archive vmlinux.a
>
> Steps to reproduce on the latest linux-next:
>
> $ git checkout next-20230803
> $ wget -O '.config' 'https://raw.githubusercontent.com/google/syzkaller/m=
aster/dashboard/config/linux/upstream-arm64-kasan.config'
> $ make CC=3Dclang ARCH=3Darm64 LD=3Dld.lld CROSS_COMPILE=3Daarch64-linux-=
gnu- olddefconfig
>
> This also prints:
>
> WARNING: unmet direct dependencies detected for GENERIC_PHY_MIPI_DPHY
>   Depends on [n]: GENERIC_PHY [=3Dn]
>   Selected by [y]:
>   - DRM_NWL_MIPI_DSI [=3Dy] && DRM_BRIDGE [=3Dy] && DRM [=3Dy] && COMMON_=
CLK [=3Dy] && OF [=3Dy] && HAS_IOMEM [=3Dy]
>   - DRM_SAMSUNG_DSIM [=3Dy] && DRM [=3Dy] && DRM_BRIDGE [=3Dy] && COMMON_=
CLK [=3Dy] && OF [=3Dy] && HAS_IOMEM [=3Dy]
>
> $ make CC=3Dclang ARCH=3Darm64 LD=3Dld.lld CROSS_COMPILE=3Daarch64-linux-=
gnu- -j$(nproc)
>
> The kernel should have still compiled fine even despite the message above=
, right?
>
> Could you please take a look?

GENERIC_PHY_MIPI_DPHY was enabled to use
phy_mipi_dphy_get_default_config() which takes in the pixel clock,
bits-per-pixel, number of lanes and phy structure.  It applies a bunch
of math based on the info passed and fills in the structure, but that
function itself doesn't appear to be referencing phy code, so it's
likely safe.

I think this can be resolved by enabling GENERIC_PHY.  I just checked
linux-next and when I built the arm64 defconfig, it enables
GENERIC_PHY=3Dy, so I don't think this is an issue.  I also checked the
multi_v7_defconfig for ARM and it also sets GENERIC_PHY=3Dy for 32-bit
ARM people using some of the Exynos boards.

I don't know what version of Linux you're trying to build, but I can't
replicate your issue.

adam


>
> --
> Thank you!
> Aleksandr
