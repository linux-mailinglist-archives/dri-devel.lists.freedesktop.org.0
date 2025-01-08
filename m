Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9175A06453
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 19:26:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1403410EC58;
	Wed,  8 Jan 2025 18:26:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="HHJce9b8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653AA10EC58
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 18:25:58 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5401bd6ccadso79439e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 10:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1736360697; x=1736965497; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OTBugqT56S5fFrLgpEd3CJH7Wg+3H6J7OOUqhaBS0TM=;
 b=HHJce9b8rVwIBBeT8k7e1dz2BhUnXrKBZ3Ec0AszeiJzTobcGJQ5dKi7ATZ8V6DT8W
 SaE4I7Uzwu2H6HeyW84mipS0NAPQYlW8ZvozqV0VP4z94/YTqXGsGORXMWpcn5W0x1Vu
 EBsSTregNewdJg3QysnlRDFGg5knLVXEulhfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736360697; x=1736965497;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OTBugqT56S5fFrLgpEd3CJH7Wg+3H6J7OOUqhaBS0TM=;
 b=FQRpLorMKi3hEXyWZjdIUkqUmYn5D/vqBCBHHfuyX8cZESvmxIwIYD35fueJmhRmCA
 v5lfnXpao5yLzpUxGC9gqjPuHw6Kd88cgdiQjWtfsM0Y3FCL9pkYCRvoUT5CJjlAfpmD
 UHaDi46XIsVzp4CDEmWzNq9X2gl/0SyMVjoUNDeOfeQerJWaEkEzvXOvv1QhgB4cm1/4
 kyjSdc/mluzxnxpKIVY2bxUk7tbje9OGhOiENCiZGhhfPK1aC6ewg6trjS6oZrvni3cN
 c67Uht9QHvBtTX5wlbG0ecShowUw1gdDtyvAjRNKXHC8D4hpMAHYQ4vvKI34oXzufPme
 6jaA==
X-Gm-Message-State: AOJu0Yw10Km0bEtdixUzycnSyaWaWsqSHljKVnZVouJ4dk2kg1oY3uBF
 qZfbOuL9sCpkjxduNhzxG9qyKfWF2Z2oz0sD+B9NskhL/JbR1HuEkxZGDxXtps2u295qUIm8/38
 y
X-Gm-Gg: ASbGncvE0je9XqzQQ5GhlBL9QrB0fG/+7KWSLgAlbQVtgyf7nS+sJUz3oR5dZHDaefe
 DO5fXPT6BX1XXPFesz92oBFtAfkbSG4Lgdo2mGJPGQ4To7Pu4nmI8ROuHyen1WOdgDcp+xyi0xU
 f79jG0NCDoaYNA/3rZHRoitHJcqp0DhptZxqx2lHtoPqxWgbUl8ZrTWIj/9uGPPH7rb7ke7P/ZN
 A9LYlDoPtUVbA6pW+ssJ1KG2TDMkMsehFIdiF8EbWQzPXc+Sf1eFNrUq21EWsvwubYd
X-Google-Smtp-Source: AGHT+IEhRf8kPePYXaY9T1sjV8nr/KRMtIbb74YjIgdfvqctyXemYR98vTVf+GJk6sySAtuJ9TJ6hQ==
X-Received: by 2002:a05:6000:4012:b0:388:e2a7:74c8 with SMTP id
 ffacd0b85a97d-38a87308b75mr3030840f8f.44.1736360392823; 
 Wed, 08 Jan 2025 10:19:52 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c828e3fsm54143805f8f.5.2025.01.08.10.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 10:19:52 -0800 (PST)
Date: Wed, 8 Jan 2025 19:19:50 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, oded.gabbay@gmail.com,
 quic_jhugo@quicinc.com, jacek.lawrynowicz@linux.intel.com
Subject: Re: [PATCH 00/14] accel/ivpu: Changes for 6.14
Message-ID: <Z37BxlgEqnpwkt0A@phenom.ffwll.local>
References: <20250107173238.381120-1-maciej.falkowski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107173238.381120-1-maciej.falkowski@linux.intel.com>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Tue, Jan 07, 2025 at 06:32:23PM +0100, Maciej Falkowski wrote:
> This patchset contains latest changes for Intel NPU driver
> including enabling HWS by default, adding memory utilization,
> MMU optimizations, and others.

Note that we generally cut feauture merges around -rc6 for drm subtrees,
so this is cutting it awfully close. But I guess should be ok because big
holidays and all that. In general would be better to send patches as you
go instead of a big dump before the next merge window.
-Sima

> 
> Jacek Lawrynowicz (1):
>   accel/ivpu: Enable HWS by default on all platforms
> 
> Karol Wachowski (11):
>   accel/ivpu: Separate DB ID and CMDQ ID allocations from CMDQ
>     allocation
>   accel/ivpu: Add API for command queue create/destroy/submit
>   accel/ivpu: Abort all jobs after command queue unregister
>   accel/ivpu: Dump only first MMU fault from single context
>   accel/ivpu: Move parts of MMU event IRQ handling to thread handler
>   accel/ivpu: Fix missing MMU events from reserved SSID
>   accel/ivpu: Set command queue management capability based on HWS
>   accel/ivpu: Fix locking order in ivpu_cmdq_destroy_ioctl
>   accel/ivpu: Fix locking order in ivpu_job_submit
>   accel/ivpu: Add handling of VPU_JSM_STATUS_MVNCI_CONTEXT_VIOLATION_HW
>   accel/ivpu: Add platform detection for presilicon
> 
> Maciej Falkowski (2):
>   accel/ivpu: Expose NPU memory utilization info in sysfs
>   accel/ivpu: Use workqueue for IRQ handling
> 
>  drivers/accel/ivpu/ivpu_drv.c             |  88 ++--
>  drivers/accel/ivpu/ivpu_drv.h             |  10 +-
>  drivers/accel/ivpu/ivpu_fw.c              |  13 +-
>  drivers/accel/ivpu/ivpu_hw.c              |  46 +-
>  drivers/accel/ivpu/ivpu_hw.h              |   9 -
>  drivers/accel/ivpu/ivpu_hw_btrs.c         |  10 +-
>  drivers/accel/ivpu/ivpu_hw_btrs.h         |   1 +
>  drivers/accel/ivpu/ivpu_hw_btrs_lnl_reg.h |   1 +
>  drivers/accel/ivpu/ivpu_ipc.c             |   7 +-
>  drivers/accel/ivpu/ivpu_ipc.h             |   2 +-
>  drivers/accel/ivpu/ivpu_job.c             | 508 ++++++++++++++++------
>  drivers/accel/ivpu/ivpu_job.h             |   8 +-
>  drivers/accel/ivpu/ivpu_mmu.c             | 112 ++++-
>  drivers/accel/ivpu/ivpu_mmu.h             |   2 +
>  drivers/accel/ivpu/ivpu_mmu_context.c     |  13 -
>  drivers/accel/ivpu/ivpu_mmu_context.h     |   2 -
>  drivers/accel/ivpu/ivpu_pm.c              |   3 +-
>  drivers/accel/ivpu/ivpu_pm.h              |   2 +-
>  drivers/accel/ivpu/ivpu_sysfs.c           |  35 +-
>  include/uapi/drm/ivpu_accel.h             |  84 ++++
>  20 files changed, 661 insertions(+), 295 deletions(-)
> 
> -- 
> 2.43.0
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
