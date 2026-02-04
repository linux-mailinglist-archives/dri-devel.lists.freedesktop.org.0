Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONhAIjBQg2kalQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 14:57:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF12CE6B62
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 14:57:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E3A10E64E;
	Wed,  4 Feb 2026 13:57:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="Cs2LwwUR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C1C10E653
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 13:56:59 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id
 af79cd13be357-8c69ffb226eso934533085a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Feb 2026 05:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1770213418; x=1770818218; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=iRrqXVZVX7Z3YtbKGBkBfsPXFsl6FxGibC0bf/QAItY=;
 b=Cs2LwwURh20GRUGYCEAfO4zQPcoOwwNf9iqYwtmQ/3ZG5J9uKkHGUBhMUL/0/PBXhi
 y/P7dOvWXhwn2fqwEK+1d/J0H1E+pR1dKIaNNLGLN+czJxq97pJ6SGNK2Mq7N4LCa83s
 kNtwN+mihW7gvHI7A91SKIzYWhm6mr4KrFuxMCUm2h/Keqnlh9hPHhCEBNGz+OSj2D1k
 2wL2oenaZWxaxAUii8MX4L2whiYyxVD/gHid9l/9ndDEI3WdMxlB+nppcjF87mp19lme
 noLWCtM3X/TKGqtIaiUDsfeOCWkZh7u8j+JHS45pEA9Uw8fUW84Sv0IEzSzYma3OlPrg
 P0Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770213418; x=1770818218;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iRrqXVZVX7Z3YtbKGBkBfsPXFsl6FxGibC0bf/QAItY=;
 b=AUWfc7NyFoVfYSrhlVkcUwF340er1BnbK8517ruOtoOlZPyS15I/8yZhFtyhCpuODm
 /gFvbNUCOgT6sJ+LkO0jK8VcWMWjfa4eUFizC1wKBTWqoHYwg76FrryJqZWKmzMtaGJ8
 QLX8pOWSHiP3483H2XJB/NW8IqZr0RVCM/4dI+l0PYDYw34YaM8MHwOpIdGHp66xqmM/
 TQrFdkLkwtq4wjyeslf/lxZ9m2lw/5bpxCga12sA40ZMgXhyCdt1VOIgiTj+WMTA8ud1
 AkVbv0heOxALp74fzxV7aCwxhBeVFueLL0pc+CIx8VdLctLHF3vzQ/vQzh8dg8KJ48wV
 ZiRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIAfdS5SZEFcbt3O+E91hZvPadejTmv+O0KQKym+Rf0L378el+XkI+VUEQs8ZqgLDEXSGE1xec+x4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3Fv+vhm2GXWBhHfQspszRm6qd1m8AYozEPrZS/wKCtLTai1e3
 Z81ypPTgLPf7vMTYBhxfM80IU5aM9Y0mPjnAWxue3meLQO4JGH5g6hlJok7BDID3FI8=
X-Gm-Gg: AZuq6aJYMAHUdL2O/UTejygtywG7xR7Tun5/Mz8udqD9Qcrd9/JaLHgjGNNw2WdyuKj
 ax0EF8Omfl41/Nt62mqkTH1pSr7eZjIxfXx78fpQF8Av6/52hnbrEDEFHrLUTHwIFeuHfdPMlz0
 V21IOGBrPniKAMIcwvkFuBq5vEVLHE5OdVlm2F8x9vi9QDwIFLK13gZffIajLsAd6NeCbRCV5ze
 OAHIT6OMG1MMVNVzChv1TAoWeyFzwShtfI+htrWMtPu60PgOLLQ/Xvj2X6sk23QrQE9J4x8z78j
 TrPoWueMxMKBW1nbD+LIRNlsEvtIgTGhxGSAbC/ZKf0BnrAs6IEb2/CHZovCizIfqg+d+IK7sLe
 hrZhqrdFRqx8PRr6VRC1/ZCLslkiikEfsSeunlKnRNZPP/8hg69XKNi7liDU1No5TOrbo+26XRB
 p3mAIk2PAdUpVTUm1X7Z7ENm1wtkI90VuOnLS/X6aQpAh1IVxGKaQ1X+U7vRKHQuYHbF8=
X-Received: by 2002:a05:620a:3953:b0:8a1:21a6:e045 with SMTP id
 af79cd13be357-8ca2f82b068mr371751685a.19.1770213418187; 
 Wed, 04 Feb 2026 05:56:58 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8ca2fa552f2sm187407785a.11.2026.02.04.05.56.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 05:56:57 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vndNJ-0000000H1He-18eG;
 Wed, 04 Feb 2026 09:56:57 -0400
Date: Wed, 4 Feb 2026 09:56:57 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Maxime Ripard <mripard@kernel.org>
Cc: Leon Romanovsky <leon@kernel.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
Message-ID: <20260204135657.GE2328995@ziepe.ca>
References: <20260131-dmabuf-revoke-v7-0-463d956bd527@nvidia.com>
 <20260202160425.GO34749@unreal> <20260204081630.GA6771@unreal>
 <20260204-icy-classic-crayfish-68da6d@houat>
 <20260204115212.GG6771@unreal>
 <20260204-clever-butterfly-of-mastery-0cdc19@houat>
 <20260204121354.GH6771@unreal>
 <20260204-bloodhound-of-major-realization-9852ab@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204-bloodhound-of-major-realization-9852ab@houat>
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
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:leon@kernel.org,m:christian.koenig@amd.com,m:sumit.semwal@linaro.org,m:alexander.deucher@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:kraxel@redhat.com,m:dmitry.osipenko@collabora.com,m:gurchetansingh@chromium.org,m:olvaffe@gmail.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:lucas.demarchi@intel.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:kevin.tian@intel.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:Felix.Kuehling@amd.com,m:alex@shazbot.org,m:ankita@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:virtualization@lists.linux.dev,m:intel-xe@lists.freedesktop.org,m:linux-rdma@vger.kernel.org,m:iommu@lists.linux.dev,m:kvm@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,amd.com,linaro.org,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,suse.de,intel.com,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ziepe.ca:mid,ziepe.ca:dkim]
X-Rspamd-Queue-Id: CF12CE6B62
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 02:44:42PM +0100, Maxime Ripard wrote:
> > From what I have seen, subsystems such as netdev, the block layer, and RDMA continue
> > to accept code that is ready for merging, especially when it has been thoroughly
> > reviewed by multiple maintainers across different subsystems.
> 
> He said it multiple times, but here's one of such examples:
> 
> https://lore.kernel.org/all/CA+55aFwdd30eBsnMLB=ncExY0-P=eAsxkn_O6ir10JUyVSYdhA@mail.gmail.com/

Woah, nobody is saying to skip linux-next. It is Wednesday, if it
lands in the public tree today it will be in linux next probably for a
week before a PR is sent. This is a fairly normal thing for many trees
in Linux.

Linus is specifically complaining about people *entirely* skipping
linux-next.

> So, yeah, we can make exceptions. But you should ask and justify for
> one, instead of expecting us to pick up a patch submission that was
> already late.

I think Leon is only pointing out that a hard cut off two weeks before
the merge window even opens is a DRMism, not a kernel wide convention.

Jason
