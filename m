Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A87145D04
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 21:22:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0796F6F8BF;
	Wed, 22 Jan 2020 20:22:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A536F8BF;
 Wed, 22 Jan 2020 20:22:03 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id t2so528688wrr.1;
 Wed, 22 Jan 2020 12:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tVuD5M/MYCtIro+NiHeJqsEtK6AMbnd7kxhI4hTwchA=;
 b=LmLw0HxdNBFf7ECjrsO5sltd9/xYioUniTzKT1bbDVnXENzkPG3gkkLmeSy4qClr2d
 e8dT3ZVxttShq2xC9cc1Cb9H5fwFDaRTdS7zwQDVHadroujs4Dv+nNgpwlxkeUCI5frb
 Vofl2Q+dUCC2bz+5GNm/pxC+YJfpVsVq9x1/KNCknqF0YhdXSqMVWzmWSkYid8F78UrJ
 RwdP9PO57Y7Ws9hUBvPv6v97LGzGZtH69IFU7ssOR0uaB45Wd7jSd5uvEsQH2s581CrT
 UFWB/62GGDv5384otm3o+Gr7ZS6NcCZ61ih24zvl4D7v6dMYOsMEPnulIRyl0oEWsyVI
 qCXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tVuD5M/MYCtIro+NiHeJqsEtK6AMbnd7kxhI4hTwchA=;
 b=Do4d5XKoTNZODMdrNcNUlgIsx88qt6p4HAnfz0j9jH1SCtTg8IE0i3HjjcyosUps/v
 JGhxyjeAu/vrOKeHKwKqzQi/T4IDrAIvEZdyxTiRvMwhpQ4WMf6fIyh7pReNNXxeaSr0
 BlhwH0FCrBIGTS5O/oSN6kzuIjeO+ReHca1UXMYYl/vw0x6fQLXWIBhLy1DErUbq1pJs
 AlVvQBWkr6zYLVZMFdjZ7SZ4mA8X/YdETzqXO9BvyNPJNWFs3w6lk0RwNm4dNCntu8xg
 oywtXk5BAZThg4UI2/FcRORk1r2vUhfVeHpj+2gu0z45q+2ubQebsZxsLJdRwKsu7qIl
 R28w==
X-Gm-Message-State: APjAAAXJfjlrGwmIa7dcXFkhDcOPsgiiJVaQxt7YI3W3fJwj0T82iqPv
 MLP6KKtDZC6/HXCzygxzqCzzHksqBA2Km7S7euw=
X-Google-Smtp-Source: APXvYqyeSw31DSoMsVo1tGcVhk/TW2SRv/VBLC1ScXJUSxOqdCQ+CHeLEYjUrgNXmb35TLEgo95z3NVp92YSiJflkKE=
X-Received: by 2002:adf:ec4c:: with SMTP id w12mr13693493wrn.124.1579724522583; 
 Wed, 22 Jan 2020 12:22:02 -0800 (PST)
MIME-Version: 1.0
References: <20200121135540.165798-1-chenzhou10@huawei.com>
In-Reply-To: <20200121135540.165798-1-chenzhou10@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 22 Jan 2020 15:21:48 -0500
Message-ID: <CADnq5_OeoTqpf5Rhtwac8gJ_8P5rUKYhrhRDC-5BgHt0WUYFnw@mail.gmail.com>
Subject: Re: [PATCH -next 00/14] drm/amdgpu: remove unnecessary conversion to
 bool
To: Chen Zhou <chenzhou10@huawei.com>
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
Cc: Dave Airlie <airlied@linux.ie>, "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 Tao Zhou <tao.zhou1@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 21, 2020 at 11:08 AM Chen Zhou <chenzhou10@huawei.com> wrote:
>
> This patch series remove unnecessary conversion to bool in dir
> drivers/gpu/drm/amd/amdgpu/, which is detected by coccicheck.

Thanks for the patches.  Already applied this patch:
https://patchwork.freedesktop.org/series/72281/#rev2
which covers these.

Alex

>
> Chen Zhou (14):
>   drm/amdgpu: remove unnecessary conversion to bool in mmhub_v1_0.c
>   drm/amdgpu: remove unnecessary conversion to bool in vega10_ih.c
>   drm/amdgpu: remove unnecessary conversion to bool in navi10_ih.c
>   drm/amdgpu: remove unnecessary conversion to bool in gfx_v10_0.c
>   drm/amdgpu: remove unnecessary conversion to bool in sdma_v5_0.c
>   drm/amdgpu: remove unnecessary conversion to bool in athub_v1_0.c
>   drm/amdgpu: remove unnecessary conversion to bool in amdgpu_acp.c
>   drm/amdgpu: remove unnecessary conversion to bool in soc15.c
>   drm/amdgpu: remove unnecessary conversion to bool in nv.c
>   drm/amdgpu: remove unnecessary conversion to bool in mmhub_v9_4.c
>   drm/amdgpu: remove unnecessary conversion to bool in amdgpu_device.c
>   drm/amdgpu: remove unnecessary conversion to bool in athub_v2_0.c
>   drm/amdgpu: remove unnecessary conversion to bool in sdma_v4_0.c
>   drm/amdgpu: remove unnecessary conversion to bool in gfx_v9_0.c
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c    |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  8 +++-----
>  drivers/gpu/drm/amd/amdgpu/athub_v1_0.c    |  4 ++--
>  drivers/gpu/drm/amd/amdgpu/athub_v2_0.c    |  4 ++--
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c     |  4 ++--
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c      |  4 ++--
>  drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c    |  4 ++--
>  drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c    |  4 ++--
>  drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c    |  4 ++--
>  drivers/gpu/drm/amd/amdgpu/navi10_ih.c     |  2 +-
>  drivers/gpu/drm/amd/amdgpu/nv.c            |  8 ++++----
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c     |  6 +++---
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c     |  4 ++--
>  drivers/gpu/drm/amd/amdgpu/soc15.c         | 28 ++++++++++++++--------------
>  drivers/gpu/drm/amd/amdgpu/vega10_ih.c     |  2 +-
>  15 files changed, 43 insertions(+), 45 deletions(-)
>
> --
> 2.7.4
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
