Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A78441F130
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 17:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D876EE20;
	Fri,  1 Oct 2021 15:26:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2ECD6EE17;
 Fri,  1 Oct 2021 15:26:54 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 g62-20020a9d2dc4000000b0054752cfbc59so11970277otb.1; 
 Fri, 01 Oct 2021 08:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ikLIfxYdFe+715vkjTYz2QcZQLPsMyfcRuwJRI4JmM4=;
 b=aZ/I4ufvq/NcoW7ML0ypAcwIA1MGyGR0HEqX5iuKNwExlTwu2IdQCNEkeR+zDkSOQz
 BAc+EEnp7lAlKvHdtFQCj/mLjXeGrYwA4ndXkbPsLUqUY410G/t45C3sR7pIGtIkMsQs
 Ma5bgpnAhxOOeMyYg5vftvNNDucX4xwgZBPa+kXETSTpSIisgzdGN9H2iTNJcIJvJ+Kj
 FicGrs2uIxcQzo2iovBMYf/oj78u/OcstbeaKMrkcAADkMF36PUFiHlI90AxFnS8TKMQ
 HGcrDjJnSGGtKZSWGc6sv654TEvAiyhcv+/8cA/JRCOJ5hce5nryAKhtgtg4ehHya/h4
 4nLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ikLIfxYdFe+715vkjTYz2QcZQLPsMyfcRuwJRI4JmM4=;
 b=dsJHaXddORp9YwVl83z7M+RuskdCzbWF18+B7OQMwKMQ1JZzMXrm/NEy9NQebzjs5z
 usQy5/L3G67oT+VCBCtI9/AfJZsrph4loFOBdadEBSIP1NgiHY7b8iATMAQRs6W4Y+1F
 pDle3KsHwjQXFknSZD9+7WxPQhtHWV0fjezZ1szxUfbAG1L2mpSCRegXq2xT64wouBJ8
 PdRp8xqjcYoOedx5+0d12OFx/rgoAcvi8E5em7B/C3p+Yq66lQFxY/su070ZQ7IdK50A
 ERUIfNxFntc/R+RR67pGjo7XqXO9RYlGZqVBivR2f86CcGEzMv4NKk3ohlg96jeDFkde
 ZAlQ==
X-Gm-Message-State: AOAM53315KGhQWAxK22qpGpVFUNiUBRfPvPZHqnPMZ3OCDu5TKAQfkeC
 qdpJlR4oWln+2ivufL2WNbaAyhGUbdd1ZJAVWxRy6wNi
X-Google-Smtp-Source: ABdhPJxcNNo5JhH3EXbxL8nFCg9PFIAUpeD8fKVx+GFOx30gzwQaBibHmrxqi/VpT6SjMbNmJIvI3Q6p8469AxlsPnY=
X-Received: by 2002:a05:6830:214c:: with SMTP id
 r12mr10800848otd.200.1633102013972; 
 Fri, 01 Oct 2021 08:26:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211001101348.1279-1-guozhengkui@vivo.com>
 <50430f11-5e95-18f4-7620-2233ef573853@amd.com>
In-Reply-To: <50430f11-5e95-18f4-7620-2233ef573853@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 1 Oct 2021 11:26:42 -0400
Message-ID: <CADnq5_PT+e8j=YEyAjzMQxF5wVzc+cCDbQ6j6FrdWdDWajco=Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: remove some repeated includings
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Guo Zhengkui <guozhengkui@vivo.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Guchun Chen <guchun.chen@amd.com>, Peng Ju Zhou <PengJu.Zhou@amd.com>, 
 Bokun Zhang <Bokun.Zhang@amd.com>, Likun GAO <Likun.Gao@amd.com>, 
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, kernel@vivo.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Oct 1, 2021 at 6:16 AM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
> Am 01.10.21 um 12:13 schrieb Guo Zhengkui:
> > Remove two repeated includings in line 46 and 47.
> >
> > Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>
>
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 2 --
> >   1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gp=
u/drm/amd/amdgpu/amdgpu_discovery.c
> > index 291a47f7992a..daa798c5b882 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> > @@ -30,34 +30,32 @@
> >
> >   #include "soc15.h"
> >   #include "gfx_v9_0.h"
> >   #include "gmc_v9_0.h"
> >   #include "df_v1_7.h"
> >   #include "df_v3_6.h"
> >   #include "nbio_v6_1.h"
> >   #include "nbio_v7_0.h"
> >   #include "nbio_v7_4.h"
> >   #include "hdp_v4_0.h"
> >   #include "vega10_ih.h"
> >   #include "vega20_ih.h"
> >   #include "sdma_v4_0.h"
> >   #include "uvd_v7_0.h"
> >   #include "vce_v4_0.h"
> >   #include "vcn_v1_0.h"
> > -#include "vcn_v2_0.h"
> > -#include "jpeg_v2_0.h"
> >   #include "vcn_v2_5.h"
> >   #include "jpeg_v2_5.h"
> >   #include "smuio_v9_0.h"
> >   #include "gmc_v10_0.h"
> >   #include "gfxhub_v2_0.h"
> >   #include "mmhub_v2_0.h"
> >   #include "nbio_v2_3.h"
> >   #include "nbio_v7_2.h"
> >   #include "hdp_v5_0.h"
> >   #include "nv.h"
> >   #include "navi10_ih.h"
> >   #include "gfx_v10_0.h"
> >   #include "sdma_v5_0.h"
> >   #include "sdma_v5_2.h"
> >   #include "vcn_v2_0.h"
> >   #include "jpeg_v2_0.h"
>
