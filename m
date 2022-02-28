Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CB74C6364
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 07:55:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E29BA10E267;
	Mon, 28 Feb 2022 06:55:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 024FC10E25D;
 Mon, 28 Feb 2022 06:55:01 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id a23so22750122eju.3;
 Sun, 27 Feb 2022 22:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DdUTETA3NK4ebu6uKL24M0bjkvCp+topgCWybbGmhBs=;
 b=RNfhMIK7Tz2WPjdLijkjvoeESHKaExmE0w15qWZ41SfVLdM2u7EJOnF2/UFS9WzVWq
 vmzObryTYBdTltAn6c7WwCErLQWiuHcVLvj9kVcTFikE4Uh4FzhRT873VRjIhsNs3U9m
 //I1ehHRmKvJ+gARl64FngrH92n3OnvUGK64H149Xn/ylnKR+LIZqa82xeENH33HwrWE
 UKNX74j7uIa61SYaJLa3av23QPhq8jImZDAskWkWqO/7CzyGGa2ussg9yObDWLBABgMZ
 ItNsUcLQP9Yt366BHF8A159CDLvYZ3vcnqm3WuR3dgMGPrQm692hTbTJYLaqNoveSa5q
 JaPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DdUTETA3NK4ebu6uKL24M0bjkvCp+topgCWybbGmhBs=;
 b=FxBvqRHz7gxAGbyDS/tz5xqXcBmIwpT7Wz5zLd6kX69iX/a7KJtVGby1XA9gqsyFbT
 nZlBgnPhfZSscRKgaEdLBa9hw0RKAzKYJu1u6oIZ9wiE5mlWI94KnCcFzM50vpOgY8s/
 nLYOlDbXNVjMgux9VQthiNivSR/XZYGiAse3F9b9F4kS0Ai+sTXC+qYbrH3zhh3zkuf/
 qlDOLrv252t5sjyKPWH0ZzOPxBbP34feT9LwMpmQMUFQPW2vBlfryGMaymfmEPqkgSRp
 qg6PubIv69aN6Vl88OpEjMznTbTRyqXkbGGCeTuRaCxEJNrQKe9qYjsi8yFJCwzoOakP
 LVmg==
X-Gm-Message-State: AOAM530PAV8jkr9+B883sTW1meFpwZeytBwkg2p2Cj6Q7Wyt+6VbfUlX
 s75uN4rFxOamETLhoS/E+3rupZ5k1jkCbxSg0gW28d7TnRurFw==
X-Google-Smtp-Source: ABdhPJyChC43WqgDCfdVm1fc2VmnRpTzQkHOIPcOoBapg50ISK7sjbk/OLBrd8VqDIpos3YO8ItUWzkeHfNCyYgoXqI=
X-Received: by 2002:a17:906:c59:b0:6b9:59d8:263e with SMTP id
 t25-20020a1709060c5900b006b959d8263emr14496654ejf.770.1646031300468; Sun, 27
 Feb 2022 22:55:00 -0800 (PST)
MIME-Version: 1.0
References: <20220225183535.5907-1-alexander.deucher@amd.com>
In-Reply-To: <20220225183535.5907-1-alexander.deucher@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 28 Feb 2022 16:54:49 +1000
Message-ID: <CAPM=9txx5hq6ystyMqYx6Jx=VHRLoeXbrL0fDW5vHM5c--E1Jg@mail.gmail.com>
Subject: Re: [pull] amdgpu, amdkfd drm-next-5.18
To: Alex Deucher <alexander.deucher@amd.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 26 Feb 2022 at 04:35, Alex Deucher <alexander.deucher@amd.com> wrote:
>
> Hi Dave, Daniel,
>
> New stuff for 5.18.
>
> The following changes since commit b63c54d978236dd6014cf2ffba96d626e97c915c:
>
>   drm/amdkfd: Use proper enum in pm_unmap_queues_v9() (2022-02-17 15:59:06 -0500)
>
> are available in the Git repository at:
>
>   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.18-2022-02-25
>
> for you to fetch changes up to 111aeed25ec6bf4d5b4a7b4cb5654f002ba9f795:
>
>   drm/amdgpu: add gfxoff support for smu 13.0.5 (2022-02-25 11:51:18 -0500)
>
> ----------------------------------------------------------------
> amd-drm-next-5.18-2022-02-25:
>
> amdgpu:
> - Raven2 suspend/resume fix
> - SDMA 5.2.6 updates
> - VCN 3.1.2 updates
> - SMU 13.0.5 updates
> - DCN 3.1.5 updates
> - Virtual display fixes
> - SMU code cleanup
> - Harvest fixes
> - Expose benchmark tests via debugfs
> - Drop no longer relevant gart aperture tests
> - More RAS restructuring
> - W=1 fixes
> - PSR rework
> - DP/VGA adapter fixes
> - DP MST fixes
> - GPUVM eviction fix
> - GPU reset debugfs register dumping support

(this time keeping cc).

^ this seems to conflict with the removal of reset_sem or something in
that area.

Can you trial merge this to drm-next and send a fixup patch I should
apply with it?

Dave.
