Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOmIIg/ncGk+awAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 15:47:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F326D58AE7
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 15:47:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 282BE10E81C;
	Wed, 21 Jan 2026 14:47:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="0Xse8ydv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D619310E81F
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 14:47:39 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2a35ae38bdfso75435ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 06:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1769006859; x=1769611659;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BMkS4BFW7iikoL2BjP1nG2XKvn880JyWpxnGNG3+/cM=;
 b=0Xse8ydvwg4L9X/kqPkrLnAo/DGlQco7YyGpx2vOqDkShYc4xzMqseD4ONFSUp/MRc
 TzsDeD4+gK7tCyJmbyP4FifRZPeNCwy6IQN8bozSICS3GhEHBtDgJ0zQUNTkO+S3e6A6
 XckDGbjsS8b7VzP7ADEIUBARvV7woD8Uyl/bZ70BkmjhyJW8T+otMCwdXwK9S6+JnBI4
 u1NSWPEXAIXyrp6FfuuDulQ/VlLflTZw74G7VdLj20xWzpUIBpk6JvaSObpAma9Go6sh
 uABoVwv/hCcA6Jc91ub6ROcVaJdW5tfR6LJ/GeG4JLtt9If8uMg5MlL0Ddwz32QBITAq
 EKXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769006859; x=1769611659;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BMkS4BFW7iikoL2BjP1nG2XKvn880JyWpxnGNG3+/cM=;
 b=JahZfm4u+cectqRglrC3Lwd6GyvPzsfsZBgAqiCPVT/V8P27hjdtkcYT5e6qqD20oE
 hRpvq5shBRabdDuUIEXQmRyz8g1Nwe8HIhXyH4kZA+T54X3Et6WyWwcg3MV+mMrQD9xf
 XT2GjjlqF8zjJEW6C63y7wv76fKj3Mi2/pSxyjazoDQ/VA1PQgpDNw3c6f6TNEMa82Fw
 20DZ4nVJhAqX0EKhxDaOTgg8pg+ZQcEds+6MuyW9Pb3G6xkVgRa2gd7s5N+9ntFcY3k8
 SLMJtmlCf5lhgPN7WHKWRQE1k8rHBXDUIXa+2sm+emBBcCvJSE+VpWd3PJuom5MOwH7a
 HrAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCFTN6070ury4SRtudtAmM7vN0gYeKCbuwY7xrtf2qJGcCHvbbkZprnhdxlAdIoYDGKBwDCjmBvd8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3VWKNx6TKKtLtQqCsQEGSgB8gFg9WJrzCLQojFZinvasofhkT
 cJ7QI05FSKDG28YcUZxosbZVLssQWWMsCK9b3sdtLKJQQuZsD/SMhfW84MsFXil2Lg==
X-Gm-Gg: AZuq6aJlYlHvojNX1tBDMMfKKt5qXDBKshxGQPu0Pd3VXg/ryTB/smFCRjCGOAShR1R
 +XQACGYUV5yXe6nPQBKzPa/rTWnG9HqRecD7HX9RXlaxOvCe1V3gghewcyBuBhiClRRcrPKTUG6
 lpulfSVdT2WeRdtJPEuLPz71mm1mqzuWazQgJ1mFX99y6ceuiDHnQW5XI72JlIwTfOR/Uh9Fuap
 KNMG/AoL4KwC84L6VVnlRzxxk4iNkHuzD2NtBb3K9pvOmLjXOBFqkEKGoeeyYf633V8ThTZ9zVr
 upFcePu/pufPzGiDNXIogTRzmR5MdVRwUYhd7m4C1JmhCiT6sysgLbOEqwlWeov0LFLoPnlmIs+
 uNUy2DTHAvFQ4RY64VgFfxRCjgEK6kzkh3ULyErw3mSfVd1VbsqboM7yUFynfA5vE7Yd3MzQisi
 9SigeSnED66PVolRSGKDSwuOH9kSfmeiPQFeV+oAVZqB/HAtxW
X-Received: by 2002:a17:902:dac8:b0:2a7:87c2:fcde with SMTP id
 d9443c01a7336-2a7a245b58cmr2655545ad.15.1769006858836; 
 Wed, 21 Jan 2026 06:47:38 -0800 (PST)
Received: from google.com (222.245.187.35.bc.googleusercontent.com.
 [35.187.245.222]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-81fa108b21fsm15434806b3a.13.2026.01.21.06.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 06:47:38 -0800 (PST)
Date: Wed, 21 Jan 2026 14:47:29 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
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
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
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
Subject: Re: [PATCH v4 8/8] vfio: Validate dma-buf revocation semantics
Message-ID: <aXDnAVzTuCSZHxgF@google.com>
References: <20260121-dmabuf-revoke-v4-0-d311cbc8633d@nvidia.com>
 <20260121-dmabuf-revoke-v4-8-d311cbc8633d@nvidia.com>
 <20260121134712.GZ961572@ziepe.ca> <aXDhJ89Yru577jeY@google.com>
 <20260121142528.GC13201@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121142528.GC13201@unreal>
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:leon@kernel.org,m:jgg@ziepe.ca,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:alexander.deucher@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:kraxel@redhat.com,m:dmitry.osipenko@collabora.com,m:gurchetansingh@chromium.org,m:olvaffe@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:lucas.demarchi@intel.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:kevin.tian@intel.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:Felix.Kuehling@amd.com,m:alex@shazbot.org,m:ankita@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:virtualization@lists.linux.dev,m:intel-xe@lists.freedesktop.org,m:linux-rdma@vger.kernel.org,m:iommu@lists.linux.dev,m:kvm@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[praan@google.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	FREEMAIL_CC(0.00)[ziepe.ca,linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,kernel.org,suse.de,intel.com,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[praan@google.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: F326D58AE7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 04:25:28PM +0200, Leon Romanovsky wrote:
> On Wed, Jan 21, 2026 at 02:22:31PM +0000, Pranjal Shrivastava wrote:
> > On Wed, Jan 21, 2026 at 09:47:12AM -0400, Jason Gunthorpe wrote:
> > > On Wed, Jan 21, 2026 at 02:59:16PM +0200, Leon Romanovsky wrote:
> > > > From: Leon Romanovsky <leonro@nvidia.com>
> > > > 
> > > > Use the new dma_buf_attach_revocable() helper to restrict attachments to
> > > > importers that support mapping invalidation.
> > > > 
> > > > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > > > ---
> > > >  drivers/vfio/pci/vfio_pci_dmabuf.c | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > > 
> > > > diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
> > > > index 5fceefc40e27..85056a5a3faf 100644
> > > > --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
> > > > +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
> > > > @@ -31,6 +31,9 @@ static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
> > > >  	if (priv->revoked)
> > > >  		return -ENODEV;
> > > >  
> > > > +	if (!dma_buf_attach_revocable(attachment))
> > > > +		return -EOPNOTSUPP;
> > > > +
> > > >  	return 0;
> > > >  }
> > > 
> > > We need to push an urgent -rc fix to implement a pin function here
> > > that always fails. That was missed and it means things like rdma can
> > > import vfio when the intention was to block that. It would be bad for
> > > that uAPI mistake to reach a released kernel.
> > > 
> > > It's tricky that NULL pin ops means "I support pin" :|
> > > 
> > 
> > I've been wondering about this for a while now, I've been sitting on the
> > following:
> > 
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index a4d8f2ff94e4..962bce959366 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -1133,6 +1133,8 @@ int dma_buf_pin(struct dma_buf_attachment *attach)
> > 
> >         if (dmabuf->ops->pin)
> >                 ret = dmabuf->ops->pin(attach);
> > +       else
> > +               ret = -EOPNOTSUPP;
> > 
> >         return ret;
> >  }
> > 
> > But didn't get a chance to dive in the history yet. I thought there's a
> > good reason we didn't have it? Would it break exisitng dmabuf users?
> 
> Probably every importer which called to dma_buf_pin() while connecting
> to existing exporters as many in tree implementation don't have ->pin()
> implemented.

Fair point. I agree with Jason that we cannot leave this open for VFIO
and we can have a pin op that always fails.

But at the same time, I'd like to discuss if we should think about
changing the dmabuf core, NULL op == success feels like relying on a bug
I agree that it means the exporter has no mm, but I believe there should
be some way for the importer to know that.. the importer can still
decide to use the exported dmabuf while being aware.

Thanks,
Praan
