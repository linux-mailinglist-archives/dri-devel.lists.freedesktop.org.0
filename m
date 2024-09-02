Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC976968CED
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 19:43:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20F0F10E38A;
	Mon,  2 Sep 2024 17:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Nnd7yWC9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6794A10E388;
 Mon,  2 Sep 2024 17:43:20 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1fc47aef524so2560845ad.3; 
 Mon, 02 Sep 2024 10:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725299000; x=1725903800; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x1Y4xLoBMjp3sOTUCmMpURmHtSqY58C0Dbpo7vkEAHg=;
 b=Nnd7yWC9ABEmxxvfPgEXVPp/7GfNHtk8wt4JflvH2PDRm2mZqwlU1WKdWMD612Y13L
 JaAPO81cAlK0ypej19hkMr2oQUC4Uxv/ABHgFXfpQM9pnHfGWY65N0UkCIKyloL4tKX9
 /hHcZZ6kX+puM5xAiH2sA21l75YBEqFH2iinB1+Dp9wLTfD5Dyf/kA2LLLdoWT+4q1Hd
 PbglBY5v5SeyqFeDxbIEYGA36za4Ia9K47iFSkcSRxfxTHyrWzklkxYmrpUTmmaPDa11
 Kl2WdpHwL6B2J+KnmuWCIlK4tS/UI1DLjKFxLG1SFOjSbeWQYHbZNkgs65pTBIOSrz+F
 hpSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725299000; x=1725903800;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x1Y4xLoBMjp3sOTUCmMpURmHtSqY58C0Dbpo7vkEAHg=;
 b=s13+pEfoLsZnxN3w8FWZ2NIMsw682GiFWxUfFN1ypoHKVJzmpMQTEL905D8ayPVOZf
 nSChXrcu20uRX65o8TYXHOg3WurzqRIGOMfpTmCfD7plH0kpNw58f/yTSCw1gefn4WMQ
 ymwyKdGKr7X/D2VwcCT2eKkO7oyfeQeU9K+oXc3/yXywyUvPPHwKNWA+weeA+blNy4xR
 cSWavS92NjfgJT/H5MZT8YKfuUMCLdR4hFNMDfHvZkzhuqPhhaA93ssz1xdjSw66L2br
 6ZfFhZLyT07yqaj6UKPbjHpBAddhAmoyXyIJi41U3H7i8Gvfbmryxw59LXX05ijZkWhl
 5q3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUS6/i5vfXcP0ksGjgWApQMh+AOaumIIghmk0P8B314aE+1cpURw1L/mLznR2rGPj3TBl+ObDW4fq4V@lists.freedesktop.org,
 AJvYcCXdyKEtzannU6EoWD0Ae6EsY4Hnqj5u0d25tJxqh03rfvSBsmYxQ6SqvJ522rPYMaCbWAx8siAm@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpDghdNNeumHLwugvHQB2s8c4pBmuK8/23T2O71xGs5uCnMbrf
 vc208ng4hYB6i9nzLjYuStOhI0UeB40sMzvk3+B6gwkxJ8Ayf4TCBjo6qrfQIDRoKHK6fSHgQmF
 t+9535s5a7o4QFPZO0P1VTxKMcpQ=
X-Google-Smtp-Source: AGHT+IEfFDhE0Cdt/LAKBpKKXNaAe3MnoIOSWwH2RMO0h9YyJyv6leTurOP8FeU0UlwFR/9vrWhOfz1BCfbBHfgMVFY=
X-Received: by 2002:a17:903:1103:b0:202:18d7:7ffb with SMTP id
 d9443c01a7336-20528847f02mr66200305ad.11.1725298999623; Mon, 02 Sep 2024
 10:43:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240830072554.128132-1-yaolu@kylinos.cn>
In-Reply-To: <20240830072554.128132-1-yaolu@kylinos.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 2 Sep 2024 13:43:08 -0400
Message-ID: <CADnq5_NhytCVtif=3OLvBkJqq1zTtm_Hkmrt1m4fREC9CSbf+w@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: add raven1 gfxoff quirk
To: Lu Yao <yaolu@kylinos.cn>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 sunil.khatri@amd.com, Prike.Liang@amd.com, Felix.Kuehling@amd.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, liupeng01@kylinos.cn
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

On Fri, Aug 30, 2024 at 3:26=E2=80=AFAM Lu Yao <yaolu@kylinos.cn> wrote:
>
> From: Peng Liu <liupeng01@kylinos.cn>
>
> Fix screen corruption with openkylin.
>
> Link: https://bbs.openkylin.top/t/topic/171497
> Signed-off-by: Peng Liu <liupeng01@kylinos.cn>
> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/=
amdgpu/gfx_v9_0.c
> index 2929c8972ea7..0cd5fd3fa18b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> @@ -1301,6 +1301,8 @@ static const struct amdgpu_gfxoff_quirk amdgpu_gfxo=
ff_quirk_list[] =3D {
>         { 0x1002, 0x15dd, 0x1002, 0x15dd, 0xc6 },
>         /* Apple MacBook Pro (15-inch, 2019) Radeon Pro Vega 20 4 GB */
>         { 0x1002, 0x69af, 0x106b, 0x019a, 0xc0 },
> +       /* https://bbs.openkylin.top/t/topic/171497 */
> +       { 0x1002, 0x15d8, 0x19e5, 0x3e14, 0xc2},
>         { 0, 0, 0, 0, 0 },
>  };
>
> --
> 2.25.1
>
