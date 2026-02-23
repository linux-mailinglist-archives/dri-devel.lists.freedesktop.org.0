Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBw/N7fem2mu8gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 05:59:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DC4171D67
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 05:59:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97EBE10E129;
	Mon, 23 Feb 2026 04:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nSOaS1es";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com
 [74.125.82.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC22D10E129
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 04:59:30 +0000 (UTC)
Received: by mail-dy1-f177.google.com with SMTP id
 5a478bee46e88-2ba6aa57d5fso3796586eec.1
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Feb 2026 20:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771822770; x=1772427570; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ar5KC76tgxYX5PKL9eOkCAkUY5PVkOEvBMJNrWwerKw=;
 b=nSOaS1es2SK/9DMaJJ8aiEuDJmR4c4IeF/6ys8YlyztLFkjy6hLJSoyRZMKQyuCoqA
 4vVXEa01gVAMQzC5DyvrOGEJC9i8t6+zi2k2Fu0w0qG7YWI16wfoRf+2ttCl1Y44ZZRu
 57b3zu5z9FMYLKNdDGbX25UWicrAlhMgEySyJEpxgv3/Sk3wVLjnUDAwv1dhqJmiR8P/
 NxDItnavvQ6k0nkBh1N3pF9RbK1p7PJvSoEihl+/nDv623ezMZlltPAFdeVI9lR6nl1D
 a1kFvMmbo6jIPulIg4w9PuaHnHLmzewrfusRBuzmtAFeceKJbo3aLW+cXbZCVl3LaRnJ
 kmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771822770; x=1772427570;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ar5KC76tgxYX5PKL9eOkCAkUY5PVkOEvBMJNrWwerKw=;
 b=jeJqrarvXoPDFQgJhUfwOAvkoAVzDymFHeL3LhNouymgWdHwBDljSkC/dujapheDFT
 MQD/jDmwf1tOZAo0ZtztaPkbnNJeur56Oq7fLlcorZ7Uxq6JJ3z2xOQOc5x1t0lCMgmN
 5nXCzIJgruun3mWl+MChrUlSsTqt2S9DQP0Tq/QPzMsI6R3YGmNOOEK4yMMfVbe1uXwJ
 SMOF7MQDv04A7XUSk/qSKxuGj41ewKTXtHr3ji4lrgn452z+ZW9hoISSrv2pbk4Psm9d
 63PIVs1JlfmCt32gPML8ELFYC5pABTN1BEAdSkGGDSmpUTM+zZXkSuSiId5MDMYwhx+E
 nmLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWajzC4DR39KFNfOFkiYmsvOiwBqLfvNLPxDeMlT92WO4QsXZcsCx0Hj3uQm5v6296G0p0H4ihl43E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/qMsdcDFKMB3wKIga8jA+IAkPoZ3L0C402NlS6xXwCMZBcwAL
 J95GiWRUHBQ5wveBbYCd3pTZYNlTAQFHnUR0ikmwD+MOQS0zlEfZQwTN
X-Gm-Gg: ATEYQzyQ6ZxQdsu4QeV7X/CXUTu1uQF1aq6nvU46O44ziod5cBS10Q2h+6aT0VnF6Sc
 hlmchvwkhcMX5IYCmYk7PjwNhQ8I/qJ9lkqdZOn2roFr3CmoNkP+41n2wyOrsChy4coYsAjFa/x
 wo2rs1+DKQsz0aIjJ0lt9JQvVeyKM/EVZJ6mXV6quUcSGkD8qxNjViVX8vgFBdnqpFcjZxOjUtP
 CXD8tlQilhAlBxn+ttgwF0DTMeYjFXBJh9GaTzGTsPGBSoZ/5bFoC52AiZULRa+bmDEu68veL6j
 shbQ720oVfxyqI+Gr41YVxpDFWTz6KFN9mqeT4ae6yOovF5qJmUgOzhcgDWAeQD17oxAFtPDMYb
 0Fz+VoIDNiw2kKvss4l8Kd0yBpmIyN/R/63XAYgruYiiGx8lEBzAKZkMwYUNa/N9jMuBPp1ezFB
 C9iFvvghsTZDzeHqZnAjm/toZW5CTBXetLtt9A
X-Received: by 2002:a05:7301:6783:b0:2ba:6b03:90af with SMTP id
 5a478bee46e88-2bd7bb4b383mr3387725eec.6.1771822769743; 
 Sun, 22 Feb 2026 20:59:29 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2bd7da4775dsm4300363eec.2.2026.02.22.20.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Feb 2026 20:59:29 -0800 (PST)
Date: Sun, 22 Feb 2026 20:59:28 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Edward Srouji <edwards@nvidia.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Yishai Hadas <yishaih@nvidia.com>
Subject: Re: [PATCH rdma-next v3 2/3] RDMA/uverbs: Add DMABUF object type and
 operations
Message-ID: <716e8a8e-e4e0-468d-9314-10082c2bbb8d@roeck-us.net>
References: <20260201-dmabuf-export-v3-0-da238b614fe3@nvidia.com>
 <20260201-dmabuf-export-v3-2-da238b614fe3@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260201-dmabuf-export-v3-2-da238b614fe3@nvidia.com>
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
X-Spamd-Result: default: False [0.39 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:edwards@nvidia.com,m:jgg@ziepe.ca,m:leon@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-kernel@vger.kernel.org,m:linux-rdma@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:yishaih@nvidia.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[linux@roeck-us.net,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:-];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.967];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[roeck-us.net:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 51DC4171D67
X-Rspamd-Action: no action

On Sun, Feb 01, 2026 at 04:34:05PM +0200, Edward Srouji wrote:
> From: Yishai Hadas <yishaih@nvidia.com>
> 
> Expose DMABUF functionality to userspace through the uverbs interface,
> enabling InfiniBand/RDMA devices to export PCI based memory regions
> (e.g. device memory) as DMABUF file descriptors. This allows
> zero-copy sharing of RDMA memory with other subsystems that support the
> dma-buf framework.
> 
> A new UVERBS_OBJECT_DMABUF object type and allocation method were
> introduced.
> 
> During allocation, uverbs invokes the driver to supply the
> rdma_user_mmap_entry associated with the given page offset (pgoff).
> 
> Based on the returned rdma_user_mmap_entry, uverbs requests the driver
> to provide the corresponding physical-memory details as well as the
> driver’s PCI provider information.
> 
> Using this information, dma_buf_export() is called; if it succeeds,
> uobj->object is set to the underlying file pointer returned by the
> dma-buf framework.
> 
> The file descriptor number follows the standard uverbs allocation flow,
> but the file pointer comes from the dma-buf subsystem, including its own
> fops and private data.
> 
> When an mmap entry is removed, uverbs iterates over its associated
> DMABUFs, marks them as revoked, and calls dma_buf_move_notify() so that
> their importers are notified.
> 
> The same procedure applies during the disassociate flow; final cleanup
> occurs when the application closes the file.
> 
> Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
> Signed-off-by: Edward Srouji <edwards@nvidia.com>

When trying to build powerpc:ppc64e_defconfig:

ERROR: modpost: "dma_resv_wait_timeout" [drivers/infiniband/core/ib_core.ko] undefined!
ERROR: modpost: "dma_buf_move_notify" [drivers/infiniband/core/ib_core.ko] undefined!
ERROR: modpost: "dma_resv_reset_max_fences" [drivers/infiniband/core/ib_core.ko] undefined!

The code now requires CONFIG_DMA_SHARED_BUFFER which is not enabled for
this platform.

Guenter
