Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D475ACC803
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 15:37:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED0B210E36C;
	Tue,  3 Jun 2025 13:37:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="OmNNpUQ6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6260410E36C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 13:37:42 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-4a3db0666f2so113399441cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 06:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1748957861; x=1749562661; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UoX6ZYAbWcKDR6KFcgyyRoqI5kTXzqc7rOw8qvSUCMg=;
 b=OmNNpUQ6bjnc/gEIxVmiOezOEZwgpKo1eNY5UjlsoF5nFWWTJDZwievBh+3+qXaemY
 Xw0Wprkb2dpCrF4JI9XXkugXc/JrW8HEriSH5LRNw8TuhIR965+U/yUjFD+Vi4fsQjVN
 dxSvNs5XhXWq3pfU5Y8olInilwpusATXmh+rhc2zoJNbGG26+6RCuJWNELfMKGYKLs9F
 aA63Lxpbq/tUI1eoDJPbO1EyOH6IDUzZvDOrfFcaXtxZyecxMOCnxQeF2V+3bjGt1rz7
 yQ+k6bN9/VWhSQAHiZ7lFO6LMyc5P4vD9Mzk5/vvZd0zr9LAozOow6VuNemlwzii+AWI
 3Etg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748957861; x=1749562661;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UoX6ZYAbWcKDR6KFcgyyRoqI5kTXzqc7rOw8qvSUCMg=;
 b=FAFZktSF55t0tRVWVmQxoVHF1KsB8yD8K/O2CfORSnw56k2oUn7kjY168xRZBMY55o
 SamqFZS29gFrZG8oSkPe75KMgEIoIPYjyFeXjqobQezrdml+d3ADypmmU0Q5Q4pL+ZGi
 HLXqivkNpLZly8wepxqBE0sTgqVu+OCfMDlF+92pUZEIz7vee3XV77nmtYmuIUFNrgHe
 mq1c6p1aZBDYWvb74vzZEIt70DeuNQYrv3keRebFcD5wPpM+4iKE84NGe0X29DEd6Llu
 uGl4SrzUo7s10wffX41WixXjrwRY5bKmVGDmcppLykGZoqDD9GRXur8/bSTkeB+Qvu1Q
 UC4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJMz3Dj3QjJoNi8b/VDxDNtg2sH2NRb0K3NCrRbuX49vmqS/7ykE8IkWRqiLQmQgHa0kR1sRKErpk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxE3/k6sXpgjT3ox513bRTa5OEv83EwPFXqz8s46zLHWbrTPtl
 B7vCvCSB4aBHrM04S0uLGulTEFpjhacZ2+MuC0IDlkXCNjTdt1NQamEA5QXCDIVgJ1I=
X-Gm-Gg: ASbGncuFmq+K0GMgYn8cUyBirRpCzVTbJ4HBPekbRJDtRBsp1Ng/eQqmySpjuD1z4RL
 YmKlB/PVc/Cp37ZYQicR+XlpNBOLI4LrJw57gmrBitDLDyUTwkYybHxPLPvMYlEubTUj4Lrvl1E
 nLcx7R2JCppGJyGS6XmXfhlf2J1RQ8UzJ3n0o1eeJJqDqCkpub7IQih9dw8kmV3f5XBiL6GHSym
 +2QzDxIveMJnBp0yiAXvMd6JXFFn3ZlGfkIJBII4XZcMYlVmxWPhjdwGwhHYvMowXXGDbbM0Z5Y
 yS6nqCndGvfkR5RMPO2q+2m0sYVhTurEhNxn9BzDY2jnaKlnmAI6dm6ve2V6iEHqx0NmJQ8uB+u
 H4HKLJPW/09qbaUdaFB6KR5Qm/UmH2tBiYFe+UQ==
X-Google-Smtp-Source: AGHT+IHIja21FGplZEuqybwyfzBxoI5k6ggct08qhelvg2n2Sr3vDQGi+qZrCCr84f/KmAHse8r0Yw==
X-Received: by 2002:a05:622a:4c16:b0:4a4:2e99:3a92 with SMTP id
 d75a77b69052e-4a443f2d1a2mr265367291cf.38.1748957861491; 
 Tue, 03 Jun 2025 06:37:41 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.167.56.70]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a435a36e1bsm73924021cf.62.2025.06.03.06.37.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 06:37:40 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1uMRpk-00000001h5v-1tYD;
 Tue, 03 Jun 2025 10:37:40 -0300
Date: Tue, 3 Jun 2025 10:37:40 -0300
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
Subject: Re: [PATCH 04/12] mm: Convert vmf_insert_mixed() from using
 pte_devmap to pte_special
Message-ID: <20250603133740.GE386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <171c8ae407198160c434797a96fe56d837cdc1cd.1748500293.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171c8ae407198160c434797a96fe56d837cdc1cd.1748500293.git-series.apopple@nvidia.com>
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

On Thu, May 29, 2025 at 04:32:05PM +1000, Alistair Popple wrote:
> DAX no longer requires device PTEs as it always has a ZONE_DEVICE page
> associated with the PTE that can be reference counted normally. Other users
> of pte_devmap are drivers that set PFN_DEV when calling vmf_insert_mixed()
> which ensures vm_normal_page() returns NULL for these entries.
> 
> There is no reason to distinguish these pte_devmap users so in order to
> free up a PTE bit use pte_special instead for entries created with
> vmf_insert_mixed(). This will ensure vm_normal_page() will continue to
> return NULL for these pages.
> 
> Architectures that don't support pte_special also don't support pte_devmap
> so those will continue to rely on pfn_valid() to determine if the page can
> be mapped.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  mm/hmm.c    |  3 ---
>  mm/memory.c | 20 ++------------------
>  mm/vmscan.c |  2 +-
>  3 files changed, 3 insertions(+), 22 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
