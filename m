Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D09CB5185D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 15:53:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC5A10E2E5;
	Wed, 10 Sep 2025 13:53:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bbYrAEvS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAFEA10E2E5
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 13:53:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5F6A043B3B;
 Wed, 10 Sep 2025 13:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DCACC4CEEB;
 Wed, 10 Sep 2025 13:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757512411;
 bh=9ke4RrSIze2nfrnwh2g+ZMDil3Xou6kBgB9H2VhelPQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bbYrAEvSMpLecMTkG+ID9OmGqqyG0zsbHr3mxiJVAc6Qxg/aR/gKiU0RwdGMZAGB6
 BU2B82UIzOZERSAuLvA30QaFLS/Qv2u1ZICvU7YE/k5ZFzru55Dd9kDjTo3WJY9j9v
 Xkm5O8LUf3+fuVqdMLqlIcmDitTowO9qwTU1lDI10H3Qj9O93wNDgzw2dTppp0ZG6t
 1hqa2kxlnSmdklWo5W2aGEKC0zche3y0cpricNCQpUSBohFo4BsYr2XqDzBHMI/2eE
 SlyZiklPSjZfNZgDlBeJLzg137cwEfZORnkwi0liXqZVjn6lEJpVG1DiezdxqkJdKH
 lawHfwcum7rGA==
Message-ID: <835fec95-b36c-4b3e-b25c-926b091fd571@kernel.org>
Date: Wed, 10 Sep 2025 15:53:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: drm-misc: fix X: entries for nova/nouveau
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: acourbot@nvidia.com, dri-devel@lists.freedesktop.org
References: <20250902190247.435340-1-dakr@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250902190247.435340-1-dakr@kernel.org>
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

On 9/2/25 9:02 PM, Danilo Krummrich wrote:
> Nouveau patches usually flow through the drm-misc tree, while nova (and
> nova-core) are maintained through a dedicated driver tree and soon
> through drm-rust.
> 
> Hence, fix up the corresponding X: entries to list nova instead of
> nouveau.
> 
> Reported-by: Maxime Ripard <mripard@kernel.org>
> Closes: https://lore.kernel.org/dri-devel/enuksb2qk5wyrilz3l2vnog45lghgmplrav5to6pd5k5owi36h@pxdq6y5dpgpt/
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Applied to drm-misc-fixes, thanks!
