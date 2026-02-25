Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOCFItpTn2nXaAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 20:56:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFFD19CFA6
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 20:56:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C2B710E823;
	Wed, 25 Feb 2026 19:56:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="IgvVMmZo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E892F10E823
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 19:56:06 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-48371d2f661so12745e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 11:56:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772049365; cv=none;
 d=google.com; s=arc-20240605;
 b=PeSUv9n/zDzkZxWs6u+RpzrFiUBaKmrVm0yijhgVMfXpj1nI4h3B/ll1iK51Df9nfB
 fgeXmUTl1XF7UKB4hYseyiLrzeq8ZqIX7WHtkc801GvIcSyw6TutIlq1V/uC5Mgynon4
 NF8wYkt4cYsfOcrzVl6e40GtapvE/W8CC1idDI8CA6RQV/dS/5iirYiJZ2nzLYbMbi+K
 8di98eVS4jAf19OCIQqNgu6lg+ECQ/qOohDF2T9TZKiK6kuBVtx/MmeUGSCNXomU5rjm
 EuEjj4ytCNHJAeFr/Pw5R1gRoPwVDgjAhhaeVlnsF76E2dg2JYG2PUf9eQ6r0DSTGCxU
 UArw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=HRL6lEk8UXTpub6PekQgYs2cjNTKn63oRhQdj5ExDbk=;
 fh=W04LkXVRHPb1YSR0ZBuumqO0nL+HisrUFY56LYlzsn4=;
 b=jjnTxQnXOYOY2RBnZJ7GOKv8QSI75CABSIdyQ4ExsqaPB+RTYTMckgplsYEFGg5wvy
 8IIVN4dWKiLAUG3kNX+aDQ0beZm0SlPAwyTTCVGIYYXnj8bqw2n4eexuAs7e/wnFDrZf
 eE5ykvmICy8+DRkLT+hZCpCOvvJPIwbIMzb06hx2PHPSOL3BGEuHshhSb6n3j5EItgYF
 cM6fu2EUZ5XBnjsOwyL01cGAquAnFo7fschG8c6jGh13EHuQYh77N6bJFWMiGFT1vTQ2
 mo81qSVckZtUj2V60V6NVGBFQlvW8FLm3qhx9hQDfLmpMzF6dBvn1dLxeCuUacTLFwxh
 w+dQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1772049365; x=1772654165;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HRL6lEk8UXTpub6PekQgYs2cjNTKn63oRhQdj5ExDbk=;
 b=IgvVMmZoK9Hq2NF3Y1wRxtI9aghNM3n9LIiZg1Io4DUXpLfBjqvcT+oua3mLyzmqyR
 rURvGcVqhUgL+Lsbg6og95vZeb9wgtFH9YO3LdOsxQ3Pv8IoA0/WqR5jeLbzBDPedhuv
 CQxjHbzbSd/j+04/NrTKX8n4EGlF3IwLLIccACiWGr6vXdKAcO957yL6AGbMsg2dYeWI
 IAsGtJ4/QVWKqkWS+4oLYFMTSkIbGfE6azdOJBzR940qqRrCa20vWmMtzDJVbjo+Fn32
 WHpgEfUkwJEQi9IAM3xxZec/35+fwNvKu72UjDuf8XA/OGHqdrEdqcBwwLlUxtXa72D0
 YqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772049365; x=1772654165;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HRL6lEk8UXTpub6PekQgYs2cjNTKn63oRhQdj5ExDbk=;
 b=Tm3Ud0hWlEfw4ZnCRqkN/5LQJm9WCv6tr/igzW5ZI5XuNkX6z2k7ZgruLAVF3FTskw
 P+DHhKk3vJksHbwCvLjknNCbpxk9RVuMAAoHnRwdpuLEpcl1QJnPAs7fCkvEmJlY8/O/
 hq9cpuT5prN+wCK10UcLZfisquE/80lxGVenE/gklc88v7dHMobyvPx0CPc689oA6pWP
 Er/CH+SFLi+TY0a06ONSv3TNqSJGrgm6d+XE7yVr0P+S3UbCQvSuhW8WusjJ5FF+n82m
 4FOHzojAyNUrErbqaFoHeo5zpllR64zbzy3a+4wXyNEx0MeDmixXAU2SlB3l0Forh5VK
 s22w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWw+7pETOWNish92/cjeto0Sm5kV5tBvVkE893LimKLHNXkuR7O5Ie2aRXp/md//6HHNTk9NsDfhxI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCForHPo1ojPCLaSSiqtUbnJW8vqLM5eB0J0jfvZ1kOlSxfwQ+
 IqiB/Q9mx3BeXCNaz01dJQqOfOsyDlOBmh6zZKFnEfsfRvpuul5u3X4IuKiLmADsMk+FNDf5LBZ
 toN7rGaZjF1FHetAnk21quWzfQue650Nsd0XCDPKu
X-Gm-Gg: ATEYQzz1u747uzF9loRo2ToGloCdSMfYRrlHNvF+GKzhgQPq8RDoRKn98FAZfseGbx1
 MxrO+Jk0uBSvT52bV0IHrSEHPvc8l5Fz3Gf0Kewr5/Bse6GswBS8iLr42WongIkffiHHe49MQV3
 nD90NUg9KIHg7JOWPFhbGDKm4ZDymSY+9XF9gXX5TUJ6MLxkPaf09u2fOohRdiqlF54s821WwF/
 1/LljlXi7Bp/vm4ph4bOepwkYuzNH6guV7Vmmw+LPTAkCUOn2DTU+27kIJelkk+8RNRKP4WKV02
 Y5UlVhhIKX51bt963Lcm85qhENeUH/HyRM6mNBweLZCIbnQNOAldEklLZXP7gamjES9yAw==
X-Received: by 2002:a05:600c:6a8f:b0:477:c5b3:7a9b with SMTP id
 5b1f17b1804b1-483c3188d68mr92305e9.10.1772049365087; Wed, 25 Feb 2026
 11:56:05 -0800 (PST)
MIME-Version: 1.0
References: <20260225-dma-buf-heaps-as-modules-v1-0-2109225a090d@kernel.org>
 <20260225-dma-buf-heaps-as-modules-v1-7-2109225a090d@kernel.org>
In-Reply-To: <20260225-dma-buf-heaps-as-modules-v1-7-2109225a090d@kernel.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 25 Feb 2026 11:55:53 -0800
X-Gm-Features: AaiRm50aJvmG-U5wbOHTqLRYSqzdYRLj0K9YYWnCflGgDx3T0BxE0_R2bnIQaGw
Message-ID: <CABdmKX12GL7gd_TMArPbjGwSOOhu+udFHZ61dDfMwWf3q6cB+w@mail.gmail.com>
Subject: Re: [PATCH 7/7] dma-buf: heaps: system: Turn the heap into a module
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
X-Rspamd-Queue-Id: DDFFD19CFA6
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 8:42=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> The system heap can be easily turned into a module by adding the usual
> MODULE_* macros, importing the proper namespaces and changing the
> Kconfig symbol to a tristate.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Same comment about a note about the module being permanent.

Reviewed-by: T.J. Mercier <tjmercier@google.com>
