Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJePDKa5fGk0OgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 15:01:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE8EBB6E7
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 15:01:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B1510E9E6;
	Fri, 30 Jan 2026 14:01:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="bkuul8n7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78C610E11C
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 14:01:02 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-8c710439535so170114685a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 06:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1769781661; x=1770386461; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=RZzJd1rUXnKgbbFoik2J/HwA+Mcwjh2UI/kxMGq+fms=;
 b=bkuul8n7Q1FQ+fhJ34zNUQldl9Mi09F1DLoaitfXg54pb0lTA0U8ZZkpVRkb0hGt5n
 GG0sbYa+45QlOAyuNiBhfUiU7Y++rW7vCgtuYvrsi+woFf4L56mSxBLJxbw7oTGAy+OP
 YIQaWnpqxWQHQC7GnWi1DItg4PtB6lYrwixh+utDBYx/rykZaOQxjLryj4A7bGSJuxdU
 BYZbwdAz9Xj3aRz/GjdJ8yLWIdOmt/ORo911OGOkL5Wf04ALG6Ju7amZqon3CiH8afnT
 H6yAU3wSV1UMbzx9tYT28qw9bpDWPaQbhwA0AqOKTXtMmXKpjXyTv1sWkB1oMgGenn4L
 xHuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769781661; x=1770386461;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RZzJd1rUXnKgbbFoik2J/HwA+Mcwjh2UI/kxMGq+fms=;
 b=N6y8W3kEyTZNsC+GGHwurW/Rcl8vUWGKZSXRFQtEBAdzIw1VdMntjOyj4puVh/rj6g
 5zvh4x5eQx0OH6O1wyCv58dlKAtc7El01gxeQG8Pb3+AgssnXm3jzYVWto6IgVykwMAm
 e/URYRzOrntaQvtBIiz/yjjzZmODach+ZobhPIPaC9FZuWPauZjH5W2xrKisxAtb91z7
 x5FChQsTtwoPDMx8GM5rmik3oVmHA7JupL9O3sQHhI3LssTCq6Aattd15994WXa2n7d/
 21vh+hk2CvqtsbD6hnznFZpyHYZMp0QBo/EwdaxYdDYugsnpko5mNU1GrglLpU1i+yxy
 2i8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3AamxP4SITKEfdAeJLmD4xHuB8h3YegJRYd1SfFTmgU2cfGmEYe8ST13ef5trNJpAYpl8klPOCiI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyW3A9IYi9V3K88bMxKxKW/n5ZKlbpyADUMEwVRzb/7fBs7R/dk
 3+L5ld1spBfUrdpxZ7RbTXN8qPcnTsdGXNhjKLl0+oTQuOtZgwFlIbqDGnO6NQKxDdE=
X-Gm-Gg: AZuq6aIMemNaGeZh/SpGMBB/XTNm+jkZprtrceGMf+D4U6MeiAhxa7jHPcEGa6OASxd
 eOP1kfB2broV3wg5LDLUbyJkEL1K6nSbCLN71IReADe579GRL/nkAYpW4MtB63Y5u4C3DcWfF7q
 Mva4LR9MxlXbkkylWfEUCJWzaxdOwQ6DTEBrS2//YYTfKrkVJKJr1pxb7AyQWpPgBm+hmZDHcJc
 gUKVIE8r6OwlT+5KdxOLXORpdlaScG36r+Na4wH5pqQz7lCBRGAyky9RcKFE32C8H61VvJLtC6a
 M/FsUJgtzHD5/QPvPnYgmmK1Suq/vWXC9Ml+lmbeQvXy6PRNe02DflNlNz7z9chYIfZQOXY16Um
 UN+Nvsb1oZvPcSKM0/A95AzPV7VwRyJHbspGCJLuGeya4NrAYHp/fZzflkx8Qdn8eHkQNvB6CdH
 bwLrhWRdZSMMcxpAfO84H5uHAYWbviPom+s9FMBoTguPcasSOzaWFM7N7+KX3mFv3dVs9sb4kwm
 Qi4ZQ==
X-Received: by 2002:a05:620a:290f:b0:8c3:650d:577e with SMTP id
 af79cd13be357-8c9eb224827mr368793585a.4.1769781649371; 
 Fri, 30 Jan 2026 06:00:49 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c711b95e4esm700915485a.15.2026.01.30.06.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jan 2026 06:00:48 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vlp3H-0000000Annc-1AWG;
 Fri, 30 Jan 2026 10:00:47 -0400
Date: Fri, 30 Jan 2026 10:00:47 -0400
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
Subject: Re: [PATCH v5 6/8] dma-buf: Add dma_buf_attach_revocable()
Message-ID: <20260130140047.GD2328995@ziepe.ca>
References: <20260124-dmabuf-revoke-v5-0-f98fca917e96@nvidia.com>
 <20260124-dmabuf-revoke-v5-6-f98fca917e96@nvidia.com>
 <b4cf1379-d68b-45da-866b-c461d6feb51b@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b4cf1379-d68b-45da-866b-c461d6feb51b@amd.com>
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
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,dri-devel-bounces@lists.freedesktop.org];
	RSPAMD_EMAILBL_FAIL(0.00)[leonro.nvidia.com:server fail];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ziepe.ca:mid,ziepe.ca:dkim]
X-Rspamd-Queue-Id: 8BE8EBB6E7
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 09:43:22AM +0100, Christian König wrote:
> On 1/24/26 20:14, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> > 
> > Some exporters need a flow to synchronously revoke access to the DMA-buf
> > by importers. Once revoke is completed the importer is not permitted to
> > touch the memory otherwise they may get IOMMU faults, AERs, or worse.
> 
> That approach is seriously not going to fly.
> 
> You can use the invalidate_mappings approach to trigger the importer
> to give back the mapping, but when the mapping is really given back
> is still completely on the importer side.

Yes, and that is what this is all doing, there is the wait for the
importer's unmap to happen in the sequence.

> In other words you can't do the shot down revoke semantics you are
> trying to establish here.

All this is doing is saying if dma_buf_attach_revocable() == true then
the importer will call unmap within bounded time after
dma_buf_invalidate_mappings().

That's it. If the importing driver doesn't want to do that then it
should make dma_buf_attach_revocable()=false.

VFIO/etc only want to interwork with importers that can do this.

Jason
