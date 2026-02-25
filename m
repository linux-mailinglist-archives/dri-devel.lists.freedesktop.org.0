Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDn6D8VEn2m5ZgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 19:51:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC9D19C73A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 19:51:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C56F10E1CA;
	Wed, 25 Feb 2026 18:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="eRYr7PZX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DCB010E1CA
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 18:51:44 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-b90bc00578cso4133766b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 10:51:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772045503; cv=none;
 d=google.com; s=arc-20240605;
 b=IRDiwxrGXreS4uQAD9QxZRIPR6uxQ52MyMiWZ6A+XyIiiAO/J3PjaK0HAtwiAGnU94
 aq6k10/dcCUalRDYUhgQQTJ0PkaepTdyE1Fbi83krnFqYvoZijyRL79xKG+ogrYO9Dc1
 KEXl40OXpKDUYeWPeo0yokH/gBak6HbMQLiHHdKOV5sJGjJhfm0QvvpmNnPSc16/gRiL
 x+KTqriCRFINFtr6rE3hzzW86dVZRskcfBNmiFqvBRx+18qMxBQcCg3GIaZSbZJownvV
 B8OtjjPglYqgiUswW2y+gexc9tvPQVnEoIFTFoZy82YrKpReGw11xhgXYgf0rYYFiiiz
 VOTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=4oh/ifwivL8l9J8VT3JA58Q6ouuCYd8eO2HrHQHPvGw=;
 fh=2aZVlCl05pAZgvHJZrHePoS/u/RwQaWG8Am2MfKxVWc=;
 b=K10FYadOkZPEOcA/5TL6Qeo81ZTU3qSpVQq8viIWcIoAc7pI1F0/ezfNaWOPCpEEpG
 4KkiXoWdgiTF9Cn1xJCOi69ViUrVmLkYbPi+z2T77qVoixO/wBpdJOWMiuj8E7Eacxap
 7V7N0UipixSPsVTwbouYTPpCYcRLiUjXsURTi6FkFRC12ZMeXnCdRzcBoAYwbLYSjYnv
 z07JPI/P/I646OshYuBbzdI+BuOrQi1jIxQCctiUk2K3S9rUC6GcGSUVvaoa146MtVev
 GquCv/eOv8rnrYdDpl+KoACfyNLdWnoCeH6Y9MVbiC63MyeBZyE2o6qw/WhIszRIfgnE
 tSqA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1772045503; x=1772650303;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4oh/ifwivL8l9J8VT3JA58Q6ouuCYd8eO2HrHQHPvGw=;
 b=eRYr7PZXPqx3N2W08UKNumjo7CnX2poFRyJsOrfJVBx6I5XSA/SbnKYVtKe3I/4Wvr
 kT/fQRXjfsTjSWDWSq3O5JV1BH2GgVd0VOKrkuYkx0Ls+hAEAUsK0UANYtHQqED2JcLP
 lnOAWYyNqGIRTpqSqi5Jq3Cs5D/dL+tDx6h8IHw1Hk/TPPzFnWk5OeMLnF+ny/2wlNbJ
 H6h29O5CJeNMzrTdQNSgyHsO+U+ND6HnrAVRuFb8g4d/f2ACV6J3ofJ+KJiybi+AJUtC
 XsLGwnj830F4EhgS8Pesw08YBxY7kNare+ldaKdZb/cdU1SMLFy08iaK57EcXJAGdJZi
 l2wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772045503; x=1772650303;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4oh/ifwivL8l9J8VT3JA58Q6ouuCYd8eO2HrHQHPvGw=;
 b=W6hKAhIUa9KuGENJcxN8XOD+W5vd+h7BnnIn8QnInk8e77bdOMmb++U66E+N0k19q0
 WUNI6atHC4lsjVqQFV1iu19KHtViG/+mEBVtwS6PMh0iEjsPR8waXjPDLkx8Ukt06gjk
 m3RQRsQYFTPt47JieW64Cw+XeAlwbTzCu1gXpJ0a74CRTh8IwA9njVSatMAXvil5ttmm
 Im0bOp6GdCqQ0ZOdQAoBQxE3yBaO8f33B8KaFk0G14cKco5qaEaSehJErNWZfWXumSlm
 7VQiuY+0bbmVXECa7o4cD+Ax2RVpSeXSFbMw2VPY6GRlCHM5rjS+bM0sJ990qG940qqN
 BINg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJOHyCWXc8UwEFtvQeIpYSOVrwXHN4gZ6GvD7dziACEqTgykjkvRsg8FmTqZ9q0Jirt01clQL5Z4k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpI3KS9UTW9U/RaAvj0rweTI7UXPIGavRViDxQpY4xQtu82NcL
 f7pRnLiuGGIAdN1OtgfhwiHJNOU1atbj9wXKDm20FygN1dacV6kahyttTi5kMODMvmabtm0Jk4W
 UmUwqkr+dEdYfFO2WeMpMSKCusK3LWCP2naEcP/Q=
X-Gm-Gg: ATEYQzwVOMP+XNVt76z+hx0eBcQagF+FRbxZFUTcFiJELBDeRYLGQ8Y3C+GPm27MqhR
 g+lqhPRxYCcjfTIKn5LGSYOwchXZaB4qYrdHePJTrAUhos1la6Y0scJJrwOjQAf+n22dlulrNJs
 IIW+vumdrxrzEo1ddP2ic2jydRp8Jb2bIb4diL9spB/Nc2wImLqD2E0G8VYit2QD6d9cnCP3qDd
 oCV8MH1Tu60xrVotfnAzI2sBdUOE29GMSiIoJGCqjXwsRbXobo/vfOfmexocubhxDlz8IS+qwhl
 kX11fUe+bS+05MywH5VP8GiBYeE8MBOjSCDM
X-Received: by 2002:a17:907:6094:b0:b93:3792:4b03 with SMTP id
 a640c23a62f3a-b933792588fmr385769366b.32.1772045502705; Wed, 25 Feb 2026
 10:51:42 -0800 (PST)
MIME-Version: 1.0
References: <20260225-dma-buf-heaps-as-modules-v1-0-2109225a090d@kernel.org>
In-Reply-To: <20260225-dma-buf-heaps-as-modules-v1-0-2109225a090d@kernel.org>
From: John Stultz <jstultz@google.com>
Date: Wed, 25 Feb 2026 10:51:30 -0800
X-Gm-Features: AaiRm510JicR5yB6-6HzIZrjZoL6Jbi8o9bjBsqrkrZBCAWaavoCU9peMfkjjyM
Message-ID: <CANDhNCqk9Uk4aXHhUsL4hR1GHNmWZnH3C9Np-A02wdi+J3D7tA@mail.gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 8DC9D19C73A
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 8:42=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> The recent introduction of heaps in the optee driver [1] made possible
> the creation of heaps as modules.
>
> It's generally a good idea if possible, including for the already
> existing system and CMA heaps.
>
> The system one is pretty trivial, the CMA one is a bit more involved,
> especially since we have a call from kernel/dma/contiguous.c to the CMA
> heap code. This was solved by turning the logic around and making the
> CMA heap call into the contiguous DMA code.
>

So heaps-as-modules is common in the Android kernels, and was
attempted to be upstreamed long ago:
  https://lore.kernel.org/lkml/20191025234834.28214-1-john.stultz@linaro.or=
g/

And it got a fairly chilly reception, but maybe having the additional
optee heap (as well as other proposed heaps) might sway folks on this
now.

There is also the kref bits you might need (which Android still carries):
  https://lore.kernel.org/lkml/20200725032633.125006-1-john.stultz@linaro.o=
rg/

thanks
-john
