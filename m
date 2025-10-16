Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B594BE58D1
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 23:17:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA89E10EA85;
	Thu, 16 Oct 2025 21:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Xvlr9Iry";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8616610EA85
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 21:17:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9148464123;
 Thu, 16 Oct 2025 21:17:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB8CCC4CEF1;
 Thu, 16 Oct 2025 21:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760649436;
 bh=T1k1zbyAGxaJSzErLqwjixIBBEZ2/lxMQ2Fffak3Fak=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Xvlr9Iry/928SbHn9B86kgWNHIdrv6C4aS018CNw9wthF4EEx746YwXCWqAZbnGOP
 Q346XtBF5zL0nqoNm1Jspno6QdogKe9j+umOLOImYiv/e8mqr2fxy9IiKiMbNI/GsF
 tTnJH5bLeRC5sC0UBCm3l9TQmlqKG8hNqG/JZPdclcEZvAwNzBuzyUOI4DFy54Qnwv
 /kLwMDDAELOGBMdj8HpxBfgiXMs0Ouy5SdnnaFiacsCUJdE1HAY/3WT10mrhZ/MBsM
 xsj60ikZDZgptOxxMiqQAO941mT4W3y3D8qUryPemV7/Byb2wr5jRiNgn6+Ryds/Rf
 OMgPfXjuEJn6w==
Message-ID: <7b4d45a1-43c4-4ceb-8f37-8d37825290f5@kernel.org>
Date: Thu, 16 Oct 2025 23:17:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: drm/gem: Remove Object.dev
To: Lyude Paul <lyude@redhat.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Shankari Anand <shankari.ak0208@gmail.com>
References: <20251016202044.2748678-1-lyude@redhat.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20251016202044.2748678-1-lyude@redhat.com>
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

On 10/16/25 10:18 PM, Lyude Paul wrote:
> I noticed by chance that there's actually already a pointer to this in
> struct drm_gem_object. So, no use in carrying this around!
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Acked-by: Danilo Krummrich <dakr@kernel.org>
