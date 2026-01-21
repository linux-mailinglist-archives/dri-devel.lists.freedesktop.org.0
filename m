Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GP4zGlTzcGk+awAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 16:40:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5A759567
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 16:40:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D0A10E835;
	Wed, 21 Jan 2026 15:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="Wp4ujBkB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
 [209.85.219.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E3F710E837
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 15:39:59 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id
 6a1803df08f44-8946e0884afso247606d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 07:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1769009999; x=1769614799; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Q/gIihsafKtPWuGmVrtzbFv3/1+tW3nx1RJPQscpuso=;
 b=Wp4ujBkB9ilpwPb4/Dadsv3Wvw2wNGm+L2bOGrZ0k+ec55NHbZ+F2EfsRnsjca0vOd
 p2fOYtvuRMhWH6RGUJuHba1GwuOtwl4Phe3dDWp9/gkgS7kHT8M14HCwG+e5CNtDHnqy
 +UmQbEpaAr/IrqAnuM7FDhQrDisuHB8ij1AGUrk5wAIFt7iH8muITrdD8S89EL4WoHeA
 ww47DkEWXH1RWYMW5uVBpbZnBNcSH38W63gKi3aeW8sOFWzvyv2S/eI6tBlQxOYoqwZJ
 F1tTcyIfNI/T3qbCOfBIo4uvFYOozMv6eIOGbXUIKXuXI8phKINBsA0r6WNlNrdtuWPh
 g/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769009999; x=1769614799;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q/gIihsafKtPWuGmVrtzbFv3/1+tW3nx1RJPQscpuso=;
 b=UvfsEoywVYCO2iWuuMdr1yL7ftVldmWrSFDRsCpfBIyM7+ai8W8zJC6WeL834APV7R
 kGx4saFK0Zioid8QoSMNTawwnC4oMHYBl4Ks/pZUu3Q34Z7uW3anhqzoiBKQRVFv9aKv
 6wjTxM/UU1nS1pd5kIU8VliLhmk1Wn/VliYELLlF/pF9F5FQXR5uTXx1hq3Alqf/yFs8
 xmzzpXNvkpxjnTqdMieLeiVXVRhH5cndMsvY8S+Wunc1p6ZbSOSsaGsbcN8tyjhAbkEj
 UHZPCmZ7zAcoyg/o2j1bTNvJ/M94KSYZNrjjSz4IUezg69eHNGZs9AjDLlOnPx4aEZpv
 uBsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+Ofll0OAWKdDQrAd/IhMbBr2I+1BHbiF858NNDBrVLDRzqz7syBJXCuujOu49L1L8ddSKNAxVNRg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4Bd5lqFPVQzmNsBz3doJvJvODjUALo7PE1nHxQPTicmY0RDoQ
 L8zSurUhq//N+u/GXSjF+XrJjbIvxgP4M6TLG0uMlcaU+duiwTVj9gDEGOhsw7Zto4o=
X-Gm-Gg: AZuq6aLP/qSA7iudck2dP2pfqDq8hVEXId7ldyZUQnLetm5lMwmoorMTeNieSBIaO4W
 WcD68Dhl9j014HFz21qWwaNK2F5VAWBxc05DMnpoyBDUpMNr8i3Vuk5blEUf2U0+fohUAJyfsWG
 Hv3faMQk1Ps0EEH4dSob7PEhLcCNYrM3ws/roEXgXLlTdNg/xRmicQczninyfGwVXvVKif5NOnS
 imQei+Vj4p+iYj5rtsf747pAZjksODEQ6HlUf4nehDP1/BJeyW1o5hekvFQRcPBrd8RZ6/Zp5zo
 vUcsPF+94mrtY7KoFSRiMxXB/W9tzbN3cqcx64fz/D0mHzKFFLE91LZxJGWXkdikZDV6nCzgMv0
 lTDIfkimrgm63SFeVV1EctVuhRyV0PCylu/a/Mg08ilrHhtbUfJVdGOy0I3AMHTpk/fyiwfwdfz
 512gTe9K00rUQoG//efg5Vlodlc32wwR16LexlsWDevXAd+fCRCEptpE40bXxMjRVugHk=
X-Received: by 2002:a05:6214:469b:b0:894:3cde:f81e with SMTP id
 6a1803df08f44-8943cdef85amr237172426d6.41.1769009998640; 
 Wed, 21 Jan 2026 07:39:58 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-894592ba642sm58791866d6.57.2026.01.21.07.39.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 07:39:57 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1viaJJ-00000006EiI-13u3;
 Wed, 21 Jan 2026 11:39:57 -0400
Date: Wed, 21 Jan 2026 11:39:57 -0400
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
Subject: Re: [PATCH v3 3/7] dma-buf: Document RDMA non-ODP
 invalidate_mapping() special case
Message-ID: <20260121153957.GC961572@ziepe.ca>
References: <20260120-dmabuf-revoke-v3-0-b7e0b07b8214@nvidia.com>
 <20260120-dmabuf-revoke-v3-3-b7e0b07b8214@nvidia.com>
 <4fe42e7e-846c-4aae-8274-3e9a5e7f9a6d@amd.com>
 <20260121091423.GY13201@unreal>
 <7cfe0495-f654-4f9d-8194-fa5717eeafff@amd.com>
 <20260121131852.GX961572@ziepe.ca>
 <8a8ba092-6cfa-41d2-8137-e5e9d917e914@amd.com>
 <20260121135948.GB961572@ziepe.ca>
 <8689345b-241a-47f4-8e9a-61cde285bf8b@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8689345b-241a-47f4-8e9a-61cde285bf8b@amd.com>
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
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:leon@kernel.org,m:sumit.semwal@linaro.org,m:alexander.deucher@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:kraxel@redhat.com,m:dmitry.osipenko@collabora.com,m:gurchetansingh@chromium.org,m:olvaffe@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:lucas.demarchi@intel.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:kevin.tian@intel.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:Felix.Kuehling@amd.com,m:alex@shazbot.org,m:ankita@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:virtualization@lists.linux.dev,m:intel-xe@lists.freedesktop.org,m:linux-rdma@vger.kernel.org,m:iommu@lists.linux.dev,m:kvm@vger.kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[ziepe.ca];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jgg@ziepe.ca,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[34];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,suse.de,intel.com,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,ziepe.ca:mid,ziepe.ca:dkim]
X-Rspamd-Queue-Id: AD5A759567
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 03:15:46PM +0100, Christian König wrote:
> > And let's clarify what I said in my other email that this new revoke
> > semantic is not just a signal to maybe someday unmap but a hard
> > barrier that it must be done once the fences complete, similar to
> > non-pinned importers.
> 
> Well, I would avoid that semantics.
>
> Even when the exporter requests the mapping to be invalidated it
> does not mean that the mapping can go away immediately.
> 
> It's fine when accesses initiated after an invalidation and then
> waiting for fences go into nirvana and have undefined results, but
> they should not trigger PCI AER, warnings from the IOMMU or even
> worse end up in some MMIO BAR of a newly attached devices.

So what's the purpose of the fence if accesses can continue after
waiting for fences?

If we always have to wait for the unmap call, is the importer allowed
to call unmap while its own fences are outstanding?

> So if the exporter wants to be 100% sure that nobody is using the
> mapping any more then it needs to wait for the importer to call
> dma_buf_unmap_attachment().

We are trying to introduce this new idea called "revoke".

Revoke means the exporter does some defined sequence and after the end
of that sequence it knows there are no further DMA or CPU accesses to
its memory at all.

It has to happen in bounded time, so it can't get entangled with
waiting for userspace to do something (eg importer unmap via an ioctl)

It has to be an absolute statement because the VFIO and RDMA exporter
use cases can trigger UAFs and AERs if importers keep accessing.

So, what exactly should the export sequence be? We were proposing to
call invalidate_mapping() and when it returns there is no access.

The fence is missing, so now the sequences includes wait for the
fences.

And now you are saying we have to wait for all unmaps? Not only wait
for the unmaps, but the importers now also must call unmap as part of
their invalidate_mapping() callback.. Is that OK? Do existing
importers do that?

If all the above are yes, then lets document explicitly this is the
required sequence and we can try to make it work. Please say, because
we just don't know and keep getting surprised :)

Thanks,
Jason
