Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFA632F945
	for <lists+dri-devel@lfdr.de>; Sat,  6 Mar 2021 11:05:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D816E4E8;
	Sat,  6 Mar 2021 10:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A714D6ECAA;
 Sat,  6 Mar 2021 00:03:59 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id h22so3509920otr.6;
 Fri, 05 Mar 2021 16:03:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FCbBlEEqgxfjPjtQfKvWFaWJOfXoBc2uhQxuYQUH8F0=;
 b=UEPylbni3xQLvOVRt8gQRymTS37ytSahh4ebfQy+BGX/tOBXPJgHEgAJx/B13HMSFP
 b2ZrDeF1fzfUB4cgxwIhwABKQkKIkW+TBxoKZrAnqhUlimp3Ms/gMEadfD+KdRzXSx1n
 exMIbZQ3epR+nt+eDIB2iAFnygFB5gdHv/IPjZmI1sEd8got7yhzuocEQOFleEE9kk1u
 7Xe6I9Lo1YEHfXlE/90JL9SVLXV64rxVSDMcq+G89CxaC8dDPQuU3EqLvS8soJZvknlK
 YFO6XBHpvtO4jCgg51N6wBFonFQ8hw6OffNeJwiwPLFQJOjeN5XQ4u7TPC1NA7xECLjk
 zWOw==
X-Gm-Message-State: AOAM531SHO2Tdp++EOKuXCLVUt4lFICYHCJJcKKDUsGqbroEMYwFpvWR
 9HkEnd0r34iVzIhwwP3Ul9IP8buMmjYECA==
X-Google-Smtp-Source: ABdhPJzRKzsBPykuIWvPs6D0/mVp6QfrzfuTLzcU4fKlvNZ/0BrLG9XMzEOrDTHlSF1F9IcBXVzQDQ==
X-Received: by 2002:a05:6830:1057:: with SMTP id
 b23mr10458873otp.206.1614989038345; 
 Fri, 05 Mar 2021 16:03:58 -0800 (PST)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com.
 [209.85.167.182])
 by smtp.gmail.com with ESMTPSA id n11sm859656oij.51.2021.03.05.16.03.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 16:03:57 -0800 (PST)
Received: by mail-oi1-f182.google.com with SMTP id m25so4396696oie.12;
 Fri, 05 Mar 2021 16:03:56 -0800 (PST)
X-Received: by 2002:a54:4794:: with SMTP id o20mr9228337oic.51.1614989036851; 
 Fri, 05 Mar 2021 16:03:56 -0800 (PST)
MIME-Version: 1.0
References: <20210301084257.945454-1-hch@lst.de>
In-Reply-To: <20210301084257.945454-1-hch@lst.de>
From: Li Yang <leoyang.li@nxp.com>
Date: Fri, 5 Mar 2021 18:03:45 -0600
X-Gmail-Original-Message-ID: <CADRPPNTSzuuqW97_vd3h5cpHe7gOLyw3zCaqapb8YVqPF-rOfA@mail.gmail.com>
Message-ID: <CADRPPNTSzuuqW97_vd3h5cpHe7gOLyw3zCaqapb8YVqPF-rOfA@mail.gmail.com>
Subject: Re: cleanup unused or almost unused IOMMU APIs and the FSL PAMU driver
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Approved-At: Sat, 06 Mar 2021 10:04:47 +0000
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
Cc: kvm@vger.kernel.org, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Netdev <netdev@vger.kernel.org>,
 freedreno@lists.freedesktop.org, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 1, 2021 at 2:44 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Hi all,
>
> there are a bunch of IOMMU APIs that are entirely unused, or only used as
> a private communication channel between the FSL PAMU driver and it's only
> consumer, the qbman portal driver.
>
> So this series drops a huge chunk of entirely unused FSL PAMU
> functionality, then drops all kinds of unused IOMMU APIs, and then
> replaces what is left of the iommu_attrs with properly typed, smaller
> and easier to use specific APIs.

It looks like the unused APIs were added for functionality that were
never completed later on.  So

Acked-by: Li Yang <leoyang.li@nxp.com>

>
> Diffstat:
>  arch/powerpc/include/asm/fsl_pamu_stash.h   |   12
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c     |    2
>  drivers/iommu/amd/iommu.c                   |   23
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |   85 ---
>  drivers/iommu/arm/arm-smmu/arm-smmu.c       |  122 +---
>  drivers/iommu/dma-iommu.c                   |    8
>  drivers/iommu/fsl_pamu.c                    |  264 ----------
>  drivers/iommu/fsl_pamu.h                    |   10
>  drivers/iommu/fsl_pamu_domain.c             |  694 ++--------------------------
>  drivers/iommu/fsl_pamu_domain.h             |   46 -
>  drivers/iommu/intel/iommu.c                 |   55 --
>  drivers/iommu/iommu.c                       |   75 ---
>  drivers/soc/fsl/qbman/qman_portal.c         |   56 --
>  drivers/vfio/vfio_iommu_type1.c             |   31 -
>  drivers/vhost/vdpa.c                        |   10
>  include/linux/iommu.h                       |   81 ---
>  16 files changed, 214 insertions(+), 1360 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
