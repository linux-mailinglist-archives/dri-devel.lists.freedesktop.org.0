Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA54409B50
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 19:55:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C936ECCD;
	Mon, 13 Sep 2021 17:55:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 037C76E216;
 Mon, 13 Sep 2021 17:55:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A1F0360E97;
 Mon, 13 Sep 2021 17:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631555750;
 bh=9hCsDfa152YCgrx2lvwHetmU1uS6j7bALqOO6SjfsBo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kCzjSSdCZH9GmfVIx8YGg35ecGbRj3kGBdijAGtlqO4WEMWosxchtOBbWUhJmwpON
 K7EzWyw9tObM0NefsDXNfHs2mxJK2wX64M/hPyNxVCNGVD8smZG58IyQyJmn4x96qd
 ByzHGLy7UtvE/gMluPvdMqS+E/mz0lyOIoDq7manEo0IFLzJH8q+/QxjdwWOHI/yVY
 KQDTwQcTLPORF+OaSc8OIczMKQSu+C3xASC24gWQ8Uq8UzAFsplvWgiLYlS2MtP9SJ
 6srSvyePYxQ9pn8Uewqrr/utN6RCvCZmopoWSVSTDMWODkEIAvnTSVdPGn0VVD3m8n
 gePHJqb3mmCFw==
Date: Mon, 13 Sep 2021 10:55:36 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 llvm@lists.linux.dev
Subject: Re: [PATCH 0/3] drm/i915: Enable -Wsometimes-uninitialized
Message-ID: <YT+QmKyKCdotTcqA@archlinux-ax161>
References: <20210824225427.2065517-1-nathan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210824225427.2065517-1-nathan@kernel.org>
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

On Tue, Aug 24, 2021 at 03:54:24PM -0700, Nathan Chancellor wrote:
> Commit 46e2068081e9 ("drm/i915: Disable some extra clang warnings")
> disabled -Wsometimes-uninitialized as noisy but there have been a few
> fixes to clang that make the false positive rate fairly low so it should
> be enabled to help catch obvious mistakes. The first two patches fix
> revent instances of this warning then enables it for i915 like the rest
> of the tree.
> 
> Cheers,
> Nathan
> 
> Nathan Chancellor (3):
>   drm/i915/selftests: Do not use import_obj uninitialized
>   drm/i915/selftests: Always initialize err in
>     igt_dmabuf_import_same_driver_lmem()
>   drm/i915: Enable -Wsometimes-uninitialized
> 
>  drivers/gpu/drm/i915/Makefile                        | 1 -
>  drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c | 7 ++++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> 
> base-commit: fb43ebc83e069625cfeeb2490efc3ffa0013bfa4
> -- 
> 2.33.0
> 
> 

Ping, could this be picked up for an -rc as these are very clearly bugs?

Cheers,
Nathan
