Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E650EC2B08D
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 11:25:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E92C410E171;
	Mon,  3 Nov 2025 10:25:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="4SvQflJK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E816710E171
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 10:25:51 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-27d67abd215so419445ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 02:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1762165551; x=1762770351;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gv2e9ygsp9GWwcHVuU/GyMuAUbYvn3xLnsbOpkJhe98=;
 b=4SvQflJKYP3bxjMBq7lTNgD1a4YGIo7KFtoUJHCDjdwndfsw8dMX8+aet8S0Hkl0vJ
 ohUNpbVV3C4K5EeKNAYDYZI9D1XXbpEU9z35CAlQkGgPQ0errfnb8Idys43pZK3vmjCX
 NyZACsgJc/H74ZGIxQpc2iCHSaTSdZ4MtvWcHHNM2cRNpUniMri5wna+M6DKVxYyHoES
 B4Z250xDugYCt2/+p65JURxPcoapMpv13kAUv1jPp7OPntg/Nrj+KkAt4D4QCG7ZqDuC
 SIj+Tkqlpx43vsJOs8MfQ/LOHPzLnfG61tnv2n4ubR5kaQsYAkzykIYE5XB/qzf0OUSK
 cpFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762165551; x=1762770351;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gv2e9ygsp9GWwcHVuU/GyMuAUbYvn3xLnsbOpkJhe98=;
 b=XXiV0v1nmtXy90RonMEMgW7YJgDLlBSLpI4gsjL1lmpnU5ueEg0jdnznlYAs59r03h
 ECjB9rXg1iR7hCzspHctzYQfEJbAT2JBcc7k6ZVA+0z8mvIGkUG5IWiDm+QTxp79phgI
 P1QHqvMiBCxw/jEo530p1BvpRpcr8Q9gwmEr6W/qTXANNU0ud9E4OL18AJX/aH0x4kJr
 HK9uKpjAnfoIQh5aeXscFnn5m8oUGMDwtENPhWmLp5Pk1Q4xwVHejE3Pfg0GrYGoiaYe
 WZTBFgxzSmkzCB1uMdlss/iBQJpDn645/bdN5iPZYG8fd+4JB8xzatuk84DgY9x+UyFr
 /FSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdz/Cp8Kc9ll9PTLUOHrghWoaRs2ylBBPW/zz87ByYieDTIPFmfQdBilCSohSjQySDV98SFuwmXro=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwckjrOlrlAzuVruDXeFSJpO7qFR2M8Iec2SUujYNeRavFgaoOw
 Rbw77ipbv+hbF8x5YtAdnAodufBZrCBT8UbUZgXiHupk2IotBBpTCskmphH0jFmMhQ==
X-Gm-Gg: ASbGncsXTJFT2+pga5wEzt7ivOaNn2MxfjAbGyFQwWdJKDyOOUjIqlDG0mOieuUZy5s
 q+ZGKxYt1vUt+lE22aueGXKucvusZtU9a3S4fURTqrCePIyMcmwWOlWR1F2kojpsWtN5roWbTFu
 jQ0Rp4ovu0+RCNCAp0mIstO1ks72720lWoRf61iyAF9p0xKOolhn7JbBZ3uqDKiVAgy6+jz+pki
 qOdXHYnl3HFwohD4iCInhsDxPxJnUlItgsVPXhP965RRy9pipkKY9eakVJ7g3LvJF1pgtEpl2MI
 fi2WRfQcMNSnXFLkm99Ebk/iOG2GXdV9y46dzCNNQTPPATy/TJ2dzjESEIiuDrdK4B1D+j0cOFW
 bmEQ0yLjM3YlAHR8OXu7c4O3XhOptnib4MoewSMpgOAY4ylPViDCm41EEOHy4tazjXgyU5KYBXQ
 YplYzTkY2xXUK6whyoDLKxX5N5FSeTRAk5l1rguA==
X-Google-Smtp-Source: AGHT+IGWMvk41x0fPTVw6ZYdCrfpoxx7g/UVoBFTBuqaFXqto2Ol7yP/kHVO5kf2HNRBirU7N6KCng==
X-Received: by 2002:a17:903:41c8:b0:294:ecba:c8e with SMTP id
 d9443c01a7336-2955658e7b9mr5841305ad.3.1762165550799; 
 Mon, 03 Nov 2025 02:25:50 -0800 (PST)
Received: from google.com (164.210.142.34.bc.googleusercontent.com.
 [34.142.210.164]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b9b8f2b5403sm3684424a12.17.2025.11.03.02.25.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 02:25:50 -0800 (PST)
Date: Mon, 3 Nov 2025 10:25:40 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Ankit Agrawal <ankita@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Brett Creeley <brett.creeley@amd.com>,
 dri-devel@lists.freedesktop.org, Eric Auger <eric.auger@redhat.com>,
 Eric Farman <farman@linux.ibm.com>,
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Kevin Tian <kevin.tian@intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Longfang Liu <liulongfang@huawei.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Nikhil Agarwal <nikhil.agarwal@amd.com>, Nipun Gupta <nipun.gupta@amd.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, qat-linux@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Mostafa Saleh <smostafa@google.com>, Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, virtualization@lists.linux.dev,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Yishai Hadas <yishaih@nvidia.com>,
 Zhenyu Wang <zhenyuw.linux@gmail.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>, patches@lists.linux.dev
Subject: Re: [PATCH 19/22] vfio/pci: Convert all PCI drivers to
 get_region_info_caps
Message-ID: <aQiDJDdJGigjtkeU@google.com>
References: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
 <19-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
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

On Thu, Oct 23, 2025 at 08:09:33PM -0300, Jason Gunthorpe wrote:
> Since the core function signature changes it has to flow up to all
> drivers.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  .../vfio/pci/hisilicon/hisi_acc_vfio_pci.c    |  30 ++---
>  drivers/vfio/pci/mlx5/main.c                  |   2 +-
>  drivers/vfio/pci/nvgrace-gpu/main.c           |  51 ++-------
>  drivers/vfio/pci/pds/vfio_dev.c               |   2 +-
>  drivers/vfio/pci/qat/main.c                   |   2 +-
>  drivers/vfio/pci/vfio_pci.c                   |   2 +-
>  drivers/vfio/pci/vfio_pci_core.c              | 103 +++++++-----------
>  drivers/vfio/pci/virtio/common.h              |   3 +-
>  drivers/vfio/pci/virtio/legacy_io.c           |  26 ++---
>  drivers/vfio/pci/virtio/main.c                |   6 +-
>  include/linux/vfio_pci_core.h                 |   3 +-
>  11 files changed, 80 insertions(+), 150 deletions(-)
> 

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
