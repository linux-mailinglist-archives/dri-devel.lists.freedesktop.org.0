Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YD1zA03VcGkOaAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 14:31:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53019578E0
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 14:31:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C15B88F94;
	Wed, 21 Jan 2026 13:31:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="dr0ExeED";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3881310E154
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 13:31:52 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-5029af2b4bcso29276571cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 05:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1769002311; x=1769607111; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=aX294P4TliS2B0BrPhrC1yfpgvWNBReUGID/aL6TSBE=;
 b=dr0ExeEDyi5g/bVQS07zFXkgjtpQtmdamxgvPGa+Qbt/TLE9ulnRuTb7t3D5dZVvMe
 esid7rScWII/APmsLWprvrilGK25VG4wiMFTEwMFsqLMep3Qd98RCrpTnaSSgbYketgo
 yECNYaz6dqFX5Tj1zQdBPEG5SNFI5bhclWDYpM68gS2axBR0z03aaGyCNVbdlkqUKr1V
 tJnThtjASU/QEBYtNcMV/k6T15M/jntvWQjn2HmwQucJB1AcVvEYuJDir4nE0Zxz2p73
 Qj008tDzN1BE98X79V1ittf2pcofPaCJN+M1bZJAfJ+ufY3sL+V0x07tQi3WMgPfC29C
 sCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769002311; x=1769607111;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aX294P4TliS2B0BrPhrC1yfpgvWNBReUGID/aL6TSBE=;
 b=D6L/9MyZM8biWesKN5C6GxTO89mKVVZa2VuG5AF46TIXnEo7S7gey3YAnev8ipxf+p
 zRT776iM3ztL0fCVpgaoIwzGpDE8ykNsbsA0K8jDyP+QcqD28rS4Aqs58UENCOM50Grv
 p8TPWc+1AE1UwHCr3DhJ7/YSiCrtQ8dBRxxN7Vy3PyRVqCu/Aa21oishAg9cf9Orqaj9
 JURkvAVTctWZc0PXVbeLxkPB1uZhDULD1Bt+VJ43QtbMAH4WjlZ41NyF5obaM34F8d3+
 CdxbJFOSpwZ7CrKMTw0pTiJ1cszjP8ag65pRdhJ9csBat1WfUzJ36c3lEkSyWaxurzSt
 w8zA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkbcB9NUmqqL0zmVRN6MVTmp2P38KvFxXTqlE3tg4a4vWCxeKsZ2cVBPJSfpoNsDBHc7i3TaQQtmc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbewdfNjv22Kglosgg1fLRPfNW2IskKeOInySalUxO46aFEbK+
 oiP8sKxg9EMnSeZW5cY0Eh7EEjZNq4teQ7Z/bLsOo5Zgb9i9cnXrqbT45vrZwvjT2Cg=
X-Gm-Gg: AZuq6aL6TAWtTiEA1tJ3Q1MIsvyRL7nZBsYSpo/Ov7u/o9eZuP81UOtxu4VXJqZ2pY7
 bZG4Nu2pKHcatEBm/Xd9WBsrmnaG8YcCosZ8P7ETKf/UWUZq9x3NDwTEiFZBQV7rIhPytxiC0W2
 +3jgEnhz6TadYfKI1cUFFBaCxeg6jOeT9bDRakenWC9pgSPNV0epshoMEO2n7SsGCf5l1DyalQt
 Y+5WThvb+vuA8h6FNkFsMJhktH46JnRSc3ecBIUE8XKO7vRyp6cwbFDjYkialnVcvKccXsVc8t4
 ReEt3aMYbIRHDT5R8l6yuJ5zVidZJHDX+hJr9JGIQiESKMn8BmWUMLRgvjekuEqyTq83jnk3lGX
 WqGU79mEnYwvWIQ9fzFAzXrapX5auLQS3z0kxwdCROFfFOHUSGVTHcle1PLdukfrtPlKB6BxO1Q
 FY6nAM2tqcp+FJnFNJVigjvb9ul50T+0kbIrfRyPlF0XAfvs0CLmqn/MsJ3pvO5ahV8JPqKwmY6
 e/UZQ==
X-Received: by 2002:a05:622a:1aa1:b0:4ee:2200:409e with SMTP id
 d75a77b69052e-502d82772a6mr67009251cf.4.1769002308002; 
 Wed, 21 Jan 2026 05:31:48 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-502a1f1c1c4sm108692291cf.33.2026.01.21.05.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 05:31:47 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1viYJG-00000006Dbm-2x5v;
 Wed, 21 Jan 2026 09:31:46 -0400
Date: Wed, 21 Jan 2026 09:31:46 -0400
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
Message-ID: <20260121133146.GY961572@ziepe.ca>
References: <20260120-dmabuf-revoke-v3-0-b7e0b07b8214@nvidia.com>
 <20260120-dmabuf-revoke-v3-6-b7e0b07b8214@nvidia.com>
 <b129f0c1-b61e-4efb-9e25-d8cdadaca1b3@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b129f0c1-b61e-4efb-9e25-d8cdadaca1b3@amd.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,ziepe.ca:mid,ziepe.ca:dkim,amd.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 53019578E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 10:20:51AM +0100, Christian König wrote:
> On 1/20/26 15:07, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> > 
> > dma-buf invalidation is performed asynchronously by hardware, so VFIO must
> > wait until all affected objects have been fully invalidated.
> > 
> > Fixes: 5d74781ebc86 ("vfio/pci: Add dma-buf export support for MMIO regions")
> > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>
> 
> Please also keep in mind that the while this wait for all fences for
> correctness you also need to keep the mapping valid until
> dma_buf_unmap_attachment() was called.

Can you elaborate on this more?

I think what we want for dma_buf_attach_revocable() is the strong
guarentee that the importer stops doing all access to the memory once
this sequence is completed and the exporter can rely on it. I don't
think this works any other way.

This is already true for dynamic move capable importers, right?

For the non-revocable importers I can see the invalidate sequence is
more of an advisory thing and you can't know the access is gone until
the map is undone.

> In other words you can only redirect the DMA-addresses previously
> given out into nirvana (or a dummy memory or similar), but you still
> need to avoid re-using them for something else.

Does any driver do this? If you unload/reload a GPU driver it is
going to re-use the addresses handed out?

Jason
