Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KlXEt2+gGl3AgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 16:12:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88451CDF96
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 16:12:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8BA910E0CC;
	Mon,  2 Feb 2026 15:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="mHjmZK2C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 898CC10E3CA
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 15:12:24 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-5014e1312c6so29109531cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 07:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1770045143; x=1770649943; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xO0aL+oRN74yVSsHQO79QNqtu9/dj8jxjzC/60StG/Q=;
 b=mHjmZK2CmvQxQ0XAUb3rNkLamIHL4x5oX8SoAdm6Z6tVEKW3TRpqdDLDwApd3n58wA
 5p1qivXekI8cOrBg0svssXisHj/9OT9L2NwmivHVFOTYHacj/4AqZ+/xDD49cvqpKgap
 jL0fzHjLkNCEQQh9F0ojLUJzro1775y2cGSu5nLYRmnVvZfb1Y/zCKuw3ig8q/PI8irX
 wmLs4I2WytRYDlhgvmMEgTI2QL7OUKqNS8aKVkyM/skBQPEMJNbx9gwYStQ13WfMynJP
 qhmnyHKc64KuK2dPNVTJ/VU7F6NIj7J0Q1byBhr6XULyOsnKw8RBBtioelrCjBzscGSl
 sbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770045143; x=1770649943;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xO0aL+oRN74yVSsHQO79QNqtu9/dj8jxjzC/60StG/Q=;
 b=wsOSN6J+4hlBnNdQEAQn5DerwTgji2rNplBpx6M+I+Vu+pclCuuCmVyhOMH3jSQAh7
 8+RGWb8IJ3GmSmxnUwqrTQ0IL20PmmAjxLfAnysICAq/l0p7DDysfvETy8dl16STj9xo
 JMOwZaouP+2+xnyWvGJit1A8VIkpSRTgNcy+/HUBqMD24PhRxxVsAG1C1SceRdVMDqGc
 HCjwIkSjQy5114r6YuZaZpVO74fQcWLXzQb+L2PYv/qN3vThMeQ6HfT4ZmbGOIUXuYdc
 1PXURHkZqXFAvcPmcTD62LGtjmVGhbblHa50HSHbUS8OpP9yjVB9w8eGCtz3mviNpchN
 ux4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAiTIItfeb2iApQIGBsZRKljouaRREZM/ChlKzgEmvH4TIkx3YC5MJFiPJCG/P4p0KLOPtQUb1BQU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNd/Fta2Jp+9Jwp1u2SGT7EhX4tBypmfGEbYIIeXtj2O+JAUfm
 RYAbJqiZbYjH5AS6nFen+g1yjVqHxDKsegZW/2KiQr7B8FuULE0fHwC65AesiwUABDM=
X-Gm-Gg: AZuq6aIMK9kDTBWwi6b37erVT5ZFZUkEUR0kzdZnl8COc8f18SZjZbQlsp65dS6R32G
 AGb4XIfj9Pt0GwVA038WTbPr/VJEMMqw0kwmSI+6BSmkwwCkuAMWOmEDhvoHaogMLrESxQiNW+y
 v4ZM90KA917DDZ5/FKFQn7Yo11LdRA0PpNZtpMHCCbtDuhn6E80pbnAYrCJExkgEeF70R+Epg7b
 K7975vm8OlGcziySJcx5K3GqRSWwfPYVjXeVdwsqdaSz/on1yyIfCYhlhy4QyXcbaGoVYOkjs7O
 Ta2TLYjjrjzkDge0rttbsF+BlsYBYfm5TH6XW4WM3PgPJBwUOxULy5EJPr6wmZjhh8BgZcKfmuh
 afWEBvHtxjBAf1izpG+4S/oXsQzL1iJ/CsA80OB9OaUMm1eOXU1103RQX7Y6VB7opd8jxhe/o9z
 cKA4d33w2h/XMzPRNk2OoLrHFJmS5j8pwdhCm+K2zCABW+acIT9h+5H3OWGQH+mAV9Ol0=
X-Received: by 2002:a05:622a:1993:b0:4ee:1903:367b with SMTP id
 d75a77b69052e-505d214ba65mr150834861cf.5.1770045143271; 
 Mon, 02 Feb 2026 07:12:23 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-50337bb9d21sm106856261cf.26.2026.02.02.07.12.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 07:12:22 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vmvbB-0000000FJuI-3Zxp;
 Mon, 02 Feb 2026 11:12:21 -0400
Date: Mon, 2 Feb 2026 11:12:21 -0400
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
Subject: Re: [PATCH v5 4/8] vfio: Wait for dma-buf invalidation to complete
Message-ID: <20260202151221.GH2328995@ziepe.ca>
References: <20260124-dmabuf-revoke-v5-0-f98fca917e96@nvidia.com>
 <20260124-dmabuf-revoke-v5-4-f98fca917e96@nvidia.com>
 <31872c87-5cba-4081-8196-72cc839c6122@amd.com>
 <20260130130131.GO10992@unreal>
 <d25bead8-8372-4791-a741-3371342f4698@amd.com>
 <20260130135618.GC2328995@ziepe.ca>
 <d1dce6c1-9a89-4ae4-90eb-7b6d8cdcdd91@amd.com>
 <20260130144415.GE2328995@ziepe.ca>
 <c976c33c-4fa7-4350-8dcc-a5c218d1b0d6@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c976c33c-4fa7-4350-8dcc-a5c218d1b0d6@amd.com>
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
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:leon@kernel.org,m:sumit.semwal@linaro.org,m:alexander.deucher@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:kraxel@redhat.com,m:dmitry.osipenko@collabora.com,m:gurchetansingh@chromium.org,m:olvaffe@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:lucas.demarchi@intel.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:kevin.tian@intel.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:Felix.Kuehling@amd.com,m:alex@shazbot.org,m:ankita@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:virtualization@lists.linux.dev,m:intel-xe@lists.freedesktop.org,m:linux-rdma@vger.kernel.org,m:iommu@lists.linux.dev,m:kvm@vger.kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[ziepe.ca];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,suse.de,intel.com,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jgg@ziepe.ca,dri-devel-bounces@lists.freedesktop.org];
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
X-Rspamd-Queue-Id: 88451CDF96
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 09:42:22AM +0100, Christian König wrote:
> On 1/30/26 15:44, Jason Gunthorpe wrote:
> > On Fri, Jan 30, 2026 at 03:11:48PM +0100, Christian König wrote:
> >> On 1/30/26 14:56, Jason Gunthorpe wrote:
> >>> On Fri, Jan 30, 2026 at 02:21:08PM +0100, Christian König wrote:
> >>>
> >>>> That would work for me.
> >>>>
> >>>> Question is if you really want to do it this way? See usually
> >>>> exporters try to avoid blocking such functions.
> >>>
> >>> Yes, it has to be this way, revoke is a synchronous user space
> >>> triggered operation around things like FLR or device close. We can't
> >>> defer it into some background operation like pm.
> >>
> >> Yeah, but you only need that in a couple of use cases and not all.
> > 
> > Not all, that is why the dma_buf_attach_revocable() is there to
> > distinguish this case from others.
> 
> No, no that's not what I mean.
> 
> See on the one hand you have runtime PM which automatically shuts
> down your device after some time when the last user stops using it.
> 
> Then on the other hand you have an intentional revoke triggered by
> userspace.
> 
> As far as I've read up on the code currently both are handled the
> same way, and that doesn't sound correct to me.
> 
> Runtime PM should *not* trigger automatically when there are still
> mappings or even DMA-bufs in existence for the VFIO device.

I'm a little confused why we are talking about runtime PM - are you
pointing out an issue in VFIO today where it's PM support is not good?

I admit I don't know a lot about VFIO PM support.. Though I thought in
the VFIO case PM was actually under userspace control as generally the
PM control is delegated to the VM.

Through that lens, what is happening here is correct. If the VM
requests to shut down VFIO PM (through a hypervisor vfio ioctl) then
we do want to revoke the DMABUF so that the VM can't trigger a AER/etc
by trying to access the sleeping PCI device.

I don't think VFIO uses automatic PM on a timer, that doesn't make
sense for it's programming model.

Jason
