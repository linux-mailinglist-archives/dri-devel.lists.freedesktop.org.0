Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE1D3316F2
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 20:05:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E207E6E86B;
	Mon,  8 Mar 2021 19:05:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E4056E86B;
 Mon,  8 Mar 2021 19:05:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 67C856529C;
 Mon,  8 Mar 2021 19:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615230343;
 bh=R1rZmVaVvjoZHSq0MeocIwyK7X5t9Cgt5fsNcUmcg0w=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vQ85r2gJhzWZyS3Z1Gzr29JNh8EbH0qMgxZ9jya/fCUyWXfvtdt48O6UpSHSB/gvN
 ZKcdaAoD1wuApWyzJIuj96JOgDmAmpTa2w8C2L7Wc5nDGrp8K7eji0pTuaudKDcsXG
 +MZm3M6fj3nrvq4WNDwIoCN0TQQ57axE2xZIGWyiGI9N01VKp+6MvDLRJXelfE0Whr
 shrFaVnIogkBWlyBKnku4IUfqAweDPsMVpPi1s2gbIsI2VLJb/haLqZ/sopiQgane4
 PoLYZIEGR/Zfv4xaca1Woh9/lODGkAb9oBFTcZFsU7EL1Q7qahG5vn2nUYF98DXy8e
 7heL5AhQV7SOw==
Received: by mail-ot1-f52.google.com with SMTP id t16so10286613ott.3;
 Mon, 08 Mar 2021 11:05:43 -0800 (PST)
X-Gm-Message-State: AOAM533fG6ohcZWeyImIeWwT58NCTV89fgxI4Kmu+kFNxXdl3QU1ct5U
 86qCS+JgU73RiwJResqghBcPQToA3QlGMb3QRJY=
X-Google-Smtp-Source: ABdhPJxO5GgsPMAdySatZEpnLT5ES1NNv5sH2i/FK9scIBoJLHmJYX1m+WNKtYZ9Jv1tGw1FZ/zrD77JQAREU7zsxeA=
X-Received: by 2002:a05:6830:148c:: with SMTP id
 s12mr3345826otq.251.1615230342591; 
 Mon, 08 Mar 2021 11:05:42 -0800 (PST)
MIME-Version: 1.0
References: <20210308153359.2513446-1-arnd@kernel.org>
 <176cae4d-33bc-1d51-a7d7-58eeeea5180e@amd.com>
In-Reply-To: <176cae4d-33bc-1d51-a7d7-58eeeea5180e@amd.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 8 Mar 2021 20:05:25 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0nUKSJ2+knM6+REp8HXRFbz5-DmNRAusezkT+XzZQa7Q@mail.gmail.com>
Message-ID: <CAK8P3a0nUKSJ2+knM6+REp8HXRFbz5-DmNRAusezkT+XzZQa7Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: fix build error with missing AMD_IOMMU_V2
To: Felix Kuehling <felix.kuehling@amd.com>
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
Cc: Philip Yang <philip.yang@amd.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 8, 2021 at 5:24 PM Felix Kuehling <felix.kuehling@amd.com> wrote:
>
> The driver build should work without IOMMUv2. In amdkfd/Makefile, we
> have this condition:
>
> ifneq ($(CONFIG_AMD_IOMMU_V2),)
> AMDKFD_FILES += $(AMDKFD_PATH)/kfd_iommu.o
> endif
>
> In amdkfd/kfd_iommu.h we define inline stubs of the functions that are
> causing your link-failures if IOMMU_V2 is not enabled:
>
> #if defined(CONFIG_AMD_IOMMU_V2_MODULE) || defined(CONFIG_AMD_IOMMU_V2)
> ... function declarations ...
> #else
> ... stubs ...
> #endif

Right, that is the problem I tried to explain in my patch description.

Should we just drop the 'imply' then and add a proper dependency like this?

      depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64)
      depends on AMD_IOMMU_V2=y || DRM_AMDGPU=m

I can send a v2 after some testing if you prefer this version.

        Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
