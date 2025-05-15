Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 495BBAB8F8A
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 20:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5CF10E0D8;
	Thu, 15 May 2025 18:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Nocwxb2M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA5810E0D8
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 18:58:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9A72CA4C5F0;
 Thu, 15 May 2025 18:58:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 959B1C4CEE7;
 Thu, 15 May 2025 18:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747335509;
 bh=l6sKHpMPEkK6sz7MYnYBtzjiqBwRtoy4aLuxM1q3YWw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Nocwxb2MSAIfdBubu58MKI0xdZmijk7q2xQvUH2CMXrEmAbxBXFRl76jkKyTFFc99
 Iy7tpPjQfrxFY+2SXheah1nI94sypCF6/pNGc9B4Pk1bqOeWYk/5nOchV+JkmXqVD2
 G6d3+7ylq12ry1BrFalYDaaFN9BD5PBEDfAoQtQReSJ82xC4SAjT/FKShiUI0kNSmD
 3enP25jk3tDJEBi+tukoy1Lfpk6UfymB/aE9Oo4+VFskIPyXlrMpU7cgAZ++8a8sDk
 zKVvTF8qRtGCuTsDgPtqo9BFPrdoS45QGsMbIcYD8ImLGIdogYG+lmCqP4O/XmOL0H
 ZJ3ewPUh54jLw==
Date: Thu, 15 May 2025 20:58:23 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Subject: Re: [PATCH 0/4] drm: Rust GEM bindings cleanup
Message-ID: <aCY5T0B4GHAo6WK5@pollux>
References: <20250501183717.2058109-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501183717.2058109-1-lyude@redhat.com>
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

On Thu, May 01, 2025 at 02:33:15PM -0400, Lyude Paul wrote:
> Just some patches to fix a handful of minor issues, some of which were already
> mentioned on the mailing list. Some of these patches also make it just a
> little bit easier to add the shmem bindings from Asahi in the future.

Applied to nova-next, thanks!
