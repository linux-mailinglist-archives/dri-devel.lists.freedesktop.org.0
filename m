Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E89CFB446
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 23:34:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0339D10E032;
	Tue,  6 Jan 2026 22:34:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bFKUynMi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEAC810E032
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 22:34:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 78A1E43E03;
 Tue,  6 Jan 2026 22:34:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3A05C116C6;
 Tue,  6 Jan 2026 22:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767738875;
 bh=MRuGwkFsKg8dk7GOnhw31S3ja+uGeCcZOiBYtiLF9xg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bFKUynMiU31p2BmkGdYQ93PDxhFR6Ru9HR1KNDfhNXW5SRiR11XZW8KHcPHRz/w8S
 tUhdIOXkovKHo/kf0N23yuHWOXW5Ty6yIV8k+J8ahWY4d1agjq+J0BXWjvT03R2pFh
 s9KRvYtDL2N7VDgNHrv3ZOL+a6+EbxTL5u40clTsm0o2f0lqsWz0DOUXFI/AxNIHIw
 LMVrfCNL/8M92sD/DaecZEFvj6THMVm9eZqSwtsRUh3nvWvFE8VYYkLf8ehR8mb/8M
 k0PkgkLf5IG/+ehbbo5KIK4IxZjmInYa1O+8U82hgCojcwBPd/thNkhkF6II1kJ0OT
 y7ID+LQZ2kc0w==
Message-ID: <f27a000d-70be-4b49-be2e-07921c1b6b0a@kernel.org>
Date: Tue, 6 Jan 2026 23:34:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rust: drm: Improve safety comment when using
 `Pin::into_inner_unchecked`
To: Ewan Chorynski <ewan.chorynski@ik.me>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251228-drm-gem-safety-comment-v2-1-99bb861c3371@ik.me>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20251228-drm-gem-safety-comment-v2-1-99bb861c3371@ik.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 12/28/25 5:15 PM, Ewan Chorynski wrote:
> The safety requirements for `Pin::into_inner_unchecked` state that the
> returned pointer must be treated as pinned until it is dropped. Such a
> guarantee is provided by the `ARef` type. This patch improves the safety
> comment to better reflect this.
> 
> Signed-off-by: Ewan Chorynski <ewan.chorynski@ik.me>
Applied to drm-rust-next, thanks!
