Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB38A26452
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 21:19:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D969C89CC1;
	Mon,  3 Feb 2025 20:19:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gqTa3oBg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F85089CC1;
 Mon,  3 Feb 2025 20:19:10 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-216513f8104so9708595ad.2; 
 Mon, 03 Feb 2025 12:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738613950; x=1739218750; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7GfrOoO3bAcjQVPU8/Q1HunhpNAjwvu9rcpPDzh1ScE=;
 b=gqTa3oBgtJDz+VBVP5rYuCeMq6s6sFzZ/qAbYmzfLvmycniKrsjpdnpYl0UnS1p0lG
 4M9iSsEGUQvvpeUdRVWdCRAe9pjbMFCy3aTo0qH8SkDnvMF1crDsioypI3Iu7AJbUr99
 lmYwhhrLSQ7fnIIK3Fp7QizfaZA7SdTO5V00v6YGtS6OiH9i0BKooLjaiFNH8EEV8nLZ
 onW7HoFfWHVCl/h7E1orwAf8lTNADW6aVeSq4cowlN4hBYyGDoNWtgJ4+jDQIG6D7c9K
 /5d6YZWQ1zjLOgTpSDUnoXlV9iAhS8DM3UUZ4Z8SzyIBzTGsST2pci+ojX4gliItwGGe
 j3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738613950; x=1739218750;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7GfrOoO3bAcjQVPU8/Q1HunhpNAjwvu9rcpPDzh1ScE=;
 b=AQEGlSvU7E/prceYHWmny8nMkADwkjqga4zJXlg8qAPbB/TFM/ekAgX8wTCGynKGsi
 y/q8Xf0YS1ONAIDa7dIlxTybbHnn+WkR5a1fDH42FRYlxD/xLhOhhIg8JvuS3g3MqepN
 qiV6whE8JG1Tt91yrDp93g+azXpmJTwE7NDtJN5IpHIBhvwDIpCts+TpveuddtNMxgBZ
 cy4k86IFVygKWw8q3lJUUgGucCsbu4rwitOrbVb8tMhLF1+gYf1psnYhestfV3N7qL51
 3dGWbqL1zPDyOw3TaPBI6RuiMuI6ZEnsHDCpgNYOmJUgXpWiZXv3vPB8T+yCqpyPcq/O
 pC/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqcC8yK8JVUwytvxjoEGRSwPL3s8BzfYjsCD97uGx2JtLgiemltcIEVex4yvnCuy2V6vWK1WOJvzi/@lists.freedesktop.org,
 AJvYcCXR2y00bei7uwfUAJXg8KiVffuzVqm2ohi+kYeMSue/tjsn78tC5mo3q+OCUJV5o1PyfX5OaZ34@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDGidToV7Mvz3uYVyyNvAiS36gU4AvTFdUUJ4eCzb6fbHgq2CP
 JXlUk8zuMKGOJdbQ/Euh3yhMIOaJ8UYc/o4uFU0I6KwA0TXGe40fPN5CqOjfxeu0KLwqt3e2U/H
 pzJUToKLoC9WlxJrCzEDxhDd2OYA=
X-Gm-Gg: ASbGncu2VF+Sw+EkWW4YbwqSIe8pf7319j/DQmCCMAYE/sysT1tqqzpklUl5UTDZdF9
 OK20P4/IDQoKUciUtzsmsHvmpb3ZzEofXMdLTKi9vrE7phvPIu16al2EKNTszGkXruFNRIPW/
X-Google-Smtp-Source: AGHT+IFY+u51Co3Qp2/PkJXnZEwd7WUwAWTcLHP8aQV2q//0eXRrEQd3/ZuG20piRJnwccBvlNVArLxbSotWJtwNHmQ=
X-Received: by 2002:a17:903:22cc:b0:216:3083:d043 with SMTP id
 d9443c01a7336-21efe6f8e32mr4486725ad.12.1738613949418; Mon, 03 Feb 2025
 12:19:09 -0800 (PST)
MIME-Version: 1.0
References: <20250202215856.252439-1-linux@treblig.org>
In-Reply-To: <20250202215856.252439-1-linux@treblig.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 3 Feb 2025 15:18:57 -0500
X-Gm-Features: AWEUYZkhAPx1qmtLRs097YAKTjqKoL1dor02COhhyiGymyXTrVfYUlPCpeq3SH4
Message-ID: <CADnq5_N62AzN=PGxHJPtAcUYU=GfkW=cDPAVZu4h9EjfBJ0nLQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] drm/amd/display: More deadcoding
To: linux@treblig.org
Cc: patrik.r.jakobsson@gmail.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, alexander.deucher@amd.com, harry.wentland@amd.com, 
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, christian.koenig@amd.com, 
 Xinhui.Pan@amd.com, airlied@gmail.com, simona@ffwll.ch, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
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

Applied.  Thanks!

Alex

On Sun, Feb 2, 2025 at 5:08=E2=80=AFPM <linux@treblig.org> wrote:
>
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> Another small pile of deadcode patches.
>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
>
>
> Dr. David Alan Gilbert (7):
>   drm/amd/display: Remove unused mpc1_is_mpcc_idle
>   drm/amd/display: Remove unused freesync functions
>   drm/amd/display: Remove unused dc_stream_get_crtc_position
>   drm/amd/display: Remove unused get_clock_requirements_for_state
>   drm/amd/display: Remove unused hubbub1_toggle_watermark_change_req
>   drm/amd/display: Remove unused get_max_support_fbc_buffersize
>   drm/amd/display: Remove unused
>     link_enc_cfg_get_link_enc_used_by_stream
>
>  drivers/gpu/drm/amd/display/dc/core/dc.c      |  39 -----
>  .../drm/amd/display/dc/core/dc_link_enc_cfg.c |  11 --
>  drivers/gpu/drm/amd/display/dc/dc.h           |   2 -
>  drivers/gpu/drm/amd/display/dc/dc_stream.h    |  12 --
>  .../amd/display/dc/dce110/dce110_compressor.c |  13 --
>  .../amd/display/dc/dce110/dce110_compressor.h |   2 -
>  .../display/dc/hubbub/dcn10/dcn10_hubbub.c    |  18 ---
>  .../display/dc/hubbub/dcn10/dcn10_hubbub.h    |   3 -
>  .../gpu/drm/amd/display/dc/inc/link_enc_cfg.h |   5 -
>  .../drm/amd/display/dc/mpc/dcn10/dcn10_mpc.c  |  16 --
>  .../drm/amd/display/dc/mpc/dcn10/dcn10_mpc.h  |   4 -
>  .../amd/display/modules/freesync/freesync.c   | 137 ------------------
>  .../amd/display/modules/inc/mod_freesync.h    |  26 ----
>  13 files changed, 288 deletions(-)
>
> --
> 2.48.1
>
