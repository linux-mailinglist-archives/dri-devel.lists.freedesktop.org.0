Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE94AE732A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 01:30:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E64E210E63F;
	Tue, 24 Jun 2025 23:29:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RJcj2i3p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2158A10E63F;
 Tue, 24 Jun 2025 23:29:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C35AC61142;
 Tue, 24 Jun 2025 23:29:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EFAEC4CEE3;
 Tue, 24 Jun 2025 23:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750807785;
 bh=NfYA8jRdTajQS7satSsbxwtds13FUUPZsupu+wwSFf4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RJcj2i3pPy8XCRhJYYARpq1OOo34iXYJDfSh3UVF59+xdz5XfAI2Y88/Re9jkK/Kj
 LGfZehg0lI8Kf0M23lIpOQe/PUbbLaDJR85lJ524Ghr5wacR1D002QZcJaT95Q0n55
 8FzUJDv/TLmcEuv0q1jsIfCz4P2viytNq7CqidhLZ/Rl8yaoK1dQJsw4Uyp0xkmA+n
 FyUXKC9gJ7cmAY2eCkwPHTaEzA4OO3RDKYGeLncD4ByWD/yY7I/dDZ0RuQwCqdRMxD
 dozwMRTPmPMIalWSWcRGfSY6hnUrIe4zz9JqqHsAzsifDI774VyuhKCI8EwT8wjmIE
 gICRu6HiqpohA==
Date: Wed, 25 Jun 2025 01:29:41 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH 1/2] gpu: nova-core: impl From for u32 for enums used
 from register!
Message-ID: <aFs05TSWlDnhBUox@pollux>
References: <20250624132337.2242-1-dakr@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624132337.2242-1-dakr@kernel.org>
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

On Tue, Jun 24, 2025 at 03:23:22PM +0200, Danilo Krummrich wrote:
> Implement From for u32 for all enum types used within the register!()
> macro.
> 
> This avoids a conflict with [1] as reported in [2].
> 
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Link: https://lore.kernel.org/r/20250615-ptr-as-ptr-v12-5-f43b024581e8@gmail.com [1]
> Link: https://lore.kernel.org/all/20250624173114.3be38990@canb.auug.org.au/ [2]
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Applied to nova-next, thanks!
