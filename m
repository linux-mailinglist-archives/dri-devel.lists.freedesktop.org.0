Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A89B38A9D
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 22:03:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C1110E898;
	Wed, 27 Aug 2025 20:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KL9M9AB9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E295110E897;
 Wed, 27 Aug 2025 20:02:56 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-32578dec17aso2965a91.1; 
 Wed, 27 Aug 2025 13:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756324976; x=1756929776; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=03D+2LYm7zurX8AnYGu/wk2IacpBPh1XUHSL4lr1KJE=;
 b=KL9M9AB98VhydnFedc7FzKXNoXCZjm6w0IxRAtPVSUM7lQ+baKex4YF8F1dNt2q81k
 B2BPW6yhyGsHJetJ3zT4tgLYF05z9WR9D4iUFMqfe9Kez7HLpCdfAxhvm6YozqNrxEEG
 2kkFTnh2J3j4eqRQhBLY4QbKFchBRIprvgKr8G9v8KvCThumZ8EjGAwGYmIb4IbqLLhG
 NZPeiUSBIgSa5eh5nZj45Iifces1SWdE2+kug/1U6tOY3mT1aRjQVIpyhDe4pJmwb5vD
 PZiY9Ns+1yGVBAQwtYgPefDqhPZf55itHY5Yfz4Ib9z0aj5llm4Rva0qbZyDn4wDQeUw
 mq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756324976; x=1756929776;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=03D+2LYm7zurX8AnYGu/wk2IacpBPh1XUHSL4lr1KJE=;
 b=kIOn/Qe9PieRPT+ZvMBN9J/cQ5QpWh47u6hNAMPBjrhmYFWpcCdrvOinDWg9GYFbiV
 0qH010kfH97wC9ySrhOKpV1oGLLWT7nzh+bIWnwZkRwMJDDXKmA2Xdies29x/vVXAavx
 ZPI1DW33dx7gcT7SlUIxidxTDhEA+j07lQCGWg1prRkcWjYIi29GZY4a7O4MnBYEwHZR
 o3RF19o/Ca/c5z/IumV9MK+GYUB4S9wLVxXS//K53D5MXtR2fpgUPBPqHcGWv6Lc/kWS
 N4V7upCVFQ92fZR10e99kKBMOgSnPe214CU9uOQeNQm+cA/0lC4M6bMIqAc3rCozVE6z
 fEWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVm0YZ9UVksEPEjaLDMnNXCkZWHJPybhsczJiUUPVto/WjQWeYCuCju8rikYC6WDe9SeAWfksvaYs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpRWc7lSw6sKVBLBOZPP/XkVps0Qpkv+uZEreMz0yokIiBqfjJ
 JMkF08nO+HYLRqS+pEb8AJCSX06+63fXk0bf39qlI/DZB88qe0Tgwc9klAfSh15QhSgL3Ae4Uk7
 NkqcK82MwlPAEiSSYn8jGtNABQfuUZBE=
X-Gm-Gg: ASbGncvwwt4GM7/9rP2JYib5G/gB1I7TgsDdRZgXiVNMafnL1z8TTInSB5mLEU5xFno
 WF0Tr65d201T3UCoN3o6ZtneYbAj9CgELi72oH5L6VlrDgJbb7ftWz4cwa8I7u/4qa/zzPXE2DP
 Nsgi46rYPLiNJuAe31uhHf4oUYnB1sP9+d3iBRQzLfYoVzidaL7aWKH4r4qGIIsCwotssX990Iw
 9Fc9gA=
X-Google-Smtp-Source: AGHT+IEYFxWIgkdasxQf+IqktH7EkiNxyQfhIsOS91kQxAAB+MMtmKC9Wu0UsNftG/lyhfkhu87LrER8trGcFO7AX10=
X-Received: by 2002:a17:90b:1d09:b0:325:33ac:bbef with SMTP id
 98e67ed59e1d1-32533acd3b4mr12840525a91.6.1756324976307; Wed, 27 Aug 2025
 13:02:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250823202540.487616-1-kavitheshnitt@gmail.com>
In-Reply-To: <20250823202540.487616-1-kavitheshnitt@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 27 Aug 2025 16:02:43 -0400
X-Gm-Features: Ac12FXy8O47figQjWLIUNnDA1-9CpOu-ir6quXNMsaj0Pv3UTLbQ2ytf5uUvHIU
Message-ID: <CADnq5_Onr6rR12NVagwMHURPfuQxBoVq8Qhui6heH_m-5eHsXA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Document num_rmcm_3dluts in
 mpc_color_caps
To: "Kavithesh A.S" <kavitheshnitt@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
 harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
 simona@ffwll.ch
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

On Sat, Aug 23, 2025 at 4:25=E2=80=AFPM Kavithesh A.S <kavitheshnitt@gmail.=
com> wrote:
>
> Fix a kernel-doc warning by documenting the num_rmcm_3dluts member of str=
uct mpc_color_caps.
>
> This is my first patch submission to the kernel, feedback is welcome
>
> Signed-off-by: Kavithesh A.S <kavitheshnitt@gmail.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dc.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/di=
splay/dc/dc.h
> index 59c077561..06f05979b 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc.h
> @@ -234,6 +234,7 @@ struct lut3d_caps {
>   * @ogam_ram: programmable out gamma LUT
>   * @ocsc: output color space conversion matrix
>   * @num_3dluts: MPC 3D LUT; always assumes a preceding shaper LUT
> + * @num_rmcm_3dluts: number of RMCM 3D LUTS supported
>   * @shared_3d_lut: shared 3D LUT flag. Can be either DPP or MPC, but sin=
gle
>   * instance
>   * @ogam_rom_caps: pre-definied curve caps for regamma 1D LUT
> --
> 2.43.0
