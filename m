Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A5338B6C0
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 21:08:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41CCB6F4D4;
	Thu, 20 May 2021 19:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F916F4D4;
 Thu, 20 May 2021 19:08:46 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id b25so17466783oic.0;
 Thu, 20 May 2021 12:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qHZFdkVC10Rk4v8d8wk9MZUODh6XZ/Y3GEXZqNckb5U=;
 b=lNOy+B/7FQSLTgP+DMgb+OEqF5PvjT3KhWnrXHO+XJP0girbXNeh0EMLGBUNQxlZki
 YMSGTJiLYHo+8UP8kVmwTmV4OpJX3NqdARsf91DAAxfF7Vhljct5KRkPWnEMQTi0aG5k
 SjQqwq0sOQnhAP3Dm355NSEIF9hAT6V5Djc+68QcQe4aYZd50ke+TNQ2vsz0YTWOEoo7
 FvPUdRm7TS4uV7AzTkU57RjI9usIk4I0QlvLkBNNQ1KBgoEfaG2k5JBeYLQcu878+lGj
 28qZ41e204AUqoYSGLEbZxtyycEPH42j7cVQx9nm5h7NxHppNTOn7O0tJ/ps50UPNDg/
 iCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qHZFdkVC10Rk4v8d8wk9MZUODh6XZ/Y3GEXZqNckb5U=;
 b=XBwmjee9firlVhzCln3ovZKcvkMCCj8DVMDNmW/HavIHfUflPzhWv+Y6fpoYqQW8mg
 ++/sTinwufezfRD6JnrnG7DiMBMlWoBwLhzdmrcUlfyOH2BlguRuxx3NAGlaSEaZ3Gi+
 qwihUli7LRZvVXZ7sYXq2Zsk5k8DqKib6yGWUhnYOLyD9OSEgZwNUlTlNMGWTiUAa1fd
 dRFhCcl73wfSY1E1tIGmsF1lgrZtUpP3PIeYPV7f0LTOVx6i78s4fgkA8Ur7umDjjXq9
 ecfM1E1WtFIwkPNzqfgf7zqmR8Dmsi26cMCThmi6fzIvCR86v75AfSCYhUSKkvT06PZV
 X1fw==
X-Gm-Message-State: AOAM530rxS3GOHjVKHUwm3kB8MeDYQ2GyPjNEGzi0vIlMP4dGUF9Ty3D
 oLkdI6B/TDOhR1xgWRwhmCTGiMWwd2bLl8cK1bw=
X-Google-Smtp-Source: ABdhPJyrLDTWanoEUak7UWzvt+Za/lfUrq4eGtWiV8ldtaWeXrjDMvf0hHRph7JDX32l7J1wcaenH7U+BS5wJa80+x4=
X-Received: by 2002:a05:6808:1592:: with SMTP id
 t18mr2455890oiw.123.1621537725647; 
 Thu, 20 May 2021 12:08:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210520120248.3464013-1-lee.jones@linaro.org>
 <20210520120248.3464013-11-lee.jones@linaro.org>
 <6869f83f-7876-973b-2db3-8c83cc23daf2@amd.com>
In-Reply-To: <6869f83f-7876-973b-2db3-8c83cc23daf2@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 20 May 2021 15:08:34 -0400
Message-ID: <CADnq5_M_VzxKFSL59kViFDVgxQbugisa7FEXhwnxFdj1QHjXQA@mail.gmail.com>
Subject: Re: [PATCH 10/38] drm/amd/amdgpu/amdgpu_ids: Correct some function
 name disparity
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Lee Jones <lee.jones@linaro.org>,
 linux-media <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, May 20, 2021 at 8:04 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 20.05.21 um 14:02 schrieb Lee Jones:
> > Fixes the following W=3D1 kernel build warning(s):
> >
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c:200: warning: expecting proto=
type for amdgpu_vm_grab_idle(). Prototype was for amdgpu_vmid_grab_idle() i=
nstead
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c:272: warning: expecting proto=
type for amdgpu_vm_grab_reserved(). Prototype was for amdgpu_vmid_grab_rese=
rved() instead
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c:337: warning: expecting proto=
type for amdgpu_vm_grab_used(). Prototype was for amdgpu_vmid_grab_used() i=
nstead
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c:410: warning: expecting proto=
type for amdgpu_vm_grab_id(). Prototype was for amdgpu_vmid_grab() instead
> >
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: amd-gfx@lists.freedesktop.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_ids.c
> > index b4971e90b98cf..c7f3aae23c625 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
> > @@ -183,7 +183,7 @@ bool amdgpu_vmid_had_gpu_reset(struct amdgpu_device=
 *adev,
> >   }
> >
> >   /**
> > - * amdgpu_vm_grab_idle - grab idle VMID
> > + * amdgpu_vmid_grab_idle - grab idle VMID
> >    *
> >    * @vm: vm to allocate id for
> >    * @ring: ring we want to submit job to
> > @@ -256,7 +256,7 @@ static int amdgpu_vmid_grab_idle(struct amdgpu_vm *=
vm,
> >   }
> >
> >   /**
> > - * amdgpu_vm_grab_reserved - try to assign reserved VMID
> > + * amdgpu_vmid_grab_reserved - try to assign reserved VMID
> >    *
> >    * @vm: vm to allocate id for
> >    * @ring: ring we want to submit job to
> > @@ -325,7 +325,7 @@ static int amdgpu_vmid_grab_reserved(struct amdgpu_=
vm *vm,
> >   }
> >
> >   /**
> > - * amdgpu_vm_grab_used - try to reuse a VMID
> > + * amdgpu_vmid_grab_used - try to reuse a VMID
> >    *
> >    * @vm: vm to allocate id for
> >    * @ring: ring we want to submit job to
> > @@ -397,7 +397,7 @@ static int amdgpu_vmid_grab_used(struct amdgpu_vm *=
vm,
> >   }
> >
> >   /**
> > - * amdgpu_vm_grab_id - allocate the next free VMID
> > + * amdgpu_vmid_grab - allocate the next free VMID
> >    *
> >    * @vm: vm to allocate id for
> >    * @ring: ring we want to submit job to
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
