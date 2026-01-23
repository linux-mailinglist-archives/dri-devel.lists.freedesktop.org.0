Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPJ3BWuic2lqxgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 17:31:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6379A78869
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 17:31:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9543810EB5D;
	Fri, 23 Jan 2026 16:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="ZO5RmoSV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F97010EB5F
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 16:31:34 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id
 af79cd13be357-8c6d8751c88so263655185a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 08:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1769185893; x=1769790693; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=871+kMuUuN8eKawcT4NNcOEOt4uiGeIzveYuD9+CVek=;
 b=ZO5RmoSVLOiysFFU8LQmu8CIzve35nyX9KrixGYVrXljHmjYr77pxbQd1IQJbIlQDd
 U09NyFvmAijZU6g0MUKDSF2UJN5T7mFNuU4epMCQ9wtQXfXoU+5gTb5ivKUFPZStLN34
 zaU1lUXd7gBAp3nBU4WiRfdCGwBdIXlMyqjJ53sfrnHv7vrJ31I5pIxRwbkRO+V+nnqs
 dIMj5htLqZ3T09fBaU/V7uPZzxdnLu2/rlTXHn71L7xke6zDk7GEn+j+N/dNopNVgIi4
 oe9a6aI85sjds0RU6ndeTBJFdxZquIAyrE6pz2rI360UHOyTKKQ2ICBsTK416Z+RQcLe
 5BZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769185893; x=1769790693;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=871+kMuUuN8eKawcT4NNcOEOt4uiGeIzveYuD9+CVek=;
 b=ONi84nR2JDJ1jhFH2YvLk2xB3Z4uMMDDF03WFEZlcke6oDymRWpjp6QDUjjyeG6ftn
 oJjNGzEZoNZbd8c/gbAVGfQvxBB7JOOTGQyXHTzaRCdh60nzX2KQ3w6UySbkk2d5Ey6U
 Sw/wzv/YNcxiCYiJgdDURa9IE144vOzZ4JktIUPmbqmxgvi41CxWF2fo17SzG6WxFkll
 9K51cYkx6SfxCz328rDnafFR2bQ18FJuP5TGjxsgoiABFNBockmtOpgCULmgiriGpr5+
 NiuSPVATaCOppYm3rcQDefjDquMPriREbkG0l6uY/oszZ3YUvu2fzCxF4Bkfc6o5DOVI
 jzSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVUpw9x50o9nbMbCFiepa+6NIEAKDsZ8W9XfHPVD9EgYdLz8NhrMY0WFVikvzKSvRgS4uQhYyX5ok=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHLS4ofdXgoolNDAou8lDw37CU0RFTwD7ZELx3OKSWpsR6Nw9z
 +Ph7uHXhMMUibnj87cAx/7Ut6yeh1QJMbaCFxshO35/TsURHCT+/tTL1ff5vn/LhRZE=
X-Gm-Gg: AZuq6aJmdnRfKrWkTq7pa2T0cBdbn6zb/1OHjCzH9sZWOb1I2NMeLNs264gRVJnQxX0
 +pHfbTdwC76oqYRZciPYaoveP5WiiKafVvboszincHj49SqaZFoneBeR9qT9zbTxC1NzDMe4mRI
 M2wjghqtp0lYgYPRWQEfH3dMxQNQxPRtZuUWJuMN5B5EfM0kd0B1wajCnuMjfwTZYYoqYcZqyf3
 AQrs/hjh0aCgbkRIeED+tVH5dVkzHq8e+QtbfrmzZJpv6MJtVl8IQfbu3UAW1lhzmty0IgAvUVI
 5Frk3ym6MFHaeioZK6FSWdzUBFSc4VuTNPNAZbwlwnREm1HGxTRwZiXdqbCF5eIhCFONFIXyQk/
 gV1K6et96WUoDKCStz/9H5q8heUtipe3pCfF+EOVh80HLfywSQIWno7aheJuiWXXv8ctf+SoByp
 em/NYFqExzQUppAlXbSZPZs+9UZdiiJ8/sfXsm06syJItu9+IYqkm/usMoaKE6BTR6b5o=
X-Received: by 2002:a05:620a:1901:b0:8c6:c9a2:504d with SMTP id
 af79cd13be357-8c6e2e48438mr431308085a.59.1769185893221; 
 Fri, 23 Jan 2026 08:31:33 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8949193cdc1sm19709316d6.47.2026.01.23.08.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jan 2026 08:31:32 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vjK4K-00000007Grc-04II;
 Fri, 23 Jan 2026 12:31:32 -0400
Date: Fri, 23 Jan 2026 12:31:32 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Leon Romanovsky <leon@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Williamson <alex@shazbot.org>, Ankit Agrawal <ankita@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 iommu@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [PATCH v3 6/7] vfio: Wait for dma-buf invalidation to complete
Message-ID: <20260123163132.GA1641016@ziepe.ca>
References: <20260120-dmabuf-revoke-v3-0-b7e0b07b8214@nvidia.com>
 <20260120-dmabuf-revoke-v3-6-b7e0b07b8214@nvidia.com>
 <b129f0c1-b61e-4efb-9e25-d8cdadaca1b3@amd.com>
 <20260121133146.GY961572@ziepe.ca>
 <b88b500c-bacc-483d-9d1a-725d4158302a@amd.com>
 <20260121160140.GF961572@ziepe.ca>
 <a1c55bd8-9891-4064-83fe-ac56141e586f@amd.com>
 <20260122234404.GB1589888@ziepe.ca>
 <20260123141140.GC1589888@ziepe.ca>
 <98b74c7a-44c1-49ba-997b-bbbab60429ba@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <98b74c7a-44c1-49ba-997b-bbbab60429ba@amd.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[ziepe.ca];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:leon@kernel.org,m:sumit.semwal@linaro.org,m:alexander.deucher@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:kraxel@redhat.com,m:dmitry.osipenko@collabora.com,m:gurchetansingh@chromium.org,m:olvaffe@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:lucas.demarchi@intel.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:kevin.tian@intel.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:Felix.Kuehling@amd.com,m:alex@shazbot.org,m:ankita@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:virtualization@lists.linux.dev,m:intel-xe@lists.freedesktop.org,m:linux-rdma@vger.kernel.org,m:iommu@lists.linux.dev,m:kvm@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,suse.de,intel.com,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jgg@ziepe.ca,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[34];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.260];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 6379A78869
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 05:23:34PM +0100, Christian König wrote:
> > It is illegal to call the DMA API after your driver is unprobed. The
> > kernel can oops. So if a driver is allowing remove() to complete
> > before all the dma_buf_unmaps have been called it is buggy and risks
> > an oops.
> > 
> > https://lore.kernel.org/lkml/8067f204-1380-4d37-8ffd-007fc6f26738@kernel.org/T/#m0c7dda0fb5981240879c5ca489176987d688844c
> > 
> > As calling a dma_buf_unmap() -> dma_unma_sg() after remove() returns
> > is not allowed..
> 
> That is not even in the hands of the driver. The DMA-buf framework
> itself does a module_get() on the exporter.

module_get() prevents the module from being unloaded. It does not
prevent the user from using /sys/../unbind or various other ways to
remove the driver from the device.

rmmod is a popular way to trigger remove() on a driver but not the
only way, and you can't point to a module_get() to dismiss issues with
driver remove() correctness.

> Revoking the DMA mappings won't change anything on that, the
> importer needs to stop using the DMA-buf and drop all their
> references.

And to be correct an exporting driver needs to wait in its remove
function until all the unmaps are done.

Jason
