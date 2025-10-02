Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B80BB39A6
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 12:19:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B7510E185;
	Thu,  2 Oct 2025 10:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="S9sVOb1g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C7210E185;
 Thu,  2 Oct 2025 10:19:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 143F761F2A;
 Thu,  2 Oct 2025 10:19:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 325A9C113D0;
 Thu,  2 Oct 2025 10:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759400352;
 bh=8rL/NALBjM+GVqp22l3fuD7bZleKTn5sOgDb56/3Ie8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S9sVOb1gPa+y+KGXLdQxaQFX4jJcJvHGKhiqCpgfkeijjewF3DquZCU/8XWhzKa+b
 Vl2v9Z2OKngdjBMJKPsnOIRjHB8JsTaMZ5x74v9xaFvK1O6ujHQOW7kBI4dgwYOssL
 JBAuQYv34DmTEBM7LMfSEC1hDtXQCpx1n1kNKy12DpQQjP7/iq9KLss+jxvNhQiYbO
 XyL1tkYG1ki2ty2soUzsIVziqE2NpTdNXZSdAxkmWdGnH3jr6PwU76gFJpRhnHytah
 c7Jsz97ZdGbtvox9yCZDFcUHgliqHSOUYXgYML6JMMnyHNy7z9oNW29rF2TGlypDQf
 ELhqxL8n14FqA==
Date: Thu, 2 Oct 2025 12:19:07 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, 
 Zhenyu Wang <zhenyuw.linux@gmail.com>
Subject: Re: [PATCH v2] drm/i915/gvt: Propagate
 vfio_set_irqs_validate_and_prepare() error
Message-ID: <445lkq3jxokunozarhyxh6lxmj3ubk2py7ixldram6flbvvfsy@5pp2tnoat6dw>
References: <20251001142336.82089-1-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001142336.82089-1-andi.shyti@linux.intel.com>
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

Hi,

On Wed, Oct 01, 2025 at 04:23:36PM +0200, Andi Shyti wrote:
> Return the actual error code from vfio_set_irqs_validate_and_prepare()
> instead of always collapsing to -EINVAL. While the helper
> currently returns -EINVAL in most cases, passing through the real
> error code is more future-proof.
> 
> While at it, drop the stray 'intel:' prefix from the error
> message.
> 
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Reviewed-by: Zhenyu Wang <zhenyuw.linux@gmail.com>
> Link: https://lore.kernel.org/r/20250926000252.3681360-1-andi.shyti@kernel.org

merged to din.

Andi
