Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHYdBTkxd2lVdAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 10:17:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF8185EC3
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 10:17:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B904110E3C4;
	Mon, 26 Jan 2026 09:17:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="VZGPo5om";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com
 [209.85.218.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1EEB10E1AB
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 09:17:40 +0000 (UTC)
Received: by mail-ej1-f74.google.com with SMTP id
 a640c23a62f3a-b8d78d3fabfso59382766b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 01:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1769419059; x=1770023859;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=+2syxKrl42ps+aJbHDLMrcYcslmTz8dk/sCKctwr8MI=;
 b=VZGPo5omA3dnMhqTTZflEcr2MWcuV0ugTZ6BBcjQRs+ao0ocUHo0NI1cCq/RWzc9ez
 BX68qfhcx+HB5/ZpPYxXAszH7o0F3Lw5ZyDXv+r3KXQPmq0FJ2RlH8GJraeu6hZdUjgb
 0X/DidEzFK4oSdhO5cHhdffk3nFt4E9u64LoLn5E2uSsn8fRFb6Ru6kN9Ut1CWzzTqFE
 BBXwN32jQxTNiE5hArLaA7yK9kREmv/lGCdWjeMempGvgHNdgzW7uKaCFoe3kH7pCVFl
 nvQiqwh24XpuAKB9+280QYcFeqIGEqjEko1muyORJLXiPEevQm+4B6eeuKxw7bAbsD7J
 EMhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769419059; x=1770023859;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+2syxKrl42ps+aJbHDLMrcYcslmTz8dk/sCKctwr8MI=;
 b=pokIbvyfQbe8QATzLuclAIMxmc26KL8YPo3I6XzmyBO8oGojG3OeSA0tX3BHAXDRNG
 jRVqoYcrpsGQGVY4Gb2wWqmGC+8kGqx44QB9oJUQU5BTCPNNVsXSho/Imy0QVjxK74kf
 sdLgDSl1dI5H2DWaGe2HGZz4joIeu4+2sQ1bo5ju7IUkcPi++Q9+qjHoBX4CUdOwHu1h
 AkbHm1+ZqeS145z870NWfnWhMykcjv6fPDjzHWAs3xh1xVCJj9IJtZUFBuJpnXkDgNaW
 vwrJLDLmWd9z9DrK3gydeQj22z9qGGJd8KjiRkzYxCeQSrJbjLFPhuxqJLsoABcHJhRS
 G51Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwYY+NAC+Hbt0RB9w1sgq0vMnANSirhSM8loyDuTm/ICHjTooCGRpA6TkSv36Fnfkk0qwxZjpxgQw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzrin0U7iNju2mxoQYoPjfqg7yUAEKSEWfywLjGyKPe0ytLVIZT
 uUhh5nnJbfiWCB/Z7KwwVsLwP6pMYhUlJgtysxVryS0ef8Ud0jWPhM4KT1nrNedp3l4qEAuVNq5
 jtjuWbG1QrI8PMdlC4A==
X-Received: from ejbbs5.prod.google.com ([2002:a17:906:d1c5:b0:b88:347a:3051])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:d27:b0:b73:2b08:ac70 with SMTP id
 a640c23a62f3a-b8d2e8455d0mr256016966b.49.1769419059057; 
 Mon, 26 Jan 2026 01:17:39 -0800 (PST)
Date: Mon, 26 Jan 2026 09:17:37 +0000
In-Reply-To: <20260120181152.3640314-4-gary@kernel.org>
Mime-Version: 1.0
References: <20260120181152.3640314-1-gary@kernel.org>
 <20260120181152.3640314-4-gary@kernel.org>
Message-ID: <aXcxMShqvHzYMllD@google.com>
Subject: Re: [PATCH 4/4] gpu: tyr: remove redundant `.as_ref()` for `dev_*`
 print
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 "Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=" <kwilczynski@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
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
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gary@garyguo.net,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:bhelgaas@google.com,m:kwilczynski@kernel.org,m:daniel.almeida@collabora.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,gmail.com,protonmail.com,umich.edu,google.com,collabora.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
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
	RCPT_COUNT_TWELVE(0.00)[19];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 6CF8185EC3
X-Rspamd-Action: no action

On Tue, Jan 20, 2026 at 06:11:09PM +0000, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
> 
> This is now handled by the macro itself.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>

Acked-by: Alice Ryhl <aliceryhl@google.com>
