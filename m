Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DA39BB6B9
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 14:52:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF46810E1BF;
	Mon,  4 Nov 2024 13:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="lthlDsCt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73DC010E43E
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 13:52:30 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id
 a1e0cc1a2514c-84fc7b58d4dso1157407241.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2024 05:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1730728349; x=1731333149; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=EkBaJUaQmNlDT9UG7F3IUEDB61PJd1lepS1O8vS2Df4=;
 b=lthlDsCtKEbrBmK0p1SlpsoOwdJLswTSLXbNi2EdBaN5//PV/480/7JhLUHtyUKdcy
 NNAdNk13H66A/FWOCQk2WdTx9yYly1Nn6E3ARBcsk+cQ8bHF502NbU6vSaotG3G+UJBr
 d73ri4j8SQ8ZgObjHTfuKSE7EvJKHdeW3fPRe7j9YTeoxLovMUlfTaYgXQg8ITwgIEUx
 pbl3KzxZovlC7AsZ71erSRLJXT/2K7oJqOnd2q07uI8RBzZiF/hPTsOk5Nbg3yV07h4q
 mJcCRvWo3mpQW4nacxVRjrg3bIFDJ2AHUsQKtEDdchlBrho9/ITVfLixr4HZlFkavg85
 taug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730728349; x=1731333149;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EkBaJUaQmNlDT9UG7F3IUEDB61PJd1lepS1O8vS2Df4=;
 b=GaorIsk5XJIUYnaqzU2TPXDL10PnkCl6e09c9B3/zQ2ZwdBkR+iNASmdgSCIMfWKMQ
 3ZZFXr7piQuNS7LO1r6rgtjfr5QkLg2u1806Uovjzl+avTP+YjYmZ3hIi/lXuyolAJGB
 P/H2VD6w7F8moBSa08XoCNpAk74cR54hrlGsEKuJ1GuDi6nBZXG/fKI87HCC6KsyvyEk
 nraw7POiV5wuuR2EQlNumdfKZ5tStzB3/Jo8AZKAsxrYCc4cG8ig2pgX+Y50sNOQ76l7
 apNdd2txcLvZJYgQY8se2otHi2l/XsgzWCpm/aY7DhVb6zZ+ckrCETtGcRXq8bJFjvI6
 rxug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMA/RUuEIwiovvKYcfky3g1yuL3GzhrHOmpqIQwBQjobwwowOT/MqQUjINbaVUVn0h/LCQDN5NV1k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/PqFhu7M8I5PD/GqDpBIOcQ11uz0eVfMZOo1uUAcpuVbsZqqh
 aZaxRJQCAi5SlgMy+fmbv9ErmwexJkEvOXM+xS+3vhXGL/C6KsNosNf1CtYNo8w=
X-Google-Smtp-Source: AGHT+IFmlPTEulo8PrBSa4hLGepjHWucd1eo0mnO56qT1Ydh9XheeGVoeKHcAHFWhX+avIDDQrBpSQ==
X-Received: by 2002:a05:6102:3753:b0:4a4:8756:d899 with SMTP id
 ada2fe7eead31-4a9543ece24mr15248394137.29.1730728348895; 
 Mon, 04 Nov 2024 05:52:28 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.128.5]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-462ad0adffesm47192441cf.32.2024.11.04.05.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2024 05:52:28 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1t7xVL-00000000hsn-2kgO;
 Mon, 04 Nov 2024 09:52:27 -0400
Date: Mon, 4 Nov 2024 09:52:27 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 Leon Romanovsky <leon@kernel.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
 Carlos Bilbao <carlos.bilbao.osdev@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
 "David E. Box" <david.e.box@linux.intel.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Logan Gunthorpe <logang@deltatee.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 Dan Williams <dan.j.williams@intel.com>,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-cxl@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-mtd@lists.infradead.org, platform-driver-x86@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-hyperv@vger.kernel.org
Subject: Re: [PATCH v2 05/10] sysfs: treewide: constify attribute callback of
 bin_is_visible()
Message-ID: <20241104135227.GE35848@ziepe.ca>
References: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
 <20241103-sysfs-const-bin_attr-v2-5-71110628844c@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241103-sysfs-const-bin_attr-v2-5-71110628844c@weissschuh.net>
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

On Sun, Nov 03, 2024 at 05:03:34PM +0000, Thomas Weißschuh wrote:
> The is_bin_visible() callbacks should not modify the struct
> bin_attribute passed as argument.
> Enforce this by marking the argument as const.
> 
> As there are not many callback implementers perform this change
> throughout the tree at once.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
>  drivers/cxl/port.c                      |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c |  2 +-
>  drivers/infiniband/hw/qib/qib_sysfs.c   |  2 +-
>  drivers/mtd/spi-nor/sysfs.c             |  2 +-
>  drivers/nvmem/core.c                    |  3 ++-
>  drivers/pci/pci-sysfs.c                 |  2 +-
>  drivers/pci/vpd.c                       |  2 +-
>  drivers/platform/x86/amd/hsmp.c         |  2 +-
>  drivers/platform/x86/intel/sdsi.c       |  2 +-
>  drivers/scsi/scsi_sysfs.c               |  2 +-
>  drivers/usb/core/sysfs.c                |  2 +-
>  include/linux/sysfs.h                   | 30 +++++++++++++++---------------
>  12 files changed, 27 insertions(+), 26 deletions(-)

For infiniband:

Acked-by: Jason Gunthorpe <jgg@nvidia.com>
