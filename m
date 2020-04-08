Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EADA1A302A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 09:34:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1826EB79;
	Thu,  9 Apr 2020 07:33:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 488C76EB14
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 23:18:56 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id f16so8481711ilj.9
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 16:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aurabindo.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xIQm6fd8XzuEF+zm8pOL7pNaI9rUwGZpiWPVM8H1bSE=;
 b=RR3inxHNUItmUkfN6BIANFJr5kU1yf5GC8vhL8B+NMY7ovOMiXXmaF3Og/C7qSnUzt
 YKfEmLLfMm8RLstk1uRScsR279J+7GPXncEpu3UrO6NEGN+m0bPVlcdRQnQlfOk674qo
 +JMnVpY4lYtYwUq3+rAqxr9kPhTKkH6ROO/jQ1rCh2Wj1r+c4rL3GuT7c0mDqzVYmrCh
 FnbrrIH7DkAcNOlqSwgSm8RQKxoTvpOB2wmA1JoK9zlbRcw0O16NMd68q1pvmuguFjU0
 09wHePpXkryGQ8UZFezGovxC+hWSNPz0dC83e92HLT+RkNsVHc8Z2M8atHdycjYmcqyx
 afbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xIQm6fd8XzuEF+zm8pOL7pNaI9rUwGZpiWPVM8H1bSE=;
 b=Z1wx1w0Ao4GP9+eq66B6M706nnBkv2zM9tc5O7mkW1ntjmS4JeRZno9TMwgGJN+PdD
 WgwJZbu7nwEOH1I8+IXmb4eYE2PMRheIWnh77XFp/C04gEhLWod5Q4ej1uFPmNs2TJGu
 xq9DvkFr3YOipLvi+B1t43ll3UvXhj7u44N/SqdqGxfKb3WhTTYPAgixs7IAsHj/pEhu
 fRzvUIG5t8VK4WGooVmmCn/8Q2RXxMzZJTGrSCmRpYGAWoHSCrMhx5R4g1Mc84f2Ytij
 umrMLXFteTVDyF83eqLd6cvu6rm6g709zsRf7W4VOUM/vK7WWtNpEWBV5yO2yjqHGpQN
 5CQQ==
X-Gm-Message-State: AGi0PuZ9tes1vnr3bxjLaegVhubh0P61Q2msuAuj6vgkgNNesYdsE6Pm
 tmQT86d3vbBF3j4fpMf82sv7MrULktP7IJhNCgYXNA==
X-Google-Smtp-Source: APiQypKEwbFd6R9kEli2dzEGIji7GKMCjLR71i+SQ8NDaynvVQfLOCGvH4kxXequfugwVmVUaRoYsPr0x4OsopRMnPk=
X-Received: by 2002:a92:5e14:: with SMTP id s20mr10401973ilb.210.1586387935478; 
 Wed, 08 Apr 2020 16:18:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200408133735.7679-1-mail@aurabindo.in>
 <bfa1a07f6f2046d5edac80d282cc710328d84d72.camel@perches.com>
In-Reply-To: <bfa1a07f6f2046d5edac80d282cc710328d84d72.camel@perches.com>
From: Aurabindo Pillai <mail@aurabindo.in>
Date: Wed, 8 Apr 2020 19:18:44 -0400
Message-ID: <CAMu4TMv5DuAW3WtDOFx2xoQc_EYURZjnF722QA9mMCdUFGkBBg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/amdgpu: add prefix for pr_* prints
To: Joe Perches <joe@perches.com>
X-Mailman-Approved-At: Thu, 09 Apr 2020 07:33:24 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Joe,

On Wed, Apr 8, 2020 at 11:37 AM Joe Perches <joe@perches.com> wrote:
>
> All the embedded uses of "amdgpu:" in logging
> messages should also be deleted.
>
> $ git grep -P '(?:dev_|pr_).*"amdgpu:' drivers/gpu/drm/amd/amdgpu/
> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:               pr_err("amdgpu: failed to validate PT BOs\n");
> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:               pr_err("amdgpu: failed to validate PD\n");
> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:                       pr_err("amdgpu: failed to kmap PD, ret=%d\n", ret);
> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:             pr_info("amdgpu: switched on\n");
> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:             pr_info("amdgpu: switched off\n");
> drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c:                        dev_dbg(adev->dev, "amdgpu: using MSI/MSI-X.\n");
> drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c:          dev_warn(adev->dev, "amdgpu: No suitable DMA available.\n");
> drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c:          pr_warn("amdgpu: No suitable DMA available\n");
> drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c:          pr_warn("amdgpu: No suitable DMA available\n");
>
>
>

Thanks for the heads up, I shall submit another set with those changes
you suggested.

-- 

Thanks and Regards,

Aurabindo J Pillai
https://aurabindo.in
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
