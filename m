Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 563AB5A54B3
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 21:47:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E49810E4F4;
	Mon, 29 Aug 2022 19:47:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F25AD10E4F4;
 Mon, 29 Aug 2022 19:47:00 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-11f0fa892aeso3452499fac.7; 
 Mon, 29 Aug 2022 12:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=pIRa4AL/ga0qHuILPyN2VKLZ3Y5dcsSScu21XOurOb4=;
 b=j5xnVNrZZHkK2TQd0nhTcCbIu0g1VMB0PQ3Dpe6y36WlzfLHDhWGlLIpm45cV/cpk8
 DpBge+ai3ax905WBogMbIuFO+dGnRJx9psvQm8xHVtlT24ifwyJg48+JfYRfyKCPYRAM
 fcP6zvPrIZJ3+LdOWLxmABorbS6IbUltvkbewlFy4yw/NvBUz5yuLirVtUuL3GXXuhaS
 WKVlwORVrIfYI0tNCOghGfSe5aBhi8ukxDm2HwkquRcOleo77D/lRujK6bqMHeCXakBK
 y8SZfXc8X0DfCbDIRFCWBqaJoLLMi3NJVZ/n8a9SO0LU0uuAq8c1yoaaJN9LB30a1aDE
 PtOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=pIRa4AL/ga0qHuILPyN2VKLZ3Y5dcsSScu21XOurOb4=;
 b=ihH+CX/5Gcza1ARS+VEcbbPVIDzAUfRqLQNsLg21GERSLA2UX6PGBy8ppJY+8xm8Jz
 FFoNG/32cKuoNevNJ47nHmIu5oDi8BlVAUYHwl7QXsSwvcbfQ2QqsFoDiICmdPKMzB7M
 6gMh2r44VzrjnYg5XJdzScWeMgotSZbZKOSCDDL9uwCRNkPeSnXaXT/NZcrxlgWkAuQD
 o46C6Hq7ecXIx9vPVVGnQXo/aFC/pDeQzYdG6C5wf8nEYJSaqDlDMXXMw9WtyOYPnFQq
 VdPoixnsKGbN+A4+KYv1eNw+6BWc90qz46xAmSQxzLRiitynbQEM2GRDvirmlggY+JuU
 gLhw==
X-Gm-Message-State: ACgBeo0XSEuSmwQC4zGhSDQS8I05gn17pZpKb1Z+mQknAEjWLYsyV8Av
 U85jfdp5lRwo7pv/cuqZYUOFyTIOqA0YmsZrNlk=
X-Google-Smtp-Source: AA6agR4RNzSmLQwqO8u3quSZyDeocAV+diVXBCD2YHvHQAbav7s7muxW4cME/KCDPiOHXY3V2Ygl2GO3qm+o0W+LD/g=
X-Received: by 2002:a05:6808:138e:b0:345:13d1:fd66 with SMTP id
 c14-20020a056808138e00b0034513d1fd66mr8077995oiw.96.1661802420177; Mon, 29
 Aug 2022 12:47:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220829122914.268251-1-cui.jinpeng2@zte.com.cn>
In-Reply-To: <20220829122914.268251-1-cui.jinpeng2@zte.com.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 29 Aug 2022 15:46:49 -0400
Message-ID: <CADnq5_Nk5iiKWZ0eh0GxgHVsD0bz-=SbuzAZRs=Dw6oYfpy=qA@mail.gmail.com>
Subject: Re: [PATCH linux-next] drm/amdkfd: remove redundant variables err and
 ret
To: cgel.zte@gmail.com
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
Cc: airlied@linux.ie, Felix.Kuehling@amd.com, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Zeal Robot <zealci@zte.com.cn>, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, Jinpeng Cui <cui.jinpeng2@zte.com.cn>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Aug 29, 2022 at 8:29 AM <cgel.zte@gmail.com> wrote:
>
> From: Jinpeng Cui <cui.jinpeng2@zte.com.cn>
>
> Return value from kfd_wait_on_events() and io_remap_pfn_range() directly
> instead of taking this in another redundant variable.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Jinpeng Cui <cui.jinpeng2@zte.com.cn>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index 664e8b5d82c0..84da1a9ce37c 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -876,14 +876,11 @@ static int kfd_ioctl_wait_events(struct file *filp, struct kfd_process *p,
>                                 void *data)
>  {
>         struct kfd_ioctl_wait_events_args *args = data;
> -       int err;
>
> -       err = kfd_wait_on_events(p, args->num_events,
> +       return kfd_wait_on_events(p, args->num_events,
>                         (void __user *)args->events_ptr,
>                         (args->wait_for_all != 0),
>                         &args->timeout, &args->wait_result);
> -
> -       return err;
>  }
>  static int kfd_ioctl_set_scratch_backing_va(struct file *filep,
>                                         struct kfd_process *p, void *data)
> @@ -2860,7 +2857,6 @@ static int kfd_mmio_mmap(struct kfd_dev *dev, struct kfd_process *process,
>                       struct vm_area_struct *vma)
>  {
>         phys_addr_t address;
> -       int ret;
>
>         if (vma->vm_end - vma->vm_start != PAGE_SIZE)
>                 return -EINVAL;
> @@ -2880,12 +2876,11 @@ static int kfd_mmio_mmap(struct kfd_dev *dev, struct kfd_process *process,
>                  process->pasid, (unsigned long long) vma->vm_start,
>                  address, vma->vm_flags, PAGE_SIZE);
>
> -       ret = io_remap_pfn_range(vma,
> +       return io_remap_pfn_range(vma,
>                                 vma->vm_start,
>                                 address >> PAGE_SHIFT,
>                                 PAGE_SIZE,
>                                 vma->vm_page_prot);
> -       return ret;
>  }
>
>
> --
> 2.25.1
>
