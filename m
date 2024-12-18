Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA7C9F639E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 11:44:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A2610E903;
	Wed, 18 Dec 2024 10:44:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="HSHR7tOw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9628F10E903
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 10:44:43 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-38637614567so2910531f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 02:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1734518682; x=1735123482; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NQPNbO4Jh28X15Px0+LkPPkbR4yLtap4Vaw9U0pvMDM=;
 b=HSHR7tOwF2k4QY/Vtrh/EA/tzrFB4zQNiaZCcJutKeEe3dHSuI/MceOsZm+oFbti9M
 rW/XUsnCT7nipvsVDIJbYv2Mqxmt9kJKaR43HSW8EIs6gO83axcRfEse5N6jSiUwPKI1
 tAnbeSTNckAgViYEHcG2WaF7LcI1kGn4nMgUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734518682; x=1735123482;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NQPNbO4Jh28X15Px0+LkPPkbR4yLtap4Vaw9U0pvMDM=;
 b=bvPlt7Xs0J92ovHQii23uskIHuAODp/nB898EpGfs5bb92NuZ0IT6AHClS/J63XpD/
 5kNz46Up1ay/uPSaaH2hkGjxjBaMgYY6O/wDdYPRLUA52mFnI7HrXbJEbIgVV/7rbjp8
 44Q1VMDRfkgJ6L6qkFhwI0tDCUQFUFV6Kl8nE9GzofCZvwjGI11LUuFbJ39WbaYg9gxr
 QmrxBJyfg/zlYMFidaRiyfIhsWDoBuEGlB0C7lK6eQBuGWAb+HLTtdMu6LRonxSjz9PR
 P/SoyiNm/V1G4PanF1yeVaUjHhhXxjIHMque9+D+VNSAkTR2MWCmaCgcTd/tLCzzVz2+
 NMPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqpzeA9gGlNpATHUK6hkZ1RGF4s0YPR9tki0cFRIwHnu8Ba7W7DO77+4mlyM3dmF7pDNifLdstVek=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/etryeqrfY+x9XdERWVSUPnpXx+mztDtDTr596CLVEvvQGeAs
 ZUWpEh5deufJdvlJYTl532OqPGL8SPmsurX1E9vMCzasdgVi8jQDDM3FCbXnw+s=
X-Gm-Gg: ASbGnctFd32I+3He9SVXkX+7+rMJ9MbXS7mLSv2tlSM96bY4/f3YUAh/F99SxWXsSmb
 wwezahgCzFly5hamoMPcY/RJA6jrYAps6bcf+4KKy9PCb3EQg4v9YYmSIGtLxJeKS0xhd3g9oD0
 /KpttC3f3I1e289ZM2PZtabWV4EUoxmV+FjBsVtZ0RD3s4iDkx1d17oNWV6yS8M6rcoh/hlDl4w
 MoVca/jE5EAATDfpymAxm6vt4hvi7bpVhH1P3I7BGwHwRFBep0vbo0pnxsfKfR6ochU
X-Google-Smtp-Source: AGHT+IHcanVPmRLlzM2e6vfR41Z6Bf/R2ewaujydkQ7EOTyW5LtKeaoeAxoDwby+iMKdhpEeJt9o4w==
X-Received: by 2002:a5d:6da6:0:b0:382:6f3:a20f with SMTP id
 ffacd0b85a97d-388e4d2de58mr2369209f8f.11.1734518682020; 
 Wed, 18 Dec 2024 02:44:42 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c8046c05sm13901360f8f.73.2024.12.18.02.44.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 02:44:41 -0800 (PST)
Date: Wed, 18 Dec 2024 11:44:39 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Keith Busch <kbusch@kernel.org>, Wei Lin Guay <wguay@fb.com>,
 alex.williamson@redhat.com, dri-devel@lists.freedesktop.org,
 kvm@vger.kernel.org, linux-rdma@vger.kernel.org, jgg@nvidia.com,
 vivek.kasireddy@intel.com, dagmoxnes@meta.com, nviljoen@meta.com,
 Wei Lin Guay <wguay@meta.com>, Oded Gabbay <ogabbay@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Leon Romanovsky <leon@kernel.org>, Maor Gottlieb <maorg@nvidia.com>
Subject: Re: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported
 through dmabuf
Message-ID: <Z2Knl1omccV-8Oa7@phenom.ffwll.local>
References: <20241216095429.210792-1-wguay@fb.com>
 <89d9071b-0d3e-4fcd-963b-7aa234031a38@amd.com>
 <Z2BbPKvbxm7jvJL9@kbusch-mbp.dhcp.thefacebook.com>
 <0f207bf8-572a-4d32-bd24-602a0bf02d90@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0f207bf8-572a-4d32-bd24-602a0bf02d90@amd.com>
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

On Tue, Dec 17, 2024 at 10:53:32AM +0100, Christian König wrote:
> Am 16.12.24 um 17:54 schrieb Keith Busch:
> > On Mon, Dec 16, 2024 at 11:21:39AM +0100, Christian König wrote:
> > > Am 16.12.24 um 10:54 schrieb Wei Lin Guay:
> > > > From: Wei Lin Guay <wguay@meta.com>
> > > > However, as a general mechanism, it can support many other scenarios with
> > > > VFIO. I imagine this dmabuf approach to be usable by iommufd as well for
> > > > generic and safe P2P mappings.
> > > > 
> > > > This series goes after the "Break up ioctl dispatch functions to one
> > > > function per ioctl" series.
> > > Yeah that sounds like it should work.
> > > 
> > > But where is the rest of the series, I only see the cover letter?
> > Should be here:
> > 
> >    https://lore.kernel.org/linux-rdma/20241216095429.210792-2-wguay@fb.com/T/#u
> 
> Please send that out once more with me on explicit CC.
> 
> Apart from that I have to reject the adding of dma_buf_try_get(), that is
> clearly not something we should do.

Yeah if we do try_get it would need to be at least on a specific dma_buf
type (so checking for dma_buf->ops), since in general this does not work
(unless we add the general code in dma_buf.c somehow to make it work).
Aside from any other design concerns.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
