Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 534F4ACC7EB
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 15:35:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA1110E8DB;
	Tue,  3 Jun 2025 13:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="VxG3XXik";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B5210E6F7
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 13:35:11 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-4a44b9b2af8so23971151cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 06:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1748957710; x=1749562510; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=csMjX6EgdDvsoUroDDkC2t6M2H8xOJU7irccfVA/OHY=;
 b=VxG3XXikDU86fydD0yO07XEAbHe7NMct7sSJSm98hx3rlj8B+cGCfjsDJRAWu1AtKO
 xHLWnXR5aDUMtvsLFh9dJXCES/Dq2OBNpXvsk95VLOg3kki/If15gTiSX6xoLTlNaGWE
 YxlkOu2sTAAgzeguwjEW0Xj3pOSPSzg1DKzbobqpH0k/zNhLt04wfh7kifbNwQtcwXQ4
 oPYkKhlpBgZWdfH6iEG8MJ9RSoDviwJ6r12bLgNT9OjuTKes4LHtbo5PdWuGUcJgQlFJ
 5l5RG7xDiJBXMOnTNrKXCjDIzt83gPbsptk+rlcxpJuuXBE+CfUdnaOJ56YJlB611wwn
 p+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748957710; x=1749562510;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=csMjX6EgdDvsoUroDDkC2t6M2H8xOJU7irccfVA/OHY=;
 b=RY/ceAE78fj8FF5+m40hU4HpVtmrU/hIrZruMKJJw3cu/9HETjqnMwKMbEVsQ8oFHE
 xAKc4COSEpwzMfoaAPg+nwUiPJDjnyqXB4MibSsRI3MuaqxKwn9qMKu7EG0TSzl4zu+b
 ndpHLtCo0/xjPNKTVLkXdxvu4v18C/wKzRLZLtDko3618TE3mgv99FnsttsiSnCFNKj/
 qN1B/8CGPWy38f0aMO56i6NIycge1kyFzpxcy0AkhHV5HLDah5Z75RL/ncO6nWFjQeL9
 RKEOMCOE0g6ue37MA3gCvN2qkHjjRvYM85SjmzGDi0eqhL1ndciWXwgVMkPKIzys9fVU
 ZY7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXu4k+dPOUjNCObTFfwQZ2SHDopYFObKDNhOwvq16sTUbE1K0E8OO+f8hCdeeJ85apqPAKoVXEZ4O0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxW8Urn0EmxChmYvWBzeKRzHgcJ2iBD7mb+pJMRxueaNwehFPAR
 WErQRm1qiSDda06fba+Hhz9OJoLGdSKkR3gCeywc3sSGkDrua2MMc9i5c14wtDMebiI=
X-Gm-Gg: ASbGncuLMrXvWDmZAn/5crUmn/1pfEl1eNfehDELh+UJI15L6gHJOk8OH+13Kreoxze
 jBMHNuWH0D9P5pDtRY5d76AR3XPx8udIfKqNH8Lh1jzW3IW2XxwdpshT7PYMzS1439RMSB26hK4
 f8jGsRRANSQ5qVeh4bNPhpT/rJInsDYRbVaInYdQuWAv90UQuFWWhbeogk80hE8xBPpOSfxjDrY
 676CUeB7m5v4uKp5OwmOxJvMnCvFXpDuvg+4Glc2Up4xzA9B7V5OuIkWSuQgui4MwJzRoEp1LE/
 +hwyJ8oAnFj2uRD2KWgB5DQ9cagDaB+oRMFhoKTK5qSpH5ngvGLegTa/EydnmMXScTRd44MUAdH
 gTvLTjg0+ucc8BqFFPFjpT+bNL/N3t2cWjrCVWA==
X-Google-Smtp-Source: AGHT+IGTO1Uq6qWKkHjHjzXPtbeutCQLStskBTpgABiXf8IiWIF7+BRGzTPM/WsKdaJBbv1DscVTNw==
X-Received: by 2002:a05:6214:d87:b0:6eb:1e80:19fa with SMTP id
 6a1803df08f44-6fad9090760mr153489766d6.1.1748957710547; 
 Tue, 03 Jun 2025 06:35:10 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.167.56.70]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6fac6e2fc45sm80639296d6.122.2025.06.03.06.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 06:35:10 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1uMRnJ-00000001h4R-2OPU;
 Tue, 03 Jun 2025 10:35:09 -0300
Date: Tue, 3 Jun 2025 10:35:09 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
 dan.j.williams@intel.com, willy@infradead.org, david@redhat.com,
 linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
 balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org, John@groves.net
Subject: Re: [PATCH 02/12] mm: Convert pXd_devmap checks to vma_is_dax
Message-ID: <20250603133509.GC386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <224f0265027a9578534586fa1f6ed80270aa24d5.1748500293.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <224f0265027a9578534586fa1f6ed80270aa24d5.1748500293.git-series.apopple@nvidia.com>
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

On Thu, May 29, 2025 at 04:32:03PM +1000, Alistair Popple wrote:
> Currently dax is the only user of pmd and pud mapped ZONE_DEVICE
> pages. Therefore page walkers that want to exclude DAX pages can check
> pmd_devmap or pud_devmap. However soon dax will no longer set PFN_DEV,
> meaning dax pages are mapped as normal pages.
> 
> Ensure page walkers that currently use pXd_devmap to skip DAX pages
> continue to do so by adding explicit checks of the VMA instead.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  fs/userfaultfd.c | 2 +-
>  mm/hmm.c         | 2 +-
>  mm/userfaultfd.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
