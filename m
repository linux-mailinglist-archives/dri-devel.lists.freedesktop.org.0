Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C98560F740
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 14:29:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DAB310E5F5;
	Thu, 27 Oct 2022 12:29:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF84F10E5E5;
 Thu, 27 Oct 2022 12:29:21 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id i7so1759269oif.4;
 Thu, 27 Oct 2022 05:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xa5GrxnZ3/k298AiI9bwmUqW7auUsL6W5b9kaeulqJg=;
 b=dbo/hFAdohbxbYorkHxEiszhJ416SSL4dcAYp9HQ9/blc7v6iwR/lvhfE+O2FbajH4
 +snhoxSbG83H3opKzvUhXihv+NGpiMxYvtYPq5dhrDzOyA7btYvs2VXGTTK5sErEQaXo
 +MhcyMSOF0gjwhFOcfArxhfZ0ouEfhWmOxyYwF4lmtYvNHH532kE6iJFvUcF+Cdp4561
 KmOhs77lXclY2iKxqa9burqw3eAAhBD8cSJvWjpIh63Fw0DYDr8seEa796s/REaAksum
 fZ/AuyNKvMcxkcE11H7CFEY08cHJhqaiF7ychXdxmKgWJjCrv/F4mz42RLQ4ULP1UZB+
 nVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xa5GrxnZ3/k298AiI9bwmUqW7auUsL6W5b9kaeulqJg=;
 b=cpv7PA72T7BltKp5AxLNYDm6fXjBaxVyfkC0iJG3k3fJslCjF8SN9skE1KNh2BZ/XI
 WJDlE6fEn9ldFNw1ZRlr3vJvJa1E3/warU/Dv9fKDEA0LQqcwhT9PesvdyT935MjsUlK
 vWk4Uitjy1HIx2Wk8MyEGpupGJeNm7ATTGMBsSOWgOC7l88Ms7x0b7+8tnAuXT8uEBmj
 3MxhTVidBbgpnbu2EJQNc00HzzRHPe99+WeIXADf3R7ohz7LIzmww7JWXqhzgBaNNfSc
 bSUUBw7HObPO/TVHVPGNKlT9uik3I4vheim0PSIH9LjXmsyVW//t30TxjGJufpLIZoaf
 UGng==
X-Gm-Message-State: ACrzQf3Y37txiTfajZHJOT20GOnl4B/F0L+i8qRoheAifXHPIkLu6Rpo
 ZLe1tOIBI0PaXnukJoy4P2hhpDPrfaG2+su/LaRHUfRc
X-Google-Smtp-Source: AMsMyM5vrAIU7x2kSV7IFeNFwFJen51NMaIo6s1inO+wV2qpCTq1uhruDI6NZ51lFjNHXwG6G42QGHHVxqTHT7Vo6Pg=
X-Received: by 2002:a05:6808:998:b0:359:c7f3:1ef8 with SMTP id
 a24-20020a056808099800b00359c7f31ef8mr541268oic.46.1666873761106; Thu, 27 Oct
 2022 05:29:21 -0700 (PDT)
MIME-Version: 1.0
References: <20221027024101.6881-1-alexander.deucher@amd.com>
 <DM5PR12MB24693E14F89BD4116EBB51ADF1339@DM5PR12MB2469.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB24693E14F89BD4116EBB51ADF1339@DM5PR12MB2469.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 27 Oct 2022 08:29:09 -0400
Message-ID: <CADnq5_ON7UBcr9OfkOZN-vuNcSyEq7UzZoe06iAChS39rNNbnQ@mail.gmail.com>
Subject: Re: [pull] amdgpu, amdkfd drm-fixes-6.1
To: "Chen, Guchun" <Guchun.Chen@amd.com>
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 27, 2022 at 1:42 AM Chen, Guchun <Guchun.Chen@amd.com> wrote:
>
> Hello Alex,
>
> Regarding below patch, I guess we need to pick "8eb402f16d5b drm/amdgpu: =
Fix uninitialized warning in mmhub_v2_0_get_clockgating()" together, otherw=
ise, build will possibly fail. Is it true?
>

I squashed that fix into the original patch to avoid confusion when
the patch goes to stable.

Alex


>  " Lijo Lazar (1):
>       drm/amdgpu: Remove ATC L2 access for MMHUB 2.1.x"
>
> Regards,
> Guchun
>
> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Alex D=
eucher
> Sent: Thursday, October 27, 2022 10:41 AM
> To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; airli=
ed@gmail.com; daniel.vetter@ffwll.ch
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>
> Subject: [pull] amdgpu, amdkfd drm-fixes-6.1
>
> Hi Dave, Daniel,
>
> Fixes for 6.1.  Fixes for new IPs and misc other fixes.
>
> The following changes since commit cbc543c59e8e7c8bc8604d6ac3e18a029e3d51=
18:
>
>   Merge tag 'drm-misc-fixes-2022-10-20' of git://anongit.freedesktop.org/=
drm/drm-misc into drm-fixes (2022-10-21 09:56:14 +1000)
>
> are available in the Git repository at:
>
>   https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
lab.freedesktop.org%2Fagd5f%2Flinux.git&amp;data=3D05%7C01%7Cguchun.chen%40=
amd.com%7C6bbe7e42eb3d43bf622208dab7c4c906%7C3dd8961fe4884e608e11a82d994e18=
3d%7C0%7C0%7C638024353059986195%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3DY%2BU1OrPyhCaS44nGQMTrtqBpdkcJwFdFJEAaqWGiaqo%3D&amp;reserved=3D0 tags/a=
md-drm-fixes-6.1-2022-10-26-1
>
> for you to fetch changes up to d61e1d1d5225a9baeb995bcbdb904f66f70ed87e:
>
>   drm/amdgpu: disallow gfxoff until GC IP blocks complete s2idle resume (=
2022-10-26 17:48:43 -0400)
>
> ----------------------------------------------------------------
> amd-drm-fixes-6.1-2022-10-26-1:
>
> amdgpu:
> - Stable pstate fix
> - SMU 13.x updates
> - SR-IOV fixes
> - PCI AER fix
> - GC 11.x fixes
> - Display fixes
> - Expose IMU firmware version for debugging
> - Plane modifier fix
> - S0i3 fix
>
> amdkfd:
> - Fix possible memory leak
> - Fix GC 10.x cache info reporting
>
> UAPI:
> - Expose IMU firmware version via existing INFO firmware query
>
> ----------------------------------------------------------------
> Alvin Lee (1):
>       drm/amd/display: Don't return false if no stream
>
> Chengming Gui (1):
>       drm/amdgpu: fix pstate setting issue
>
> David Francis (1):
>       drm/amd: Add IMU fw version to fw version queries
>
> Jesse Zhang (1):
>       drm/amdkfd: correct the cache info for gfx1036
>
> Joaqu=C3=ADn Ignacio Aramend=C3=ADa (1):
>       drm/amd/display: Revert logic for plane modifiers
>
> Kenneth Feng (2):
>       drm/amd/pm: update driver-if header for smu_v13_0_10
>       drm/amd/pm: allow gfxoff on gc_11_0_3
>
> Lijo Lazar (1):
>       drm/amdgpu: Remove ATC L2 access for MMHUB 2.1.x
>
> Prike Liang (2):
>       drm/amdkfd: update gfx1037 Lx cache setting
>       drm/amdgpu: disallow gfxoff until GC IP blocks complete s2idle resu=
me
>
> Rafael Mendonca (1):
>       drm/amdkfd: Fix memory leak in kfd_mem_dmamap_userptr()
>
> Rodrigo Siqueira (1):
>       drm/amd/display: Remove wrong pipe control lock
>
> Yiqing Yao (1):
>       drm/amdgpu: Adjust MES polling timeout for sriov
>
> YuBiao Wang (1):
>       drm/amdgpu: skip mes self test for gc 11.0.3 in recover
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   6 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |   5 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  18 +++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  13 +++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |   4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |   1 +
>  drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        |   1 +
>  drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   1 +
>  drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |   9 +-
>  drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c            |  28 ++----
>  drivers/gpu/drm/amd/amdkfd/kfd_crat.c              | 106 +++++++++++++++=
++++-
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |  50 ++--------
>  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  12 +--
>  .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |   2 +-
>  .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h | 111 +++++++++++++++=
------
>  drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |   2 +-
>  drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   7 +-
>  include/uapi/drm/amdgpu_drm.h                      |   2 +
>  18 files changed, 259 insertions(+), 119 deletions(-)
