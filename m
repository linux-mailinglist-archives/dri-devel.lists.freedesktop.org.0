Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC6D948132
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 20:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F09CD10E27D;
	Mon,  5 Aug 2024 18:06:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hG9e7Z9a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F6010E27D;
 Mon,  5 Aug 2024 18:06:07 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-6b79775f464so12790406d6.2; 
 Mon, 05 Aug 2024 11:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722881166; x=1723485966; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=tuNc5ijq2sTTz1aoHY//bl29OA01mR9/Gm1Cm8jhEsw=;
 b=hG9e7Z9aYy96GNALFglWcRk2W0MutDkGob5EXFloDZyscbv0uZSoVr17anR2jxqecF
 LbXvDvh0uan6NAgZRRevBioFt1TSsTvBatMjvqa7Sew6p1dLSKiG4OxZjAl3LhWQGjiv
 BUtIpBC7ZU4JRIapxrKWxQjJw7atVHYvx4Oquc4rwHzO54XFKccSvg0pewASx4I/HPnL
 7emHtdDatafrcSqQCOQso9vQp0WDcp9TxB/bykdF194FN7zjIsnVliTwzBUa230SMAG0
 EbwvUOrBRmUiSdVPtObHUMMqHJdqVYX6CHr/e13ghs75BWW3LORgJNEsAmNZVbCvTqtn
 ufpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722881166; x=1723485966;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tuNc5ijq2sTTz1aoHY//bl29OA01mR9/Gm1Cm8jhEsw=;
 b=vU3bCioXZqlYyOB0Mq0Krb05IEpqNWdpPM90izEE4eWtagHhdZmAsURIvIoejp+OPH
 8H00lh0tlBuW2IOcKLbmGsrfid9ldpeRYqb5yZ1JcPsFFW2bnLFz/rTw9k/7zSres16O
 lvIlY9LzEnqmJBaeSpAVFaI9NTJ09GF76AZywZxkm45NZG4AFBCxc3UC6rd1zF9JJ6So
 f9nzzLgfNKZLS4Nk/VDrAesQqgw/jpV2+rniaKSVU7YuUn64uVyychx9sdS2ISn7Tzhi
 2P/HFg/PtqeTdB1Wb0N1HAxpsUKvqqVRUktdeTeugJcgOkSdzGKmGpcXkaf/acWJZgDd
 a1nA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVf8DEqGSW8hVbkVQEXkekBUkAr32Kd6JdVJWc2broSo0P/S/etaCZHOWEoRM2K7x3m0hcZczx6@lists.freedesktop.org,
 AJvYcCVjiyokGdRfSpBD2I/dvx/wRkN3i4Aha78n4bAT5jXJyT8J9OdygsvW8//x4Tv4y6LYt96+1L9WgUZ0@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRACzZzhBaVGDWUnrhlBoSNkeHWAr5f0FzfsJ6NZnhHPJr+wFx
 +N/eiJtAuiOifxesJptAnZw1u1B5TmJJx3TG1zORQ/H1BFuHF6Wi3UY/mvV25kN7UiZ0sojxUx4
 /QJwR3H7N1M+p/h21e/Ida51j6e0=
X-Google-Smtp-Source: AGHT+IGtKXbr3WIUYML88AgClVnUEVd5wqOjwXLwGek75xH0mlYxuRzER9nHua9J6rDEejJ+C1ibj9q/0xMMTRAjZOQ=
X-Received: by 2002:a05:6214:e64:b0:6b0:8202:5c4e with SMTP id
 6a1803df08f44-6bb983f0fa6mr98122976d6.5.1722881165875; Mon, 05 Aug 2024
 11:06:05 -0700 (PDT)
MIME-Version: 1.0
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Mon, 5 Aug 2024 23:05:54 +0500
Message-ID: <CABXGCsNgx6gQCqBq-L2P15ydaN_66sM9CgGa9GQYNzQsaa6Dkg@mail.gmail.com>
Subject: 6.11/regression/bisected - after commit 1b04dcca4fb1, launching some
 RenPy games causes computer hang
To: Leo Li <sunpeng.li@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 zaeem.mohamed@amd.com, 
 pekka.paalanen@collabora.com, "Wheeler, Daniel" <daniel.wheeler@amd.com>, 
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
 Linux regressions mailing list <regressions@lists.linux.dev>
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

Hi,
After commit 1b04dcca4fb1, launching some RenPy games causes computer hang.
After the hang, even Alt + sysrq + REISUB can't reboot the computer!
And no trace in the kernel log!
For demonstration, I'm going to use the game "Find the Orange Narwhal"
because it is free and has 100% reproducivity for this issue.
You can find it in the Steam Store:
https://store.steampowered.com/app/2946010/Find_the_Orange_Narwhal/
I uploaded demonstration video to youtube: https://youtu.be/yVW6rImRpXw

Unfortunately, I can't check the revert commit 1541d63c5fe2 because of
conflicts.

mikhail@primary-ws ~/p/g/linux (master)> git reset v6.11-rc1 --hard
HEAD is now at 8400291e289e Linux 6.11-rc1

mikhail@primary-ws ~/p/g/linux (master)> git revert -n 1b04dcca4fb1
Auto-merging drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
CONFLICT (content): Merge conflict in
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
Auto-merging drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
Auto-merging drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
Auto-merging drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
CONFLICT (content): Merge conflict in
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
error: could not revert 1b04dcca4fb1... drm/amd/display: Introduce
overlay cursor mode
hint: after resolving the conflicts, mark the corrected paths
hint: with 'git add <paths>' or 'git rm <paths>'
hint: Disable this message with "git config advice.mergeConflict false"

commit 1b04dcca4fb10dd3834893a60de74edd99f2bfaf
Author: Leo Li <sunpeng.li@amd.com>
Date:   Thu Jan 18 16:29:49 2024 -0500

    drm/amd/display: Introduce overlay cursor mode

    [Why]

    DCN is the display hardware for amdgpu. DRM planes are backed by DCN
    hardware pipes, which carry pixel data from one end (memory), to the
    other (output encoder).

    Each DCN pipe has the ability to blend in a cursor early on in the
    pipeline. In other words, there are no dedicated cursor planes in DCN,
    which makes cursor behavior somewhat unintuitive for compositors.

    For example, if the cursor is in RGB format, but the top-most DRM plane
    is in YUV format, DCN will not be able to blend them. Because of this,
    amdgpu_dm rejects all configurations where a cursor needs to be enabled
    on top of a YUV formatted plane.

    From a compositor's perspective, when computing an allocation for
    hardware plane offloading, this cursor-on-yuv configuration result in an
    atomic test failure. Since the failure reason is not obvious at all,
    compositors will likely fall back to full rendering, which is not ideal.

    Instead, amdgpu_dm can try to accommodate the cursor-on-yuv
    configuration by opportunistically reserving a separate DCN pipe just
    for the cursor. We can refer to this as "overlay cursor mode". It is
    contrasted with "native cursor mode", where the native DCN per-pipe
    cursor is used.

    [How]

    On each crtc, compute whether the cursor plane should be enabled in
    overlay mode. If it is, mark the CRTC as requesting overlay cursor mode.

    Overlay cursor should be enabled whenever there exists a underlying
    plane that has YUV format, or is scaled differently than the cursor. It
    should also be enabled if there is no underlying plane, or if underlying
    planes do not cover the entire CRTC.

    During DC validation, attempt to enable a separate DCN pipe for the
    cursor if it's in overlay mode. If that fails, or if no overlay mode is
    requested, then fallback to native mode.

    v2:
    * Update commit message for when overlay cursor should be enabled
    * Also consider scale and no-underlying-plane case (cursor on crtc bg)
    * Consider all underlying planes when determinig overlay/native, not
      just the plane immediately beneath the cursor, as it may not cover the
      entire CRTC.
    * Fix typo s/decending/descending/
    * Force native cursor on pre-DCN hardware

    Reviewed-by: Harry Wentland <harry.wentland@amd.com>
    Acked-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
    Signed-off-by: Leo Li <sunpeng.li@amd.com>
    Acked-by: Harry Wentland <harry.wentland@amd.com>
    Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
    Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c       | 490
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------------------------------------
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h       |   7 +++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c  |   1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c |  13 ++++-
 4 files changed, 389 insertions(+), 122 deletions(-)


My hardware specs are: https://linux-hardware.org/?probe=61bd7390a9

Leo, can you look into it, please?

-- 
Best Regards,
Mike Gavrilov.
