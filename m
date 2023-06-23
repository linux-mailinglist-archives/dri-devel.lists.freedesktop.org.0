Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C76D73C301
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 23:40:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D8B910E6C6;
	Fri, 23 Jun 2023 21:39:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF0B010E6C4;
 Fri, 23 Jun 2023 21:39:55 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-51bec5c09ecso1165502a12.2; 
 Fri, 23 Jun 2023 14:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687556393; x=1690148393;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bDPCLE1RQkTvsneplUketcXAUHKug/HnPFR18EZ6AFs=;
 b=rh8CgMHL2CJ0apk+OZNHOye2H6lF+tYhn+2PD+nbRiTI6VY/TE3CXI3qMGJ/pQkOWV
 O1fMBNSm23YqBi1c1bdtCOJNaGe4wWgXtQg7zcPIUruue8qyzwQXKtyYyZC4VOBr3AJN
 XAG61nRdd40N6PQ3wBhCw+/2CgS+8LMlRlTnRQ4H354o+fP8NTFga8FvlGdSF7CmZOVS
 GYrcJgpxBdTbmPUSWjKjRCFaeqiwsZ4Yi7yAoyzB74Hx+jmMb7dmFTaujt0ykty3WqGS
 BeNP+ZGqWGEcEKgGr4q/KqzE0Fu/kL71ff5lhSNjumKUzugAt9e5ebVr8+4dwFfhb5KB
 WOLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687556393; x=1690148393;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bDPCLE1RQkTvsneplUketcXAUHKug/HnPFR18EZ6AFs=;
 b=l6ITb9fn/I7jBJEXpr/kDno4ADWzi7g/VVc0Zd1tbqRlkOMDZFAC68KEZ7zGYXDj+9
 SOPAQRaSzW5XaGzke3U9dWqsvqc4giQG1Rj4v41KsZmbrxhWS/XH/C6bPQ4pDsPTXEme
 Ps8uh2hFxT1AEB28CbteBI8VhQ6KxDNSudicaGxvUTOnaR4TW0o5d3G132GI/koVONbg
 LlG9FSW8yiLTK1ja64tHmSlI+Jp/x9302Qj/JaJ9QlAv0XTOgNUlNqYpEtGAxNXRKSkN
 Ywg4ZUgkfbjOwN0jBabu9WvoPDHw50uZ1XX/UqMvhU5dPFEXAPh4l189EkFR7WROBBOk
 WgCw==
X-Gm-Message-State: AC+VfDxuP0UXjmgBhxpfQIhV/WTqInkTXCk/cVxkQj/oh53g9m/QKpqd
 +13vTOtT2CX8tJbWVV6hCB8L75Pf3Ip4CsTkXhs=
X-Google-Smtp-Source: ACHHUZ7jX9fQESz+mCRUFDUxcYHWjremM0Jjg5A7lhHtogW5QN8OXanaIBIKvu4MWWbX1yMKIdWTbXIhjHsI5zmujRc=
X-Received: by 2002:a17:907:7e8b:b0:988:fafd:d93a with SMTP id
 qb11-20020a1709077e8b00b00988fafdd93amr13044572ejc.70.1687556393257; Fri, 23
 Jun 2023 14:39:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230623211808.7667-1-alexander.deucher@amd.com>
In-Reply-To: <20230623211808.7667-1-alexander.deucher@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 24 Jun 2023 07:39:40 +1000
Message-ID: <CAPM=9tyQBhUftYrrQzTNwfZqoaXAwHDydKCFiYkqH18ESTapOA@mail.gmail.com>
Subject: Re: [pull] amdgpu drm-fixes-6.4
To: Alex Deucher <alexander.deucher@amd.com>
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
Cc: daniel.vetter@ffwll.ch, torvalds@linux-foundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

Can you please pull this directly,

Thanks,
Dave.

On Sat, 24 Jun 2023 at 07:18, Alex Deucher <alexander.deucher@amd.com> wrot=
e:
>
> Hi Dave, Daniel, Linus,
>
> Last few fixes for 6.4.  Dave already sent out the drm-fixes PR this week=
.
> I was out of the office earlier in the week and just got this out now.
>
> The following changes since commit 9bd9be5cbaf8a8faa175ef4fba04a5623281de=
be:
>
>   Merge tag 'drm-misc-fixes-2023-06-21' of git://anongit.freedesktop.org/=
drm/drm-misc into drm-fixes (2023-06-23 12:16:48 +1000)
>
> are available in the Git repository at:
>
>   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.4-2=
023-06-23
>
> for you to fetch changes up to 134ea95255cf359a2e6d70308c15243c3fdf8eaf:
>
>   drm/amd: Don't try to enable secure display TA multiple times (2023-06-=
23 16:44:45 -0400)
>
> ----------------------------------------------------------------
> amd-drm-fixes-6.4-2023-06-23:
>
> amdgpu:
> - BO locking fixes
> - MCBP fix
> - GPU mapping clear fix for always valid BOs
> - ASPM fixes
> - SDMA4 hang fix
> - Misc display fixes
> - Parade TCON PSR hang fix
> - SMU13 fixes
> - Gang submit fence fix
> - Secure display fix
>
> ----------------------------------------------------------------
> Alex Deucher (1):
>       drm/amdgpu/sdma4: set align mask to 255
>
> Christian K=C3=B6nig (3):
>       drm/amdgpu: make sure BOs are locked in amdgpu_vm_get_memory
>       drm/amdgpu: make sure that BOs have a backing store
>       drm/amdgpu: fix number of fence calculations
>
> Evan Quan (2):
>       drm/amd/pm: revise the ASPM settings for thunderbolt attached scena=
rio
>       drm/amd/pm: update the LC_L1_INACTIVITY setting to address possible=
 noise issue
>
> Hamza Mahfooz (1):
>       drm/amd/display: perform a bounds check before filling dirty rectan=
gles
>
> Ilya Bakoulin (1):
>       drm/amd/display: Fix 128b132b link loss handling
>
> Jiadong Zhu (1):
>       drm/amdgpu: Skip mark offset for high priority rings
>
> Kenneth Feng (1):
>       drm/amd/pm: add abnormal fan detection for smu 13.0.0
>
> Leo Chen (1):
>       drm/amd/display: disable seamless boot if force_odm_combine is enab=
led
>
> Mario Limonciello (2):
>       drm/amd: Disable PSR-SU on Parade 0803 TCON
>       drm/amd: Don't try to enable secure display TA multiple times
>
> Samuel Pitoiset (1):
>       drm/amdgpu: fix clearing mappings for BOs that are always valid in =
VM
>
> Sung-huai Wang (1):
>       drm/amd/display: add a NULL pointer check
>
> Tao Zhou (1):
>       drm/amdgpu: check RAS irq existence for VCN/JPEG
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             | 11 +--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c           |  3 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |  6 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  2 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c       |  3 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |  3 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             | 81 ++++++++++++++--=
------
>  drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c             | 13 ++--
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |  4 +-
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |  4 +-
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 13 ++--
>  drivers/gpu/drm/amd/display/dc/core/dc.c           |  3 +
>  .../drm/amd/display/dc/dce112/dce112_resource.c    | 10 +--
>  .../dc/link/protocols/link_dp_irq_handler.c        | 11 ++-
>  .../drm/amd/display/modules/power/power_helpers.c  |  2 +
>  .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  1 +
>  16 files changed, 108 insertions(+), 62 deletions(-)
