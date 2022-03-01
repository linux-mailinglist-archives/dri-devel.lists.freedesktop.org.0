Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 040714C83DC
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 07:18:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0C410EBDB;
	Tue,  1 Mar 2022 06:18:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A45F10EBD9;
 Tue,  1 Mar 2022 06:18:17 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id bq11so20603859edb.2;
 Mon, 28 Feb 2022 22:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7NfgAjuVkBupZ9ZIwRKecXB6OMsFyowckjpMFNRPfF8=;
 b=dPlfVL6UnVCoGiGyOpmLKwZ+9BxLLXDdMpOyCQcpjGvGg8F/ehh3AFBNHlLa9X/Bh3
 Kzwjsu3jAt5sRB5+i6aQE54LN2/PzmBod5DWgVfrTpUKPxUGFdNQlFb8DIxi5wVxKrLr
 j7w9G6VlMSDuAj2X9Au6jbAWiWGCElgFRu0d8yzC9DJRzKE79VNtmUohA6AVcugwIpO2
 YlJxjY8+IsvP0z8DEy3ArP8TlhZk2yAOWrVdPIj7iJjBesXczvulOt8ft/yT27QKc1x0
 YJ1faVKfZLVKe3uK7REG2slcXbamkeIQ+XctAMDzkLCsVcgiuqxn22Q0xFiUN7DQKCNa
 hOug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7NfgAjuVkBupZ9ZIwRKecXB6OMsFyowckjpMFNRPfF8=;
 b=l1f4hgCTbbE/rVyiXgwaqGSpa6paPpyfZatW/K11dwjRMxOxAn+uyrV0QtzHHYWncK
 irbEdU+hVkkoLUDtIIIZV/pxRIRANeOzImYKl+C6BVth+s32BV1bS5oFenx0OnM/lt0C
 1LfMwhBDuWV4XDzhBfD0ca52b7NN0tGuZyndDV7C2gm/BmhxpruumNo8DX0MsZZXQKr9
 C0FRqUFMk1/K4fmbRMaBsXcx0HELOWsARQjzvQ7SeyTqc56w5nDiDcp0BKbv85Uydh7K
 F9cE5brXGjSBodJO0Ip55a5mSvevURbm8ojyzMuDmpG9o7GzJ9JLf6gisPsFjTBitwCR
 C+6Q==
X-Gm-Message-State: AOAM5330FhCyhPLpN19RzBESvlnsSZmW7KR/LokN+WxdgsfgqvJlln4e
 s0eo+d2X9mPMSFr8QaXX+V5iIM2ORXWsKpzd3j0=
X-Google-Smtp-Source: ABdhPJzEbGB5L8c+rztyLfwzFeqvYHMCbfnnjbF60NJsJA+S1fszjU1cWnisdHvSjFyKoZat9EcawQznE8KRGNxYvZM=
X-Received: by 2002:a05:6402:520c:b0:412:7f7d:b06b with SMTP id
 s12-20020a056402520c00b004127f7db06bmr23394700edd.91.1646115495822; Mon, 28
 Feb 2022 22:18:15 -0800 (PST)
MIME-Version: 1.0
References: <20220225183535.5907-1-alexander.deucher@amd.com>
 <CAPM=9txx5hq6ystyMqYx6Jx=VHRLoeXbrL0fDW5vHM5c--E1Jg@mail.gmail.com>
 <CADnq5_PZoNEiKUgycUWLiDEYyadw2Li5XpeOCOrtTi7hi=GxCA@mail.gmail.com>
In-Reply-To: <CADnq5_PZoNEiKUgycUWLiDEYyadw2Li5XpeOCOrtTi7hi=GxCA@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 1 Mar 2022 16:18:04 +1000
Message-ID: <CAPM=9tzx19JgfmhX+B1wD0n9wp=5d7-ySkXK6HaP4KeaMCtAeg@mail.gmail.com>
Subject: Re: [pull] amdgpu, amdkfd drm-next-5.18
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 1 Mar 2022 at 03:11, Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Mon, Feb 28, 2022 at 1:55 AM Dave Airlie <airlied@gmail.com> wrote:
> >
> > On Sat, 26 Feb 2022 at 04:35, Alex Deucher <alexander.deucher@amd.com> wrote:
> > >
> > > Hi Dave, Daniel,
> > >
> > > New stuff for 5.18.
> > >
> > > The following changes since commit b63c54d978236dd6014cf2ffba96d626e97c915c:
> > >
> > >   drm/amdkfd: Use proper enum in pm_unmap_queues_v9() (2022-02-17 15:59:06 -0500)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.18-2022-02-25
> > >
> > > for you to fetch changes up to 111aeed25ec6bf4d5b4a7b4cb5654f002ba9f795:
> > >
> > >   drm/amdgpu: add gfxoff support for smu 13.0.5 (2022-02-25 11:51:18 -0500)
> > >
> > > ----------------------------------------------------------------
> > > amd-drm-next-5.18-2022-02-25:
> > >
> > > amdgpu:
> > > - Raven2 suspend/resume fix
> > > - SDMA 5.2.6 updates
> > > - VCN 3.1.2 updates
> > > - SMU 13.0.5 updates
> > > - DCN 3.1.5 updates
> > > - Virtual display fixes
> > > - SMU code cleanup
> > > - Harvest fixes
> > > - Expose benchmark tests via debugfs
> > > - Drop no longer relevant gart aperture tests
> > > - More RAS restructuring
> > > - W=1 fixes
> > > - PSR rework
> > > - DP/VGA adapter fixes
> > > - DP MST fixes
> > > - GPUVM eviction fix
> > > - GPU reset debugfs register dumping support
> >
> > (this time keeping cc).
> >
> > ^ this seems to conflict with the removal of reset_sem or something in
> > that area.
> >
> > Can you trial merge this to drm-next and send a fixup patch I should
> > apply with it?
>
> reset_sem moved from adev->reset_sem to adev->reset_domain->sem.  See
> the attached diff.  I also pushed a sample merge if that is helpful:
> https://gitlab.freedesktop.org/agd5f/linux/-/commits/drm-next-amd-drm-next-merge-5.18
>
> Thanks!
>

Excellent thanks Alex.

Dave.
