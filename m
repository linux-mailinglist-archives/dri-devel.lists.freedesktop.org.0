Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3085FA991C2
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 17:35:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A6510E6E7;
	Wed, 23 Apr 2025 15:35:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hooqSaCw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB3C010E6E7;
 Wed, 23 Apr 2025 15:35:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 20C9844C76;
 Wed, 23 Apr 2025 15:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD814C4CEE3;
 Wed, 23 Apr 2025 15:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745422521;
 bh=//m8VnyHey5kZRFQFNZt9DP8+X2ITGVIWL9+APTAHNU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hooqSaCw0kWAuhSqnJSDCEvzqQ60ibLr8/gaspSWdPYbFHALwCx9EVFOsYVkaqhTw
 CW6F6M9Mr4Sm2qdxM9J5Ct0tQmkzRZasatLvc7wYhiTymVgbpZVuZ6nKmZOYaXyCWl
 nrM6H3TZOplq03906zpjZ8tIUKA0ROZ1L6OW9Bw43n/S4dr/uUyOG9Ttlbsu7IZjDU
 zF/A7r20qxNmQL7jkNpnr/IMITb7VMI3kzzNm9R2TknJW375c5Xm/kGDkaoZ9TOy3S
 +IT4NdJdT1NVlWnWevKdcR2Znh3cpMhOfsSOR4ESrsFjsdtjMm/zWLkCs8wHtGm0Py
 7M+GP1DXPuZ7A==
Date: Wed, 23 Apr 2025 17:35:17 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] drm/nouveau: outp: Use __member_size() helper
Message-ID: <aAkItcD5VuDg1Qt-@pollux>
References: <aAe5o_-f5OYSTXjZ@kspp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAe5o_-f5OYSTXjZ@kspp>
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

On Tue, Apr 22, 2025 at 09:45:39AM -0600, Gustavo A. R. Silva wrote:
> Use __member_size() to get the size of the flex-array member at compile
> time, instead of the convoluted expression `__struct_size(p) - sizeof(*p)`
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Applied to drm-misc-next, thanks!
