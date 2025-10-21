Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90631BF6E39
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 15:51:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11ADD10E2AC;
	Tue, 21 Oct 2025 13:51:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sazqVkl6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E44A10E2AC;
 Tue, 21 Oct 2025 13:51:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 513146041E;
 Tue, 21 Oct 2025 13:51:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECC4BC4CEF5;
 Tue, 21 Oct 2025 13:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761054700;
 bh=VAVJx92B0MVr7C4HDSOeGAhnQWMNJKXn0oReX7qLlKs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=sazqVkl6KgZMlHA+dxA6cCiSLmrM3ORYcfOKEDvhQ826alKSQLwKb+sxVafJDJeQI
 Kkh9YC+rPDX04fbGm1ferSimYJaLtLsrcIFS178gBOVWzLV4sscVTlTDAI6GGNW8ee
 tDPyw/zct7dDTJnIfDo7tj/zmbfNXdbasiNYOjcWRkmgwTZgB2tck6EPzq2TR5Wx72
 z68CZJwSMWc87jq7avaG5wB4NmBI69LLbxYbFY3u+GWDoEVW9WUuaIpQBRXeUwKVhD
 Gt0eVi5gx06Y2jbWXVFZqP/uvt9O9NIGETHQ4bOVncCcJhDhlLAQzfwI+Q6KeU3HqM
 gsR2pUO4AoZnw==
Message-ID: <899a0069-864a-454d-a7f8-333cc835cf23@kernel.org>
Date: Tue, 21 Oct 2025 15:51:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7.1 0/4] bitfield initial refactor within nova-core
 (RESEND)
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org
References: <20251016151323.1201196-1-joelagnelf@nvidia.com>
 <DDLHP1ABV9BA.3V0NXW3RWHGL6@nvidia.com>
 <059912ef-6023-4af4-a8df-f4b34fe98e71@kernel.org>
 <DDO1O4XLJVHR.1642YK4GK85CT@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <DDO1O4XLJVHR.1642YK4GK85CT@nvidia.com>
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

On 10/21/25 3:46 PM, Alexandre Courbot wrote:
> ... and as dim was pushing, I noticed I forgot to add your Acked-by. >_<
> Apologies for that.

No worries at all, it happens. :)
