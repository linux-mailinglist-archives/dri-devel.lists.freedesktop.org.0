Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 854CF581C6A
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 01:31:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BFAC11A6BC;
	Tue, 26 Jul 2022 23:31:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [IPv6:2607:f8b0:4864:20::e35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B215611A6BC;
 Tue, 26 Jul 2022 23:31:11 +0000 (UTC)
Received: by mail-vs1-xe35.google.com with SMTP id 66so12309684vse.4;
 Tue, 26 Jul 2022 16:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=tbh/X7Ht4Dx204/45EXibcskG7KG366458+3TR9yAn0=;
 b=ZHaRqJhclgp8g+mJJ1ZmPN4jMxZLul658/RFSgwSX5XGmHVNbvckthTLnz548ruTzp
 89/60uqqvuJujhUsfmHx/moY6QedUcjAliBthGo1TGeJWoOMQKpU0Ws0XaxmcOHEZ03M
 SiuFmL9ughIShNHyBFAJjXaSn8vDpJHi7u2VJQ0dr8Gc68O2jC+52tSrr/pkF4QliG4h
 dhx/4U18vRL5ljiL9Ic+Z2kIgyK0P0A0tgpfX6zh+yeyeZHgCM9WJU9n/GDWkSSEPqtW
 Io8Oc7wj3SQzhaOf2M+MtPktr7BrOBae8/+dBkNlvRCitVTc5VDJYZ0qH341z5n1Os44
 6KwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=tbh/X7Ht4Dx204/45EXibcskG7KG366458+3TR9yAn0=;
 b=7bA/BWnYe1/vi6vUB4XHS0ksmfSf5utOtxAQakKRw8wJAvLLjnegUv5ZZ7OhpXTClD
 bYzjCARWhMTDG5aeh7b5XRzLPlODkK4cRyO3lttWiJY0NJPHLB5qIBQk+hQ0GEETXUuA
 dwoqctUv5PTx8dotCaiqgGl/htobTke7UT1iFDb0XGW+Ay111n1Y+pYzYikjSxmNjOnw
 MK+komxf2UDuZC9zx/doDSMcTYQsDZIyRGlSHgOmc3zjR0hMVU+9frrkdOf9xWGOoVZA
 ht/yhVTJp8f3ImXobnnxZV3qKpDrf07xPoDtjYfXjOj8EzYYlvkKojsZezBNzuj4OecL
 jbBg==
X-Gm-Message-State: AJIora9fCous4jCZGjcBlR1zpkg68V85Y2zCm/U2vVtUGN1yx0EItDHg
 nnD57FM3VOQwS91/Hy4FaQDpqAOiGBUEtM8qq7pzvUFJldA=
X-Google-Smtp-Source: AGRyM1s1H0u3nJFZ6XwMRyiiKa0jXD9vGarWKkES/dzsgA6n+1JGubF4i9n0yoEoBM9QyfAdo1FxV6eL52QbON8jOQQ=
X-Received: by 2002:a67:eb83:0:b0:358:7772:c5a5 with SMTP id
 e3-20020a67eb83000000b003587772c5a5mr1619256vso.75.1658878270106; Tue, 26 Jul
 2022 16:31:10 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 27 Jul 2022 09:30:58 +1000
Message-ID: <CAPM=9ty0R37q0mohBr_CegpYLXK2=fAH54QfAsMhHfPygTsdQA@mail.gmail.com>
Subject: [git pull] nouveau display patches
To: dri-devel <dri-devel@lists.freedesktop.org>, 
 nouveau <Nouveau@lists.freedesktop.org>, Ben Skeggs <skeggsb@gmail.com>, 
 Lyude Paul <lyude@redhat.com>
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

Just to work in the process, I've pulled a bunch of patches Lyude
tested, that rework some of the nouveau display code.

Dave.

topic/nouveau-misc-2022-07-27:
drm/nouveau-misc: display patches.

These are just some precursor and cleanup display patches from Ben,
tested by Lyude.
The following changes since commit 89ed996b888faaf11c69bb4cbc19f21475c9050e:

  drm/nouveau/kms/nv50-: remove unused functions (2022-07-13 13:57:15 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/topic/nouveau-misc-2022-07-27

for you to fetch changes up to dfc4005f8c172eea359f9db08c3b2b0ff0153699:

  drm/nouveau/disp: move DAC load detection method (2022-07-27 09:05:49 +1000)

----------------------------------------------------------------
drm/nouveau-misc: display patches.

These are just some precursor and cleanup display patches from Ben,
tested by Lyude.

----------------------------------------------------------------
Ben Skeggs (17):
      drm/nouveau/disp: collapse nvkm_dp into nvkm_outp
      drm/nouveau/disp: clean up nvkm_outp constructors
      drm/nouveau/disp: collapse nv50_disp_func into nvkm_disp_func
      drm/nouveau/disp: collapse nv50_disp into nvkm_disp
      drm/nouveau/disp: add common class handling between <nv50 and >=nv50
      drm/nouveau/disp: merge head/outp/ior code into chipset files
      drm/nouveau/disp: group supervisor-related struct members
      drm/nouveau/disp: merge nv50_disp_new_() and nvkm_disp_new()
      drm/nouveau/disp: replace hda func pointer check with flag
      drm/nouveau/disp: split sor dp funcs out to their own struct
      drm/nouveau/disp: split sor hda funcs out to their own struct
      drm/nouveau/disp: add common channel class handling
      drm/nouveau/disp: add connector class
      drm/nouveau/disp: add conn method to query HPD pin status
      drm/nouveau/disp: add supervisor mutex
      drm/nouveau/disp: add output class
      drm/nouveau/disp: move DAC load detection method

 drivers/gpu/drm/nouveau/dispnv50/base507c.c        |   17 +-
 drivers/gpu/drm/nouveau/dispnv50/core507d.c        |    4 +-
 drivers/gpu/drm/nouveau/dispnv50/curs507a.c        |    6 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |   43 +-
 drivers/gpu/drm/nouveau/dispnv50/oimm507b.c        |    6 +-
 drivers/gpu/drm/nouveau/dispnv50/ovly507e.c        |   17 +-
 drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c        |    7 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c            |    9 -
 drivers/gpu/drm/nouveau/dispnv50/wndw.h            |    3 -
 drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c        |    7 +-
 drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c        |    1 -
 drivers/gpu/drm/nouveau/include/nvif/cl5070.h      |    8 -
 drivers/gpu/drm/nouveau/include/nvif/cl507a.h      |   12 -
 drivers/gpu/drm/nouveau/include/nvif/cl507b.h      |   12 -
 drivers/gpu/drm/nouveau/include/nvif/cl507c.h      |   13 -
 drivers/gpu/drm/nouveau/include/nvif/cl507d.h      |   12 -
 drivers/gpu/drm/nouveau/include/nvif/cl507e.h      |   13 -
 drivers/gpu/drm/nouveau/include/nvif/class.h       |  141 +--
 drivers/gpu/drm/nouveau/include/nvif/clc37b.h      |   11 -
 drivers/gpu/drm/nouveau/include/nvif/clc37e.h      |   13 -
 drivers/gpu/drm/nouveau/include/nvif/conn.h        |   18 +
 drivers/gpu/drm/nouveau/include/nvif/disp.h        |    2 +
 drivers/gpu/drm/nouveau/include/nvif/if0010.h      |   13 +
 drivers/gpu/drm/nouveau/include/nvif/if0011.h      |   23 +
 drivers/gpu/drm/nouveau/include/nvif/if0012.h      |   23 +
 drivers/gpu/drm/nouveau/include/nvif/if0014.h      |   13 +
 drivers/gpu/drm/nouveau/include/nvif/outp.h        |   14 +
 drivers/gpu/drm/nouveau/include/nvif/printf.h      |    9 +
 drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h |   43 +-
 .../gpu/drm/nouveau/include/nvkm/subdev/bios/dcb.h |    1 +
 drivers/gpu/drm/nouveau/nouveau_bios.c             |    2 +
 drivers/gpu/drm/nouveau/nouveau_connector.c        |   10 +
 drivers/gpu/drm/nouveau/nouveau_connector.h        |    3 +-
 drivers/gpu/drm/nouveau/nouveau_dp.c               |   12 +-
 drivers/gpu/drm/nouveau/nouveau_encoder.h          |    3 +-
 drivers/gpu/drm/nouveau/nvif/Kbuild                |    2 +
 .../{nvkm/engine/disp/rootga102.c => nvif/conn.c}  |   60 +-
 drivers/gpu/drm/nouveau/nvif/disp.c                |   61 +-
 .../{nvkm/engine/disp/rootg94.c => nvif/outp.c}    |   65 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/Kbuild    |  115 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c    |  139 ++-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/baseg84.c |   74 --
 .../gpu/drm/nouveau/nvkm/engine/disp/basegf119.c   |  108 --
 .../gpu/drm/nouveau/nvkm/engine/disp/basegp102.c   |   32 -
 .../gpu/drm/nouveau/nvkm/engine/disp/basenv50.c    |  119 --
 .../gpu/drm/nouveau/nvkm/engine/disp/capsgv100.c   |   60 -
 drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c    |  275 +++++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.h    |  135 +++
 .../gpu/drm/nouveau/nvkm/engine/disp/changf119.c   |   62 --
 .../gpu/drm/nouveau/nvkm/engine/disp/changv100.c   |   34 -
 .../gpu/drm/nouveau/nvkm/engine/disp/channv50.c    |  364 ------
 .../gpu/drm/nouveau/nvkm/engine/disp/channv50.h    |  193 ----
 drivers/gpu/drm/nouveau/nvkm/engine/disp/conn.c    |    6 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/conn.h    |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/coreg84.c |  111 --
 drivers/gpu/drm/nouveau/nvkm/engine/disp/coreg94.c |   57 -
 .../gpu/drm/nouveau/nvkm/engine/disp/coregf119.c   |  231 ----
 .../gpu/drm/nouveau/nvkm/engine/disp/coregk104.c   |  126 ---
 .../gpu/drm/nouveau/nvkm/engine/disp/coregp102.c   |   70 --
 .../gpu/drm/nouveau/nvkm/engine/disp/coregv100.c   |  207 ----
 .../gpu/drm/nouveau/nvkm/engine/disp/corenv50.c    |  234 ----
 .../gpu/drm/nouveau/nvkm/engine/disp/cursgf119.c   |   32 -
 .../gpu/drm/nouveau/nvkm/engine/disp/cursgp102.c   |   32 -
 .../gpu/drm/nouveau/nvkm/engine/disp/cursgv100.c   |   81 --
 .../gpu/drm/nouveau/nvkm/engine/disp/cursnv50.c    |   64 --
 .../gpu/drm/nouveau/nvkm/engine/disp/dacgf119.c    |   70 --
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dacnv50.c |  121 --
 .../gpu/drm/nouveau/nvkm/engine/disp/dmacgf119.c   |   96 --
 .../gpu/drm/nouveau/nvkm/engine/disp/dmacgp102.c   |   64 --
 .../gpu/drm/nouveau/nvkm/engine/disp/dmacgv100.c   |   79 --
 .../gpu/drm/nouveau/nvkm/engine/disp/dmacnv50.c    |  137 ---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c      |  457 ++++----
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.h      |   33 -
 drivers/gpu/drm/nouveau/nvkm/engine/disp/g84.c     |  291 ++++-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/g94.c     |  341 +++++-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.c   |  120 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gf119.c   | 1041 +++++++++++++++++-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gk104.c   |  275 ++++-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gk110.c   |   23 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gm107.c   |   78 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gm200.c   |  146 ++-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gp100.c   |   52 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gp102.c   |  144 ++-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gt200.c   |   73 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gt215.c   |  172 ++-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c   |  883 ++++++++++++++-
 .../gpu/drm/nouveau/nvkm/engine/disp/hdagf119.c    |   62 --
 .../gpu/drm/nouveau/nvkm/engine/disp/hdagt215.c    |   51 -
 .../gpu/drm/nouveau/nvkm/engine/disp/hdagv100.c    |   30 -
 drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmig84.c |   91 --
 .../gpu/drm/nouveau/nvkm/engine/disp/hdmigf119.c   |   82 --
 .../gpu/drm/nouveau/nvkm/engine/disp/hdmigk104.c   |   82 --
 .../gpu/drm/nouveau/nvkm/engine/disp/hdmigm200.c   |   36 -
 .../gpu/drm/nouveau/nvkm/engine/disp/hdmigt215.c   |   91 --
 .../gpu/drm/nouveau/nvkm/engine/disp/hdmigv100.c   |   84 --
 drivers/gpu/drm/nouveau/nvkm/engine/disp/head.c    |    4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/head.h    |   19 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/headgf119.c   |  104 --
 .../gpu/drm/nouveau/nvkm/engine/disp/headgv100.c   |  105 --
 .../gpu/drm/nouveau/nvkm/engine/disp/headnv04.c    |   74 --
 .../gpu/drm/nouveau/nvkm/engine/disp/headnv50.c    |   99 --
 drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.c     |   10 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h     |   95 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp77.c   |   40 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp89.c   |   54 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/nv04.c    |   55 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c    | 1159 +++++++++++++++++---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.h    |  102 --
 .../gpu/drm/nouveau/nvkm/engine/disp/oimmgf119.c   |   32 -
 .../gpu/drm/nouveau/nvkm/engine/disp/oimmgp102.c   |   32 -
 .../gpu/drm/nouveau/nvkm/engine/disp/oimmnv50.c    |   64 --
 drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c    |   28 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h    |   41 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/ovlyg84.c |   71 --
 .../gpu/drm/nouveau/nvkm/engine/disp/ovlygf119.c   |   95 --
 .../gpu/drm/nouveau/nvkm/engine/disp/ovlygk104.c   |   97 --
 .../gpu/drm/nouveau/nvkm/engine/disp/ovlygp102.c   |   32 -
 .../gpu/drm/nouveau/nvkm/engine/disp/ovlygt200.c   |   74 --
 .../gpu/drm/nouveau/nvkm/engine/disp/ovlynv50.c    |  107 --
 .../gpu/drm/nouveau/nvkm/engine/disp/piocgf119.c   |   78 --
 .../gpu/drm/nouveau/nvkm/engine/disp/piocnv50.c    |   87 --
 .../gpu/drm/nouveau/nvkm/engine/disp/piornv50.c    |  139 ---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h    |   75 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/rootg84.c |   55 -
 .../gpu/drm/nouveau/nvkm/engine/disp/rootgf119.c   |   55 -
 .../gpu/drm/nouveau/nvkm/engine/disp/rootgk104.c   |   55 -
 .../gpu/drm/nouveau/nvkm/engine/disp/rootgk110.c   |   55 -
 .../gpu/drm/nouveau/nvkm/engine/disp/rootgm107.c   |   55 -
 .../gpu/drm/nouveau/nvkm/engine/disp/rootgm200.c   |   55 -
 .../gpu/drm/nouveau/nvkm/engine/disp/rootgp100.c   |   55 -
 .../gpu/drm/nouveau/nvkm/engine/disp/rootgp102.c   |   55 -
 .../gpu/drm/nouveau/nvkm/engine/disp/rootgt200.c   |   55 -
 .../gpu/drm/nouveau/nvkm/engine/disp/rootgt215.c   |   55 -
 .../gpu/drm/nouveau/nvkm/engine/disp/rootgv100.c   |   53 -
 .../gpu/drm/nouveau/nvkm/engine/disp/rootnv04.c    |   42 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/rootnv50.c    |  140 +--
 .../gpu/drm/nouveau/nvkm/engine/disp/rootnv50.h    |   45 -
 .../gpu/drm/nouveau/nvkm/engine/disp/roottu102.c   |   53 -
 drivers/gpu/drm/nouveau/nvkm/engine/disp/sorg84.c  |   38 -
 drivers/gpu/drm/nouveau/nvkm/engine/disp/sorg94.c  |  302 -----
 .../gpu/drm/nouveau/nvkm/engine/disp/sorga102.c    |  144 ---
 .../gpu/drm/nouveau/nvkm/engine/disp/sorgf119.c    |  208 ----
 .../gpu/drm/nouveau/nvkm/engine/disp/sorgk104.c    |   54 -
 .../gpu/drm/nouveau/nvkm/engine/disp/sorgm107.c    |   80 --
 .../gpu/drm/nouveau/nvkm/engine/disp/sorgm200.c    |  160 ---
 .../gpu/drm/nouveau/nvkm/engine/disp/sorgp100.c    |   93 --
 .../gpu/drm/nouveau/nvkm/engine/disp/sorgt215.c    |   69 --
 .../gpu/drm/nouveau/nvkm/engine/disp/sorgv100.c    |  155 ---
 .../gpu/drm/nouveau/nvkm/engine/disp/sormcp77.c    |   48 -
 .../gpu/drm/nouveau/nvkm/engine/disp/sormcp89.c    |   53 -
 drivers/gpu/drm/nouveau/nvkm/engine/disp/sornv50.c |  106 --
 .../gpu/drm/nouveau/nvkm/engine/disp/sortu102.c    |  129 ---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c   |  108 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c   |  117 ++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c   |  115 ++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c   |  129 +++
 .../gpu/drm/nouveau/nvkm/engine/disp/wimmgv100.c   |   82 --
 .../gpu/drm/nouveau/nvkm/engine/disp/wndwgv100.c   |  184 ----
 158 files changed, 6386 insertions(+), 8845 deletions(-)
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/cl507a.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/cl507b.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/cl507c.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/cl507d.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/cl507e.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/clc37b.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/clc37e.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/conn.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0010.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0011.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0012.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0014.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/outp.h
 rename drivers/gpu/drm/nouveau/{nvkm/engine/disp/rootga102.c =>
nvif/conn.c} (56%)
 rename drivers/gpu/drm/nouveau/{nvkm/engine/disp/rootg94.c =>
nvif/outp.c} (54%)
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/baseg84.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/basegf119.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/basegp102.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/basenv50.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/capsgv100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/changf119.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/changv100.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/coreg84.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/coreg94.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/coregf119.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/coregk104.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/coregp102.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/coregv100.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/corenv50.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/cursgf119.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/cursgp102.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/cursgv100.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/cursnv50.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/dacgf119.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/dacnv50.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/dmacgf119.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/dmacgp102.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/dmacgv100.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/dmacnv50.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/hdagf119.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/hdagt215.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/hdagv100.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmig84.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmigf119.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmigk104.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmigm200.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmigt215.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmigv100.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/headgf119.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/headgv100.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/headnv04.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/headnv50.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/oimmgf119.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/oimmgp102.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/oimmnv50.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/ovlyg84.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/ovlygf119.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/ovlygk104.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/ovlygp102.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/ovlygt200.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/ovlynv50.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/piocgf119.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/piocnv50.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/piornv50.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/rootg84.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/rootgf119.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/rootgk104.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/rootgk110.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/rootgm107.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/rootgm200.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/rootgp100.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/rootgp102.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/rootgt200.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/rootgt215.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/rootgv100.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/rootnv50.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/roottu102.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/sorg84.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/sorg94.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/sorga102.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/sorgf119.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/sorgk104.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/sorgm107.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/sorgm200.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/sorgp100.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/sorgt215.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/sorgv100.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/sormcp77.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/sormcp89.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/sornv50.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/sortu102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/wimmgv100.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/wndwgv100.c
