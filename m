Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4229CB49948
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 21:03:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A27FF10E1BF;
	Mon,  8 Sep 2025 19:03:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nIbjSsh1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A482D10E1BF
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 19:03:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 398C441A13;
 Mon,  8 Sep 2025 19:03:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57E15C4CEF1;
 Mon,  8 Sep 2025 19:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757358223;
 bh=FAKaccstvO4Vvs2o0rl2VzV7mpvYttZ5v4enPtxe8eM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nIbjSsh1AZogOlomA5Ho4DXssuONsk01mhVPUx8RidoVnlVllvVP4i655aqK4OYUx
 cLwYUzu5AlQFmYLH/5/kzupZ8BgPhfs778o9xlCdHrxg1A8RieJ41pWeqVPfVb5Zoz
 azhz0be/EgzFUumjx1qdxOhBxGkpLzaTJXJE6Vb6N8DY6LNU0QJovQ1nSVKwlAIhu5
 uwEPU1ZbRq6czffbNBC8xLqhl28TRX1WCgvvvye//6wwQTcBvpxguOuyybdy3kty0W
 JQHodHuiPcyvllIfU7Et2T4qmrsoidnkmDXeaxINT2CihhhN3bt441DkYpda6kk3ET
 mOSh0pK2ee7WA==
Message-ID: <3c071f0c-2657-48d6-b2e3-59fec51c1804@kernel.org>
Date: Mon, 8 Sep 2025 21:03:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] rust: drm: gem: Add DriverFile type alias
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Asahi Lina <lina+kernel@asahilina.net>
References: <20250908185239.135849-1-lyude@redhat.com>
 <20250908185239.135849-3-lyude@redhat.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250908185239.135849-3-lyude@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 9/8/25 8:46 PM, Lyude Paul wrote:
> Just to reduce the clutter with the File<…> types in gem.rs.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

Acked-by: Danilo Krummrich <dakr@kernel.org>
