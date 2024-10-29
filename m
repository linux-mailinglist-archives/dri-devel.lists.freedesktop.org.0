Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4AC9B4BE1
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 15:15:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB9010E674;
	Tue, 29 Oct 2024 14:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cQAD/8px";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF54C10E674;
 Tue, 29 Oct 2024 14:15:17 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-7202e1a0209so419180b3a.0; 
 Tue, 29 Oct 2024 07:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730211317; x=1730816117; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NdL/6Wwq2YpW7hbsrIeRhPDCaUR6Mp8BoblxniOFhuU=;
 b=cQAD/8px6BGhmQes1Tnuu90OoYaZ3sGmJXKXOpclUOgoJyWwZPNHwSgKnvk5YaGssP
 ei0wH+E/henfvxGaLh7Cj35AmOvMuO3j9OboNgrd4oK8X28x9iS2gyP4jZ8BvtHrXv+J
 8Bm6Dj6eJjFCS46bP+SuImtHiibKMGT+H1+ejE5wxil+0E1l4inWwIMkgLGOQkb38yZ5
 x9HKs+VMSZFh1EIujl/e9G6LP3gpwd0ySPD8vOlt2XYY3llnMu97c7EDFik2cXX2aKea
 YFg0p6+R9DEYeePv6v1izRa3B/53dgdVkAhJJkc8SPC67QErBi/4URVkonXscjXUhAEv
 FW6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730211317; x=1730816117;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NdL/6Wwq2YpW7hbsrIeRhPDCaUR6Mp8BoblxniOFhuU=;
 b=BXzjH1hxGTSudGJ3xrpvSTyLNvFkybtBj5/rz+c+DYSd5JWZyK3gocSkmRpGazGfei
 koe5UQPtFZ5tlJvABfk3e+8lSFfgNw1qmS6xFFqy1XSga2qRy+CxD7yb80heSUT5Le/E
 gmE62poj72AgDzwxoCmYT96/xPI7iRHIU82tdb2DxMkTL29MP7ecJ11Y0jxr4BHRz+A8
 ZdCEtCkFiSngZReOp/NFVh/v04QNFZs+wlwYDEx1TkN4ljg5z4p4PsEhTJ/HCvZjmKbA
 Jv/vMiyMwBFcK2aoAacvN9n2WSgu2njZRmLQpfSaw34wM85NO+vE+1H+sDuddvWv1XjZ
 qMnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/TYrFm0KouD0NLoWbBQqig8IMr76f2cOmQi8mQQtYZj78ai5EZxh0ynm3Kuyxi+tLsweE+0bZIPE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywxinnvf14EnwMmGVkDLyfAa6BdS2gwJ5b7LNKTDJxtsvse6G0p
 8kPNaxfdqFyFcZMzO0RImtFy/bYWz2d2GJVU2axwWUmfrHJM5MaPkkvcfzo7p+kUd6e/gPxEuMB
 RNoOOYALL/0cekFsBSKBjN33G5As=
X-Google-Smtp-Source: AGHT+IFzdFJaOn83o4sBTV1nq6LWM0MJiM8jeipFNOiCNquBEfssxrZm3m7uFcGUxPyBeY1B89EsW3Kqja/pZ4iXRz0=
X-Received: by 2002:a05:6a20:72a2:b0:1d8:f77c:c4f4 with SMTP id
 adf61e73a8af0-1d9a851450dmr8191571637.10.1730211316969; Tue, 29 Oct 2024
 07:15:16 -0700 (PDT)
MIME-Version: 1.0
References: <20241025060244.535406-1-Qiang.Yu@amd.com>
In-Reply-To: <20241025060244.535406-1-Qiang.Yu@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 29 Oct 2024 10:15:05 -0400
Message-ID: <CADnq5_MkQDNjFykm8zL3_yy5PBi6saoN+ianwNZxs_+0w9jiAg@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: add AMD_FMT_MOD_TILE_GFX9_4K_D_X
To: Qiang Yu <Qiang.Yu@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>, 
 Qiang Yu <yuq825@gmail.com>
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

On Fri, Oct 25, 2024 at 2:03=E2=80=AFAM Qiang Yu <Qiang.Yu@amd.com> wrote:
>
> From: Qiang Yu <qiang.yu@amd.com>
>
> This is used when radeonsi export small texture's modifier
> to user with eglExportDMABUFImageQueryMESA().
>
> mesa changes is available here:
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/31658
>
> Signed-off-by: Qiang Yu <qiang.yu@amd.com>

I assume you will push this directly to amd-staging-drm-next?

Alex

> ---
>  include/uapi/drm/drm_fourcc.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.=
h
> index 78abd819fd62..70f3b00b0681 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -1516,6 +1516,7 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 mod=
ifier)
>   * 64K_D_2D on GFX12 is identical to 64K_D on GFX11.
>   */
>  #define AMD_FMT_MOD_TILE_GFX9_64K_D 10
> +#define AMD_FMT_MOD_TILE_GFX9_4K_D_X 22
>  #define AMD_FMT_MOD_TILE_GFX9_64K_S_X 25
>  #define AMD_FMT_MOD_TILE_GFX9_64K_D_X 26
>  #define AMD_FMT_MOD_TILE_GFX9_64K_R_X 27
> --
> 2.43.0
>
