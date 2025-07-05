Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A990AFA1B1
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 22:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF79110E053;
	Sat,  5 Jul 2025 20:12:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="gSYTcLNb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B9610E053
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jul 2025 20:12:22 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-6098ef283f0so31091a12.0
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jul 2025 13:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1751746341; x=1752351141;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9z08aVLb91ru0Ot02TohgmJftasWTWVr+dxaYwP4DqM=;
 b=gSYTcLNb0GL7ExcurZyLeeDYv+zKY5AP3bJiXuCvlJARxUkZMpdW+JlFFUACt4CG0E
 NKEhADmXAx2RMP7aljVDlC2AP/XdTsHf2u4xfpocY63rRISokrF0uSYvy/0fvihxa7fi
 yfs8LvSPTXYc6hzbyqzkCTF2/lNFf8x1+MUcRiqNvX0zeVKi5fpnUJ3cjWwVHNuGMNCi
 7Q4YeMw3POpvWUThz9n++InAT9l+Pwoor5Kk+oNjeVLGnEts8YuLeoTrpA3ps5pn5Gam
 MRItMoKDUK2Ptsz0imOC7c5yW2h+mx6bzIpowBB5K9/eZPjzpISo88hT/E9O/sn6UwNw
 OYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751746341; x=1752351141;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9z08aVLb91ru0Ot02TohgmJftasWTWVr+dxaYwP4DqM=;
 b=i499TmMTzYeJIn8/3EYu0aGpU+GY7dLNCbmLFXnvpYuh08CpT6qBt1GYrfSep5QorE
 hu3xAdf5yQQo8S9RIthN8GkAkfjHyOE3ginsbMrsjZtrC807G6Ak0fGWj1hitUOoSo2N
 h4L0zJrXKuc2mfevNh5//tS+/IgXT5ufF2xB+0inEnel9ccNjP4buRoNWFzyy9OpUDlh
 SwIcBzZtFldmDI/wzl8ElS/lPDirIhoO9+KXlaP9DWGVREIi6/VDLzFIBHnZmchy4lHL
 KKsfdT8P3nXfVFoS/5KrtOhqkI5tc/HnRhmsiHorE2Mj0DZYIVJZ1o9zz7U7N+3v82rJ
 BYqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsMPjN0LkEhchUul4UBHi303MZcT+zBFUh3MWgvN6oKQDeIVPpbbfVRpq+3jPDkHlNPa7eDAWboGw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTD+PGYPxhdHFUmIvGc9GTbfX/2PZBV0sV6ha0zT1OUN7TH5q0
 ieX8mrEC0kM8SC4G/i2j0Pm9CR2P7aNAo8syffD5VKTK3vvnp+46YxjTpEcM4uemq6yUD76IKmR
 7jKnkxb4FKXT5hQDQfdjBIh/wkbRW+Y6Nbf8m2U6Q
X-Gm-Gg: ASbGncv4oFARA/mvJkyt8BqYVkZbJQ9OusdeAwI+LtGrLb/xoU6czmiI2yv4ebexqi1
 x8wMa5lvANNKq/Kvs8gyiXxOPnUM5Wc+lWTL2XaCqYg9O8AQL88013AM7uRcALwWnq36x8el9nd
 hYd2kHQ7TdTbQf9sA4NdoLeDm3Wjr7ReMsCAvWQgTG
X-Google-Smtp-Source: AGHT+IGJer1bSae1hTy+VdVDgBmIxrnrLy6/1vEbuh3ihuiTHeYj5NRruSmZ30W23oHspApAquJQsquajOdAT1S7J30=
X-Received: by 2002:a05:6402:5107:b0:60c:bf83:65fd with SMTP id
 4fb4d7f45d1cf-60e73d1b918mr259571a12.7.1751746340448; Sat, 05 Jul 2025
 13:12:20 -0700 (PDT)
MIME-Version: 1.0
References: <0-v1-8c5f369ec2e5+75-arm_no_split_jgg@nvidia.com>
 <20241101134005.GA109739@nvidia.com> <20241104113237.GA11481@willie-the-truck>
In-Reply-To: <20241104113237.GA11481@willie-the-truck>
From: Daniel Mentz <danielmentz@google.com>
Date: Sat, 5 Jul 2025 13:12:09 -0700
X-Gm-Features: Ac12FXzjkeaKni9wvVsiCi9BzDFbIznXFt9RbbGeY2UoHjBPMAYPOLioSuEBQ6M
Message-ID: <CAE2F3rDcq-BQYM1yYq6RNSYSOovdoyRcbYw8Jy+BXCHLkrWN3g@mail.gmail.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Remove split on unmap behavior
To: Will Deacon <will@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>, iommu@lists.linux.dev,
 Joerg Roedel <joro@8bytes.org>, 
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 Liviu Dudau <liviu.dudau@arm.com>, patches@lists.linux.dev, 
 Steven Price <steven.price@arm.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the removal of arm_lpae_split_blk_unmap, I believe the following
macros are now unused. Is there any interest in removing those as
well? If so, I can draft a patch.

#define ARM_LPAE_PTE_ATTR_LO_MASK (((arm_lpae_iopte)0x3ff) << 2)
/* Ignore the contiguous bit for block splitting */
#define ARM_LPAE_PTE_ATTR_HI_MASK (ARM_LPAE_PTE_XN | ARM_LPAE_PTE_DBM)
#define ARM_LPAE_PTE_ATTR_MASK (ARM_LPAE_PTE_ATTR_LO_MASK | \
ARM_LPAE_PTE_ATTR_HI_MASK)
#define iopte_prot(pte) ((pte) & ARM_LPAE_PTE_ATTR_MASK)
