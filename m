Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2287ACC86B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 15:51:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA7E10E667;
	Tue,  3 Jun 2025 13:51:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="IONgRPKg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AEE510E667
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 13:51:24 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-4a56cc0def0so46594911cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 06:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1748958683; x=1749563483; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VzY+cZCL0448RY0GID08t4arF/zf+2+XaBNqbHYkIpY=;
 b=IONgRPKgdQ60o8DKY7tTFq2Vw4sWL4ZVWG1xz2VpB6299j/tjUKR5i7MybWGL1ZzdH
 /aNaHBDrGNVT1uzkIymvqOwVITsBkGCDUPZuof0erP60LX6D1WZx7KgPag5AugiwK+60
 tXjM1zZZhxjS4XHSZ8VJ+Qt6KGS1+nNOCOP/fU10r8zx9LoHdbcix+O/h7Ev6zrpHUGB
 gLzeQdUGk8MxF4EFUfSzJvF/DKNLo9EWwa7MFl1Bh9j/gDbI9sC4bgPN19+ooyBDw0Lu
 +wUBdg9SjGWhXj6+I8S/U0naE2pHoYciSPZraBtWc2P2WHZ3nctIcqSGYlVPEYDPcbvK
 Ebyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748958683; x=1749563483;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VzY+cZCL0448RY0GID08t4arF/zf+2+XaBNqbHYkIpY=;
 b=rEdc6C+rjGwlyhqgyppKpfoQbfBy3EL4E6jtZsD2Wp46QdNKHRuzMNj4FZPUpujG4P
 NxggNLAm25W+TBe38c5RjvQyWqJo0VrVs5wsxzH+IGqC4jzvjKo7kVAw/6l61kkUbyps
 keVpx8rbdhw7bUvWbSiUwrXZ3s7MRez+Jdxyxsjq9Mz9uUyHejKYqJnpkNjCZ1fDsDnn
 5Apw3UBc6SjCG+IyFUZIyVeEEzbKtd7JqP8Tm63WTRdegkbncpUKlOr//LVtw2rLgkiv
 GWgdEYliZfTGJLPgXY2Itx0NT1GcajDTEKL7zvccSyyUB0KHCXj8hraf01ShFUZA/ODX
 FNZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdhJQ1kxAA9h7fGWJLhc3QckUDQZ8nJtwo3yreJ+D2CRzxeBByi+52U7kRlucXSDixiP4/vZjg4kA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDXhfrs3K3BUVfekC1qjpWtJfndtOmRdjN6x1jNZ9gZe5UraUX
 kOuZWfj1tRNrj9AKHmTvvWMabgdUbrkeHiINrNrEwlMjPfTOaX96id1SzrULW7YjBTgfOQd1qUg
 3+5Xf
X-Gm-Gg: ASbGncvNdIQgcuv6YkbtkT91yHJ6M4i5Ye4NfIgkG4nkoWMfd0BItQdYvQPXxwXjWwo
 cD9ntKnc5BU9wo7I1fLlns/U0ijKozSj6QLaTbLNz2KmgcKWVO9k5VuhQscHCZx52/7SGSN5MZh
 2tzkMajojGngWY9jNMskyZPFIsPMXs20WQQOhVZjuY7Q5+6iZGJFoZ9TqBIqee4DdpNLMqaiFlk
 u8Sg2yJnEenkEgH4LXy2d11vmEKZEhBmLl68WVBY3fDncczZls/SGkuGUkMYW6edM2BOW3J16yr
 qPV+kg04dbKBjpMP+takpLLsMwRSLrm/O+NYzBA6wh+YROkgcO9PUdrHkEW4lec/0HQIa7fq8QG
 qpOdXEw1fL6euQ5N5QcvR3JOAcg74++sSnQgK5g==
X-Google-Smtp-Source: AGHT+IFvqH9ubcC6dbv0UqQGW5DGDtp+BZ9QNaQHwHo+bs9Vg0oCfSh3AzQ5xeJI5fTattmwccxXPg==
X-Received: by 2002:a05:6214:2aa3:b0:6fa:caa2:19bc with SMTP id
 6a1803df08f44-6fad916605amr159392986d6.44.1748958672893; 
 Tue, 03 Jun 2025 06:51:12 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.167.56.70]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6fad0495cf2sm68040826d6.39.2025.06.03.06.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 06:51:12 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1uMS2p-00000001hDX-3xh9;
 Tue, 03 Jun 2025 10:51:11 -0300
Date: Tue, 3 Jun 2025 10:51:11 -0300
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
Subject: Re: [PATCH 12/12] mm/memremap: Remove unused devmap_managed_key
Message-ID: <20250603135111.GM386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <112f77932e2dc6927ee77017533bf8e0194c96da.1748500293.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <112f77932e2dc6927ee77017533bf8e0194c96da.1748500293.git-series.apopple@nvidia.com>
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

On Thu, May 29, 2025 at 04:32:13PM +1000, Alistair Popple wrote:
> It's no longer used so remove it.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  mm/memremap.c | 27 ---------------------------
>  1 file changed, 27 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
