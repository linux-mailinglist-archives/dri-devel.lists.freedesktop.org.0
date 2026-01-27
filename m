Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBPCIZDneGmHtwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 17:28:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCDF97C25
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 17:27:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC25D89B66;
	Tue, 27 Jan 2026 16:27:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="VMPzDF1g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F150C10E597
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 16:27:56 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-503354cb21aso2230851cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 08:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1769531276; x=1770136076; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3Kat2TyZxDqTgTm8MMhUVYtoZ/z4BzE2I09fTuJqEpw=;
 b=VMPzDF1g+18vTQxJfApUh5g94pfqZwrxdEaAD/et1Sk32QC0o6935Uxyf0IDoWeE6f
 0hRtxEqKESJU5zrYQB1Njgws/VlCm/gVIOejIWlaaUyomF++38UingHbxde0ktRbqA2N
 F+sOCl1gZMBMLEi5J7vnyG6LpxEuPYhanJZks4a7ekOHnwEP1dDfFaWJwE3UEKDU5/Kg
 /FirG1r0q15Hh2iLkdR0QlAm9fXckuPdXkeKZX4Evzq73l514DN73NT1SdFtrwvwJJLp
 4+bs83Es5/tRQCzFxNxlvqxrCDno2J4Pdbs9bKANyvd3hM159/FlmkwmeSHTcmFDiu/X
 2CRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769531276; x=1770136076;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3Kat2TyZxDqTgTm8MMhUVYtoZ/z4BzE2I09fTuJqEpw=;
 b=MZiXaEgZG1UYqrL7VPGKYTQVgf1kxupo4s+OHhLOqsrOQX6gt9Ij42fQ3neLbw6QKV
 Z5M9/tTMmk/oWqwk3cBAK5yqUcJQpH72FifgVI6bqxacGFtWfeKz6ILMLNlVRNwhHM5+
 VzXawcsYI+rBrs6++RXd2LPQIIymt72crYhh+HJzxJYzPxurDLADxkA7uVNrpYHqwvxg
 f+/eX3/dUmPooILq0AgETbDxX5+qXLv9q6zbgoulbbafEwFUsWfzuylv3P/WYf7BxqaM
 PEVzTaBWxZ98ZdECm1/4JPH56qFBr/um/pz3X6/wJyBE8AJgfiYfeag5xusegKZz7FLA
 ICUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVX4lrnPqH2gUaAS5Id2GbhD3XElBoVZZHXA+vkSK8wN70ke65vskUOlgUTFHiZgV9P/m4LgY5smH4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylhIWQ0HZlPynT3oCy4TqROT12nXFctQdJnCTPjs6Kt137ookQ
 UsJObX68XrtwkEcX9jAGWwR3YvZ8bH9IPtuDkiQeUJ0X1dkNJNsv8F/MR03BFoeQ5fc=
X-Gm-Gg: AZuq6aKz6+83VLqvnvhiQtBwFX4ViGGqdsLqM6Zg0b3vjDKf3GPaRtLn792PipawNJa
 mEb2+sZdlvELTvW2Ngb5pjKVUOhPhOQvz9AAIOu/kWavlNxxmAhVt7PdHAptZLxEMlJVX1gFq6M
 QPE5x/umENDPL3/TmJZu89NYy2dnNqx0PBZg8s60XAzMxW9M3CdGmWdNEY5rQRyVc4u88+r2rrC
 zgqbVT/TwyVSSjFsZXtDjgxGjijkZbSHGF9c4UBQpvRck0Rte4mrLt8JXRmHc/ILS8lyJAsGKjs
 +96eEikHOXahms0gOO8AsnVDj4aLeIHjPu7aRyL9fO4KfD8jy7Qn1cTmjpjkyg2L6AVEtn+nYP3
 i9pRHUbRLJFxCMcMFM1MG3y1Z9yftKFegc6A0QECRBp0f8KJ3IfvNVUP3/jjTEFM1ArewippHUn
 PluA0wywLsKL8KXXV+TyQM/QlcmP26e8hbjRD+4P18f/3rniFVsVh/0KXEhcgdMyBmp6AzMYjt0
 s1MmA==
X-Received: by 2002:a05:622a:612:b0:4f1:ba00:4cc6 with SMTP id
 d75a77b69052e-5032fc167d4mr25702421cf.79.1769531275530; 
 Tue, 27 Jan 2026 08:27:55 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-502fb8e74ebsm102277581cf.0.2026.01.27.08.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 08:27:55 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vklv0-000000095Ys-1TUe;
 Tue, 27 Jan 2026 12:27:54 -0400
Date: Tue, 27 Jan 2026 12:27:54 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Pranjal Shrivastava <praan@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
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
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Williamson <alex@shazbot.org>, Ankit Agrawal <ankita@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 iommu@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [PATCH v5 4/8] vfio: Wait for dma-buf invalidation to complete
Message-ID: <20260127162754.GH1641016@ziepe.ca>
References: <20260124-dmabuf-revoke-v5-0-f98fca917e96@nvidia.com>
 <20260124-dmabuf-revoke-v5-4-f98fca917e96@nvidia.com>
 <aXfUZcSEr9N18o6w@google.com> <20260127085835.GQ13967@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260127085835.GQ13967@unreal>
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
	FORGED_RECIPIENTS(0.00)[m:leon@kernel.org,m:praan@google.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:alexander.deucher@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:kraxel@redhat.com,m:dmitry.osipenko@collabora.com,m:gurchetansingh@chromium.org,m:olvaffe@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:lucas.demarchi@intel.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:kevin.tian@intel.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:Felix.Kuehling@amd.com,m:alex@shazbot.org,m:ankita@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:virtualization@lists.linux.dev,m:intel-xe@lists.freedesktop.org,m:linux-rdma@vger.kernel.org,m:iommu@lists.linux.dev,m:kvm@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[google.com,linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,kernel.org,suse.de,intel.com,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jgg@ziepe.ca,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[35];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: ECCDF97C25
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 10:58:35AM +0200, Leon Romanovsky wrote:
> > > @@ -333,7 +359,37 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
> > >  			dma_resv_lock(priv->dmabuf->resv, NULL);
> > >  			priv->revoked = revoked;
> > >  			dma_buf_invalidate_mappings(priv->dmabuf);
> > > +			dma_resv_wait_timeout(priv->dmabuf->resv,
> > > +					      DMA_RESV_USAGE_BOOKKEEP, false,
> > > +					      MAX_SCHEDULE_TIMEOUT);
> > >  			dma_resv_unlock(priv->dmabuf->resv);
> > > +			if (revoked) {
> > > +				kref_put(&priv->kref, vfio_pci_dma_buf_done);
> > > +				/* Let's wait till all DMA unmap are completed. */
> > > +				wait = wait_for_completion_timeout(
> > > +					&priv->comp, secs_to_jiffies(1));
> > 
> > Is the 1-second constant sufficient for all hardware, or should the 
> > invalidate_mappings() contract require the callback to block until 
> > speculative reads are strictly fenced? I'm wondering about a case where
> > a device's firmware has a high response latency, perhaps due to internal
> > management tasks like error recovery or thermal and it exceeds the 1s 
> > timeout. 
> > 
> > If the device is in the middle of a large DMA burst and the firmware is
> > slow to flush the internal pipelines to a fully "quiesced"
> > read-and-discard state, reclaiming the memory at exactly 1.001 seconds
> > risks triggering platform-level faults..
> > 
> > Since the wen explicitly permit these speculative reads until unmap is
> > complete, relying on a hardcoded timeout in the exporter seems to 
> > introduce a hardware-dependent race condition that could compromise
> > system stability via IOMMU errors or AER faults. 
> > 
> > Should the importer instead be required to guarantee that all 
> > speculative access has ceased before the invalidation call returns?
> 
> It is guaranteed by the dma_resv_wait_timeout() call above. That call ensures
> that the hardware has completed all pending operations. The 1‑second delay is
> meant to catch cases where an in-kernel DMA unmap call is missing, which should
> not trigger any DMA activity at that point.

Christian may know actual examples, but my general feeling is he was
worrying about drivers that have pushed the DMABUF to visibility on
the GPU and the move notify & fences only shoot down some access. So
it has to wait until the DMABUF is finally unmapped.

Pranjal's example should be covered by the driver adding a fence and
then the unbounded fence wait will complete it.

I think the open question here is if drivers that can't rely on their
fences should return dma_buf_attach_revocable() = false ? It depends
on how long they will leave the buffers mapped, and if it is "bounded
time".

The converse is we want to detect bugs where drivers have wrongly set
dma_buf_attach_revocable() = true and this turns into an infinite
sleep, so the logging is necessary, IMHO.

At worst the code should sleep 1s, print, then keep sleeping..

Jason
