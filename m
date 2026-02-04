Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNVRKfJ5g2nyngMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 17:55:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB1AEA982
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 17:55:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A637C10E6E0;
	Wed,  4 Feb 2026 16:55:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="GPUdg60W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7FC610E6E4
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 16:55:09 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id
 af79cd13be357-8c59bce68a1so524569485a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Feb 2026 08:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1770224108; x=1770828908; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+k5zz356tCtx+TsrSTgNS2LOgl52lZtCniOLQPd/1s0=;
 b=GPUdg60WryYi1Tdg25F+/ATxrcArA1eIzo+DLTK0OFdldSXA2i8mgELuG7NCrrFMi4
 d0Efd/CZD487hh/LBwnwMfPteOtlgM9B+BKPjxbZK0zo2eS4kjbFxnjAYs1fviKnrMAq
 2RdKLFdARvk3euApVykjvvqmiCu1p6yw+mzqgIxLERlaBUvkUGLB7MunFZSMkk7bgOWS
 kVWgGjUroYu4WN7xx7URKz/7OZoE6f+N+k8ebpzXfJ8KcZjCwzdPoXBSNPVM3uAzOmaq
 9QmK6/Z2MYXXcavXvtR9g+pzJJaOa+FP0vfjgHI7VwInc05Mo6t9+0Rq76XVFc0hM4J5
 gYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770224109; x=1770828909;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+k5zz356tCtx+TsrSTgNS2LOgl52lZtCniOLQPd/1s0=;
 b=bG9tarcFyaAvGgxF5we4B5eReRhI8Z0Rnc2SYFTBYIdHbK/Iba/X7TmbW9NUh3hWkW
 AswfxBj/OnJkAijxcKwq4TLfZ7iTFRkj8djX+N3MZi0YBV6dgKug3IgUUgk51Jx8phWo
 Rad8Ka4wC3VVOpkd3ruh3bGZcyZU9TrqKYZQ/9ththkNJNZyktDtMu1qrPi8b9ya36z+
 N/cdNM3xNiJWif1F3pUnfXf3oOPN0Y6Q/zOwXBDcjNGPigS82sqmMD8/ApJML/31xRbo
 m3qEtjX7Kn3wvbbLX77rDFa1DqsMf6ICM8ovOt7ousEGH8VtMZgycH0unEQLa9YLdRxK
 Y4vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkXh6EQ11w7MzdjTMDA5AqN9mzToxs4nkw+jl0P7+wh/++m0XIMZ8rOiiGgwD0VMN/g4r5Oc6c0dY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRgj8zq9rQdFpA3bij62irt31Th5d/LsaXyPjG7blMy84aCWp6
 X0Nza3qWkOO8C0psxRPQ2ih6uQwAqUlUtLJOHstXbuBwPLthaK9V/Z1579BsGXJP2uc=
X-Gm-Gg: AZuq6aJOy7w0z+HRLSN6Mggb5nH8GbjxPbBpEHyg6IIHHbNgPQVZPAtCZekFA09VM9L
 ceT4O5r4X2fq+2jTvooHPYUm0q/ZuyTf48pPhDXebu1Emqv+hAsz4P9WBPA4Mv2JOYelXitBPc/
 WC2jUHZfuth+G6PPzd1hmOwf+bFSovRRDtMp7EpOskU1Yx6AYAzZss3lHB3M09kwXe4DiqUxjGF
 afUKWfIGxgN+014Ug8RLsdGrnPdFn6R/BUumcfRFIzb51Vy1CRcdTvoxD+2wP1XHUnAg819TARF
 sj2VWh9ahZVCUCt8aiI3WvltEex7zZ2s2eQbF90MWVBpFyq3f2oid1/uwEXrgOY1q+Gf1s60rg7
 5gJ+U3tzBfqY8vp1fOpCbv243VujnOzkZp2/LEFrpVaKrspirLO2M3HMkotOYiTDWc5xhjQPT+W
 zANV12Jump9CbcwXcu3bGkvFguEdPK5OaaXigYYwX1fW+WvutK6NtlxHyc1/xQNi0M18A=
X-Received: by 2002:a05:620a:4627:b0:8c7:177f:cc17 with SMTP id
 af79cd13be357-8ca2f9bbb5amr467025085a.46.1770224108469; 
 Wed, 04 Feb 2026 08:55:08 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8ca2fd2cfb4sm226461485a.33.2026.02.04.08.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 08:55:07 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vng9j-0000000HH15-13rk;
 Wed, 04 Feb 2026 12:55:07 -0400
Date: Wed, 4 Feb 2026 12:55:07 -0400
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
Subject: Re: [PATCH v7 7/8] vfio: Permit VFIO to work with pinned importers
Message-ID: <20260204165507.GH2328995@ziepe.ca>
References: <20260131-dmabuf-revoke-v7-0-463d956bd527@nvidia.com>
 <20260131-dmabuf-revoke-v7-7-463d956bd527@nvidia.com>
 <fb9bf53a-7962-451a-bac2-c61eb52c7a0f@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb9bf53a-7962-451a-bac2-c61eb52c7a0f@amd.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:leon@kernel.org,m:sumit.semwal@linaro.org,m:alexander.deucher@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:kraxel@redhat.com,m:dmitry.osipenko@collabora.com,m:gurchetansingh@chromium.org,m:olvaffe@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:lucas.demarchi@intel.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:kevin.tian@intel.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:Felix.Kuehling@amd.com,m:alex@shazbot.org,m:ankita@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:virtualization@lists.linux.dev,m:intel-xe@lists.freedesktop.org,m:linux-rdma@vger.kernel.org,m:iommu@lists.linux.dev,m:kvm@vger.kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[ziepe.ca];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,nvidia.com:email,shazbot.org:email,intel.com:email]
X-Rspamd-Queue-Id: DDB1AEA982
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 05:21:45PM +0100, Christian König wrote:
> On 1/31/26 06:34, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> > 
> > Till now VFIO has rejected pinned importers, largely to avoid being used
> > with the RDMA pinned importer that cannot handle a move_notify() to revoke
> > access.
> > 
> > Using dma_buf_attach_revocable() it can tell the difference between pinned
> > importers that support the flow described in dma_buf_invalidate_mappings()
> > and those that don't.
> > 
> > Thus permit compatible pinned importers.
> > 
> > This is one of two items IOMMUFD requires to remove its private interface
> > to VFIO's dma-buf.
> > 
> > Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> > Reviewed-by: Alex Williamson <alex@shazbot.org>
> > Reviewed-by: Christian König <christian.koenig@amd.com>
> > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > ---
> >  drivers/vfio/pci/vfio_pci_dmabuf.c | 15 +++------------
> >  1 file changed, 3 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
> > index 78d47e260f34..a5fb80e068ee 100644
> > --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
> > +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
> > @@ -22,16 +22,6 @@ struct vfio_pci_dma_buf {
> >  	u8 revoked : 1;
> >  };
> >  
> > -static int vfio_pci_dma_buf_pin(struct dma_buf_attachment *attachment)
> > -{
> > -	return -EOPNOTSUPP;
> > -}
> > -
> > -static void vfio_pci_dma_buf_unpin(struct dma_buf_attachment *attachment)
> > -{
> > -	/* Do nothing */
> > -}
> > -
> 
> This chunk here doesn't want to apply to drm-misc-next, my educated
> guess is that the patch adding those lines is missing in that tree.

Yes. It looks like Alex took it to his next tree:

commit 61ceaf236115f20f4fdd7cf60f883ada1063349a
Author: Leon Romanovsky <leon@kernel.org>
Date:   Wed Jan 21 17:45:02 2026 +0200

    vfio: Prevent from pinned DMABUF importers to attach to VFIO DMABUF
    
    Some pinned importers, such as non-ODP RDMA ones, cannot invalidate their
    mappings and therefore must be prevented from attaching to this exporter.
    
    Fixes: 5d74781ebc86 ("vfio/pci: Add dma-buf export support for MMIO regions")
    Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
    Reviewed-by: Pranjal Shrivastava <praan@google.com>
    Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
    Link: https://lore.kernel.org/r/20260121-vfio-add-pin-v1-1-4e04916b17f1@nvidia.com
    Signed-off-by: Alex Williamson <alex@shazbot.org>

The very best thing would be to pull
61ceaf236115f20f4fdd7cf60f883ada1063349a which is cleanly based on
v6.19-rc6 ?

> How should we handle that? Patches 1-3 have already been pushed to
> drm-misc-next and I would rather like to push patches 4-6 through
> that branch as well.

Or we get Alex to take a branch from you for the first 3 and push it?

Jason
