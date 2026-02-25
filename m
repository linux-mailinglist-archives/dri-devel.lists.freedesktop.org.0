Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qG9hJ+VOn2n+ZwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 20:35:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0975319CBFA
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 20:35:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E816610E22D;
	Wed, 25 Feb 2026 19:34:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="O2hiZQYV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67BC810E22D
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 19:34:57 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-48318d08ec2so10115e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 11:34:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772048096; cv=none;
 d=google.com; s=arc-20240605;
 b=ROtwf5/FEbt2WfB8mb8aqWvw6ISbDe3nu7Bxip5ep9zDXg3OX/B47UZdN6EZCiMpPJ
 1SD90diygfsE4IT2m/GtEOSu7O9R/bN8fi4wClTBWSAyySXZMC1y+ayDq3rHi/MpTz25
 Suj7yaqs5h4eawct4hXCuL/G0f0T27TO6r+tYiuRz0v2TiyStdPrRq1rzttd1wZWAK9N
 Xv3c9FQoPIUQ/GgQ7yy+cl6NoZOh55mIfhde/aRqxOPN+nXgfsKQcbXVNPLu4+GlhfYt
 Mqf/CpngfW4M9Rjk201Sns2SvdAvxBH9zHqQemx5/Xykeo+9BKZbTse8Yd1aiSD3muL1
 KvDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=JcGfZZLTy1EfxpUAiB3PslYr4DWldds2kTYxvCknlIw=;
 fh=vZWFniEq5XxYl8G2byCfsb7CFxrSh6aq/y8q9RdwcEg=;
 b=H+/SqMjleAJ+cLNtCgW6GWRPKoi6DvSDwS/K9hHhlIwkW818mcPZpFAhc82zpSWLQ2
 pgSTchr8IpMBCiyIyk1zpKgUuI/vreEEfv59KD97Jx3eRDQDrWnq6unbp4RZ32eCRsXk
 69fPRPcPUFfp1wjcCO8JF/Qp4sDEQ7fzNqt2MEdkLtD/9kwuQE887OIV4chYnttdxLhU
 CMhokuSiwqfxNpangVTZoxD0v4dBYkJXd8/xcvkGQI5T0fwyTvh6Ga0TnJXhFbxQBOcT
 V3N7AyRQeo7X9mKZsz0XtDAyz4/mIDCFOdb6+oz6Tow2lt4MbdyYfjGZTfrSSVh39Csi
 NVvA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1772048096; x=1772652896;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JcGfZZLTy1EfxpUAiB3PslYr4DWldds2kTYxvCknlIw=;
 b=O2hiZQYVX1lbadvFp7nNIm4QNcjEzlWfEJCsAmqqGi8mV2OueiX0k0ppnciax12gfe
 R/wSWanGTJuqaAtnzkis8/zVXw6+SB/G0yW+ggU50cbzGb/wM/Y2O1iFUHvOWQ/FpuKH
 GnqJCCRiAyvCb0Pg7mPjytiJx3YkFCj4++lxXQ0o/X/jkZ8rvubea7TGBWgGSmAOyYkC
 VU4MBfy36H+7b+4lC8670syHgd+KWSoMWHR0dfihtnNlkdmJZ6MPNBQVdwzw/OPE6b2s
 yNxoctLwLfRvAthlyF748fNcK4l789FVToL7Ib3pJR+rxoiML2kxF14StQFjdxbtpPcr
 p5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772048096; x=1772652896;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JcGfZZLTy1EfxpUAiB3PslYr4DWldds2kTYxvCknlIw=;
 b=GH73WrflrHaYN3V7qc0Z7xu6MedynHXF/271EY4JICzH5Jh79X6c9BtTSvyUiFIrEI
 7TVSYsVC6vB9Pw/5JBqtX8fWzWPrwOOjuHAbz2Bm6Ix+MgFndSX/1kkL9Ud2/h0sKAWL
 0cgJsGd51aq8uYsgQ2hqOq8XEivxcqATASfeMjXeqq2+d2QGjXNbNbK97qQmPGRw5NqZ
 RyJgVFMVHNzl54MMXFte9Vr25j/tQqeQt7tazBEwZRmem/0/oTELn522DqTNic8W2Oj0
 vAsjY0pMxSarDwO6MAZ+wY42KWPgJGCIXUBUVonrgLVJHltgEKoRZMkHdemLySWvAARg
 8Qgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaNfyGGer05DfGDXWsIyuC/tX/eG1U7a6fdKFXZ5w2qBIcJ0/Kc46iUcDs4zyAu/c9ik7QP0dbgso=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhyHbBSM9zNM9QDUMkV9zAC4NZR4yKD91De0y6bnL3lVcev4P2
 5ELejNH4fWJXH9BmrqZbdsw+4f5GusBoa1E0voGq+Rs50tEH0X1YdzqtPO8n5LUydY3YY/1wZ4h
 5V7DoBpmCEm3SefMbQnsGznceU79ekPBUuSdl3CdK
X-Gm-Gg: ATEYQzx3Alw1lKGFY0vr8bwUYaWO0ywm5sqNWncgpYJg+7Ir/eWhSjjQLtRR9bpzguS
 BqvI0WMcjCugfZimBkZN+vVhH4ZYc+h+uhLLW0gUTBbFkgTHMv9gbDt/gO3o9E4rAqZoKK3xzZ1
 8mRYcKk/7WfNG5iF81O2oCSMDl4OqpyXsKIfzncW8QkYSMUSLJvYzCPjjG0lvtlI3Z3Tj7iVtcy
 FZ66HGbm8Rx+I4SpjU/Xzc0tL85hfuEs6dIyP4GAO4JCwMlRjlKOIewcoloyRqv1lOM/ah7GKbV
 L4DLtCKAOe9lk750lE9hVP1FeWMtVyYe4aeyz7n8vDS3fEmQ3K0LsOHN1I6MtqFhBMUsWA==
X-Received: by 2002:a05:600c:628e:b0:480:274f:843d with SMTP id
 5b1f17b1804b1-483c31b00d9mr66475e9.16.1772048095548; Wed, 25 Feb 2026
 11:34:55 -0800 (PST)
MIME-Version: 1.0
References: <20260225-dma-buf-heaps-as-modules-v1-0-2109225a090d@kernel.org>
 <20260225-dma-buf-heaps-as-modules-v1-3-2109225a090d@kernel.org>
In-Reply-To: <20260225-dma-buf-heaps-as-modules-v1-3-2109225a090d@kernel.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 25 Feb 2026 11:34:43 -0800
X-Gm-Features: AaiRm50gu1dpca-LBzWZRd4gNx9rYHRkdAZSms4Y4Ytlet4IdIIADCtT7UW67vY
Message-ID: <CABdmKX0hGSSbRFwni+Mzq9KbpxwCHzAFPc70RZVv1GmFW92fzg@mail.gmail.com>
Subject: Re: [PATCH 3/7] mm: cma: Export cma_get_name
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
X-Rspamd-Queue-Id: 0975319CBFA
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 8:42=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> The CMA dma-buf heap uses the cma_get_name() function to get the name of
> the heap instance it's going to create.
>
> However, this function is not exported. Since we want to turn the CMA
> heap into a module, let's export it.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: T.J. Mercier <tjmercier@google.com>
