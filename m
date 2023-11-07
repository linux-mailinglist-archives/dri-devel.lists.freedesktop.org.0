Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1D97E4811
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 19:18:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9973C10E654;
	Tue,  7 Nov 2023 18:18:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4C710E653;
 Tue,  7 Nov 2023 18:18:03 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id
 6a1803df08f44-66d00415a92so6529436d6.1; 
 Tue, 07 Nov 2023 10:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699381082; x=1699985882; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7WLCW16Xg7Xn8d3v2wxVZoyZyg6JSBPp7KLV1yqXGiU=;
 b=NtjUeLSGlWwYMm0Ed0Z3bifVVuV3y9JSYm+LFqvsEmqiMu4eCLmwPFCV0ZtDlorms4
 vR8MDDl+T6+hR4+jI1ONGOZfjRga54cyX1FUWAa69daDOult/LcFbSZZgIu+yojOuY5d
 7+dhVgJR5vo1zjo7TcVKPNjiTIaS/UuUlGRHv/+cYhUoQcmYRtBbsYiVaxkXvW+4rBgP
 ilBOghcrl1MyZbktSJAzLLEi3gbZAGtSPM9MHS8i14cZbRzvVSECaimMA9Fhs6jLn8J3
 E58LGN6DHk9o7QvYquHzvwGhyQ4EpHgUI0BPr/yM7qqUqCCpX5UKkSH4hujHOz/Jxbxg
 0s5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699381082; x=1699985882;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7WLCW16Xg7Xn8d3v2wxVZoyZyg6JSBPp7KLV1yqXGiU=;
 b=aaGYqTdW1/Xym8WL69tbxVnbgFKnZ3X865FOO8TS1qpRSz2hB2VtVCJqcmAdnBQ3z5
 LQsBv4nPZBDmAzKUy7V4aXLTWSpzK8w63yxEQuFiTcvPxfEsJEgtp5poUbyruVtxx9Qj
 q+cBVw1yBYJN1y6XMXwBmJifkX+lkrwvu9f1T5Ny2Y95zA4l94ya6pGv1Z9dv/SawhTN
 8/RZi4nJfXN8iQFhYSH5ReCioiO6XKQ4iDc/mslPgfieV2bx09w14sFTFDfe772VuRoL
 QIdr15pglqpOxesa9F4AsyPBnJPNHV+NDWKvoO/Vqa8khWjQ96y4p52RxwN8AQH+kq8P
 OGYw==
X-Gm-Message-State: AOJu0YyDiVHMz7xMWcbtOl6Yq0wi3U0K1xmboTZryauBInPLVlqqKtBg
 x9NbPhQPuIX/QbGFvWjrseWD7ydXRoPfC9K1yHk=
X-Google-Smtp-Source: AGHT+IFLNLe5eHq2T+bIJ7tp2J+DQcG/C7vgP1l+OnPU4g55+MbHChAdPmktd6VH2aKRRtaaWOolt5BtjOhwknFj/Lw=
X-Received: by 2002:a05:6214:5ce:b0:670:b357:82bd with SMTP id
 t14-20020a05621405ce00b00670b35782bdmr29829202qvz.6.1699381082278; Tue, 07
 Nov 2023 10:18:02 -0800 (PST)
MIME-Version: 1.0
References: <CABXGCsNsDLvZR8RGf9ji5938QreSix89FCpGHju+9in2x6OfDw@mail.gmail.com>
 <CADnq5_ObMvxN4pFAsWU7OM3SAtYCNHKE_fHsLqizGm0p1ubp=w@mail.gmail.com>
In-Reply-To: <CADnq5_ObMvxN4pFAsWU7OM3SAtYCNHKE_fHsLqizGm0p1ubp=w@mail.gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Tue, 7 Nov 2023 23:17:51 +0500
Message-ID: <CABXGCsPXp_pWZcyVQajYSTZKeViRqjfXK2=jmuRXh0yug_OoWQ@mail.gmail.com>
Subject: Re: 6.7/regression/KASAN: null-ptr-deref in
 amdgpu_ras_reset_error_count+0x2d6
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 6, 2023 at 8:29=E2=80=AFPM Alex Deucher <alexdeucher@gmail.com>=
 wrote:
>
> Already fixed in this commit:
> https://gitlab.freedesktop.org/agd5f/linux/-/commit/d1d4c0b7b65b7fab2bc6f=
97af9e823b1c42ccdb0
> Which is in included in last weeks PR.
>

Thanks, it fixed the issue above.
But, unfortunately this is not the only problem which I see on my laptop.
Now I am observing 100% GPU loading all the time.
And it looks as I show on this screenshot: https://postimg.cc/QHLQncMg

And another bisect round says that this commit is blame:
=E2=9D=AF git bisect good
de59b69932e64d77445d973a101d81d6e7e670c6 is the first bad commit
commit de59b69932e64d77445d973a101d81d6e7e670c6
Author: Alex Deucher <alexander.deucher@amd.com>
Date:   Wed Sep 20 13:27:58 2023 -0400

    drm/amdgpu/gmc: set a default disable value for AGP

    To disable AGP, the start needs to be set to a higher
    value than the end.  Set a default disable value for
    the AGP aperture and allow the IP specific GMC code
    to enable it selectively be calling amdgpu_gmc_agp_location().

    Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c           | 27 ++++++++++++++++---=
----
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h           |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c        |  3 +++
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c            |  3 ++-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c            |  3 ++-
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c             |  4 ++--
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c             |  4 ++--
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c             |  4 ++--
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c             |  3 ++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 +-
 10 files changed, 37 insertions(+), 18 deletions(-)

I checked twice and ensure that it not happens on commit
29495d81457a483c2859ccde59cc063034bfe47d

--=20
Best Regards,
Mike Gavrilov.
