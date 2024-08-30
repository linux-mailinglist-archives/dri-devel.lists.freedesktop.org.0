Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB48A966C4B
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2024 00:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C493F10EB02;
	Fri, 30 Aug 2024 22:26:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="plYfkSHS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FEA110EB02;
 Fri, 30 Aug 2024 22:26:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D6FD85C0FA5;
 Fri, 30 Aug 2024 22:26:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 089C2C4CEC2;
 Fri, 30 Aug 2024 22:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725056782;
 bh=sajjnYuYMwDyd+czAB4UYUbUROYfVhH/oX0xWtYzRyQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=plYfkSHSa1F+LS/F1fUv8vlmqKkU5tfFPA+o++khm52zWIblDJlzBXNixohkIpeX6
 DkDTpcMgQrX7YDjLdG1aTBABbGSo9gatUOGWOwygZZyDf2JmoRxolBcVR+eXt2Wkku
 pIypw6BwE14X3tvEjnfKcOpXhZhymWg9pFG9Wt/lhBgfuMyXE5U2HvZcKcRBcRlolj
 caEpULFVa6JT/Z03YxVVI58NPHNQh9HyBL2OoAivpnmQjmjqCEEDQYnC2PyALNIiu+
 JPkSTzfvYS4tDefzDAWOJ+vwjnF+hTl/7ri2dwF8PBnOoykgCJNuetLFZbMk0imYPZ
 SkRHDCYkzCG5w==
Date: Sat, 31 Aug 2024 00:26:17 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: kherbst@redhat.com, lyude@redhat.com, airlied@gmail.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next v2] drm/nouveau: Use for_each_child_of_node_scoped()
Message-ID: <ZtJHCUVFWkEkezRi@pollux.localdomain>
References: <20240830073654.3539640-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830073654.3539640-1-ruanjinjie@huawei.com>
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

On Fri, Aug 30, 2024 at 03:36:54PM +0800, Jinjie Ruan wrote:
> Avoids the need for manual cleanup of_node_put() in early exits
> from the loop.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Applied to drm-misc-next, thanks!
