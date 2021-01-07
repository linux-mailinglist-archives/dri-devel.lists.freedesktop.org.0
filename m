Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A5A2EE835
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 23:16:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF5526E54C;
	Thu,  7 Jan 2021 22:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7027D6E54C;
 Thu,  7 Jan 2021 22:16:45 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id 9so9166555oiq.3;
 Thu, 07 Jan 2021 14:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+jRKvQW+d+8xxLOyAbc+/4+AB7j0K7moUW56qBQ83Bg=;
 b=lz5ZcF1ciL8XAetMv1QqRfxjiiq8EaLXJJ3XVNVvkXhYJ4eVnbDV0DpX1WYVnanhQr
 CX8bW8gWTlF8UX03Jm4DCRY5VfMr4CNCezhTb4TmZTdv0cOBjABPD1aRYA3ad9Vov3we
 JhwwHTX05Vmb8GqJWzLAwM5ZWw8rEcOzfsQrjgnEl7jOiZbdWAaGdSROz8taD4q9kx76
 qyb0w61gRvw9Mizi/cQKzrI2NCE2+SVgHm19SUIejNiwoYyGJf8Mc2Bok755ZMDoJzK/
 zV1fYh3SsDx5EhcRNnL9lt+0FIWMA0pB1FsdYkbcDfERi4w1z6924sW1XTUtpFwgwSHl
 9JCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+jRKvQW+d+8xxLOyAbc+/4+AB7j0K7moUW56qBQ83Bg=;
 b=t5SZCnu6akBItUF2rKUtnsJCmBkZ9kSCr8wjXVP2MRVNrU3t2JJ5Ced23qzfTmonqi
 EQEWQc22OY9drBQ78D0t1CnVDQOLK7uBPKInomTrG5s+rl/h2+2grBGnTCEWCARAzboB
 vAgmn1qHIST3UrlWlh1KanorvjlrdfJ/97sQ2ZuttI8buBTeyUzRIm6103WogjYG5Wka
 KQUGRJSW7Exc591b4i4aOAgPKjsi00NBKkQF1taq0fJd9hBHW3Aqvj9j2/fya4zrtXUF
 sR0TQUnzplPFqBseiTvG84BMt9Pur/utwGHDqbkS95z3mdHz0AhiMeWB0isMstCPBlgb
 SA5g==
X-Gm-Message-State: AOAM531CGXIVCXK/KtUmRMlKDMLX8dUNRAi1D32ZoImDKt2VU7K9a1AR
 VDpLWqOpEMb6fH5S7/kUZV85uTKE54Rg18D0H+jtquJXBAo=
X-Google-Smtp-Source: ABdhPJzvai3bPIiW/v1e2to9k66+h2chGzfJmZCPxZWJZWUJzQd/E76/kfsjB5RRsKAn2up4KGN+2pTU0YFHtxcNCSA=
X-Received: by 2002:a54:4083:: with SMTP id i3mr482404oii.120.1610057804892;
 Thu, 07 Jan 2021 14:16:44 -0800 (PST)
MIME-Version: 1.0
References: <20210107205321.166698-1-Rodrigo.Siqueira@amd.com>
In-Reply-To: <20210107205321.166698-1-Rodrigo.Siqueira@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 7 Jan 2021 17:16:34 -0500
Message-ID: <CADnq5_PP7cWfX+HPJa=7gG1tBj53-m2isvg_faqrPVBkBMwO1Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] Revert "drm/amd/display: Expose new CRC window
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

On Thu, Jan 7, 2021 at 3:53 PM Rodrigo Siqueira
<Rodrigo.Siqueira@amd.com> wrote:
>
> Hi,
>
> A couple of weeks ago, Daniel highlighted  [1] some issue related to a
> patch entitle "drm/amd/display: Expose new CRC window property". After
> discussion, we realize that we can revert that patch because we will
> need to create a debugfs or full UAPI for CRC soon, which will make this
> code obsolete. We got two other patches related to this same code; for
> this reason, this patchset reverts all changes associated with that
> specific commit.
>
> Cc: Wayne Lin <Wayne.Lin@amd.com>
> Cc: Alexander Deucher <Alexander.Deucher@amd.com>
> Cc: Harry Wentland <Harry.Wentland@amd.com>
> Cc: Roman Li <Roman.Li@amd.com>
> Cc: Bindu R <Bindu.R@amd.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Series is:
Acked-by: Alex Deucher <alexander.deucher@amd.com>

>
> 1. https://www.spinics.net/lists/dri-devel/msg283767.html
>
> Thanks
>
> Rodrigo Siqueira (3):
>   Revert "drm/amd/display: Fix unused variable warning"
>   Revert "drm/amdgpu/disply: fix documentation warnings in display
>     manager"
>   Revert "drm/amd/display: Expose new CRC window property"
>
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 142 ++----------------
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  38 -----
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c |  56 +------
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h |   5 +-
>  drivers/gpu/drm/amd/display/dc/core/dc_link.c |   2 +
>  5 files changed, 14 insertions(+), 229 deletions(-)
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
