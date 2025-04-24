Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69817A9AF75
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 15:40:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA2610E828;
	Thu, 24 Apr 2025 13:40:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XnmmPxQZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AD1110E825;
 Thu, 24 Apr 2025 13:40:52 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-225887c7265so1845545ad.0; 
 Thu, 24 Apr 2025 06:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745502052; x=1746106852; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vGR59W4mDFi4xO+EAgOhdxOaLwy6rWMY5fVRK30YhEk=;
 b=XnmmPxQZK1PzlAX1ZCxvM4Ce9g81RePn0DJGmVpjfcYW/LVl0WlqL7POSHzYZl5O0V
 k4Ruakxh6pvLo7C89cC5MMoApvo4pCCvQqKs7Lh5pXyHdnU5WD8nZO22wp1WyzIJCmhP
 4wVJ2FUp9jcxKa6FXY/+xOZObm0F0NB2hh57sVGXoD+f/mp5Zto+PDi62p/YjUHNw/zU
 LlWqD34LaZV6hWYyMDX/Jyy9sPVt0RX9rl6U6WUiShX4Ujntzrg5jJQpXQbBIUHi/wpa
 s/CGC+pfoETDkzYY/bsEVV/VV5sEKb2cwoykHFzKVZcPI2sI9dVkZPopPpF87FuC7RNv
 R6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745502052; x=1746106852;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vGR59W4mDFi4xO+EAgOhdxOaLwy6rWMY5fVRK30YhEk=;
 b=hUJVz4sOGmULMBgkPKng7mPGB/Zbj+8JsmwQFX63t33/8GCcqSCGc1CLhd6AT2AFsu
 u/ImgpmSPyTpcmTkC50igtyCF41/mKuXSwrhE3YZEMAorKFdJyawUtxjx4nDYAslNup9
 QTeukMQHsKstqj13bCFwwDn3v2BkYEGYtRu/EzCRUyWEL/FAxwt6x63fbQp/PSOd4sNV
 O/ZLiP22wMUzDhDev4pUvgl5S+Skoe5ZGFHAmqlgj7rNJuNmWiWPtHblZIbrj6ZsEqT8
 A2mvHOXELwiTz7XFgGdnwV8TBlcwawVJNv8VsVav+W0FqkC0c0u+k5kn0apMqhyxYW0b
 3D6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRN6SDUGzSTD5NMEZ8oKywXtD9vKBqp3CbvpyAcUqZNpT6a2ON3WUz3Pq2/8tVCrMOYJCiX9TGhorq@lists.freedesktop.org,
 AJvYcCXl0xE1dAhqDFAGpQ8DjqtnCHeH3yVemvHKArYgccSrhopvn0/mdu0Z2rT1ZeYdBlAYmERle0pr@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzXg5wk9udIKPDVHNdiT5D9YUOTVTB+HV4EZ6PWIS5cfEl5c9j
 u9Mx59FUS75/4tA9nFN2DgJsMYpsgxFpM9HkjfWccGQgOLq7Z4mRyh9cK4ookCn8Ir2Em5Ck4+N
 e50kK4W2rJmaebNWdXaTliIU4CHh5+Gk9
X-Gm-Gg: ASbGncunfHUuDsVsa8sCdtBjQM5En58FddOcm8oliOgB9DNIXPExVwNuumbh6NpeRRq
 YyNFmTiZezKspuYtru2Wv9XdBfyG/S85mkuDkSZ0DwD+jx40wddevLhaHjxv+3526jPa7eSEERs
 EIXWN3GcFJvDNrtVxkWf5LyZdPRMbRB2GA
X-Google-Smtp-Source: AGHT+IFvVwkz/fRggf4RXSdAHEIOl2NoH3IHh/SjTK4riJvjfQYcCpR4CKh/u9HL7mVUlCxaPq6yhDN8QLMRohVGWjQ=
X-Received: by 2002:a17:902:c94d:b0:224:1936:698a with SMTP id
 d9443c01a7336-22db3becec4mr14640995ad.5.1745502051712; Thu, 24 Apr 2025
 06:40:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250418083129.9739-1-arefev@swemel.ru>
 <PH7PR12MB56852EECD78C11BD15157AF383BB2@PH7PR12MB5685.namprd12.prod.outlook.com>
 <CADnq5_NLEUZget2naQm9bYH1EsrvbhJCGd7yPN+=9Z_kKmUOCw@mail.gmail.com>
 <BL1PR12MB5144467CB7C017E030A4C3E3F7BB2@BL1PR12MB5144.namprd12.prod.outlook.com>
 <9e4700f6-df58-4685-b4fe-6b53fc1c5222@amd.com>
In-Reply-To: <9e4700f6-df58-4685-b4fe-6b53fc1c5222@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 24 Apr 2025 09:40:39 -0400
X-Gm-Features: ATxdqUH-6vkzj31ZXtYYUvGAtxeQT0Et5GikCO2xh4TnwiIKM3nEqTfSrYXtSjE
Message-ID: <CADnq5_O-tqQ4y7sNx0nMD_0aTFO0H7_vVg=umaPXUbBLFmwnJg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amdgpu: check a user-provided number of BOs in list
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Denis Arefev <arefev@swemel.ru>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Chunming Zhou <david1.zhou@amd.com>, 
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>, 
 "stable@vger.kernel.org" <stable@vger.kernel.org>
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

On Wed, Apr 23, 2025 at 10:29=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 4/22/25 18:26, Deucher, Alexander wrote:
> > [Public]
> >
> >> -----Original Message-----
> >> From: Alex Deucher <alexdeucher@gmail.com>
> >> Sent: Tuesday, April 22, 2025 9:46 AM
> >> To: Koenig, Christian <Christian.Koenig@amd.com>
> >> Cc: Denis Arefev <arefev@swemel.ru>; Deucher, Alexander
> >> <Alexander.Deucher@amd.com>; David Airlie <airlied@gmail.com>; Simona =
Vetter
> >> <simona@ffwll.ch>; Andrey Grodzovsky <andrey.grodzovsky@amd.com>;
> >> Chunming Zhou <david1.zhou@amd.com>; amd-gfx@lists.freedesktop.org; dr=
i-
> >> devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; lvc-
> >> project@linuxtesting.org; stable@vger.kernel.org
> >> Subject: Re: [PATCH v2] drm/amdgpu: check a user-provided number of BO=
s in list
> >>
> >> Applied.  Thanks!
> >
> > This change beaks the following IGT tests:
> >
> > igt@amdgpu/amd_vcn@vcn-decoder-create-decode-destroy@vcn-decoder-create
> > igt@amdgpu/amd_vcn@vcn-decoder-create-decode-destroy@vcn-decoder-decode
> > igt@amdgpu/amd_vcn@vcn-decoder-create-decode-destroy@vcn-decoder-destro=
y
> > igt@amdgpu/amd_jpeg_dec@amdgpu_cs_jpeg_decode
> > igt@amdgpu/amd_cs_nop@cs-nops-with-nop-compute0@cs-nop-with-nop-compute=
0
> > igt@amdgpu/amd_cs_nop@cs-nops-with-sync-compute0@cs-nop-with-sync-compu=
te0
> > igt@amdgpu/amd_cs_nop@cs-nops-with-fork-compute0@cs-nop-with-fork-compu=
te0
> > igt@amdgpu/amd_cs_nop@cs-nops-with-sync-fork-compute0@cs-nop-with-sync-=
fork-compute0
> > igt@amdgpu/amd_basic@userptr-with-ip-dma@userptr
> > igt@amdgpu/amd_basic@cs-compute-with-ip-compute@cs-compute
> > igt@amdgpu/amd_basic@cs-sdma-with-ip-dma@cs-sdma
> > igt@amdgpu/amd_basic@eviction-test-with-ip-dma@eviction_test
> > igt@amdgpu/amd_cp_dma_misc@gtt_to_vram-amdgpu_hw_ip_compute0
> > igt@amdgpu/amd_cp_dma_misc@vram_to_gtt-amdgpu_hw_ip_compute0
> > igt@amdgpu/amd_cp_dma_misc@vram_to_vram-amdgpu_hw_ip_compute0
>
>
> Could it be that we used BO list with zero entries for those?

Yes.  Dropping the 0 check fixed them.  E.g.,

+       if (in->bo_number > USHRT_MAX)
+               return -EINVAL;

Alex

>
> Christian.
>
> >
> > Alex
> >
> >>
> >> On Tue, Apr 22, 2025 at 5:13=E2=80=AFAM Koenig, Christian <Christian.K=
oenig@amd.com>
> >> wrote:
> >>>
> >>> [AMD Official Use Only - AMD Internal Distribution Only]
> >>>
> >>> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>>
> >>> ________________________________________
> >>> Von: Denis Arefev <arefev@swemel.ru>
> >>> Gesendet: Freitag, 18. April 2025 10:31
> >>> An: Deucher, Alexander
> >>> Cc: Koenig, Christian; David Airlie; Simona Vetter; Andrey Grodzovsky=
;
> >>> Chunming Zhou; amd-gfx@lists.freedesktop.org;
> >>> dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org;
> >>> lvc-project@linuxtesting.org; stable@vger.kernel.org
> >>> Betreff: [PATCH v2] drm/amdgpu: check a user-provided number of BOs i=
n
> >>> list
> >>>
> >>> The user can set any value to the variable =E2=80=98bo_number=E2=80=
=99, via the ioctl
> >>> command DRM_IOCTL_AMDGPU_BO_LIST. This will affect the arithmetic
> >>> expression =E2=80=98in->bo_number * in->bo_info_size=E2=80=99, which =
is prone to
> >>> overflow. Add a valid value check.
> >>>
> >>> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> >>>
> >>> Fixes: 964d0fbf6301 ("drm/amdgpu: Allow to create BO lists in CS ioct=
l
> >>> v3")
> >>> Cc: stable@vger.kernel.org
> >>> Signed-off-by: Denis Arefev <arefev@swemel.ru>
> >>> ---
> >>> V1 -> V2:
> >>> Set a reasonable limit 'USHRT_MAX' for 'bo_number' it as Christian
> >>> K=C3=B6nig <christian.koenig@amd.com> suggested
> >>>
> >>>  drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c | 3 +++
> >>>  1 file changed, 3 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
> >>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
> >>> index 702f6610d024..85f7ee1e085d 100644
> >>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
> >>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
> >>> @@ -189,6 +189,9 @@ int amdgpu_bo_create_list_entry_array(struct
> >> drm_amdgpu_bo_list_in *in,
> >>>         struct drm_amdgpu_bo_list_entry *info;
> >>>         int r;
> >>>
> >>> +       if (!in->bo_number || in->bo_number > USHRT_MAX)
> >>> +               return -EINVAL;
> >>> +
> >>>         info =3D kvmalloc_array(in->bo_number, info_size, GFP_KERNEL)=
;
> >>>         if (!info)
> >>>                 return -ENOMEM;
> >>> --
> >>> 2.43.0
> >>>
>
