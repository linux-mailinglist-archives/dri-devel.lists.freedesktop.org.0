Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 462396A4575
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 16:00:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E109D10E425;
	Mon, 27 Feb 2023 15:00:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A9010E421;
 Mon, 27 Feb 2023 15:00:26 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-172a623ad9aso7600490fac.13; 
 Mon, 27 Feb 2023 07:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3CcviMvOYlI24749RtEMYWxJzqWsOF819uiocGxBaEg=;
 b=n3aIemxHiGtU5ErvLqcG6XucMRyjAX9oU6ieY5ISHtk9t7qa7NPQuYZkiKMUviNmYK
 FZLblMP0FHW+Lka7Jf9y2Adxy7A57SGG3XH5NStpT92W8qo8oOBbl6JiCHqYmVFgdeiL
 DtrCxsoRWTUvddm/1ir2WganNmNQATGuzDeJRwdk3lIolIarNhdvVDDjLBIPoYG+SB/v
 91V6CMCaZEZ/thjA5+kHzxdEP2o1csvEvjNhsaeOp/eVHFIf2YzAvBvulHBV+SuSpWTZ
 Ruy7ulP6iqGB70Uz1vzYgsinaAngDeI1BI30IWL+9YXME+a7kawkuADEnog25gQSrPsH
 RBAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3CcviMvOYlI24749RtEMYWxJzqWsOF819uiocGxBaEg=;
 b=VDGR+aSdFS+nXo6osOYxb6tBrKAYcInOsp37tQuWea+RS4wuZAmnHgL+Kk5heztw0I
 B9tWbYvl7AerpnX6Qe6Ugb42x3uGpMHEq1PVxHCsS/RzE6ZNEZr7IY/LxDYB5aWTYLN8
 wrN2Te1+5OtewJB8N79xXiWhNygfIpLoE0R1ncOOFmdOEW0cCFFTgyMBbOvKlYxq84Wi
 MEWSkKkHxMl4sV1r0vztvh1KNpc/JCBBgUzLDEcJXP560Bnhdiv9kYiS7IU/VLfB/eq/
 Oo4q66HdSXASeQW7rcT7+euKJkqNciYJv8YDQZtYSWb9kAqmTPuEmksE8/xBXtWYyAcI
 0r+w==
X-Gm-Message-State: AO0yUKXQvgSqoYTIKVzaaQQZsIf52LWAG6olCg9QCcL/5ILw7ZGYc1mh
 QVVvRfihdJH1dB0JI5dCckOztGEd40v5orAKM5A=
X-Google-Smtp-Source: AK7set8PfTAsqeeDlM+HDh/Jq9X5RHL+NRajGNKHOiAzdv87xxr74y/ysCBzxzlho8kKJ4sysPDuak1PkUSOKdMgCc8=
X-Received: by 2002:a05:6871:6b97:b0:16e:2f74:e5c1 with SMTP id
 zh23-20020a0568716b9700b0016e2f74e5c1mr2571814oab.8.1677510025918; Mon, 27
 Feb 2023 07:00:25 -0800 (PST)
MIME-Version: 1.0
References: <20230224095152.30134-1-thomas.hellstrom@linux.intel.com>
 <6cddb602-31dd-8854-25dc-11afe9b1a275@linux.intel.com>
 <6f0b5231-a9c2-e31e-f2d6-61f403d2f94d@lankhorst.se>
 <f1caadc4-9e65-1b1c-ec81-82a89f764b40@linux.intel.com>
 <bcf1708d-5e3e-032e-6770-231cdb57971c@amd.com>
In-Reply-To: <bcf1708d-5e3e-032e-6770-231cdb57971c@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 27 Feb 2023 10:00:14 -0500
Message-ID: <CADnq5_NRfYgTW1dszn2huCqLeiHAOb6-Mg=N_gSMczT_=cj1Eg@mail.gmail.com>
Subject: Re: [Intel-xe] [PATCH v4 0/3] drm/helpers: Make the suballocation
 manager drm generic
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, Maarten Lankhorst <dev@lankhorst.se>,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 27, 2023 at 8:04 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 27.02.23 um 10:00 schrieb Thomas Hellstr=C3=B6m:
> > Hi, Maarten,
> >
> > On 2/27/23 09:55, Maarten Lankhorst wrote:
> >> Hey,
> >>
> >> I can push this to drm-misc-next, I don't think a drm maintainer ack
> >> is needed, as long as we have the acks from the amd folk for merging
> >> through drm-misc-next.
> >>
> > OK, sound good, we have that ack so please go ahead!
>
> Works for me and I don't think Alex would object either.

Fine with me as well.

Alex

>
> Regards,
> Christian.
>
> >
> > /Thomas
> >
> >
> >> ~Maarten
> >>
> >> On 2023-02-27 09:11, Thomas Hellstr=C3=B6m wrote:
> >>> Daniel, Dave
> >>>
> >>> Ack to merge this to drm through drm-misc-next?
> >>>
> >>> /Thomas
> >>>
> >>>
> >>> On 2/24/23 10:51, Thomas Hellstr=C3=B6m wrote:
> >>>> This series (or at least the suballocator helper) is a prerequisite
> >>>> for the new Xe driver.
> >>>>
> >>>> There was an unresolved issue when the series was last up for review=
,
> >>>> and that was the per allocation aligment. Last message was from
> >>>> Maarten Lankhorst arguing that the larger per-driver alignment used
> >>>> would only incur a small memory cost. This new variant resolves that=
.
> >>>>
> >>>> The generic suballocator has been tested with the Xe driver, and a
> >>>> kunit test is under development.
> >>>> The amd- and radeon adaptations are only compile-tested.
> >>>>
> >>>> v3:
> >>>> - Remove stale author information (Christian K=C3=B6nig)
> >>>> - Update Radeon Kconfig (Thomas Hellstr=C3=B6m)
> >>>>
> >>>> v4:
> >>>> - Avoid 64-bit integer divisions (kernel test robot <lkp@intel.com>)
> >>>> - Use size_t rather than u64 for the managed range. (Thomas)
> >>>>
> >>>>
> >>>> Maarten Lankhorst (3):
> >>>>    drm/suballoc: Extract amdgpu_sa.c as generic suballocation helper
> >>>>    drm/amd: Convert amdgpu to use suballocation helper.
> >>>>    drm/radeon: Use the drm suballocation manager implementation.
> >>>>
> >>>>   drivers/gpu/drm/Kconfig                    |   4 +
> >>>>   drivers/gpu/drm/Makefile                   |   3 +
> >>>>   drivers/gpu/drm/amd/amdgpu/Kconfig         |   1 +
> >>>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  26 +-
> >>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c     |   5 +-
> >>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  23 +-
> >>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |   3 +-
> >>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c     | 324 +--------------
> >>>>   drivers/gpu/drm/drm_suballoc.c             | 457
> >>>> +++++++++++++++++++++
> >>>>   drivers/gpu/drm/radeon/Kconfig             |   1 +
> >>>>   drivers/gpu/drm/radeon/radeon.h            |  55 +--
> >>>>   drivers/gpu/drm/radeon/radeon_ib.c         |  12 +-
> >>>>   drivers/gpu/drm/radeon/radeon_object.h     |  25 +-
> >>>>   drivers/gpu/drm/radeon/radeon_sa.c         | 316 ++------------
> >>>>   drivers/gpu/drm/radeon/radeon_semaphore.c  |   4 +-
> >>>>   include/drm/drm_suballoc.h                 | 108 +++++
> >>>>   16 files changed, 674 insertions(+), 693 deletions(-)
> >>>>   create mode 100644 drivers/gpu/drm/drm_suballoc.c
> >>>>   create mode 100644 include/drm/drm_suballoc.h
> >>>>
>
