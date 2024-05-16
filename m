Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 278588C789B
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 16:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 001B510E166;
	Thu, 16 May 2024 14:48:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F7bL7J0p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C617C10E15D;
 Thu, 16 May 2024 14:48:24 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2b3c711dfd3so241873a91.2; 
 Thu, 16 May 2024 07:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715870904; x=1716475704; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BhAIBDZu/rZJp0WFWbpKewussVqiv729DUhCPvOQ+Vg=;
 b=F7bL7J0p0Za0Jf5ONVtJ0BlVfX5NWGgVEsPSkZA3kqJo+BG2JbxCadUYUZ+g9PRDdn
 FwujRvevCLq+k957tqTes63kOgFE8XgnO3p35xUdCeoN6O4A2tTMqPl0Z34QmAgR68sz
 Dwe9WKmhY+cIsBTEqrDM7kIcWYIo0NCqZic1Jw3hZ8wgYS5yFHiHZfRPKE4eGcVdKudG
 4LhHDn/zH3QO6X798QHMXPgLt2n46jgy3iN9wFE+WVuAHRcg75GoPI8dHnP4EyPPoJl+
 um5y4ycaTeRWWWB4niYcS3Lyjm1ytdeAbwFByI+A8fO6pauoBn0+SFlIwbWWONNiYBrw
 VdVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715870904; x=1716475704;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BhAIBDZu/rZJp0WFWbpKewussVqiv729DUhCPvOQ+Vg=;
 b=TP7qKUim77jf+6b6JPNEpsru6ATSq9XEpk3FT4VYtRL+C1Le8CkYJpsg8iw6Up+Noi
 +XuFKfhEGGstRtauCPolctExOB3B0iLeRak7cmYw22wHu/RXo5cMXNv5DfHKCH3jK749
 ME0jxehnkb2lZxuVSSUYcIDJtDRaLgsEIGVjUCWTa7Iz8mduVmNOIIAQrvzxiDkUpsbK
 NpQJjCZ8CBrOyaXSlnFZ/+uMLb8UYEyVrPccQveLyw6bEInBhhNoIDC0eNXMA8RyJSqc
 2CYgWaT4AbyInjTn69TeJSNppZzhCirAH9e2QVmgxbVPk/xtwpLnxfkEJaoeF1ORHQ73
 rGAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWg8m6oRSFMBr9S36dHxhOBK2lyrNW28uM6UXW433nIp5q0kqCwlxRbzw83FJB4jrcU8wRZZYuYZpiKFhjHsF7AR8pn+SUAK+zqQ2ob8djt05mdULm4VdkncxqPfcSjvEgGPp1zeouJH7+wf/FMjA==
X-Gm-Message-State: AOJu0YyzS3ttvqDw4SMElcpyBmpejs/8/7HekgWU143jrT3lab1fKk/+
 YUKu590a8140zzQHx1Djn+8Ym5L+yT8VZ0E+s0Ceyofd9s7bua0amEjUXDHQcZhIt8e6/1HP+Vx
 dkSeer4Pg8CB9D5nGjWDRJTVLXck=
X-Google-Smtp-Source: AGHT+IGDyRGeEWktoobtx15T/9PFq7l6KEse0HiGU9t6T6oxLbrOTpurB+ANPxqsvO+n/pvuPTmwzkJBnFixqo9pvtk=
X-Received: by 2002:a17:90a:bc94:b0:2af:a2a:ad67 with SMTP id
 98e67ed59e1d1-2b6cc34298emr15612068a91.4.1715870904070; Thu, 16 May 2024
 07:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240516082200.73480-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20240516082200.73480-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 16 May 2024 10:48:11 -0400
Message-ID: <CADnq5_O7cyNxuGXy+nv_sq8_FM9tBE4_FKAYQ1fP6La_cRkeZw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Remove duplicate amdgpu_umsch_mm.h header
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Abaci Robot <abaci@linux.alibaba.com>
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

On Thu, May 16, 2024 at 4:47=E2=80=AFAM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> ./drivers/gpu/drm/amd/amdgpu/amdgpu.h: amdgpu_umsch_mm.h is included more=
 than once.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D9063
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/am=
dgpu/amdgpu.h
> index 1a14e0101dac..bfae3c17e9bd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -112,7 +112,6 @@
>  #include "amdgpu_xcp.h"
>  #include "amdgpu_seq64.h"
>  #include "amdgpu_reg_state.h"
> -#include "amdgpu_umsch_mm.h"
>
>  #define MAX_GPU_INSTANCE               64
>
> --
> 2.20.1.7.g153144c
>
