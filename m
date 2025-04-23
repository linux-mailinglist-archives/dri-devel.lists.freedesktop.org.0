Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A1DA9911D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 17:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C8E10E6E5;
	Wed, 23 Apr 2025 15:27:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dLMyk4ov";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF0D10E6DF;
 Wed, 23 Apr 2025 15:27:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 128C561569;
 Wed, 23 Apr 2025 15:26:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16321C4CEE2;
 Wed, 23 Apr 2025 15:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745422019;
 bh=lO+TrxuIb8Dy0/8E6PYSbjeBwOYaCJV2GGaMPYsU5oQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dLMyk4ovvXWER9mNZf1ieA699sUZI46fWIpuZWmWqPqsziinmCqndo9+MDQTGY2My
 gvJ2bvC48nSVr3Nu85zh7Z3vkYUXffDWlHqDB8WoK8nXy6KuDkwQVmjKW0FobAFmQO
 tHpZExpdlztQ07oXgeabM1VMf1LpYXvTlVA+8O4bNzw9aS2tX88CHJnKHzLdltZdUX
 ie/F6ljsTbByRMzy1t0EEW0M8VeoSt/DYKYLgBuO4sN+dLiVTn1+8bGlxA0gFByp0i
 xYljWJfIzHopoUojhfy/L+/d/Tt/o5UPqdn14N8LxB3TxcFwmpBdxJwKR2kWc4lB7y
 hHjGh/minC5uw==
Date: Wed, 23 Apr 2025 17:26:54 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sabrina Dubroca <sd@queasysnail.net>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 2/2] drm/nouveau: nouveau_fence: Standardize list
 iterations
Message-ID: <aAkGvpIL7KiRH-iO@pollux>
References: <20250415121900.55719-2-phasta@kernel.org>
 <20250415121900.55719-4-phasta@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415121900.55719-4-phasta@kernel.org>
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

On Tue, Apr 15, 2025 at 02:19:01PM +0200, Philipp Stanner wrote:
> nouveau_fence.c iterates over lists in a non-canonical way. Since the
> operations done are just basic for-each-loops, they should be written in
> the standard form.
> 
> Use for_each_safe() instead of the custom loop iterations.

Please use list_for_each_entry_safe() instead.

You only need resend this patch, I will pick patch 1 for -fixes; this one goes
into -next.

- Danilo
