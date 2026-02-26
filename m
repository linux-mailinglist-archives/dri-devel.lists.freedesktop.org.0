Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EwSNt17oGmMkAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 17:59:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D05A1AB7DF
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 17:59:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A8D10E9D7;
	Thu, 26 Feb 2026 16:59:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="exl8CXHC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F8F910E9D7
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 16:59:05 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-48373ad38d2so106405e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 08:59:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772125144; cv=none;
 d=google.com; s=arc-20240605;
 b=BdwiGdzB32J6wiTfPUlUQM/g8KEWziH5MF6Kzs8wFXXnf2tTEycJmbdeGo4veeTodP
 n4h73qpsySTpOu6BIXmdHRp+pbHVzHeivQcYK83AZTAh/e3+ggJ1kvOs6J08PZ4nodvC
 99Hl3I+piLzWoFyXEPCYFrLvhA7Ta60RZ1hjwSXpGNfhGo4sjEjeKLvLDztDsJzsBN71
 6gyzH9mEJ9EcjtOG4cn12/OgawUfrPlO8nG5+MjOPL+eXe+xErOXS5D+0/nO/Rd4rTjx
 jHeZ+7Z2S5XYmkwdn5lBkGbCFFTdM92vNcULPy/4NOMZn3PO/aipX4204iSWspFJdq8n
 Ro4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=GaC7hfbtyJLGGerhfBe2P9Hj0mHnDOXyDJFEYnDiBqY=;
 fh=7QN8bBxkLCmTUGt7bLOZX39W9FKnhB2ywO0RLjic3zw=;
 b=OGxpEe2pn38v8OH7coYTNUH1zFi1ToCu1sE1PBmm7BS0Q+Iad2s4GlKJyzEQKS5nyc
 YE9N1kbwoPdwpnLxtF41VNUfg3oP/Tnff8jMxoFNnxwZcPWU5Zi6+ccGZR2S5JS99tHh
 CiDFSq03/9fLz7YNH2RKj0pEO8Huwj+JbD7X9lckLbOVzclExTOb+5Kvqq2Bl+Qc5UyX
 sRnP+GK5MDhwQ98jjapHiHgGfOhGzSOHi578gFb4Cjt/PK+t9cazL7i3f6UnTna0m5jB
 eEfQAKH8r2dYCD9tk61fkdyrXjfFkVmrxiyA8PnPhzGSQUcRwlXPlFVNC8+p/4TlgieE
 Vc0g==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1772125144; x=1772729944;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GaC7hfbtyJLGGerhfBe2P9Hj0mHnDOXyDJFEYnDiBqY=;
 b=exl8CXHCG5WLnpwfFUxt363hjvf+UV1cW5TgYmVWdhETjuqWgY8lwkSCT/fIz6MVsP
 cZ9uflUKTVUNXnFkWvF5YgExLQNVlIz1tKGaXNTGg6EE7PGLBuAD/fg41UITnM3+HjFh
 9zWgsalAAKrkVV8+FKfoAjJ1CGI/dUs8COv4H/C+NnKJ3xKKvA/LYp7PE2Cd5btu+yC9
 8Muy+VFQ8xN67Rmm0XHhFtcFampkj9zpvr9juySauRhzD+YzlAdY8PTGk5bRsCpNXMv/
 AHYCDzIBvAUXX0dU0jskaagH1iOOAXyfo6ivbnSjnyb155cpdlweoaHlHJVznNCM6JYg
 woSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772125144; x=1772729944;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GaC7hfbtyJLGGerhfBe2P9Hj0mHnDOXyDJFEYnDiBqY=;
 b=ULwmn7NpgIpcq7bAWbRrSgEJa74dLmSS3FYAfg8R5PI8NZhW/zECex+t/6S+fOLAa1
 gK0YPuCRh3ryFoKtwvxE2VfRVjajyq+1sO7M1Od5wMPattRC7f0kyN7vbYQOEPGlHARo
 HNNZ2qr7Nn7KKqArJIwSeSzuPAXsXcFst5+5S5crniP8+BhjnUxEfe/KHerG90x8au0i
 xS/ZR0Dm+T5gVWn3SlP3lSNZuJEt7seW+WERjC5EExQQ3ut2xD1iQTrjxllWK9277KwD
 dJhAvpVDRpvU0RN0/5mxELMVydVzbJJwXWm34rnqhqTITmqGqoOOg2KhyXb5Csl0qF23
 3Zmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1Sd0xwcc/wo/kP0PAaYABE5d85mdW5Sr+h60ujK5aa6/5eVPjoUdNH+bPogT9leL6IDJ7ij/RRb0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgfBBf4vbCYigzYc+DT3jqU91Qp8P3w3etoGHqTPQ8XL9v5kFG
 tq+up7zM6gzc0KVO7byrpvwqpgMZ//JnoQxfv4aC+2sas5BnT0KdCB5RMPIRA7JgE4HDjCPbukI
 QRzZCzASpCefVPbV1zLWkFrFkNJaGT+uSaVREIoYD
X-Gm-Gg: ATEYQzzfUeUKa+QiwC9MbWbywRZ5gRzVa/nJh46qq1/wcW3Rn/hqOs6Ah38CuAyXW9r
 I6gg3WTjvboYzmSLMWL/HcQ015Zi1GbdQCsmH/HuziKlIENmPVxP59kFnwCikEJqie11IFMw7Rp
 O6RQysQn1q4ccet7gBts31dpQKvgoHfFJZVe+Cms0kmC/wlcItUFKT9PVWGC6x0AafHcicipqEg
 apa/+yRXIMjsMsQwdy4CVt3+u1b2Z6hJeERRCx7aBD8kCYWH7j8rRuiLDqDxOmrtYOOpvaSeh/V
 Ro6RyOs+bGdgyv+FSvFMLg+oSKj4WmHsCY0vOoDIUBHdpSQUTzv7qcpzxIztAS5aLleayg==
X-Received: by 2002:a05:600c:4f16:b0:47e:de1d:ce99 with SMTP id
 5b1f17b1804b1-483c31a76e5mr1276055e9.12.1772125143309; Thu, 26 Feb 2026
 08:59:03 -0800 (PST)
MIME-Version: 1.0
References: <20260225-dma-buf-heaps-as-modules-v1-0-2109225a090d@kernel.org>
 <20260225-dma-buf-heaps-as-modules-v1-2-2109225a090d@kernel.org>
 <60ecebf2-a708-4797-bedd-588c3e9931ff@kernel.org>
 <20260226-impetuous-analytic-jellyfish-d4a86d@penduick>
In-Reply-To: <20260226-impetuous-analytic-jellyfish-d4a86d@penduick>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Thu, 26 Feb 2026 08:58:51 -0800
X-Gm-Features: AaiRm51ICxvhnfb6IRxyaVo1JANC2yUPYPY4UyYDMkMh1Zp0Qc24kArQnpKFuW4
Message-ID: <CABdmKX0KZLGaJWBoo3tkCxLvby3f4Fn0nMCLyz4a-H-9J_CtPQ@mail.gmail.com>
Subject: Re: [PATCH 2/7] mm: cma: Export cma_alloc and cma_release
To: Maxime Ripard <mripard@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 iommu@lists.linux.dev, linux-mm@kvack.org
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
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:david@kernel.org,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:akpm@linux-foundation.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@suse.cz,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-mm@kvack.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 2D05A1AB7DF
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 2:38=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> Hi David,
>
> On Thu, Feb 26, 2026 at 11:25:24AM +0100, David Hildenbrand (Arm) wrote:
> > On 2/25/26 17:41, Maxime Ripard wrote:
> > > The CMA dma-buf heap uses cma_alloc() and cma_release() to allocate a=
nd
> > > free, respectively, its CMA buffers.
> > >
> > > However, these functions are not exported. Since we want to turn the =
CMA
> > > heap into a module, let's export them both.
> > >
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > ---
> > >  mm/cma.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/mm/cma.c b/mm/cma.c
> > > index 94b5da468a7d719e5144d33b06bcc7619c0fbcc9..be142b473f3bd41b9c7d8=
ba4397f018f6993d962 100644
> > > --- a/mm/cma.c
> > > +++ b/mm/cma.c
> > > @@ -949,10 +949,11 @@ struct page *cma_alloc(struct cma *cma, unsigne=
d long count,
> > >     if (page)
> > >             set_pages_refcounted(page, count);
> > >
> > >     return page;
> > >  }
> > > +EXPORT_SYMBOL_GPL(cma_alloc);
> > >
> > >  static struct cma_memrange *find_cma_memrange(struct cma *cma,
> > >             const struct page *pages, unsigned long count)
> > >  {
> > >     struct cma_memrange *cmr =3D NULL;
> > > @@ -1025,10 +1026,11 @@ bool cma_release(struct cma *cma, const struc=
t page *pages,
> > >
> > >     __cma_release_frozen(cma, cmr, pages, count);
> > >
> > >     return true;
> > >  }
> > > +EXPORT_SYMBOL_GPL(cma_release);
> > >
> > >  bool cma_release_frozen(struct cma *cma, const struct page *pages,
> > >             unsigned long count)
> > >  {
> > >     struct cma_memrange *cmr;
> > >
> >
> > I'm wondering whether we want to restrict all these exports to the
> > dma-buf module only using EXPORT_SYMBOL_FOR_MODULES().
>
> TIL about EXPORT_SYMBOL_FOR_MODULES, thanks.

Ohh, ditto.

> > Especially dma_contiguous_default_area() (patch #4), I am not sure
> > whether we want arbitrary modules to mess with that.
>
> Yeah, I wasn't too fond about that one either. Alternatively, I guess we
> could turn dev_get_cma_area into a non-inlined function and export that
> instead?

I checked the history to see if dev_get_cma_area was converted to
inline at some point for performance, but it has always been that way
since 3.5. That'd be my only worry with un-inlining and exporting it.
EXPORT_SYMBOL_FOR_MODULES sounds like a better way to me.

> Or we could do both.
>
> Maxime
