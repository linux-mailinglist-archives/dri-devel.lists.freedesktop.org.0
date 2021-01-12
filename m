Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B382F337C
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 16:02:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71FE6E2C8;
	Tue, 12 Jan 2021 15:02:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B66F6E2C0;
 Tue, 12 Jan 2021 15:02:22 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id 9so2620374oiq.3;
 Tue, 12 Jan 2021 07:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+R0QAUZewQKNz8JuDb32Kc+cjecolf0P3zPR8Kk8Y6g=;
 b=LiCDIOU/6mZlfNjPTj7J80MbjNniE3zNOnJXebB+RxzoXy+ZUf4fwoDxbEEOKlu8xF
 qtdDUjcocxsZDtpDK+FLYE6lX6MPgvWUdfTcmY4SSsXOwrMpP9zKTrA99GovKP5vY9bT
 GMmNP4ErwrpWg/jHfDWvuK9n6jMyno6NA9x52tmicuHBDw+DHLmjIECmrrI31C6+96m3
 BHYZdMVKSLxjulCtjrLxIT9zHSx9JOkqKrL+fPpkwzlz46qn3JKWHTGoSFJoNuGK6g/u
 pcZqvHmv6qPltkrSf0niqZxBukhTbDHQeo/LBCDhGv47lJaaWleYVgrE8iSvRIULvX7I
 0inQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+R0QAUZewQKNz8JuDb32Kc+cjecolf0P3zPR8Kk8Y6g=;
 b=aR4ASIAxMzyPugpCU6uOKFcMl2WIsBMSAspg8IbhiqdMklkjSQww2R003C9h8tJ7vF
 u7XcXJjIrnAYVHNViiyolWhC2fM6F4REKyitIJWUgJnasVGaLe/GxuyEcM/QkK3FpdVj
 y64GQnG+KWdnwCnHefLzCmF2zIJRl78AewyWs4Ew2QhzR0wLhAy2lM1o7T8nHL725P0b
 8neD600QPm3K5TVD/VzJl3RPnJFP4MN+pPo2+CE/7Fr4qyMrOy6Mf6Jcy2HeVrO7hV00
 j6WBiInCc54y5wtIcftj3tZJODrTu6bDn5aW59k2TbjU9989uB98i/AvUBiOODE9sQz6
 XeYg==
X-Gm-Message-State: AOAM53059/b/AEpNE7H/ynjMPtHLK9PEYzHEYvId+TmVPiOOa0qwAhCK
 Y6fbD9UqcOzpWP5bz7VM/mEcNytWwwpKVXZSUP4=
X-Google-Smtp-Source: ABdhPJw+bLbb5/P/IiNXcWvv0ETJ5erZYzVVHhPsbvz/5MInQRs8OFdJvJD/5ZwY/oT3Je2u7LFQKu1kNd1XUVf93ns=
X-Received: by 2002:a54:4083:: with SMTP id i3mr2501609oii.120.1610463741376; 
 Tue, 12 Jan 2021 07:02:21 -0800 (PST)
MIME-Version: 1.0
References: <20210112145508.1564863-1-Rodrigo.Siqueira@amd.com>
In-Reply-To: <20210112145508.1564863-1-Rodrigo.Siqueira@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 Jan 2021 10:02:10 -0500
Message-ID: <CADnq5_OvmKtjgEa37hctPRQa-6uXjNnQUgNx-VfRBuBhcnH-yA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Revert "drm/amd/display: Expose new CRC window
 property" and changes associated with this commit
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
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
Cc: Roman Li <Roman.Li@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Wayne Lin <Wayne.Lin@amd.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>, Bindu R <Bindu.R@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 12, 2021 at 9:55 AM Rodrigo Siqueira
<Rodrigo.Siqueira@amd.com> wrote:
>
> Hi,
>
> In the V1, Wayne pointed out two problems:
>
> 1. The revert patch included one extra line that does not belong to it;
> 2. The original patch also had other fixes in the same commit;
>
> I removed the extra line from the reverted patch for tackling this
> issue, and I added one additional patch to this series that includes the
> other fix requested by Wayne.
>
> Thanks
>
> Original cover letter:
> A couple of weeks ago, Daniel highlighted  [1] some issue related to a
> patch entitle "drm/amd/display: Expose new CRC window property". After
> discussion, we realize that we can revert that patch because we will
> need to create a debugfs or full UAPI for CRC soon, which will make this
> code obsolete. We got two other patches related to this same code; for
> this reason, this patchset reverts all changes associated with that
> specific commit.
>
> Rodrigo Siqueira (3):
>   Revert "drm/amd/display: Fix unused variable warning"
>   Revert "drm/amdgpu/disply: fix documentation warnings in display
>     manager"
>   Revert "drm/amd/display: Expose new CRC window property"
>
> Wayne Lin (1):
>   drm/amd/display: Fix to be able to stop crc calculation
>

Series is:
Acked-by: Alex Deucher <alexander.deucher@amd.com>

>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 142 ++----------------
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  38 -----
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c |  54 +------
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h |   5 +-
>  4 files changed, 11 insertions(+), 228 deletions(-)
>
> --
> 2.25.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
