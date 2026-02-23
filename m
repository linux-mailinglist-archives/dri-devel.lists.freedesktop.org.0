Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHCkBjAgnGkZ/wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 10:38:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC1717407E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 10:38:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29DDB10E2C3;
	Mon, 23 Feb 2026 09:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="kVZuGB7D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5EC110E2C3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 09:38:51 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-48069a43217so34988385e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 01:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1771839530; x=1772444330;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=CEki8/3kEPkYK4GTCiTKeIkEztw6O4in5DWfsgS0OCc=;
 b=kVZuGB7DFrMYGq2Yw99+39eRkimoZu9W7wyX7clbebzNVcPJo2krkENNdCK4bpzmt6
 KflYooHTqsGrEouCcCMENSE88Xef0kfAXHHU6MpeRj5xShPr9nlPuW24nnbIw2HvGBDw
 HtC9yzYfy51Oy0yIJNbA37thOPGUDXEiCi3gCvhlK7a63cqTkTQga088/fFe4rvxE9Yk
 XRfqIMagiJCbonejFNFeV3mIjnooHj7phI5uyyQKlY9Cz2zO9UFSSBJQJby+QfkDFiol
 H8Up0k9ieo+Uqvjmx4P/JMVvBgzdGnsiBnQ3dv233UYFaiPP3jDJ2uviVxll/i5zmGot
 PfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771839530; x=1772444330;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CEki8/3kEPkYK4GTCiTKeIkEztw6O4in5DWfsgS0OCc=;
 b=tva07p8c8tRgL4K4rFJHeTGR8ye3zv3mljjJydNWnWArEbEmmk637WCN4+oZwrLAnB
 YiG6N0/iB1Wy0OGMyam1+NUelIruTkPHS/en9JbtL6T69BVQZiGZtJqm0a1t9oDOp9cz
 eoF9jO1OJK1zbK8xRL3kh49qQM3vZQJv4G9Bwpw2dk6Y9Ah4jX+6FlWHk4HMTHEGqAZ3
 EH2+WzeKPzauPw4l4bZ23npP0W0/bD8n+d8eCUDeqR4tP/4Z1cb4Sz+7q0tRHiNAKQR7
 KvLzSsTnfVRC7KKdMtFei552Nk/LH9SKkGNXenopE5lKWLJ197dReXPPZOJyEIdQNIID
 cVgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/3RavSk5t2tLAdPo0FOjsRy4Vtf77iwjzP5pvn7IypPTyIAKrrJCDej01aYvVAamg9YJjyL6DdhY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzu9EvLSBSyFfc9ndvL1kn/b88OIC08q1Fnclau1on4aCdD3dFY
 MQURDINKDiCC2hCTXYfgDOIkxtwTO12zjw3QZPgBJcocGZqVA/IznxK3PewjAkNrxBiiKoSOnNw
 W8lUnGvtWJxT4QTsVzA==
X-Received: from wmg8.prod.google.com ([2002:a05:600c:22c8:b0:47e:dc0c:276f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e8d:b0:47e:e779:36d with SMTP id
 5b1f17b1804b1-483a95f8bdfmr128430325e9.23.1771839530398; 
 Mon, 23 Feb 2026 01:38:50 -0800 (PST)
Date: Mon, 23 Feb 2026 09:38:49 +0000
In-Reply-To: <5523ddd6-fda1-445a-9235-54e778df2694@nvidia.com>
Mime-Version: 1.0
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com> <aZlz49VtPA0JbEGx@google.com>
 <5523ddd6-fda1-445a-9235-54e778df2694@nvidia.com>
Message-ID: <aZwgKcdEnSHyuSLG@google.com>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
From: Alice Ryhl <aliceryhl@google.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@redhat.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, Nikola Djukic <ndjukic@nvidia.com>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:acourbot@nvidia.com,m:airlied@redhat.com,m:daniel.almeida@collabora.com,m:koen.koning@linux.intel.com,m:nouveau@lists.freedesktop.org,m:rust-for-linux@vger.kernel.org,m:ndjukic@nvidia.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,umich.edu,nvidia.com,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
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
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7DC1717407E
X-Rspamd-Action: no action

On Sun, Feb 22, 2026 at 07:41:44PM -0500, Joel Fernandes wrote:
> Hi Alice,
> 
> On 2/21/2026 3:59 AM, Alice Ryhl wrote:
> > On Wed, Feb 18, 2026 at 03:55:03PM -0500, Joel Fernandes wrote:
> >> +impl CListHead {
> >> +    /// Create a `&CListHead` reference from a raw `list_head` pointer.
> >> +    ///
> >> +    /// # Safety
> >> +    ///
> >> +    /// - `ptr` must be a valid pointer to an allocated and initialized `list_head` structure.
> >> +    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
> >> +    /// - The list and all linked `list_head` nodes must not be modified by non-Rust code
> >> +    ///   for the lifetime `'a`.
> > 
> > I don't think C vs Rust is useful here. What you want is that the list
> > is not modified by random other code in ways you didn't expect. It
> > doesn't matter if it's C or Rust code that carries out the illegal
> > modification.
> 
> Yeah, this is true. I will change it to the following then:
> 
> "The list and all linked `list_head` nodes must not be modified from
> anywhere for the lifetime `'a`."

Ok. Perhaps you should say that it must not be modified except through
this CListHead? I guess it depends on whether you want to add methods
for changing the list via this API.

Alice
