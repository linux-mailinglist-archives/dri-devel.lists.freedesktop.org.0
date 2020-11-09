Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5D82AC6F5
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 22:21:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 595AA895CA;
	Mon,  9 Nov 2020 21:21:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A8389568;
 Mon,  9 Nov 2020 21:21:29 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id w24so935689wmi.0;
 Mon, 09 Nov 2020 13:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GDp8yb+Sw0EolRsci9v+WvLZ9nSbjiU3CL4VUAU4p3U=;
 b=Eyj0wf9PKyzvgsvHQsyfgZxgGn5vIq16Y8gMdbnhJB78VNyMq8Mwjq0OGH9NFWYzqP
 Jp6UuxRGSSt/WnTSuor53OoHOFjky9QEJ6mPUsUGscEyfMjbWSca3qO2SBpywYqVQzxx
 BM493YCgTJ/d53de+QhRi2qbmgbsOr0/olWozoAeGnkl8EBuG7iZwkq5Qbvhl3u7+IL9
 8YezRO3SLYsejT1YmFbagEQmv40oewW9JRsdViPZ6rQDcyvsRr3o+AVNMa3JTg2QMwHO
 T6vopTIYAcQCly1h+WlGfDjczNUBTzqzsE5GrfocbjClUg5sdUd0PtV9pCrNHcQaE2+W
 2HWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GDp8yb+Sw0EolRsci9v+WvLZ9nSbjiU3CL4VUAU4p3U=;
 b=hNV2NPiRbmAk6PPZOXxUeqNb3SFMjHU63Z0H7HTWAioeZru1O+R9K5PZhIf3xJJGWZ
 kYGp9qTNTR5h5Uqd0ZcoroNdFjkpRdc63qPBsFtoNG77pE8s/51k/x95K7LMSDrQyz9T
 2lvzeUdGKZzI5rqhjPX43hZcIPFzQMt6o7XS0CXGNVA0YEIwPGOmMhQZ9qD/NeURBExN
 LgjmDNnFGUWtCf7KxuL7E+C/aWXq2NEyFPTc7jfPk81UN3PD22AxaKR7leyZwe5T8jq7
 yLc7StR4TT1p/9extKSwHFL9UtjygandtUVQH+WpLa28J8nELMfhZ7VRgIniMMkVlZQi
 y+KA==
X-Gm-Message-State: AOAM533itZK6Am0nWInkv/rcTqHjSeN5RZyhzpscbUWP48iKNPyJEbAu
 mN77lWTuFYVrdhRRyTj6NXZICy+WGo+Zrtp786o=
X-Google-Smtp-Source: ABdhPJyIn9jY/EM3NsfRCWQKiTNIKSQPUd00zlTTnc7nT1mAHIfsQMOpQ0BCDXxFJdSy6q+gIIZeHW6pK4msqPWqZAo=
X-Received: by 2002:a1c:46c6:: with SMTP id t189mr1159422wma.79.1604956887879; 
 Mon, 09 Nov 2020 13:21:27 -0800 (PST)
MIME-Version: 1.0
References: <20201109210725.24668-1-unixbhaskar@gmail.com>
In-Reply-To: <20201109210725.24668-1-unixbhaskar@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 9 Nov 2020 16:21:16 -0500
Message-ID: <CADnq5_NOmgYM0_0fTQaYr+qn7M_Vrbo1E=mPmuoATQNjRRHTqg@mail.gmail.com>
Subject: Re: [PATCH] drivers: amdgpu: amdgpu_display: Fixed the spelling of
 falg to flag
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Jean Delvare <jdelvare@suse.de>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 9, 2020 at 4:16 PM Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:
>
> s/falg/flag/p
>
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index 2e8a8b57639f..9223502c1e5b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -509,7 +509,7 @@ uint32_t amdgpu_display_supported_domains(struct amdgpu_device *adev,
>          * to avoid hang caused by placement of scanout BO in GTT on certain
>          * APUs. So force the BO placement to VRAM in case this architecture
>          * will not allow USWC mappings.
> -        * Also, don't allow GTT domain if the BO doens't have USWC falg set.
> +        * Also, don't allow GTT domain if the BO doens't have USWC flag set.
>          */
>         if ((bo_flags & AMDGPU_GEM_CREATE_CPU_GTT_USWC) &&
>             amdgpu_bo_support_uswc(bo_flags) &&
> --
> 2.26.2
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
