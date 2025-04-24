Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6833A9AFF5
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 15:59:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D1FB10E830;
	Thu, 24 Apr 2025 13:59:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="C/xsMUwl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A07210E82B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 13:59:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 28058A49C51;
 Thu, 24 Apr 2025 13:53:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 175A3C4CEE3;
 Thu, 24 Apr 2025 13:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745503160;
 bh=AhueexCdZ3Pnze7a50gF2kNn9MUioyCZjLhbZqAGLEI=;
 h=Date:Subject:Cc:References:From:In-Reply-To:From;
 b=C/xsMUwlJPq8xM76WrJpbBduJIdrXNtcyvGMe4Rcpz9UrmMM0hKlYdGXOAoozWpBk
 gqxmgy8nF40dtloMQQtjDQuMv3Rk6e+TlUylIWwMnq8+HP4iHLCsRffntZuT/YtPW/
 /lL9E8Kym15UcgbceYFMpPn2ui0XsSzjFfI4GkEZtTvHOcpzHhpRyQ1j6R060wwPgO
 moOGnHGDxtIvOQASzAO1XdD6og8ZagXc5QkXVqmtFz43wOXtH7OAGzHldJwBF10j6u
 aT5x6qOZqZJyHjtuKi1in/TedaigGpm0qMR2hBiCFlvMACoKoT8T6G2tZMgk54GZaR
 k7IknCfeCAxPA==
Message-ID: <21445861-fcf1-4ae3-8c18-d3842712bb5f@kernel.org>
Date: Thu, 24 Apr 2025 15:59:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] DRM Rust abstractions
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, lyude@redhat.com,
 lina@asahilina.net, daniel.almeida@collabora.com, j@jannau.net,
 alyssa@rosenzweig.io, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
References: <20250410235546.43736-1-dakr@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250410235546.43736-1-dakr@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 4/11/25 1:55 AM, Danilo Krummrich wrote:
> This is the series for the initial DRM Rust abstractions, including DRM device /
> driver, IOCTL, File and GEM object abstractions.

With the changes requested by Alyssa and Lyude, applied to nova-next, thanks!
