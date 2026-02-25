Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oK3XOS5Tn2mraAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 20:53:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 511CA19CF31
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 20:53:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C47F10E821;
	Wed, 25 Feb 2026 19:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="f5SCH33E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE3E10E821
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 19:53:15 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4806b0963a9so14205e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 11:53:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772049194; cv=none;
 d=google.com; s=arc-20240605;
 b=cDshp5p3VHkoaWWYFQu2B5fEzA5ovQZdGAbVa5Mp6V8xSTkB1KvUSIz0mlQd16s6UR
 npRPsF3AwRKSae551pPFLmmz4lfzMsc+UDFvCJg2PGJOk4/kCsqbqSjaJziSSOYGrVQm
 Gxow+wtl54Rqb3LBRnCTlErcGNobmRNGD9PxnJ9OVWtgjyZefe4CTHk8QSVvAn0+p8GY
 5VSJBJJ3LbpZ5sg3b9yPtRPx1rUXJPNl0F+cHYCLR1Db64STBE9m3osR48blYtPNXNP6
 ZUGabaidlB4HqTIf6Xf84ennslcyU/F5NH1UwGMvcweILO3RjVi9B0C1MiobydmFJYSx
 g6Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=hACZJJD++mSXl52TK006Yejdc4mpWUq5FI/WaqBAg/g=;
 fh=WphQZ8rGQjgQu3fWbotc1d+PaNy4kPr0iRG5TPCRaPg=;
 b=XQf17NyD/5Rcp4sLSvWTI0LcAnfEDU+B6h3QIvtii7CelaAxvtIikgC/a3wD9g+J2/
 cEvZ0oMmNYMg1Imfn8h0cuHIjn6WOpuT+gn1+sGbTL8iBaG3WW2/dvIQuMJASh7n/CaC
 Ht5EYAbypehj00jNLnOMak2COqoCcIaPEuxVwyBwY4c8eU+JBgsrQuIYSemfHPEYjkHi
 VFbepr7rbeuWpN6f0+YD78kwH0gKg/41YPRAiRXG+v23IpU/uOhfEkE3iIDFvARWk2+r
 jBy1USCzFMziAoLAHEs4dJ2qjg0OwZctoi/glimz9diGm/C9EZI5UYVIf4thUsvOpJ93
 dQ2g==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1772049194; x=1772653994;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hACZJJD++mSXl52TK006Yejdc4mpWUq5FI/WaqBAg/g=;
 b=f5SCH33EdXXO9eVE6AqPjg/zn7Zkq2hkL/Wp8oWHiTxhbWZDxUwWaIHxl3ZiSVxHVu
 npEyvFXZBMWj41TTZYZpaLxMP/gfmZjSHt0MJ4ZSf+O2kmKHe2k7wEBW9QiNDnkLdqbn
 K39hAclt980V6d4yZv7bUbHwwBVm2ZV9MgGWfAptta9F0r0i6tJCzbfVw/OUYGILkNao
 YaaldGtgSBSU09HP5855dn16eqe8leb5sNO2T+W3RraHW4vGRB/M+Upm8WsQ0RqjODji
 IyCYkXIUy5CH+TDk2tIdvA7NGkKkOM1pg5efx1LES7ZRIbXvbHDVssFJGk1MsSwwpyiS
 +SmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772049194; x=1772653994;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hACZJJD++mSXl52TK006Yejdc4mpWUq5FI/WaqBAg/g=;
 b=X87kolhDzINwMp4uqR8kgIQuD6NrkaIUc6IcxNLPAUE3Zq+650RF0fK6SXMFpWev+g
 Xtyzl+TVYqgiyMTYXy3xXqh5bFf1AmvTlPeMOl+g0VJSECbIJnjPEp5+DB/FR2/tdmKP
 Ry/ZDP7YmrTVSJSrciP7gZ+DMmteCpcSqtKmJ67OhBKMLzjnDQE6OkCvF3ZaWgG5fBcp
 gfq0731/kRb9DOIEVh7tARHRxyD/+cgWhSbSDq8svRINTAOYybaOzCpP5FOWYZPtbsWD
 ft67iVOsgSAXXWt32yMd4ffgMKvpBMt0ZNodQXYOr//aViKmHKesvlcRjekBoVsmDpPZ
 OS9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqtMndKqj3/qseL/EP13F3eJmjljRlzkrxDrnTuehIhg/r9X99YT80qUEfWx10A7WMVAfCn0+PJiY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTb/udyqQZGvs9XtegrbZa7E8+t3e0NOJa1isAwsqp+qb6maCi
 V0ec8lDe7YHSsih30buzJn/MBAfwS4YDQqsZJZW1CSw9vNU6uRqQ9wJknfZvgjdiCukuZNZdMBS
 CFNxsAiMMBqulNuomNm7sJEBBHfx2MiOgZVaD1xI4
X-Gm-Gg: ATEYQzzFP6x2ABuWPBwJ+0zBQ0OVcTNHVHDhk0b1HXNEMGttbGoCIKqFFtnDPurLTVW
 wv6a8RuDC1Aoj1+Cz5tezRwY/ohFS5IGDgYT/9AUor1KGq6YkaaIjNVWZ9WiKw7jyaFrLa4BUME
 3qvook1cg5jLtr3zGLYaSITazM/O5mp60j7GVewd+9dV6lIxWbELoZMekT++xdrHM5HY0GluHSb
 6vmHjyapC2WR+DWn2HXWLv5Pnu08qVEIG8hoo6sEdN2MVvGfcrvx9fwAe9IaTBgk52YTO2MUw8Z
 b8i10snTRwUOUR3moH0YdJgtuoiY37gF8bcKaGfnzERRlNc4kh7gUNRKX/1lHZiboDgE6w==
X-Received: by 2002:a05:600c:214:b0:480:683f:743d with SMTP id
 5b1f17b1804b1-483c318c6b5mr64755e9.14.1772049193912; Wed, 25 Feb 2026
 11:53:13 -0800 (PST)
MIME-Version: 1.0
References: <20260225-dma-buf-heaps-as-modules-v1-0-2109225a090d@kernel.org>
 <20260225-dma-buf-heaps-as-modules-v1-5-2109225a090d@kernel.org>
In-Reply-To: <20260225-dma-buf-heaps-as-modules-v1-5-2109225a090d@kernel.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 25 Feb 2026 11:53:01 -0800
X-Gm-Features: AaiRm53o2gSjT2_weYbg6Rd6sN6ASK7REyXNCnGoEQl1VXmkJdy1tVVm-ZBs7YY
Message-ID: <CABdmKX2KfL6q2nNAkZJ3r-Pp5JPq-sj2VpQp5bU5Hct68bedwg@mail.gmail.com>
Subject: Re: [PATCH 5/7] dma-buf: heaps: Export mem_accounting parameter
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
X-Rspamd-Queue-Id: 511CA19CF31
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 8:42=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> The mem_accounting kernel parameter is used by heaps to know if they
> should account allocations in their respective cgroup controllers.
>
> Since we're going to allow heaps to compile as modules, we need to
> export that variable.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: T.J. Mercier <tjmercier@google.com>
