Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GYWBCJLg2n4kwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 14:35:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 661DEE6827
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 14:35:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F31910E368;
	Wed,  4 Feb 2026 13:35:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="Zlkv2MNP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D628F10E640
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 13:35:25 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-502acd495feso78516661cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Feb 2026 05:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1770212125; x=1770816925; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cy8s41Ej9e437sslVRAHtURD2nYFlOPaZF56zUYznoI=;
 b=Zlkv2MNP6ARr+aoVWTKOVz9KBe9L++DgVe0XIUHG5GI4rcfLiESP/T2ErBvbO8JFdN
 FFAtdUbtoJ+LYy/AewfKJvknHLQpcASIs4jH5Tx8WcBnsSkdmWr6ek9gO1t4NOS03P8W
 iofvuY4ceo1sHgrnErGJPxrn9tdcD+bvxNuLpbo47OVS9f0wHOVL636OuRWes3WJlxLJ
 07C4jom2B/c6Df4wjFUyJHLZFXd3D939y1k9sKK5wMkeLHyVgu+WdYcUywB4U+0KIWAV
 QQIAA1GubAJVdgb8WikVdGHkUxZvAJLVTKUrHwkL/PqWcGbL01E9SZJPwlAXCEaWLyNu
 F0Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770212125; x=1770816925;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cy8s41Ej9e437sslVRAHtURD2nYFlOPaZF56zUYznoI=;
 b=o2cuaPtz4+hpNbEHqmlvMAqEI5Dvd19i8AbD8LtNhtzMn+sRX7Ep57Rys4eq3CDEE5
 AO62ahELmhxsYn/al7pnKEtA9MNJr09Q0IAyMxRKBX5TliVWnP6UHBdy7DAslY48wGN6
 Ubt3EwlDP+qOLkyiljmgdZDbnDk8VGgfIJyO4+m2UdcKDb90gvt4GK23ymqiOoWqrPG+
 JxC7odI2oPsUR/i8TFLBsTh9cq5iZIrmNhex6HQcAXJxHdtghkL715NbEoXxelkBcXxU
 AyU4I2RITQb84hWz1K2V9Z+FAJdRpSNrSS3a+lXU4joEq228BZB10Bzh6lejgqj0vsV7
 xzfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXa2lT/LfNl0Sg9iedUj0Hth3kl0M1nMVrIDeDRFhZukkRCLomn9Ng8tWjylVSTiBjOtefnd85+72U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzfFIYYNgs1G1a+hVkeZ9uw2h8p2xFamnn/rvFKTZrFFX8M/G6
 Qo5FePPCHFHR+2I29PPKOORQebkJXuTpnz3YN0pcFAx9HB6gJik3g9QNAmz2/Jcnsw8=
X-Gm-Gg: AZuq6aIBPTUsIs7D0EqVNuis1uvxf0R92IQSI7wlTmUP70CtEYhh1WIj+pvzZal+qP5
 tcZlmUv7vPp16vSisYZ4EiA4iNHE+mXyr7py9ZwV0OCKRjQh3rxx7fPPp5Lxhl3eCLW/uTK5le7
 cmk2DSKA3s7i+dat3AhJD9eojTpZ9O+K1vjAIsB71SBPR7A9oYPxwnkyQiPLJY8CUyXCRGnrvuT
 9L9liqmXlaOxShDJZP1DB9m+ypOlfsz9PJAjkzHFIkKEjumYNKq7m6gIwEETbzWi0BL9EG2soMv
 IMSJ6uah7t6V8i1ZoGa2NhIMXoVFhQLsZ3+Aa2a5zgN74UdroN+rDO7Wd5iK3M98ml8N/76LzHB
 kGJheYu7PIeXaZhXjTq5FPZ+g7kFFHvE8GrL7NQruipJtzDyb5jScwSmBgnhCchJywhKpg5baE1
 flPEE/Ogs1fsWGTcbyJN8hk2Yal90qVXZ+C7OMb2IWJBhLzFTKRi+jntDsqROOyeHSv90=
X-Received: by 2002:a05:622a:1aaa:b0:4f4:d29a:40e7 with SMTP id
 d75a77b69052e-5061c1c1dc5mr32950871cf.74.1770212124739; 
 Wed, 04 Feb 2026 05:35:24 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5061c17babbsm16346801cf.15.2026.02.04.05.35.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 05:35:24 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vnd2R-0000000H0ml-1uPP;
 Wed, 04 Feb 2026 09:35:23 -0400
Date: Wed, 4 Feb 2026 09:35:23 -0400
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
Subject: Re: [PATCH v7 0/8] dma-buf: Use revoke mechanism to invalidate
 shared buffers
Message-ID: <20260204133523.GD2328995@ziepe.ca>
References: <20260131-dmabuf-revoke-v7-0-463d956bd527@nvidia.com>
 <20260202160425.GO34749@unreal> <20260204081630.GA6771@unreal>
 <6d5c392b-596b-4341-9992-aa4b26001804@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6d5c392b-596b-4341-9992-aa4b26001804@amd.com>
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 661DEE6827
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 09:54:13AM +0100, Christian König wrote:
> 
> Mhm, sounds like AMDs mail servers never send my last mail out.

Oh :(
 
> As far as I can see all patches have an reviewed-by, I also gave an
> rb on patch #6 (should that mail never got out as well). The
> discussion on patch v5 is just orthogonal I think, the handling was
> there even completely before this patch set.

Leon I guess grab the reviewed-by from this email and we have a full
package if it needs a v8

> For upstreaming as long as the VFIO and infiniband folks don't
> object I would like to take that through the drm-misc branch (like
> every other DMA-buf change).

No issue here, both subsystems are waiting for this..

> So as long as nobody objects I can push that today, but I can't
> promise that Dave/Linus will take it for the 6.20 window.

Sure, thanks, and if it doesn't happen for whatever reason lets just
consider it pending for the next cycle.

Next is to work on the dma mapping type, I should be able to post a
rfc next week for people to look at.

Thanks,
Jason
