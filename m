Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C2BACC7FB
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 15:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 553CA10E205;
	Tue,  3 Jun 2025 13:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="EIx0xlE8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8E1710E205
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 13:37:01 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-7cadd46eb07so557337485a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 06:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1748957821; x=1749562621; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=M2tOvYIRYhJ3zgazeT9iy9SxHIfkqCxujQJZWAlLZ4g=;
 b=EIx0xlE8wYRNzIUKoT0KcM0pi+EL4K/gFaAjaxGlimkjjmubkICjstZzXCqJLrF/cl
 RE8EeNVrlOWXg2BjaJuoLlygfMZoCCgKYwXrEgnlDB5IrBNBcNWzmiF8m6Wj4JcERqTy
 AFJA2a5OLOCqmwB2FRJAr1StLDmTc20nNVBa92g1/yliWP0a8WtEHWQKCcTlZoP70BxA
 VMJHsVDNRXugxpzbHghSr5dCwBvG1SYeLdUmhmUJcI577/oVpnIlOS+tBhbdiur6mYqX
 oSEdKBSsEocFlg18qLarQ/erzmbhy28tRCtRLeLWl0J14cNKXQIYR0aJ6T01Nw4hmKyT
 qd2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748957821; x=1749562621;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M2tOvYIRYhJ3zgazeT9iy9SxHIfkqCxujQJZWAlLZ4g=;
 b=MuTC7sYSQKo3MiUICcmTxbVl8VZDJBapWBsmpK+b62r44xEkCQmDnbIdaSziN/L/Ol
 ODpOKvXVEbGIPKkWAQymdkxdAStKGeU/EETxrUYMtc2BIzW1pIwZbpU1fBjHc9zi+Flm
 DMRkvGtywS/xfEeyiD6P5n9mQO4IrnBVLK3m+GcpfCSzBIkpuZnndUjbjLF67v+eyUOV
 gpXiVsyr+RmMfp7AvfiAvIeh75NOBt4TLZYjzt3JUWpKJ+iP1lApy/ashRK+OuxW7WF+
 x1U0QukCThJPxCY6Oy3ubFJjKdlY6I8mv7oOfZtxdXkS8NJCasnczfnfeg1HKLiRPtaC
 SCaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWit4xSLaS1GMlP/bVbdeVLw0qMdMcQl/BgjPzG2BPUITf9+R93NHEk5uD1AK1qVodbj/4ZU7/Eai4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YynOMjPr6GsI3njvYdFVdhjkqyy7+ZCl5YmqBydT6NOxe/RS4k3
 2IHRFiakZnhRmQRjl6TJV5lsnMNNtYfo05gDAJ8PBxtGNACQtDN1ZagY3HDt53Ty+Hs=
X-Gm-Gg: ASbGncvD0Ch6ByMAEcCpTCmE1KLdsvlZ7Jp1tJhiLIniH2dLtocs2YmCr6TDoJlTGys
 POp3AgnBR4BNeNAhnMIaZ4YyRg28HBBpbxLukHZ2C6vSeW89ap0mByNf3o3bDQPBq49wM9z1C1U
 3IUYTX6zdUWwzadYqQykVQszTDqTNOi5yfCmbhFN9Kg9MxytNqM9uHn3v6vcvW5ecKjdOE2Xg55
 23eNH4fZ1ve1NAxEcKmSXOcDlfsigtOHbMHRrSISFr9TVSlfKQmrn3odiDFUJCdW7JA96EHYB2o
 uTUOCiDXR58iihi1rlbgiEDkpgbxGCVWqixSVFb4Do/vkH05yPycKtviHRjorYL0Jm0+6J9pXe3
 SSqjhXViPgRemRIoVBOvRX4xWx9E=
X-Google-Smtp-Source: AGHT+IF/1nQKKWghBymIv6kapapYp3T/T+mDb2uBcjAQYD1rkFwd/p2CMx7wy82AG8RXeUKzw729SQ==
X-Received: by 2002:a05:620a:4408:b0:7c5:3d60:7f8d with SMTP id
 af79cd13be357-7d0a1fb91a0mr2626422385a.19.1748957820692; 
 Tue, 03 Jun 2025 06:37:00 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.167.56.70]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7d09a0fa38fsm842635185a.35.2025.06.03.06.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 06:37:00 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1uMRp5-00000001h5Y-2rWO;
 Tue, 03 Jun 2025 10:36:59 -0300
Date: Tue, 3 Jun 2025 10:36:59 -0300
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
Subject: Re: [PATCH 03/12] mm/pagewalk: Skip dax pages in pagewalk
Message-ID: <20250603133659.GD386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <1799c6772825e1401e7ccad81a10646118201953.1748500293.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1799c6772825e1401e7ccad81a10646118201953.1748500293.git-series.apopple@nvidia.com>
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

On Thu, May 29, 2025 at 04:32:04PM +1000, Alistair Popple wrote:
> Previously dax pages were skipped by the pagewalk code as pud_special() or
> vm_normal_page{_pmd}() would be false for DAX pages. Now that dax pages are
> refcounted normally that is no longer the case, so add explicit checks to
> skip them.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  include/linux/memremap.h | 11 +++++++++++
>  mm/pagewalk.c            | 12 ++++++++++--
>  2 files changed, 21 insertions(+), 2 deletions(-)

But why do we want to skip them?

Like hmm uses pagewalk and it would like to see DAX pages?

I guess it makes sense from the perspective of not changing things,
but it seems like a comment should be left behind explaining that this
is just for legacy reasons until someone audits the callers.

Jason
