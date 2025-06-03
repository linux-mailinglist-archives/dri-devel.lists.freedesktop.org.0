Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9406ACC863
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 15:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC6B10E651;
	Tue,  3 Jun 2025 13:51:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="aOQaJEit";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF55310E651
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 13:51:02 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-48d71b77cc0so65876281cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 06:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1748958662; x=1749563462; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YjoJn2Zm/22QHFjhWW1StoVgQrArf1QtKVAZNo0G9LI=;
 b=aOQaJEit66suJvaOV0RIiqOGOZC/eqkhf/LUpKV4f2v3KyW/uKQ9z0CmqUsbaf/BTn
 raGpwYSh1e7ZvKNHENAVDjij+bXiSdMrIc1TZLCcSLhH2mhJE908PS+oe5vLgXnAUkuc
 2nU7ux2UXm/rxuz0Xa0n5siy5oSTvlUVI/OUKnnZKju7fQo13jtjDKJzqQ0+jam/Aoih
 jujqFoLpSbLA2HjFUGRVH8UWQRfnjih+6ao4ZHAdkRQ/kKPeeQ3D52cjyLxtQFsQywlF
 bnV7SSgacs4BtLKVvYB/7XVo5if8cZ+GqnNZbs87wkzIwfGmc+k3Vy/4U4GKfaiD+Ej6
 wTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748958662; x=1749563462;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YjoJn2Zm/22QHFjhWW1StoVgQrArf1QtKVAZNo0G9LI=;
 b=qdq6u747RG+mtE7zViEqbHzSuvqXrJX10LIw0dnb+hpidd4dZkz/oNpbL1H2rfdxz2
 igWE3at/ZaJwvie5SlrLlgjuEOpMOdkB2FxKKnMXPuVNcZnGCEkhF/IsCBVMWPn0wiRs
 vv44GO8Biamc7yTIbCLuOEys3CoSAfM94JlemmrRFfi/ba1JfuWagBaVUhBps1oc0E+1
 GP1fBwgsQ3QtOBfL0EcXqFgHRzHRUfdijk1j/w5dYK8EfNPe1ctcXK6kjpPwo/jXq+aK
 ZXZ1sjL+XjrKvRFBybEGttK7x+zQoVuo7rNC7cy3TTXF6zyhs9kK/Cwbv9G3H6CY2d7C
 5Fqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqJZEggS7z1CfeapDLKNEsTsixw+S5bOx2EqVoi2B+cB75ayr+joC9v9Hr26YaX/ZUwnGD3th7xOs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLGgKboR6js6taMd0zMGdOn+I0YawyYOYLvkwZrRp/frtcbQdP
 5QXrrXo80U/hBoHi1pyNs5v+gfZZiUjzmT6VOBZAI4jsZ4dpo0pwtfMwJ2EDfEK8b4IDWWY3Cc9
 fORfe
X-Gm-Gg: ASbGncupCjnunEimM3TTw8oT70EQKCHDDC36vZaIhiECxyZVbDb/BQ/x33mQIIrHHjQ
 B5myK37q67kMSgmki+YYIvhF0mTJLtjkNZrIMkbvx/Cv1QLd/W081Wze7BSOm5ZmL3sxyMGhDGP
 CGyjKDLg5TWtNZz5YItIY9k0qlgjgrL+NPamL4m50dRTWSXHo5Ec7Tb8burSJOI4fnKpzX95jzG
 aHfWRulZkZ4z3sLwVO/7mOPHFv8xEwIoyw4ntvlrl1l3T9knxSqG1+G0lDHRoYQJu1ci1FBl10p
 AoBLBDIWsh0gi1UsMuo8QphgsVeFGHVMMrCteU1PiKII6Ns8D55BUO/M0fBgTxJmuebxCP6bb+f
 YXwDdFinoxsFoCHNUVDs6PLtbHRGUN4cIp6fYeQ==
X-Google-Smtp-Source: AGHT+IEFP32FP1kWWCcJZHDROTyLVsjrCtV3bR6kiIwGVnTYe5RPt72l9Jyf9JX2LfFifGppycDP9g==
X-Received: by 2002:a05:620a:4629:b0:7c5:3c0a:ab78 with SMTP id
 af79cd13be357-7d0eac62c8fmr1708400485a.14.1748958650816; 
 Tue, 03 Jun 2025 06:50:50 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.167.56.70]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7d09a0f9925sm841658185a.41.2025.06.03.06.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 06:50:50 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1uMS2T-00000001hDC-3YG8;
 Tue, 03 Jun 2025 10:50:49 -0300
Date: Tue, 3 Jun 2025 10:50:49 -0300
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
Subject: Re: [PATCH 11/12] mm: Remove callers of pfn_t functionality
Message-ID: <20250603135049.GL386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <4b644a3562d1b4679f5c4a042d8b7d565e24c470.1748500293.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b644a3562d1b4679f5c4a042d8b7d565e24c470.1748500293.git-series.apopple@nvidia.com>
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

On Thu, May 29, 2025 at 04:32:12PM +1000, Alistair Popple wrote:
> All PFN_* pfn_t flags have been removed. Therefore there is no longer
> a need for the pfn_t type and all uses can be replaced with normal
> pfns.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Yay!

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
