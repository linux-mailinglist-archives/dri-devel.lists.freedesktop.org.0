Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mN49FP2KoGnekgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:03:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 525A41AD329
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:03:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C92AC10E9DA;
	Thu, 26 Feb 2026 18:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="iJ2SstX5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F41810E9DA
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 18:03:36 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-65f812e0d93so1823222a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 10:03:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772129015; cv=none;
 d=google.com; s=arc-20240605;
 b=Gn9jXqPhW4uVh4GtO6DySS1ka2YYEydJstHzfqMgy8G9k8kaovObFoS+gNmt3P2lyE
 NWK/jiTLtPOp+WMkCJ4nGic4gJ21W2QpzXLkr+ZsfYn4bks4lgs+XvxCQfOgXSUzaDXb
 WDeD1I9QDkdL/rf1/R6Fd7O8tyBP6MRUHvPAtlRGl7PdVEOwGklxTe7zZRphTKqs7GSc
 JPbJjxq6OcdJRjefMLzNZ/I3tRtzyvS5/bd3/PDJSdDNXAEJyo70gHxxarKVWTF3Bf15
 8bA8fjc3PONYbC+/5B0RBPXrUOT80ZCE9gWLduYFGmm7UlZs50n+1V3ZFwg24C/a5KsB
 TP9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=9Qnm2oa0MVzHK3SlIdevV2oCNgF9I6YsjdLLXN+h7bs=;
 fh=Er2fp9zIz2wJMGRVDJjktEDVXKwIkqF7Jdcjl8HUKuY=;
 b=FR8MTPob9VbnREx3qmkygizKYgqqOFnbdTe+VJzDL9YkScC9nhkWDKC5yfEKxC93Yl
 vMjim5BJ9NqoVg12kadXUgEud2C2I4PyXnZtLG3iKqEwmAxGtGhhOl6MbXiuMI2hdA++
 cIGeKcKPjuCaXYSN+xDQNfXTy/Alr+9DDN7ZPz+DEbt+J9l2Rg6eaYfeylbTJSXDtCG7
 xSBiY8YlEiA1h18IrjV6iZEAzQdqifpTyEr7PCZj68zEifGUDBLbQsGwewfcbuvZwICC
 EKoSMqCcSo+XInIZLx9lrzgT7iHEbvk541tBHGdk8QQ7pE2AycrGiXFDJ2AWG5SBxn5r
 jsvg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1772129015; x=1772733815;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Qnm2oa0MVzHK3SlIdevV2oCNgF9I6YsjdLLXN+h7bs=;
 b=iJ2SstX5n1Jlvqog+iDN+1li5o4mhoqtWRDMEraQtoZL5DSTTUfRdgY/GOFyLxH9ZX
 r4y/qfgZPX+biIsiHav0qSp9nP6dxqhcp1mAaPzKbwtu3aschMFOyqpmAPF49F//WTi3
 qWPsru0vp1JI9Pq6HJCAKlgwpGqifVxTZZvDWdLe4rKSh31p0GhcgmtFxtWRDsz2lgfO
 XYxeEJyufzbN5qFVC4MmOG5PgLuMJ0EKJ18Ygb003xTIris5HmxMW9UU2JalVOUi1oEK
 3za2du43UmZwIQBAvpQM61gOL31paQLkkzLHocPn08ahHk+A5f3wWtpP6zpbBLtFJStC
 3RBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772129015; x=1772733815;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9Qnm2oa0MVzHK3SlIdevV2oCNgF9I6YsjdLLXN+h7bs=;
 b=hn6EJMqZ381Z3xi+LqIEdnyJpdCzLV1B1487CJD2c1qbZPmXMEUJnU65KJrJiPKBgp
 Fupxag4FU/00msKODZUo/NlKT1iRMsMFRKxbBimBR1l5SbVre+xyf8spll+BOMLa2fKj
 3zsHmwBkqrXb6YI08DyT/2Pp4FckT53UIGKzym/3FowwRhWD7BWaZUQSF+pco2jb7J3q
 uhySA4VCGBmz2fUk9PxZ5N4wpXc5wL9zpXHKq4EJBkyayZXJYPcd9m8s+CJnIVyLfcos
 04krhx5LTQ5pTRFaXQrywnU34O6kZvXMTL+fm51QOHkcZWedWcCQmxtiDb4jF431ddUB
 Mzyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlF3paR6QAiG8WJ2EGrkgiG/3M6Lp4mE6+o2ARI8Whz+JCLN7I+aXfmc2dMU5TybfzHRSueoVO6Ts=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyc417MWfprht1gwlXt0FNIa7R/rvngd7Nayjj+19LIBVb3GFCL
 FVwKAl3CvTQzSniiqYsCA3fmGFtHOiIpDiO6WL3yCgJlKEYjm/Vw3Fbz6koR/b/17/AdZsVoR88
 lUoHDSvoDp1tSR9z8wdMWjoQY0XT98iZhKnn09+4=
X-Gm-Gg: ATEYQzzll7lTyIHEuVmDkhUE/FfKvPKoRPgQonrHjtIVkrmLycIDYjmNa1aPZGVD3wG
 EaEnPQa3U+LJil6tmfRJmAICXvCt15Me1U6oUvFR3IhCrdx81w8ZtPq4VukxWXAJWE3V1P+i04e
 N8i3y0Ew0cyLgdXRna27j4G3kz4NKmhDDGLDFU9yRNp/hTJdjdgC5e62U0aDVGfEdYQs1hA2FV3
 T5/K9X8ZbvRTpitFvcheKFVTn+DCvary/dhGra0UlBedkJbV2OrdVAoULnFyfxZC4D8GLGR2yah
 aKJWHCcCh4xIf6vqW0r3hD/cFfCngi8Lw16c
X-Received: by 2002:a17:906:eec7:b0:b87:d255:39ff with SMTP id
 a640c23a62f3a-b9081b37fe6mr1411724466b.32.1772129014224; Thu, 26 Feb 2026
 10:03:34 -0800 (PST)
MIME-Version: 1.0
References: <20260225-dma-buf-heaps-as-modules-v1-0-2109225a090d@kernel.org>
 <CANDhNCqk9Uk4aXHhUsL4hR1GHNmWZnH3C9Np-A02wdi+J3D7tA@mail.gmail.com>
 <20260226-adaptable-vermilion-nautilus-0aa6f0@penduick>
In-Reply-To: <20260226-adaptable-vermilion-nautilus-0aa6f0@penduick>
From: John Stultz <jstultz@google.com>
Date: Thu, 26 Feb 2026 10:03:21 -0800
X-Gm-Features: AaiRm538ftOfa1UyUjDoV9Yd7b0SRwtnSHBghCEM_shajRcZSxbK21W611Pqdkc
Message-ID: <CANDhNCrpNU7QJgu+0CZRvdxLwKp8VNxZoG_zDo7qqxaE0mjoTw@mail.gmail.com>
Subject: Re: [PATCH 0/7] dma-buf: heaps: Turn heaps into modules
To: Maxime Ripard <mripard@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 "T.J. Mercier" <tjmercier@google.com>,
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
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@suse.cz,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-mm@kvack.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jstultz@google.com,dri-devel-bounces@lists.freedesktop.org];
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
	FROM_NEQ_ENVFROM(0.00)[jstultz@google.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,googlesource.com:url]
X-Rspamd-Queue-Id: 525A41AD329
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 2:18=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
> On Wed, Feb 25, 2026 at 10:51:30AM -0800, John Stultz wrote:
> > So heaps-as-modules is common in the Android kernels, and was
> > attempted to be upstreamed long ago:
> >   https://lore.kernel.org/lkml/20191025234834.28214-1-john.stultz@linar=
o.org/
> >
> > And it got a fairly chilly reception, but maybe having the additional
> > optee heap (as well as other proposed heaps) might sway folks on this
> > now.
>
> I didn't know that Android was using heap as modules only, but I'd say
> that it's even more of a reason to upstream it then.
>
> > There is also the kref bits you might need (which Android still carries=
):
> >   https://lore.kernel.org/lkml/20200725032633.125006-1-john.stultz@lina=
ro.org/
>
> I'm curious about this one though. It looks like you add refcounting,
> but never really get the references anywhere. What was your intent, that
> on every allocation the buffer would get a reference to the heap so we
> avoid removing a heap with allocated buffers?

Oh, apologies I mixed this up. You can ignore that suggestion.

In Android, once folks were familiar with thinking about dma-buf
heaps, some (out of tree) drivers wanted to be able to internally
allocate from a given heap (somewhat of a hold-over from the old ION
drivers). So we have a convenience patch to provide that:
   https://android.googlesource.com/kernel/common/+/8e1ec97355ef9927e82ec18=
c98312bdcd80bf289%5E%21/

And since we return a dma_heap to the driver to allocate against:
  https://android.googlesource.com/kernel/common/+/fc1310ebf8fe25ea7b983400=
e6fa41f5a6d11966%5E%21/

The kref bit is to make sure we're doing proper reference counting on
that shared pointer.

This ended up getting bundled together along with the heaps-as-modules
changes in our out-of-tree changes, and I just confused its use here.

thanks
-john
