Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B80158EFDD
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 17:57:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6916D8EAB7;
	Wed, 10 Aug 2022 15:57:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D548AE98;
 Wed, 10 Aug 2022 15:57:37 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-10e6bdbe218so18268799fac.10; 
 Wed, 10 Aug 2022 08:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=D332tIEC5qZA+2v1aF7oqZP76Nc0uHuaS+9UBYQnMSY=;
 b=SPzt8Er15c0/1ir+dkWZ4YaTefkit/sba5ySr7EOWCX1a15PKxHi96Bekiij14Oj9E
 KbYncyBD4U/QHSCjFVHKKH/nuz0ieHySUywNFXIZ0vv4dOT0GcxLbeZGC84yKju6eDwO
 VFv55pw+zWQ3xyfClYyP7T2d5WwWpMmiToyljivD74zhJEnDHGF6456B+qr4M441MEV+
 M2YgELVPtnowCO4fEOSwy7sDNTApNiKRjjc5mjwo3f8r/osH/P9I4cvRoOzs6uEe9S+w
 /S1n/pI8H2nyBrXO5trZfSgXn7qNGu7AjOFglzwmakVrrD+DBwfAa2i4/9g5kcdbPnsJ
 mjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=D332tIEC5qZA+2v1aF7oqZP76Nc0uHuaS+9UBYQnMSY=;
 b=yWi2N3WqtUNcQfI5BKrE2SqxMZD1ot0+aarQpJdVw7KUDUNQ63aYtFlBoaduP1m8fL
 CWkzlRDoleOVPQq2yxe1JjgyFVgWHq+tvlg8mADJbVUYsiBiPUInOh8TvSnGp2QxWozz
 +3cE+JOmlOVzutQKBxjyqFQfp4vs2Uvc3G7giBM9+FKAyFJU/7A2naBy1dDcAaHYaBWl
 zwi/5ncHt93KUCY019v1vSBPRztwTGZfeqRPTFUueU80jwpQ8jeYfF2kcggZ4+tkNqhF
 bP1gnO+i24BVlMoq1QiNBcXoS5+ojKJ6a4Tl8JXxJr2YV6aHiUSnOZmYOOziWAiQgSAr
 3+Nw==
X-Gm-Message-State: ACgBeo0LV6WxFOqSN+UQQg7mAqIw2Tuk0bxQXcxVp+90ViNKZsynNgU1
 i1fhOFfhBhV/j6V519oeFhte0lVEnrmGmeA44m8=
X-Google-Smtp-Source: AA6agR4MeaIsJ9o2zQxHjpx8+Y0OUvyRfCxhFk6Vs05DJ2iVybOtAieG8xQ344mI4roaNvgbi6iaOJesEQp6C2sy5D8=
X-Received: by 2002:a05:6870:3398:b0:113:7f43:d0e9 with SMTP id
 w24-20020a056870339800b001137f43d0e9mr1690928oae.33.1660147057231; Wed, 10
 Aug 2022 08:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220726182152.123649-1-andrealmeid@igalia.com>
In-Reply-To: <20220726182152.123649-1-andrealmeid@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 10 Aug 2022 11:57:26 -0400
Message-ID: <CADnq5_MJAbhQ8VZcPVY5nhg3VnefKPnSscMnRPsm2wB04G6wBg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] drm/amd: Add more GFXOFF stats for vangogh
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
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
Cc: Tom St Denis <tom.stdenis@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Tao Zhou <tao.zhou1@amd.com>, kernel-dev@igalia.com,
 David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 26, 2022 at 2:23 PM Andr=C3=A9 Almeida <andrealmeid@igalia.com>=
 wrote:
>
> This series adds new logging features for GFXOFF available for vangogh
> and documentation for it.
>
> I've created a small userspace program to interact with this new debugfs
> interface and it can be found at:
>
> https://gitlab.freedesktop.org/andrealmeid/gfxoff_tool
>
> Changelog:
>  v2:
>  - Make entrycount uint64_t
>  - Add a note in docs about data types and overflow

A minor comment on patch 2, the rest looks good to me.

Thanks,

Alex


>
> Andr=C3=A9 Almeida (4):
>   drm/amd: Add detailed GFXOFF stats to debugfs
>   drm/amd/pm: Implement GFXOFF's entry count and residency for vangogh
>   Documentation/gpu: Document GFXOFF's count and residency
>   drm/amdgpu: Document gfx_off members of struct amdgpu_gfx
>
>  Documentation/gpu/amdgpu/thermal.rst          |  18 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   | 168 ++++++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |   2 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c       |  39 ++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h       |  14 +-
>  drivers/gpu/drm/amd/pm/amdgpu_dpm.c           |  45 +++++
>  drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h       |   3 +
>  drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     |  35 +++-
>  drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h |  22 +++
>  .../pm/swsmu/inc/pmfw_if/smu_v11_5_ppsmc.h    |   5 +-
>  drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h  |   5 +-
>  .../gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c  |  92 ++++++++++
>  drivers/gpu/drm/amd/pm/swsmu/smu_internal.h   |   3 +
>  13 files changed, 443 insertions(+), 8 deletions(-)
>
> --
> 2.37.1
>
