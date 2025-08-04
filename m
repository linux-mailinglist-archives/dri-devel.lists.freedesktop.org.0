Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC82B1A587
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 17:09:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9803389A88;
	Mon,  4 Aug 2025 15:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RVNl8Vra";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9283110E213;
 Mon,  4 Aug 2025 15:09:09 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-31f3f978cd1so750591a91.2; 
 Mon, 04 Aug 2025 08:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754320149; x=1754924949; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0pWmlnlbINt5DgzqX/LhMW6Smiak/fMhtF3KImHodSQ=;
 b=RVNl8VrattZTLSWOUGE5fLpB4hxke4Ty4PdC4JsTnKghG5rluSq3KAikptrI1Y8GgH
 /dCUr7MeZvyFfKR0MpLrmfry/uabw2mVHmfQT+K52SqmLp5d4TcMVCi1uXr4Ttyd5vU/
 8h1zEGijeoZOgXkh+xaDNJ2GJoPNC9tjArr+PiSEGkJOgBrgLzaqMLAooJjQuKCbow/i
 dO9ZQkB5pqK2Yr1ire+a5Apmt6QW9yXKvpmMN09bVd/XcGLq6Hva4o5Mzdq1DuCcW4mK
 l+97u/AmXtpGGtfz1iIXqMgvHMezIdsx5T8NKczNtiOmGKQwge1vMo72TWomc9xXblXO
 lcoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754320149; x=1754924949;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0pWmlnlbINt5DgzqX/LhMW6Smiak/fMhtF3KImHodSQ=;
 b=j6IFuC/rMT+6S747rx9oC0noihb6gZjSYVQCsQsDZHnx+B1UVl64ljVkAgLSeNfV1D
 HTU0cKmP2bfDqnlB5WEqQVXaUJVfsPXkG3+sJ1DPic1gnYa5/nbiWJfQuobJcfmeFc91
 qbbgC5cqwAMTklumWnXZ22xzQkafSkEvImEFbPqJJj1tNpPb1zhvf6hE6ey0DhM8YrFT
 TfpYsTD/OST6OccZ+TRWZTiW39VfF87oKgNVIhh/NbcCPjNxNxvgnB4PA864XUmkIfsu
 dI56k+9puPZ+EqZce2AKCOij2YsUGJ4ojk4lfGF2564PENtbCaFbmVVrZQ099OjKMi8g
 qITA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWadcynmB43irvesu/+Sq/yc/Ww4Tuyj2YPHC0NsgZ3mJ8SL2ZiawmPz+fAiDcLLBZVApmdzwuR3KeK@lists.freedesktop.org,
 AJvYcCXQXLYLKHvAG735QsnR0Q065SFwkkV2UTAMBDuG9u9zyihaJ4ljMUO3TVDJcST5s3ByByce1XDX@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyoRuGnanH3ztWhrTq9yRvU3qlpGrysum/UP5x913BlwRhWlN3j
 ZQ5PP/mV0iKnP72SSud4UBR+WSw+0v7g4EHGidpTILipbv/p3gbY/AZuiZ00kS6QGLMYxd2Qg7g
 VtX5pcM4mwFy8R9Ee44a7aJheLcoxlO0=
X-Gm-Gg: ASbGncte3Z0W5/gw+bEUR/Khk2XghLyRCwkRCV/pgcO+lrTb3wjslGfoKJgHH6IFPU/
 mk+XJI8UJrPKiNuFBwrl6sCcwrcuAmB0Kfn7k/1apX9e+ZIa4lt3GDEJ7Q7uA+l4Q9ukKtzA+yo
 TmU8soA3MAM2jjkPqST5xkhxR9xw9QlC+srRHg2M5bZLW06BK/tVSdFeywpzFPGnL4plZWLpPxa
 dw4dhq6WiNPlZsVsLQ=
X-Google-Smtp-Source: AGHT+IHMFTyHef6/XrO0koXR/RYvYL+mNs96k9z60jF3FuBiwe69QFy4KV4xUVhlsAx611Q1Vntkh6D2HZ+92HzrCTY=
X-Received: by 2002:a17:90b:1d05:b0:31f:3d6:6d98 with SMTP id
 98e67ed59e1d1-321162cd943mr6369334a91.5.1754320148948; Mon, 04 Aug 2025
 08:09:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250801-amdgfx10-v1-1-e1dcbe18d84e@ethancedwards.com>
 <CADnq5_N+bQppUAD-qR8QC8M6nW+oRF8+7z=Qakcxc=a6Z8q4Gg@mail.gmail.com>
 <c82931b5-0de2-4e45-a80b-3a90b0cc98a2@suswa.mountain>
In-Reply-To: <c82931b5-0de2-4e45-a80b-3a90b0cc98a2@suswa.mountain>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 4 Aug 2025 11:08:57 -0400
X-Gm-Features: Ac12FXzrs51YUGCsmGY-ztatDva8cn8ius8nZTcTZJWx1B0F2phV965iupSHQcc
Message-ID: <CADnq5_Mk3FO_tvxFo+fJgqskVc7qtGv74VM6EStx_BcVpahXEQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/gfx10: remove redundant repeated null checks
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Ethan Carter Edwards <ethan@ethancedwards.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
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

On Mon, Aug 4, 2025 at 10:49=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Mon, Aug 04, 2025 at 10:32:43AM -0400, Alex Deucher wrote:
> > On Sat, Aug 2, 2025 at 4:22=E2=80=AFAM Ethan Carter Edwards
> > <ethan@ethancedwards.com> wrote:
> > >
> > > The repeated checks on grbm_soft_reset are unnecessary. Remove them.
> > >
> >
> > These are not NULL checks and they are necessary.  The code is
> > checking if any bits are set in that register.  If not, then we can
> > skip that code as there is nothing to do.
> >
>
> It's not a null check, but it is a nested check and it's a local
> variable so the patch is correct enough.  At this point we know that
> grbm_soft_reset can't be zero.

It can be 0 as far as I can see.  If none of the GRBM_STATUS bits are
set, then we never set any of the bits in grbm_soft_reset.

Alex

>
> regards,
> dan carpenter
>
