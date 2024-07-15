Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D04930D16
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 05:48:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26FD710E223;
	Mon, 15 Jul 2024 03:48:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AnK3NLe/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8716D10E223
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 03:48:15 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a77bf336171so630189266b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jul 2024 20:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721015294; x=1721620094; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FDqhyQc0uz0StdSsdtrtV1K0KUw88fAP7uOvxxiRrDw=;
 b=AnK3NLe/w9Vwr6A54poNna9qpBXvMwL9qNdss2pzpSA2MslapQQ6CyKFed9e9vpull
 vxj+1o/r4Y31Dk4ky4m40u15P9Vl9Z2ZYf3h90zZsBNYJGhzAS75lWr7CNFW6SBaWzAu
 nIE6ukdRG/gfouuGbIUvYWE3dXOCm0jbnwMivaYEwmwhGh8Zg/BUWcrEbQsWGYIgUWyo
 vJvmshxDAfYkRJ9UqZujtKzvTdNTdgiSrUow8g8Nd5hDIx2tF57Ghit0pOPKGcxH8N7T
 VRf3HosmasdI3sZC7E8b5wjrxeznxfGaUn5pANJlFK0x0Tv7lwVA7T0lwBZ/wdIfYL+1
 uRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721015294; x=1721620094;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FDqhyQc0uz0StdSsdtrtV1K0KUw88fAP7uOvxxiRrDw=;
 b=NNlfO17s6KPwTRBAfYt23I4wD3WNScKN4XddnO4jifyWl4ntsYn6/7xIaGJPUKRq1a
 lTtzS6oQ7XYt93Bgsuv1DqwZdhLO6+A5AIqRf/LQEs/3PtKS67hQvmeZzPLrfO7mX/69
 Dm5hEAWpyXBMAflfxMbR4TINKyKJu3I1MbSWE40qhEL//xPmaIhbVa2u1VeBGpGdg4L7
 qal8X4EklAlnRwS/e0QSbInRIWWzWsxENCLjCDLhnYk2/DggrRltfehy/3blIH42uHUk
 9dZlG/Dmq9TOSxdydLATBTOBhwmzBNbCCYtwyqTSnAtkJeFZ08HkhBiV+cXH/lSAzHa9
 IZoQ==
X-Gm-Message-State: AOJu0Yyzb0ERLTZgDVWHvBGO//r9kRlcBbZGqyi5TZdvazyYd3avPSKO
 4pCe4Fe51gxgDhdVJxY6pS30nhZP1Iyy7CvAB8i0eFdJ3SW3DZnSQ3gZeS7d3bFjLJlwVpL/fw+
 XOjay1YfTld8nuNyp47OIe8rJP84=
X-Google-Smtp-Source: AGHT+IFks5LP0aDl6W0EXY8bRblpjMjZchVJvATw50YqntMlxbBo6snDOXb41ZdJk0gDiBjy5bP+QLuI/4iCEhQgRp8=
X-Received: by 2002:a17:906:abcf:b0:a72:66d5:892c with SMTP id
 a640c23a62f3a-a799d37ee6fmr603539266b.18.1721015293621; Sun, 14 Jul 2024
 20:48:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzVaA1Y4A69HF-gHPy3YEgE7EGKxZa0rFWT4NUKvdF1wg@mail.gmail.com>
In-Reply-To: <CAPM=9tzVaA1Y4A69HF-gHPy3YEgE7EGKxZa0rFWT4NUKvdF1wg@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 15 Jul 2024 13:48:01 +1000
Message-ID: <CAPM=9tzx4VzCOpM+XyoEFyLTmBufZtmKd4MVRkL1umKs7gg_aw@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 6.10-rc8
To: LKML <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
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

On Fri, 12 Jul 2024 at 14:46, Dave Airlie <airlied@gmail.com> wrote:
>
> Hi Linus,
>
> Back to work, thanks to Sima for last week, not too many fixes as
> expected getting close to release, amdgpu and xe have a couple each,
> and then some other misc ones.

Oh I screwed up last week's fixes pull, and forgot to send to Linus,

Linus, can you just pull this in at the start of the merge window and
we can fix things up if anything needs to get backported.

Dave.
>
> Dave.
>
> drm-fixes-2024-07-12:
> drm fixes for 6.10-rc8
>
> amdgpu:
> - PSR-SU fix
> - Reseved VMID fix
>
> xe:
> - Use write-back caching mode for system memory on DGFX
> - Do not leak object when finalizing hdcp gsc
>
> bridge:
> - adv7511 EDID irq fix
>
> gma500:
> - NULL mode fixes.
>
> meson:
> - fix resource leak
> The following changes since commit 256abd8e550ce977b728be79a74e1729438b49=
48:
>
>   Linux 6.10-rc7 (2024-07-07 14:23:46 -0700)
>
> are available in the Git repository at:
>
>   https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-07-12
>
> for you to fetch changes up to 8b68788bebd3f697ae62aa9af3dac35ed112ebd7:
>
>   Merge tag 'amd-drm-fixes-6.10-2024-07-11' of
> https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2024-07-12
> 13:32:36 +1000)
>
> ----------------------------------------------------------------
> drm fixes for 6.10-rc8
>
> amdgpu:
> - PSR-SU fix
> - Reseved VMID fix
>
> xe:
> - Use write-back caching mode for system memory on DGFX
> - Do not leak object when finalizing hdcp gsc
>
> bridge:
> - adv7511 EDID irq fix
>
> gma500:
> - NULL mode fixes.
>
> meson:
> - fix resource leak
>
> ----------------------------------------------------------------
> Adam Ford (1):
>       drm/bridge: adv7511: Fix Intermittent EDID failures
>
> Christian K=C3=B6nig (1):
>       drm/amdgpu: reject gang submit on reserved VMIDs
>
> Dave Airlie (3):
>       Merge tag 'drm-misc-fixes-2024-07-11' of
> https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
>       Merge tag 'drm-xe-fixes-2024-07-11' of
> https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
>       Merge tag 'amd-drm-fixes-6.10-2024-07-11' of
> https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
>
> Leo Li (1):
>       Revert "drm/amd/display: Reset freesync config before update new st=
ate"
>
> Ma Ke (2):
>       drm/gma500: fix null pointer dereference in psb_intel_lvds_get_mode=
s
>       drm/gma500: fix null pointer dereference in cdv_intel_lvds_get_mode=
s
>
> Nirmoy Das (1):
>       drm/xe/display/xe_hdcp_gsc: Free arbiter on driver removal
>
> Thomas Hellstr=C3=B6m (1):
>       drm/xe: Use write-back caching mode for system memory on DGFX
>
> Yao Zi (1):
>       drm/meson: fix canvas release in bind function
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c            | 15 ++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c           | 15 +++++++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h           |  1 +
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  1 -
>  drivers/gpu/drm/bridge/adv7511/adv7511.h          |  2 +-
>  drivers/gpu/drm/bridge/adv7511/adv7511_cec.c      | 13 +++++--
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c      | 22 ++++++-----
>  drivers/gpu/drm/gma500/cdv_intel_lvds.c           |  3 ++
>  drivers/gpu/drm/gma500/psb_intel_lvds.c           |  3 ++
>  drivers/gpu/drm/meson/meson_drv.c                 | 37 +++++++++--------=
-
>  drivers/gpu/drm/xe/display/xe_hdcp_gsc.c          | 12 ++++--
>  drivers/gpu/drm/xe/xe_bo.c                        | 47 ++++++++++++++---=
------
>  drivers/gpu/drm/xe/xe_bo_types.h                  |  3 +-
>  include/uapi/drm/xe_drm.h                         |  8 +++-
>  14 files changed, 122 insertions(+), 60 deletions(-)
