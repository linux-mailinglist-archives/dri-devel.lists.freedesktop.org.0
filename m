Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 638B89E7A6F
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 22:13:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6FCA10F1C6;
	Fri,  6 Dec 2024 21:13:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="AqCD0Xva";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AECE110F1C6
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 21:13:24 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-385deda28b3so1939292f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 13:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1733519603; x=1734124403; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UMN4Zf0r0p/s9EFwpScLc/QM7qUF6t9GVN6iGLfG77U=;
 b=AqCD0XvaLbp3my8mW0if3B9f+8fx616sby8JBy39pcZJg7wL5yF7sY2Ve8H6RaqB97
 PwGOAwdA845gN61OlOpYW60Ogz3TEpV1BQuLlFYXDhYTGdI6cNLLwMCC5eu3vnGqYvHl
 I0VsabtvfZeOOCATx0lsAwYFRND/Hxa+0JI/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733519603; x=1734124403;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UMN4Zf0r0p/s9EFwpScLc/QM7qUF6t9GVN6iGLfG77U=;
 b=N6QnI9q5HpbsCctgrhYeCYGgGzUwYXXs6b2vCzSgHz9y0bJpF0cSje2C+GcrzqhusU
 jWHOqSUnKRpu/ciFzOFIKbblfN73l85WT6qaQCNawXxWkRzqHneLJr+v0tGIRQpeZJtl
 yLNbmb8shD05RPqDYCXXbBssrf5YMS28xGiu8WYjE7HKa+a7dzrzazcJ1oDhLiVz5Oeo
 QAWdBhCr7heoFtscbEZ5E88oP5wLEf6IQVYn9YAC2xJ6w++Jlrd1npcnlMJM8WV5KTSX
 47mMKqVxZQiQkvh9HJSUBwt9f6nw5sirT5TQmKXcyZYaMVzCbgJLZbJtROLgNYJaweSG
 XrBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDZeq5bFeLlOjbcuqkLC+NsdJBIbZQnVKS+fhhY+guZI/dKosmBQsHTHBlJx8DrU97MyKNs4ZtexA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+qJT1AMMRqcaLrCiNItI+iVWVHjK6V6RqyW4c5r65MDm8Wg9F
 jwIrsyR8F4SaLIy6nvoXlDlvJeQy6G03b0LvdIjupBB/jFjYaW9penZE1SlBPyg=
X-Gm-Gg: ASbGncvTulXhlxB8ssGmTBVRGIXer5hv9CEPDkmJvEYNrvgRnBKxNvwirZSNFFL/hUy
 H02J21STPcpTAtQvGYBOpyh7/30Dmkzh7CNUDQYKbFA3fa882+RB+N+Is0/zzk3AJhXtZAZghpO
 un8JETXVEVHzdv0svEAVeQZ8ruTpfiOpX92LCunuC+mgmEmXneOSqEFrm2l8W6R8DdZns60ORxJ
 Sae5nSl0ONRUPBq+65zQKNFBPFYJzN67XandXxSufDaxbeTVt9Q5ZB2FB06vA==
X-Google-Smtp-Source: AGHT+IF9ZonleRtF24ap+ZPBpJmyfCI8HYl2N16v/qtPHMJGwJW5M0mLUtiDBTe2qiDQeRm6bGf9Xw==
X-Received: by 2002:a05:6000:2c2:b0:386:3263:6c76 with SMTP id
 ffacd0b85a97d-38632636e77mr1199910f8f.54.1733519602738; 
 Fri, 06 Dec 2024 13:13:22 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38621909952sm5330446f8f.69.2024.12.06.13.13.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 13:13:22 -0800 (PST)
Date: Fri, 6 Dec 2024 22:13:20 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, simona@ffwll.ch
Subject: Re: [pull] amdgpu, amdkfd drm-fixes-6.13
Message-ID: <Z1No8IxgQbHwkNOk@phenom.ffwll.local>
References: <20241206190452.2571042-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206190452.2571042-1-alexander.deucher@amd.com>
X-Operating-System: Linux phenom 6.11.6-amd64 
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

On Fri, Dec 06, 2024 at 02:04:52PM -0500, Alex Deucher wrote:
> Hi Dave, Simona,
> 
> Fixes for 6.13.
> 
> Resending as this didn't seem to make it out to the mailing list when I first
> sent it.
> 
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:
> 
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.13-2024-12-04

Pulled, thanks.
-Sima

> 
> for you to fetch changes up to 73dae652dcac776296890da215ee7dec357a1032:
> 
>   drm/amdgpu: rework resume handling for display (v2) (2024-12-03 18:19:23 -0500)
> 
> ----------------------------------------------------------------
> amd-drm-fixes-6.13-2024-12-04:
> 
> amdgpu:
> - Jpeg work handler fix for VCN 1.0
> - HDP flush fixes
> - ACPI EDID sanity check
> - OLED panel backlight fix
> - DC YCbCr fix
> - DC Detile buffer size debugging
> - DC prefetch calculation fix
> - DC VTotal handling fix
> - DC HBlank fix
> - ISP fix
> - SR-IOV fix
> - Workload profile fixes
> - DCN 4.0.1 resume fix
> 
> amdkfd:
> - GC 12.x fix
> - GC 9.4.x fix
> 
> ----------------------------------------------------------------
> Alex Deucher (9):
>       drm/amdgpu/jpeg1.0: fix idle work handler
>       drm/amdgpu/hdp4.0: do a posting read when flushing HDP
>       drm/amdgpu/hdp5.0: do a posting read when flushing HDP
>       drm/amdgpu/hdp5.2: do a posting read when flushing HDP
>       drm/amdgpu/hdp6.0: do a posting read when flushing HDP
>       drm/amdgpu/hdp7.0: do a posting read when flushing HDP
>       Revert "drm/amd/pm: correct the workload setting"
>       drm/amd/pm: fix and simplify workload handling
>       drm/amdgpu: rework resume handling for display (v2)
> 
> Chris Park (1):
>       drm/amd/display: Add hblank borrowing support
> 
> David Yat Sin (1):
>       drm/amdkfd: hard-code cacheline for gc943,gc944
> 
> Dillon Varone (1):
>       drm/amd/display: Limit VTotal range to max hw cap minus fp
> 
> Lo-an Chen (1):
>       drm/amd/display: Correct prefetch calculation
> 
> Mario Limonciello (2):
>       drm/amd: Sanity check the ACPI EDID
>       drm/amd/display: Fix programming backlight on OLED panels
> 
> Peterson Guo (1):
>       drm/amd/display: Add a left edge pixel if in YCbCr422 or YCbCr420 and odm
> 
> Pratap Nirujogi (1):
>       drm/amdgpu: Fix ISP hw init issue
> 
> Sreekant Somasekharan (1):
>       drm/amdkfd: add MEC version that supports no PCIe atomics for GFX12
> 
> Sung Lee (1):
>       drm/amd/display: Add option to retrieve detile buffer size
> 
> Yiqing Yao (1):
>       drm/amdgpu: fix sriov reinit late orders
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  90 ++++++++---
>  drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c              |  12 +-
>  drivers/gpu/drm/amd/amdgpu/hdp_v5_0.c              |   7 +-
>  drivers/gpu/drm/amd/amdgpu/hdp_v5_2.c              |   6 +-
>  drivers/gpu/drm/amd/amdgpu/hdp_v6_0.c              |   6 +-
>  drivers/gpu/drm/amd/amdgpu/hdp_v7_0.c              |   6 +-
>  drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c             |   2 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |   6 +
>  drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   3 +
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   2 +
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  13 +-
>  drivers/gpu/drm/amd/display/dc/core/dc.c           |  18 +++
>  drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  42 ++++-
>  drivers/gpu/drm/amd/display/dc/dc.h                |   4 +
>  drivers/gpu/drm/amd/display/dc/dc_spl_translate.c  |   2 +-
>  .../drm/amd/display/dc/dml2/display_mode_core.c    |   1 +
>  .../dc/dml2/dml21/dml21_translation_helper.c       |  48 +++++-
>  .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |   3 +-
>  .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |   7 +-
>  drivers/gpu/drm/amd/display/dc/inc/core_types.h    |   3 +
>  drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |   3 +-
>  .../amd/display/dc/resource/dcn20/dcn20_resource.c |  23 +++
>  .../amd/display/dc/resource/dcn30/dcn30_resource.c |   1 +
>  .../display/dc/resource/dcn302/dcn302_resource.c   |   1 +
>  .../display/dc/resource/dcn303/dcn303_resource.c   |   1 +
>  .../amd/display/dc/resource/dcn31/dcn31_resource.c |   7 +
>  .../amd/display/dc/resource/dcn31/dcn31_resource.h |   3 +
>  .../display/dc/resource/dcn314/dcn314_resource.c   |   1 +
>  .../display/dc/resource/dcn315/dcn315_resource.c   |   1 +
>  .../display/dc/resource/dcn316/dcn316_resource.c   |   1 +
>  .../amd/display/dc/resource/dcn32/dcn32_resource.c |   2 +
>  .../display/dc/resource/dcn321/dcn321_resource.c   |   1 +
>  .../amd/display/dc/resource/dcn35/dcn35_resource.c |   2 +
>  .../display/dc/resource/dcn351/dcn351_resource.c   |   2 +
>  .../display/dc/resource/dcn401/dcn401_resource.c   |   1 +
>  .../drm/amd/display/modules/freesync/freesync.c    |  13 +-
>  drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   6 +-
>  drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          | 169 +++++++++++---------
>  drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |  17 +-
>  drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  | 167 +++++++++++---------
>  drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    | 170 ++++++++++++--------
>  .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    | 171 ++++++++++++--------
>  drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |  41 ++---
>  drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |  43 ++---
>  .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   | 175 +++++++++++----------
>  .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   | 139 +++++++++-------
>  .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   | 165 +++++++++++--------
>  drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |  33 +++-
>  drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |   6 +-
>  49 files changed, 1031 insertions(+), 615 deletions(-)

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
