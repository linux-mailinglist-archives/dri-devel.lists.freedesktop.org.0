Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WP6HOkmib2l7DgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 16:42:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B7646695
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 16:42:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19EBB10E5E7;
	Tue, 20 Jan 2026 13:15:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="LjEUGirS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64FCA10E5EB
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 13:15:33 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id
 af79cd13be357-8c537b9fcbfso545061885a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 05:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1768914932; x=1769519732; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Jl2KF0othdvrwDImGzxJcxoX7WKdbBXFC823mMEO8nY=;
 b=LjEUGirSRwSa2OJJ9ghicZtfex1eNEPksqh2a+ZOBsyMfG0hD9ixxWh2fzuQYmyoo3
 22XcZ2qt8OwznTVhAriKP5NNJMwX1Kh5E6H88ZMbne8pworwR2QXveJyVf88g+4qW+De
 I4bGjb+U4NfEYkHHukd3Pu/iCiIS6lUv4BS5n4zdhX8aIhZkhew6Er73i4sFn/bgnTfB
 aMWkbfPKjd0GS/QiF/3/ItWJM6ixxP0FVGuc8XVKHR8EPh672r7ddBHSk1ADgkSjyc1Z
 erv9/svM8IL1SSJOKD5uz6b3rP2YVdN6NhaAD4mK2E1U5d16rNu85rxGwiVk4q7BoU5f
 Caag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768914932; x=1769519732;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Jl2KF0othdvrwDImGzxJcxoX7WKdbBXFC823mMEO8nY=;
 b=EWkoeLEDPRtP7/rRycBX62kWmpiXJ8tZmQmKMADNGNLmlrs594SIH3JB+kB71Ov/BJ
 A9sC4u4zfRVUh2wYOm8ug5kxVSSlHOY/t1Z5Tde+zRYpT2P//Q5AEPH6gfzoY/+sIW64
 sUSjkUbaXPHt1T74mfeozw2Xe/1JY2mgsO36H5a/cwgy1Z9uMQD7N0T3hSWe5X6gXguv
 C/JcvdunqUzyQEKFmKHNlvx42FRLghfRGbF9dGqgypjPWh9hYoLuy8s9Df1RaWWX8fPp
 Q6mDaRu/ihxFqs6uv+ue/2NeKz0UxkfMiHBTxcB0Yfk+kyrmhrPkk5Uu66MniIEig7pe
 DnmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBik2+uJ9/zP1DaCieAzC9TGtlxZV5p/nOEH5cQiqGa2YyecCGDwdjB8Ce+fSBkZLQOuD3dUdr5BY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8QteWdylWL0LAJfzJKV5SFz+7IzMcu3PeSQTYfC7cvHspWvvZ
 +0VuwDY5MrFX0VRS9IMvmYvtsbgsl9168aLr5y9P5k6SmABwU3D8/PIqQ4K21/2Nwuc=
X-Gm-Gg: AY/fxX7pSJ9MeYFmJVFigNJAbtFohaY6ne27dWFa9kHdoNVdohD7GLHqxZvmPGS+p6j
 7sL4Jui+al5IeROlhKx5YHbdaOr8FZ4BsooubUOcL97k5i8Hqz3pXc/wc1BdteIwds7RcX38Zfr
 sL06xfdjLderDsXIFDwhiXTQDO4RTVepHWhEGdDrEtcAXTFmkJNyvYv7vMiM/B5+tNI5HXqLDdv
 esBA31eLPpC3M7kVr+9jPAjQZAp+r7lZG2u37qA23HKgc9x8462t+7dM6jNyYYOzLXEZ+Vie6yv
 /Ir0dJxstS+2TGoQHhcfm+IJQxsMpWDGkduAaN5JNk3d5gIGVUM3ZfewJ0338UUpWFZ+7LprM3A
 KV61HWd3wzOEhqOln+GLFrLeAtDzLvcTHuXTtTVTrJhzddUdhq6WY5QTpAeRvB9LhAPeDsE1qU4
 lLIoJ46JL2NUiOl4xfLD1dCPYYJPFEEC5fEnwcPlduXhHD6jAFwnq0b0nmaHYx55SxnWs=
X-Received: by 2002:a05:620a:999:b0:8c6:a68a:bc04 with SMTP id
 af79cd13be357-8c6a68ac1c8mr1389837085a.7.1768914931884; 
 Tue, 20 Jan 2026 05:15:31 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c6a7292cfbsm1017788585a.50.2026.01.20.05.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 05:15:31 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1viBZy-00000005W6K-36CW;
 Tue, 20 Jan 2026 09:15:30 -0400
Date: Tue, 20 Jan 2026 09:15:30 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
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
 Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, iommu@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [PATCH v2 3/4] iommufd: Require DMABUF revoke semantics
Message-ID: <20260120131530.GN961572@ziepe.ca>
References: <20260118-dmabuf-revoke-v2-0-a03bb27c0875@nvidia.com>
 <20260118-dmabuf-revoke-v2-3-a03bb27c0875@nvidia.com>
 <20260119165951.GI961572@ziepe.ca> <20260119182300.GO13201@unreal>
 <20260119195444.GL961572@ziepe.ca> <20260120131046.GS13201@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260120131046.GS13201@unreal>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:leon@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:alexander.deucher@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:kraxel@redhat.com,m:dmitry.osipenko@collabora.com,m:gurchetansingh@chromium.org,m:olvaffe@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:lucas.demarchi@intel.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:kevin.tian@intel.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:alex@shazbot.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:virtualization@lists.linux.dev,m:intel-xe@lists.freedesktop.org,m:linux-rdma@vger.kernel.org,m:iommu@lists.linux.dev,m:kvm@vger.kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[ziepe.ca];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	FREEMAIL_CC(0.00)[linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,kernel.org,suse.de,intel.com,8bytes.org,arm.com,shazbot.org,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jgg@ziepe.ca,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 57B7646695
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 03:10:46PM +0200, Leon Romanovsky wrote:
> On Mon, Jan 19, 2026 at 03:54:44PM -0400, Jason Gunthorpe wrote:
> > On Mon, Jan 19, 2026 at 08:23:00PM +0200, Leon Romanovsky wrote:
> > > On Mon, Jan 19, 2026 at 12:59:51PM -0400, Jason Gunthorpe wrote:
> > > > On Sun, Jan 18, 2026 at 02:08:47PM +0200, Leon Romanovsky wrote:
> > > > > From: Leon Romanovsky <leonro@nvidia.com>
> > > > > 
> > > > > IOMMUFD does not support page fault handling, and after a call to
> > > > > .invalidate_mappings() all mappings become invalid. Ensure that
> > > > > the IOMMUFD DMABUF importer is bound to a revoke‑aware DMABUF exporter
> > > > > (for example, VFIO).
> > > > > 
> > > > > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > > > > ---
> > > > >  drivers/iommu/iommufd/pages.c | 9 ++++++++-
> > > > >  1 file changed, 8 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
> > > > > index 76f900fa1687..a5eb2bc4ef48 100644
> > > > > --- a/drivers/iommu/iommufd/pages.c
> > > > > +++ b/drivers/iommu/iommufd/pages.c
> > > > > @@ -1501,16 +1501,22 @@ static int iopt_map_dmabuf(struct iommufd_ctx *ictx, struct iopt_pages *pages,
> > > > >  		mutex_unlock(&pages->mutex);
> > > > >  	}
> > > > >  
> > > > > -	rc = sym_vfio_pci_dma_buf_iommufd_map(attach, &pages->dmabuf.phys);
> > > > > +	rc = dma_buf_pin(attach);
> > > > >  	if (rc)
> > > > >  		goto err_detach;
> > > > >  
> > > > > +	rc = sym_vfio_pci_dma_buf_iommufd_map(attach, &pages->dmabuf.phys);
> > > > > +	if (rc)
> > > > > +		goto err_unpin;
> > > > > +
> > > > >  	dma_resv_unlock(dmabuf->resv);
> > > > >  
> > > > >  	/* On success iopt_release_pages() will detach and put the dmabuf. */
> > > > >  	pages->dmabuf.attach = attach;
> > > > >  	return 0;
> > > > 
> > > > Don't we need an explicit unpin after unmapping?
> > > 
> > > Yes, but this patch is going to be dropped in v3 because of this
> > > suggestion.
> > > https://lore.kernel.org/all/a397ff1e-615f-4873-98a9-940f9c16f85c@amd.com
> > 
> > That's not right, that suggestion is about changing VFIO. iommufd must
> > still act as a pinning importer!
> 
> There is no change in iommufd, as it invokes dma_buf_dynamic_attach()
> with a valid &iopt_dmabuf_attach_revoke_ops. The check determining whether
> iommufd can perform a revoke is handled there.

iommufd is a pining importer. I did not add a call to pin because it
only worked with VFIO that would not support it. Now that this series
fixes it the pin must be added. Don't drop this patch.

All the explanations we just gave say this special revoke mode only
activates if the buffer is pinned by the importer, so iommufd must pin
it. Otherwise it says it is working in the move mode with faulting
that it cannot support.

Jason
