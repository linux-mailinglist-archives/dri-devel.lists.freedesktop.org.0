Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKFlA58anGkZ/wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 10:15:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1F7173A8D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 10:15:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 216FF10E2A8;
	Mon, 23 Feb 2026 09:15:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Zxavyl+L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69ABA10E29C
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 09:15:05 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-482d8e6e13aso34579235e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 01:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1771838104; x=1772442904;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=vOcHT801aqXoK3tA38lkJBGJrXjsRTU5HQwu+hWqDEo=;
 b=Zxavyl+LUAZzRXbj3lZaIqvnZSNSYZw7/W+4JSenoqCfqZ8gDEcMhsNVxVV39+h23V
 3IeEBINtClu4fhYSSi5O1BrS5pSsBQJoHRmjf343mFmTLMww8ORU9ZlVKhraZnC1GoJy
 zEu1lgXLiUaPnzZ/2c+9dq4D1ZKN1BSyN2NziTRaZDvOq7YAyJrkplI91UMEIwuSlx4u
 M3WI16tsqk1l1T3+G9RtJ1ah2vsbpfCdDCN4mRHjRZPIo/x6r58u596UJuoexjN2wsuk
 VKykWhc5rSSfOSD2TUa5gWhSqmO615ZLYFFO774zQjnv9ZJXCBhM/uwmEFmOjSuEFpkT
 95MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771838104; x=1772442904;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vOcHT801aqXoK3tA38lkJBGJrXjsRTU5HQwu+hWqDEo=;
 b=e3RA5rt/e7zlXIA1vLNyigIwuUKqmr/WqQ30i5YEEoxMa42vsqRXP9LyR8BpZvX619
 llWiOiKiUJNyjy4jyhKFXFf7MpIavitBw0LqNVYuFK7uS37yG0t7DpDsCRDF2ycbwwpw
 x9SiEvQBlB9XPd2Lq/0gundlhadCPw0FAQlLwYS0KTh20MVkl+AtCGOpIu9rZBmEF4kv
 Vvm2d54Du7Yh3qfmK1M3FqZvA3l49jDyc9zz8lgHi2bhFpeyFka0VPui357AJz8LmLWb
 6Xxq+D0HDhmRT35oLo8Y0F/Mktict2I8K0oToX7q1Cp8HN9w4q/LivreFtH1mRll14M4
 TmpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiC1PmezkXVbAYlkyDcopPEUqkpqq3gaJOgOk17Xl7yRKbAOqxwXNBD7XZzu88l0juL1iYLF3QYuc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZ70ES/b7scNXCXTJAY4ghCgBWeM7+FbWHahugfN/wc0UMjrWI
 sJQfoDudC2UYe5UXLHUmH+iKzQrX+tkITGaXRiFkINI6pzwrJnESbUkiWbB2yNxbJX2G0MHqVgy
 0bbNmXK/SaW0rHsz3xQ==
X-Received: from wmqa20.prod.google.com ([2002:a05:600c:3494:b0:483:1069:2eb4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8206:b0:483:75f1:54f with SMTP id
 5b1f17b1804b1-483a95f8a84mr142893835e9.31.1771838103699; 
 Mon, 23 Feb 2026 01:15:03 -0800 (PST)
Date: Mon, 23 Feb 2026 09:15:02 +0000
In-Reply-To: <DGKQH7Q9QONY.4GLSDMQ8DOY1@kernel.org>
Mime-Version: 1.0
References: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
 <20260130-gpuvm-rust-v4-3-8364d104ff40@google.com>
 <DGJ6LHIVMV03.MM7RWYBJHBIQ@kernel.org>
 <aZgYY_fetgz_GDR8@google.com> <DGJX3FI97W1G.371MAMC60FX24@kernel.org>
 <aZlw3SGmLetHwaTM@google.com> <DGKQH7Q9QONY.4GLSDMQ8DOY1@kernel.org>
Message-ID: <aZwalt_6KlOIDzkN@google.com>
Subject: Re: [PATCH v4 3/6] rust: gpuvm: add GpuVm::obtain()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, Janne Grunau <j@jannau.net>, 
 Matthew Brost <matthew.brost@intel.com>, 
 "Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, 
 Asahi Lina <lina+kernel@asahilina.net>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:boris.brezillon@collabora.com,m:j@jannau.net,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:lyude@redhat.com,m:lina+kernel@asahilina.net,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:lina@asahilina.net,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[google.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 8B1F7173A8D
X-Rspamd-Action: no action

On Sat, Feb 21, 2026 at 04:09:41PM +0100, Danilo Krummrich wrote:
> On Sat Feb 21, 2026 at 9:46 AM CET, Alice Ryhl wrote:
> > So, should we get rid of GpuVmBoRegistered in favor of ARef<GpuVm<T>>?
> 
> I wanted to avoid exposing the reference count, as I suspect drivers might not
> need it in Rust, but I don't know for sure.
> 
> We could also define it as GpuVmBo<T>(ARef<GpuVmBoInner<T>>), where
> GpuVmBoInner<T> is private, but I also don't want you to go back and forth with
> this in case it turns out we do need drivers to be able to take a reference
> count and I also don't think it hurts too much exposing the reference count,
> even if not needed.
> 
> So, either is fine with me, ARef<GpuVmBo<T>> or
> GpuVmBo<T>(ARef<GpuVmBoInner<T>>).

I don't think GpuVmBo<T>(ARef<GpuVmBoInner<T>>) works because we need to
be able to talk about both ARef<GpuVmBoInner<T>> and &GpuVmBoInner<T>.
The reference type is returned by several different APIs, so the Inner
type can't be private.

Alice
