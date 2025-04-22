Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8858BA9718B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 17:49:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2316C10E29D;
	Tue, 22 Apr 2025 15:49:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mgvmWMH+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E94310E5D6;
 Tue, 22 Apr 2025 15:49:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 859654A007;
 Tue, 22 Apr 2025 15:49:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3EA3C4CEE9;
 Tue, 22 Apr 2025 15:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745336965;
 bh=F8r3LMqn4Bi/IWC6gn/fsQt778NPJ8n3QrgvX+Iq9C0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mgvmWMH+IDP1nMUfhkQDwf7RRMKP0kemox5om1901k7NzTYJ3JBXH3EpnFSFRG3d9
 x8+cLHcG1hJxPPSS9o/jrePHanM18OqeKp1fvc8O5cNGjn9HsmEkyZ//1IVe2dg1bd
 /kwNRDq+np5LP1U9NR/EWkNJtpfiMtxwfWxUoOv/gS+B29sxFcW3PWbmeTciiuSxr4
 DXlVnx/18NDQadYi5A+Qt7TaDvLyNRPNpQo3toqGG9p7uQCa/I6H+tv7RDNu2U0+sl
 dVwF/892EzGUuZkAG5hALymoMku2+CvTSYmVVEtBYS5GMTZxlhxQOSWHMmzTq5TwO+
 GrmLtL5uVYsLQ==
Date: Tue, 22 Apr 2025 08:49:23 -0700
From: Kees Cook <kees@kernel.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] drm/nouveau: disp: Use __member_size() helper
Message-ID: <202504220849.A8A9B1D31@keescook>
References: <aAe5eNDnRyGnxLMX@kspp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAe5eNDnRyGnxLMX@kspp>
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

On Tue, Apr 22, 2025 at 09:44:56AM -0600, Gustavo A. R. Silva wrote:
> Use __member_size() to get the size of the flex-array member at compile
> time, instead of the convoluted expression `__struct_size(p) - sizeof(*p)`
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook
