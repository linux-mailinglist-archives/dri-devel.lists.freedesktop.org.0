Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E1DA674CA
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 14:18:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 570C410E488;
	Tue, 18 Mar 2025 13:18:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VkBVl1x6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E24C610E09D;
 Tue, 18 Mar 2025 13:18:40 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-301a6347494so128515a91.3; 
 Tue, 18 Mar 2025 06:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742303920; x=1742908720; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=69ljFS1rk5l/n84/nsOjrOvJVy8Zq713HHIVitktCPE=;
 b=VkBVl1x663VT5BG5I+WMEylP1REwxqdu1YhQcNx/vDCal/z2v+/PL890Sun6x5RTEi
 PNLOl94HNNvM01gfrXKZC7Ue7ePX6OFVbJiT2Eog47vVw0AyN058K7wiGRqsHBUjEnWF
 VGHR9iaaK8RRdAerhzsdrHpz12EbbTnl1DnRZvoZ0JRU2UIU1ucy22Ar5wkXNW5p5Hux
 BCQe7l4qOpwlR33RF5ohntSxM6UCz/w8yoZ19VwwYXBvJZKoFJSJjxGzXL/ZZW3HkKmH
 tho5MQadulTo807aPuKHQKmnD2Vmzozp9uCblLqEMTJ8lZyq3NWO/FT4NNcbjQMceK5A
 rD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742303920; x=1742908720;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=69ljFS1rk5l/n84/nsOjrOvJVy8Zq713HHIVitktCPE=;
 b=oKE6X3nICU977l0G5aL6LztskgBw+dNhc7lmHfTKYeZi0JeJ1n0oSXp+4jRw3kuyfM
 +DV6McYNyo9myyRBumJe2LrPbmMpjWzmNUsL/g9mfCaoD3c+W0FbhfZ+dVY7MwH7l8zu
 8D/36zaP1J2RgUxBq8Yxrce/CUHtsWs2pL+fvoAG4KyEvbkPH4jxipIBAMTwJHMfSpsJ
 paCQlusMBIDvFMZf6jRdxOlsjnx+zB51dz5tal2nesJCEj69ED+/foprJ3z2g8v8uEM9
 nY9cjg0UStowgzvihkaB/8sha7KdgT63eGnub1NOX92LoTodD2LMih3fPV4S7VyZjIVo
 4lDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3t5m5S8T51cnr4YsT26jdYSOKXFfNGvUs1b+ASiBS/78VYNqWLmR/cI3BRUVQu+dg5LE3X2n6@lists.freedesktop.org,
 AJvYcCVP48GMEGawUK4DqyA3EOEUe1ES6hHjAps7ebU8vJhSivs0hNJdNsZmEiUwQuZPGnwJczaGGHQQwjQX@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAmivN35QM22g1sCF2ohr0aFDobYFHMPHQclmDMiTSOv3n67BD
 ISpm+lp9xwk9bkU1ibS3TtKEe8oUqD5f1dEpP3+Axlrq+885DK2W2bNK2oh4mPCrxP6ef1EH483
 mwTRuXXPSL4u57AHGMGi5iIVdPic=
X-Gm-Gg: ASbGncuSvvbP771SExPWcsbbVi5TbRUnuifQRNhx//DtT+d0kpyo1HLvfVhDLP7uCtf
 0lazJr1WDGEmxaiY354yEwAAohKWvZiIHB2gJv0u2xwwEYKjOczrqntWQvcEA/NLYK27cm6vjO8
 UsJKFZ3yrpa1hKU5Lf0Lob9jVZqw==
X-Google-Smtp-Source: AGHT+IEEe/F89Tj59dekHZVix785LRmaFuqwTiIW6CIe3px67aEzxBeoL9MiMt8LVYSdURPPL/N3zxHZHkQKIGd63F4=
X-Received: by 2002:a17:90b:3b52:b0:2fe:b45b:e7ec with SMTP id
 98e67ed59e1d1-30151db4d3emr7959340a91.8.1742303920446; Tue, 18 Mar 2025
 06:18:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250317105745891-NnPPMd8T0guyJikMgM6p@zte.com.cn>
In-Reply-To: <20250317105745891-NnPPMd8T0guyJikMgM6p@zte.com.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 18 Mar 2025 09:18:28 -0400
X-Gm-Features: AQ5f1Jp1fYgt08WGJFwuUkumJ3kySBxvtJOvetoAFqgET2sWxN2RMM0_b9DHL3E
Message-ID: <CADnq5_MyyomPwhQ6DW0GsfS8XNogLECM-h3-8AODYr1OTrm_ug@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon/uvd: Replace nested max() with single max3()
To: feng.wei8@zte.com.cn
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
 simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Tue, Mar 18, 2025 at 2:18=E2=80=AFAM <feng.wei8@zte.com.cn> wrote:
>
> From: FengWei <feng.wei8@zte.com.cn>
>
> Use max3() macro instead of nesting max() to simplify the return
> statement.
>
> Signed-off-by: FengWei <feng.wei8@zte.com.cn>
> ---
>  drivers/gpu/drm/radeon/radeon_uvd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c b/drivers/gpu/drm/radeon=
/radeon_uvd.c
> index 058a1c8451b2..ded5747a58d1 100644
> --- a/drivers/gpu/drm/radeon/radeon_uvd.c
> +++ b/drivers/gpu/drm/radeon/radeon_uvd.c
> @@ -961,7 +961,7 @@ int radeon_uvd_calc_upll_dividers(struct radeon_devic=
e *rdev,
>         unsigned optimal_score =3D ~0;
>
>         /* loop through vco from low to high */
> -       vco_min =3D max(max(vco_min, vclk), dclk);
> +       vco_min =3D max3(vco_min, vclk, dclk);
>         for (vco_freq =3D vco_min; vco_freq <=3D vco_max; vco_freq +=3D 1=
00) {
>
>                 uint64_t fb_div =3D (uint64_t)vco_freq * fb_factor;
> --
> 2.25.1
