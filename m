Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9840C521D96
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 17:08:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8848110FA13;
	Tue, 10 May 2022 15:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5AC010F9E6;
 Tue, 10 May 2022 15:08:05 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id v66so18836887oib.3;
 Tue, 10 May 2022 08:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y2/STjlRrDx6ZScgZXIJmZa3dRcDQ11ZaAGksLa3mPQ=;
 b=IUegFjkyZmrqC+uMH6wA/TeUemYW3STdmoenh8VxExEB4eSUV8d6QplgnV0iv1xOfD
 INjw4LkVwqX2jl1yQ3EwtopiM616cf5oT4KzU3FdKtjmVqKmFr9HBnMIs7ByALcqkiSP
 X7d2+hOB8MNFt9SYblvt86LpS3uvk0s9uXavCcDGwS/6jn+o4RK8UNmHD9blWJaRG5L3
 rUJvl/w8R2/a1zjpGCc2alz6CzJWUGTpFictIBxcG6t1CWkMGD7rqUmglOFQAHcJIoN4
 n8odWJNASIdlP9E7vgqaIniXf9U8fGVU+zmabU00Kzrsb2Onck1qko9R+fThVHJQ4aW1
 QZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y2/STjlRrDx6ZScgZXIJmZa3dRcDQ11ZaAGksLa3mPQ=;
 b=NoPxbgoiAwa5PGKcY2cXtKHGgrkVx8ATfvK7oqG6IPqN68yVIXXOO1HyXlqPvlRiSk
 ZxWx6vEc/zoWZj2C+hOmmzEEdyJlf6IQeL1NPkCv4zhu+2d5LdrlL/8mXEzFGZn8TcWi
 +QObscBf0DMsgQoaZtlV/g70YLDFJpP9sU3KOXN51wEbH0vrX8XWXDik/MrDaUVPtH3T
 wPoRCY5gPGdc4Sany0ZABNDDUcuiPGKOFvJDqPt2b5ExITf0UjhG/rnq37qoaiKi++qi
 ut0GRHgVbw5JREcKl7AXgPULBGu3QHtv2JLSHvsN0aAcTziVvYqizrOBWdN0NNBUjpvh
 OUfA==
X-Gm-Message-State: AOAM5330NeoKRYWYU7hFDdj1PbG4GEsry7lsFRDDCXI91HAbcRVGibrg
 5mRmOfonv1IPaNd+9UCxJaoc/1j8wBQUDNEQFrk=
X-Google-Smtp-Source: ABdhPJxqYTUEoTP8UYYX3AkXD2AObwUepN/l2kVNI8OjNMUaCU1Hn1i+m7jFa6TsDrvmS7EEQ5v3mCvlU4hM+/f0v2k=
X-Received: by 2002:a05:6808:178d:b0:326:3fe9:7f03 with SMTP id
 bg13-20020a056808178d00b003263fe97f03mr260657oib.200.1652195285004; Tue, 10
 May 2022 08:08:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220510025004.2561532-1-wanjiabing@vivo.com>
In-Reply-To: <20220510025004.2561532-1-wanjiabing@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 10 May 2022 11:07:53 -0400
Message-ID: <CADnq5_OiFNWgwgqP12cniuFVNNRWVrfGKgBNOPAjBSu5cLsMHw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Remove duplicated argument in vcn_v4_0
To: Wan Jiabing <wanjiabing@vivo.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, James Zhu <James.Zhu@amd.com>,
 Leo Liu <leo.liu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, May 9, 2022 at 10:50 PM Wan Jiabing <wanjiabing@vivo.com> wrote:
>
> Fix following coccicheck warning:
> ./drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:724:4-36: duplicated argument to & or |
>
> Remove duplicated UVD_SUVD_CGC_GATE__SRE_H264_MASK.
>
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> ---
>  drivers/Gap/drm/amd/amdgpu/vcn_v4_0.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> index c37dbac9d96b..9119e966ffff 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> @@ -722,7 +722,6 @@ static void vcn_v4_0_disable_clock_gating(struct amdgpu_device *adev, int inst)
>                 | UVD_SUVD_CGC_GATE__SCM_MASK
>                 | UVD_SUVD_CGC_GATE__SDB_MASK
>                 | UVD_SUVD_CGC_GATE__SRE_H264_MASK
> -               | UVD_SUVD_CGC_GATE__SRE_H264_MASK
>                 | UVD_SUVD_CGC_GATE__SRE_HEVC_MASK
>                 | UVD_SUVD_CGC_GATE__SIT_H264_MASK
>                 | UVD_SUVD_CGC_GATE__SIT_HEVC_MASK
> --
> 2.36.0
>
