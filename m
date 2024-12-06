Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2957B9E7898
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 20:10:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA5610F187;
	Fri,  6 Dec 2024 19:10:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DEQGwh4I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E614110F187
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 19:10:13 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-2e9ed2dbfc8so358030a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 11:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733512213; x=1734117013; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fb0QwzZbKI8/DRZNgNkPXbAkauaCwB63aVi3Fh5Ig84=;
 b=DEQGwh4ING712UX0fjMJRQ6mBIOvF/DALJo2LAz24CIdGW5J+K1ozQFXdfSiA01CaA
 StZjt2qdSbGdKhNavRqGQam1XbplyxeDgAojEy8yEAuu62SJV3stWCo2ZOomWVh15jga
 OArL9z4qgpVoZajuODTjTGMD0zL4Oxx+QaH6hUZ2e0Nz0mYplNbKOaYo5bqXt874iiPF
 BBuCMZJkuwKuJ54ShtYhaSz3lGwwvN8j0/h5jTmoGD+5LG51MPyU0z4MJOl8nP6HPqZN
 /Y1nfBiBd9faEJXuNrLXhQXqjPcJ0gA7ce9P46tmiP6O1UIx1U092hCD1RMvmyisRdLn
 1XNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733512213; x=1734117013;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fb0QwzZbKI8/DRZNgNkPXbAkauaCwB63aVi3Fh5Ig84=;
 b=UH3/ZFuGk7OLM+Q1vLT+jLnpsnV6S9x+9KdSMzqbSoq5ceLQk8R6mIwf1PMfXkV3Bl
 wOtMgDXmxU0q2DRgfxtTqu8d48w0kkGlBsWLzVJGPdYMxaO1ElEfxAZouyBZ4yR67kQX
 j3CTYCqPs5oOxrNkmUv4Gyk9oroKvbIcI1UD8+GWHxnkH2nf3v37bFCXvFaAHlnJJXOX
 pY5zoKqy+zAf3MdM08clm6DgNRkURHW5CFkhKKpjIwUZ8jBRMG3VboGDLTGgLoJeHKbd
 DSbHX98Tmm9qpLsEOOlcuPCKKYkU2ROT/wVNOSBLDpKM/4OPt647aB335/lPjGPeM2zv
 CAsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0UBu0K9j6pv6+3Oa13Y/fnQCWa5R2KisjLsLJ8uoTulvK/hvqtL23bsG6QsDPkblALMxC9KdbVAE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz74x4z6Ru1UGiZmurPgmxUYuxVxGzRO3Eh9XsuvH2nhTu7dxg/
 89NCJ2P+9ucasAzg47aed9IBSOmlGeErA+WsDm/o3KWsE5tveWDKm9Qlw2gykskHdMTaTPEMECs
 aWoHVXfKRy+8Rq0KazxIAbsJSVrc=
X-Gm-Gg: ASbGnctEZZgv7j+lrZinvlwB/qmWGDBzJYrnNJY5LpgGAh9UWdlvxjl0XTxCeVikZiF
 wiseVNe26KKAA6+dof5FLNC/TmloO6YM=
X-Google-Smtp-Source: AGHT+IFUM4VOtsHVaY02wivD0k44p0jE8ENskfavbXGX0OaYwK07jWSyff6rPIA5FdK0cu8m6iHq9ZIf2NuD8Datbg8=
X-Received: by 2002:a17:90b:3842:b0:2ea:715b:72ba with SMTP id
 98e67ed59e1d1-2ef6ac521demr2513129a91.9.1733512213310; Fri, 06 Dec 2024
 11:10:13 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9typZWd9P_81asANhuE_F7a9j+k5auWhwwCn=xLDQ1mFdQ@mail.gmail.com>
In-Reply-To: <CAPM=9typZWd9P_81asANhuE_F7a9j+k5auWhwwCn=xLDQ1mFdQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 6 Dec 2024 14:10:01 -0500
Message-ID: <CADnq5_NPYL=oEdyXVGQOcotPM1fin=eh4+AL_qigTggmPZOUSw@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 6.13-rc2
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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

On Fri, Dec 6, 2024 at 1:55=E2=80=AFPM Dave Airlie <airlied@gmail.com> wrot=
e:
>
> Hi Linus,
>
> Pretty quiet week which is probably expected after US holidays, the
> dma-fence and displayport MST message handling fixes make up the bulk
> of this, along with a couple of minor xe and other driver fixes.

FWIW, I sent out a PR on Wednesday, but it looks like it went out when
FDO was out of diskspace so it never made it to the mailing list.  I
just resent it:
https://patchwork.freedesktop.org/patch/627682/

Alex

>
> Dave.
>
> drm-fixes-2024-12-07:
> drm fixes for 6.13-rc2
>
> dma-fence:
> - Fix reference leak on fence-merge failure path
> - Simplify fence merging with kernel's sort()
> - Fix dma_fence_array_signaled() to ensure forward progress
>
> dp_mst:
> - Fix MST sideband message body length check
> - Fix a bunch of locking/state handling with DP MST msgs
>
> sti:
> - Add __iomem for mixer_dbg_mxn()'s parameter
>
> xe:
> - Missing init value and 64-bit write-order check
> - Fix a memory allocation issue causing lockdep violation
>
> v3d:
> - performance counter fix.
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b=
37:
>
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
>
> are available in the Git repository at:
>
>   https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-12-07
>
> for you to fetch changes up to 471f3a21addd4e5f170ab1364f11c3e4823e687d:
>
>   Merge tag 'drm-misc-fixes-2024-12-05' of
> https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
> (2024-12-06 08:40:47 +1000)
>
> ----------------------------------------------------------------
> drm fixes for 6.13-rc2
>
> dma-fence:
> - Fix reference leak on fence-merge failure path
> - Simplify fence merging with kernel's sort()
> - Fix dma_fence_array_signaled() to ensure forward progress
>
> dp_mst:
> - Fix MST sideband message body length check
> - Fix a bunch of locking/state handling with DP MST msgs
>
> sti:
> - Add __iomem for mixer_dbg_mxn()'s parameter
>
> xe:
> - Missing init value and 64-bit write-order check
> - Fix a memory allocation issue causing lockdep violation
>
> v3d:
> - performance counter fix.
>
> ----------------------------------------------------------------
> Christian K=C3=B6nig (1):
>       dma-buf: fix dma_fence_array_signaled v4
>
> Dave Airlie (4):
>       Merge tag 'drm-misc-fixes-2024-11-21' of
> https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
>       Merge tag 'drm-misc-fixes-2024-11-28' of
> https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
>       Merge tag 'drm-xe-fixes-2024-12-04' of
> https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
>       Merge tag 'drm-misc-fixes-2024-12-05' of
> https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
>
> Imre Deak (8):
>       drm/dp_mst: Fix MST sideband message body length check
>       drm/dp_mst: Fix resetting msg rx state after topology removal
>       drm/dp_mst: Verify request type in the corresponding down message r=
eply
>       drm/dp_mst: Simplify error path in drm_dp_mst_handle_down_rep()
>       drm/dp_mst: Fix down request message timeout handling
>       drm/dp_mst: Ensure mst_primary pointer is valid in
> drm_dp_mst_handle_up_req()
>       drm/dp_mst: Reset message rx state after OOM in drm_dp_mst_handle_u=
p_req()
>       drm/dp_mst: Use reset_msg_rx_state() instead of open coding it
>
> John Harrison (1):
>       drm/xe: Move the coredump registration to the worker thread
>
> Ma=C3=ADra Canal (1):
>       drm/v3d: Enable Performance Counters before clearing them
>
> Pei Xiao (1):
>       drm/sti: Add __iomem for mixer_dbg_mxn's parameter
>
> Tvrtko Ursulin (2):
>       dma-fence: Fix reference leak on fence merge failure path
>       dma-fence: Use kernel's sort for merging fences
>
> Zhanjun Dong (1):
>       drm/xe/guc: Fix missing init value and add register order check
>
>  drivers/dma-buf/dma-fence-array.c             |  28 +++++-
>  drivers/dma-buf/dma-fence-unwrap.c            | 126 +++++++++++++-------=
------
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 107 ++++++++++++++++++--=
--
>  drivers/gpu/drm/sti/sti_mixer.c               |   2 +-
>  drivers/gpu/drm/v3d/v3d_perfmon.c             |   2 +-
>  drivers/gpu/drm/xe/xe_devcoredump.c           |  73 ++++++++-------
>  drivers/gpu/drm/xe/xe_guc_capture.c           |  77 +++++++++++++---
>  include/drm/display/drm_dp_mst_helper.h       |   7 ++
>  8 files changed, 285 insertions(+), 137 deletions(-)
