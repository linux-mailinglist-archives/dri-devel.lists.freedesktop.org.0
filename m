Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHcqF38fpWnd3wUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 06:26:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2071D3133
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 06:26:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2143710E431;
	Mon,  2 Mar 2026 05:26:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TCjQuxfK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D8F410E431
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 05:26:18 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-506cb1b63d0so52013441cf.2
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Mar 2026 21:26:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772429177; cv=none;
 d=google.com; s=arc-20240605;
 b=YXBmctNncSOV9WwvWIUUuKA1Via63Nr4Z4Jug1LQ8/cE2FK9fw6rBoEgcPIh0ym8qm
 ZfbqUgS755QcbZEtUPYrEVIHbvolJ3ThypZXs3cP9/VlsBd6Advl0Gb1h4DwoH86D8I2
 erpPdPWH4zGOkwPx1ybhd2eX2M45pGp4lAF7lb4fEkPs2Oarj6hCaTPC91aU8/tcmIj1
 PCJ+BwF0i7mXlwwzaJSIj4PrqI6YBXbrAyWPObZ1Iv7LRcxbfO1oXKFF879gcVVrtZgS
 /gjBWRprtn2RfU5yWSvgnOimnPTadDZH0W3Wt1l808xuiQlkuHbINmke2yRE1zubYYNA
 L8nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=rNpLqQXBYOorAHCllRmNXHlMvCZoey1fxBa1rcoB5e8=;
 fh=Ba8Y57OWxy4O86o/alxyzmlaOt+CJHc40BfIECrEnSM=;
 b=GBGbdeiBUharEMe+l2OBFjNsCW3VK05L7hEpYD5CFvHbXLy9nSK1lLOlGY6SomHDle
 ZMgV1b5zcTCr1MpDdHJmIRe5oKUj53iGwnrPm7cD/ROmzerjpFAF7q4pReVJQlHcVcxz
 EzWpPqQmPk3gaTDHm986uquxj0q3D5EvH4JGwYv7Ug1V1toinvDqyWml6GKuqKvG/SvB
 M1V0esRBMx4jXtwWw+9PFpai3mZHv/eIrYHdNtBGvbcKpxl/015bYR1GpcuW6hala0k6
 R6pIiwRKPTKIilWEqmAcxTujyZXLfMZZXP/YQ9ODXJa2i9vpA1i1Jvf/LpJ1Y75KY07W
 6Nig==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772429177; x=1773033977; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rNpLqQXBYOorAHCllRmNXHlMvCZoey1fxBa1rcoB5e8=;
 b=TCjQuxfKxk60dJu+4qSzkJfXi5cpQsViNro4P225721XHV4h0z8AftxJwncxKj/HzU
 GB7T+hIAxirxQ8IXs91zF44zrQtD7BlYt7CLos3+sg9AWnO/4blktgZT0qW2oMvdnX21
 i/k5aSEmX1CvuBf6e08hUgSXUGDriJXIYcJgBv6TyDgNDjsB0YIfg6mSJx0RLFg3EbB/
 hFLK1UT7+5I0dT2iVJBWtV2QsI274NE3AYiALhHDcP2CwNcf9zIfNu4WsohT645Q69dU
 DaGs1AWd3rA4w2PRcuonknsGqm2oBcGA+EDmWYXpLtcZBs6VFQNrM6u3WlWNV+IATQZE
 8f3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772429177; x=1773033977;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rNpLqQXBYOorAHCllRmNXHlMvCZoey1fxBa1rcoB5e8=;
 b=nquQjwZt7AGunfq0B8Lf85Sl5dZ+nL5hm+fqWj0iCQS+/JeZyJEsQt0rJRs+2yafKX
 rpBTicIc9J9wmZ4aepO8hxBkTdgU+LiCMbsojV1ZrF47lqZyAo5Jyk56fDVDzMcD8K+w
 vtqI6LL90EgkwGFJv07tDWH7zRyh2Yi3fVv6+QDo2ft9PXV/cSoyKgo1JJvvuL0W3zze
 SZysgEnpDsbvd27w/NlMovlPbWKM4AwwvoEb0L7vVriLKOObkOyaMbr4Dk5qSF8pbnT/
 TACa2Sym54BbPjrU1RH6/yL4QdSOdu7ZV4cij56cobOO5uTWHjflBk163WlsrMxgxgDE
 U/DA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUs5126cnNJXo1MPDmn1/s0hO0EGkcHxDzJmZeDSinpkA4I4x6QFdokmJwk+xouIVWd4Hz2BTtZ6uY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxOG4TlC6B6nqlMBqGJc2NBUfihVzEkW0aTBnIFqZZFFGsYvmX
 lj/uOjpMjp3aPYbA7S9IadOCpXyAVxgbRRi/XLpa4MDFgrKb9e38O391cJC3qXWCZs3bB26B0p8
 NYP+ZtNlYWr4B5GWfs0FhR0PTwfCuYB0=
X-Gm-Gg: ATEYQzz+I8wuOYKIry4thEcRWP7CqNWsh1u6sqwrCGqnmka+yEpLv4ZkM+ky+vt+mME
 b0dAO7CicgqH4u/OSY2EyilLoehbM2ijdkxyWCXVZ9P/BdqUC3Hb+n2S97gcFdoFGFBEuugkXtS
 mgR4V6ksVDkzlNEPd2df1LRGsUCaiPh4gsnFVElRA6zPuGRZSOu0aubtzROga96jdORDc40W6VY
 GTMHzggkF25J/06CyzycCC8WI9O4px+lVsCsdy7OzIxhoV4QXF6Mm8PiL4f+vQSNutfR6oLY72D
 RAbpjagDSqBC2HZ1wrcogrshnFp+Cpf7sIEsMwwpvuq6s4LLB4kJGZIoKB5exqk3swM=
X-Received: by 2002:ac8:7fd5:0:b0:506:9fd8:f65e with SMTP id
 d75a77b69052e-507528a59bdmr151673531cf.60.1772429177369; Sun, 01 Mar 2026
 21:26:17 -0800 (PST)
MIME-Version: 1.0
References: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
 <CABdmKX0LpKJ9tw48oQh7=3CF0UR5uFtgo0OMwQhHBB40LnijyQ@mail.gmail.com>
 <a446b598-5041-450b-aaa9-3c39a09ff6a0@amd.com>
 <20260224-solemn-spider-of-serendipity-0d8b94@houat>
 <56400505-8a13-4cb2-864c-cb785e4b38d4@amd.com>
 <CAPM=9ty5mbMAVHPO4mRy1jKGnpChr7gK6uMtco2=j7MMJGpZdg@mail.gmail.com>
 <d1b287c9-46ff-4345-a410-7e1cfefb5c66@amd.com>
In-Reply-To: <d1b287c9-46ff-4345-a410-7e1cfefb5c66@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 2 Mar 2026 15:26:05 +1000
X-Gm-Features: AaiRm50W0fvfAVhf0ruGga4uliXFXx9vNuU5MHSLrll0LdDEQpXsLFepA1L85R8
Message-ID: <CAPM=9twnKZYOGchQ0cziSt5yUQxCXNWoKyBiQib2XWvkMiN=GA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] dma-buf: heaps: cma: enable dmem cgroup accounting
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Maxime Ripard <mripard@redhat.com>, "T.J. Mercier" <tjmercier@google.com>, 
 Eric Chanudet <echanude@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Albert Esteve <aesteve@redhat.com>, linux-mm@kvack.org, 
 Yosry Ahmed <yosryahmed@google.com>, Shakeel Butt <shakeel.butt@linux.dev>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:mripard@redhat.com,m:tjmercier@google.com,m:echanude@redhat.com,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@suse.cz,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:aesteve@redhat.com,m:linux-mm@kvack.org,m:yosryahmed@google.com,m:shakeel.butt@linux.dev,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,wikipedia.org:url]
X-Rspamd-Queue-Id: BB2071D3133
X-Rspamd-Action: no action

On Thu, 26 Feb 2026 at 21:32, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> On 2/26/26 00:43, Dave Airlie wrote:
> >>>>
> >>>> Using module parameters to enable/disable it globally is just a
> >>>> workaround as far as I can see.
> >>>
> >>> That's a pretty good idea! It would indeed be a solution that could
> >>> satisfy everyone (I assume?).
> >>
> >> I think so yeah.
> >>
> >> From what I have seen we have three different use cases:
> >>
> >> 1. local device memory (VRAM), GTT/CMA and memcg are completely separa=
te domains and you want to have completely separate values as limit for the=
m.
> >>
> >> 2. local device memory (VRAM) is separate. GTT/CMA are accounted to me=
mcg, you can still have separate values as limit so that nobody over alloca=
tes CMA (for example).
> >>
> >> 3. All three are accounted to memcg because system memory is actually =
used as fallback if applications over allocate device local memory.
> >>
> >> It's debatable what should be the default, but we clearly need to hand=
le all three use cases. Potentially even on the same system.
> >
> >
> > Give me cases where 1 or 3 actually make sense in the real world.
> >
> > I can maybe take 1 if CMA is just old school CMA carved out preboot so
> > it's not in the main memory pool, but in that case it's just equiv to
> > device memory really
>
> Well I think #1 is pretty much the default for dGPUs on a desktop. That's=
 why I mentioned it first.

But I don't think it's what we would want, if someone allocate a
system memory object then we should memcg account it. But in this
scenario it's where we really have to face eviction, and maybe in this
scenarios it makes sense to state that we need to reserve memcg space
for swapping objects, both out of VRAM and into swap itself.

I'm starting to think there isn't another good way to deal with
dynamic power and suspend/resume if we don't have some accounting for
moving objects out of VRAM into system memory, it's just whether we
can do something special to account for it, but not destroy the
process on behalf of another process doing the wrong thing.

>
> > If something is in the main memory pool, it should be accounted for
> > using memcg. You cannot remove memory from the main memory pool
> > without accounting for it.
>
> That's what I'm strongly disagreeing on. See the page cache is not accoun=
ted to memcg either, so when you open a file and the kernel caches the back=
ing pages that doesn't reduce the amount you can allocate through malloc, d=
oesn't it?

So the page cache is accounted according to Shakeel, so can we find
some other example. I really think this is a bad idea, partitioning a
single resource into two competing pools isn't going to work that
well.

>
> In other words system memory becomes the swap of device local memory. Jus=
t think about why memcg doesn't limits swap but only how much is swapped ou=
t.

But we still need swap for system memory as well, but there are
systems with no swap configured, and on those I think we need to be
integrated with memcg anyways to make it work.

> For those use cases you want to have a hard static limit on how much syst=
em memory can be used as swap. That's why we originally used to have the pe=
r driver gttsize, the global TTM page limit etc...
>
> The problem is that we weakened those limitations because of the APU use =
case and that in turn resulted in all those problems with browsers over all=
ocating system memory etc....
>
> Now cgroups should provide an alternative and I still think that this is =
the right approach to solve this, but in this alternative I think we want t=
o preserve the original idea of separate domains for dGPUs.
>
> > Now we can add gpu limits to memcg, that
> > was going to me a next step in my series.
> >
> > Whether we have that as a percentage or a hard limit, we would just
> > say GPU can consume 95% of the configured max for this cgroup.
>
> That is only useful on APUs which don't have local memory because those m=
ake all of their allocations through system memory.
>
> dGPUs should be much more limited in that regard.

So you think we should limit the system memory allocations on dGPU.
I'm worried about GTT|VRAM allocations which once evicted, there might
be no reason to push back into VRAM and that ending up as a backdoor
to allocating a lot of system memory and bypassing memcg. I don't
really like the idea of bypassing memcg at all.

>
> > 3 to me just sounds like we haven't figured out fallback or
> > suspend/resume accounting yet, which is true, but I'm not sure there
> > is a reason for 3 to exist outside of the we don't know how to account
> > for temporary storage of swapped out VRAM objects.
>
> Mario has fixed or is at least working on the suspend/resume problems. So=
 I don't consider that an issue any more.
>
> The use case 3 happens on HPC systems where device local memory is basica=
lly just a cache. For example this one here: https://en.wikipedia.org/wiki/=
Frontier_(supercomputer)
>
> In this use case you don't care if a buffer is in device local memory or =
system memory, what you care about is that things are reliable and for that=
 your task at hand shouldn't exceeds a certain limit.
>
> E.g. you run computation A which can use 100GB of resources and when comp=
utation B starts concurrently you don't want A to suddenly fail because it =
now fights with B for resources.
>
> > Like it might be we need to have it so we have a limited transfer pool
> > of system memory for VRAM objects to "live in" but we move them to
> > swap as soon as possible once we get to the limit on that. Now what we
> > do on systems where no swap is available, that gets into I've no idea
> > space.
> >
> > Static partitioning memcg up into a dmem and memcg isn't going to
> > solve this, we should solve it inside memcg.
>
> Well it's certainly possible to solve all of this in memcg, but I don't t=
hink it's very elegant.
>
> Static partitioning between memcg and dmeme for the dGPU case and merged =
accounting for the APU case by default and then giving the system administr=
ator to eventually switch to use case 3 sounds much more flexible to me.
>
> At least the obvious advantage is that you don't start to add module para=
meters to TTM, DMA-buf heaps and drivers if they should or should not accou=
nt to memcg, but rather keep all the logic inside cgroups.

I don't think we should have to static partition at all here, it's
just asking for problems later, and it without proper accounting will
cause a bunch of reclaim unnecessarily.

Dave.
