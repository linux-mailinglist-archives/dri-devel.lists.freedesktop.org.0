Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNEaFcdOn2n+ZwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 20:34:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAC219CBDB
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 20:34:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A03210E2FB;
	Wed, 25 Feb 2026 19:34:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="MN5fkTvE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A05D10E2FB
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 19:34:27 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-48371d2f661so10495e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 11:34:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772048066; cv=none;
 d=google.com; s=arc-20240605;
 b=QDI+9+VgV1FWvBK6kDvvIrNwNq4FFDOeZ0El9tAtJI20Byne4ksQaieOdvXS2aW8aN
 RZp62SErQUgkow/BELNKbVGBoVO70pTr8YiMlnBtSH1Q6GHEae0YPCUsXWzv8z2aZfT8
 DW5JAGm8fPu0f/8uWWkz54Z8SUmwQK7bgNwhDQ99x8DrE+JC3lxWCnmwM2iAu7GPC3cS
 oph1rgSc7p9O6h3lsCzmiAJGd+YU+HKVIK1PHlQjuUoHw5VxX1/ugzJaWW79RRMdnxXu
 LU4bVhAl3gUxvENBIU6ZqcrVZbfjLsbSGPWOrPmy3t1i5SghrBUgwoH/xy6aJs9a9oUp
 zRZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=7Si8z437tvGEJio1pwGBHAqSsYapkryN7R/ntn+VLWw=;
 fh=mQcK8TRXogtcUzASFJp66VDkozULPTC50Nk5NLkEJFc=;
 b=bRdeyHarNo6txQ9UXCtpgKXJ0FZMGCwXB6zQzO+9UG+vCyychL2vpZM+uJbTisbuog
 RZOGLlUQ79pv2jA2ef1UdaALlo5y4pu1ULR5hvTRGCQBpoYIwe2z2fygxuaPsJbyTsoO
 1YOmJMAGv/Cu3G1wLjNY2sFaYwEufE+hNou7pxLXZ7H5ToPEhckzcyFc9Dwyp+F3z7/2
 rFJxUPvVgrMmw7/kvKg6oKga7A/dPO/xtUjqG/yCYLX+nvMys+S4JCkYXNnPsrmNCPa0
 9uqvIPbhMbM1ypYY/pnfaDwgjlUwoRrK4Lsq8hTwHohDc6iwP6/5+IjzhUpMcJ4HjWJp
 R4nA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1772048066; x=1772652866;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Si8z437tvGEJio1pwGBHAqSsYapkryN7R/ntn+VLWw=;
 b=MN5fkTvEw5eBQp2JW8tMT5GOtAMB+RZk7g/5CiUSFHm8DiBB4Rz9eu3qx9Vo5eLoXJ
 oBylLBSqrUOSzHBuOvrys0xvP4SBZW3biPuhTIXDmgzTF65IohA12KXEIyFGqGOEJ+bP
 qjU4gihWmX6kNeMexbUVvnaI6/I5Ty6eB6QaWmIxjhBNjG0sg3l43kjSK1N6IF5sYGs+
 fO2dKym8p7/neua8jq7veHiINTHnyXU9tLZd+wA0dACx+dvC1yHumRBLB3E2mKsJhIsL
 5hdhO+t69NlH1RvZ1cLx+pbjg0NTn0LOiKiJv/cLreYDmXu0YU4s8rCTozcyOtSj2Stf
 sFzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772048066; x=1772652866;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7Si8z437tvGEJio1pwGBHAqSsYapkryN7R/ntn+VLWw=;
 b=wU+OcDl+iSp02+r+rFlYHqq6UVd/d6bsSxjIu9Q0WmcDGy7jCY39z9geI1EKhj0uZm
 MWiXofY/l5rp8S+MsDH5b81BRU0MsnAFquOA8P77s+ksTRauI9irw0nVN8pp6e85qLTu
 9H0VCyiB8T3eAcriZYkuDU48Z8+c9gMxLZ4qO9/bvtj/lywFWC+U4c4lzgjbrdGS8kzD
 iaAfYOJbRH+WlAf3nur8Bhv0pWMutwhohjqAsIVu+Wk2P8nSP1eGdx0D/pu/BYmVxOP6
 fQ3u2gqlARvXTnT6QFuo3C+3J1MNdaxo6DIi4PDyZPJ+kRpZoewylJx8l041VeYr6sK4
 r+LA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSnC3pZpZSAiY41nwLFiZRR202QoN9//7w+i8iJMBKgck6xCsqcIjAYqQMnrYKwGPMK7paJjmvxxQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxaZaB+xdyBILKZUbYyyx0nE/8Cm0/+sH0cJFzPNbKDZiLZa//B
 od5ru3JP3byZwSe9TSYh4tOjNOXKMhP5D9hpWWED5Zyh17vv+GPFHfhGhBLPjjZFw4DGGPlG/FT
 gOfalVTE+31aEvgIPTpSWZ3Qq2spj3hbEMF7fbXzt
X-Gm-Gg: ATEYQzwWTQU6IlVHLQYOEgJEpKPLWG9UuCUamsVdavU3prQZK0BjCZNZkVN/o0iCSvE
 JvjuqNIh/V/olzgr1RjUOPKzDIrXmFA3MJdcAIBL7weQFhsBpUs7d8kzAE9MnVJhddPkZfnbleo
 0sE2a1vfpKMO/6FchbCpvAHH57xoW/gR6Vhxl82wjjE4lIR5kSQVQ32RkukToOVHzBZwrTZ1/Nr
 qlmGxLeHa4VGk/rqdceszii58ma2xCkgZ8luWXz/Q/2XOk6KOUvRW4wCer/Gegh3RSrGHD3o7Bd
 T74RLom7xyXiCSb7tmM9iWxiKtx0OmqNFQsfkPbMaCugpaPOt+ThPXddtCDhcjJelytmAw==
X-Received: by 2002:a7b:c059:0:b0:480:4a7b:228 with SMTP id
 5b1f17b1804b1-483c3195488mr93045e9.1.1772048065599; Wed, 25 Feb 2026 11:34:25
 -0800 (PST)
MIME-Version: 1.0
References: <20260225-dma-buf-heaps-as-modules-v1-0-2109225a090d@kernel.org>
 <20260225-dma-buf-heaps-as-modules-v1-2-2109225a090d@kernel.org>
In-Reply-To: <20260225-dma-buf-heaps-as-modules-v1-2-2109225a090d@kernel.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 25 Feb 2026 11:34:13 -0800
X-Gm-Features: AaiRm51mS0fj4CpzrUrBMi_FPuw0tp6YT-qMjNhlthEAQ04zl32goABU8oOB09E
Message-ID: <CABdmKX06VsekPpwairaWC6JuH6BHMj-NqJj1cYgR=-rd6iY9ZA@mail.gmail.com>
Subject: Re: [PATCH 2/7] mm: cma: Export cma_alloc and cma_release
To: Maxime Ripard <mripard@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@suse.cz,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-mm@kvack.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tjmercier@google.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tjmercier@google.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: ABAC219CBDB
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 8:42=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> The CMA dma-buf heap uses cma_alloc() and cma_release() to allocate and
> free, respectively, its CMA buffers.
>
> However, these functions are not exported. Since we want to turn the CMA
> heap into a module, let's export them both.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: T.J. Mercier <tjmercier@google.com>
