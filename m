Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B28B423D9
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 16:36:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77DC810E8BA;
	Wed,  3 Sep 2025 14:36:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QJgYsRw3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 221CF10E8AC;
 Wed,  3 Sep 2025 14:36:32 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id
 a1e0cc1a2514c-89a5569a2e6so52910241.1; 
 Wed, 03 Sep 2025 07:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756910191; x=1757514991; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FGhbnwELL3vl/Uf5HYqR42UqYFtH5W8LwSd+Jp8CvRE=;
 b=QJgYsRw3atr2b7sfMF3SqYmBAkN4hL7UiawHigrZ4b1iB7Qt6YXQBFjbmX4ZNELPg8
 7sfaYoum7xKvU+WmrFcpL0YbiTMeScEj98q3hNzPcGUgaOXfmVgbC1LfcvUAnoSvrQnf
 F0wTqGMFVxpSHMbZFHtwNUPHipkOWeWs0cxMkLkvciHrU7hzkRps3NtAfSR25RvcQ/sB
 QcQ0ByrrhndPqeJkt2eJIsxWl1GWhfzcBo56YfNUhFnMS8Rwkn+YwCvjKQvEIl0DH+EW
 SYm5vHYHvhegCzRTTMiQowyzBRDpB37sHMtc0i4JEoSo68oFDLnf1g83S3HSkA98B/t5
 gFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756910191; x=1757514991;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FGhbnwELL3vl/Uf5HYqR42UqYFtH5W8LwSd+Jp8CvRE=;
 b=no/SHBhxs4pUZum2Lj8gS1p1VpmojQbyr1wYntL5Nl7n2ifKfVcpS5lZWDY6uDOyWJ
 b/eLEEWpxy+QmbRnQRGFboStXmCoJxOd1TwPBTDZqvKrIWQxxQ3PsYdSjPz8TWplaZ+y
 ZMmzl8nhQ1aOgCMvDlEVOiZS+Qf2KNBiZkHE4jiY7e9HZ8OSBOz9ZahlgViPrt4gwkM+
 XmpGLDu+7yk+pNeNOzCYoPjNDhyh1e3N8lmp2aA7DZp22PT2JqqGHH8V+kE9iu53HqzH
 ZGFM6a2Rmq9qTNtDrk9g+PBLWOdsucCZ7XP+Y3FCZVh1Js1dQzfbcwaZV0x7qjihYpJN
 hcZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGrieUYIBHDZPmIKRLGbITwjE6wWu4ovC/c7dwGavGDm+/YAFX9zCrC5owcAhhkEcKiUiLbCdO@lists.freedesktop.org,
 AJvYcCWaPv55mLmFdUXJAyKHT1xMAnRU8jEuDWpyhYO6p6pGOmYG8JoV3HApL4Zm/r7zziMeG2Rnb8Cg7z50@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy491JJSZHUviEs0uA7gP+FTTfhSSdu0qhD6Lol47g1K5H3boeq
 MN8quDHzuSC+FEC40S1dA84APz6O9mPE95/nvGzXPksmvtqgQq2q6yK5lUVfun1RrH1w+H4HM3G
 uzEXqF2yXFP/4k1ia/F1iRQO3r1oaoA4=
X-Gm-Gg: ASbGncuIecxVXBKDLyoa7ba8wOlRpAkCAcrvuPuvVNFDxUEXvlTCMbcJW5LVYlhX4/A
 Qnm1v7gGIypOzcxAX3tsdssVDBRt97XfER/mfWkm+Kzhx9BhQOGMssxikFPdbpheEgV8p70LWe3
 Glbm5sXY/gC41klhODe6yzaD+tjktrd2lUnKqsaed1xPr8GqVkF/ulyrlH7taltvM2tBk4OQwOU
 SJtYCMqA6MO1eReZg==
X-Google-Smtp-Source: AGHT+IFm0adrFc4rU/J1ttwYt8qUw0pznrd9QgrBFZcQxvvYFdDsElBGg8DoJjvV4xeSkpgmazSYtnBSFjfUCig0xYs=
X-Received: by 2002:a05:6102:4194:b0:4df:8f09:7d7e with SMTP id
 ada2fe7eead31-52a2e48a219mr2420311137.0.1756910190941; Wed, 03 Sep 2025
 07:36:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250903120449.380087-1-liaoyuanhong@vivo.com>
 <3dd20bc8-f258-40f8-9b91-ba3d77ce6bc8@amd.com>
In-Reply-To: <3dd20bc8-f258-40f8-9b91-ba3d77ce6bc8@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 3 Sep 2025 10:36:18 -0400
X-Gm-Features: Ac12FXz-v0z9Z6me-xY47XILS7Anzn-kObWdZ29MSDWAJozyzgsM0dTrU2x0ST0
Message-ID: <CADnq5_OipdyBfAufzEghZ2xTxuBTB35Ag47sih95qs=vD5EJ3g@mail.gmail.com>
Subject: Re: [PATCH 0/6] drm/amdgpu: Remove redundant ternary operators
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tao Zhou <tao.zhou1@amd.com>, 
 Xiang Liu <xiang.liu@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>, 
 Yang Wang <kevinyang.wang@amd.com>, Victor Skvortsov <victor.skvortsov@amd.com>,
 Colin Ian King <colin.i.king@gmail.com>, Sunil Khatri <sunil.khatri@amd.com>, 
 Lijo Lazar <lijo.lazar@amd.com>, Shashank Sharma <shashank.sharma@amd.com>, 
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Prike Liang <Prike.Liang@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, "Jesse.Zhang" <Jesse.Zhang@amd.com>, 
 Felix Kuehling <felix.kuehling@amd.com>, Boyuan Zhang <boyuan.zhang@amd.com>, 
 Kent Russell <kent.russell@amd.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
 Tim Huang <tim.huang@amd.com>, Yifan Zhang <yifan1.zhang@amd.com>, 
 Natalie Vock <natalie.vock@gmx.de>, Candice Li <candice.li@amd.com>, 
 Shaoyun Liu <shaoyun.liu@amd.com>, David Belanger <david.belanger@amd.com>, 
 Emily Deng <Emily.Deng@amd.com>,
 Sathishkumar S <sathishkumar.sundararaju@amd.com>, 
 "David (Ming Qiang) Wu" <David.Wu3@amd.com>, Leo Liu <leo.liu@amd.com>, 
 "Stanley.Yang" <Stanley.Yang@amd.com>, Mangesh Gadre <Mangesh.Gadre@amd.com>, 
 fanhuang <FangSheng.Huang@amd.com>,
 Saleemkhan Jamadar <saleemkhan.jamadar@amd.com>, 
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
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

On Wed, Sep 3, 2025 at 8:49=E2=80=AFAM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com> for the enti=
re series.
>
> On 03.09.25 14:03, Liao Yuanhong wrote:
> > For ternary operators in the form of "a ? true : false" or
> > "a ? false : true", if 'a' itself returns a boolean result, the ternary
> > operator can be omitted. Remove redundant ternary operators to clean up=
 the
> > code.
> >
> > Liao Yuanhong (6):
> >   drm/amdgpu/amdgpu_cper: Remove redundant ternary operators
> >   drm/amdgpu/gfx: Remove redundant ternary operators
> >   drm/amdgpu/gmc: Remove redundant ternary operators
> >   drm/amdgpu/ih: Remove redundant ternary operators
> >   drm/amdgpu/jpeg: Remove redundant ternary operators
> >   drm/amdgpu/vcn: Remove redundant ternary operators
> >
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_cper.c | 2 +-
> >  drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c   | 3 +--
> >  drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c   | 3 +--
> >  drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c   | 3 +--
> >  drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c   | 3 +--
> >  drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c   | 3 +--
> >  drivers/gpu/drm/amd/amdgpu/ih_v6_0.c     | 3 +--
> >  drivers/gpu/drm/amd/amdgpu/ih_v6_1.c     | 3 +--
> >  drivers/gpu/drm/amd/amdgpu/ih_v7_0.c     | 3 +--
> >  drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c | 2 +-
> >  drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c | 2 +-
> >  drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c | 2 +-
> >  drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c  | 2 +-
> >  drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c  | 2 +-
> >  14 files changed, 14 insertions(+), 22 deletions(-)
> >
>
