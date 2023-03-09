Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 249E06B2C18
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 18:33:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874C710E8C4;
	Thu,  9 Mar 2023 17:33:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFEA310E8C3;
 Thu,  9 Mar 2023 17:33:11 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 e9-20020a056830200900b00694651d19f6so1459995otp.12; 
 Thu, 09 Mar 2023 09:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678383191;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YFUV7+yfzaPvh0Jt9dc9ZvzF+JCRGHOyG3UMB1bYudA=;
 b=j8Kb5+l3GTSQ16oEQLQWE+ACFgo8HRn/4l6ZZ4xN9QvTob29qBK/pLaRBgiCs3GBx6
 W+2Zrk35D4ep75JuZWF0q7n3YQahfwsJIXpBKi3ElU4GwqrXwxE6u4gKMUFPmmR78Ryg
 fnmI5i0fmbYrHMG8pgwlMVdbyArN/S3qOAQ0g+ZiPVIfP+zFKf+0hpflS63YJyqRPPsl
 gj1UMfRNfiojzPutNGj6Ca5WktyZhY1hedAAhzcNsGgMPcwnCvIPA4f3MnaIU+aLPwB2
 /24RmxLNdpwhoJB88wKU0jRsjoXkscmFlGPm0j0IOhFaq0NLCezH2UOYw1EZMY9c3EIi
 lg4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678383191;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YFUV7+yfzaPvh0Jt9dc9ZvzF+JCRGHOyG3UMB1bYudA=;
 b=b00av7NOH594KHGvVAlGNkuWLd+G/kveoMjjnpWcgPt1oVt+uPSp3/E4p8F5ExI5vS
 wYmFekYILuPB/DwzuILsLHhWyzTrywIP+whkgF8AQ/GpZQCuYL894sdBk66+vrOMVCyv
 8BtqYTmEIw1+mbINyj30kejGYLMgNzP/ZtO6WSetlG+Dut5b8pbJtys8UnrxeH9Fa8o7
 d1KDXoGu3IaM2SZqXKrXJPgsQh796WoE6+xkxnUnZ/5GlXT4Po3pwlPKlspvzqTmtMU1
 SBS9euun+/bECsGTsF2I4SbXH4RloVisxDxAMjBxmwO+xezivxrWc5OMZ38kGCWCGjlU
 WL2g==
X-Gm-Message-State: AO0yUKXyq+0/+8dAioZsy3HcloLuvNQDahwb0KvscIiCyGW2ZVxyGo83
 KMhs/PSomn3VF6mwPoseA18i418dB4SSlYLl8JgJe3+g
X-Google-Smtp-Source: AK7set8J5UjaaAsM9kZekp+TV32nqz8y0Ff+y1xTZ6idP5DupipTaF1jajuU8bbSo6xZfaq1xAjMRuLntr+KXCGYhSE=
X-Received: by 2002:a9d:7105:0:b0:690:c81f:d459 with SMTP id
 n5-20020a9d7105000000b00690c81fd459mr7169363otj.3.1678383191100; Thu, 09 Mar
 2023 09:33:11 -0800 (PST)
MIME-Version: 1.0
References: <20230309043816.7840-1-alexander.deucher@amd.com>
 <9bdb3857-c7c1-0964-270e-41717cce0536@amd.com>
In-Reply-To: <9bdb3857-c7c1-0964-270e-41717cce0536@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 9 Mar 2023 12:32:59 -0500
Message-ID: <CADnq5_PPTOChDcfv-aL3AWU_a+OTQntSNS86WNAxNELDsuXzjQ@mail.gmail.com>
Subject: Re: [pull] amdgpu, amdkfd drm-fixes-6.3
To: Felix Kuehling <felix.kuehling@amd.com>
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
Cc: "Chen, Xiaogang" <Xiaogang.Chen@amd.com>, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 9, 2023 at 12:16 PM Felix Kuehling <felix.kuehling@amd.com> wrote:
>
>
> Am 2023-03-08 um 23:38 schrieb Alex Deucher:
> > Hi Dave, Daniel,
> >
> > Fixes for 6.3.
> >
> > The following changes since commit 66305069eb6d17d9190cbcd196f3f7487df47ae8:
> >
> >    Merge tag 'drm-misc-fixes-2023-02-23' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2023-03-07 05:42:34 +1000)
> >
> > are available in the Git repository at:
> >
> >    https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.3-2023-03-08
> >
> > for you to fetch changes up to 41f95a0e40903fcf70463fcc060b7faf761b23f6:
> >
> >    drm/amdgpu/soc21: Add video cap query support for VCN_4_0_4 (2023-03-08 14:39:09 -0500)
> >
> > ----------------------------------------------------------------
> > amd-drm-fixes-6.3-2023-03-08:
> >
> > amdgpu:
> > - Misc display fixes
> > - UMC 8.10 fixes
> > - Driver unload fixes
> > - NBIO 7.3.0 fix
> > - Error checking fixes for soc15, nv, soc21 read register interface
> > - Fix video cap query for VCN 4.0.4
> >
> > amdkfd:
> > - Fix BO offset for multi-VMA page migration
> > - Fix return check in doorbell handling
> >
> > ----------------------------------------------------------------
> > Alex Deucher (3):
> >        drm/amdgpu: fix error checking in amdgpu_read_mm_registers for soc15
> >        drm/amdgpu: fix error checking in amdgpu_read_mm_registers for soc21
> >        drm/amdgpu: fix error checking in amdgpu_read_mm_registers for nv
> >
> > Candice Li (2):
> >        drm/amdgpu: Support umc node harvest config on umc v8_10
> >        drm/amd/pm: Enable ecc_info table support for smu v13_0_10
> >
> > Harry Wentland (2):
> >        drm/display: Don't block HDR_OUTPUT_METADATA on unknown EOTF
> >        drm/connector: print max_requested_bpc in state debugfs
> >
> > Mario Limonciello (1):
> >        drm/amd: Fix initialization mistake for NBIO 7.3.0
> >
> > Shashank Sharma (1):
> >        drm/amdgpu: fix return value check in kfd
> >
> > Swapnil Patel (1):
> >        drm/amd/display: Update clock table to include highest clock setting
> >
> > Veerabadhran Gopalakrishnan (1):
> >        drm/amdgpu/soc21: Add video cap query support for VCN_4_0_4
> >
> > Xiaogang Chen (1):
> >        drm/amdkfd: Fix BO offset for multi-VMA page migration
>
> This patch introduced a regression. Xiaogang is working on a followup
> fix. I would recommend not to merge it yet.
>
> Xiaogang, please add a Fixes tag to your follow-up patch to make the
> connection clear.

Thanks.  If it lands today, I'll send an updated PR with the fix.  If
not, I'll send an updated PR with this patch dropped.

Alex


>
> Thanks,
>    Felix
>
>
> >
> > lyndonli (2):
> >        drm/amdgpu: Fix call trace warning and hang when removing amdgpu device
> >        drm/amdgpu: Fix the warning info when removing amdgpu device
> >
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      | 10 ++-
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |  2 +-
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            | 17 +----
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |  7 +-
> >   drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |  1 -
> >   drivers/gpu/drm/amd/amdgpu/nbio_v7_2.c             | 14 ++--
> >   drivers/gpu/drm/amd/amdgpu/nv.c                    |  7 +-
> >   drivers/gpu/drm/amd/amdgpu/soc15.c                 |  5 +-
> >   drivers/gpu/drm/amd/amdgpu/soc21.c                 |  8 ++-
> >   drivers/gpu/drm/amd/amdgpu/umc_v8_10.h             |  4 +-
> >   drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c          |  2 +-
> >   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           | 17 +++--
> >   .../drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c | 19 +++++-
> >   .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   | 75 ++++++++++++++++++++++
> >   drivers/gpu/drm/display/drm_hdmi_helper.c          |  6 +-
> >   drivers/gpu/drm/drm_atomic.c                       |  1 +
> >   16 files changed, 146 insertions(+), 49 deletions(-)
