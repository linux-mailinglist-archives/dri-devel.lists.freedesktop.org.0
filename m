Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uA5zDHBJdWm8DQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 23:36:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0AD7F228
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 23:36:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1CA10E0F0;
	Sat, 24 Jan 2026 22:36:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Tts8IKtG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3709A10E0F0
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 22:36:26 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-435a517be33so2006923f8f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 14:36:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769294184; cv=none;
 d=google.com; s=arc-20240605;
 b=D8NbThYiM1EBJWiwvu3Wo0BuehlfTmHftXXLnwG+MZ8LQp996SxRavjnJxnOne8h2Z
 0barW3x8DbjPXkZv70+2yATO72Gb9RTQN377I8RpMiDU6F3kCxwANkWVhwxexsVaiytL
 PwLcaTXrqwlVNxdpFxoP6VCUBHysLLj077IrDTrqPNBZWGCJUnpO+rLxblfYKOyIOtyk
 JKI36M5D9yfiWLZi5+77wnLjQj8sv8i3PzagruwcM1vr+FTQX84wFeYe/XrwpKKtfgff
 XsXSEpVarqSu36RCoOTWDNsjKh4JDQViCi7waluGzEkCKCI69UQEdti7oK/SkiOfAlR9
 zCuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=8GmRSJGgMQjWndTIp/YQNxJh3VQ1FIOSVbF43GphX20=;
 fh=cJSGUYO4i1vsuThOc9EMRvLRoJ7O7eSasXPBcI91WeA=;
 b=gtvNfdU1/0cSftUW4PXkTl2+RuaRMC7wEqUqXKOu7oxGA3v6g9VB1JEn3YTwX1s8S6
 6f5mCpTyqotfbFnqIZokkhJBw8WbkNj1AUvUVm+mbnpx1XEYFqr3R9znVLn8K4bpZyFl
 4opMa0WNLoJCRUTgdz/f2yrKDUes21jubE0qSCq4whvY0hiCtzw8g1imObiiSfGAjVxO
 lpB03DRExw9qMVBqsWGttikmgXS33dIVql8CEE+F8bn1G431nxZvTUcsYGEzSInBooGv
 wjsO1zMBQvNS9knklqcOXjBrYkeOkI7VCQL1VbJa7iICPtM/2FGH1fJNsEFU8isdxn2U
 HCnw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1769294184; x=1769898984;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8GmRSJGgMQjWndTIp/YQNxJh3VQ1FIOSVbF43GphX20=;
 b=Tts8IKtGlu4BKVREVOcHHz1++jKhduwkAB+SNL70oXURiuhupv3V2x4Od71yXm/N02
 rR9YZEJ2ICkw0TazwMr9R4+BlAJNWzAnX42puqeg7DNTxPMAnBwtWyCYOmIe4aIrDGqS
 VPSMPfKuNNk/3dFzmFcssiA0Uzhq2hGV8Nyuh0bTdh/GFghUeKg2sPWVVKPRyWYli0ok
 7dOr8I+JAM1dD3lO9fHkU3i9BEiy+cMzHga+T+pSeOqBOLUAlMGfzFeD5Ean28hNN0Kx
 gqG5jy/AaAdOB4noBYVLH7rWsLNoiVdTeYVn6j5HOZyhJkBwWPwchRhNG2WY5O1vmQwu
 QtVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769294184; x=1769898984;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8GmRSJGgMQjWndTIp/YQNxJh3VQ1FIOSVbF43GphX20=;
 b=BY2K+RJSZWum7AFoDJgkCaO0UPQJnUXinyOW4FxENjqXsFeDmjFwRF1xJi81VHQx3w
 QMvsaIUyfQwPOMxoUdxY965985Upe1jbs/LCBArgGfrBh8XRHqmBfsOqXegaqD1cAl6F
 1EWRFxkHETJQK+7b0lg9v0RvhkU8vYgeh3XyxHepXXjMZC00q7sfiI4Wb/opmLtqS7R7
 WS6FjjY49HVyJGk4PT6XpbwalesS0jUum+O4qyudaZtDeDu8W+oBl7TcnTtR6bEfIdDa
 9ModHeLM2H5Xxr4GfBfFXn3BZ6rApKvu/yWx0y4zDi5UKJVg5C2Wpn+Q4yz3btu4dZ8r
 CygA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6qXYQsxP4tl/fiQmroZEpaX4Y6T7cFFWpRBluK1FSiXYGk3ipaqpne6Ob6VXxtK3LDslL1cJ5qJo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzavUZur2oXlsurf6CoVAqjRjFuxipazzo01MhRu7MbMtIohkz5
 mr2Nn+Rbxw6SYLwq/4JWan13ymvd43POsH7TgGDpEpclV7EzHyzqvQ2nyTFVfqgd4iPSidhXOcB
 VY57OEFrIfWgw/kCsjf9JgBviCjWsiz9r5tFM7cpo
X-Gm-Gg: AZuq6aLy+B1wa0CUNWfsFKvKwfIV9b3Iwnc9rGH35EGy5HKuMAYSkUX19Xgju8jcX+2
 CPRO+zsUX6YZl7N5RYmu+YrCKikIt0VSzKgGLJIdPcchruZ2Lk+VtX955mRKdteE4vPdXK5O3Rn
 brM763E2NjL9oQHIPR/SzHNanZFgBCXBhcqjfD7qNylLLVJ63WBxfHcMcbravGfhecVN5joqFKg
 DJo3TSrDb1+/y4d34Fw8gbIxbDnzmztnheyYtcI+2tIDOi8O55GCHBbcgOfitPuvBOlvPDnV8z+
 au8jiuik8MyDexyJjoRSA1YbdQ==
X-Received: by 2002:a05:6000:2285:b0:435:9abb:2e16 with SMTP id
 ffacd0b85a97d-435ca198a84mr6427f8f.45.1769294184410; Sat, 24 Jan 2026
 14:36:24 -0800 (PST)
MIME-Version: 1.0
References: <20260124160948.67508-1-ojeda@kernel.org>
In-Reply-To: <20260124160948.67508-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 24 Jan 2026 23:36:12 +0100
X-Gm-Features: AZwV_Qg9RXX0-BW1n_ujo5ycjvRSxyutcP-OISjietqPr7ZWjFo28f7XnyPFETc
Message-ID: <CAH5fLggeH68Z+C2XFf4ONzRBu9HYcvJptz3UM1zUKd90v1g1cg@mail.gmail.com>
Subject: Re: [PATCH] drm/tyr: depend on `COMMON_CLK` to fix build error
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, stable@vger.kernel.org
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:daniel.almeida@collabora.com,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:rust-for-linux@vger.kernel.org,m:stable@vger.kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[collabora.com,lists.freedesktop.org,gmail.com,garyguo.net,protonmail.com,kernel.org,umich.edu,vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 3B0AD7F228
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 5:13=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Tyr needs `CONFIG_COMMON_CLK` to build:
>
>     error[E0432]: unresolved import `kernel::clk::Clk`
>      --> drivers/gpu/drm/tyr/driver.rs:3:5
>       |
>     3 | use kernel::clk::Clk;
>       |     ^^^^^^^^^^^^^^^^ no `Clk` in `clk`
>
>     error[E0432]: unresolved import `kernel::clk::OptionalClk`
>      --> drivers/gpu/drm/tyr/driver.rs:4:5
>       |
>     4 | use kernel::clk::OptionalClk;
>       |     ^^^^^^^^^^^^^^^^^^^^^^^^ no `OptionalClk` in `clk`
>
> Thus add the dependency to fix it.
>
> Fixes: cf4fd52e3236 ("rust: drm: Introduce the Tyr driver for Arm Mali GP=
Us")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Thanks Miguel. Since the drm fixes PR for this week was already sent I
think we can just include this in drm-rust-next.

Though, if you plan a fixes PR for this cycle, you're also welcome to
include this patch with my ack.
Acked-by: Alice Ryhl <aliceryhl@google.com>

Alice
