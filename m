Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIRgLey+pWn8FQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 17:46:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 439D81DD2AB
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 17:46:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E94510E55C;
	Mon,  2 Mar 2026 16:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ovJmnfkA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com
 [209.85.221.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C52910E55C
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 16:46:33 +0000 (UTC)
Received: by mail-wr1-f73.google.com with SMTP id
 ffacd0b85a97d-4398eac51b3so3803679f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 08:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1772469992; x=1773074792;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=QYg22rfSXMfwVcQppmIM0Zb0tvFZKcn9JNJPKatkhBc=;
 b=ovJmnfkAbG29gRJx1/R7326m8pkuzq6XP88UOeO2jCMQETjGLJgGR2AeT68GPnPIIq
 KO7wS9DWV+PFmHHT9PcmJW9BJHipyUE3eQGqqb5y0Nfb9c/OXqFaJCVWijelGpUezyv6
 FcvtFN/CFQNi+pH6169+j1u3WS+r5UU2A7Ti3FcKN6dlt71YaFuB2EHPrJ0H6UupHY0e
 L+xMLN2aRcqTsMoswsZluu42bf7JI8sfydsYTSWudyqgaCgC72/IO8Dc5jR/je0e24I4
 yTMMkva+TKjx/ZxCnDIe65gkHb0I8MC9mW6b/3mc12vSRP7iuoZ+lkbZTUFG7F1bGLxo
 cH5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772469992; x=1773074792;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QYg22rfSXMfwVcQppmIM0Zb0tvFZKcn9JNJPKatkhBc=;
 b=k7hbTona2FuaVo40Nyx4GtVCU8FW/3lrf/2mbg7r9tgxuHbah4qTkcHALfCVQWN6Ms
 IYlEkm7bnqNR5kGMcX2i24t2ll0QPMYGVFsFvNUeHY8BOECUbRurW+EBGUVO8DUs8dqp
 gavyQD9dwjjhW8CPGFYCMqi7tTLaPPbHTvhhEG2lGQlyZm1N9sfr6wk9xfkXyGq5kK+i
 k1wdqAUSqCai2qWWO6RTqBglwsR+5NT3QsNEUDp0Zcs0uV0lnVZpy0HHfslqSxr/pMFF
 UtT5G0BgMU5mTljiyKb8QBw5N3b37g3/+pm2VydD7pWBawsN9MnpW4vmiC0uPNq4av2s
 ZE0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjT0rP45Ky9LZlsQVDvdM5lnqZuUmmTDg9F/kZNYqENhQFsT0NnNd6yz3DL5+iVk9WQhWao5/VABk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3+D60cvHIMLNIc8J+ugvNMBLz4wMt/p+K1iY07IwROUQ8RuBa
 YqNQB4koaBNbzMpKq9bKSTgW7R8z/+5zwZ0crUzl5o0M1w8od+eeUG0Mf8xg3+uFJTaHQ5rTLgC
 CkTUeQTNrjIQ1YSVmnQ==
X-Received: from wrbee8.prod.google.com ([2002:a05:6000:2108:b0:439:8f84:28e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f90:0:b0:439:9464:ac0a with SMTP id
 ffacd0b85a97d-4399d97f64dmr22793244f8f.10.1772469991630; 
 Mon, 02 Mar 2026 08:46:31 -0800 (PST)
Date: Mon, 2 Mar 2026 16:46:30 +0000
In-Reply-To: <aaW81JU7P82nXNbd@slm.duckdns.org>
Mime-Version: 1.0
References: <20260204-aref-workitem-v2-0-bec25b012d2a@collabora.com>
 <196AEBB6-29A6-4F0F-917B-A042F422698C@collabora.com>
 <E0BC3E06-FF0E-4EAE-8B7D-FFC1630F537C@collabora.com>
 <aaW81JU7P82nXNbd@slm.duckdns.org>
Message-ID: <aaW-5vwuf97Cpt6r@google.com>
Subject: Re: [PATCH v2 0/4] rust: Add ARef support for work items
From: Alice Ryhl <aliceryhl@google.com>
To: Tejun Heo <tj@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
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
X-Rspamd-Queue-Id: 439D81DD2AB
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
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tj@kernel.org,m:daniel.almeida@collabora.com,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jiangshanlai@gmail.com,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[collabora.com,kernel.org,gmail.com,garyguo.net,protonmail.com,umich.edu,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 06:37:40AM -1000, Tejun Heo wrote:
> On Sat, Feb 28, 2026 at 02:35:05PM -0300, Daniel Almeida wrote:
> > Tejun,
> > 
> > AFAICT, there are no further comments on this series. Can I get your feedback here, please?
> 
> I don't know enough to have an opinion but if it looks alright from rust
> side, please go ahead.

Yes I think it looks alright. This just makes workqueue usable in more
situations.

Alice
